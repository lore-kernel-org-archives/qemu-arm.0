Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp77701ejt;
        Mon, 19 Jun 2023 22:29:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47OZrGZFproPhy9y56Jkc/oXHJ5mqU02aW9ORhUteOjhq/K8CPcgAzPApBGdCAoStvOVFS
X-Received: by 2002:ac8:5dd0:0:b0:3f5:2d80:e5f0 with SMTP id e16-20020ac85dd0000000b003f52d80e5f0mr14964553qtx.40.1687238985293;
        Mon, 19 Jun 2023 22:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687238985; cv=none;
        d=google.com; s=arc-20160816;
        b=naFE8j6gM+Zlpswf2Dp4Mtk7v7sTQH7KXsSWLKt/wsMK004LtcRdnxiPqvUP6QgKEg
         EtXzrJ8JxByGNBCe7dwcuM0fYdhtvJescIf9Q/jehO/iG1ca8Ua4F4zFhcbxuvERNlth
         VxpdugqjUh/MBxt1UHWhG4ieVzdjYbk2av6IQDHSKb2bssGNR/IV9YFZ8s6NEgv0j4He
         oc3VshgwFTZvGzWyZIO6Az2I93G8d1Z7uaHQGAH+fntQMofqdDfDplNbrKhVD/9ungFt
         bKrG1drf/rqKbYcEMmg/7UrLYTHHXsFk2MoJBBj+L+c+0XgnESy45wX+fK6vBnTiNX1+
         FW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nUNvLlQuX/1rUTR3tYvJA9ij78Oo4/UkdB8XUk4U0us=;
        b=nKSfzLQuz/6R/M704bW3v2E8T1gA1mW/ySpDTspHrZB5BoQDomM2sg0BNz59e+vDuR
         UU38BFeO/45TyTXc4A+VKz8LYTSEgotEaBqP/Kcz07rpT3tbgg70icZHvZdLHgX7WTWn
         Z/IrY7qR+wLEPvysxrk97asXgS8iritQ97hdYUwb7PhnqKQXtDVzF9Iw8WHIg1G5TkEB
         OEdKfaJEc+nSC2X5CX7UiAD+6ZkmJyKhtNkMKyVLRBSi4wRI9wfwuH03c+lVieMer/lq
         5dJbqxOMeGyVguHhY8hl+XziT3hwmyQcMDbBhfptt1RRpQ2Hu9BRRCgZvPpkGWS64Zyk
         OAMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDzRAS+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05622a04cc00b003f68b7f34dcsi476338qtx.340.2023.06.19.22.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 22:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDzRAS+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBTvd-0000Vj-Gn; Tue, 20 Jun 2023 01:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBTvZ-0000VO-LQ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 01:29:17 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBTvX-0006i5-F2
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 01:29:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9786fc23505so516863566b.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 22:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687238953; x=1689830953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nUNvLlQuX/1rUTR3tYvJA9ij78Oo4/UkdB8XUk4U0us=;
 b=NDzRAS+6NfMR7Ks6y+n9cP+6luNZfCKLG808MrbhUnMnOIXyANvyf22nFNyn2KSsCH
 DKxSJGszYCiC1ktmXJ3XEUeHmOLW/6jwtBrHpbEo5ZGtou/uRaBUymkDZb+k0+gM828O
 9K2cUN+Qylfi1VE/JjybMTDBt2hwiyAsqolaA2m9u5vQ83VutiI1oGjKlz6u8A9NVe0c
 swJE4+KRMj5uIwdfaZ/LddQ0ftVm261rwm+XBX8rwxqm12JjiMXYgFu536iBKusuAGzd
 sy32g+AGBhpcC9nVofVs8n9PLsjtGutKLrq57QJih1p3LGtWSNPG2IdfdrzRmAxUJPqd
 6Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687238953; x=1689830953;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUNvLlQuX/1rUTR3tYvJA9ij78Oo4/UkdB8XUk4U0us=;
 b=IQcBuxILdMeF1ZsTnF0jPvfdbwDLfHuqulQTTiGsJJo48QxlFC/0eqb4HLOU4fQ0P/
 16lnUjr0TiTGlpkmSYP9Yhw1DfU1EMpHbm4Pb9rSXTbw7AEwyMKguctUQvsDfcx1L7g4
 EgsaUt+JFKBOnX8luCmoM4e4EL4k6FeOLgQN/mR1NuLO4tPpicMWdTYkBi6/fSZfQ7AP
 1DhjCisD1+yknJnfsaTWtOmF1jmpRVlztlE8dRr42sNs2bzgxIBZ8CLp6SD4/Bi4CAVD
 lsaVhSQhUDd+YKiFjq5iyw+hVYepwF6guuKT1sVYLN86mcTf2b0ed9XPHMbo+38tGfAq
 68Mw==
