Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1461CC5DF84
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 14:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwL7C-0008Os-JB; Tue, 18 Aug 2026 10:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwL7B-0008OY-E7
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 10:48:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwL79-0007e7-Qy
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 10:48:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d01663d816so42019845ad.1
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787064510; x=1787669310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h01b/9i7+ispX6KVC9Xb8pFhMN9j3RSFTSQfs+94fiA=;
 b=Mb06ht5MDJOpTeqP6rOF8pfBEW9smP3fRoTRwKBWz+wFNR0+IhnGOGHE/+klAtsqi3
 UO537AhPwGbb5bv67I4r6v8H9yRQrvL6GdIxFU1c9318rksPM+nrClzxZcZcl2vh9/Jp
 OfG3W7VjItxevrPC58nsGWxroOHHxA/G38CbxwJNkdgvzI2/SluqE+VV6Wspt7V3dwP+
 judkTHb1/hmoWxd5EFnGH4IQwxBhd6ZVtK/GNUiKNb5KbbDBkZqvJ9Gr5ssACaz3Id48
 UqiOXzgr4i2tukRq0PNrD2g9OTa1eAr/wKKwjd/5IgpjuRq44pxE9jUbu6ECLD1C4ZGh
 QdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787064510; x=1787669310;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h01b/9i7+ispX6KVC9Xb8pFhMN9j3RSFTSQfs+94fiA=;
 b=C/r6GcOJ33HuTmz/LdDaT4GAGJDfw3ok1/WImxIed8oTmJfmE65OcEB4YCsbg/n2c7
 d+L03acJk91vNOOF2Wh4hTxJ0suU0s5LqFy/73tRxuoM6668K/Wr0qZvJXE4e52mmULB
 vaKk1XugoXOibAtJvbDRVzZBuwlnaTCpLkMcGquESanYvoYSYBuZfIO0myVnRSVQilTT
 MnmR5vcRmNmJgJ6CvnAV/G9wvwk6hos0U2u6NuvtyxoiY0E2lCSKUr3rpZcr8tIwVDOH
 mB7vpnw4mpXppSCDXfWCT9aYJODOamnb3Yj8M5Jpi4WAmCMC83POsgJOpk0N7LKG9j//
 6v3w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqyVtt0DTkveaXjNWbO4jQUttLN0toJzzCtypKY/RmBofQtLFYCCj/N0SXeedAR2oRjDKlCWpSY3g==@nongnu.org
X-Gm-Message-State: AOJu0YyQxWdGGji+bB8Wp+3HU/nyfO0drppnCTRqKtVdSwLw11khtf8W
 il11kgtERz6sRMak2fv2jMg9Ht0y/zqe/Knm8PNJ9XfZWDbRvdtN8+sD3RqAqOtM0lg=
X-Gm-Gg: AR+sD13YKWSgwS7u5JthawKpbJV973rGiw4nm80w7jxoEng0/cAl56kFUlbJVsRFSC4
 IUCSmc9EIW5WEiBtPdM9S4cI0M3eO5JP4q3zMXOGXhGoREsvmCWpbisxZ4nrKbuDs1CX83wXY+x
 hGoXPlhnTMEMnmCdrxbqnLxvALWQOtvxuVjfSzihAtMyrwyRvFXoOurinRbU2mdVc9vht6KAbYU
 9HM5NQRu+vrW0hHTcP6ddZ6HGNdyQLNVdjlXJ9C4GHT+FQ7iw7t8KKjbJhKICYbHvSQnVESYMHH
 YT9py8B5x11237FiqBWheZCSzLUmclZH5MHMuYWs1/ZHAxWztpebYef7MBuOwcWOSmop/g8qGEW
 EdR0l+a+BMfzY59GwTgDNHTz7igwmb02anxB8IspiuNQdrxOvUDO/W+x5YDaNyDUMD3lzrsQv+R
 X8DVQCsgnt+Gr2B8leAcJt7IUcVHvOW4E0l1Sxo6yWJLRRIO5QshWRRrvQkN6q/QIX8Ts1RXTtO
 HV6ZV2q+qH43D6tarrkAh0yOnIAyT4pGxW7Gy/ZyP7Fi0g=
X-Received: by 2002:a17:902:e950:b0:2d3:a6db:299 with SMTP id
 d9443c01a7336-2d3b0c312b7mr410205965ad.6.1787064510137; 
 Tue, 18 Aug 2026 07:48:30 -0700 (PDT)
Received: from [10.213.131.227] (c-73-181-156-132.hsd1.wa.comcast.net.
 [73.181.156.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5c1e5434esm15769965ad.51.2026.08.18.07.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:48:29 -0700 (PDT)
Message-ID: <b5908cee-46ad-458f-9aa4-f305e66a1cf5@linaro.org>
Date: Tue, 18 Aug 2026 07:48:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] target/arm: Introduce cpu types max-v8 and max-v9
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <CAFEAcA-xmbhZFG+zVcQDt02UJ5ELY2bOiCkVVW=60oZgzujiqA@mail.gmail.com>
 <CAFEAcA8Yh7EcQ_Wi4PqRPZDR2L1-tuDpDPS1-TEGnidSUdaTCA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8Yh7EcQ_Wi4PqRPZDR2L1-tuDpDPS1-TEGnidSUdaTCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 8/17/26 08:04, Peter Maydell wrote:
> Also, once we have a max-v9 we should fix up the slightly
> bodged GICv5 property handling: currently we register
> the has-gcie property for v8 + AARCH64, but we should update
> that to only register it for a v9 CPU. (Q: how should we detect
> that we have a v9 CPU ? Do we need an ARM_FEATURE_V9?)
> Then we can remove the code that does 'Downgrade "AArch32 and AArch64"
> to "AArch64"' when has_gcie is true. I can do that after this series
> lands, if you prefer.
ARM_FEATURE_V9 is certainly the easiest way, and I'd be happy with that.


r~

