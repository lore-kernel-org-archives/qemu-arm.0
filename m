Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1744274ejt;
        Tue, 28 Nov 2023 01:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHW3r9okTnTlzF9TxlA83QSLoSEUClF1FmLO9S9GptS1yyOOwtqOcA0SCeuTE5SnzzAnzqT
X-Received: by 2002:a05:6214:3018:b0:66d:173a:aca7 with SMTP id ke24-20020a056214301800b0066d173aaca7mr18308122qvb.55.1701163795752;
        Tue, 28 Nov 2023 01:29:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701163795; cv=none;
        d=google.com; s=arc-20160816;
        b=fBS5KLfG4yI0zekLk7yW4RTAjJdDknBasYf7bXeC2T6pVKHmMsvf6RNeE8QZyNQ70D
         SPCw3Qx8pKHbHQcSnOIyGMRsOIiXYN2sY90PCibUQjOG9i1sJQLvgDf1jb/uIAMiW4Zn
         jIjCUer41TAaCmVA7isChDYT4ZWw/j2n/oZx1cLYHY8O6Gg9tVw+32XzTpQ4eclECOdE
         jh0UvZIR4g+8HgQyTq7dpvcveTrNzcZSAO87jifLD6MwJJCCqxS1icK85k1hMor+2hXM
         3S0xHY+d8kC/k8Fv8cOmRCv2nFUZ9MqaTl/COCeI/Os2+VUN4U9VisL9531yCPRw3fZL
         FoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=du8yRDrQyafQjmDYUSBdE7OyJ1dquNjYM+twJVYf+lA=;
        fh=JevbGINOdgzHpobPeY6a5NX8AdTsHIkhwelypfplB/Q=;
        b=HE6jJG/mwst7mcC5rpQbJb3E1pQGBtEqLHcx3edit79ak0XmdNykq/wTZU3RSzpgPC
         oetMm4laBXHZ2TjSOJqv1xzKU1vvAaP4HnlU67QA/HLKyYIzbGPf4UAfNYRwittWgrBU
         2ZQQn1kQjERRkiHvs5YxXpMecv5Claw2SHRq/e3jdEbCYcGA8r57ucw9RbWja9C8vspt
         cH+tCb1EN+8u6LF6/LYQ6Sa/ReB7AN2XsLUipz0dM5pUFW7vR9I68CG3ZbaPDqDfkap5
         G1PNAEa+w9k3mzPPr1xnUBYjM3iz0OWkL0mhim+rEGk2e4tZxp1gbiqeMUUE7FDBcCkN
         olUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIFejMT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020a0cc212000000b0064c6b7d96e1si11293796qvh.372.2023.11.28.01.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 01:29:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UIFejMT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7uPT-0002ul-Vj; Tue, 28 Nov 2023 04:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uPT-0002tW-0j
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:29:39 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uPO-0000hK-4d
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:29:38 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a00cbb83c82so743164266b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Nov 2023 01:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701163772; x=1701768572; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=du8yRDrQyafQjmDYUSBdE7OyJ1dquNjYM+twJVYf+lA=;
 b=UIFejMT0raZE4kACA9ryh6IVJ5f3mpkwcxhX3KEhloX79HPKdtD53PdDJbveu78QYL
 Vc4WuZAROZ9b2m1Q+P51JN33qn/IotRz+gx3tKT8Xxt1Nkk9dVO/1VCYYaI3ErZDwNMI
 47tYmpfMxrt4eKwIomH0Q1A0YQ5JS/BpbpRTzIshuRe1Sr+/Dxei6dFBPQGnxLsqrYUN
 3zN8bvt+dMIF+0idcbzu/KYI0cKBgWvOF7wihkY0U0sjGBH+ubfuFRE4kvC5W+lJyykE
 Qqk2nabfQxUQE/gmuQaJpZB6VZ7Mlvt0G6ojyoiA8drg/AhwQ7Ub4D/psafZ6sBHwacm
 kcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701163772; x=1701768572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=du8yRDrQyafQjmDYUSBdE7OyJ1dquNjYM+twJVYf+lA=;
 b=j8/wHmvLrfC256f7QBIhsixQbiTHpfub23r/xMqVTtDVDX5C2U5c0numkjyyFjY5No
 ROQGMplmXafg+KgUDqcOd6z/RMNGcO4kgRRaJPzRHrLzbL1dz702uzbc1kQBOrcRRfs3
 fpDfndq8Kz0AHUPjve9wjSbW5EXF4njWHLkRYSWuUtG2vqmHmwCxk9ZuKnHro3rsUsSm
 H1BfddnCnrSBoIMWRjx/2h57HPkrsQPnHLR4dTgnF8mAvPR+1Y71dT401WCkxuvC2FtA
 mD0DvHS8e2fR6prcEvM6iigjwVu+gh72zbmdmflWU8RV8MDwpKhUfhJEPO1TtY8Y8sRX
 Qjgg==
X-Gm-Message-State: AOJu0YxE2UHnQJY0afPxzf52xHDvEpuq0l2fG0+mZOyTzut205QxbvFk
 xGJdjaZf25pWjJYzeuoZObzxSA==
X-Received: by 2002:a17:906:99c7:b0:9ba:65e:7529 with SMTP id
 s7-20020a17090699c700b009ba065e7529mr13204547ejn.68.1701163772119; 
 Tue, 28 Nov 2023 01:29:32 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr.
 [176.184.13.61]) by smtp.gmail.com with ESMTPSA id
 bw24-20020a170906c1d800b009fc24437439sm6580993ejb.158.2023.11.28.01.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 01:29:31 -0800 (PST)
Message-ID: <f3bf354b-cf46-40d1-89b2-35bdd5074840@linaro.org>
Date: Tue, 28 Nov 2023 10:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] hw/arm/virt: Hide host CPU model for tcg
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-5-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231126231210.112820-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: lGQn7roUJ00X

On 27/11/23 00:12, Gavin Shan wrote:
> The 'host' CPU model isn't available until KVM or HVF is enabled.
> For example, the following error messages are seen when the guest
> is started with option '-cpu cortex-a8' on tcg after the next commit
> is applied to check the CPU type in machine_run_board_init().
> 
>    ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Aborted (core dumped)
> 
> Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
> the valid CPU models can be shown.
> 
>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>    The valid types are: cortex-a7, cortex-a15, cortex-a35, \
>    cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
>    neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
>    cortex-a57, max
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/virt.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

