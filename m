Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC34ECFD347
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 18:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNbQC-0004Ky-RR; Mon, 24 Nov 2025 13:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vNbQ7-0004IB-6c
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 13:36:16 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vNbQ4-0007KN-Qi
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 13:36:14 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7b9c17dd591so3925461b3a.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 10:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764009371; x=1764614171; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fQpYlTe2VGIgHDWUmv431DdYIP9a1PSDSntgiIVS+Sk=;
 b=ulZP4ZzH/u/O2fiBLVXTpdSbB7+0wqs7xlKKszBUSROts9HWCLn0W/OLP/sNHgvPiU
 6soMGh/aClxf4Uzrd13ZeJlh73LnkJdGL1JcAadBn5CY4WzEHm0RFsq+xDJ2vUtnh8S0
 squQeM78/lbUkpKNouzxOsC/I415dlZHHKJrNHyamcbIHQ5pbp1Kjzy4E1nl+CU0uhWn
 bRMcxjFYwg2Zk5QROAnQcJylE8lz/3qieyc1uEFyBXGxIbWgnB2oP1EgOriRYUEWsxdo
 fOcYyASdgETbsbUr+kp+15jLl7n/jLhUfd5+nJicSV4cTw7Sev8ivklS9wEGLQ24oa9S
 PsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764009371; x=1764614171;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQpYlTe2VGIgHDWUmv431DdYIP9a1PSDSntgiIVS+Sk=;
 b=KFb12Q4cEl9kpAE1gV2HlildwAkzTnqyIxZj8brG57H2jjX0kFGuYcyikOz+2FqLdQ
 ylisBQlQF9BB10XW5KtIQnqP8/Mk0WW9SE5paX14/Pp8zfTh/HMUfL+VBBO9lhWU3JYy
 8ZMOELfPveUwgBhTuVSor2AjwwVPzRKwfuycEGufkK5znPf8VUJbdmNKdHrg09AQYdHY
 JeVj5K/9yGki6z6jwGFSupMI9fVZgsu91chAN+Vw7rQQG+UfnQuy9fvckbw/5mFrnMBY
 4i4/miKkhICEspXQnds8pwZ7U99Z1t/3SeBbx4NDih3Byh3rEs7WJqGPNqRc5rVNweQN
 KkqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPsaGF+whV7JvcJ9cpVaVbQlRo5EO/4MPi8uNOhtmB2KG+3xd30SlAyj9Yjbs40E9kim97XmhkHg==@nongnu.org
X-Gm-Message-State: AOJu0Yw5pmLMydhjsQDWQFtbq0fYWJ2q/Pq577PsFlQDqXwkJxKIKeXP
 oHmY8c1E4yWPsphHBXjQ9WEIIjtCskftO0iwQkG19ILzTUgUh7KNxPaQ7uDmdcmNRDA=
X-Gm-Gg: ASbGncsmdmeos1WLRViygpWDLHchHQBOct+eUx4+F13kh+d/9e6r2cMV0U0zwqd5GFC
 8D8Ve97mOc/QBQwc09CJNLVzdzo0Gb33YT2wXEvPJYsR8huCw26tkNWoTid17ffpd3A03gj8kzT
 Q6BebO0MI8Df6BRz3IkzyvFUm/dW0Gr6I4+8ihmRFyIK+Ay6BlxNeB5VCZM5wQebE8aEDEDqb26
 Ea++Z8PqIGjT6geFkGP2+138N+6XRPifTEgrtjipwA7EHPOJ7oD/Tzq5BUKEy0lUKloU1vAIGa0
 JNMU8oVAdJSlAIuk7gGgwrJ3cEHsesRdRzD2q/sqPOz67YocOIT4qXkzGjlYsbVO2a6OBFHhG20
 SqEq+fOiDlexC9pHyviaoAMYE+0xiW+F6a4BNM1pDXwidEoM0/2jxu6YspX3knkJTecCBAUZq9U
 QRSnmYbbzBY+BEWIQ9vKLgAlAx7HMM5bPHCRtVP8RpNYehbDkfOg==
X-Google-Smtp-Source: AGHT+IHIiUD30cVG/dB5ouBgMLbebXnchXcidxvPhFF/4gYiPGQfNoPDdpTFE6JuX0wD15bltsv78g==
X-Received: by 2002:a05:6a20:1593:b0:342:f5bc:7cec with SMTP id
 adf61e73a8af0-3614ee83725mr15087277637.50.1764009371350; 
 Mon, 24 Nov 2025 10:36:11 -0800 (PST)
Received: from [192.168.0.4] (174-21-76-60.tukw.qwest.net. [174.21.76.60])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bd760fafe62sm13851136a12.35.2025.11.24.10.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 10:36:11 -0800 (PST)
Message-ID: <5b85f8d4-c323-46cd-a0dc-ac62e770295a@linaro.org>
Date: Mon, 24 Nov 2025 10:36:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/3] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251124070524.240618-1-clg@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251124070524.240618-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 11/23/25 23:05, Cédric Le Goater wrote:
> The following changes since commit fb241d0a1fd36a1b67ecced29d8b533316cf9e2d:
> 
>    Merge tag 'staging-pull-request' ofhttps://gitlab.com/peterx/qemu into staging (2025-11-23 11:46:53 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20251124
> 
> for you to fetch changes up to e9a8b04dbb98fba7942b23b3ac5c35f2f0b9c4a0:
> 
>    hw/pci-host/aspeed_pcie: Update ASPEED PCIe Root Port capabilities and enable MSI to support hotplug (2025-11-24 07:52:42 +0100)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Fixed typo in the AST2700 LTPI device
> * Fixed missing wiring of the SPI IRQ in AST10x0, AST2600, AST2700 SoCs
> * Updated ASPEED PCIe Root Port capabilities and MSI support


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/10.2 as appropriate.

r~

