Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2070777wrq;
        Sat, 30 Jun 2018 12:50:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfSbzPdvZM3t2D3g+UbLykQk6f3tMQSQoUBHZlrirFbPnAGFDeoyKAzOftXIx0rPuMi0Eda
X-Received: by 2002:ac8:33c2:: with SMTP id d2-v6mr3096856qtb.323.1530388222450;
        Sat, 30 Jun 2018 12:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530388222; cv=none;
        d=google.com; s=arc-20160816;
        b=G/npn5OVpqK6WS9D13bYLGAetp1Q7RI9h1Q6wdDeHSwNbroTbpMGbtdEtjC0DXu+SG
         Rrm5IPrfqMJGUkGm7bQyg50wNGq9WiQ5vJWLxG6FRDJwjF3/hd1H8iFnh3vKBA60qSXM
         v76yV2/bzwOGMkoxIb361TDV92OWbdv1UVLQATQajoOnWUAOCdkiPT+ZZgSoObxmNT8O
         TVB/RYW8fY3XpBwzB9gPAt1BuUl/t5QSy1d0vSZxFgXsTeeIMZusCQcSn3b+zlt0XS3A
         z6D4tkAJ4nccKzAsYWgKiFG1D6D+5iXQWSMKdWAW4IxftFyHA1hmK1jG4Lf1101Fc/1S
         td9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uevaR0c3s5khKIL7C5+toq2rbeGGbh0vvyRBNQUT5II=;
        b=s5WfpbK0qrjTCxOaQqTvLPuEQOfBdKTGwmdpXajgRqvGRz5vhji7Y79uNwJgrSUmxm
         9apr+wYAhcnKbscjo6/XjdDnxa+oKTTqeKO370XkPbNXulVklaCO75JbEXUVMJUfxF+D
         q8MHjHLcR5p17+oo/+8poQqDmci1XvVlPkxYS1QKvVFPYSZk5nrBUwXRLqldUYuu4//S
         YjaTY5AYKaLDa9msdkrWqfwl9h6e4oYvce7UpLPm0chr6P+rPPsBqzMjUgsY/4UVh2WP
         4iN0X2RUBvshB0ycgvJgc9va4mFEZtTLln43+LUIMEADKKQLE32NkfSozXfxd8HmIXE+
         OPWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cuUiFeZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12-v6si4945358qtf.249.2018.06.30.12.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 12:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cuUiFeZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZLsz-0004Sh-VC
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 15:50:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLsp-0004Qc-Bv
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1fZLso-0005ny-Hf
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 15:50:11 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:38723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1fZLso-0005mb-DG; Sat, 30 Jun 2018 15:50:10 -0400
Received: by mail-yb0-x244.google.com with SMTP id i9-v6so167316ybo.5;
	Sat, 30 Jun 2018 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uevaR0c3s5khKIL7C5+toq2rbeGGbh0vvyRBNQUT5II=;
	b=cuUiFeZGAwYqULPE1UxyypXwWx121F81Hqg+yFfjJGISlpsWzXBHHITzuNX4J1YICJ
	XtkU2flxrW9+/7EUanMMccVYQdC5EF4cWm6mYknWPrL9iHmQVJpb8MV4/dNIjgmjqVDO
	i8q9zCIaJbZo64PxrvGY4zjNfmH95xritf8x1LGUs4x9NDyf+JW/FyHViMALekjUhH9t
	55gd25LnjkMWcDBkQ95zbYd13Lo779AaB2FuVIYKoxNa0KvszeN/hVbugeeKDwh1XuFN
	01W4s02wFudQyqdezIHf4tE7jZ1m5P5eIBKyRU1gC5u4xLIeTPGqbsXhGD95FtcKksHX
	ZMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uevaR0c3s5khKIL7C5+toq2rbeGGbh0vvyRBNQUT5II=;
	b=H+kLa6K6uuff724IuPtUbYh9LN0GImeeZOmrEuW+AGOx9I/5SZZUF2iW8wFjU7+wHJ
	usrZkidmC6uwTeF8VBo+oBDfFVYQTQJ1V5EpBU7WpQSmy+nGzC3zFWhpk560NgDFuQqq
	l+lsL5nL+Ki12HXKDurYwgdhOcNW0bb6rEGeoez3YALBuIZzZ7n1hXxGirV1MjSoO/o2
	c9KakTLcJwpjIqP3tg6jS2ytUjx/2QrkEBCxNFxDcBPYyfvRgfo86B8T+a2FrmATxAEh
	vR8YqzQKkcNL11aiJds9aF75FpQm4EYHT7U43q4yKTeoNTiw00unpPq4iWErAxnyBYgB
	QIsw==
