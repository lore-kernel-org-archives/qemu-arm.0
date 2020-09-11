Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp228343lfq;
        Fri, 11 Sep 2020 12:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyJ+bEFemqQuUp/1BtIRgR2Wrur/YxEZeysIk1WxyE00UScOQ2OZgh/vrqqvRZp2T9Apd1
X-Received: by 2002:a25:9886:: with SMTP id l6mr4859375ybo.428.1599852446188;
        Fri, 11 Sep 2020 12:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599852446; cv=none;
        d=google.com; s=arc-20160816;
        b=dej2chWMvuAUidT2l3PtmtXObAgrT08vwnzeK4XS+9ivXb6Z1P7QRc5YgKg+0iBBPi
         1JmyVvl1i4H3DPiahT4rXYaf5sElbHyrxbrS3ayeP4y85LzV5cMGxGJ7jYKoMlYXbCd0
         VYgKgdGIekiWPHWzEsgS7YhlVUE2sS5bN5zRYHy17vxfo8EFiCVD/iW0Cu1gcQ4P/74F
         Od9FxPZVaNbGBRAZo6ViDbtMPW6aYt2k8xh2MxPMVoyTbaJ+2Sm7kJE8asufkSgrPeLz
         kGTOMeNVp8FLQ5+0/tbAZmUfDzvesbCzqRH/dDsCI/zXk5xhve/6mdCNf96y8Q9xZwEo
         p35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bMm4zXvxwVQiSgLRoli6zcYFZ83KsUkk9g1uD5Z/NeI=;
        b=gOKAs6AoxS3GiE7qNq2LBgDAojWEFOnxaWB4SeewrzMZFny8LY0JeG+M/kShBgBhx4
         JwtMtrUOyXCXpHuVNxOuFCemURSkX9TSkFxGDRUlrTnN2vWZv/Xu7OmCYDGG15Hm07Dz
         P61f03J85+L1/pnUA1/tYR6WEKKHNZeowEzO5EaR1KP/0MbsRhdtRlecP08sU8LbNwAI
         2wj5BAtkPtVA94ZC4pDNvpg3f15gpF1B8UwGW+qRhZqRQ5yGI9+oIcFX64y27k8LwQvc
         23M4LJXAzFS+cWOrVs2maxwhSgwowGM25wkNt9d6sPGCFaYWZnW3TxcKdF6KlvQgiK9t
         GEHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n3ZPRVVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si2844773ybt.308.2020.09.11.12.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n3ZPRVVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGohh-0005YP-Jo
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGohU-0005Tn-Rp
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:27:12 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGohT-0008E5-4N
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:27:12 -0400
Received: by mail-pj1-x1041.google.com with SMTP id v14so826957pjd.4
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bMm4zXvxwVQiSgLRoli6zcYFZ83KsUkk9g1uD5Z/NeI=;
 b=n3ZPRVVW9P2F8SxpaUkuGkj3o7iluO9Iaxfy7rKtJdXAdWqY0O4UGWyqBa7pZkshAN
 1R9c3QVuUUOekg1n2tr/qNPEOPTPMEOmLZJm/FFMXppR3eLIh29ztrZo+TSyKc7Amy4E
 ckCR6DxXCmGLBtzXoSAuyVC5eCDdmFwU23S+NOgHKXN1CjYOEVKJtge3/aFnHwlw/Kjf
 dZ5xujAV1kxs7b4PKO592SgjLkhocmH8k84QaHhv7XlaTT2rBp1qtfjfiaeKjnZyn9IL
 xAQ43FqrtIDxKW93uvi3HP82orhTeN9mGcJ4p6ZU4hORXqATBCzX18/3rj3owR38jdBP
 DREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bMm4zXvxwVQiSgLRoli6zcYFZ83KsUkk9g1uD5Z/NeI=;
 b=Obz6MUKSQa0IdGf4FyUuOB8pZvLS1d0Z0vxRRfgjSAosURGbVLr2Q+th03KxcpBeaf
 Ap/WKIQlpHJEC/i/YJ/bbcbjVuPIEywXSdTSYKt6dR1UNTdp1HvRTm6n0YX56SriYykk
 BUx8s3b1rsatn8yO8pZ8N0IZKgNQ5a3V+CbRQ/bS54/nmCyIR6k0V7y/irhiOhkLlleR
 u/mVsPYaSTmZVcZJCVY8v33EwuRiiXoqouOaBc3gZtG7oQiVH0EVKETJHMabVmwVj/nZ
 SUz6baFYfj+KBKkE1i9UZ3HoWMSko2+DtFcPrXpe1Dd/76WQA0FYYo76g718S3JjudG3
 pk3g==
X-Gm-Message-State: AOAM532EXsJNj9qQ75o07Ae5y6C0MuZ1gnA5eL2vYKpAFNtYS2TE5DKL
 bRG9PI/Eq7zrmJxVxZCx0Ad2Uw==
X-Received: by 2002:a17:902:aa02:b029:d0:cbe1:e7b4 with SMTP id
 be2-20020a170902aa02b02900d0cbe1e7b4mr3692465plb.37.1599852429267; 
 Fri, 11 Sep 2020 12:27:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n2sm2982335pfa.182.2020.09.11.12.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:27:08 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/arm: Replace ARM_FEATURE_PXN with
 ID_MMFR0.VMSA check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
 <20200910173855.4068-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <072e80c8-6cd7-8b30-6866-b22969be17e5@linaro.org>
Date: Fri, 11 Sep 2020 12:27:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Kno2CinrWB/

On 9/10/20 10:38 AM, Peter Maydell wrote:
> The ARM_FEATURE_PXN bit indicates whether the CPU supports the PXN
> bit in short-descriptor translation table format descriptors.  This
> is indicated by ID_MMFR0.VMSA being at least 0b0100.  Replace the
> feature bit with an ID register check, in line with our preference
> for ID register checks over feature bits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 15 ++++++++++++++-
>  target/arm/cpu.c    |  1 -
>  target/arm/helper.c |  5 +++--
>  3 files changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
