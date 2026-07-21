Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F2C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 16:02:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmCvZ-0004cC-WC; Tue, 21 Jul 2026 12:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmCv9-0004GJ-97
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 12:02:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmCv7-0005Up-Qo
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 12:02:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ceab75934dso121734095ad.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784649732; x=1785254532; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=U2ZQ9DJS9qNf8FD2TLAj2kuUKlFDI/4J910M6JGMW6A=;
 b=E9tOZ0DoCDwYDh7aQCQO8bL6kV9/SAXcam7IryoOY5pFJeN7YXc35a20D4pBuu0+ho
 RVPb0F9LoXQgEwMq1qPaG9HB01Sw4SAWtfODlIqReLvVYH6tPcY3zL2psWbz8Gg9/5MB
 BG14yByFORJ5v1/6P4vEzoGhI08SyNmroM1sbxLzKDn/xPSxSf+JxSKkfb1DvsLtFTuY
 /ogNU8k2YLPR3VWPLnm2T5aFyh71Xz4O//pluGmg3mDagt+qDmQia8xact0+k/GnM/No
 hkrsAAqqzzcbX9xr/4di5dOeqnoklmOmjLal1/6d2oKHdraLiSwCuA7F60j9pcbIJgCz
 pOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784649732; x=1785254532;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U2ZQ9DJS9qNf8FD2TLAj2kuUKlFDI/4J910M6JGMW6A=;
 b=emNM47GWcpW3vWZkmQT7+TnWl4l2MapHmDbNnlcNxqvhkgKr9nwZGoHH1QHRWGjpvp
 in4Bod0Ok97ZNbNGapXkRW0Nc9II0v9QJ2AMANOrtHMvLjfVgQ4Cins/dBRHQA2HSesc
 8Fgv3Jn0gzGpyaX+KdmOWutcZ58ew0yF91MarcbHLBGYtQ5SQz2o3nIKR/yl7B4kTUk/
 vus04Gy86a7l0NLVtzZAgGCsfswJkQuA+d+ykH/wUGsLQvtYydQ2uG5i2PFumJDmUgUx
 ZrFPCQE0cZP50oBcE1+SkC/L+rP3K33uiNC0dCNJfkWhVyv3vF0S7wRqxoEXXASp5xbg
 //yA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrd846ZmhWc/RgL2Dg99ihHp3pp06x0Js73sSFha2c+ftthvLdO/khNUsHy0Rb1mTzzu/bakblRNw==@nongnu.org
X-Gm-Message-State: AOJu0YyjT5PDwob4DPdXw5CgZIpYMJbc7W8B/I32jAx3UnVHq4ce6SL/
 8OJo6i99cQbRMRTM3AcorHDlzleQ/rpJG8EZoepy+9L+6xMqJcQmpV6jFn5QJgACi28=
X-Gm-Gg: AR+sD13OUXUc5yIAL5JXtLicFLqnFNoXA7zHF4b2VVjrhYJ/CKfy2sJVHO8qxYNPEyC
 wTWQaPt2QHC3VRVQHS5gJRLuLb5Ua+/EogorAlQ6e6nu0wHybIRXw5cWMx+nMmSvvRLP1Ez+11x
 1wIy1/AkoaMV5R0Pf5pd5BqE6Gyi2LsYyr2QuzD3KbAmbL3k4Mpo1KaG/UJjOpGvxhB1paO+dbS
 tcdK17DBM7yHLer9w15LxHE7hGJA5KxYgwQaw78jBYLKgMJCDMxQ2QHnpBDtJ9myXFQX9/woFdc
 p03BA8T8v3DpAj0QQk6hRCDOC2WfWCCq/nDCCJ2fY0OYkz08x45jbrDi/9fdlfXQ0ZtDePbx7ar
 YKlav6t7nhXdaVPGsjhmwTjGJ4HWuwRY47kOQoFYUezmi0a4diRdLhXpMniQecDHeuT/ceRPMz6
 b2HEH9zDKwaGe9w18=
X-Received: by 2002:a17:903:8d0:b0:2c9:97a8:afe8 with SMTP id
 d9443c01a7336-2cf34a05d61mr206119985ad.43.1784649731743; 
 Tue, 21 Jul 2026 09:02:11 -0700 (PDT)
Received: from [172.20.2.34] ([32.140.233.50])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf3448db72sm80697505ad.1.2026.07.21.09.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 09:02:10 -0700 (PDT)
Message-ID: <ecba4c75-c1d4-48bf-b8c3-2bc7cb8823be@linaro.org>
Date: Tue, 21 Jul 2026 09:02:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] target/arm: Build fixes related to GICv3/v5 and hw
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260721122135.6288-1-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260721122135.6288-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 7/21/26 05:21, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (4):
>    hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM / WHPX
>    target/arm: Add stub for define_gicv5_cpuif_regs()
>    target/arm: Only compile gicv5-cpuif.c when GICv5 is selected
>    target/arm: Build TCG stubs as stub library

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

