Received: by 10.25.0.144 with SMTP id 138csp820620lfa;
        Mon, 10 Apr 2017 04:44:22 -0700 (PDT)
X-Received: by 10.237.55.99 with SMTP id i90mr49809427qtb.262.1491824662455;
        Mon, 10 Apr 2017 04:44:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c71si13109313qkb.229.2017.04.10.04.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 04:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxXk3-0002EU-Qy
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 07:44:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjx-0002CV-Sq
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 07:44:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjx-0003ls-0k
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 07:44:13 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXjs-0003jE-HN; Mon, 10 Apr 2017 07:44:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id k139so18734009qke.2;
	Mon, 10 Apr 2017 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=RJmzc7ql6rULuko7yi24EUdX4LjC75BMRvv3kTTsg8Q=;
	b=EMYbZrDYHq24uRIPtUKesg6cvfnVwd1hvjrohTyEQ45mtATogxXFaniMATHD7fpj7S
	O4rObNCp6yV4WI6oR7xKX3yROEobJbLcpKJ3KBd9FEYEWRmEWrG4NDtPriq84fsVNIJj
	wm0RpiHZVnw3BFRprKqkQM1zzctTkZAmK5pSsW6gmGELa8PdzcJu6xZc9K2CWvP+vyrT
	YQ42Ij/BAtUYInMiDyU/nVqPT8M3VKY7/9YixWEMX/y6vaIDotrFUFpF1nJ6l4t9NGm0
	wWqL2oOrDuOqI/7KistlpN7JmbjBrl/axP+dhm9jA2ztdUbhl5/bUAIhPyVERiZitl7u
	LUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=RJmzc7ql6rULuko7yi24EUdX4LjC75BMRvv3kTTsg8Q=;
	b=FDKCQeRCwguw6j5xIRZUyGn1igY4Kke0Nwuy9dsdZVan829+7X9EhIEMTI3d8qWOYS
	IqsZ44sTq3Uls6gGsI505BbA/bJCUH+1ItAnHSSvArwgkBT1cZKwXhyMXPvfgIp2wOLo
	MbkM6jKZMp0W13tU2sqIKpSqb3Ypk14NVUlWq9bxz+33MU6YkXkAqRU4rYXUFCqlDnA4
	w4lfvoqXC5USQ1vg4pYto0beq+yWIw1UbIN2Xf+1lXc4q4bnXaJQOak6bmYQN9WEHXjS
	ZGc7YCGRB6gYlnfRUaC5jXF7pA05AStDaBi8lTFGfYgca9HYiyoG60xg3tcGI5xXIeWX
	o7zQ==
X-Gm-Message-State: AN3rC/4lSsCC8Sirow6puCokcYx6ncLCjrNW0vDAHQs+gn/NaJLCl53pGknjzMkkvy2KPA==
X-Received: by 10.55.155.7 with SMTP id d7mr12472639qke.320.1491824647903;
	Mon, 10 Apr 2017 04:44:07 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	k133sm8615457qke.25.2017.04.10.04.44.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 04:44:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c4534e1f-6dc5-e6da-92d3-a303e85e95bb@amsat.org>
Date: Mon, 10 Apr 2017 08:44:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491820793-5348-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 4/7] arm: Move gen_set_condexec() and
 gen_set_pc_im() up in the file
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
X-TUID: Z/Q+fHkjx2kE

On 04/10/2017 07:39 AM, Peter Maydell wrote:
> Move the utility routines gen_set_condexec() and gen_set_pc_im()
> up in the file, as we will want to use them from a function
> placed earlier in the file than their current location.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 870e320..a1a0e73 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -893,6 +893,21 @@ static const uint8_t table_logic_cc[16] = {
>      1, /* mvn */
>  };
>
> +static inline void gen_set_condexec(DisasContext *s)
> +{
> +    if (s->condexec_mask) {
> +        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
> +        TCGv_i32 tmp = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(tmp, val);
> +        store_cpu_field(tmp, condexec_bits);
> +    }
> +}
> +
> +static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
> +{
> +    tcg_gen_movi_i32(cpu_R[15], val);
> +}
> +
>  /* Set PC and Thumb state from an immediate address.  */
>  static inline void gen_bx_im(DisasContext *s, uint32_t addr)
>  {
> @@ -1069,11 +1084,6 @@ DO_GEN_ST(8, MO_UB)
>  DO_GEN_ST(16, MO_UW)
>  DO_GEN_ST(32, MO_UL)
>
> -static inline void gen_set_pc_im(DisasContext *s, target_ulong val)
> -{
> -    tcg_gen_movi_i32(cpu_R[15], val);
> -}
> -
>  static inline void gen_hvc(DisasContext *s, int imm16)
>  {
>      /* The pre HVC helper handles cases when HVC gets trapped
> @@ -1107,17 +1117,6 @@ static inline void gen_smc(DisasContext *s)
>      s->is_jmp = DISAS_SMC;
>  }
>
> -static inline void
> -gen_set_condexec (DisasContext *s)
> -{
> -    if (s->condexec_mask) {
> -        uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
> -        TCGv_i32 tmp = tcg_temp_new_i32();
> -        tcg_gen_movi_i32(tmp, val);
> -        store_cpu_field(tmp, condexec_bits);
> -    }
> -}
> -
>  static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
>  {
>      gen_set_condexec(s);
>
