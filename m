Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp252627ejb;
        Thu, 5 Jan 2023 04:05:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5md1bWSpiG9/yrnihs8yPT++5t/baIIx1lvycBZLivBd7je/4eleJ2nsnYsF0T98uEKtG
X-Received: by 2002:a05:7508:4295:b0:47:ffe:bd07 with SMTP id g21-20020a057508429500b000470ffebd07mr2179818gbg.2.1672920321071;
        Thu, 05 Jan 2023 04:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920321; cv=none;
        d=google.com; s=arc-20160816;
        b=v2lKgD5MykQWNrKadjRH+biB5Lu+/BBNfMkhmtHTR/uD+Zz+yYTHIwmUIF+5Npfw8k
         MPQavn9X4tn9d9C9GAEZ2dy9hXmDKI7w8Gx9uHTsQxwWT183nujZS4ZP/Q2yq5ogN3CZ
         +lCPSbxSyMZcsmmiVNeE7IiP5gHDGVgF9eccwkDYo5v6cUZ2CCF94yQEM6s0101OVfhd
         Z3GHC304y+ZSffkUpM6nzDyj3QWDFmQEoK1SQ1CT3nkrpPN0/RQmyAaa1X/6Uhbyd1/2
         xdo2LAoJ79i8DlGO1g9/+sc5PFEH0nJ9OLx+31u/vOVyOw+aM09qne68jHrJLbOKS+E7
         +ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oFYvXyd2SWmjUBDOxsVyjRGoQwPiLrpWkNxKegS2YAA=;
        b=rYBKP9uramZ1giG2HNWdlpa2Zxy8U0vVG66bSVu/XszJyAs6ky0nLYuAN4pqRn5by/
         e3l/f53FINN2XnSFYrw+SuwCr5swZcl99E/U8lGC5qFmEL8kUebM+wAxfeJHuBoWJYQi
         L8gqIII5PKf7SLm/3Mfig5yKflpyrA+p0DCbnjMJDQGDgHSmer9RY3VYlMmEEP4AsH9f
         Rq8WvoiXyb2Z2XyAQDxp6xaLw7ALfir326WvJJSVEla/lVx3MXWTXX2DUzcLZgJFyqMD
         nQOeV5n040bt+RbGiIaz79qS1DclbQjF/TN71eUfpPZWtg2GyuSQxShxLABdRBAWjYsQ
         YVeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/6pXTRK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe3-20020a05622a4d4300b0039cbf9402cfsi20235482qtb.363.2023.01.05.04.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/6pXTRK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOzj-0003Hc-0Q; Thu, 05 Jan 2023 07:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOzf-0003D9-Mj
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:05:11 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOzd-00031I-TJ
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:05:11 -0500
Received: by mail-pf1-x435.google.com with SMTP id w203so8525298pfc.12
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oFYvXyd2SWmjUBDOxsVyjRGoQwPiLrpWkNxKegS2YAA=;
 b=L/6pXTRKX0408/qwuMTJxivI2W74CQVIjcZP0o5wxedCMDFYt3xj6/aWNE4UDoksRD
 AiCydc+9LGI6L2oT4mPmlwLucynn8tAeAKnjJq+Ih6bFC1KUNhg2A3mRdiA6Lpgwx0Mc
 kF5kJBfgdNWm4cv8/TOdGHySKFtja5s6ljk4Fk179Ib4inSk2bzMaBOWwnrcMjlAJ9Fm
 UHT9Gtl/44sDzkYuppLVDp5ItOdAGuZ0SG7UJBobII3uJlqi0vSQY6QbIrUI8Xs14aH6
 lIYLxdWBv072gDXa44sg7xEhhY0/4+p9GrV8xBlPKXYjBBIz2hknhIwSEOGgU7TxIpW2
 JMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFYvXyd2SWmjUBDOxsVyjRGoQwPiLrpWkNxKegS2YAA=;
 b=eivhg0MPONHSGqcUoxkCCPOCHvbRlfAB5xSHMZsvsL2WWUnvQXjIMjZCSpJ3y/vUU4
 ZgpKS1t1wJnIGRINuOYqo6M5DW+Ifi/zhLxaiCKbpzTMvFpGwI8FTb+tclzrl7/8A39N
 QTi72oXbPyMvXB7oxdZfxzXKBvXB8sIGVYxmmtMXhm9NEtDHqtxkG8E6CqNaQ5bflNLL
 XnArJXDaBFVJKHapGbdi7A0R9QhPKbv8d0MEhhl9RWKSiRkxCOHkG5+kCBN4o6rhcFQz
 lfwcVye0s4SM0f3xLqCIf2IObuyhfLYlZu5S0AvQi9T2RwOWI3/VU6ijCEyGlmuaBJa0
 kAdw==
X-Gm-Message-State: AFqh2koIIzDMJIMCnTxXoEMBWI+wX3P3dWtk1+YD1R7/1kF05f7xLgmZ
 fOU/rmckBnhEOWyryRcf9Wh1LUUGanAdXdlshEZXKQ==
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2312564pgd.192.1672920308185; Thu, 05
 Jan 2023 04:05:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-6@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-6@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:04:57 +0000
Message-ID: <CAFEAcA96141q+bPn879FxWPbPe6XZWWhtuHhHfXGCCi0ALpWgg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 6/8] hw/timer/imx_epit: factor out register
 write handlers
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: 4ersaP1EvDBF

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
