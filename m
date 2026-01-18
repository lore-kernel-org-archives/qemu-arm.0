Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03521C9830C
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Jan 2026 22:03:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vharl-0007jk-Lf; Sun, 18 Jan 2026 17:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhari-0007gu-03
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 17:03:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vharg-0000P4-FD
 for qemu-arm@nongnu.org; Sun, 18 Jan 2026 17:03:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo28310565e9.3
 for <qemu-arm@nongnu.org>; Sun, 18 Jan 2026 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768773799; x=1769378599; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hgv2TCb53Yuj1iGRviITZXfy1CdbaMx/7OSQNso2nK0=;
 b=S1oI0z7LtlCQIhELK7uvW695ENeT8jdAKU5ajBwuyEO9qv7YHHG+BhA/ItTMoo5gWs
 OYcbsBAzjChJ4ZpKDdDrHRbAurkauW3YjHtApZPSVPs4oA0Fzb3BGt527cQJAIO+UiSD
 ZlIWgCkDyhIY+lMlp2NHtxvP77p2BVZva4WSxp5wGgLVKd265QK3HjovxWBnFMe/UBla
 d9bY/Psrl5a7MvsLkXJN6lhiUNWbK/SOPZ7xcEKqb/M7QJULlD1YVIANGjfe+8OZEvOy
 b+wiOW6Mf3iCzQd2pKd3xJppCWdygiV+r3cmPzSm0fnsLm8h0q5SYZpoamrK9/6HGjvk
 cAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768773799; x=1769378599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hgv2TCb53Yuj1iGRviITZXfy1CdbaMx/7OSQNso2nK0=;
 b=jHzJOwcJKiV21isIFMTRwgZBhaGebyfUaYSYtxKl8mtZjqQ6mlF2PR/3HI/dfXuHJ9
 W3ODYsx3KJao4jp8aj3x87OySuJQwygqZb01BSCrXcRtE5ROtSxI/7KFMtOT7aS7lA4B
 QbaQqwKF7B6sQZVfUGqqOfE3uId0RD5OZtaHkVeioeJDS3Wefrsf/lfvIZP8U0yY2Y5s
 yQl8dLWyMrCM6wlSgNkS1IbtIAQbF03UTzBOM9tAD/wyNwt4VANJ+MQbkhgW1p2S3Jkw
 16vvbzY3t9wbLoKJYmXP7akkTa/m9aiqUNCUCP4F3Y+IsDikoUSGiNah/d6Yz4ERLrLJ
 N0ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhgbrVG48uonc0NMafi4d4ecBjYelIy+dtoyl4f0hT1zBxOC0wn1aJ+g1wwvG36YVO25RqB0UIZw==@nongnu.org
X-Gm-Message-State: AOJu0YyVotSd79t7uE54n4R/TmQB9dPCfH1IgfNhN2kpzfO6PH2zBQw1
 ATur7mvv6F1EIpRq6P5YRl3CODNWW5/kLE4wwMYidaW+X4fb1OyQQpuZouqK3S+8L8E=
X-Gm-Gg: AY/fxX6esb4fR2vL8X3743kAQhLeipfwn9MquAbbNjM+j4BmiObOIDEd/VsC2bEf3/g
 8tsMf8oP2SXwRRPq7Fm1Lejo9x963sAxNDeWhZ2erlCq+QtyWx/HSNYnyIQiBCbbe0sUAqCIoX2
 gaYRu4NxNQELY78f7RmNZ/u5uFSrRGSDKrUvGqeSO1VWQ5lnTrTOTSiGSxqvdJTb8znKwg+6Dxq
 /IgCe8uFKdzz/aSIkbOrTNVhdoFjKROVQceGJRZT07gAUyJOEQZ6Ydsrr6bSzkAvVYPga6or0Bp
 Ki0g1j8U6KSaCh5aWDCCRddhjAtJomYlSW2Q1O497JDWAC9HGSLMKQXW/oNmsdpvu4mNkMZe5p1
 fw5eEZKtHnOcgyftH6heTDKvHa876Cp3HAD28g0JN48bKioU2o5Sr9BU7dazHKnyHnQyq287Cg6
 /ijbmdObWhmaoZLJNMJXD0kPU2Hu19ZF4q2fQYOi4zYQpMqwty/JGvbQ==
X-Received: by 2002:a05:600c:8710:b0:471:14f5:126f with SMTP id
 5b1f17b1804b1-4801eb142famr109060695e9.33.1768773798709; 
 Sun, 18 Jan 2026 14:03:18 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm65442845e9.16.2026.01.18.14.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 14:03:17 -0800 (PST)
Message-ID: <06ea18a9-e02c-4d5b-91e8-9f0fd1e8ac43@linaro.org>
Date: Sun, 18 Jan 2026 23:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 50/59] target/arm/hvf: Do not abort in
 hvf_arm_get_*_ipa_bit_size()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-51-philmd@linaro.org>
 <f7a2dc18-ecad-4487-9b7d-f85618fc2ba5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f7a2dc18-ecad-4487-9b7d-f85618fc2ba5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 28/10/25 13:06, Richard Henderson wrote:
> On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
>> Do not abort in hvf_arm_get_default_ipa_bit_size()
>> and hvf_arm_get_max_ipa_bit_size() when the IPA can
>> not be fetched. Return 0 (and document it).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/hvf_arm.h | 11 +++++++++++
>>   target/arm/hvf/hvf.c |  8 ++------
>>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> Doesn't this just lead to a nonsensical error_report, e.g.
> 
> -m and ,maxmem option values require an IPA range (XX bits) larger than 
> the one supported by the host (0 bits)
> 
> ?
> 
> Is there a reasonable way to populate an Error return?
> I guess this only happens with older versions of Darwin, because surely 
> we can always probe the supported IPA size...

I suppose (it came from 
https://gitlab.com/qemu-project/qemu/-/issues/2981). Let's drop this for 
now.


