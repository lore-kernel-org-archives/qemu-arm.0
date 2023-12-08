Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2499420ejb;
        Fri, 8 Dec 2023 10:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKo9B99qMSLsqzYll2gIkYLmzdllVVaQ/zlX/njlIvBm23XqHv2EjpfsUVcYQO/hGpH0Z0
X-Received: by 2002:a05:622a:1482:b0:425:94f0:eddf with SMTP id t2-20020a05622a148200b0042594f0eddfmr619497qtx.38.1702058657423;
        Fri, 08 Dec 2023 10:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702058657; cv=none;
        d=google.com; s=arc-20160816;
        b=qLOr/yEz0p19YOxr7gUuyKEbSl7K2aaLdVLcMq1XsKgPBhQJA6zq7IXl7taJSq2kle
         bKD5wX80o7tc6orI93b2O5+hSnhZPgY+PbQ10FHjND+6UJexcwIkf+cxqhG9IIMhZA0c
         bmXrHcG4vD+fJozfcmPHSOIJc1b5RAbjnBq593BoA8FwOJ2rj02gnE8QXl0oIuxqfa7t
         N2AvDzmcSdaYK2acCzshnipc++HrhR6+K9tpAt8V6KqxxWmJlEKq/RfjJBH6nHTYxcgi
         7qaP7kryQbDSZaLSHsDpLwOXpdKCRQ6En1mXxRfVBNyDpEXV8FXeuX1l7PFHJXMw83tL
         VGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9Ms4tiPC1ZmN8F70HyZxgZ/fRIv9iz33jofa2pZkHOo=;
        fh=E5Ae+sw58p11tFK58Zyhxow9EJHZwrmlzwrzmAw9P1o=;
        b=mzP5QH4Ip3jMOr6KnnGQuJrTxlGoceTyVSE8e1ft4lGoY2/jnRQbHysXMbY2CH22tU
         LM3mr8Lhk8f2yCJbDR8zWCCF512evf6O3+nhBF90xA4uQ6jRYmUekYlHr64+jzF5W2FQ
         s4uM5HKb9UDYO4b4FqSxO3Tc2LGOviLVvChaaO/9goIYP2sz+7tL2kZkEeJIHu6Sws0E
         Qldb4o+sJVLmBgzxrXxQVyce/coiBBaplKLgwRgf18e6ScUHFbUqtWR08DwVRvApuhFp
         ecHPOjMlcQRGJAnqOLcAjMtlMC3dzvbP0lne5OgovWU3I/9l8Cf0WIRKMJY2OQHBEcnn
         5Rww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tq/0qDc+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac87749000000b004237122a89csi2364213qtu.594.2023.12.08.10.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 10:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tq/0qDc+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBfCk-0007su-6b; Fri, 08 Dec 2023 13:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBfCi-0007ro-Hs
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 13:04:00 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rBfCh-0003VR-39
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 13:04:00 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6cbe716b511so1804123b3a.3
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 10:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702058637; x=1702663437; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Ms4tiPC1ZmN8F70HyZxgZ/fRIv9iz33jofa2pZkHOo=;
 b=Tq/0qDc+htTbtIVJbMiTPreM4dP4I8P8osXh8WAacgaxc2RJFp0qp+7ZJ3FRbda9TP
 Kmy1avuM8IhnN0Jho1E8jwKBUfeXy7f6cvoXr5hLxKEGM1auWW5Ysqe9lj1/xtVh/gIZ
 crJyVh2bIh+fdwVnIAgwkIvKeG8AiArnFuEiDdufnjOHcbbwoEBEKWmiYZVSbld+JYHK
 Dj5U2pOVf9Kuqdk44WmpzS4E8+O951PsI5+kbYlSrfQAAvWno2P/LWYCTJymK6VM0ZRq
 HwomP37P2CzHA5h0NgaP07cpvxsOW1Nx11Aa2Kd4efN6+a3dGS00TrGRrq4JPN8WZjr/
 9aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702058637; x=1702663437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ms4tiPC1ZmN8F70HyZxgZ/fRIv9iz33jofa2pZkHOo=;
 b=V0ImyXz75eB0SKHrGQO9aSXAjeSPzAwI9IyUF14UQNsONUpespgexQgcsYAGku1oIQ
 7lWTwoRWCEybMUrPpqhdYMYJ+7uE91nTfTJ2AfnL8lvoo+2qyKyYRMP/ylCsYm9XEz+X
 WKpTUbsZT5hQkb7BfyCkU0/CixAbMW68C8/NHUjLpmzogK2tME8dPpbaGzDHuITj7LIY
 KsIG6sWQVpsxykJu8iz2OePUQRwEJoC6/MbQCfHlqTjbOJjQXxPU9ZaTDmv/eAT/6dPd
 7SZ83oAgC+2hfIrsiQq437HjuPPReISjUrT229ZeaFjGpcPby1bkPjsQotHKhl2POV0s
 VRpQ==
X-Gm-Message-State: AOJu0Yw3/HjKnt37pCN7NRipP+XUKu4JE4lS0F0NGbp0K75grVob+ovA
 uqMimfmXEN2qVdZhZSDl54TOZQ==
X-Received: by 2002:a05:6a00:6714:b0:6ce:379c:ced1 with SMTP id
 hm20-20020a056a00671400b006ce379cced1mr356172pfb.59.1702058637479; 
 Fri, 08 Dec 2023 10:03:57 -0800 (PST)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 n24-20020aa78a58000000b006ce4965fdbdsm1867520pfa.116.2023.12.08.10.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 10:03:57 -0800 (PST)
Message-ID: <d728cf97-e2c7-452a-ab32-64c14aef9113@linaro.org>
Date: Fri, 8 Dec 2023 10:03:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] sysemu/replay: Restrict icount to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
 <20231208113529.74067-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231208113529.74067-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aThD6cIry4W9

On 12/8/23 03:35, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/cpu-timers.h |  2 +-
>   include/sysemu/replay.h     | 11 ++++++++---
>   stubs/icount.c              | 19 -------------------
>   3 files changed, 9 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
