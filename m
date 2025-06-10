Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1404265njc;
        Tue, 10 Jun 2025 02:30:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtTY8IqllxEQHa47y0ruIdolviMGYn8ai1VSckr9aZ9+80E0DKE/L7jga7rTIvmo28ZHOgLfrcSOSKNw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTBOjqfSjEl2ZHvLltqfRzPDuCiskgFONa8mpnBRS8QPy/2zCkIgbpPYQASTacqyY0iEp6
X-Received: by 2002:a05:620a:4492:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d390127a1bmr1437260585a.43.1749547824421;
        Tue, 10 Jun 2025 02:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749547824; cv=none;
        d=google.com; s=arc-20240605;
        b=SEowvfWQ8vIkcOtEdS/z/HGj4Ewl7cgwaSLxjL+INLVKBYi6xSI1UOIpP4KTwiP+32
         Sas9Lcd3sFC2F4XLtLkD2RgauEX5HJwVP6QnzMBHhXMV/+KzbuWsQpjeeteiw027FzKG
         Thzww0ecl4Y0W9az/Q4J3NhVgBIuSwV1adFo7yvsVVvh1vzmFvwEdxcviWYAUVjy+nNh
         vEK5UZOtk3UM0Ni/jhzpqapmeQFhJ+27uaGwlpmtbdvav+iZiYO/E7gIWxZURtTKB0wh
         KGK7KPrBNU0eOD8gkveEQOeJPN3GClVMtGsr2nmWlRMkxVDgwNNSZnI5TUeCtuB5sPta
         x/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ciRjeOIPXJsnOjBHMvIx4F0UVl6dPJTInJFKPVLHeuk=;
        fh=0EWUiCrBUHVmgTtUeWlkqUziIm7tOMHyK/N8UM/SYwI=;
        b=iHYDgGCgS0urWO1oyd8sSFQjd5tsFyZbmf4QHjEC7tK+Xv7S292+kx4ndaA5ZJ59vl
         My1Ak1qUlsydMyRFdo5sKsv7TdPyk6IQ0LtoPN6nnELdsLc00+1rTr1JILNz0i8kxzVz
         pkIFnEtBvZJvhMVNRUYgq6dUPzI6Dm41BH6G1VtWF0sk8IWpjrecymnYg8oBfE5pGZYr
         wG36SFbotcAubfXMqmtwImyZAPs+8wr/NZApiL2qir5R0xRe33SQvOCLF+AxbWmnJEbx
         Qj9/A/IkfHpURz7ElSdMQ7RYusJlwIvgKq1lBO27QJR87ZNwZVmrJYX0p/6sE77E/6uo
         YBFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6k0kA38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3d23a9si956091185a.14.2025.06.10.02.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 02:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6k0kA38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOvJ7-0006xo-CN; Tue, 10 Jun 2025 05:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOvJ5-0006xD-SI
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 05:30:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uOvIy-0000FZ-K8
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 05:30:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so4309862f8f.3
 for <qemu-arm@nongnu.org>; Tue, 10 Jun 2025 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749547802; x=1750152602; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciRjeOIPXJsnOjBHMvIx4F0UVl6dPJTInJFKPVLHeuk=;
 b=z6k0kA38GTSw/VnCyFo4NQMivBKJQQFM3b7vUf/A5LthmUBuo0BkO4wip3c40PTN/+
 LgTnsuiEtepnHto+6WOEF7doYONUyoGVc4L7Hjet7WnhFtgk0DuVn6H0wms8vSpCbNrD
 /VOGc/vkmV3Jr9XRsQfRYl6jCShbXnhW2GUYl2OP1CecfeJhc1bXXyWNi/8WxvaD3a+b
 OUlp/Viq63qq5v9WlcIbzx9//kjNYYvZa7kWYqCQJLvNAoP3CmxdQqhLIpVMixzPPcjB
 jfJYoM8XV4DlPU8IvuKI1sHRjgduI5cJivKTK5GTC8YaoFIBxsT5q6MOZsLk8MgOer34
 /U1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749547802; x=1750152602;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciRjeOIPXJsnOjBHMvIx4F0UVl6dPJTInJFKPVLHeuk=;
 b=lAQT/4l8Q6wDL0fXOjrdqxEzFjP/ZwWM0ATvOCp4ODcqMVKZv8/qPqq+P+XBrvbwR4
 ZVLwKpPiPjwsCuZtwaaHggIKE5h9V3qmqH+JZqHf+d81MiNacaHCI6Tza/JwpC3D+/Iw
 v9v5D3/7Rgpg8rxbDSXS0F1Cp1DSQxjtdumGYQ5NucSFrwZF6EZWZcSDMPjaUv70I+zs
 vWHvGX6KAaFDBQ7jwc7UtmxyHiyJ/+iT2DFLnxPIG9GR+yIMySB2sIRz9bN5CfucXKmj
 BSL6TW6uzRWKaHUSZkGi833J9q9QpY6sYurEuhJ+FQYM3jANzwUWYx8qszI4kcmuTISO
 7E9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGjn1WrWShLR+aUDpvm2Sq1LFLDrLwTz4iNHkcIOA4Ik1lF7ZAOdJK+OJeh3H5k8SnXP2Yvfl25Q==@nongnu.org
X-Gm-Message-State: AOJu0YyANg4rd+XLtLbEMANkCLb6SugehNFep09b1p1EPO2Wns1gLh9j
 fVAs2NBfRozhhqqvAz+MzaGABi7g4wOt9Mlf72L8c5+VfTbtOIWv0uhdKhbQLndEWslxJE1Raxj
 mfwGYP6I=
X-Gm-Gg: ASbGncuZG0xY4A6kKKHGc/UDs5wAzstc2Eg3MG+6vj2ZyY0xUtI4xpGW+8i6wgZxqKv
 r716NQx6e2JsIHAJ7tyeXVeUqKi/iJW54EZALhI2knBX8ZBwqwUYRHjJwJBE8latlIAi1LjZ8Jx
 8lQIZMH00TdkCpNGCYB3M6KpI9AGlrhejjLmnGpal4gL8Ic3ZgRM2LUhkxaPYMzyRUikbfocOYu
 IPWqo3foaE1DkRD/b0CPdvFyER/vjhn3uEn3Ra+SPYdgwfmYXv6E7pZOzStMpTdIYw0ORB1lBG3
 ehu1ZpeG81bhY43z9/WzTFjdXQAQ+XAbiJRmniboqMqb2gbK49fLb911zJImJldm1bjxnzbBM3u
 XNTSiK801u0+28c0J4wCk2bfHrS96/Fem6s0=
X-Received: by 2002:adf:a3c8:0:b0:3a5:52cc:5e29 with SMTP id
 ffacd0b85a97d-3a552cc5ea9mr1009854f8f.7.1749547799562; 
 Tue, 10 Jun 2025 02:29:59 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531ff595b7sm6205565e9.2.2025.06.10.02.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 02:29:59 -0700 (PDT)
Message-ID: <b85339d1-4347-4ac5-b0ba-47c9e941f28c@linaro.org>
Date: Tue, 10 Jun 2025 11:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] system: Forbid alloca()
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hryTmXePJKaZ

On 5/6/25 21:35, Philippe Mathieu-Daudé wrote:
> Eradicate alloca() uses on system code, then enable
> -Walloca to prevent new ones to creep back in.
> 
> Philippe Mathieu-Daudé (4):
>    hw/gpio/pca9552: Avoid using g_newa()
>    backends/tpmL Avoid using g_alloca()
>    tests/unit/test-char: Avoid using g_alloca()

Patches 1-3 queued.