X-Gm-Message-State: AC+VfDwfaqhA43Q9w/se2ymZFoLDc7TUUTaoZKx4+cfTtxBhfJLy5je8
 b6gmSTDe53UkIhARLpljrvPty6cRg83PnJQ1fu3ByQ==
X-Received: by 2002:a17:907:7e95:b0:987:350e:771a with SMTP id
 qb21-20020a1709077e9500b00987350e771amr8463390ejc.72.1687238952838; 
 Mon, 19 Jun 2023 22:29:12 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1709060e1800b009871016d520sm658791eji.42.2023.06.19.22.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 22:29:12 -0700 (PDT)
Message-ID: <6222171f-13b6-cf5a-8431-eb68b4e8b764@linaro.org>
Date: Tue, 20 Jun 2023 07:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>
References: <20230619140216.402530-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230619140216.402530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lyq/0RyUHMxn

On 19/6/23 16:02, Richard Henderson wrote:
> One cannot test for feature aa32_simd_r32 without first
> testing if AArch32 mode is supported at all.  This leads to
> 
> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
> 
> for Apple M1 cpus.
> 
> We already have a check for ARMv8-A never setting vfp-d32 true,
> so restructure the code so that AArch64 avoids the test entirely.
> 
> Reported-by: Mads Ynddal <mads@ynddal.dk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 353fc48567..706dbd37b1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1402,25 +1402,27 @@ void arm_cpu_post_init(Object *obj)
>        * KVM does not currently allow us to lie to the guest about its
>        * ID/feature registers, so the guest always sees what the host has.
>        */
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
> -        ? cpu_isar_feature(aa64_fp_simd, cpu)
> -        : cpu_isar_feature(aa32_vfp, cpu)) {
> -        cpu->has_vfp = true;
> -        if (!kvm_enabled()) {
> -            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        if (cpu_isar_feature(aa64_fp_simd, cpu)) {
> +            cpu->has_vfp = true;
> +            cpu->has_vfp_d32 = true;
> +            if (tcg_enabled() || qtest_enabled()) {
> +                qdev_property_add_static(DEVICE(obj),
> +                                         &arm_cpu_has_vfp_property);
> +            }
>           }
> -    }
> -
> -    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
> -        cpu->has_vfp_d32 = true;
> -        if (!kvm_enabled()) {
> +    } else if (cpu_isar_feature(aa32_vfp, cpu)) {
> +        cpu->has_vfp = true;
> +        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
> +            cpu->has_vfp_d32 = true;
>               /*
>                * The permitted values of the SIMDReg bits [3:0] on
>                * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
>                * make sure that has_vfp_d32 can not be set to false.
>                */
> -            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
> -                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
> +            if ((tcg_enabled() || qtest_enabled())
> +                && !(arm_feature(&cpu->env, ARM_FEATURE_V8)
> +                     && !arm_feature(&cpu->env, ARM_FEATURE_M))) {
>                   qdev_property_add_static(DEVICE(obj),
>                                            &arm_cpu_has_vfp_d32_property);
>               }

Shouldn't we also change:

-- >8 --
@@ -1431,7 +1431,7 @@ void arm_cpu_post_init(Object *obj)

      if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
          cpu->has_neon = true;
-        if (!kvm_enabled()) {
+        if (tcg_enabled() || qtest_enabled()) {
              qdev_property_add_static(DEVICE(obj), 
&arm_cpu_has_neon_property);
          }
      }
---

?
