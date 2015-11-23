Received: by 10.182.158.201 with SMTP id ww9csp1339472obb;
        Mon, 23 Nov 2015 03:59:15 -0800 (PST)
X-Received: by 10.31.174.142 with SMTP id x136mr18378168vke.11.1448279955358;
        Mon, 23 Nov 2015 03:59:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si12181895vkf.197.2015.11.23.03.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2015 03:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a0pm7-0003nA-3i
	for alex.bennee@linaro.org; Mon, 23 Nov 2015 06:59:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1a0pll-0003TY-Dr
	for qemu-devel@nongnu.org; Mon, 23 Nov 2015 06:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1a0pli-00065A-7y
	for qemu-devel@nongnu.org; Mon, 23 Nov 2015 06:58:53 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:34117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1a0pli-000656-2Y; Mon, 23 Nov 2015 06:58:50 -0500
Received: by padhx2 with SMTP id hx2so189357842pad.1;
	Mon, 23 Nov 2015 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8/+kJbHchZmj12eLS874RUTNizw/lMtqwiTVqidLx9E=;
	b=VW11Iv8NNcf3T2JoOsrp+lzq2F9YItYwjHsrwGnd1GZnlQNS+fKY7AEOl3G2PicinA
	Jgk8kvWiZ6rthBa8thF5AXJsEZ6uljcTrIMNUzOQbjCzyp/VGCHt2XQE89ZxWUVrzKwu
	SmKmy9tt6KIR7tPhqAvE9OTRjPu6TxNm9hq35h0Joi/AQDNNFjUao/mfOGNmPN2L6Rpz
	hO2XuyqHtFFtO1clWYeO8ijh16BS3nA/fh5DcVzxD3Sl6x6VyGdRAulL+FIg4QjxN247
	opVZoeNrUkTmCTCaW64Jz784alJgsLbU0JPxISf9EccRF4XgGoHnzTHYfyzNfTU3uRjr
	sA1w==
X-Received: by 10.66.142.201 with SMTP id ry9mr35819762pab.89.1448279929206;
	Mon, 23 Nov 2015 03:58:49 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	ud10sm10264218pab.27.2015.11.23.03.58.47
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 03:58:48 -0800 (PST)
Date: Mon, 23 Nov 2015 12:58:44 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151123115844.GB12172@toto>
References: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
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
X-TUID: W7CLh9QoC8qe

On Fri, Nov 20, 2015 at 02:32:51PM +0000, Peter Maydell wrote:
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


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


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
