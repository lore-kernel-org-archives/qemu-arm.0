Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24D4F3D33A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyCHK-0007oR-Dq; Thu, 05 Mar 2026 12:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCHI-0007nc-NY
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:14:24 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyCHH-0005LP-7h
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:14:24 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so69800615e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730862; x=1773335662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zCCGzmXjChzeSEjHhH3WqW1NwbzU5xzO9WxcoWWZwVI=;
 b=ThWYyMb+ulvo7OYD/4FO1xFVyEYZaWBuV9uGr/PWAvakbyESn7EcFHu4c1+cFpVbEn
 9uiDDKycoJz3zo+ssHCDOOqa8jin1dNnwSbOjIQ+6fwUFhZ3u6Kv78Gvu+dqmixP7Ci6
 MCZjIx31gNUc7KsBi3nbjGw6zXBpD8Ef0uhVL4qLZdTXE7JpA4K6btlqMXpOkxf91S5e
 yNfnqU9XqUGhvayq0YPGp6bS2zYX36SBpI8Edprc8mTkUo681XZAp47QbWXnDT6qjz6+
 LaiPSfCqVXwVpurQEabYiDKTGCFZ4H0+1lo1lMcKLk5XuugFCXOf5HO+bDbqt82CUN0y
 i6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730862; x=1773335662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zCCGzmXjChzeSEjHhH3WqW1NwbzU5xzO9WxcoWWZwVI=;
 b=MiKAlSAAFV3jaqfhOErPdo63bf3DSt2G7w+kzOkYUrj0CR2s5t47DPJERtqs3kxb4q
 Ra+eiK3HFBu2L8A5O0aKWpSg1YhW4EOXCMfTdN/3DveOQ/WwEReB+Kt0T5INnv/lJwQv
 r0YtXhlxbacPoj7nhLCjP5H0OS2pieKsYDn/ZtYot0mK6GPY6Snb6Q9Y1PiH0DLFK458
 8XQ52/SA+9GBGAGLe4ovJ/FJXjQ4EqLYrnbnR50KA4PMjFPviKYKjrw9LjlzlmuIk1pY
 o0dhV6ytU6Dga4KaFNaBV0swfxbTsR2g7xHujIs+Ui8gkdOOJQQUp0LES22xWJKYT4ql
 NFlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZYOOFL7MzniEeiW1dn3GMAoHF+Hu6GVi8oYTsUlB1E5I5R4cyZf0XKyxiC6SnJLbPQ+NSqYxwSg==@nongnu.org
X-Gm-Message-State: AOJu0Yw2Gsk/TvTVrRESJU/voTceeEl+A2+GyeNPoYHN+ql5CBqrupaq
 y5REjzB8nNqAqQOIwBvMkhQk7s2Zpq1EaIp/euE6rxmxpRQz6iYf4XgBNpfh276z9X4=
X-Gm-Gg: ATEYQzxao5Tx5YCfl3aQMJ0f2K2aZ9uoWNOAUVrt0tiNiN5iLh5H1yUfPB2ssqUl34+
 KBpx/dKlxHzpBgEC0xDv8vYHPaWR6C0QqRwpI3udVLGt8vI54p663Hq6t1MKGFAjtgVMDT7iwIx
 0a84eM52ajCUVJ2OWSiZ8H1XqsFRy8mSBHrmn1bHOaoIus9o0H1+/z3d3nA1c1pvLrr7npqt+bL
 EK3tbswo+NrCgsXMjoui3NACuCyM75j1lDjHEO5RQ+uRejZxB5qkABYSJmvhrszh5+DMsjdP95l
 YQIeothBwrZ6U2bJHBkL0FSssL5nN/Yohu33eFVzyo+MuwrNu0bo5ClHMMMrKxwO4HkFeuJ9mA5
 k2x8VQ9d8bqnFNTw2aN0A0Ijz9KFFCiWhZ++HY6zDnoycqVmiFBdHH7/0h1/5AQo5SPbrbYvS6J
 1DiniVimgPPHHO3g9HQTDVikmOS//dC3zhk49A8xLwby/kpWy92udnEJicrSw/ncJL9Q==
X-Received: by 2002:a05:600c:1d09:b0:483:6f37:1b51 with SMTP id
 5b1f17b1804b1-4851988366bmr115807145e9.23.1772730861805; 
 Thu, 05 Mar 2026 09:14:21 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851a8955c1sm53950375e9.1.2026.03.05.09.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:14:21 -0800 (PST)
Message-ID: <94b17a43-19ac-4497-a216-7b114fa9fda6@linaro.org>
Date: Thu, 5 Mar 2026 18:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 04/12] target/arm: hvf: instantiate GIC early
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-5-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-5-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> While figuring out a better spot for it, put it in hv_arch_vm_create().
> 
> After hv_vcpu_create is documented as too late, and deferring
> vCPU initialization isn't enough either.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

