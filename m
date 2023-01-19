Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp332076ejc;
        Thu, 19 Jan 2023 05:33:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYSfBNOg9xO+SBsu2ANiEDTQmLLHjLuL9kCIrNAVDRnBqaCc8k8eHh54BdvRNXGaCK5DOP
X-Received: by 2002:a05:6214:37c2:b0:535:1b07:87ec with SMTP id nj2-20020a05621437c200b005351b0787ecmr18125577qvb.18.1674135238911;
        Thu, 19 Jan 2023 05:33:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674135238; cv=none;
        d=google.com; s=arc-20160816;
        b=Du9l/YjhOm3O/vc77TIysPC58SHbWSIQtX6+qXslP+krPHtSsHI9DqvMvygwyGBeAm
         vhCJK5l6/NMX0rD5LIG6r59VJQuyGja16YvbyJAoAo+L8fDb+vK72MYHGtHgsfofcunM
         oGMm76HMqehyWKwUTHfDTRbYH3JteFnpBt0ibf7cNWISVIxJR13oyaDTkX6BnmpqTnkN
         uapAw1ZnyHoKjxVULouaOnPqEQ6ggxcOF7IwLGJ1hDyUNtIlzh2zJ74HScvJfDUGqQxD
         rckbj1lxeobShERxXbXznsUsRZiZawpTc0ac5H0n4WzRbijYBvd7vazhZpkH2SzIhroA
         6e2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xCMuQOEvhJPcTcEOSP3gcDTwP3FmeI54dDpngbTo6ww=;
        b=xcUUlwXIC4lZh9sBD2CkgBRWe1Ie1/kAk1HM+ihOnQhuktAm16JMwAgYAJMb/MXZ9K
         zaex2QyOgnjoDkS7MK4peHKQMUoRirovmqeL/5Mu4GoCmO4h2tDwx8JB4Lo0549yWF5l
         YKA/9A1h20b0AxcKIWVOjfZ9Xk/oaig/HaQSB1YUygH/IfIaTETd6n/62MYvlweaxfCo
         2rkOmckvJL8hIyGWlbdAMzlQBG4TebbhqreUZzrRbvd9JIdmNIlZrGnl+Oej/cdxXkKr
         snzsXEaXVJB71AXH21ZcxITw7R0rXtg1VEMnL+b6K70PDLvyof6M0OulpiJbBxcy0CZF
         llzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u3dlXLlG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv3-20020ad45ce3000000b0053485182ab4si12488060qvb.262.2023.01.19.05.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 05:33:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u3dlXLlG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIV1B-0004sU-9A; Thu, 19 Jan 2023 08:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIV13-0004P8-Im
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:31:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIV11-0000cl-KH
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:31:41 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o13so2408052pjg.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xCMuQOEvhJPcTcEOSP3gcDTwP3FmeI54dDpngbTo6ww=;
 b=u3dlXLlG+9lIhC7ouw6M1f00hvuyEdiV2Me6QddCh/4gKc9fhSuy8gObHjG1H3ILDs
 9UGKSPaLi/MGBNVfv5yjiBUT1KcynCNmQLhnuS4LBej9e8NWX2RmRqQ3l5w7SwAA7E17
 byCcruZ5Othd0hfEbWtm9UveBkkCXGG8zNDQDyHFbjDGOaPeNit91MlSmGhmkScmFfIX
 SZ05tJI5IasILRxAvFOzOmfETypaQW8P7ciuDvW76LILUC2j8M1srfHMjjnkrOQxvTQa
 pSGLMg4K1ASBw4cK5JGHnalbBcUoigPVVlG2QSiDNVA/sg2vBVbfE2C8Myi2ycIUcl11
 +l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCMuQOEvhJPcTcEOSP3gcDTwP3FmeI54dDpngbTo6ww=;
 b=KF6fl3+FiUTArmRGPSGcWvMxzMTFsSqGaZWEipyZs4YizfWHwWVRZd4PA/M6oFSCs/
 EPedPI7BOZnJgskIlpABwZ3eDUEkgliX3yUo1FvBPFWqPIaCBSDE8j5e3lxCp5ZCR76J
 pVjIEHiJakVSrr9/6YNJRWw+lGHjGOYff5PwI0Ep3eKpb2V3+KrcoZoVMxFt9BPC/sWI
 pF2hfmg+OsDqaC33+biidaLUpk/huyRfAhGNhXWPt/SfC2f1k7Om2cF0DwYa05W3R4kv
 3aJe7zwESV0rbuSL4CzqAHFpcQ035S7k3teHFD7yw4Dj7KaOYH/ZXUFuOouqcLoruTSq
 c/XQ==
X-Gm-Message-State: AFqh2krDZxabm7T/OJ7slKs1yrOIL0jU9C0hJ1FtN4xwVo5/XqkifIz5
 y7FPoyUUJZeFyschJnofujq0Xl+vMRsVsITU7FVuhQ==
X-Received: by 2002:a17:902:aa4b:b0:194:b3c6:18ee with SMTP id
 c11-20020a170902aa4b00b00194b3c618eemr753379plr.29.1674135098305; Thu, 19 Jan
 2023 05:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-5-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-5-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:31:27 +0000
Message-ID: <CAFEAcA-68d=4DaygtyaFsv68fPYmXZNQzHUNPyEYr8SLuBu66Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6fIZbIPa3Wz6

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> UART should be enabled in general and have RX enabled specifically to be
> able to receive data from peripheral device. Same goes for transmitting
> data to peripheral device and a TXE flag.
>
> Check if UART CR register has EN and RXE or TXE bits enabled before
> trying to receive or transmit data.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
