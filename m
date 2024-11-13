Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp459126njc;
        Wed, 13 Nov 2024 07:47:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcD5ZTPpnU1r35VHmLY5lEgEJWJ00Q3N9owl5aH7etfl34VaIfedRqGAhXCdfXztyEx3rzY7ncloJcAw==@linaro.org
X-Google-Smtp-Source: AGHT+IHU+WvktOYFeEr7r/OdPcrUyra5Pm3kGkLDJFVzEKgDLD6QqH1tJiTRTtNRYbQeqYKS/3fX
X-Received: by 2002:a05:6214:4601:b0:6d3:9dad:6869 with SMTP id 6a1803df08f44-6d3dd03c833mr50529866d6.16.1731512826795;
        Wed, 13 Nov 2024 07:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731512826; cv=none;
        d=google.com; s=arc-20240605;
        b=RtW0hwyrus6zdXTVpt/ZQ34/F4puvBCNkja8IxRI7DyCXTN5tiB8pGMFmp5PeyQKP3
         xBXLQYC3NNBpwWVWPr6rbPnj10plVMhWPck9fSZBdsIVrt0Mk8FmsnmyowKucRCqRJoY
         LPyxAP+oFL1QFb7+k07N/ToP/oPqverdfxbHG5d4HhWqI8GGKqhB9+bbIYhoV0UnahLb
         3djrtBkn8CEcnEh0iJ7TBt2u4/aAR5fhDiThxrQvCuTcnvdXXrUNElNV4Ci881Jyvatm
         T9FTU8k4OMxOAU450G9yknEKnvIitrc5LDQRfdYycVaTUehTjZ5XYmINa23M5HZuMUw3
         0h1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z7u4YEEn3cb1NSljyuIRBPB0esooHatUpF/cpdMl85c=;
        fh=OHtq63zgn0FMHhILukaF2s0vH1Wb7nbyOjpbrvTaa4w=;
        b=SCjjRaiJ96sWGpa+FVeOXygPyMijb16kA4113koSeiVbacom301ruZ7C7aVIe1Kpu6
         +HIDa6yfeYajiMw+dXJC6CgcDRsYIa05Cz57psayivfN6LlmRKtQ9rDCQlaLmz2Rlv6p
         wH+EG4x+VQuYclQtyx+hc9p0MtGVg7lcTicnvBejsnjzEBsXI76UkPUjHHeDBg1Auy4e
         5GzOsJbQ5QjZkK3tLLJ+QrIHPk3iJPi2GVF/1q5LV68ZkQ1qSj4wA2ll5X+GMv7X+xJd
         2n1j+jlpi3doCIKkqzg7ZXcicOJ8rNRVGYNPq6Qk/NAHK5cRBZnY/3T2KVxI4kROwm+j
         DkTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrTBKduL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39620f02bsi158918566d6.58.2024.11.13.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrTBKduL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBFZm-0001bn-7z; Wed, 13 Nov 2024 10:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBFZi-0001au-Oa
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 10:46:35 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBFZh-0001DF-2k
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 10:46:34 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so59763571fa.3
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 07:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512790; x=1732117590; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z7u4YEEn3cb1NSljyuIRBPB0esooHatUpF/cpdMl85c=;
 b=rrTBKduLv11UAjnazcqUplDeiHdd4qzztXzaH5L9onBPNodgfrZldn59TZ2qcY+RNs
 iucSIAYzSSuMAPm+KWpQq+Pzq4prr3Qsu33psBHR+9J5jcWz+9g2lx6vdDWJsQsq2zYB
 VdZy9oqi5h8lcA7T8kZezHqGak8hF6xs3JZueiXrvfN5npbSArIuYH25CKuM21bWXpOP
 o4Emq23P7z91uXKXDltUfR78RQQFv3KCakNPnCPUkmG3xy+95dBKqjdk+05nBJCQDde6
 b4XFSSDKaPdNvE6yzY2RPLy87s+hSLEpMYSkK7l5fwRLC39EZqzjIgUxpSuIW+QtQ6iQ
 4RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512790; x=1732117590;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z7u4YEEn3cb1NSljyuIRBPB0esooHatUpF/cpdMl85c=;
 b=rYTDwfD8e3J+X4xRhZhejIAPxAy04mwDGxx7cxtDfMBL+FNB6aLdOb66fEHLX/PSEZ
 BVIYyTXtVJ28qShlTRSvsAZsl62oiUYv7zld7MX8pQbPbD9u9ob1WtM6NLB0sU96lOBv
 x8JS2sSmggLVlV4a9rtAGceiy6+yiF6j34+kYCXVIOWLRN2ID7R8xXOVDHlvLL4oJdW3
 /OXhhL3uKFP+SBH+BTkwIE4WSiMANoXoMdPsBp20msLtMWgYDwHdDALmRnIPvc/GMq9R
 PTjdGtg4gKe1MWMidZbKOmkJtZh1AQbNJ8H7UZKnrIitE7OCm0vsDv1JU8hImEGdfARp
 HVZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb0+KtcEYxnA3GptQTBtZ8H6ggSahhwXxx8W44sx1DEV/3VhdH1YEp0RPSL48D8D23eX5knDrROg==@nongnu.org
