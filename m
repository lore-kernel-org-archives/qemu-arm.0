Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp743719lfc;
        Tue, 13 Jul 2021 09:26:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY3gFQJ82XgzzFeRto69sMnScCE04iTWpGhMJ2Lz7OqM+Js1pCxN8NrI/W6PpcwogESV71
X-Received: by 2002:a05:600c:1c1f:: with SMTP id j31mr232007wms.132.1626193605875;
        Tue, 13 Jul 2021 09:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626193605; cv=none;
        d=google.com; s=arc-20160816;
        b=MhgvlUPwhyF51dEBt8FC9XYoM5ce/AFfYslAZ46c/BpPQKM/gLYrF44CyrDKu4XVHO
         aDE+EAxhbGdVVfJajQ9AWbHLJcFIk2DOmjMG7fdBHVRVNuQ/Eo9WdInG4wWIk1CDnDtq
         PY01wCjfHK2PhinxCtXv9Vkapc0gYYkFIM/PnTltXfvx2CRmdY5PwX+LKF3q0ON8p7v/
         tKot6pBpxafV0SGuyaLiWyucSeoTFGfYLsK7KKF6AQn/TBCwPiotZptVebGxNzDR/hid
         Te4EPCH0Ssx5vPlFYF5k2VcKrdArggokCm3rHxWVO5IMKwYqp5IVS24xxhw31UhZEbuU
         kMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FeFPEjksjP/DqohhB4wXQsXjzvOwDAbB73VvkxLfcq4=;
        b=FvUZuSO4AK1bqG2pa53MDKhmokGQgwE47SKIEwW5ar9cei0EJdNFL+e7WcNxZhDOTQ
         39tCbOrc7z1qeMuj/8UPHMA9EKpz31UFrHhUQtkLucZvs7mPe+asuLjkNRSzibCf5Osl
         /zvvMO6YqQASbROw3akhrUxExHejOvSMnjIGzfJYSeQCJzk9tCnLbvrUARyI12A8EKB3
         EyzGp6KziUe0uqLEPqtb5T/iSQmHP/8/OADLUgL2SjTtLgYYWfY9rU0IK/pg0EO4LIfW
         Tz1Rdim6eyLxAFEKaj+nq+p04JSY8H5WxKC10ERb1TWzyGdeNseMtJRAzop3v9hLo2N4
         5nGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p6sXwvGf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si22287142wmr.171.2021.07.13.09.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 09:26:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p6sXwvGf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3LF6-0002X6-T8
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 12:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDK-0008AD-FP; Tue, 13 Jul 2021 12:24:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LDI-0001q5-HO; Tue, 13 Jul 2021 12:24:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t5so17424479wrw.12;
 Tue, 13 Jul 2021 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FeFPEjksjP/DqohhB4wXQsXjzvOwDAbB73VvkxLfcq4=;
 b=p6sXwvGfHHEFyNqz9yH2/1Rpx1N/63+7N7MjktYCZtp/38Mlc2yMYtpTdYkydLDgd4
 ptiUlHjDliIoab/LxXxoXqrzvyMupnOE6PSO8vxYstKrS2UahHlsWTvYbvTs3tu0klj3
 lSlmhhr3l67oeDONdFdxH2gSBPc28T3TMeY+zgnBFrfT9FxZlYfenKzcREO1VLA5W+0T
 GX/RqhrkOPo9hfLhEhhY+6RwNbV1TZQ66K09fiJBlAU2Z6N0zCRnQfffl/pnpYB6WLXt
 UagZaga5T0HyiKt/35aD4YyDHTDGmm8OpDU0tuMW+IKIOvZuMd62B03GpJpakhAJwDIC
 jJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FeFPEjksjP/DqohhB4wXQsXjzvOwDAbB73VvkxLfcq4=;
 b=nLkr62eRo7w4lk8UwhXy8/0MtpNtX+lpW8yydlOnKGrvMu6+FT3W7P0he9VCF/scuH
 RBcrTU6Fl+piyxg7B+QkVhy0yQVJ/wErU7KMBaxNen5v7id6hid42tnplQ0kbUlNQJRW
 vVq0Cs4OJKf3PMZnKV97NHVuCEPuONSTqJEEv3sD6dDB32KZiFjubIa/3+m4/WC/x1zs
 /A1esNbDPg3z9IQaWG47d7oog4VCLDkmwxNPZgrK0xwsslDRTS9tsFysyMLJOzxzuoec
 L5uQOZ6lkQldgDzdWKTVgJJDwIFeU8Q1TeOiDN/x0CvPGbyE6leKFMLx9XcrzhFF9Xn0
 WRuw==
X-Gm-Message-State: AOAM533r0DwB93N7wPxOTtKVoICRTB9Tz1aDocrCD1v5pcg39onhhKcI
 KkQhCIguVAAsw+hPCdg91O8=
X-Received: by 2002:a5d:6992:: with SMTP id g18mr7037175wru.118.1626193491031; 
 Tue, 13 Jul 2021 09:24:51 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id t9sm17893377wrq.92.2021.07.13.09.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:24:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] docs: Add skeletal documentation of highbank and
 midway
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713142226.19155-1-peter.maydell@linaro.org>
 <20210713142226.19155-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb786a0a-c5a7-7910-e541-e16256053af1@amsat.org>
Date: Tue, 13 Jul 2021 18:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142226.19155-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eR/LQdDvwVzB

On 7/13/21 4:22 PM, Peter Maydell wrote:
> Add skeletal documentation for the highbank and midway machines.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/highbank.rst | 19 +++++++++++++++++++
>  docs/system/target-arm.rst   |  1 +
>  MAINTAINERS                  |  1 +
>  3 files changed, 21 insertions(+)
>  create mode 100644 docs/system/arm/highbank.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