X-Gm-Message-State: APt69E2Mc5sBmv2Us2mHLx8qhWff1YT+cqgJr/q1aRwWMSA+P3gSHg2t
	fj7/wQZp9hPFV48mMH6a/U3hH9GPBeRB3em8nhY=
X-Received: by 2002:a25:7045:: with SMTP id
	l66-v6mr10110554ybc.278.1530388209701; 
	Sat, 30 Jun 2018 12:50:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:620b:0:0:0:0:0 with HTTP; Sat, 30 Jun 2018 12:50:09
	-0700 (PDT)
In-Reply-To: <CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
References: <20180620130619.11362-1-peter.maydell@linaro.org>
	<20180620130619.11362-2-peter.maydell@linaro.org>
	<CAMo8BfLRr16q4_nj0vacK4N4fb0EBymXZB6SHon72h7BJ9M5jw@mail.gmail.com>
	<CAMo8Bf+iV3fTRtSKx8Y-Y4_e16i21shLOch2PS3v_xR_c+L0ww@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 30 Jun 2018 12:50:09 -0700
Message-ID: <CAMo8Bf+2+2XEOQQY=EYO6VsS-ZtesTRf=S1ULgh2GcTFo5JU3g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] tcg: Support MMU protection
 regions smaller than TARGET_PAGE_SIZE
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Patch Tracking <patches@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlTintEgsJS1

On Sat, Jun 30, 2018 at 12:42 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sat, Jun 30, 2018 at 12:20 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> Hi Peter,
>>
>> On Wed, Jun 20, 2018 at 6:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Add support for MMU protection regions that are smaller than
>>> TARGET_PAGE_SIZE. We do this by marking the TLB entry for those
>>> pages with a flag TLB_RECHECK. This flag causes us to always
>>> take the slow-path for accesses. In the slow path we can then
>>> special case them to always call tlb_fill() again, so we have
>>> the correct information for the exact address being accessed.
>>>
>>> This change allows us to handle reading and writing from small
>>> regions; we cannot deal with execution from the small region.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  accel/tcg/softmmu_template.h |  24 ++++---
>>>  include/exec/cpu-all.h       |   5 +-
>>>  accel/tcg/cputlb.c           | 131 +++++++++++++++++++++++++++++------
>>>  3 files changed, 130 insertions(+), 30 deletions(-)
>>
>> I'm observing the following failure with xtensa tests:
>>
>> (qemu) qemu: fatal: Unable to handle guest executing from RAM within a
>> small MPU region at 0xd0000804
>>
>> Bisection points to this patch. Any idea what happened?
>
> Ok, I think I've found the issue: the following check in the
> get_page_addr_code does not work correctly when -1 is in the
> addr_code in the QEMU TLB:
>
> if (unlikely(env->tlb_table[mmu_idx][index].addr_code & TLB_RECHECK))
>
> tlb_set_page_with_attrs sets addr_code to -1 in the TLB entry
> when the translation is not executable.

Looks like it can be fixed with the following:

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index eebe97dabb75..633cffe9ed74 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -692,16 +692,16 @@ void tlb_set_page_with_attrs(CPUState *cpu,
target_ulong vaddr,
     if (prot & PAGE_READ) {
         tn.addr_read = address;
     } else {
-        tn.addr_read = -1;
+        tn.addr_read = TLB_INVALID_MASK;
     }

     if (prot & PAGE_EXEC) {
         tn.addr_code = code_address;
     } else {
-        tn.addr_code = -1;
+        tn.addr_code = TLB_INVALID_MASK;
     }

-    tn.addr_write = -1;
+    tn.addr_write = TLB_INVALID_MASK;
     if (prot & PAGE_WRITE) {
         if ((memory_region_is_ram(section->mr) && section->readonly)
             || memory_region_is_romd(section->mr)) {


-- 
Thanks.
-- Max
