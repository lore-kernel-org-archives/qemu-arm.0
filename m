Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038D9C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 13:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udqMm-0008ER-Bj; Mon, 21 Jul 2025 09:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1udqM8-0006bV-4c
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 09:15:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1udqM5-0002zl-1U
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 09:14:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so47771315e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753103690; x=1753708490; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kf+XdG7iIe8+bpTLSlmaVFkSVHrn4uHtx0yDTSte+YA=;
 b=DZl0GtwwOH0Wsqr3hNVesbPHtS5u9icLE7h0MjipXiRTaiJDvJmj/p7kg21g8dj9gr
 JoEQFPlFgV0wL0lhUHFPVRqz3sALV2qx9d+E3c283ZZQ4djEWy64hkWa9ueNL1RxfsxI
 5UmHiN64M0XgZ8YLHDm2Pvq0JhR5hlH7TN2/xY1aGDue/qGhjmqYUmDQ94mUtf3+4FQ5
 7T2aXCS/Qu0FHpPFy+P9gpxhqU9Y8UIex/jDaybfpziojtWqHwnAm5uSF8EzW4F70JRm
 HUPxPPyla/akLh6I/yrrBnF5BwhOvOh1vJRT/p/Sv1fxuJi/sHNJ74yWJuDMqJ/ixM7v
 L3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753103690; x=1753708490;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kf+XdG7iIe8+bpTLSlmaVFkSVHrn4uHtx0yDTSte+YA=;
 b=EFEwxbqCtrey7VwjWQVJ/o+URfPzJo1+6GptFiF/kpW6ppi6gddpBrRHo1scitYmNJ
 70CfT1ZJfX2xsy9w70manhKv4t3lhkf8CZLV+otplEmuojfWsKuVoko6yvBzivBhqah3
 iAOXV0RwycqkyeEz9B+PuY4k1HY5NCr00GVva+Bhld+kEdQGd3w476Wu567YTohBm720
 8JqMf5vrWCrQ/8UfRCZ2/dQI+oILMrNYh0jJ7RLbHfBzi2XzgKbgqHCNL2CXH8pgXz69
 zZYhiWHVCjgJx/fs/3coY6QfNfevhOvFl1clr+kHfhZOc5cF9JSKIXK/ws6Lg8yGZmGY
 spUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYvzmsYHm4bMq1hTkKM1b647tNsjzpKJqP+viYJmfxKCtTbhznRzAAqMVskrMHyH4RxntOVFgvrA==@nongnu.org
X-Gm-Message-State: AOJu0YyY/ZjZjNDFrtnCt7JFKlvnuuKzozfshRSfoCLn/IaomIg+Sj82
 DUE7EuoHTEtXgucLjjtE8/aAZsQwhxcchnQ0jTWi9JyYUanLa+rN8hK1qgPXNELvv68=
X-Gm-Gg: ASbGnctAc1Kt4LTv6y2jW7IQ2XGD5Acrqn1ZWUnc73iSFrCVxokiMLWzF1BgUPzCJeT
 0gpUYKLKj2jt8H3uWbohND99bky4uoMv7Wh8Pg4vAhka6SKH3lCxicEsrgwjG2cET1TcVDHVDB3
 GMzDX2sA2KFeBMOa/1BN5g5G+FkM8h0UA1eVBnaHtX4MbWp+Gn0tJvukxw6cQJH2VI105Xag97C
 d8jJG0/sE3JpPFI5goqxEW1qTUTX/5093ibyaS/4Tifnn1mK+TMDpDF0ejr9dxlMJv0WngIqgtZ
 KbnGAgey8Ry0q+RoRq3VZgDtPCL74UKbWREG+G0fGE7oEwYcEEx5VzHFmL0kGjyKiCvpxECoCNp
 Tg0mUqBkdOLoniJXVvRJIYWlcM66mdcAApmfnfBlZqkHVRLd+HOEb1Y/pyx53qSiHKA==
X-Google-Smtp-Source: AGHT+IGp8cF4Ch+abhZf42ykFePGlBR37Nq0DJxMFf22JspVrjvJ/sNsO47ZExiOTRsZE9f2W8l33g==
X-Received: by 2002:a05:600c:450f:b0:453:1e14:6387 with SMTP id
 5b1f17b1804b1-4562e3cad06mr174260075e9.32.1753103689815; 
 Mon, 21 Jul 2025 06:14:49 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45626c7b1a9sm113104455e9.0.2025.07.21.06.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 06:14:49 -0700 (PDT)
Message-ID: <77d32915-e2f4-4dac-be93-626c3748379a@linaro.org>
Date: Mon, 21 Jul 2025 15:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 0/3] accel/hvf: Do not abort in
 hvf_arm_get_*_ipa_bit_size()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Alexander Graf <agraf@csgraf.de>
References: <20250716172813.73405-1-philmd@linaro.org>
 <CAFEAcA-nt-qeP5u=WyKS9pTWrpkDMTBPF241xKVsr+Q-noWtAw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-nt-qeP5u=WyKS9pTWrpkDMTBPF241xKVsr+Q-noWtAw@mail.gmail.com>
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

On 21/7/25 14:40, Peter Maydell wrote:
> On Wed, 16 Jul 2025 at 18:28, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Have get_physical_address_range() return when HVF is not
>> usable, allowing to try another accelerator if requested
>> with '-accel hvf:tcg', reported here:
>> https://gitlab.com/qemu-project/qemu/-/issues/2981
>>
>> Philippe Mathieu-Daudé (3):
>>    accel/hvf: Display executable bit as 'X'
>>    accel/hvf: Do not abort in hvf_arm_get_*_ipa_bit_size()
>>    hw/arm/virt: Warn when HVF doesn't report IPA bit length
> 
> 
> I've applied patch 1 to target-arm.next, since it's not
> really related to the patch 2 and 3 bugfix.

Thank you.

