Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2004985njf;
        Mon, 19 Aug 2024 02:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX44g8SyEy4ljTRV8B1CVb0P89Kba6F38dAUbM4w06qLwFQcuWRupJ4z3R3acc2/KGUbDbnaqHXf5Igffa00tmnWlu1R5II
X-Google-Smtp-Source: AGHT+IFHhWOPP8NvUVhiotqJwPQMySnJXXY7IFxXDoc3jjak7u10HRJzy47atL5WESHD3T+27BaR
X-Received: by 2002:a05:620a:c52:b0:79f:12e9:1e71 with SMTP id af79cd13be357-7a5067e0d63mr1186530685a.0.1724060407545;
        Mon, 19 Aug 2024 02:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724060407; cv=none;
        d=google.com; s=arc-20160816;
        b=xBWXVXFJJqhU+MfQjbs1+cUIARHrD+oFC36IKNpwHED087QKOdnX4llPhke6Y8fjsP
         dKziw/Z3ICWOfRM0VLFG+RMqAmo4E/L7eMh7KUt/UYnXk/yF1Fgzc0AYl12at5QwsSgM
         XJGaYcquv3HjVOFLbKWNeFfe2jowg4l5zNz75hOexSXW/ZUNFNa+f8LhKt6J1mdiqR0y
         R9vtACEr4D0bO9ogmLim55vVZiwOijV1ZaFfJDHjrUTKV+k3CdjfqWogmUh1gUEgjV86
         GffKtK6JTjVF1a2z9BdjDf8z5b+dEhKcB/CJmS7VhAqVBNuSEP0cEw4RQCcrGjjRR64F
         RewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WZR2wo7glRF7OOI1Qdgt6BsZQnmRkJxP0gRiBjk2BGo=;
        fh=RdFpw/4tUiJy5chwHsVqb4btZe63An1jzmUHEqSlWqY=;
        b=whNn3dzdSCi5EbjLuVX1ug+LKbyLWAe2Mv8AXAUHTiKq1ouhGrpxWKZOOyaH2Ut9ur
         zvftIGGPe+cldwduAcew71YXiLsRty8OEPSqP0qpqNK+wLCumnHqlEtZB9c8QrPBfmVN
         CbeweAezQ+I7rzQOnbLf/Hb7LQCu2jIuF/Qglro7acpGAxLAxgKsA0d4l2Lrxp7epkgw
         Ow7woWpibRuzewpIqA0eCenhqOor8hzrSyFvE3idwy6hSLgqr9Uiv2zNWYAWp7wq5Pxg
         s2nB3OJNjgHMO1ZnLwv4SgS42ysEYSxjKHydFRF+OwM2NTDYJFct6sXy375skPd4Kxnn
         6K9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AauJ+bB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4feffd2d7si1091663185a.42.2024.08.19.02.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2024 02:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AauJ+bB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sfyrN-0006cJ-PI; Mon, 19 Aug 2024 05:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sfyrL-0006b1-U7
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 05:39:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sfyrK-00070u-An
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 05:39:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so414844366b.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2024 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724060368; x=1724665168; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WZR2wo7glRF7OOI1Qdgt6BsZQnmRkJxP0gRiBjk2BGo=;
 b=AauJ+bB05BK1cn/nyopGUwiBODD/FY9VEto+8OVIAR9nwEE+GEgAyOFRpJl6TvmKd/
 WJD9NiVjXT7t9o8PQLP42kRvBL/dYAcXb+FsHQF0PjnCI2jvlxPaWu0mugFAh4BsNW0B
 nkGCO4s880twmjlNEm3TolhQXnG6KZRMbrZ+MfL9Sb8/e1OTTpI6SGaFAwYYcRbreUCg
 StSQsJ6xjEgQ+uusMrWKqimjBZPuk5cuMENb0R27SGGoQhUuu6Vyv1X/TzlmfSMeGpIA
 YIFxVYtWejOYBFAdVpYF6WbkUW+fCmEpaAluA0qhyq3wxvDR5UUbf0d/L5pXwPJuJ96+
 7HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724060368; x=1724665168;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZR2wo7glRF7OOI1Qdgt6BsZQnmRkJxP0gRiBjk2BGo=;
 b=YX1lNtHiJTrGzqMWdJFnfh8xMyMSA+Y+qcsc0HHlIt/JJyWNuUx6tt9GF4mFxB5kTk
 I/2dSSHVhP8NiAcuSB2L6y81gu8De7VALxKMUwQy4KMvfWjCQNofk8cF23oAhWiOlvGB
 /vtGBeWhkQZSulqmUr/On8veYpWzN9sIzpH0ca0I/QvtrbEo9m2Sm4tPDneucdbzVQ9y
 CFp3rRLcd2uXlWN2zccVrTROu+bD2yoUGmeR6trIkhAiRVAYau7JDyngseJF9+Jirr5q
 57+xolDmEw72e7VwBsmKBjhgjV3Bhvu3EGguDXMs25BK6Xkxd+CoDzuHQ0zCraMcS2kA
 PMAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV38mvXuLBLJzQ7hLUmr6O3e1Xzlbuey8A533xTJHA23cxjAWsUUYsdmKGd9p/9f2+Fol3Oj7hVGYHr5Qikx9E7XSg
X-Gm-Message-State: AOJu0YxxxiZyHLx8WRY2ZnyWe0kv8gUusSM1QeH9czfroK+3hNronEBV
 5D7XY5yKWemc/LoVyqEI/bC1W+AdgvDy4VbfVHNi3NGkjOuwBvD9vkn8EjT6DTs=
X-Received: by 2002:a17:907:868c:b0:a77:e48d:bc3 with SMTP id
 a640c23a62f3a-a83a9fed300mr514263666b.19.1724060367333; 
 Mon, 19 Aug 2024 02:39:27 -0700 (PDT)
Received: from [192.168.200.25] (79.186.29.241.ipv4.supernova.orange.pl.
 [79.186.29.241]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c687csm607207166b.9.2024.08.19.02.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:39:26 -0700 (PDT)
Message-ID: <454683fd-e40d-480b-a767-8cee95fc9624@linaro.org>
Date: Mon, 19 Aug 2024 11:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/arm/sbsa-ref: Use two-stage SMMU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>
References: <20240816161350.3706332-1-peter.maydell@linaro.org>
 <20240816161350.3706332-5-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20240816161350.3706332-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: 9/Zfd3j/SZn5

W dniu 16.08.2024 o 18:13, Peter Maydell pisze:
> Now that our SMMU model supports enabling both stages of translation
> at once, we can enable this in the sbsa-ref board.  Existing guest
> code that only programs stage 1 and doesn't care about stage 2 should
> continue to run with the same behaviour, but guests that do want to
> do nested SMMU configurations can now do so.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Yay! Another step in getting (S)BSA ACS pass done:

Operating System View:
  304 : Check SMMU S-EL2 & stage1 support          : Result:  PASS
Hypervisor View:
  352 : Check SMMU S-EL2 & stage2 support          : Result:  PASS

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> ---
>   hw/arm/sbsa-ref.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index ae37a923015..396abe9c1bd 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -621,6 +621,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>   
>       dev = qdev_new(TYPE_ARM_SMMUV3);
>   
> +    object_property_set_str(OBJECT(dev), "stage", "nested", &error_abort);
>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                                &error_abort);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

