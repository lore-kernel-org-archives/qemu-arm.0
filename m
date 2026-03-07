Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6D6F5141C
	for <qemu-arm@archiver.kernel.org>; Sat,  7 Mar 2026 15:44:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vytok-0006um-1F; Sat, 07 Mar 2026 10:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vytoD-0006gD-A7
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:43:18 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyto9-0002gP-0k
 for qemu-arm@nongnu.org; Sat, 07 Mar 2026 10:43:17 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso95406995e9.2
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2026 07:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772898191; x=1773502991; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8bdIpUsSaDWT9yjEAOcaZ+kceZGFEszMZs5LMnF+b4=;
 b=plmG/IJ+JrwSyiHle0bKpuPr9SlHsZS1cE3EIBZlyluwt6CUvVk2x1oFdwRTaj35AT
 8hAM08qXuDrbsXBEJXXEjo9Za/zjAGbDcBDin7AIp5JCxGw8hqNExokG7f/7vSxxIFEm
 DFKLlHvi7wipWNqqxy3qOdPqGxUQ5HKtdZe8V9FIMa4HyseGW2Rd9e7ZuTf5sVSMhQjy
 KpyUj5X2EWAnTmV8yyZCxT93eRKevi0Rz9TlfVdTxIWpgnuEoFAbkcVWWZE72YpVk0e0
 HEJsmRXmN2puV2R+g2HOh/gGkHmn8LbKdNcoipY4LNJ+S/8QHHNMNDpZhP+2U0V8qNUA
 GE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772898191; x=1773502991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8bdIpUsSaDWT9yjEAOcaZ+kceZGFEszMZs5LMnF+b4=;
 b=aLdEMqAaW8ojHs872VsRlvWp1ZU/LFfj8H4ok1QmODLb0phVBPVO3aJ/DcJl/AQSoN
 JASqF3k4GAHnYsDfbP6OgvQZTcon+gRuKr0NAv8oA+5i8bG7Cuud8WDdkG+qB+yMjCKt
 jBqETaxq4d+24MwPqy+O67OThs1o2kdZWWDlLEw5n2DkwlceWabz4GdTAAhSgs4BMEfm
 YIihlAl8zPJpc+ExRMvwJslJYJb6fSqb3vix4XNbX/aFOYIkCkgNtEvrsvtGiJVsqCVh
 kXjGBizjxRfuRxGmLjEy1PEgLjF7ea38sRLPAMKdO3bX9QfqUz5xOz5CEYGtk9KaNne5
 nzxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbXSRZFRMJTPfSptAL1OFHcyMsFkB4YKTDnsVGlRLgt/hcRoqSG5DmHm9RMnuK8YMX3xh5fyv/tA==@nongnu.org
X-Gm-Message-State: AOJu0YzIiQyAB+qF6EORWncbG8wnzASpqHxVhqo+5HePiXeBmRIOugCw
 nqMrMDdYM+d0nrfy/GAjZd8ZB4OCHCzTxb5LdxKvgLesyeLTVONUxSQc0xWNLtDqSn4=
X-Gm-Gg: ATEYQzzhyokRMBl+6L6vT1TVU50WGjhyVEjXi3OcScpBzdeffNiKwwzHmjI7xythYsL
 7WHTc4qzKDZ8b+vWqH89kOZzs6uGYmWc8gOEu3wxZkyMfaEP5zn4ugXDc4qwySxpH07ZV5hjOIe
 jyKTxp4s6alknXdoKK0sDw1kMrcSDveNT0MGhB2rzLAMRTY0AFdyQplfS/TWygD0DJBi5G/bYKd
 AHbj1YfTFVNUFAGeBAW+Ri8ucnBflmrb6JXOvCHM9upuuakvrFT4QmUngbMXO0xPiwnpXV3yywu
 Y70Cf3yp0GN6voCBbhvgPV78h79oXSq8Lou1I7zw9Tj8Y0g1TmqEDi1z7N+j2MMOYfWso4KMozG
 /XgACcAkfAHio6OAjA/XtLy+Ow/jaYG2rNTOREHYAIqEH+vBSnPNYZLVT0N+WgGtXfSalN1xrqF
 r9bFvuTNDO5j6B81NsBH7MrMoyXsF9E2xvD+Kwd6WcnFXyaQrHdz33kV/zt4zZtJ8BZA==
X-Received: by 2002:a05:600c:6992:b0:483:c490:8c0 with SMTP id
 5b1f17b1804b1-48526923bdfmr96416755e9.11.1772898191060; 
 Sat, 07 Mar 2026 07:43:11 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b75eesm100159865e9.14.2026.03.07.07.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Mar 2026 07:43:10 -0800 (PST)
Message-ID: <4cdbd6df-cf0e-4fb1-8d23-4fe52b7dcf52@linaro.org>
Date: Sat, 7 Mar 2026 16:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 12/13] hvf: arm: disable SME when nested virt is active
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
References: <20260307153143.76893-1-mohamed@unpredictable.fr>
 <20260307153143.76893-13-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260307153143.76893-13-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 7/3/26 16:31, Mohamed Mediouni wrote:
> Currently, Apple doesn't support the nested virtualisation + SME combination.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 2 ++
>   target/arm/hvf_arm.h | 5 +++++
>   2 files changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

