Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j1sm16184289wrq.90.2021.04.08.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:00:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D137D1FF7E;
	Thu,  8 Apr 2021 10:00:16 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
 <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 1921948@bugs.launchpad.net
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Thu, 08 Apr 2021 09:36:17 +0100
In-reply-to: <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
Message-ID: <87y2dttalb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jDPQrH5C9hod


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/7/21 11:39 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> We were incorrectly assuming that only the first byte of an MTE access
>>> is checked against the tags.  But per the ARM, unaligned accesses are
>>> pre-decomposed into single-byte accesses.  So by the time we reach the
>>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>>
>>> Therefore, the first failure is always either the first byte of the
>>> access, or the first byte of the granule.
>>>
<snip>

I replicated the original test case as a kunit test:

  static void kmalloc_node_oob_span_right(struct kunit *test)
  {
          char *ptr;
          size_t size =3D 128;

          ptr =3D kmalloc_node(size, GFP_KERNEL, 0);
          KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);

          KUNIT_EXPECT_KASAN_FAIL(test, *(volatile unsigned long *)(ptr + 1=
24) =3D 0);
          kfree(ptr);
  }

which before this fix triggered:

  [    6.753429]     # kmalloc_node_oob_span_right: EXPECTATION FAILED at l=
ib/test_kasan.c:163
  [    6.753429]     Expected ({ do { extern void __compiletime_assert_337(=
void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ON=
CE()."))); if (!((sizeof(
  fail_data.report_expected) =3D=3D sizeof(char) || sizeof(fail_data.report=
_expected) =3D=3D sizeof(short) || sizeof(fail_data.report_expected) =3D=3D=
 sizeof(int) || sizeof(fail_data.repo
  rt_expected) =3D=3D sizeof(long)) || sizeof(fail_data.report_expected) =
=3D=3D sizeof(long long))) __compiletime_assert_337(); } while (0); (*(cons=
t volatile typeof( _Generic((fail_d
  ata.report_expected), char: (char)0, unsigned char: (unsigned char)0, sig=
ned char: (signed char)0, unsigned short: (unsigned short)0, signed short: =
(signed short)0, unsigned
   int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigne=
d long)0, signed long: (signed long)0, unsigned long long: (unsigned long l=
ong)0, signed long long:
  (signed long long)0, default: (fail_data.report_expected))) *
  [    6.759388]     not ok 4 - kmalloc_node_oob_span_right

And is OK by the end of the series:

  [    6.587381] The buggy address belongs to the object at ffff000003325800
  [    6.587381]  which belongs to the cache kmalloc-128 of size 128
  [    6.588372] The buggy address is located 0 bytes to the right of
  [    6.588372]  128-byte region [ffff000003325800, ffff000003325880)
  [    6.589354] The buggy address belongs to the page:
  [    6.589948] page:(____ptrval____) refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0 pfn:0x43325
  [    6.590911] flags: 0x3fffc0000000200(slab)
  [    6.591648] raw: 03fffc0000000200 dead000000000100 dead000000000122 fd=
ff000002401200
  [    6.592346] raw: 0000000000000000 0000000080100010 00000001ffffffff 00=
00000000000000
  [    6.593007] page dumped because: kasan: bad access detected
  [    6.593532]
  [    6.593775] Memory state around the buggy address:
  [    6.594360]  ffff000003325600: f3 f3 f3 f3 f3 f3 f3 f3 fe fe fe fe fe =
fe fe fe
  [    6.594991]  ffff000003325700: fd fd fd fd fd fd fd fd fe fe fe fe fe =
fe fe fe
  [    6.595594] >ffff000003325800: f8 f8 f8 f8 f8 f8 f8 f8 fe fe fe fe fe =
fe fe fe
  [    6.596180]                                            ^
  [    6.596714]  ffff000003325900: f7 f7 f7 f7 fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597309]  ffff000003325a00: f4 f4 fe fe fe fe fe fe fe fe fe fe fe =
fe fe fe
  [    6.597925] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [    6.598513] Disabling lock debugging due to kernel taint
  [    6.600353]     ok 1 - kmalloc_node_oob_span_right
  [    6.600554] ok 1 - kasan

But it still fails this patch until:

 target/arm: Fix unaligned checks for mte_check1, mte_probe1

So I guess that is the one that should have the buglink.

Anyway code wise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
