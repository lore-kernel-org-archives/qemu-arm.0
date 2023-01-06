Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp294467ejc;
        Fri, 6 Jan 2023 05:44:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMBE2Z+4u2HiZqvpc71r9iCcwthqZP4LGvi1Y1CLQYjFXmjPv8u4itf+Q6SlU1rYNQhl4H
X-Received: by 2002:ac8:4d42:0:b0:3a8:5d1:aaca with SMTP id x2-20020ac84d42000000b003a805d1aacamr71357875qtv.11.1673012657845;
        Fri, 06 Jan 2023 05:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673012657; cv=none;
        d=google.com; s=arc-20160816;
        b=jl5VyQiMxj6h5830mgqpuRBEUHR+b5O91MKX4m7E72Ra5ikVcfg31YH7/sz8laKutc
         JOZeZYYFnM2Imts+0froXTAKgRtaUApRtVSB0It1+RLSFR07Q1H/wlqDb2y0LHHOdKbj
         pvVZfFxtS3RxByoQSN353p1tk81Nczx4BOEAEX5ntoLustq4qDXwtC14Kshr62NLySRV
         8fj/zDzmU33rSgS6+eIN2WIs9V/7NKhDnniiowxWyDF1Ozhl1TU5aiNYh4/bMf2q8fvn
         6IT7TFAcxNN/YcFNVpGcSXvwGH8n0rs4ClfW7OSWXDw0DhnvLaAvjX692AEZIs0lnjSQ
         jaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0UT6Em5fIIUlSzreBzAUOT3iBrfxYY0u0Cme1kfkGas=;
        b=rR/S5IISYfy/98M+vHMzAFPj9HqFMVrt/lSudADima0GKuz1GKkKaQTk7zSp/jlXY2
         z9QlQhmekTth8LRXCcWjf0r9GC+WTWFF4b/77M6O4rwLjlHeoG8Udki2NdrYVEq5oFMJ
         BQ+k6xLHPW2sNkzJ+KMkjiCS0/xLryD0X+2clmj2Yi4qbgZpoNhEsRQjeDZ8mTXJZ9Mn
         28cRrttnkRsanDvzeYc3+4+oQSNU+tggWisMdlpny+aBjFWrirLNp7N1r7a8UiGlqa0J
         cqHGN6iu6/KcRu9J8FTi4Vu/quv1jI647yLcUPT/KGGO6y74b4W2Su25Jbg+kMlj31Q4
         /9dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5BFK8dM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a045000b0039c7bb479afsi750712qtx.5.2023.01.06.05.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 05:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5BFK8dM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDn11-000748-I5; Fri, 06 Jan 2023 08:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDn0z-00073n-O4
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 08:44:09 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDn0y-0003u0-7l
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 08:44:09 -0500
Received: by mail-pf1-x434.google.com with SMTP id e21so1087999pfl.1
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 05:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0UT6Em5fIIUlSzreBzAUOT3iBrfxYY0u0Cme1kfkGas=;
 b=i5BFK8dMUP3hEQ+yajoAvidjWadyX9oaIalJroLIScLPJUGWX6fWRejapNoY5KxYea
 srTGWx+M1qfhtIv0UWZ+TQfone7C+v+YY5P0IFOyVc8/V18vkHETAyEOK7jbqCWHWmtr
 u8GazogZehlGVUnAXSqoKBwHJ/ULzK3tg5nHLdMc6Zi/eD0gzAdOAyrw6V1XKKuQIYx7
 cP+scTycYY72j0haPcoKI74nnKEKPwvuL2UemxUIIq9NgzWSAPhGfmfa9ylqWiUySrjS
 HujuuDUeqxgq5JihcEzhMdtif/wjlwGnzL5V2dbaFY/yh9YbzQ6BEJjcIjS8CjXkm6du
 X09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UT6Em5fIIUlSzreBzAUOT3iBrfxYY0u0Cme1kfkGas=;
 b=MdsxnpZ8a9m5xioYyKxlz8K/rhOicvqV+MBZzv4X8qv1W61mmuPwqmuTmKEzVT2s7F
 t7mf/4+eEfpEtvte7epTOlSM9+aIagT8o2x4znol/ykp7VB3EEWuAAabzcl/+zmWGjFb
 oFKCGcLp/qlJ7/FSaKURZ/dZYzuCYlQsvh3HflkMEypY/lw8ZTAoxUB+aUeZc8CatWCb
 F8FLezAITvDIfdFyFqFkS0UaZTxewd/slWl7a+KkU1Au4TvDEP12pptoQ32r+KUmbrcY
 UmeYanZdeeuZf/BF2hOebfvnQLsE0oklw3qLVeMtBHDWtYW8S98j2sbr0VRw2uKf7U3y
 7Nrg==
X-Gm-Message-State: AFqh2krrZHB1OyJ1upOmTiJVCd1kDK8P3ovW6SvTFKrpAJwQZjACZVKA
 v2QB/YEtbJdt7xW5YJrw4lLix8jvdIX+aFw8+aR3Pw==
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3641613pgq.231.1673012646591; Fri, 06
 Jan 2023 05:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20221230145733.200496-1-balbi@kernel.org>
In-Reply-To: <20221230145733.200496-1-balbi@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 13:43:55 +0000
Message-ID: <CAFEAcA_WSrJqObGYkUcBfhSYYo92_i-gpF=CbYFbWqEgp3Z5LA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: Add support for STM32 H405 and fix
 STM32F405 memory layout
To: Felipe Balbi <balbi@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sf2sMMbAvlPq

On Fri, 30 Dec 2022 at 14:57, Felipe Balbi <balbi@kernel.org> wrote:
>
> Hi,
>
> The following patches pass checkpatch.pl and have been tested against
> 55745005e90a.
>
> Felipe Balbi (2):
>   hw/arm/stm32f405: correctly describe the memory layout
>   hw/arm: Add Olimex H405



Applied to target-arm.next, thanks.

-- PMM
