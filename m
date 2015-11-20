Received: by 10.182.158.201 with SMTP id ww9csp541124obb;
        Fri, 20 Nov 2015 07:18:33 -0800 (PST)
X-Received: by 10.13.227.193 with SMTP id m184mr15111929ywe.16.1448032710668;
        Fri, 20 Nov 2015 07:18:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o67si36270ywe.21.2015.11.20.07.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 07:18:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZznSI-0002pR-Bl
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 10:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ZznRu-0002Wd-S2
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:18:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ZznRt-0007DA-Rm
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:18:06 -0500
Received: from mail-yk0-x22f.google.com ([2607:f8b0:4002:c07::22f]:35839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1ZznRt-0007D6-N1; Fri, 20 Nov 2015 10:18:05 -0500
Received: by ykba77 with SMTP id a77so166416128ykb.2;
	Fri, 20 Nov 2015 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tJ+5q588I1L91rReS2Kn/KHqM94LM7C43HNdjvFvsx8=;
	b=BFJ/FAcTgEbXIq2BMogtk2mt47fZHlIJz5MBG9TUOEzL0a6aM17RMm5nnPnoYWzJTX
	L0AMVkYJ5FMsVMxyaC3nJSnIXJ9vP/lTxuINsaWa5FtPFXuptL/pYpZ0eumSYYYgVCVW
	pVM9fQkQGyQJCquCdu6VG2dlKmgmrUR3PAnX/EI8llWOkGgtATDS2Gbj4Hpf15TcBl1/
	r+ZxYJUAlL6xlS2jM6ZMJA7nI+q7OS/nbWVRsGi4L0NUtuVWAmuavYzdiJEZRI6O84Du
	vu65H6BLMWTTQgtJ4a+ukYNIybNunuoouv0Y0gvzNYn1lrhB2boSU1NthctcGJh/i8Wx
	Ux3w==
MIME-Version: 1.0
X-Received: by 10.129.42.4 with SMTP id q4mr14762410ywq.35.1448032680666; Fri,
	20 Nov 2015 07:18:00 -0800 (PST)
Received: by 10.31.219.3 with HTTP; Fri, 20 Nov 2015 07:18:00 -0800 (PST)
In-Reply-To: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
References: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 16:18:00 +0100
Message-ID: <CABoDooP4ya0uG_1C7Ux65CQP3JsQQO68fPJkdihXVbxGWHei5g@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22f
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH for-2.5] target-arm: Don't mask out bits
 [47:40] in LPAE descriptors for v8
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V9Mj6dUfq7Ha

Hello,

On Fri, Nov 20, 2015 at 3:32 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> In an LPAE format descriptor in ARMv8 the address field extends
> up to bit 47, not just bit 39. Correct the masking so we don't
> give incorrect results if the output address size is greater
> than 40 bits, as it can be for AArch64.
>
> (Note that we don't yet support the new-in-v8 Address Size fault which
> should be generated if any translation table entry or TTBR contains
> an address with non-zero bits above the most significant bit of the
> maximum output address size.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is worth fixing for 2.5 I think. As the commit message notes,
> we don't support the Addres Size faults we ought to take in some
> cases, but that seems more 2.6-ish.
> ---
>  target-arm/helper.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 4ecae61..afc4163 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6642,6 +6642,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>      int ap, ns, xn, pxn;
>      uint32_t el = regime_el(env, mmu_idx);
>      bool ttbr1_valid = true;
> +    uint64_t descaddrmask;
>
>      /* TODO:
>       * This code does not handle the different format TCR for VTCR_EL2.
> @@ -6831,6 +6832,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>      descaddr = extract64(ttbr, 0, 48);
>      descaddr &= ~((1ULL << (inputsize - (stride * (4 - level)))) - 1);
>
> +    /* The address field in the descriptor goes up to bit 39 for ARMv7
> +     * but up to bit 47 for ARMv8.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_V8)) {
> +        descaddrmask = 0xfffffffff000ULL;
> +    } else {
> +        descaddrmask = 0xfffffff000ULL;
> +    }

My understanding is that 48 bits are used if you are running AArch64
code, and 40 bits are used for 32-bit code even on an ARMv8 CPU, so
checking for ARM_FEATURE_V8 is perhaps not enough.

Thanks,

Laurent

> +
>      /* Secure accesses start with the page table in secure memory and
>       * can be downgraded to non-secure at any step. Non-secure accesses
>       * remain non-secure. We implement this by just ORing in the NSTable/NS
> @@ -6854,7 +6864,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>              /* Invalid, or the Reserved level 3 encoding */
>              goto do_fault;
>          }
> -        descaddr = descriptor & 0xfffffff000ULL;
> +        descaddr = descriptor & descaddrmask;
>
>          if ((descriptor & 2) && (level < 3)) {
>              /* Table entry. The top five bits are attributes which  may
> --
> 1.9.1
>
