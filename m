Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp247844njg;
        Tue, 25 Feb 2025 06:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPTiClPQ7SQFU5/OdBpWWoK81nkhxE4mHA+O8ICJqgkhBU7fJ/pT/XMX0Qo3Y9vpf0MddIM+xOHBj3bw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVUy+ZTknxEfQaU57xaY0lFqN1B2Pxi2sAkGw1WRW5QMnGtz89WGGP/6LFtrQQEt/aYiGN
X-Received: by 2002:a05:620a:1a98:b0:7c0:a64e:8442 with SMTP id af79cd13be357-7c23be1183fmr511914185a.16.1740493393452;
        Tue, 25 Feb 2025 06:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740493393; cv=none;
        d=google.com; s=arc-20240605;
        b=PF3NWXuGacGFdFLZpe+DRjWFQFBFe+lccsw1H8VovF/aO8prj910g6GdT2MPUebdm5
         +GUNj81vbZgN6Ar0XnxkZqoxnH+W7YZsEalGZVTeI1va+CGlpnaTF/BXP0w6GHg+jRl9
         q+ERJU+SHs1feIUZbWMr2vBDxoGKG7oh6ou9lG+5vUA9qwlgumUixLHxKe7fi7UN2T6j
         nnaL/eePqy33BFq+34iChbi8HjDbVqWiEBTM8va2qFHI9xBoT1PSMrNZzKUbRKETfJxM
         bsdcVDvtm8dWPIpBZFysOyrI/+owLk7rAUOFVMRHdATY1DqhWj6hNMWU1f9vOI8sDNs4
         bvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Gb5nTvbvTARsb2ArR/utGIva5KxPWjMuzImX9SbxaRs=;
        fh=07mQbLMl4N9B5D9+50GSO9V1vyULqtFzBt38qsPSQ1E=;
        b=KcEX0ByBFPEiOrMDt2XB3+TKbm7GKDqKk67VYbCheRCA5fMlSslN49HbV0htNJ43nJ
         IIWRJBtDRoI4ySHBzFuF6KKdFl4tkkAIBIndVa/hlxtG4bqystr8yihxisZgIAcVIn49
         7d4bx58zKa3T2zvSXjr2n9sJQSsbzXg1+/LtJ96S8Vnbc8E8RXVYv8ee8Dz3ri5wSqub
         H2W/BHK6YHQt4qEpjsGA9hxWxrL6TbaTOGSflJCA2bPd8YP4vJ6KbaZy6GngMxTHTr7U
         u2I1JHXqHGCzUSD9cenFXMvJkb+aYhUlGYSJS5gYxENdJxb2/vF8mSKJOQ9kUM3gWmCZ
         RXrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WtS1a/Qv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c3069ffsi183572385a.611.2025.02.25.06.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WtS1a/Qv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvpu-0007VP-AI; Tue, 25 Feb 2025 09:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvps-0007Ul-2H
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:23:00 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvpq-0007V6-G6
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:22:59 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6ef7c9e9592so46706817b3.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740493377; x=1741098177; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gb5nTvbvTARsb2ArR/utGIva5KxPWjMuzImX9SbxaRs=;
 b=WtS1a/Qv0ZnzwKscLzdW+89L5xkyLjJuyWhR+/cKMX7vyyg3bITY7qHE2EtKWxqglP
 iLynCkXq8PWvDsVCHPDwISW8gN9QW6tuavuF8QDSVBs+qdZQxxKKhBmZLhvrYFm9IEOk
 Ax8JsHDAMXeDuPjzUuB0gKhWwIsaA+kYinx34+YVjuwFmmb3aDG9kkBW+zb2WYR3TkOU
 gXgF1Ktpy6gHftaqOcjTCT3HIg1dJ+N96Fd9Qm9HXGChLuGPGabRXloPiYrrswszztmw
 14GZvTInJxYMFJvTgYHG8ZyqyaWcQ01l8J9NvhfqxsORuPJyDZUV9IKpz7naZrOnfVQM
 3vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740493377; x=1741098177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gb5nTvbvTARsb2ArR/utGIva5KxPWjMuzImX9SbxaRs=;
 b=Zc9EciA2Wd8gfsy+3bWTQuyynX9jBPU9Wii8o8/Zg6s1RcWoiX8XBK8awh3K4sLMtV
 pDiEFSearAV2MxfDsuG4ZBefA0wg5kFLFn9p3bbB26EtA0ckSCa7Xemltj0WS3hbJZ95
 smLvioW+UUh0bOHW0aNWqZhfyd+AvBtb6sbnhsP8UB0c+E+Y4IgIVxJsuqmnvWZjNHr7
 zFWIIvY92LJ7EjCw3hZYrC+hMj7jv1V7520pzxZ6azgH10n0VUGNYoJeywngnTlsD1Bh
 CvCykGN+bAQ3+ecjVsJtiV8J4kml5RbLLW4QDB63g8Eaz4+dnuSAjFPkdtwfvl/aFYqR
 25wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCjvWcyckBrPmhVVFZAS6BtC2SfBYHdzqezud7fcUN4wf8C4IsMFGy+Y6zsK79YNIBmKUkM8PY1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwuaHtvh1s1kyhJSFV6vUR4eCjXJJFdCVgZME2yBQ6tv1mUOlgw
 ZG/TKn+sqUqtYh6AH7BwBWAPPL1ZxvczDowi9vA4Nq5IXS3UuFwZ5PfUyR852QlKoUMQplUXOBK
 oSuU20iJMXgF/ioUQjMezPVZE2wpXhMOQMVl/mA==
X-Gm-Gg: ASbGnctFZCqzOsnHo9q2TERo2N0vZZTlcce3hJuwhisJhxfZNAfOSH6M9ZVpG1gNNoE
 ItCP27IAxp4VF9nVyL9UHCElPbu9RqrKMIc0B1YPhzCmZHmcrhgcB80s1aEZTSicz0Jf/+ccV2C
 cv9IONBEjW
X-Received: by 2002:a05:690c:6c04:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-6fd109aac64mr30782747b3.2.1740493377426; Tue, 25 Feb 2025
 06:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-9-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-9-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:22:46 +0000
X-Gm-Features: AWEUYZk5HMA3nIadt4eVkqdLdr7LUXtUGeNu2f7y3Tx4P6ZV3xOgUhR4RH4QVLM
Message-ID: <CAFEAcA-cApB5cF7Safr_-kA3Je37OjMtyGoeCP0G_oXkDD0PHQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] hw/arm/fsl-imx8mp: Add PCIe support
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: gIJloP3y6Pb4

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Linux checks for the PLLs in the PHY to be locked, so implement a model
> emulating that.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
