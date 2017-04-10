Received: by 10.25.0.144 with SMTP id 138csp820713lfa;
        Mon, 10 Apr 2017 04:44:37 -0700 (PDT)
X-Received: by 10.200.40.210 with SMTP id j18mr57279959qtj.272.1491824677191;
        Mon, 10 Apr 2017 04:44:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 91si13220614qku.165.2017.04.10.04.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 04:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxXkI-0002An-Eb
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 07:44:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXiz-0001aI-Gb
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 07:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXiw-0003LN-EK
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 07:43:13 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXiw-0003LD-AP; Mon, 10 Apr 2017 07:43:10 -0400
Received: by mail-qt0-x243.google.com with SMTP id o36so2679861qtb.2;
	Mon, 10 Apr 2017 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=SmkYa6YpW6HqRQBUt94y9kavdE96NjOg7a+2wjN8BzY=;
	b=EAkMKWFHneoMWG5qdfLFk3QliuD3L50VwKDd0+9kcoi7ecivirNkvM7J8afODPo9jr
	zaVUaQOgWQ9eZWFoi97W/bwTZZyLpS2Jvoit3Kyu/vcAGr7rtUwAzBPBnihfikTuvkvU
	1JeII8cDpNnwyq8PHIMrAwa3ZlmtcrW9B5xA6EQU/Ero2cBhFPAWAq/qHaVFEQGy8bWs
	sPugXT/M32n5hl4sPmFwacsoQH/jo4s+/hGDCpNXQaKgVD/7l405btro8N0EGpwDTwPf
	emTdm30HW7lO6lwO8S7Y9hFa9V0xHYjOgx4Q75oLLpqWLElsuzKSK1L5zYTwUQtuDopF
	G05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=SmkYa6YpW6HqRQBUt94y9kavdE96NjOg7a+2wjN8BzY=;
	b=WJZX4hMA74YpFG7r0pGWHIDiZCpZ8O42T/eaYk6qaDAN43zQxRTONNHc9ZEOQOekHd
	8e/4tFT1sRvByXh7XrcRWoD+JIvwpg+fqKBCNh7fgkljTF6qR/a6USb+Zo+gUE1a3L3b
	el36inSTlEvLAYOnfcQKMSx673QxiLqVxGg2Ed8IsjawCRcU4nshtIfPlDkaZHIIkP48
	cPMTEpBtiz6joFq5xq+y/9lMJLR2LqbzVqK7sAnEAfCj1Mfh+wo5eDbK+rblus87rFcG
	LOt22eWGSWMRV0jMTf8jJPl1gP+HhhqT/Ae38dJUg5FP4e4X2hb0lxXe2XPYZl3ZDS7N
	i0hQ==
X-Gm-Message-State: AN3rC/5F18ko326lcGtDyJ6SeYGiF1iaBpTe87Zd8veBaYnho53Ef08yv1i2crf35IBfzw==
X-Received: by 10.200.53.202 with SMTP id l10mr6532003qtb.133.1491824589675;
	Mon, 10 Apr 2017 04:43:09 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id j1sm8599107qkf.57.2017.04.10.04.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 04:43:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c05b13b4-9ffe-318c-6ee6-04e1630ab92d@amsat.org>
Date: Mon, 10 Apr 2017 08:43:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491820793-5348-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 3/7] arm: Factor out "generate
 right kind of step exception"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nn1nRv5+TUm5

On 04/10/2017 07:39 AM, Peter Maydell wrote:
> We currently have two places that do:
>             if (dc->ss_active) {
>                 gen_step_complete_exception(dc);
>             } else {
>                 gen_exception_internal(EXCP_DEBUG);
>             }
>
> Factor this out into its own function, as we're about to add
> a third place that needs the same logic.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ddc62b6..870e320 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -296,6 +296,19 @@ static void gen_step_complete_exception(DisasContext *s)
>      s->is_jmp = DISAS_EXC;
>  }
>
> +static void gen_singlestep_exception(DisasContext *s)
> +{
> +    /* Generate the right kind of exception for singlestep, which is
> +     * either the architectural singlestep or EXCP_DEBUG for QEMU's
> +     * gdb singlestepping.
> +     */
> +    if (s->ss_active) {
> +        gen_step_complete_exception(s);
> +    } else {
> +        gen_exception_internal(EXCP_DEBUG);
> +    }
> +}
> +
>  static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
>  {
>      TCGv_i32 tmp1 = tcg_temp_new_i32();
> @@ -11998,24 +12011,15 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              gen_set_pc_im(dc, dc->pc);
>              /* fall through */
>          default:
> -            if (dc->ss_active) {
> -                gen_step_complete_exception(dc);
> -            } else {
> -                /* FIXME: Single stepping a WFI insn will not halt
> -                   the CPU.  */
> -                gen_exception_internal(EXCP_DEBUG);
> -            }
> +            /* FIXME: Single stepping a WFI insn will not halt the CPU. */
> +            gen_singlestep_exception(dc);
>          }
>          if (dc->condjmp) {
>              /* "Condition failed" instruction codepath. */
>              gen_set_label(dc->condlabel);
>              gen_set_condexec(dc);
>              gen_set_pc_im(dc, dc->pc);
> -            if (dc->ss_active) {
> -                gen_step_complete_exception(dc);
> -            } else {
> -                gen_exception_internal(EXCP_DEBUG);
> -            }
> +            gen_singlestep_exception(dc);
>          }
>      } else {
>          /* While branches must always occur at the end of an IT block,
>
