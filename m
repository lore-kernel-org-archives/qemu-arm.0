Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182B1F513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:10:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGtR-00028l-8d; Thu, 05 Mar 2026 17:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGtL-0001eg-F5
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:10:00 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGtK-0002Kl-18
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439baf33150so3801018f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772748590; x=1773353390; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1QKRnEbmgre9i4rUGoRLkZOsFrhJM4Cj3PoaKHxHVWQ=;
 b=HOVpzcYHh+7pJ2//SVXiEFG+cTC6NVQYf9H6DdW4A/zsEL9XdwSUzD2HDJg6pnLIA2
 Uyck9FXhZwxBJg6GIxHHUyiiwHsxHMZUHG5UpOWlvb9/QOwXhtcz+AK/j1vl+eKu+q2B
 C/iBqL09sF7ZpFaPeFQfOAWXLJedkZiw96y+6ch1PPJRdAdtPH7c8Zk513FWzKjcejD7
 8ft2JrixVZif98GkpOu6qU4fsaiqRjaHbc7vgA/9CjCHU1UzlvnRP0puMIbRb1Eapx8g
 zds7L6p6BExURmGCn0Dq+1yXc4K7InCu+osdXowmVS49kBwx+Bkhh9oIPsh6MWiAXw9H
 nuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748590; x=1773353390;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QKRnEbmgre9i4rUGoRLkZOsFrhJM4Cj3PoaKHxHVWQ=;
 b=YsdeX2ixOP/T+xk6nansxaQ7IbRcqGomdDoWEBtAIUGx9EX/7UykE5y/p96fEUwkmW
 zO4Uu2FAEjKaqDm2OlpsmFxScY/ewPxpjIumwJoL/pMU7IvOrh+uSLNV2Bko3sF0w1Ih
 dAUP/B6k42CX8b9Nxx+betet/I5uP4Je19dFH+mFr/9w8eJL27KHJ1Jw63DEgvX5KksN
 D9WlnOQhbXbW5mrs7rT9Xj0uCb5qUy+/egemahGIHm6E7SzsOesCx5mZDTlu5450Aonn
 +4nI6P3AbAPA2PDnqFXEi4R1lbjd3R8dDPVTRfG9g+FQaUKxTq/kZMeLRrrUFTvh6Eqa
 LO/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+kkmI722dDLleg5KRVwJiFLSH7M5eDdQEGReqZ4QhVC7wt1va3dTLwjLiodkKQ6CMGCxSQFJ6w==@nongnu.org
X-Gm-Message-State: AOJu0YyIqZCC1/7PGyOz0jycY5It/O5PmnKjHfiUaBLMJdjN2yB0Q7To
 AoMcYZ53APZVE411hV/s5ddQv93tsDNA8+vcmgQz7C03+UjvkiPjRGibabji830nYuNjIkGvFWv
 uor/dHWE=
X-Gm-Gg: ATEYQzzO1TSC3DhC27XY4sfm7lKgHxChlEoTyraAD6Yt+1RlwntxycQaIQKFh6a6OuX
 z6+gryXSC+T6xk477F62ufTczHhlW2jqmhJwTUqc7uWHmXmMXm+iMI48w4UP/FOUja1QyxgG7BA
 acFgzicX24Mc70yLIUHi5iGZ8eJEAVqC4OWHUNeJrCS/S8pjJr6xW7UrnY6BDJjLynzXWwalOoC
 SHFRmtLe/cQ1mTAqfYqANtt5GswNLil2m9QI161RseC2sK2+NnmlK3wQNLvqhHmZlyIjHgsJ3cQ
 O6ZtQQbddFrJ84TBuXzR6IKEixjuRNf+UHoOVsyHj5RfWFmYK+YtlylrBe/VH6+N4B+w217S6Sy
 Y/x8psQdm29AwP7YTdM1enA6NZkLV4093dodl+OZsLd+6/K+yH0XJpH3HrP9WQCucXxUE9/8sIV
 BlWZS3d9QhS+iGMDyP5FgmcjZZzLW8aP9b5q7RUPFzKbzuXPxPF10vdBwVLxJfphfKmw==
X-Received: by 2002:a05:6000:24c1:b0:439:5fe4:421a with SMTP id
 ffacd0b85a97d-439d00638d9mr6972537f8f.30.1772748590036; 
 Thu, 05 Mar 2026 14:09:50 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm22486424f8f.19.2026.03.05.14.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 14:09:49 -0800 (PST)
Message-ID: <adbc2d78-bb8f-4ec8-a6de-29ac5617ebb0@linaro.org>
Date: Thu, 5 Mar 2026 23:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] HVF: Add support for platform vGIC and nested
 virtualisation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <0BFFD4B5-6B69-4F75-B329-5C429E65532C@unpredictable.fr>
 <1a23f69f-fba4-4f7c-9679-d06ad65be1d0@linaro.org>
In-Reply-To: <1a23f69f-fba4-4f7c-9679-d06ad65be1d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 5/3/26 17:48, Philippe Mathieu-Daudé wrote:
> On 1/3/26 02:34, Mohamed Mediouni wrote:
>>
>>> On 28. Feb 2026, at 23:08, Mohamed Mediouni 
>>> <mohamed@unpredictable.fr> wrote:
>>>
>>> Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and- 
>>> nested
>>> (tag for this submission: hvf-irqchip-and-nested-v11)
>>>
>>> This series adds supports for nested virtualisation when using HVF on 
>>> arm64 Macs.
>>>
>>> Reviews would be very welcome :-) It's maybe a bit unlikely that this 
>>> will make
>>> it to QEMU 11.0 I might as well try.
>>>
>>
>> The patches remaining for review:
>>
>> 1, 2, 3, 4, 5, 8, 10, 12

Series fully reviewed! Hopefully it still applies on /master.

