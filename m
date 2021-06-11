Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m6sm9243259wrw.9.2021.06.11.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:03:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2E5CB1FF7E;
	Fri, 11 Jun 2021 18:03:06 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
 <87im2liz4x.fsf@linaro.org>
 <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Fri, 11 Jun 2021 18:01:34 +0100
In-reply-to: <CAFEAcA9NYv1GdA+2P_7hbqgBwRTv6JFgfp1mS_PzURY-aafkeA@mail.gmail.com>
Message-ID: <87y2bggwqd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IGS8bRFHDHHa


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Jun 2021 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > I'm told that the Arm C compiler C library always assumes that
>> > the "stack base" value is what it should set SP to, so reporting 0
>> > for that will break binaries that were built with it.
>> >
>> > As the TODO comment notes, the "heap base" is a bit of a guess,
>> > but putting stackbase at top-of-RAM seems generally sensible.
>> >
>> > What bug are we trying to fix here?
>>
>> Having newlib use a value that's wrong and therefor plant it's heap in
>> the middle of the loaded code.
>>
>> > I think one possible implementation that might not be too
>> > hard to make work would be:
>> >
>> >  (1) find the guest physical address of the main machine
>> >      RAM (machine->ram). You can do this with flatview_for_each_range()
>> >      similar to what rom_ptr_for_as() does. (It might be mapped
>> >      more than once, we could just pick the first one.)
>>
>> Currently this is done by common_semi_find_region_base which pokes
>> around get_system_memory()->subregions to find a region containing an
>> initialised register pointer.
>
> Yes. I am suggesting we throw that code away, since (a) assuming
> any register happens to point in to the main RAM is dubious and
> (b) iterating through the subregions of get_system_memory() is
> not guaranteed to work either (consider the case where the system
> memory is inside a container MR rather than a direct child of the
> system memory MR).
>
>> >  (2) find the largest contiguous extent of that RAM which
>> >      is not covered by a ROM blob, by iterating through the
>> >      ROM blob data. (This sounds like one of those slightly
>> >      irritating but entirely tractable algorithms questions :-))
>>
>> Does that assume that any rom blob (so anything from -kernel, -pflash or
>> -generic-loader?) will have also included space for guest data and bss?
>
> Yes; the elf loader code creates rom blobs whose rom->romsize
> covers both initialized data from the ELF file and space to
> be zeroed.

Hmm I'm not seeing the RAM get bifurcated by the loader. The flatview
only has one RAM block in my test case and it covers the whole of RAM.

  Semihosting Heap Info Test
  find_heap_cb: rom:1 romd_mode:1 ram:0 0000000000000000/0000000000000000:4=
000000
  find_heap_cb: rom:1 romd_mode:1 ram:0 0000000004000000/0000000004000000:4=
000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008000000/0000000008000000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008010000/0000000008010000:2=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000008020000/0000000008020000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009000000/0000000009000000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009010000/0000000009010000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020000/0000000009020000:8
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020008/0000000009020008:2
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009020010/0000000009020010:8
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000009030000/0000000009030000:1=
000
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000000/000000000a000000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000200/000000000a000200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000400/000000000a000400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000600/000000000a000600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000800/000000000a000800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000a00/000000000a000a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000c00/000000000a000c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a000e00/000000000a000e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001000/000000000a001000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001200/000000000a001200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001400/000000000a001400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001600/000000000a001600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001800/000000000a001800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001a00/000000000a001a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001c00/000000000a001c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a001e00/000000000a001e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002000/000000000a002000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002200/000000000a002200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002400/000000000a002400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002600/000000000a002600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002800/000000000a002800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002a00/000000000a002a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002c00/000000000a002c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a002e00/000000000a002e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003000/000000000a003000:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003200/000000000a003200:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003400/000000000a003400:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003600/000000000a003600:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003800/000000000a003800:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003a00/000000000a003a00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003c00/000000000a003c00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000000a003e00/000000000a003e00:2=
00
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000000000000000:2=
eff0000
  find_heap_cb: rom:0 romd_mode:1 ram:0 000000003eff0000/000000003eff0000:1=
0000
  find_heap_cb: rom:0 romd_mode:1 ram:1 0000000040000000/0000000040000000:2=
0000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000004010000000:1=
0000000
  find_heap_cb: rom:0 romd_mode:1 ram:0 0000000000000000/0000000000000000:8=
000000000
  info appears to be inside the heap: 40211fe0 in 40000000:60000000


>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
