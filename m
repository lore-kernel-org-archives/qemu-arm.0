Received: by 10.25.0.144 with SMTP id 138csp1126389lfa;
        Sun, 16 Apr 2017 21:20:33 -0700 (PDT)
X-Received: by 10.237.56.67 with SMTP id j61mr4892852qte.86.1492402833166;
        Sun, 16 Apr 2017 21:20:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n125si2836827qkd.262.2017.04.16.21.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 21:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czy9Q-0001LO-Kc
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 00:20:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czy9E-0001Ju-Di
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 00:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czy9D-0006KM-6A
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 00:20:20 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czy98-0006Ev-7j; Mon, 17 Apr 2017 00:20:14 -0400
Received: by mail-qk0-x242.google.com with SMTP id d131so18113046qkc.0;
	Sun, 16 Apr 2017 21:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7CyGZRTHFzN/+SlP0BBFSDOpyzbN9lL5qPQMG6G0hFw=;
	b=VTF4SaSap+kFAiOWYq2neiJrHjlnpzQw5KYScUqntA8qJME47A/5g383UxOP11YR+2
	SVP3v4wzT0zGFRzQbwF9JkvS5G2CI9hUoF/3++h0unogmun/8Znz8elw97aLryUKS4As
	hKSZd5ajjk/WrZ5Mg/BVuY9jm6Pa8gWLAAzW/jVEgywwxc5zaX+PTHNdt2Oi91LP4bsa
	ZqPDDIkeNRBfRTiy3MoGRtxgFHDKmWN8Q00lT/FV0bYrFfiMkd8yScyaQXvqA8SEkXZO
	QyL10o/x1SQeQo6CXxYDRVL7U1gRdSEwj7zonErRRAtYjLKLvJ5fxEl2u0e4jPIr9u9n
	3bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7CyGZRTHFzN/+SlP0BBFSDOpyzbN9lL5qPQMG6G0hFw=;
	b=FawBA1UUxFS9bVa3Azdn4VAmU1sgEEfZuYBiRFq0DeB67VBw0rQYjeY4O21w3M4DlJ
	PyKv9tXsk9N6ghFJjk+1lTX6NPpBa5Ad/SOOY8Eg5NSkuhIipIfVjsUpQLcHxXO6uO9O
	cRNXquSNBLrDZ9tdEOdLgbRm4atGtX+IVe7jgXM+NfqYAYlXnbDL5Js6VAAAsuomQj1h
	YD7UNb49no49AWEJoY3sNQO+2/qv8L3G2C9AXvUxyC0L7Q27+p+puZX2TbB9zXIzWywN
	QosAI0JH4BwhNwldaXTYSVC3UR8g5t6HJc2Lc10ENvr2usssx3sy4f1FSl1HrbJoXZWH
	k19A==
X-Gm-Message-State: AN3rC/6A4r3ScuVQeSL9qa1ITXtVFKUdXde/Yl4rm8aVP3EaNQ8USbBT
	sKTIyN4kZzLtmw==
X-Received: by 10.55.7.135 with SMTP id 129mr6663244qkh.82.1492402810418;
	Sun, 16 Apr 2017 21:20:10 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id t40sm6436375qtb.6.2017.04.16.21.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 21:20:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
	<1491844419-12485-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3dd852ae-3ff9-0b53-11f1-ea4e2a3ed59c@amsat.org>
Date: Mon, 17 Apr 2017 01:20:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491844419-12485-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v2 7/9] arm: Track M profile handler mode
 state in TB flags
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zxPqVRypEBzX

Hi Peter,

On 04/10/2017 02:13 PM, Peter Maydell wrote:
> For M profile exception-return handling we'd like to generate different
> code for some instructions depending on whether we are in Handler
> mode or Thread mode. This isn't the same as "are we privileged
> or user", so we need an extra bit in the TB flags to distinguish.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 9 +++++++++
>  target/arm/translate.h | 1 +
>  target/arm/translate.c | 1 +
>  3 files changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e6f05e2..7d26357 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2291,6 +2291,9 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>  #define ARM_TBFLAG_NS_MASK          (1 << ARM_TBFLAG_NS_SHIFT)
>  #define ARM_TBFLAG_BE_DATA_SHIFT    20
>  #define ARM_TBFLAG_BE_DATA_MASK     (1 << ARM_TBFLAG_BE_DATA_SHIFT)
> +/* For M profile only, Handler (ie not Thread) mode */
> +#define ARM_TBFLAG_HANDLER_SHIFT    21
> +#define ARM_TBFLAG_HANDLER_MASK     (1 << ARM_TBFLAG_HANDLER_SHIFT)
>
>  /* Bit usage when in AArch64 state */
>  #define ARM_TBFLAG_TBI0_SHIFT 0        /* TBI0 for EL0/1 or TBI for EL2/3 */
> @@ -2327,6 +2330,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>      (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
>  #define ARM_TBFLAG_BE_DATA(F) \
>      (((F) & ARM_TBFLAG_BE_DATA_MASK) >> ARM_TBFLAG_BE_DATA_SHIFT)
> +#define ARM_TBFLAG_HANDLER(F) \
> +    (((F) & ARM_TBFLAG_HANDLER_MASK) >> ARM_TBFLAG_HANDLER_SHIFT)
>  #define ARM_TBFLAG_TBI0(F) \
>      (((F) & ARM_TBFLAG_TBI0_MASK) >> ARM_TBFLAG_TBI0_SHIFT)
>  #define ARM_TBFLAG_TBI1(F) \
> @@ -2517,6 +2522,10 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>      }
>      *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
>
> +    if (env->v7m.exception != 0) {
> +        *flags |= ARM_TBFLAG_HANDLER_MASK;
> +    }
> +
>      *cs_base = 0;
>  }
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index abb0760..f955174 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -31,6 +31,7 @@ typedef struct DisasContext {
>      bool vfp_enabled; /* FP enabled via FPSCR.EN */
>      int vec_len;
>      int vec_stride;
> +    bool handler; /* v7M Handler mode */

What about a more descriptive name like 'is_v7m_handler_mode' or 
'v7m_mode_handler'? It makes your next patch easier to understand:

     if (s->handler && arm_dc_feature(s, ARM_FEATURE_M)) {

>      /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
>       * so that top level loop can generate correct syndrome information.
>       */
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f28c4ca..f980cda 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11780,6 +11780,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>      dc->vec_len = ARM_TBFLAG_VECLEN(tb->flags);
>      dc->vec_stride = ARM_TBFLAG_VECSTRIDE(tb->flags);
>      dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(tb->flags);
> +    dc->handler = ARM_TBFLAG_HANDLER(tb->flags);
>      dc->cp_regs = cpu->cp_regs;
>      dc->features = env->features;
>
>
