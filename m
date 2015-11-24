Received: by 10.182.158.201 with SMTP id ww9csp1990651obb;
        Tue, 24 Nov 2015 04:21:47 -0800 (PST)
X-Received: by 10.31.8.147 with SMTP id 141mr25815554vki.33.1448367707467;
        Tue, 24 Nov 2015 04:21:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10si17471184vkf.94.2015.11.24.04.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CbT-00032D-3H
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:21:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a1CbQ-0002yy-F9
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:21:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a1CbP-00035n-Jk
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:21:44 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1a1CbN-00035S-L9; Tue, 24 Nov 2015 07:21:41 -0500
Received: by vkay187 with SMTP id y187so9895580vka.3;
	Tue, 24 Nov 2015 04:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MqecpdyXfn6/ALS9mxSt6xM83AfvMybFS0mC8+p04ds=;
	b=zh998hfO/9WAZVyXvuVqZt+WbXUlQsEnquEW1YwjbKpw23wbaDX5Wj2AETWuhLbaN3
	sRbKS++vzbFlr5dNGdZ/vGAswhKEMnKni6Xw97wvpolbwIcDzlTZq9PIlsOMESUoD5iT
	1jSwXDeWo2UEzrw9Tl4ij8jIoF68kpkOO9b7PLoFyPpiKLRrNcuIRFJ4Y0BdbwH224ek
	Jg6+m3CVKlasw0V5TpKc8QrmGM9km8nCySUMujlC+Mvqn5BahlcdPUT63R66hQ4QgRaA
	afTrCx6Cp1hFepiUOR8iy3Hzc7Q5rPI/p4v4Ex3Er9ZCBtZ1SYaWp7sGLKXFoX4FU3VC
	2GPA==
MIME-Version: 1.0
X-Received: by 10.31.156.78 with SMTP id f75mr25775194vke.40.1448367700838;
	Tue, 24 Nov 2015 04:21:40 -0800 (PST)
Received: by 10.31.219.3 with HTTP; Tue, 24 Nov 2015 04:21:40 -0800 (PST)
In-Reply-To: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
References: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 24 Nov 2015 13:21:40 +0100
Message-ID: <CABoDooNF_CcCHV-QWNpv7oO3C2Z19De1ME5+T2mJTUA499i3bQ@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
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
X-TUID: ikDsbqxRNSO2

On Tue, Nov 24, 2015 at 1:01 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>


Laurent

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