X-Gm-Message-State: AOJu0YznfiFxxg01eP/5c3++blj7Kzx4gId0/+hKcmlFpGcA1XwNi/vl
 fdJePypb4V17d7Zw1wWJURLq91vfsWe52gtiT+31DnpDMxlJAAClLuiI+qIj4w/LrRLvTLXmtcv
 4O5LQD0coWrbnZczuqDZAXU2LWG/D+00X2496Ng==
X-Received: by 2002:a2e:a813:0:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff2029fed5mr101267331fa.38.1731512790335; Wed, 13 Nov 2024
 07:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20241107195453.2684138-1-titusr@google.com>
 <20241107195453.2684138-2-titusr@google.com>
In-Reply-To: <20241107195453.2684138-2-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Nov 2024 15:46:19 +0000
Message-ID: <CAFEAcA9OK1g-d1AkyzQ_KDdREd+tQdFQFpBocGyNDLwPi6D-BQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] bitops.h: add deposit16 function
To: Titus Rwantare <titusr@google.com>
Cc: minyard@acm.org, clg@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org, venture@google.com, 
 wuhaotsh@google.com, milesg@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: mXvkcwC05iyw

On Thu, 7 Nov 2024 at 19:54, Titus Rwantare <titusr@google.com> wrote:
>
> Makes it more explicit that 16 bit values are being used
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  include/qemu/bitops.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index 2c0a2fe751..05179e3ded 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -459,6 +459,32 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
>      return ((int64_t)(value << (64 - length - start))) >> (64 - length);
>  }
>
> +/**
> + * deposit16:
> + * @value: initial value to insert bit field into
> + * @start: the lowest bit in the bit field (numbered from 0)
> + * @length: the length of the bit field
> + * @fieldval: the value to insert into the bit field
> + *
> + * Deposit @fieldval into the 16 bit @value at the bit field specified
> + * by the @start and @length parameters, and return the modified
> + * @value. Bits of @value outside the bit field are not modified.
> + * Bits of @fieldval above the least significant @length bits are
> + * ignored. The bit field must lie entirely within the 16 bit word.
> + * It is valid to request that all 16 bits are modified (ie @length
> + * 16 and @start 0).
> + *
> + * Returns: the modified @value.
> + */

Why do we need this rather than using deposit32()?

See also the comments in this thread
https://lore.kernel.org/qemu-devel/CAFEAcA9H=w29-8CQStYYNwEU=OEB=NzxpioaqGEgSpc4KnPOHQ@mail.gmail.com/

where a deposit8() was proposed.

thanks
-- PMM
