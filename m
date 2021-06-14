Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2287475lff;
        Mon, 14 Jun 2021 13:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo6UVdH+IF26VdcUw5Ut04hJNdRbnj/3fcgyJ0h54k+JYug8XCbu8lSAAsGzp0LJvCoVsG
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr20486317wrn.398.1623701874095;
        Mon, 14 Jun 2021 13:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701874; cv=none;
        d=google.com; s=arc-20160816;
        b=Ubv7Gbz/UKEh96RIILdGP8qgfDRnY7enkTuNZ5bjEQ19XqkkkfRQjZbREYVUxG44IL
         IuJXKGFKrq3oDbVUvqZAjBtDy1Ubt5Jug3bJ1v6TAjI65sH7g4nqn1jtEfgestmYCXun
         75MjIX1DbBXidB6i2juEcLcQC/9UXztyb6G0ayEBYhfwsskO6aEUiorNnwHLkvZsDIeV
         mFp9V6qjYD8nOjO97+fm58M2DmOj6sm7aMrYmETrgDZw88tlXXtwrxiZD7+GEacXGkUT
         aptm9i+u0bEFCzGmDBLibc0oRb64J7ygCPdl6xfUpxPT1UP/8GXfy7T9f4LG+HA9CAWL
         Oj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0lKBvygDFFWdJY0bwM0bkHFEDkflbBmzcOu2QW9jtg8=;
        b=PHsU92WAiV+6RjtS04arVa+t0rzEo9qSx2jJuXqOY7qah9Y7HyLyUuX6xb77Ef+5+V
         RoAVwbZogBuW8L4DE7kdKCDKmMN8BvRJHIzHwG7VGiWOKM+oapSD1g4Su3QIoxcpnYfw
         L5rcCRC6aVy7Cy9k+4oBSmmzdK3spAooCniry9YS5NWJsTMS8A83vIiFZo9ASuWNjXDM
         tc4aoBGyyy5PTCbELvLT/Vv0Ol3i+oypu5vgyxyjKXw+2xKuokuyWYUnujvOnbC1DjiQ
         vIhq2ZXOsWSU1fylxoEMPLft3zG5drtPc0B5TERa7hopEpBhJx9Vn9pneB5ykoNQ5T1C
         WZjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFnlbFl1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si5029550wrr.458.2021.06.14.13.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFnlbFl1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lst1t-0007h0-98
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsszM-0004Jl-6P
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:15:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsszK-0006IQ-6a
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:15:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id g4so10443216pjk.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0lKBvygDFFWdJY0bwM0bkHFEDkflbBmzcOu2QW9jtg8=;
 b=sFnlbFl12kezsijq7GONVzz3ITZLU8YZ0+VnJ21IkgxF1Lz1pMufOryNgBsJlGXZvH
 AXg2EjdcP+npaeZp/FP54s27VCBeLaFRb3LZxDBWT+jjqEvenBG/5zMotkTl2HU0ppgD
 ec/XabSpeLkxlKNUo1I9c2AViIA7OcliC/4PEZA/MVKoWJg8Jc7jEM93nWvTA9r/R8V/
 4bwRKI1QnCiAtcFC4Groew+r7SaD5+KBse9/nU0CCP7Epl6Kxjg5ov1pxOR+2LIdX/1i
 BHvK6UWrAQHISnbd4WuSps7y8hcHu1ZxsQONzX8MdKFQ16njVvVuTUDB6vN1mGIe6GR8
 XjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0lKBvygDFFWdJY0bwM0bkHFEDkflbBmzcOu2QW9jtg8=;
 b=KEoXXf5Ric6nuzIwuVd9b3Rv1E34fA0Np99XO4wkIpQjNjWxhMrHNq0o0+hFsVWDtx
 koFScxuyh5no/q3ImEtXGaJd5Rp9jBGTD4eI0/KMbmFzLvyYQWbmQ4NrhVsGolkvowTM
 qMWTu96IjXOd9EtKndd6XbV7C/TMSOi+kTq0SVQ8+xGdsGFx9y9vl6iFqv/4uovThUff
 ru6XWoB2DqNGRNYK8g6PLLlEQIuaajFqGicjOYaehQuowlzLhMOjv6rgHRcqM/Q3Ec9a
 oIvWg53BC7dx3Wpb1If1Pb9atgK+yQyJRrxwRFX2fuF/cNSP6kMtgugB6OatpVix//uR
 Rg8A==
X-Gm-Message-State: AOAM531AYyXs76okSzT1F635PMlt7nH8c3EQoD9/jawVfqpMODC4/8Ee
 JPeb0gvxjAbPO9Jht4HMYUS+NYrqG/2d1g==
X-Received: by 2002:a17:902:860b:b029:103:b23b:f1c3 with SMTP id
 f11-20020a170902860bb0290103b23bf1c3mr884099plo.34.1623701712839; 
 Mon, 14 Jun 2021 13:15:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t5sm12941391pfe.116.2021.06.14.13.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:15:12 -0700 (PDT)
Subject: Re: [PATCH v2 22/57] target/arm: Implement MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0ee3487-a67e-3004-5926-a36910263b6f@linaro.org>
Date: Mon, 14 Jun 2021 13:15:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsCvZ53wxad/

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VDUP insn, which duplicates a value from
> a general-purpose register into every lane of a vector
> register (subject to predication).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/mve.decode      | 10 ++++++++++
>   target/arm/mve_helper.c    | 16 ++++++++++++++++
>   target/arm/translate-mve.c | 27 +++++++++++++++++++++++++++
>   4 files changed, 55 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
