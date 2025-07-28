Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960ACC87FC9
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 11:14:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugLoW-0001iu-SY; Mon, 28 Jul 2025 07:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugLCn-0006X5-Pv
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:35:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugLCZ-0005JH-QO
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:35:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so2850110f8f.1
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 03:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753698925; x=1754303725; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m95VFUGib0NpZG8VWEe3xtFFBGJsxBRh2pSLO4LmoRM=;
 b=cMwCivMwqPOtPLyG+WJ7/Ig75m/Bix1Pc9THa8xNtB9BMzb4irSlPoBtwv/bwii/W5
 3IraOEvCyKbOuOQwTT5pJNf1zWHHeG/iTWdMZCkaB84RVmA3vdjKhX19WCaqQYxUNqgl
 e7MxeDNJwGLev5V3a+YO2qZUHra7Gq9UXbAmZ3ELYqAqx+9ydxCsYAbaCUls4IlqW2Yf
 i6c/yl1ji4tOMtwXeKfZf9E6TlN2Hu1igr986WMG5Ez0AXGjwmiYl0akEokROz4JZTOx
 du3lhh6bsWNzJb9OjqtKz2qc2WyX/pJwoRCiwkLqMf1m1r7i9YC+I1zGNlG3HbH0dfwm
 UvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753698925; x=1754303725;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m95VFUGib0NpZG8VWEe3xtFFBGJsxBRh2pSLO4LmoRM=;
 b=kHWF67DIFPIcJZz5c0kkrJH3eeLBxCGCyRooYUtxHQxBwrc1ZideLIGIIhSKNTqf4o
 0H6phig72KcHiYVe4nVPyWYFmC2RilvXCSMa0joUEBt1OmeWQHmKjxZqNLEUXC9NmOWG
 QYVJdSU3OprbTtbl5rupeYos1NcvSEO3wuZaF6xe670r51my7s+w2P5hMNAUXauvFO1p
 QIVVa/C7YuGKTA3v6F+RsbE9MYHzuSgAp/Jyv0D/O8oR+oe8DHI/xr0Bqc07DGMK0vFq
 Xhvnopc7Kfx2IZz5fPWGg3U1gy31k6L71x64s0Lo2avrHe8OiYldj/KE0I4Rk0gKon58
 CXOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI8HBSnDJe38np43RgIYOURuzWCcFbR5iMu25Lo7jbpPu/zSPKzy4G/o5xd/kOMsCaDNRVp9E2pw==@nongnu.org
X-Gm-Message-State: AOJu0YwXX7pmI90/9lCfqx70BCv0+REgfmJJu0DsMsthWIvrceRvy9Il
 VIApUQjXV1mtW/SbwtSJOjR1zHZQgLa/KfeTLpkmNNmsriayVUyLrEM+Acs9Yh5xFl8=
X-Gm-Gg: ASbGnct8t+B5S26JgRkt1DMdpaanmpPx7AtdDa0MUEMNBggOSXo2oXqK6vLdhwzs4aN
 xLL5OsdZQ3EC/nml5yiowvmD3PrRmIwdksw7BwmEHgA3+/3/vk3RgQt5OQpuQKNm90E7+MdpsBH
 xwq3GWO5EhacxmP6oDjhWEGNBGa8VHaEiM8rzByLeHd7X6AAfycEHSvtZPUWgBO6kgl2Y4B/ugk
 O8IVtL/xeg7TXAasuo8dnbgCnnQqUbZmUdQ7rVPMqu6u8fqr8lv3SZgXboNvWS7s9YjiSi/SZ/C
 DO5WkJU2oB1C1YFYGDNMuv8MjBA46hbOtEWZIR8wz4H6gWV1E8LcUd+qRg9uzFL5AQOadO0B2nD
 1vd/R+gwl6XzKnZK07mESqZMVPhgnX0nMLrWCIdNGAkbYTJtt8HpL32rwR/OjoG1+izShH0760V
 Mw
X-Google-Smtp-Source: AGHT+IHofaA21vS+S+C+2knGRsAiCluJ1EAbEyNNslyC66ft+L8dYZESj+WOLRPBkZgm7zjEMwrP8Q==
X-Received: by 2002:a05:6000:381:b0:3a6:ec41:b9df with SMTP id
 ffacd0b85a97d-3b776679a0cmr7916574f8f.49.1753698925049; 
 Mon, 28 Jul 2025 03:35:25 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac584d8sm96948235e9.21.2025.07.28.03.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:35:24 -0700 (PDT)
Message-ID: <aa27f93f-5591-4a6d-879a-991004ee5db5@linaro.org>
Date: Mon, 28 Jul 2025 12:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] target/arm: hvf: use LOG_UNIMP for
 CNTP_CVAL_EL0/SYSREG_CNTP_CTL_EL0
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250725223035.52284-1-mohamed@unpredictable.fr>
 <20250725223035.52284-9-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250725223035.52284-9-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/7/25 00:30, Mohamed Mediouni wrote:
> Instead of considering reads there to be fatal, mark it as unimplemented.
> 
> This is to allow experimentation on using configurations other than the Apple vGIC.

FYI 
https://lore.kernel.org/qemu-devel/20250623121845.7214-11-philmd@linaro.org/.

> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index f5b82cdce1..c3df7e07e8 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -299,6 +299,7 @@ void hvf_arm_init_debug(void)
>   /* EL2 registers */
>   #define SYSREG_CNTHCTL_EL2    SYSREG(3, 4, 14, 1, 0)
>   #define SYSREG_MDCCINT_EL1    SYSREG(2, 0, 0, 2, 0)
> +#define SYSREG_CNTP_CVAL_EL0   SYSREG(3, 3, 14, 2, 2)
>   
>   #define WFX_IS_WFE (1 << 0)
>   
> @@ -1398,6 +1399,12 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
>       case SYSREG_CNTHCTL_EL2:
>           assert_hvf_ok(hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTHCTL_EL2, val));
>           return 0;
> +    case SYSREG_CNTP_CTL_EL0:
> +        qemu_log_mask(LOG_UNIMP, "Unsupported read from CNTP_CTL_EL0\n");
> +        return 0;
> +    case SYSREG_CNTP_CVAL_EL0:
> +        qemu_log_mask(LOG_UNIMP, "Unsupported read from CNTP_CVAL_EL0\n");
> +        return 0;
>       case SYSREG_MDCCINT_EL1:
>           assert_hvf_ok(hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_MDCCINT_EL1, val));
>           return 0;
> @@ -1718,6 +1725,9 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
>            */
>           qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
>           return 0;
> +    case SYSREG_CNTP_CVAL_EL0:
> +        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CVAL_EL0\n");
> +        return 0;
>       case SYSREG_OSDLR_EL1:
>           /* Dummy register */
>           return 0;


