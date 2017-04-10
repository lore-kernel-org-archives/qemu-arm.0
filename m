Received: by 10.25.0.144 with SMTP id 138csp992612lfa;
        Mon, 10 Apr 2017 11:55:56 -0700 (PDT)
X-Received: by 10.55.90.70 with SMTP id o67mr56264024qkb.251.1491850556816;
        Mon, 10 Apr 2017 11:55:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si14192749qkf.254.2017.04.10.11.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 11:55:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxeTi-0000UL-AP
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 14:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxeSq-000083-4U
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 14:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxeSl-00015c-Fl
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 14:55:00 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxeSl-00015U-9n; Mon, 10 Apr 2017 14:54:55 -0400
Received: by mail-qt0-x244.google.com with SMTP id o36so4472068qtb.2;
	Mon, 10 Apr 2017 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gj0aeLZ5XT4LZg75gmd1VgrsK+BFoetcHLMIy6o3OJM=;
	b=BZ8kIzX19QbIGP4sY+lAQCJXxe7EzI7T0WBl4m/EpMn9r8BFyZlmPSBiL0lU7Z1j3k
	tl9QX2LkUfoz7liC6fWojU6g3oJ/4rNUx98rSYSaW371ucjUxa3PxSYhDYumQJ7FVk63
	lyVXeC1fJGI37pRKlzP/WIFu/BQMfeu7foMxqY3Q46aiyMc7vNrVf78AH3x64ncSe/UD
	Up0Pc0020d3Bu4mNQNhNxudXAkCx+2BCIPir7qpBgmVH0cU5g/V1X48bJar8s/SVdsc2
	msmZFc6InhIcOaIgoq29KBpjcL6swrpJgHozb1QFpyfjaDUdEa/0DGVbHSHVJTxjMW6g
	h1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gj0aeLZ5XT4LZg75gmd1VgrsK+BFoetcHLMIy6o3OJM=;
	b=MbisjkED08535goaHgGIW/O9DmIoPUWvgykN2QnYdX01RrbOxIgusSmW9VHm9KwFwP
	8qLp26dMrVeChCq4ee5ljLyBvAXXkwqTqPUmAO8R11uwhLZzsCLdU57nXywP9Y1N56MU
	Ay2XASABTIWDZqXgmlUlv2KioYmoNGDZ1awEwqYCRlMZeo+Cz/nFp3Y3EGNdYHI/UyVp
	8WJ8Hi1anVbJJt24rdF8jnPJS1YI9EcBvJozd4xlUsYM5bsILy/HCd0Qjqoic0aJhvOw
	9HFuf5pUIcNHssFokVvzqdQg7RNh2Gr+6TEx4v7a4MePsWulCxLhQTM33Inhn2dc31Bp
	dKVA==
X-Gm-Message-State: AN3rC/7bhRwcOBPTo4ntiSkzlZdI1nVKXlsNQqlnPTRDHM4G6jJnhCQRX7fjtTPWKNxqyA==
X-Received: by 10.200.4.140 with SMTP id s12mr7464389qtg.35.1491850494628;
	Mon, 10 Apr 2017 11:54:54 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	z32sm9328695qtg.17.2017.04.10.11.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 11:54:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
	<1491844419-12485-7-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d8517799-0767-dd58-175b-f8908a94e598@amsat.org>
Date: Mon, 10 Apr 2017 15:54:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491844419-12485-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH v2 6/9] arm: Abstract out "are we
 singlestepping" test to utility function
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xH+n7aFFypUd

On 04/10/2017 02:13 PM, Peter Maydell wrote:
> We now test for "are we singlestepping" in several places and
> it's not a trivial check because we need to care about both
> architectural singlestep and QEMU gdbstub singlestep. We're
> also about to add another place that needs to make this check,
> so pull the condition out into a function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 87fd702..f28c4ca 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -309,6 +309,17 @@ static void gen_singlestep_exception(DisasContext *s)
>      }
>  }
>
> +static inline bool is_singlestepping(DisasContext *s)
> +{
> +    /* Return true if we are singlestepping either because of
> +     * architectural singlestep or QEMU gdbstub singlestep. This does
> +     * not include the command line '-singlestep' mode which is rather
> +     * misnamed as it only means "one instruction per TB" and doesn't
> +     * affect the code we generate.
> +     */

This comment is very welcome :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    return s->singlestep_enabled || s->ss_active;
> +}
> +
>  static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
>  {
>      TCGv_i32 tmp1 = tcg_temp_new_i32();
> @@ -4104,7 +4115,7 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>
>  static inline void gen_jmp (DisasContext *s, uint32_t dest)
>  {
> -    if (unlikely(s->singlestep_enabled || s->ss_active)) {
> +    if (unlikely(is_singlestepping(s))) {
>          /* An indirect jump so that we still trigger the debug exception.  */
>          if (s->thumb)
>              dest |= 1;
> @@ -11970,9 +11981,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              ((dc->pc >= next_page_start - 3) && insn_crosses_page(env, dc));
>
>      } while (!dc->is_jmp && !tcg_op_buf_full() &&
> -             !cs->singlestep_enabled &&
> +             !is_singlestepping(dc) &&
>               !singlestep &&
> -             !dc->ss_active &&
>               !end_of_page &&
>               num_insns < max_insns);
>
> @@ -11989,7 +11999,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>         instruction was a conditional branch or trap, and the PC has
>         already been written.  */
>      gen_set_condexec(dc);
> -    if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
> +    if (unlikely(is_singlestepping(dc))) {
>          /* Unconditional and "condition passed" instruction codepath. */
>          switch (dc->is_jmp) {
>          case DISAS_SWI:
> @@ -12067,7 +12077,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>          /* "Condition failed" instruction codepath for the branch/trap insn */
>          gen_set_label(dc->condlabel);
>          gen_set_condexec(dc);
> -        if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
> +        if (unlikely(is_singlestepping(dc))) {
>              gen_set_pc_im(dc, dc->pc);
>              gen_singlestep_exception(dc);
>          } else {
>
