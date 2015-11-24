Received: by 10.182.158.201 with SMTP id ww9csp1987979obb;
        Tue, 24 Nov 2015 04:16:43 -0800 (PST)
X-Received: by 10.31.8.4 with SMTP id 4mr26173307vki.131.1448367403377;
        Tue, 24 Nov 2015 04:16:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d131si725402vka.203.2015.11.24.04.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 04:16:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1CWZ-0006bd-6J
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 07:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1CWW-0006bX-TJ
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:16:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1CWT-0001hq-Mk
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 07:16:40 -0500
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a]:32998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a1CWT-0001hh-9q; Tue, 24 Nov 2015 07:16:37 -0500
Received: by lfaz4 with SMTP id z4so18000156lfa.0;
	Tue, 24 Nov 2015 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=+hnoJngqNK6g5w13GJ08CWZ1LfBcB6LX0EGD+JL1sLs=;
	b=eilLeSCVxgNOIrqiJbsMXVARXtHw+S6JhtKMzRQSulPqvg5sFkM77w0pxQvoSAhCzi
	zUl+LtVN7JJSY1ku/wCmvcQdqM7pKoP23BQlhtBe8z3x/qEG0Ky0XT5sMwQcFuOgXqb+
	sdw9zjVTSHDWJBhINatWv9TezZUR1G6Lwt0Xdmhe1+UlQ+OY8JyXnf/wKKi+7mqAM4uP
	m4lHAU4slaY4xBJLGsY/tksbGtlGmIfg3bASRR5ruYq2h13B3FZBcrNIp2qXQWrQWRb2
	cjHzCn7bH9R7aIt4y4THj3QQEwTI3NkxK5Gb8tEqfWMlrGSBZnJqSEEQsboW0CAjFoBJ
	840g==
X-Received: by 10.25.161.78 with SMTP id k75mr10727601lfe.31.1448367396456;
	Tue, 24 Nov 2015 04:16:36 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	g80sm2619120lfg.44.2015.11.24.04.16.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 04:16:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56545522.5060508@gmail.com>
Date: Tue, 24 Nov 2015 15:16:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1448366481-10279-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22a
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
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
X-TUID: 9Qsm9ITZ3HD6

On 24.11.2015 15:01, Peter Maydell wrote:
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

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

