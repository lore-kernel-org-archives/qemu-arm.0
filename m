Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5403587lfp;
        Tue, 11 Feb 2020 10:29:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcKgYAGOJUm/pPW6QhLyW78Sb7zo9bH3uGpvW/Asqr/lRLsUqC03sTCsUoLds6LbOErK+t
X-Received: by 2002:ac8:38c7:: with SMTP id g7mr3615833qtc.229.1581445776551;
        Tue, 11 Feb 2020 10:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445776; cv=none;
        d=google.com; s=arc-20160816;
        b=lYUqpsdO082EmSv3oQLolnV70AtVrNoQnOpej3ihf6ljNwKNnvbpHsU7AIZgMH95b1
         u8ouoIzu0lgbBdKd+hphoW0oXP2nj04rpx3KbbUKm5MoGGl7PRVe4PaAosnepdTwSsAB
         q0YjJh3COiCRFn3op9rcGYdTZmBGVPSQ9P3iRDnjMYaEO9PqIH40KJII/rtd3Xecz6q/
         gNWxYD1/NpVMj1eaogiqIT0uqZw+g8TLmGkZsHDJ1INGu934HH91Uy6pizvcGFLmQmkE
         FIfIZh5FocCYtuzYti0eLkZ8iu0kSL+LhXw0UfZzGhdSw+hl4bSmDyIVOCwyGvWi5zpK
         AW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KhJHgUkuMHdDbdXExdsyOARe47sEBdTyknGT8HOFC/Q=;
        b=ua9Omr4XRFX076DwgHMsrpuyfZB4STyMOxosmdIa05UmvDzWjnSeOjFSKl499rfHMs
         E58y9/PJJzw4yJrK5AozlMgKy2i0UW72fOrCZ72rctpHE3GBpnrnExO+xwoW8FEAAgle
         rRVcHccVz1428J5/wmycq7GhNOMKSAPN7DT+MHaCuwhUqFRhegBow4f0IMDhXmZHPSzw
         zcwiNF1vY2CAAtBYtgwNShSMAKgR4SKC2S6QQjzE7sD8tLszmPhlGHKNYmIYW5qq+I+l
         7knq+SdD59m6r/zC9pyj2c5eGbj+LBPtZqkOB8MBuv5v2A96zrGEhyJmmI333AzjiOfF
         Bjbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIDhfsht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si2145944qtq.295.2020.02.11.10.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:29:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIDhfsht;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aHv-0007HQ-VV
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aGv-0006gI-27
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aGt-0004RY-6u
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:28:32 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aGs-0004PI-G6
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 13:28:31 -0500
Received: by mail-pf1-x441.google.com with SMTP id 185so5905202pfv.3
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 10:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KhJHgUkuMHdDbdXExdsyOARe47sEBdTyknGT8HOFC/Q=;
 b=CIDhfshthkD/r76oAtbpOXLYvHs3XyI709O6lmTev8Y7cFEU4fPswjyVfWlga0JiFS
 aRkdRQkL2yKlz7F233ZBowQrWWwD5SW5V0xA/i2D9G9bU8dBWnl96uRj6sFnOWEgn+iR
 6z6XspijsdS9cCuD5S2SubAFKs+QexfmwmL3pWAXkzBZMVn2+cA7AH2zGk1Paj04onB2
 Jk6YQghBodFW0LPs6N2VO36Z83NL6fKy31OXOQCZ32ZVkXSmzEMr5D1SnXgmr2QmVPgh
 cTHPXQ+eOPDigyUGYknypnDjjZygCVzo/7iVo//C1yF1orJXbB1Ll0XS1PErDmEbtvM/
 hXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KhJHgUkuMHdDbdXExdsyOARe47sEBdTyknGT8HOFC/Q=;
 b=X1vebX0YPlYHG2A41DLX5a5xMqvtLnr+ZKwi7nrDVoKkjMxefM64MQiN2nH5hF6Ato
 LcpGVhF2pU/jw3QCab6SiPBGsTrzzELmE2ggK4MNzpLi3YhdPkqcvLMA6B914ulXMrzi
 aZQHvcthbLISJsm1pEBTgLPSeAGdcJHh/y1KTfMVVKXBv+hS/iINEu4dB/YysYonDb7/
 tvlKw/VN0sJ8KGHtrVRUSRQZkUaaNavWdP7ToPRF2LEmjq+Ez2qZ6L3yYF2G+5Rjj76a
 t3RWMHGCisCpkKXpyWqaLPqsTFU2aoTzHXF2GH+uw6SsJZyDTqjct/LW/X9X9PE21KrJ
 L/mQ==
X-Gm-Message-State: APjAAAXIkAzw0gMaJ/RHkmJY8m8rUv7U1cnanUsdqYQzfqaMHApXuUXN
 dVfLfM4r5fourDkww2ALTAEhHg==
X-Received: by 2002:a63:3f85:: with SMTP id m127mr8240574pga.15.1581445709407; 
 Tue, 11 Feb 2020 10:28:29 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h7sm4961503pgc.69.2020.02.11.10.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:28:28 -0800 (PST)
Subject: Re: [PATCH 02/13] target/arm: Add isar_feature_any_fp16 and document
 naming/usage conventions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <05aa080a-9f6f-2b46-6c05-a68678943f23@linaro.org>
Date: Tue, 11 Feb 2020 10:28:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kMd0SdFXop5

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Our current usage of the isar_feature feature tests almost always
> uses an _aa32_ test when the code path is known to be AArch32
> specific and an _aa64_ test when the code path is known to be
> AArch64 specific. There is just one exception: in the vfp_set_fpscr
> helper we check aa64_fp16 to determine whether the FZ16 bit in
> the FP(S)CR exists, but this code is also used for AArch32.
> There are other places in future where we're likely to want
> a general "does this feature exist for either AArch32 or
> AArch64" check (typically where architecturally the feature exists
> for both CPU states if it exists at all, but the CPU might be
> AArch32-only or AArch64-only, and so only have one set of ID
> registers).
> 
> Introduce a new category of isar_feature_* functions:
> isar_feature_any_foo() should be tested when what we want to
> know is "does this feature exist for either AArch32 or AArch64",
> and always returns the logical OR of isar_feature_aa32_foo()
> and isar_feature_aa64_foo().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h        | 19 ++++++++++++++++++-
>  target/arm/vfp_helper.c |  2 +-
>  2 files changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

