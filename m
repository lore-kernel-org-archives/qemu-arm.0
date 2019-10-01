Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8521482wrp;
        Tue, 1 Oct 2019 11:02:17 -0700 (PDT)
X-Received: by 2002:a17:902:a40a:: with SMTP id p10mr27264556plq.149.1569952937156;
        Tue, 01 Oct 2019 11:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952937; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbJn7dUDDbz5BixZWiRKYD4UI7pDMFysxKgK+P/tAtw3S4hPEKfxV8zC1ndRagRFoW
         9zSIr+IW4BwArjKYpX0q6kC4MpZx8x8aEblSfaC2nVzyaEpEdv/Eck5QmNCvkseUs8JX
         iOJ7qcBqQzvydbhhfNZlxnTtlpu4zeZMy267zniio2XGx+7rhgPoaANlYqHNLEw3LTqy
         r3P9UepFSZOefTiLRgHOkA2cL1iUdcb/pGtQDJ404/TzDdCrLcauqCQAeNpWysQBpxzt
         eo2MrvMoaoQ8kSU1ZU1ffWMev30Xi4H49XPuw3QyZ9QksERNWeRTmpv0Lj1PLk8feYkI
         FbMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=2XXEriAxokMcV7VOY031/4RQoGYJDLoaB/07nRGpCKM=;
        b=S9GJO3km7iKXoR+YYrbEKRyxe3RRv6gEvhqIDmma350aiw0EOdyZL2xlk2TAkkmaKa
         DpymKn476mB3GXsAK80PgWuQglK9cFJTRxghDIQPgjLFPSpNh8NSTsc2bXakkf0/ZREQ
         /ZItZx2PV6wFfjoc9Z0Rm8OIpBpwfOQJ/oKwt2bGlLXQ6mDLKxhc3sdxZbWPaPQO2DwK
         U2moM9WkLmDmGWa9uifBx/SuJuMtnTkuI+TzFNVS6ozwoI/e6gS5d8va1gMbbtPj8x2y
         fgiWjdrhwRxWLQqVnxKouiBwEhA4JK+KQ4E35lWSygS9VENHdU9irZP90QNIl2PRP6cQ
         5Cmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcSKQVJe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s137sor16591074pfc.9.2019.10.01.11.02.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2019 11:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GcSKQVJe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2XXEriAxokMcV7VOY031/4RQoGYJDLoaB/07nRGpCKM=;
        b=GcSKQVJe0hDgfuUVrjwf8cbVpJsYjZJ8FYiDKjunSttpomWeGlaVhfljPY/+JtTcAJ
         GI4bjuWcDbmE/xGI/K1uIHI70u4ML9zHIf01veQ5UgJ+oqrNCQP7Y6haSMqXOV/NeYB+
         HTBkbe+q6L9+6drCOEAGDKZktDfBn+1fxswfMajwGEBTBTzxJ+Exy8FecNe/t2+R7N4t
         QR+OxZ/e7bdInv6u5DhPfyEgF44AXxuL69a6O02eGU0YwoZmCE1DAsV50V2o7X9Ct4oJ
         AuSuT7enz0stT4TNTC3dty+smG6G6emQSUnHmp6K9hzbc1mMKq1T7WLH+ffYB7uphQMq
         4eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2XXEriAxokMcV7VOY031/4RQoGYJDLoaB/07nRGpCKM=;
        b=bpCjNxMEXCRBkT59F1oA9t+EF1lg5BUB0Pa4c+JUqLz5K1dgxjt1+GjUcvv+Gknb6c
         L0JiuFMzm7lyBDJypPiTb+Y9vfm4DTQu9jZibgJAIJ6vZXJnpso6xlu9q5e9fvkZxj9B
         YKlSPw5JKOY64KKUnA8uTUWG469za0tlFQRC0wh4jYTA7/xzJF8Q1HxUiCUf5yYBhx4u
         h6MPdijolsWlxzJEJSZEpCiniRk6Gi4AO6GBdhItGte759FV63/jOD4xb3EC5NKgjh5L
         3hq75/DC5laOvcpFU2iTHjmuv67l9ZOuPcVnKYXxazCpBM2v5I/6OXx/42FEi79DJjqc
         Tb9w==
X-Gm-Message-State: APjAAAUsBoIiM/tDOhCEJTiNQYFfBO1u/l3x/tV7sx5gfKoLoyLOLSJC
	25CpC1l0LcuR+j1evnj5faj9+JKw
X-Google-Smtp-Source: APXvYqwkbbkDV8sT9mZvbQO/xf2srShFmxJ4hZ0ngt3dV9YdFQYTxA9H+mo/23++bqgXGLQqotirmQ==
X-Received: by 2002:a63:dc13:: with SMTP id s19mr31102952pgg.272.1569952936575;
        Tue, 01 Oct 2019 11:02:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id n6sm15997932pgp.12.2019.10.01.11.02.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 11:02:15 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
 <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <58da7aa4-877b-2c85-71f5-e703a841e6d4@linaro.org>
Date: Tue, 1 Oct 2019 11:02:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: C3WTW7vhj4kl

On 10/1/19 10:56 AM, Mark Cave-Ayland wrote:
> Just out of interest, which host/compiler combinations don't currently implement
> int128_t?

GCC only implements int128_t for 64-bit targets.


r~
