Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1ECAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:39:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1jNx-0004YJ-KY; Thu, 25 Sep 2025 06:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jNv-0004Vg-Rt
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:39:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1jNj-0005jN-A0
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:39:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e1cc6299cso7468825e9.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758796755; x=1759401555; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=98VyfJ2AgomXl44a/cUm9jWyQ2EzsZYIlA1vmEeal38=;
 b=IFEkA4VpYtwA9IZppABWMJsgA3bwkyp9QmEO0ZLyi6DCY6om+ijWW4T3eepIneORGU
 lRzd5rF5G9E8iqOCjonJCl//nRv/si72DtJAvPrFpO7UKzTwGz++gT3g23QAP7iDwmy8
 Mpp89ycvTpJglV2BWRpCex9q0xUFy428V9K2GXMlBgauM0VMugyLCKg7nb35ICrNEHkm
 nkS+C6aicYBUTPdOu1rSZ+RRTD3vtPdEaEK7ZXAbj3yrE8GP3W+TNzsv/kYLghoclx8u
 lZXZBxJLbBpXQeWW0bfoctbEupi7VLsl0rqpAruS7CIngUVHafDke8OAojIgbhLJIWxS
 +yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758796755; x=1759401555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=98VyfJ2AgomXl44a/cUm9jWyQ2EzsZYIlA1vmEeal38=;
 b=A8I4FeZ/QMZDwRDB4JcOe6zz/9aljlU9YxO12gw+e8mBU9IbDZMidky7p3tSvG04bo
 rwx1rYcq6KUPYEP0ew3yAJcO5KIQAi6T/TLrB2ceOemFVxTP8ZhtlZd98CK+tq6DroMt
 lLypl+aTvpt+6MXDukE9kCam9oU1dwHDBdzLM5HBG7BG/p+PEK0tM/GfNN3swYEpKjxi
 uluBMhpf+4ZoFruKz4jee1WMmrMLfDnaFiIuKsgQrjIFTlq1/7cObQvC6CuyjUj9yqki
 VoPjextzfq3FryQXf3S1kNn0ygp05Vi8KWoLKEFru1rZAwBTaCVHN3wUh4gsh7HRv/6p
 ljKQ==
X-Gm-Message-State: AOJu0YxAslHelYur5CjStsFYp/40DyIyajial28MxVmFIe0PKKKzLuJI
 OHw19wROGWT7hiLOA1f0hQEbrnOCQm4DKSY+jK8+jpkQoQqdQmAu8f50O5Aks9o6CgkOscJG49u
 0xFaVK5E/Pg==
X-Gm-Gg: ASbGnct0TNCc3J9uNyNqU6NYay2VQ9CT12/UzpgDeQDx1mTzAAL5fzjHDkkL0zGoO99
 a/WRnphtzzoDKcE5oLjNSroNvnsvAVg/k6WhHgYE5JGY4UWB1v56Fb4ETk+Q1Ev8kUIC7KhOLfs
 aPaid7aISwOnFUB0GR0YzHetEP0jRzvtA1rXMwMTM1rF7IL4T74L+/6sqLNqu9J8tx9iq6DezVj
 kIFA+X6q7lZmldSonHCBkZzpT32Wyi0b5cBc8Yd4eDln2sihtTnUzmCsHP7e/lRt6ughfVkbwiX
 jwcO0oMM4m/+qDMJIFyBsAP9fnbreuCfMAPfAms4Rzi/XG6otViZ5A5xOMbzHktZv8nAnf9eMhU
 G+pXgmiKqQ7fiKz2A6mOQdI5t7Oui4YONMAv83s1pv1FupyGwxMSKvnOftmRMSPmhNQ==
X-Google-Smtp-Source: AGHT+IGFSpDNPAH3R6X1AeVUXdKh1BqvG2eTkQOgZSbuCukk4lt0EOFUGb/zkFMr4T+wv8vnep5GtQ==
X-Received: by 2002:a05:600c:1e87:b0:46e:27f7:80ce with SMTP id
 5b1f17b1804b1-46e329e51c2mr24638035e9.23.1758796755134; 
 Thu, 25 Sep 2025 03:39:15 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9b6e1bsm80632005e9.10.2025.09.25.03.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 03:39:14 -0700 (PDT)
Message-ID: <c9aa2704-470a-4740-8638-e953d429f292@linaro.org>
Date: Thu, 25 Sep 2025 12:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/36] target/arm: Rename CP_REG_AA32_NS_{SHIFT,MASK}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-17-richard.henderson@linaro.org>
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

On 16/9/25 16:22, Richard Henderson wrote:
> Rename from CP_REG_NS_* to emphasize this is specific to AArch32.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


