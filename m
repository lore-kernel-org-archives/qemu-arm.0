Received: by 10.182.158.201 with SMTP id ww9csp1987212obb;
        Tue, 24 Nov 2015 04:15:28 -0800 (PST)
X-Received: by 10.31.58.142 with SMTP id h136mr26002080vka.115.1448367327085;
        Tue, 24 Nov 2015 04:15:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si17368079vka.167.2015.11.24.04.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CVK-0005Nu-SS
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:15:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1a1CVI-0005KW-4w
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1a1CVE-0001WE-66
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:15:24 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:34073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1a1CV9-0001Vn-Vl; Tue, 24 Nov 2015 07:15:16 -0500
Received: by padhx2 with SMTP id hx2so21188519pad.1;
	Tue, 24 Nov 2015 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r6UQErU3ScjyJ43UUGLMgPj3ZCVpclQfr8v2fL5lGnk=;
	b=yFMO9HFxhg4nKHemvfGgv0Kbx1bJk+qkMULZhw+NBoJ0u/RHWmc10tQuSNmOMtWGp8
	xvygyAOLRJXMvN+Nuze1VpJY8L4zYogBsgWOrHdBmUhD8a/NJlIASsXWYwMxm8UM9XmJ
	5Gk1H22NiP/01en97qP+tbVL5X5qVDTnpJRGmXz2B1adRyEdJKgjMY6NjmKWE5tAidTd
	ATPNp/QkHTGlrpPeOAhGVcS6We83vHVeTVyuaUEDp1O6u/zmQufrp83Fk9X+rGd6uDte
	NifXifTQFJDmqyVdtMJa6pJM1daC7VriRfp5hvK7rOIeZQIXxUQzmzTGayEGPMJcRVc1
	AS4w==
X-Received: by 10.98.16.7 with SMTP id y7mr22411685pfi.25.1448367314988;
	Tue, 24 Nov 2015 04:15:14 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	r72sm14135921pfi.0.2015.11.24.04.15.13
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 24 Nov 2015 04:15:13 -0800 (PST)
Date: Tue, 24 Nov 2015 13:15:10 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151124121510.GC12172@toto>
References: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 for-2.5] target-arm/translate-a64.c:
 Correct unallocated checks for ldst_excl
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o/XXN74evXSy

On Tue, Nov 24, 2015 at 12:01:21PM +0000, Peter Maydell wrote:
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
> 
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
> The easiest way to validate that we have the unallocated
> conditions correct now is to look at C4.4.6 "load/store exclusive"
> in the v8 ARM ARM rev A.3h: our three conditions correspond
> to the three "unallocated" rows in the decode table.
> 
> v2 changes: remove incorrect comment too.
> ---
>  target-arm/translate-a64.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index fe485a4..14e8131 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -1816,9 +1816,6 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>   *  o2: 0 -> exclusive, 1 -> not
>   *  o1: 0 -> single register, 1 -> register pair
>   *  o0: 1 -> load-acquire/store-release, 0 -> not
> - *
> - *  o0 == 0 AND o2 == 1 is un-allocated
> - *  o1 == 1 is un-allocated except for 32 and 64 bit sizes
>   */
>  static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>  {
> @@ -1833,7 +1830,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>      int size = extract32(insn, 30, 2);
>      TCGv_i64 tcg_addr;
>  
> -    if ((!is_excl && !is_lasr) ||
> +    if ((!is_excl && !is_pair && !is_lasr) ||
> +        (!is_excl && is_pair) ||
>          (is_pair && size < 2)) {
>          unallocated_encoding(s);
>          return;
> @@ -1862,15 +1860,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>          } else {
>              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
>          }
> -        if (is_pair) {
> -            TCGv_i64 tcg_rt2 = cpu_reg(s, rt);
> -            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
> -            if (is_store) {
> -                do_gpr_st(s, tcg_rt2, tcg_addr, size);
> -            } else {
> -                do_gpr_ld(s, tcg_rt2, tcg_addr, size, false, false);
> -            }
> -        }
>      }
>  }
>  
> -- 
> 1.9.1
> 
> 
