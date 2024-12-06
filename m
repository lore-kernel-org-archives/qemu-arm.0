Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp697916njb;
        Fri, 6 Dec 2024 00:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE2gJm7Yoy3HGzItx94oyVxi6EXRn6QFJcEouYDbn/fEoC6umvOMOS87IH4KBfqGrmbBRNd4bYyF8Ihg==@linaro.org
X-Google-Smtp-Source: AGHT+IGuRRqPVBL0KzHIsqYrPSVrDKZYkgaYhBbRpqpUloHL832xkgxHlJFgeRLoneMbwwN71Y5T
X-Received: by 2002:a05:622a:4cc4:b0:466:aab3:509d with SMTP id d75a77b69052e-46734af946cmr33319481cf.0.1733474308722;
        Fri, 06 Dec 2024 00:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474308; cv=none;
        d=google.com; s=arc-20240605;
        b=VLjvI6dPoaC8rQPLKoOCXBDaBjZUA0RlmzqbVOjvCdI8E04Kbh6GyTJottMjcVIQM9
         imdGZzatgkqGNVXjUmaUfwrCzDHUJV3uvgrMoJEo83VKz2WwQL7ETdYmvdxEQc3FwmeG
         7G2hyHvIhwbRH69jyQPachx8ASl0C+jfxWelXf7E2LDdhz2T6xhCLCgtVgja/Ilb36bx
         G576GsmhI267Yab5K8mLQWQZdNYwoHSBhmr7KpD2d0jSlRHXLd/2XGMCtW5D0pA7hVLx
         5iBEWvjEgJCn9j94CwyL/tEP/5gj+0SIQx4WniTR3VmkuqQVzKtVmxsXJUegIljTusgI
         eLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uFDFhaaPmq8YkHpHPFmYcpG9w/lMjvJgPxWHm2v9YMU=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=fqsY/uYHqT0JzzwTaIs8hDFZ1l0HqxLhvGfkHajrVqpULlSurdtxj2/uB0e4pyzyE8
         S995GM543MRJc2Aek9LnhVSwxofNzvn604s5lbOHPx0AEz9FsEtEI2UPA4o1wxm2zs+g
         aQdJxuRaHoeRvExBbtZ7sZfBuLwF/stAxG6OjWDBwl7OnrRVrGR6KKBF+m3lIVZhrBWY
         2ld6ozVespONYgz2TT3CYPo6EJd6LZhoMr98FXgiENElR8Ygf+a3mXWSAKIZxJVGtVyb
         JCfoetT4F0ppd5XJwqH1mPhcHc6xioIApyLcc2t80lbtGwxp92A/HIavdp3INfdOrXe4
         jAFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K6e/Vi4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729868a51si42241721cf.674.2024.12.06.00.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K6e/Vi4t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTqz-0004P3-Ht; Fri, 06 Dec 2024 03:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTqt-0004O3-Pv
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:38:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTqp-0000hx-1B
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:38:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so12509305e9.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474293; x=1734079093; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFDFhaaPmq8YkHpHPFmYcpG9w/lMjvJgPxWHm2v9YMU=;
 b=K6e/Vi4tWXmP0Cn7IoY5MfPUrAgTPfn+8BYYmLvz/pZwQqR6fAYiC0CSZpOyo83RD3
 M39OWKGnyg7VfnleeBoGE0ib/dodIDEaioZvEm5jIZdn2AZzqEiTIAquO5oiDsytS7Or
 boungvYExCtdGHIgPBr/zbUi0vYNmdM+0mJREOI3yvHveiM8mQRYL4LnbqK/1u+Qoxqi
 bbZkF4984OWhwLS/NyCEnkb/XBxMc0V35Kliv53GEw2b1Ax7TUcBmq4Eicd17sN3/5Hm
 i58pq3/21f/DuETwO3tfOeDrXDkA/8uEl+yhPorUAy23JdhQ5kA+jx8cR4bI3UEiDI7u
 D99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474293; x=1734079093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uFDFhaaPmq8YkHpHPFmYcpG9w/lMjvJgPxWHm2v9YMU=;
 b=CA4MrjywqILlDabJmLN+2H1MlM4oRcBn4IC4R05aC7GmSNMeofEf2qDfzXAMMcs0bM
 O7VGgooHILhnqe1/gPdftbvV2gAZkPeIiLfl5J93Gp9Nulm2vWBffvKX0Zrh0sCUi4Ge
 OoTVIOD6gLcTnCpzcaLhTS8abfkz3erEL8hRi1LJgWLgihPCl8OyIGd7EAQhhlAruGa1
 CAOCX4eks//26S6CtbGWurJ5t3q2V+Qp7IAaxVdw6aYY6/GlIOdVkrHQ1TE4DpB76tyT
 uUvBy/6Yc3x05iqhPyZapv3vmrhie3jmeyChAyqAWxbLJ7tCZkHSBY1pWbnB/dWPt/pr
 j9qw==
X-Gm-Message-State: AOJu0YxboErm5p00Ex5vSUbW55MJR0r4s+J2S+Iqwo5clKj1KDA7/rzZ
 zALidE1/9wQtycZVheu6fmzLjZ/nGa4f8EY3H++iK4cmqOwEM4wmo5MSrXgUiQ0=
X-Gm-Gg: ASbGncsW+0Wy/t7HMI8q5iNO07YkNCdyqftSN3ecvnfTlcLSY6MaVGrQrBNKIMzutMW
 L7Gzd2NIm5xg21mHq2RNpeQAquyoKyKXut1Z1TZT9osU9iwM6HTJpP+59lgf0WTPYaiC1nIJUQK
 DTT2w6BqnH8nXQyMbesVgf93qHW8MmMc89CPGiRxniwX9JPs+1AkqwcNJ8/Tb9bTUILD2HfM8kk
 Bt3mdI6QOfvIo5WhWsxHtP4c6WyxbIi8KzTqTHVXj9jmWAft3yqCNkvvVbnRZJvxE1tcTqTU35T
 9Ek4pmBhQW9wGBssCQ==
X-Received: by 2002:a05:600c:4f51:b0:434:a83c:6a39 with SMTP id
 5b1f17b1804b1-434ddead992mr18632075e9.3.1733474293477; 
 Fri, 06 Dec 2024 00:38:13 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da113580sm51457745e9.29.2024.12.06.00.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:38:13 -0800 (PST)
Message-ID: <428c9810-be20-4312-8455-50aa54bab3ac@linaro.org>
Date: Fri, 6 Dec 2024 09:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] target/arm: Convert sve_helper.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: JuWiD9NND9YB

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-sve.h | 414 ++++++++++++++++++------------------
>   target/arm/tcg/sve_helper.c |  96 +++++----
>   2 files changed, 258 insertions(+), 252 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

