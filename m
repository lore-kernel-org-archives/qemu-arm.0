Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2199226njc;
        Mon, 4 Nov 2024 07:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXetzp+M+DhLVdEHTEtouBVReSjT4ZSQzCepVy79zmATH0/GcgMRZugcYs31J8BV58hyIsMN6qsuqfQXA==@linaro.org
X-Google-Smtp-Source: AGHT+IFpo1iQAXWgbar9uQhhTDoWuzUKCdVn6uNAvmZovspZATML+ZhbblQj+2UEdI1VTYUHYL0s
X-Received: by 2002:a05:6359:410e:b0:1ba:4c2a:7675 with SMTP id e5c5f4694b2df-1c3f9b46307mr1541806255d.0.1730734571756;
        Mon, 04 Nov 2024 07:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730734571; cv=none;
        d=google.com; s=arc-20240605;
        b=CnEo2DdRA2d4sWqeFtjpxb2JH9SSYwPsXvb3GdQ8n8zJvjC3aHx9pOdtqgT328nVC3
         +sKcMXz/T9x+azlA1b4qch1C/HaE7+vgTna07qkJx83q8PR25fYVpw+0UGiwTaSLaAYq
         JglFwuP5lHobQM4K3YvjYchq7I57TRCWOpCtSo/pWL2awTxsiOvNIXCfT2rMCjQA2t0g
         xdsMVUu6lDPwNEVVfAVuHJ3ISozL1s8o5LKwa9BbTNY2oaf0r6o+Xdfa+2miX70e8wrs
         kqdcTx/nueLcNOO4/IFaLmXsVmCMMn4gFNzTbf3Fq2ur3fB1oWYPIQuiOouK2F5Y2OMe
         OMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hKvgXly1z1CaicGb+6SpfFpA2C3l1HDrjzMFn85ScT4=;
        fh=OIWB/VC8bQMwGqwyaK5eKlT5WGqNLq0G6e1pCxTaYG4=;
        b=JrAQinaSe0LmwERIxtGcCTetHj3zvx1XcSJWIzmbosXHqP3kYUXc+iZf5/gHM7a6Wx
         ikOhQUO+Y3uL9MZpahyowcHLhmQqU11Rj51yDYqWJjk5Ap1DotDNfqYQie7ERa3qaDXZ
         Rkx0pW4M11pZuZkZrx8WmRCrvRj3aZVEyH0MkWQqk46PR3yS7qlGi/KaO4T9cosCy4nD
         YO5namBPVKHMY7Jbtwu/+RAjWGsHHXkR6olnf3znEEir9J6bAeXBsELRnHC3CL67bmXp
         M1xXPCe9SgHFuvGLpzlTsD8uqxatmqYggQsy1Xq90t8Wa4LDYwZOWRJT95VSyW5hfLlY
         XLaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=mIg9uBdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957531719si2036483137.300.2024.11.04.07.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 07:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=mIg9uBdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7z7b-0003vR-AQ; Mon, 04 Nov 2024 10:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7U-0003qb-Se; Mon, 04 Nov 2024 10:35:57 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7T-0003kB-3O; Mon, 04 Nov 2024 10:35:56 -0500
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a5e0bfc7fdso12814145ab.1; 
 Mon, 04 Nov 2024 07:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730734553; x=1731339353; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=hKvgXly1z1CaicGb+6SpfFpA2C3l1HDrjzMFn85ScT4=;
 b=mIg9uBdIzGVelfDFzAbeJv1h+Udt/SBSJJkSV0B4hiAToRkqeCDXbQ4LskuNhjfait
 KPhpjomsHgI9zpV8LHapEGJ7QwrDp3GupHfV5yrd+5Q9U5yGY88MMEAe2FfQp6xaPqnT
 4G9ni7nsyYBbbSZLpxrQLgsgvSWWZvo/+VEsfNl5wyoMa308TtES62jeCpdKyU1Fou6X
 mlXacwjJVFLOkLyvvcjrHgIPi4YaNNusLnn7cLflhHFI8a58TxHC8qqOQrrddOnCWRA4
 mq2DXgjdclIzWrx4GlMuNYNAozxFHfu+aM77g/mUC3+ABtwHO3/zwqSMshwwzuCw7sNa
 SKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730734553; x=1731339353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hKvgXly1z1CaicGb+6SpfFpA2C3l1HDrjzMFn85ScT4=;
 b=UVZYYSCbpV9a0hOP0PZuB+8aPTPulZoC9Ohsz0q5svh5KMv5jcFXGZK3zPPtR5TwDU
 3JYCJy+6oTYcqjY21uGvxbXFv3aisCAnKts6EGI8VZ5QEALJV5UT5mTKFQ5CbP4IjJ+z
 b4GySCqJAJeLN9wcKouEg7b3J1bK13r4YTYChOXxdRlBdSLW7nzARBmBwEVUJzmGplI3
 Gx+xDuGsjeivyiwo4Xp5NRNOvv4lsykFsTBvIDH0Cx9vzn8I94JFLiYt7wqJXTfuZIlv
 IL2lL4wffi4vmSWH93TXIB0m7tKqZWT1v6qDgZgiKa9oLxtG3J+xFQfOq9TkX/nDVkNc
 xWpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1+WQ9EmYx5kLSIY9k8XoFeVKZmZXhOzq5Io8q9/yBls9JYL20NLD6HqKMRlHdHmMlY+I8E7WSnw==@nongnu.org
X-Gm-Message-State: AOJu0YyuMF1IRyB1thDUHUUGDhCXb4juMjKZqrp/UW66yAUuJWmg6yjR
 N1ZPZaFtAzYu0U5yvdXnruEjaSAqG94Mo8L7u1/Cpgb8JmqkkZmR
X-Received: by 2002:a05:6e02:20c8:b0:3a1:f549:7272 with SMTP id
 e9e14a558f8ab-3a4ed305e5cmr270585045ab.23.1730734553540; 
 Mon, 04 Nov 2024 07:35:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee452a8b4asm7147377a12.20.2024.11.04.07.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 07:35:52 -0800 (PST)
Date: Mon, 4 Nov 2024 07:35:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 3/5] hw/net/lan9118_phy: Fix off-by-one error in
 MII_ANLPAR register
Message-ID: <e5cd7dc6-b35c-4ecb-81f8-413294e42924@roeck-us.net>
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102125724.532843-4-shentey@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HKRAinkdk3DL

On Sat, Nov 02, 2024 at 01:57:22PM +0100, Bernhard Beschow wrote:
> Turns 0x70 into 0xe0 (== 0x70 << 1) which adds the missing MII_ANLPAR_TX and
> fixes the MSB of selector field to be zero, as specified in the datasheet.
> 
> Fixes: 2a424990170b "LAN9118 emulation"
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>
