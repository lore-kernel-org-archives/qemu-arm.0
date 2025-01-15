Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3175347dlj;
        Wed, 15 Jan 2025 09:17:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3bZqVuL5Xj5eKH6gufM/cmh2lv5PO3TyQLGT+P/T4CFxHJDWH9sYPAYPnz94gW23VHYve3Iu43eU+UA==@linaro.org
X-Google-Smtp-Source: AGHT+IGDvu6XWuMzGikB/CuIDN+q0gqv95qpbLymH2j/cIbigm/6aQ+fcEngHE4i+XB5Wqqec+9Q
X-Received: by 2002:a05:6214:3009:b0:6cb:d4e6:2507 with SMTP id 6a1803df08f44-6df9b25c894mr458005666d6.22.1736961441297;
        Wed, 15 Jan 2025 09:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961441; cv=none;
        d=google.com; s=arc-20240605;
        b=AkjV7E5MNfY8attcbZJ6gSO1aOVPmpGeOovkdQLX67Wm0taZvbr7VvHRIF5ow0jVCP
         Cu2Ivr8s1S/94+998bo3v0Mfp43YkDXURvJyxfNu6x2v2PLYXQC59vKpJFf1fdPowU6x
         kqDWwuGuSjcbFZL1LiVXDslsLWaHtG30wRSyubipvGIghIUbfJxTyiTmf0/VnrqOWfvo
         cGOhZimkjbZAerFa94zwrgYkMqZmnbsJjslD1RGmflQ3Xc9cOu6Le/jtEdNkiR3vFfss
         iBBdUFC7yLtUIYVy54j9VHcvY6DwnN8gAGjE2Z9f4VvdbmRLu1bCgr7I/wVZNMEMdPVw
         pEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ivLKXp6s1QQiTYfBvfdOtj5QgTq8OAT6npLYYBJIVgU=;
        fh=xX3wsNTdjvC/vn265oF/8ED8VQZAw34jj2A+q3yAcgg=;
        b=O4/Clhka0fY8AkxZG8ukNBVFSSeGLah8dn4EZEQvp1/T+iOA/aBFmhce2S9AP4i4+x
         kzqSTBkmjJrA9Sh976HqQ0/qc8c2UYn2wHB9GgtR5gSbVFcu2kExqYFSXy91+N/jUXCl
         sYk6YsSM+DT+qoF6NciocCogYquHIfr9SqvrHd3CHSlmxU5P2CoPMRBE4lETfim1yAOm
         TJOR3Ve5SkBe2XC7vV+6QFzj4OhQyyXyG8GsRnefOTnASrMIABRo2+IhZE0OIFOO/aIl
         uAe6ZKnx6EkUaHz1CHBzMJKAb8cS6VpAcF/2uNNHEd45etyOzC6X/7rXPkWkwACF5m0+
         DGOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npmThJRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad9cffefsi148701166d6.125.2025.01.15.09.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npmThJRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY70L-0000w5-Mx; Wed, 15 Jan 2025 12:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY702-0000qc-PI
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:16:23 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6zy-0007Tn-FJ
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:16:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so71936145e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961367; x=1737566167; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ivLKXp6s1QQiTYfBvfdOtj5QgTq8OAT6npLYYBJIVgU=;
 b=npmThJRsZp7GeVX47k0U4SUeXfBMP5m092ZoqT7RaWLYhKIXIXvpEezqx9qnl5CQcU
 ttkdBVxJEsy6X3xpEPSbb2puWexJilh6o5Zryk8MYMp2j5yNReq32Z5912V4ktaZSvP8
 4bEOlbzEbDE8hB9Uebw+mOt90moy1z7yYHOmfGxJcQ/pTorWf+8V5jKaSrjMnF4/dQ1X
 y83qS3vZl3aK5T7NujpXxsojdSANsmHmxGY/S0CE8BnYDI8goixpfMiqzrxJCW3OyeYj
 E9FGmmJQ0JVqjwIzsDGqK8LJlJH2I0C3xndAYfwFSD9MTe694bD1L91bJVSLiE1jMjxA
 nagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961367; x=1737566167;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ivLKXp6s1QQiTYfBvfdOtj5QgTq8OAT6npLYYBJIVgU=;
 b=BLfM7r39Ytb5PTRfKFCElfLOqO/gBH5+xwrADCYTXpRUkxA7AO4Ibba0nojy8ONxqt
 afh1fiT8QJ/DVVzo/fbGxpSY5iCjKou14DqOdqa7EnicXX+OXkRG34PjXNJJPgFZCkyW
 G3+uKIpAGpB1Cgd8mbBqJGkfw2C+X+EEo1bZxht/k94Ig/g/xeyIHCoFNv9aBqJhgCfq
 v3FCAqhFxyzpaMPcw+SOKPsBBfaDMWl6o3onOreY//Ju4IZjWbGvjvoDQOVKqO3s6Ka1
 lWJ8GR/ETuoJYxZmo3uf1+6e7BUqh8F/MSvrJO29sNh3ZGSZtCtkgcuWLmdM6Kgn9lew
 kQfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOzrPt8C8Y02uXvedquEohvoQbLveNpmJppVgJHhDs1qtuRNeUtoqF7pnmNSEl/9lsHTJVMpu1lA==@nongnu.org
X-Gm-Message-State: AOJu0YzG9iWlHcRoRT0nIJlyBPpflYrAJgZQlN9ZIZk9SdfPBZXGu+gN
 f2AqOKvqxgzujFBnTTj/5r1HStXfyIjMKcUFj2w/RC6p0vihZb+JBM6CQX/3vMQ=
X-Gm-Gg: ASbGncvAvPs36AhDf4s4rqOZognfcQTztzUiEalGVE0VNHCT0VomNQdN+9Qxp5LD3Y3
 44A9Tdw64CrySy1txt0o8oZPTXLnRBkO1f1EsK4waXPMJ+rJHIgVf2l2ItZpZ3OrI2vhhIv1PpN
 KuMzypq2NTXEJSHnfC2jDc0x5i/nJX1eRWpOVpZzj4ncPPofc4DmjJGI0xgwW1vTs/yMxKkt6Us
 A4xvBs2Kdv6+7USLNnZScEwSa8i/rlpxyv3g6KLDQqvQP/GXgSEEBGHE7CVbR4NX5aqf1nxM0QW
 BEws0gsDGx56mK0shXX12HjX5oY=
X-Received: by 2002:a05:600c:5801:b0:436:30e4:459b with SMTP id
 5b1f17b1804b1-436e26adf89mr302487065e9.18.1736961367623; 
 Wed, 15 Jan 2025 09:16:07 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74fc57csm30795175e9.40.2025.01.15.09.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 09:16:07 -0800 (PST)
Message-ID: <b81472bd-8d16-4cb0-9e0d-d1488968c50d@linaro.org>
Date: Wed, 15 Jan 2025 18:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] hw/arm/virt: Remove deprecated virt-2.6 machine
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
References: <20250115171009.19302-1-philmd@linaro.org>
 <20250115171009.19302-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250115171009.19302-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: YTjYVYG2jdLf

On 15/1/25 18:09, Philippe Mathieu-Daudé wrote:
> This machines has been supported for a period of more than 6 years.

Typo in all this series :/ To be replaced by "This machine".

> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   docs/about/removed-features.rst |  4 ++++
>   hw/arm/virt.c                   | 12 ------------
>   2 files changed, 4 insertions(+), 12 deletions(-)

