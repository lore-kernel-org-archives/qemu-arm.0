Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA666F513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGsV-0000xF-NG; Thu, 05 Mar 2026 17:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGsT-0000wU-1S
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyGsR-0002Af-CH
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483487335c2so71872425e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772748542; x=1773353342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sp4NGGwXe8WZ9WaE/Rit85H9U9O9209qhDh1s0NEE9E=;
 b=PsZRzz/P+/6F6U4LAos/Q+79mta2Z2G6Ah95dCt5XairvvXp5hAlWamrGLWlRenAD0
 Bl90fKdK5+MQ7RXPgfGX2mJDCnbBaNNwUx7gT3jP10oxLw/eBqWItdlEeAdUFwC1Ju47
 iwPHk4XS1iLW1Jd7EuVBHXp3Ea2VUtitksT11RucRqFMjmCMUQmEAIJ5rw4TqTMsYNKz
 sxPtbHZg3KqOjbtLstU+5YxjDwDCt1ZXaGM6psP9AdOd8jPjM2tn7msZDQp//oTSvFLa
 PrbRFpwRKXugqxwvwEFTOgrV2plC/whWrS4aMAZrRZ72FVFNijficYjY7i9CscaLz5nc
 6TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748542; x=1773353342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sp4NGGwXe8WZ9WaE/Rit85H9U9O9209qhDh1s0NEE9E=;
 b=Iv7AyAK468bvwOKVFg7JwalGltbJEs2kG7/oY18+PS5ksjRTYfoXYFVes1DoxfQmMB
 N7FhrBKg+UiF8BrBNPuvaftgkAREozPQPSA1SjGoQ3KiNJIMCa98do1nivd3AYeqrYbG
 vKwk3hmmv6rf0eEaiHC83clPFOAmSgafnoBHW9T1LPUjp9cCH3JU1XEs0zkQ/3vccfEe
 DhgOXLsyafcIzWjmTgnCpl+FX/ZQR8E8iUT9SYFJRM5Vy8o9YVlYHxorHlxNjsK5dhVa
 mbDoyp3tAoJsFe7gycEfAPAgUCP4bLghWGcl9th6Pb5Tdjp1B8jSrbOXuFTpUoVcDuxS
 UFYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfpT/Y1pA9WzaSFSYvMCnI3Ffmmc9aEgj5j88Qpsi7Sciqm+YcfuBZ42VyXJgwfcVkcUrKU5Gdqw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5Pq685+WQMr0prgAmg939VLWiJTL3hPFynsBBn6JdOH9OUD5w
 OLnK2tIFv25XA3MoNtZeK77zaHYPVZ2qwhJT//Kx+KwL1AvoueFB15TMuofEDt9N8Rc=
X-Gm-Gg: ATEYQzwiTu5LzwCFpce7tjLVW6oYq970kiZlZKhRcixax6XixYMZez4a1ABL9pdBHx0
 3fRAXDPr6TN8l62axqCIFH5DUBjWYQ64+1IlzRjGaIer/Y26DSvG7bhYfWHOAiJ8OuxcwPicyGL
 CPMxullkRvmO6s7y8ylNOwccOPkyyXkx6o/21LqfrEWo88vClgBU/ujta0n9LIv16jA8mbVtFe/
 MaXr0d41rN7TzU4hPE5ksGfE/REhi3NJz/eO86m/o4XLI3wuv0rU5A8peSPat4hvY+6vkHmC7Mz
 Y7FBgWY7EzFYKsEwv3XX5MB81ZdlJorhV+VnHUEowPb+MFvbRdc7MYM5ddIXUy3IU133bnWMGzd
 d5wZe3Ije6c7CkmxL2IAac6UHYq5525xA68XHl7kHnuvsDcsl1OfkB+IZ78YD90/sFxxnrhRIOA
 yHGSaU9wvc/W+1gDzDXDU25IDclCcI0eX5FbLo9nzmbSX30zialaliII6NmzMwRuoIqA==
X-Received: by 2002:a05:600c:8411:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-485198744camr124994385e9.18.1772748541644; 
 Thu, 05 Mar 2026 14:09:01 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852378de92sm7310645e9.0.2026.03.05.14.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 14:09:00 -0800 (PST)
Message-ID: <3fdab598-c163-49ad-9927-b1f28668b5e7@linaro.org>
Date: Thu, 5 Mar 2026 23:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/12] hw/intc: Add hvf vGIC interrupt controller
 support
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-2-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-2-mohamed@unpredictable.fr>
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> This opens up the door to nested virtualisation support.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/intc/arm_gicv3_hvf.c            | 735 +++++++++++++++++++++++++++++
>   hw/intc/meson.build                |   1 +
>   include/hw/intc/arm_gicv3_common.h |   1 +
>   3 files changed, 737 insertions(+)
>   create mode 100644 hw/intc/arm_gicv3_hvf.c

This patch is huge, so I surely missed details; but
the overall LGTM (it it won't break any existing feature), so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

