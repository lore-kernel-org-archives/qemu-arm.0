Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFE6C44506
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 22:07:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vigM5-0003J5-QX; Wed, 21 Jan 2026 17:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigM4-0003FI-Lh
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:07:12 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vigM3-0006VO-65
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 17:07:12 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so2564765e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769033229; x=1769638029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54Czg5iL52ePXQoh62BByo3ZdrqoQXBt3xWFM9bWaqA=;
 b=Ux4eqRlaOHaYW8DS00Xy50BG1R+rcaZEFAHR7iSfF7oUpMU7Y2UVJG93hEjnIh241r
 oxGc0JYbVN1Io9J7S+zxHAuJicBeWqTHbWWCgw4pSjoDb9yHSOq3Jxw3QIuOO3DsqTv1
 xFUgyvrxIfjBrdvUtCFZ9wdDETVfk/8cTXSXkH5Yesz2fNYjo9NhHFIheOEinOKaIBOg
 1e4tiat5q6R1Y2BCWJvhxiezTCxU/ImMRfp+WH/MtW43egh8HNTM0wpAGyNiK9cJcSsn
 OW0FWmHALWrLc1/ouhUJJfzcsJuaCOa8ZBBTePBApyqzLTw2OYB2RwKBqIlG6jZlRKRU
 om7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769033229; x=1769638029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54Czg5iL52ePXQoh62BByo3ZdrqoQXBt3xWFM9bWaqA=;
 b=VrUSSdTUW4s7oy5ByrmzNANgf2TBmjfiX8xzbh/m3eoJLbAQsQI2FZ4+ooPF1M5GrQ
 pq1ATJ7r5tSiiAV3L0agVfL+BHpo6TVRkMo1moqM2jlxAbA1X40Fs8jVsyD3XUCa5/Sc
 V7QmghMQfls/vC1ljyVvcoOAK8V82IXfoG9hdeJRNQh1eC0Dw7xd2RTMbYYIYAWss30V
 BoWE+vImvnrMsH7V1rXrvWFVQqQ2AuU6ipdwJQmrODlbVy5LT0Mv+tqX14+Ul6B41u1Q
 R4XJ4j6ZTksEj0swiYqklzPcO7YTEGIFk+FpkBQQGsn2mygk7ECtm4OOixJegywdGTMz
 Wr8Q==
X-Gm-Message-State: AOJu0YzKzZu9Fptl4oinaP2PtMC2mNN8pX/b8ZNlB0/qN+oM9xdQhR8z
 CUAzfahxQtg/hqYGzGvhxx0vAftt9hLLqMb2EmorllJJ/dx7xmt9NlkSW//WL4oF7IcK5IKk0M9
 Ueh2AH5o=
X-Gm-Gg: AZuq6aI/9tiIZpndjecXs2yzCHyU2cuNjh1wYXFY2I6VlgBMPGDi7bohsSow8By0dIe
 bPs5e0iBgQ2+GkkxvgTovkWY8QZp9TkiNV8y0XxcMl1Mqnx2802XSohvORi3kDIlmQfBJyPYbSk
 LTE/8IEHAbhmny51xoVCFvrG4jr+SQwz9sxWbc9LaJzHAi03xJjtTYtrVGHxHCShGXudFOnHAMD
 njBRWB3N4XsNzjyP6euZLlH+vXG0Fb7tlLM6SRail2s563Vq9mn322emQ676wGbqeaiJST/CsvF
 5cOnw2yCgwIeplKesZVPmgal6Z1mw++TrSa2UZcChfK9plR/7sVspw152gy2m7wbR7c+3cV7YDX
 oLsOL6vHfgS7jYgIb/yWL8Xqlu660cB3IB4oQrdxx21KyQRxsyxzt08OK+KSR5ohj1qbKYCdGZ/
 2zjW8tBurUUGSqTCDlO1sjKeiFYeAR0QKp6iLqau2MmlgRix4YEHQiKQ==
X-Received: by 2002:a05:600c:4748:b0:480:1c85:88bf with SMTP id
 5b1f17b1804b1-4801eb10a4amr267819785e9.27.1769033229343; 
 Wed, 21 Jan 2026 14:07:09 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4359333b924sm12562224f8f.13.2026.01.21.14.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 14:07:08 -0800 (PST)
Message-ID: <4f570256-d3dc-4d19-9a46-5120bb5e3831@linaro.org>
Date: Wed, 21 Jan 2026 23:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/intc: declare NVIC regions as little endian
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260121105932.135676-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 21/1/26 11:59, Alex Bennée wrote:
> The NVIC should always be a little-endian device as big-endian
> behaviour is a function of the current CPU configuration not the
> system as a whole. Indeed the Armv8-M architecture reference manual
> declares:
> 
>    All accesses to the Private Peripheral Bus (PPB) are always
>    little-endian, which means that the PE assumes a little-endian
>    arrangement of the PPB registers.
> 
> This should have no functional effect as the NVIC cannot be
> instantiated on a BE system but will help the single binary efforts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

