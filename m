Received: by 2002:a0c:aa14:0:0:0:0:0 with SMTP id d20csp524240qvb;
        Tue, 24 Nov 2020 05:03:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA1tdCSSGNgwCJn4hJ/hSFrwA0QFs5guTVD+A+S4ZWDojZ2RF0hAKGQD622UZEFWWakP6Z
X-Received: by 2002:a25:428b:: with SMTP id p133mr8194164yba.261.1606223002966;
        Tue, 24 Nov 2020 05:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606223002; cv=none;
        d=google.com; s=arc-20160816;
        b=a0AGKV0axpLZ5H/98uxFYPS6rwklCgD1uvYiTPmp/bQf6f0vxAeAJOb4OSjF3eGeZb
         /Tt1BrZFE3VUz+BsELgUDC7ocOz/Pz2t8yWTQPxFVZad/PD8zVwFUvKsVffqJHTSNdw/
         2gBh4+dGTF+CRvMwSsnXhhIOdpO9x1LKZ9tM+Nly23ih68TtT/jLqbzDLlsZ0EcOOSKO
         nDsTn1+mD3c7YYpNgQiRsDr17y9vdIHE1a6tM+OnXs8K51byp3WBvB1r0lkAzyaqjarr
         BNdNVl1q42Y4B8u9O3xvy/dz9tdXGztTYVbi6YtespSKyfaa7CR6cxqFTVd7Zq4eDb1B
         Vllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=trYMOyrNje9jTZ9widsc4j5e7wvzlBx0xBYRijPE5Ic=;
        b=FG43EOn/yD6CuTT3y7iivomOswUPJ2/RVVQszsaLHT+4lTGvb45lRREDmc+6kKftN4
         6e4V3RZeQbWHEZKYwJ/30r4LKxz3vpgvBwtr5NE1Qz2q8pkSRtvMKSD1Bs6o58oH7AMy
         bzT3sPHqi4zy+ybAEmWLRTliS34DW7aXbdHn21T1OsmlGpm4c6hqqbHkI/qKO0RlJbag
         DguJ98rC5GIeZjG1u3iR7r3rgTDXgNNOFp0rq/RAWIZbC3T6XDZbXHlBOf+Q+i58/1If
         JjJeMiSVKcOC/aBkoluIDgjn4eaei/vp12tT4wN+8riMBdWYkwhVIaUPboGm+KuYqrCm
         WUbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yhM7Q9Mm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z64si17367451ybb.247.2020.11.24.05.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 05:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yhM7Q9Mm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khXyc-0001rw-Ek
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 08:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXvf-0007UM-7c
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 08:00:19 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:39247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXvc-0007GK-Nk
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 08:00:18 -0500
Received: by mail-lj1-x22c.google.com with SMTP id o24so21886787ljj.6
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=trYMOyrNje9jTZ9widsc4j5e7wvzlBx0xBYRijPE5Ic=;
 b=yhM7Q9Mmb/0l/EkJtVBLh9qS0BgANr02m24LyevaKUAFT91o4NBM27vOzU3gtmoIHF
 uLBO2M3eDp+y0T0Hty5iKwYx3+vKLK0XHQsRZz/QZZEzQBJSrLSZKSjJKCHaKtbunCdA
 J3MXf79UUHwoNH6vTNg5v+PRKMBVvB7uGO0jvtNZ06Kn9goZ2/dDfV267/z2jxjoC9pm
 uh9k66Cdt1dGmqE0KfWZcvffbAEdhAdbsITqOooWG4sVD1spViOWNSfG8hiy1d87QXYo
 PWaW0yVz4f9J7JHKh0olhs3XgtIAcW/ZhGKpGFvYqoHSrr8o/wGaZPoBUMCATPvffBUV
 M0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=trYMOyrNje9jTZ9widsc4j5e7wvzlBx0xBYRijPE5Ic=;
 b=ZveoboFdkAQ5WqoCTKalInEVgfKjLE9nSoabqvSlDicNu0WTkjlqu5zsP0WsEpD8Yg
 /5sJoZQbSjWehBhwod9D6/6CiRuOSm4IbS3e19v8rCWXS62lZ7fNqNyHM/6G6fs/5pwX
 mBlJt+VZgDE/S7JkEG7o+9Vp9cwdW3yohErRqyDFIoBzlmyVL35tncPGuk4YAL/Wfb/6
 +0a3qa1qbvLvV5I4logL4MEklDuoCv7gkQ/TNh1DogagVREsGxke54H9R8obUUmw7wuf
 v634Gn1o+7zULQ3Osxc3A3rOJ9cAzC1rZhGzKDoZFWbMgVTsaXi5aibi774wHr7iLqzW
 J8LA==
X-Gm-Message-State: AOAM5323Qt/gW6oDZ+IWDl5/rs9DaKV5PMgKDrytun/yltoBMNGgGgre
 K6wwcBWgQvlcWZABD2ROXvKDeg==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr1655582ljk.352.1606222814531; 
 Tue, 24 Nov 2020 05:00:14 -0800 (PST)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl. [89.67.26.161])
 by smtp.gmail.com with ESMTPSA id
 m21sm317239ljh.82.2020.11.24.05.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 05:00:13 -0800 (PST)
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
 <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
Message-ID: <6ae25fdc-0204-9000-57a8-04136ebe70f6@linaro.org>
Date: Tue, 24 Nov 2020 14:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VVa7sPTrKQmF

W dniu 21.11.2020 o 18:09, Richard Henderson pisze:
>> +static const char *valid_cpus[] = {
> const char * const

I copied it from hw/arm/virt.c file.

> Otherwise,
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>

Thanks. Fixed patch sent in separate mail.
