Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3003726ejb;
        Mon, 20 Feb 2023 23:14:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+2De4W3u6swW5fbh8GQZs8mBPzzGLD2Za2QOWPH2gSzgPtwpKHvRLYFgpWf6Tqbhl+v0a0
X-Received: by 2002:ac8:5c82:0:b0:3b8:67c4:b11d with SMTP id r2-20020ac85c82000000b003b867c4b11dmr20426294qta.49.1676963678816;
        Mon, 20 Feb 2023 23:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676963678; cv=none;
        d=google.com; s=arc-20160816;
        b=ur2mY2zjndiEg3E0PtEp/JPl84edyT+siix0H40ueMnazHeNNrtRVMlh0eCijdbOGn
         cY5dTLge4ZmDYjTVV7zvTT9uZLbL/6YcETfwLsx/fRv8YcES2yqS1Ws67CLUj0edm7Pg
         8glVRSzT4qNuo5s+YWx4egC1n6VEEHFz3jbL2ERgdmkqgaPY2TgSWxpp/c8Dq1CC7Tp0
         KKEhD+qF9AyU5Zogh0eEUA0VJzSMo+oPgG7sA0WLlS/N78XY6w0SF0Hv243AiXE4CeqB
         AbyYZw0JJnyP5UhCgsA0KIuQsjWwObxwxfOleIuAKfegbXKqa2l2Nnbk6B3odqGNVW2G
         /tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N0asInwIURkwvOIIu7rwjE/mHC2qRKTm48MlQxOIyIE=;
        b=pDEtD99GqklzvL+kXaWeTy4UPu+qD64kFhxyfESnnK5XAHrBnVVLDsO0YWVV0qZFxI
         RKLm2BugPlfQXbBnskLBkLALAtieRf+H34bLwE5zKfMMXF0E8W1GcymPg9eaEKGU49BR
         1AsmGZVW8jfWGuTlPATYIAeq6HWlA5/2pKzIt5umxCVgQ1Ul26SjOS9ugr8SFzoXzR0y
         RFeF9ggXz3jEJqNcddeI0TdLZAhyYFbgJN6h8GbaxBPoqywvLLwHt0aWnuczMNDpEQAL
         Zd94FBRidAOoi50CBx4u9hFpIcAWsdXBPd3fJhtRLg/VwC64Qxjr5isqWLW4/NJeeNRA
         fwyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVhqAHBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020a05622a04d000b003b8458c31fdsi12178340qtx.286.2023.02.20.23.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVhqAHBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUMqu-0003VF-BW; Tue, 21 Feb 2023 02:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMqs-0003Tw-2U
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:14:14 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMqq-00034l-He
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:14:13 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so3987454wrr.5
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N0asInwIURkwvOIIu7rwjE/mHC2qRKTm48MlQxOIyIE=;
 b=EVhqAHBGdwzGV0989648blisOs36xHn2VCuaSXwCzLvMa2PJgJ5PCMtGm5S/tVAzCw
 GU41q3nmwqXIbcUuQVoueFeNP0/F5rtKULUy/HQ4PrU2d2apyrGjv7HYXjfkmB5wJdRF
 RIHO4W64m0qO4w++4l1Y070nI1DLopysLsOenhKz5vc2LYTh0l+xgQq6doasEFYubHu9
 K7XqZW/9VNDOQxipBQ/syi3WbijJuqEXUs3v2goD4fRsEJxMjrQva3vN8mCdXSuNcVys
 HQALWhyNROiQf9eOnBxlzvyY9Uh/JAgt9k85ECYAPFSUZTa6zr+2Dg7qPgmvgwB6w4e7
 VICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N0asInwIURkwvOIIu7rwjE/mHC2qRKTm48MlQxOIyIE=;
 b=WH8o+MweZXMi4SsnTyo0nCXo1LQyaTSuX0X0y/ZuviYio5ik0ifa+gMrNDE35cWdYa
 aBBOoH+9A9A0XA+3o4lfyZX5ITGNYRIVvA2p3u4b1rV8sb8MYSBTWdp4iY1nbOV+BYUG
 axynxqgCwRDDkoAKvZf6lcqDJY5ooe9AkGUjJYi5PbyHCfWN9Rba/SoM2rR3VvXuI2jR
 yBck7hAjT3UOOuEygEPjvmf9vMZgVUKokj6i6DVg8XRi+gR2VVy95chPPVraIPYVFRO4
 6OHTo5n31/bvBTk93tmW+YAsze9LIX1yRtkgqGzrnObOXSd6mXt06XvkN39imBGrCowZ
 MFIw==
X-Gm-Message-State: AO0yUKUdB5S60A92NAQlZwgudQRYFlK6o3lSG9eR//cvQazUjcvNmPiG
 fZU1yc54bm/2FUyVknfQE91KaQ==
X-Received: by 2002:adf:f391:0:b0:2c6:66f1:3b5d with SMTP id
 m17-20020adff391000000b002c666f13b5dmr4778592wro.12.1676963650950; 
 Mon, 20 Feb 2023 23:14:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i16-20020adfefd0000000b002c552c6c8c2sm1613330wrp.87.2023.02.20.23.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:14:10 -0800 (PST)
Message-ID: <2bd7100d-5036-abbb-c020-8da79fb9711d@linaro.org>
Date: Tue, 21 Feb 2023 08:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/14] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rH20Ddew5RIj

On 21/2/23 03:19, Richard Henderson wrote:
> The function is only used for aarch64, so move it to the
> file that has the other aarch64 gdbstub stuff.  Move the
> declaration to internals.h.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h       |   6 ---
>   target/arm/internals.h |   1 +
>   target/arm/gdbstub.c   | 120 -----------------------------------------
>   target/arm/gdbstub64.c | 118 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 119 insertions(+), 126 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

