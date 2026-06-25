Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDEDCDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 14:53:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclSW-0007lz-Ti; Thu, 25 Jun 2026 10:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wclST-0007ko-Nc
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:53:38 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wclSQ-0002Wg-Vq
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:53:37 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8456005a6c4so1567421b3a.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399213; x=1783004013; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pe8nWvLBfzygNZPWMRaT+tp07NOPD0PfoMgkrq0GbTg=;
 b=t3CsBC0iA6nCt2ZpXwN4RtEfRtJAhTb5DhI0rQKQoid9AbHx6WkaeI04IcTqapSPIk
 TNFLbBVlsuJeFVRJCXLYPj3GqfQBO0D5kUy8QtEp4Rv7vx5FbLZUCHRNsPVOgwjZ7cSU
 KLEclDd3YMe+Vgj71MLLfA3oXEFzY6vc7IFsXMZYf9zcKhF5heAtryvVp+esuAyWeUYv
 /7JKxubPTfBpOFfpUArZV6UqxB08LWGhjwPtOrf+Wyn9wh9DLZMeeQQUDl0eC3RTwv7Y
 HWJ8vdkJF7aaToF/pqIfPCIubLoMSzxqNYArLLIbtz2JRR9X0ltqZgXaP37ZlVMvSW+N
 0fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399213; x=1783004013;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pe8nWvLBfzygNZPWMRaT+tp07NOPD0PfoMgkrq0GbTg=;
 b=hsINnY6ltVURx38tlQDSW023XFJLcTdKMhtqxfmDT28IHxJTZ9x+VDr2gvuhVItox5
 J4Ind6RQI4l3z0qbSI3tmGMtO0WIwFZCb2QI0RnYQk+uqv6SDoo0QW1niLuJytH9hzbV
 7ncCXX1/HbDMRQTYguHi25T4veXF7+nPGie5R2QHZXBJIJxc4RpdI02LpitVu4uHYY/g
 E0r0/cKrmiBiIFXReys6uM7Ahv/c7iHQ/QGp05uNB25KdzhdyuRZVMPSjOjuIhgBVj35
 NpfPYEMn2Bkm6YQvFawMfFEMxDvpXW2nKCsqvq2H64xlQShx+2xzeLSNIWi0VkKwFt+v
 5Bog==
X-Forwarded-Encrypted: i=1;
 AHgh+RqR3Ybrc0DMZbqlFzeMzlifCJ1OXnOJseGYxHWFGz8iEj380zDJ+PN2OKR2I4lnlzgXLaiSGgQ9RQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+2cKEKO4Ej1tZbzzZa5/19VHfCFsnzVhHsGv2G+CWisPlM5bN
 noY9tR7vsCJv0WMbR6eBFKOFkLfi48UWzb7Ew/Ln6//DUGNyKLEtb4oRfnvjvKznIOA=
X-Gm-Gg: AfdE7cmD48UWC+O1aKJeGCItsnnqns+HluzNWDvsybWT1Nv7Sq0Z8ynq2YZTUhZvg1O
 1KqrRNAuGMJhV3tXMS6bE0Gfw8oSISd2KwRUMnXm6H5Rcy4afXp9giNE/FJ+Fa5Sf/3jKqXaI+o
 KiUwRw8Y/Cei08aRouIStihSX0B/CRLr6nZtIrcKKOrzTtQ6kO9uUT/5pXTY5jqziLkpryA34FP
 0QmNCwAattCeFJwnjKupMj5jIyOpQyJcyEIm3+7oKuZm9527AIVSlEkqxP08UvM0iqNuH3HyMP9
 YOarRXj444lOH/G5EVOcnOUcOgIUYrhG7kWubEJ7VhjJhH6Pw4Op3Xx2vXqsDGYIgZTAXwZmXMG
 p7OoTgTldfaW8ll34ipl5IMzRhUsW2Wfepl/pZ1HPOUg7V9mb5FoXBG2PDOBjzHPeHO554KStr7
 tw1pzv45Zqou/zvbN4m3WGc3r8WFdW+KMZKc33MMQ0USQn0hOqm7jJAhFrcw==
X-Received: by 2002:a05:6a00:1989:b0:845:bf3f:48de with SMTP id
 d2e1a72fcca58-845bf3f4983mr868469b3a.8.1782399213278; 
 Thu, 25 Jun 2026 07:53:33 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845bda73914sm621887b3a.10.2026.06.25.07.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 07:53:32 -0700 (PDT)
Message-ID: <5e16178d-a65d-4606-91fa-1a4700fd1ba3@linaro.org>
Date: Thu, 25 Jun 2026 07:53:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] tests/tcg/arm: Tests for new FPRCVT instructions
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-6-dc6cf8e512b6@linaro.org>
 <87qzlvhued.fsf@draig.linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <87qzlvhued.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 6/25/26 01:54, Alex Bennée wrote:
>> +ifneq ($(CROSS_CC_HAS_ARMV9_FPRCVT),)
>> +AARCH64_TESTS += fcvt-fprcvt
>> +fcvt-fprcvt: LDFLAGS += -lm
>> +fcvt-fprcvt: CFLAGS += $(CROSS_CC_HAS_ARMV9_FPRCVT) -DFPRCVT
> 
> Do you actually need $(CROSS_CC_HAS_ARMV9_FPRCVT) in the compile?
> -DFPRCVT handles the compilation.

We should need the flag.  If we don't, then we're assembling the wrong insn.


r~

