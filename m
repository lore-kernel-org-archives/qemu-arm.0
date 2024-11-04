Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2199707njc;
        Mon, 4 Nov 2024 07:36:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOAcUBP4kNtgEV5SfnRDTDadU42mKV4sXSoDErG10tCdo0kaU2WEHCOPjK5//LiBSq/CuuuODho3M33w==@linaro.org
X-Google-Smtp-Source: AGHT+IHPDiY9bm7dDAykLIa200DH5+0RzN6RWtoErNatVjfaBD0JCz8135O9RFcrbQc/TTPaxgO2
X-Received: by 2002:a05:6358:e4a7:b0:1c3:94:8ff9 with SMTP id e5c5f4694b2df-1c3f9e064edmr1452231055d.9.1730734610769;
        Mon, 04 Nov 2024 07:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730734610; cv=none;
        d=google.com; s=arc-20240605;
        b=jUMt75/uQmvoMPF1P98l+nQpTrzpteBKzn3v1zuIRdajgEWGirjvLTWnzr1EhUOd7T
         25SarcIweJdElbntKi5eQl5jofAHoXIykCllYnCAyj1eePuHsAf5iyIfyNBy75MEHr1X
         zMEznKIH2BsouVB3NmdUIF/rqvSgg9BVSxQ8itfMnn29jHb6NaOdwgRU8bo0AtXFKcYM
         uEiMuetyv17RFdAdMvwXCZ4i1i0nnx2tQinCqiCFevnqF1tsdDFUdLbIaDBFa6q3sf4U
         t7u1QOxBK9/8FUegzSwX2j0v1/yPjIPLVht24rjkGJEHoaXcf39E++p0808sC7XouTu2
         1qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lZCB79wUMAh1+L5FCAE1eEffbYdzYk+IIW8wRSmWRQk=;
        fh=aPGd+mQNyE8u+wUyx+hut7wNqNejqrf1ascprnjHaGk=;
        b=ZMMy/GHkdhFiaEqmxXg/SYkF9kZu5rBg8ok1v6tE4/VHDTc+qsI23qOJoVw7O/UdPl
         24Ltd/3nZnICvw7hY7X5t/ZggrpUk09JhUQaRxsEP7iqil1aRCCO2InYpFsoKsEY5qi4
         8BB1iieBYkM7NuPLswZrqoLRZd6yOXKdyMXL+GSb+o1kZdDLl4P6Cgr2xc3RXnjsjgrE
         nHbEAPRb9ccjIIeJniUs4shTyyj1IRS55pyWcD+iw6wX8v/ScAvE4MkoHpr7KRWIbruF
         PM54TuiOMZy0nUDYK2HqCEPEyjKXa34rFA/ZLhZhtaYmwAHwxQkGWUjIFgPff5m2XdwM
         EkYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=dhJGKvMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-855dae58923si2129637241.109.2024.11.04.07.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 07:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=dhJGKvMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7z80-0004Xg-1S; Mon, 04 Nov 2024 10:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7u-0004MN-71; Mon, 04 Nov 2024 10:36:22 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7s-0003nP-Lg; Mon, 04 Nov 2024 10:36:21 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-71e7086c231so3729622b3a.0; 
 Mon, 04 Nov 2024 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730734578; x=1731339378; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=lZCB79wUMAh1+L5FCAE1eEffbYdzYk+IIW8wRSmWRQk=;
 b=dhJGKvMxKNga5IclxrGBy1RdhflDVXOOrov7mPGHJsekDZwnUZf4ePWH8qHQ54SHzA
 sud0eOUKJawCbd2d9JvWPuvJUJlG6ERV2p+L+J74pHnS0FG9IF/OAkLzpXgCt9uqHsMA
 Qjbe1cv+B5N+q8CMb9QySYQZQa9DZb1B+p7seW+xJ6uxEt29514nIBtX3hGzFP+3BjVT
 JGUyLxF8fHUu6wcunjQzi1JuPLcfOE72i1chGYEGct2NlJKwJ7v+Y0isxlfDqrLFjPaX
 ZE4wZlfd08MNauN8r7hbGS4mNOk3FLkvInxug2qu2vNvp63r0nqzh1KnEx5hhS/5ZlPn
 W0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730734578; x=1731339378;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZCB79wUMAh1+L5FCAE1eEffbYdzYk+IIW8wRSmWRQk=;
 b=UcP/05lnbCuwXvX7cv7IMCxPV5SVzNMybF5aThSCjujD30i0H88cGqhD2WR6sNK8mk
 glFe7P4SpxMmZc8xadPtTcEdvTaVp2X4y3ES3Qv+8/N/64ivU9NMIA4Ut3GTWu01k9m1
 Te6YYLm5Qfx7rioGJ0o8NacPgq+PEeG6P59AreT7MZa5C6/nR2MW93GpT97WxQx48flg
 H1gaiIySF7tjqwCuvAr3HVslx4QUGmJV3HAgPjcJrA3C53LZWTzAzProkQ2RfSiHCODq
 ofEwSJkywiuqHa+7gmFdkU8gDxcMWU7X8NL/l9yhCyxWRTRzT/k6M8lVlmVYg7zRbN58
 fSNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxktVUemPoXf4aT/8goSPRu4tLZ+XZ43FBhvJmWDzWspOHF4rVMvfwbJ6QEFCWMbUJj+LIBjXlMA==@nongnu.org
X-Gm-Message-State: AOJu0Yw6Vw+v15jgfBveEPpDFZtpaltv6Y6VlvlBVkZRakUC5f1Txcex
 zNmWjPiQzwm5eZQ3G3tYatZpxC0nQDjeNQ5aocPtF2/RvVaZ5yPO
X-Received: by 2002:a05:6a00:b86:b0:71e:7c92:a192 with SMTP id
 d2e1a72fcca58-72063093594mr42570440b3a.24.1730734578395; 
 Mon, 04 Nov 2024 07:36:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee452a9922sm7304426a12.32.2024.11.04.07.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 07:36:17 -0800 (PST)
Date: Mon, 4 Nov 2024 07:36:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 5/5] hw/net/lan9118_phy: Add missing 100 mbps full
 duplex advertisement
Message-ID: <e6762f9c-1af9-4b84-908b-dc3eda98535c@roeck-us.net>
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102125724.532843-6-shentey@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 1cxZUhlpsUFT

On Sat, Nov 02, 2024 at 01:57:24PM +0100, Bernhard Beschow wrote:
> The real device advertises this mode and the device model already advertises
> 100 mbps half duplex and 10 mbps full+half duplex. So advertise this mode to
> make the model more realistic.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>
