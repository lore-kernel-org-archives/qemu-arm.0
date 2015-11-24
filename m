Received: by 10.182.158.201 with SMTP id ww9csp1965144obb;
        Tue, 24 Nov 2015 03:32:21 -0800 (PST)
X-Received: by 10.31.56.18 with SMTP id f18mr23529017vka.19.1448364741248;
        Tue, 24 Nov 2015 03:32:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si17192942vke.6.2015.11.24.03.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 03:32:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1Bpc-0004Kg-SS
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 06:32:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a1BpI-0003wi-RV
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 06:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a1BpH-0006Jd-Qw
	for qemu-devel@nongnu.org; Tue, 24 Nov 2015 06:32:00 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1a1BpH-0006JW-NV; Tue, 24 Nov 2015 06:31:59 -0500
Received: by vkay187 with SMTP id y187so9097983vka.3;
	Tue, 24 Nov 2015 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BDGGxCiffbH9Y37qKulOl90cwtqhchD9beA+g31DOgo=;
	b=LYZB7wBBdste0BGaaRCajW/fwCDu/yJ8oG0hyIF5ER/4xvpUxGye9/Kprd5d1ExuwM
	gzsCcFR97bjPRME9u/OjPG4PK7AvIjhtxdAOT9UegmTBnx16pemmh2hri08fj/Wl+syT
	rWRPZVFp5Q7AFs6EKfR2VhDuhPOesFhmgj/3Y9RX7jC6/bmOYVnx7B8/9leVtiuNYCsP
	laIa0JLqvhibCTPC43HSDxTLXtgI4tqp/L7UMLMD5GyzW52HJ1rIQBJoBgPxj3qTnRPF
	eu4CAF2B3D7yQeMpMRXSdQlGynKwHtrrhszz3b+zJUXXc7/jqGKvINSQa0I0abMvEuve
	lk9g==
MIME-Version: 1.0
X-Received: by 10.31.149.75 with SMTP id x72mr25323759vkd.81.1448364719213;
	Tue, 24 Nov 2015 03:31:59 -0800 (PST)
Received: by 10.31.219.3 with HTTP; Tue, 24 Nov 2015 03:31:59 -0800 (PST)
In-Reply-To: <1448363923-10205-1-git-send-email-pmaydell@chiark.greenend.org.uk>
References: <1448363923-10205-1-git-send-email-pmaydell@chiark.greenend.org.uk>
Date: Tue, 24 Nov 2015 12:31:59 +0100
Message-ID: <CABoDooMe9S1-SM_PcC7mbVcEf0q6=JtaO_8VJTzh7tgOTa1EEg@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: "Peter Maydell <peter.maydell@linaro.org>--from=Peter Maydell"
	<peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 for-2.5] target-arm/translate-a64.c:
 Correct unallocated checks for ldst_excl
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
X-TUID: qoxb60cELrvE

Hello,

On Tue, Nov 24, 2015 at 12:18 PM, Peter Maydell
<peter.maydell@linaro.org>--from=Peter Maydell
<peter.maydell@linaro.org> wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

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
