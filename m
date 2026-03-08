Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA33EA852A
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 15:30:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzG4w-0004KP-8k; Sun, 08 Mar 2026 11:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzG4p-0004Ib-0z
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 11:29:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzG4n-0005rp-LQ
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 11:29:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-480706554beso120075115e9.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772983792; x=1773588592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfB2u8eoG1ydvVGb8ZGozC/G0yzDcUpwoYNq228hqJo=;
 b=izAEj/XX3oDwypk6dlx1kalJfWqRMsc5TwwRB9HpWLuvZtn40iLDDzIZCv6+gVB9WS
 /GNgzc8wA+k9Dw19IbzXbahzkMDV6f0Qv17kD1hbH64lYsrkgt2rz++P/tMSShD/WZpp
 Lfwkp2Zw92o99GHFarwlqvsCDLYnZWrJ9tf7ETGScMTzetWiniJ4PJnbeRv+lrmizHVE
 iukhwIH2JSd4opaQLV46OcTuhY140FFE03I45VDHfPV2+zGOoYGE6tjaQOqVL9lDgSNB
 p22imrWh6TB65FZCxLbQFzPI89+AGmMkD6i4Tajz/rfsmKBWtwPFhug+U8gn/rZOEOAg
 MrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772983792; x=1773588592;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xfB2u8eoG1ydvVGb8ZGozC/G0yzDcUpwoYNq228hqJo=;
 b=IuVSDb4jHH7d1GzHdjHKgVsDAb2B2MXTygXz5pb4CWUlr9XcFeySzMXgKShmFQ73x1
 gDFwEYfU4FDBNhwphpF6kRhTIgrKAVuUgdgPADhONPsLqrmEzqHmUUUVDMsOcfaNDchy
 x/z6yYC6HJIJZEheka6au+TCCRUevjGPRLAg++4qDuUwwSE4we+RQP9kNnBJTWBfcBGV
 WZob6zks7WoLnzmGT5kjXMWAJR84Rxz/trwG4xszjizFDYhXG5EZgrQmcNBnwBweZirb
 sYeEiydrIRmqzqGyy12kKoXlfZrkmv8cqViVCJO6dg0VxppnhzZxBJpPVCwx7dAcsTnF
 813g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzxXiyH8PksqSGM59FiMqprI+Y4T0pqxySEMSvXtGdqdFV3yUL4Kk2tgMTYbD9jV/YWC6483K6zg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2zeJemAWEUnCS5DcbFPR210vV0majotJEKlZohff/U1GuXZo1
 pmK6BeTyP7CG9+kKOjA1WPpaf7KRYowdghyOO5e8TsRfyOv2VyFhOAlCyEM7Xi9p7o4=
X-Gm-Gg: ATEYQzxe9YGQMYU67l1Lt2qOV9S5+Fn4JJ/hFjPFXfl4sZeHvAa1ea6Pik/6zM4Tf3g
 vmZTX8i3lRtjjeFXjyy3W/k5C3FXPfQnxEcIgnQgmhwDJ//uoEBLBd5IhsOwC5Y2CQBdBcUe+sA
 hyA5eXCxMIQBZF0He/AgnC2gO5h2zuhNZDNyssBBZeO4pUaigTyGEE9fEtpXbIOAK+4E0Ik49bf
 TQdXNKlnwnXKDJ3ajwx00XA2rSAT/zg9iSR3eSqzbQNwN7eKKD6r5ayNCnrq84M05gW5nucTHJa
 nFnkXVOrYfGFTWOb8G+NhglcnYBlZ+8UH5GM70Gjya/RFW+SJJb7jo1xQ0S3d89w9wI43hMAgWz
 7HOkWtS3X+Ztgs0iYcEo5uoVabkSsme7imYfIoBUCLi7e2homWKx9qnpeF1QPKBigeG10HovRcR
 KdtdNnS6SALoELNqNFdqwyimuNhCmPflj60Kt/0MyYRL2iJx3Xh0malIWzz+3s5Dxyww==
X-Received: by 2002:a05:600c:b93:b0:483:badb:618e with SMTP id
 5b1f17b1804b1-48526923941mr138173785e9.8.1772983791590; 
 Sun, 08 Mar 2026 08:29:51 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48535863e40sm72248015e9.14.2026.03.08.08.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 08:29:51 -0700 (PDT)
Message-ID: <31c5f7d4-6adc-400d-87fa-d1e784d6baca@linaro.org>
Date: Sun, 8 Mar 2026 16:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 05/13] hw/arm, target/arm: nested virtualisation on HVF
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Phil Dennis-Jordan <phil@philjordan.eu>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20260307180330.75168-1-mohamed@unpredictable.fr>
 <20260307180330.75168-6-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260307180330.75168-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 7/3/26 19:03, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/hvf/hvf-all.c    |  5 +++++
>   accel/stubs/hvf-stub.c | 10 ++++++++++
>   hw/arm/virt.c          |  5 +++++
>   include/system/hvf.h   |  5 +++++
>   target/arm/hvf/hvf.c   | 42 ++++++++++++++++++++++++++++++++++++++++--
>   5 files changed, 65 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

