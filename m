Received: by 10.25.0.144 with SMTP id 138csp860104lfa;
        Mon, 10 Apr 2017 06:22:43 -0700 (PDT)
X-Received: by 10.200.51.28 with SMTP id t28mr9607776qta.16.1491830563334;
        Mon, 10 Apr 2017 06:22:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si13383847qkf.232.2017.04.10.06.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 06:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxZHE-0004ta-JX
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 09:22:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZH9-0004rg-Mv
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 09:22:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZH8-00066X-Lm
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 09:22:35 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZH3-00064N-Db; Mon, 10 Apr 2017 09:22:29 -0400
Received: by mail-qt0-x242.google.com with SMTP id o36so3072191qtb.2;
	Mon, 10 Apr 2017 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=bbGrNKTy/hZ8ly/tWxT0QS/6Ha2NRrGfLzb1cwfkTqU=;
	b=lwqkDGpCvDBvcx+MAktMubRuhfLEK78kgDokxsYRSojvKDm2/TZxmeAg+D2HDmaMul
	Q3uPDAQLKK+WPWgwmACQs5nj2K1EQ59Xk+MukGBKARX6UtkMfdJYsaRgjujEEi6u+Uzq
	B9QsHTv1JMTodrM/qbzQO5jeBek2Nt4Ioskp7xWCwTqaJrrx4E29TYzx+IJxV4WS475R
	uELdXDO/HErcTpadDPpHFkMPI1eLwGELupAE6p7eic2BVWqwnIZf4lL7lbeZyYE0bIxr
	7UF9Tw2wuSYV/03dp4zmsBTTb6EE+JrMW0VeiqBj0YQe1v08TDCf8wXJJKGD/4oFW2ut
	avrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=bbGrNKTy/hZ8ly/tWxT0QS/6Ha2NRrGfLzb1cwfkTqU=;
	b=JE5TIn348D8pTsE2E5JRnYAGoxYr8A5dCCbywUg4iKnxIOMQyipiK3FF9u4oyDsS7t
	fmYAH936kdg0RexVjN59DbF2/96iTnfnpVp82JnzcXf4q1e4U4E6PbNqPX6Pih8SMrAl
	FbJvvxat7Y41LKD1V7eYsRLIVWCnKYIz98oF7sv9KwmJK7w2t3JDugRkzTQfwMOMq96E
	DDIm+YIU0OzPQuWeExR2HNKwzo+BVpYhueTFn9DpKR0txoGtqEZexxh2bJSPVQ8fI6UB
	dQq8XEiyCQ8K7BlOpZ638NDb7eaLf7GeNtKyPTZnVFPuxrapK8ZDm5UtzOxhZyJbp6zE
	eZtw==
X-Gm-Message-State: AFeK/H0/OFneQ6c7CHF8LPKu05hUEGCxdvWgy0h3lrF4Y+MXdQ51pkAvCHfWj3R7qwKxbQ==
X-Received: by 10.237.36.84 with SMTP id s20mr52090815qtc.271.1491830548707;
	Mon, 10 Apr 2017 06:22:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s10sm8775117qke.53.2017.04.10.06.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 06:22:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-6-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6a8d54a6-cf11-38d3-390f-dd4536b2c2b6@amsat.org>
Date: Mon, 10 Apr 2017 10:22:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491820793-5348-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 5/7] arm: Move condition-failed codepath
 generation out of if()
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CEAju1ixv4IQ

Hi Peter,

On 04/10/2017 07:39 AM, Peter Maydell wrote:
> Move the code to generate the "condition failed" instruction
> codepath out of the if (singlestepping) {} else {}. This
> will allow adding support for handling a new is_jmp type
> which can't be neatly split into "singlestepping case"
> versus "not singlestepping case".

This makes also the code more readable :)

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a1a0e73..87fd702 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11988,9 +11988,9 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>      /* At this stage dc->condjmp will only be set when the skipped
>         instruction was a conditional branch or trap, and the PC has
>         already been written.  */
> +    gen_set_condexec(dc);
>      if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
>          /* Unconditional and "condition passed" instruction codepath. */
> -        gen_set_condexec(dc);
>          switch (dc->is_jmp) {
>          case DISAS_SWI:
>              gen_ss_advance(dc);
> @@ -12013,13 +12013,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              /* FIXME: Single stepping a WFI insn will not halt the CPU. */
>              gen_singlestep_exception(dc);
>          }
> -        if (dc->condjmp) {
> -            /* "Condition failed" instruction codepath. */
> -            gen_set_label(dc->condlabel);
> -            gen_set_condexec(dc);
> -            gen_set_pc_im(dc, dc->pc);
> -            gen_singlestep_exception(dc);
> -        }
>      } else {
>          /* While branches must always occur at the end of an IT block,
>             there are a few other things that can cause us to terminate
> @@ -12029,7 +12022,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              - Hardware watchpoints.
>             Hardware breakpoints have already been handled and skip this code.
>           */
> -        gen_set_condexec(dc);
>          switch(dc->is_jmp) {
>          case DISAS_NEXT:
>              gen_goto_tb(dc, 1, dc->pc);
> @@ -12069,11 +12061,17 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
>              break;
>          }
> -        if (dc->condjmp) {
> -            gen_set_label(dc->condlabel);
> -            gen_set_condexec(dc);
> +    }
> +
> +    if (dc->condjmp) {
> +        /* "Condition failed" instruction codepath for the branch/trap insn */
> +        gen_set_label(dc->condlabel);
> +        gen_set_condexec(dc);
> +        if (unlikely(cs->singlestep_enabled || dc->ss_active)) {

I'm custom to think "let's change that and think how to protect the code 
to help the next one who will modify it" and wonder if it isn't safer to 
define:

const bool singlestepping;

singlestepping = cs->singlestep_enabled || dc->ss_active;

Then use:

if unlikely(singlestepping)

At line 11993 and here, what do you think?

Either way:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +            gen_set_pc_im(dc, dc->pc);
> +            gen_singlestep_exception(dc);
> +        } else {
>              gen_goto_tb(dc, 1, dc->pc);
> -            dc->condjmp = 0;
>          }
>      }
>
>
