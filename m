Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208D5C44508
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 20:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viesk-0003mr-7U; Wed, 21 Jan 2026 15:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viesi-0003lM-MI
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 15:32:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viesg-00013r-Qe
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 15:32:48 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so3559695e9.0
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 12:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769027564; x=1769632364; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+xr/2LllmT1S3RTDZxTnLU3mtpnLJpr75Yd8uPrFY9M=;
 b=gMuSxbAvTteKzjb7RYVEzmYYPqdkBk92wEBRyjrjSYlEp0gphgiDJt5tdYLxZ3ao76
 Jt6otp9yw5jxgurwuXfBh0zbINv61uLVN12yE3mD/bNSWqhyK0ZA/moFv8Ko+bawXlAN
 okVaAvBCP46EbKLjTESOnOPyA6J16YZPOYUXnz4N1Z7drkZln02cZJmaUlC5/XP5zkAD
 Y5rSe5euoBfbb4+AeXdY087Z+IK8yQ16I2hGTNV+t2iMB0g0idm7gq5t5L3aEyQ3NIDf
 q8YQ3UENi8lCls4UaQOgXd1G35UX4zhHrve0+76d7MbKgogWr/4T9JKOtBeiOCO5urls
 0Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769027564; x=1769632364;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xr/2LllmT1S3RTDZxTnLU3mtpnLJpr75Yd8uPrFY9M=;
 b=iymGa9lp7aOH3gN38m1McDUMTnopjAaZvafpxLx+ffu81y7FlWXOq2lFR79bS6c8tI
 2+ZcpLQWqGKtlorpY61QwOo/B6D/rmb9rmhDziDh0BBIj9vB46ZqURuiOsooJZBbPqUp
 ylH15SqgXbqjiuyrCSxrA2+VdLybcjwHcsuRLRpnZfQhOuEwIyLB6pcylI2ugz6RnvA2
 snFbCxpKGb1znZndRVzD7BKpwBTOZmr04KsVtsf/T0fYMhYxWeZqxuiocr+Zjn82ie8L
 wuXMCKxEkfzD8ttTqa4z0YSgJDbqXfudm3L0OVianUcN//m0M3cTE8e522t4I4SqMUAG
 Bk2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqMwT9QfpdesDLRoJPTZP4coq9bPePwbAD/tUDCIdY0695+P7faSMIgoqIJVA7o862HE0lC+iQmg==@nongnu.org
X-Gm-Message-State: AOJu0YyyC2I+Uca3J9abvWdQAg3lFqCQFjsIJNOc7c9kQ9OU5LHqq+uG
 bANDtJOW0nOlCP+BXd2khJ5E35YxWMux6BAsbavBoeEb0o+b4y7uR3d4K0pN2fSnc2I=
X-Gm-Gg: AZuq6aKePnOO3/LN6tjhCtDwugnhgtTcO1NMpGHq16Ah9AF/LSGYD34V5LsRAUQM6O8
 9X5+W4qTB/mcWzPO311cW+zoLzM2DmWaY6+VFopa19vKXoeUqJjYEkoGfcxypROt5Yh2Iybry5z
 3mfyfjSt1+XZtWXAGZhyp897Lm+bIuCYOg7YPWoMpZ0bsp6rRK3ArqjglOxHcCVIX6BektfYvzn
 uuIAQr9dnpMDMANHt2FOz8Mt+5r4D6coVz5/N9zxDrZj99hpkZ2UYt5viLOe3PVGrTp8VhyXhsG
 ff62gJnDIRNX/AaQXv6FN9eJESA6snisXuEt3u9jPuD+N1wRlntCjRxbOTZYxanZ582EqKoSkcG
 oKSmc886FWeeODCR9RtsiqwbyI5l1U8HgtYqqZ4vrTMHLjxaASDJUCUB1rmR8FJ4wSgnYuEI3xE
 yCfiyA8shgA0gCURklWo9IeOwK/tc2Mztt3ceN/xXcjPPEgPs6SoJZ4PdtnkMWkH0H
X-Received: by 2002:a05:600c:474a:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-4803e7a2c6dmr109656075e9.10.1769027563701; 
 Wed, 21 Jan 2026 12:32:43 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae6f1sm12323997f8f.33.2026.01.21.12.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 12:32:43 -0800 (PST)
Message-ID: <fe7038e9-5675-43da-b75c-d7c316b14ea7@linaro.org>
Date: Wed, 21 Jan 2026 21:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 01/21] target/arm/kvm: add constants for new PSCI
 versions
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Sebastian Ott <sebott@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260121134114.9781-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/1/26 14:40, Mohamed Mediouni wrote:
> From: Sebastian Ott <sebott@redhat.com>
> 
> Add constants for PSCI version 1_2 and 1_3.
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   target/arm/kvm-consts.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

