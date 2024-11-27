Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp574879njb;
        Tue, 26 Nov 2024 22:26:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPFHlmAw8tbsj12eESRaYb9RiyqskVMGWKK2jp1b4CusTHcZZkoemEK4jGybwKwOzM+/LQ8GAM7qsdVA==@linaro.org
X-Google-Smtp-Source: AGHT+IE9s/IBDuxCVbp7KxCiBV8EDTY3jv6zyoyOVLyQvuAGZlLMpznJfR5jpcYxUj17+NVsflIz
X-Received: by 2002:ad4:5bc4:0:b0:6d4:18ce:1191 with SMTP id 6a1803df08f44-6d864d06688mr19256986d6.1.1732688795628;
        Tue, 26 Nov 2024 22:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732688795; cv=none;
        d=google.com; s=arc-20240605;
        b=aBd7mxAeITjUxMxh7sQPh246TVHB/8fMhH5yxenJ4+d6wr0mgbtoWe0mDVe4/A3JDL
         RZJldw2msYJNT+X88MDsXZesOoPBM8mkfOn9wIWmsBFb7RCrRSxsUYLFiMovPiqB0det
         dlc0NAuEIE+uKNLuYA49lNtlagF+mrF5GyQw7frDfAwq9Vry9761i2GVHFDYh42E0TOa
         Cn8XrzX3Mdjimq2S4AIK2DdrMDJyiC9EINyL3vg8qyqfZrKWngFye5ovmX/lID45QFEy
         /Gb2dSTMWqtk7jjz9Zs20VFuTXmHJkLfZtiLObMF90y5ZqQyx6qfc6cc7ia5pJS3V5T+
         MLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/cS4h1fIAwbA8LEtB5wlviHudN0b7lmDgjqOKKV5yCk=;
        fh=eD36IvAhtKcIQ8UePgwHFQ5m7n5k1lhOq9OnwUIFKMw=;
        b=fupWzu3dTIDi2+d3i1D1r9EPQ00IK6ZQUn2dsKlJIKw5Nz/uQa/WPdIXfqS4LQzv/9
         4N4hkB9Kiwxh0S3keYPZtKx0Ymwv8OI4daKnJcsK/TeGgh6womsz4FEp7angG6CQ2YrE
         6dBO7K4qKG1uFP8WBtUaicdZgmWaIAX2jDBGwoQ3qeIjKj3ku/h76KIDn/2lOzQrY++r
         qORFa3OHf79PaL8PVjAzqqHaEd4dgnPs1ntvMwlpNP5DapVG1Slp6L++ZmPcKIiZbJ6S
         L1UoyuQKFJtJnYbU8jfdk6hQY/UV5Jy6r3LVma/fB/J43S4BDxxWiKafTvslaXPbf4af
         P52g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SXe+3RJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b4993csi139965506d6.342.2024.11.26.22.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 22:26:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SXe+3RJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGBVC-0003Ty-LZ; Wed, 27 Nov 2024 01:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBV6-0003Sh-P1
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 01:26:14 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tGBV5-0002aj-B7
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 01:26:12 -0500
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3ea78529de1so27831b6e.0
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 22:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732688769; x=1733293569;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/cS4h1fIAwbA8LEtB5wlviHudN0b7lmDgjqOKKV5yCk=;
 b=SXe+3RJK31Dv0IfniWJLHA45zZzK8KQzBy2C2Qq0AGgDbFDB1L4j61D9aQfXWrmwGj
 eRosukUXGstblAU7SDetT3fd70WduM3S2CXxmIe05RI5yAki54P6RLaeURFILVLQqGCy
 PirfA+DOY+0+JCOlG4arHNrmyM0TYqFigYQHr2oFIe2EdNXsFBy3hNepFDTHcJOagKeF
 Oj3uwWjTyZUF2+UCSvG2iIvVrBX6NJeIQHHxGx9eXGwdKZeevxaYqvCmEOUTSFz5x0Gv
 ysQC0e/VtNQa+mOLWl3HL1t/U93Ks1bM+7EqYcKQ9Lz0brvJVxzuUCqDBq+V6PgEOIK1
 h+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732688769; x=1733293569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/cS4h1fIAwbA8LEtB5wlviHudN0b7lmDgjqOKKV5yCk=;
 b=sIi4rDKCn/MTuLFmSfcw9eAzCqqVgBzwvqlbaqfk3UlwpaReDBL3vGCkSphk7KjuHv
 a+KfVl7KWuR93i4QgkjOt6Kw7aj5z4MaaPh1UXR2wDfnfPwe+1gcumzKljES6J/8jL3T
 kH9KXtVxG6bL4jrM6Yqhl1xhAk6U5uUcgSVahQRQi9Ivq8UN3xp16zv6mjdY4/+n4UQW
 tvLhF3m1RknIenGKtKtS0/qECf15uOnIbQUS/SxIkPZO9VbZauXYvlO/UMTjr7c3lJ8f
 6bYBYlij+2LWjg4Ztf+LsDnQ9ezrnWneIkqdkqATczAdkxuxe//5J+lTceaq8w6uC1j5
 AkFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7HZuzf45fIc6of4ZQPW3aZbzl03b1CNGIwc87Xwgxsrbkmgaj3cSDlPeRAFaAYZ6xHY/Y6uy6mQ==@nongnu.org
X-Gm-Message-State: AOJu0YzF0oieBfgMtLhm23HwBovKI2Wf+ScffnjAZwcDx0cqwQuhyKgt
 dO5CLe9fqI2PNSYXkPHoYAKfDlxopqqdgdHlMCSzxssOMTvvZCnA8Z2GWKndpFg=
X-Gm-Gg: ASbGncvyReONAwnYHeaWxG+qGYc5DoxGreVT8y/wGBX27BPH0TSUEpVDbYeRIuJS3ma
 tSvAlzGXvZYFzkGZHkjrGtWUQJQ/zZ44bgcCedIl85HT3g/iCGlwOn7uLjRfmnnLxA5Xgln+ZK/
 xdQMHsb9SGjame8+3n8Ab25hjFtwCtXh4dRR8OyLPAT50wpQHcaL2bo1Vk2tK+sKyE+xvzAi+hT
 pYKdQb1U86q9Lp6UEUzNILwrcms8v1w6uteIXO4O1kGQDU45cOEftmpAe8nMkE=
X-Received: by 2002:a05:6808:22a2:b0:3e7:c7c1:e6cf with SMTP id
 5614622812f47-3ea6dda7194mr1805518b6e.43.1732688769611; 
 Tue, 26 Nov 2024 22:26:09 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fbcbfc0857sm9813500a12.10.2024.11.26.22.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 22:26:09 -0800 (PST)
Message-ID: <3692551b-4203-4050-b976-04746f6db3e5@daynix.com>
Date: Wed, 27 Nov 2024 15:26:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/15] hw/vmapple/cfg: Introduce vmapple cfg region
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241113142343.40832-1-phil@philjordan.eu>
 <20241113142343.40832-13-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241113142343.40832-13-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: H8q9RcvSdvS+

On 2024/11/13 23:23, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Instead of device tree or other more standardized means, VMApple passes
> platform configuration to the first stage boot loader in a binary encoded
> format that resides at a dedicated RAM region in physical address space.
> 
> This patch models this configuration space as a qdev device which we can
> then map at the fixed location in the address space. That way, we can
> influence and annotate all configuration fields easily.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
