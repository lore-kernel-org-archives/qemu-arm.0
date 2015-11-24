Received: by 10.182.158.201 with SMTP id ww9csp1982575obb;
        Tue, 24 Nov 2015 04:07:42 -0800 (PST)
X-Received: by 10.31.47.204 with SMTP id v195mr26263511vkv.119.1448366861939;
        Tue, 24 Nov 2015 04:07:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si11193272vkd.211.2015.11.24.04.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CNp-0001en-NL
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:07:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1CNn-0001eh-QE
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1CNm-0007lD-T5
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:07:39 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1CNm-0007l6-Jc
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:07:38 -0500
Received: by vkha189 with SMTP id a189so9642896vkh.2
	for <qemu-arm@nongnu.org>; Tue, 24 Nov 2015 04:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=o7ojOzfVo2tAkY3J9HjMV+sYtltvUbtYcDhJLxdiiJQ=;
	b=JnyXFMR98ws5RIsnqVa9V8wu0wpO7MEQxa7+gC2RrEWPg/7oP5aKkXvr34xb+7ujCu
	S8FfDS2qRuKS3+lQb76iGa9KfIJ8U8vuTJCLHSK2IpLlLTqZP+uCNIA4Y/cjWXrksaXp
	/Zis6jKywTkv+A43sGRWTu7vLYI1aWdSwUcSGRz5FWRgHo0pdSlkF1yZStnLrVglFtxr
	pNYchIEFmzC7FvzyMpu9jn7qHmp/xK4fshSwZPKaT4p/3Yj60eiVS/Id9u1H+GJfcoBA
	uUNYAnRGpBRdCYNwwHGLmBN01Toaw+nJQIW2jmyWtuPfSNN2XgTcrfrRXslHMAQLLsJS
	SIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=o7ojOzfVo2tAkY3J9HjMV+sYtltvUbtYcDhJLxdiiJQ=;
	b=mFQ0PEGyqXUBdNcZ831FRSKt8UL07caMuHmQ2tF3lR7ybXKoijv2+NgTVgWG7PW+OV
	pzbbgcmbGw8Yhz1MF/nmi5/SCJBFnOWJJsW46wv22VGZxMvMYL/OWSiAUj2HyIUsu5fa
	K7avAP/eBRlw8Wp75q7Mmi+VA9T5vm9K6BdBdyA/rs6hDicRr9kuPvlt/JhMBCSbqqAb
	v6ETGpbz2KKkGNH74ZSxRgRvroln6z0/kfSka9F0+3N9geSgOVqUQUic7S083OGEHh6w
	qImSYeRiXyXNfFJuJvhr8fY7pCE2fQzQeSWiJEB89bfLxgSccBseLlFhReuOZ4/9uZ9+
	S0QQ==
X-Gm-Message-State: ALoCoQkW/8bPtM/PTDWkMlYAVcglCGJuTQJLRZ61wj397kv5dzEBBDZYDuTiRrPOMbDSF+JLm7P3
X-Received: by 10.31.194.201 with SMTP id s192mr25826881vkf.92.1448366857948; 
	Tue, 24 Nov 2015 04:07:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 24 Nov 2015 04:07:18 -0800 (PST)
In-Reply-To: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
References: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2015 12:07:18 +0000
Message-ID: <CAFEAcA9mN6MDSu65ZHcBRRBX=2EnjEc7GyYE4aWMbNdwA3ti1g@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
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
X-TUID: DptnF2Y55XXx

(Apologies if you got two copies of this -- I mangled the
--from argument to git send-email first time round and the list
servers rejected the mail. -- PMM)

On 24 November 2015 at 12:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
