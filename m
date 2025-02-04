Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp330238njb;
        Tue, 4 Feb 2025 08:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUd46xPNCBXyF4lggrqTD4yLWoOYvqVl0nH8zwplL2Y8yQn1VEScCNCmULF7HIxyTYz7JvJ3E67lusYaA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMwy8bWFctNMvvAH1EAGxrVcQli2o0+HwLZ1yJyEX0mHxrJ01CESblMx/jmiBIC0si34G5
X-Received: by 2002:a05:6102:3e15:b0:4b2:5d67:94c3 with SMTP id ada2fe7eead31-4b9a52345edmr20691611137.18.1738686735288;
        Tue, 04 Feb 2025 08:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738686735; cv=none;
        d=google.com; s=arc-20240605;
        b=j/ziz32/Dh7SfBVLlvzqyY0kh5ovUjgFfIzYmUXOwQrIsQYkovQmixJkqA2vy8tALw
         /T5Ex6vj71KOPXDywz6hdwmbPogYD4iUkguIXkTIgTim95UZRFR0EhuyIIR1w0qpbCAl
         Hm1nXsHaeJrQU+dO2homsvTLBy8cYrWgHjReRJkbugBW0yTdd+XDlO70pB1aOV/Cv4TL
         /Qile+EKtIBYqL7XH7DNUBxLJCILz90ktPvkEIRprfZyPggMrzDrwupacfOdbWdEw9XL
         pbaB1Bxi28w20oVYwaF5xTooXIi1oOlz1+oCsza66tBC8Ss94uQ8DEUrDHWwBQPgma9J
         onHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=weNFiOUeXuTkCzNy2Pj0WVjcsbJPxWOUwHhfVmugXdo=;
        fh=bkCr8YGdZKa/VjP8PkZkMrIQTAu9pr3e90RwzsW5UvU=;
        b=I+Sy175t15md5Wy6wO9K4yidv0gIpkt8orgg2WsYGGsVe761WraK4eU4cTin2fFCP6
         GU5v6NJEe1D0W62qCxHUZZfBUmYqMx/paGbKVI75YjvXGSWw0H0Edgg87DikOEW/llox
         xtuBpVnRbXgvMyQqIElx8VBpmGmeLtJXlJQQD81RPCg71CcnY+KHZWqsfWT75T9uZo7c
         omAvDm3fn9uqOfx0TFiDcTJU5M77NGw/yuWrAfvfV1fB6p3ycmxiXVZqvuIrIfVvJlg4
         WSksMOQK1uR1dr2Uf+I3lBcMxRDMTGsZJMODf1+JKRa70omSQe5pIkfQJZ18IeEpEHzz
         2sLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MC5uU+2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b9badb9a6asi2509698137.346.2025.02.04.08.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MC5uU+2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLqQ-0007tF-3E; Tue, 04 Feb 2025 11:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLpk-0007D5-7i
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:31:37 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLph-0003bQ-7E
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:31:31 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6f7440444efso39760857b3.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 08:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738686688; x=1739291488; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=weNFiOUeXuTkCzNy2Pj0WVjcsbJPxWOUwHhfVmugXdo=;
 b=MC5uU+2w4y5ufsunKyejsJx9K5ciFSmAEQ+3868s0w7kP+PHNSTha1FQWJpCCwMO9s
 1CYCzZo4+xHDE58pHpbI2aSGF6bL0DtVDtx7wPjCPlcJNG9jLPRCFq//a9pnfmMP1imR
 GS/Jvq24VXgxVPp6HOQMq4EoJNicY5fRY+mLIX4INobodwG+YH8RaLjVqWSAmtd9LIgI
 EN2Mg3wnyjzSQzK5oUAN2PcnnhR/YCGMJgeV2cg2eR8oty/HoA7UbYtTGgfqObsHOZst
 0NPXOHunVU/4VPXN45FwG9P14Xrb0op8J7+TFJdJvHx9vDIAXr43oQarKv1kUnUmX/yc
 PhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686688; x=1739291488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=weNFiOUeXuTkCzNy2Pj0WVjcsbJPxWOUwHhfVmugXdo=;
 b=DEog7w0ZNpDkPrF6C2/aZc1VGNhp03+WGryC6V1H1bFCs9K36jtis/BO+JxYLjznMf
 bTC6o0OZUF19c/yG61mEbuBoOX5Qfk0Ba5orDK5FWTan8pQSXwhuUtYHcBL0rPSxM6Ut
 XO/CzZ65+6grWdvww1H/+uDJh+N1rqRbs0k9HCUNtc6NNT1juPdXFWMwlV08rp6HtNWy
 wOvIR0qjDJ8XxardTg8IJBM45rZ/vbxlZy67m6myB5WAiefqSdZfuVi/ooEptzFVbglR
 kEga69zcLeigWgGaFyT4TJJpI5Qegeka1WQJCpf9s0wOVgp6+Z68O59uw09C9KvXi8x1
 LB6A==
X-Gm-Message-State: AOJu0Yy17DSwcMp0kmuWgx3NXhTwb7g9RJV7iDScX9zzH+yHhZMzYJhs
 WgImPFcvHaVcYqB4bV1aSh6IKnNWeDHklmHb4IKsn0E980YQMmecP6xc3spQwPqtP1CIlhZ6WDD
 +YyusUUSlwdk1gpPiAZw6mInf4ghS1gvaI8yZ/Tk9fshyFWrl
X-Gm-Gg: ASbGnctfHFWCZGMMRVKcvQzjPNh7fhEUSpvcWAXC3Q1sIANKoSTbP/5r3Wa1m5nbmwC
 tRNDskBhbKqjGZXOvyz4sBOasuXrBo7mWNMFFO0FSH2M/h4IO/IZ6jscwaexSyQKJnfwAgSogNA
 ==
X-Received: by 2002:a05:6902:1ac9:b0:e58:1112:c3e6 with SMTP id
 3f1490d57ef6-e58a4a9c707mr21143927276.2.1738686687935; Tue, 04 Feb 2025
 08:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-4-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:31:16 +0000
X-Gm-Features: AWEUYZnHcokF_MJBr8VGWEBW9XSBoMAJsmVJArX1QgEeKlBk1cXBPVIP09i_Q8g
Message-ID: <CAFEAcA9h1P_Z8MX+c9yW1nvbZ1YofPJNoqXf9CoyP5jHVbL5JA@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] pc-bios: Add NPCM8XX vBootrom
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: eE+AkLFY5mU/

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> The bootrom is a minimal bootrom used to load an NPCM8XX image.
> The source code is located in the same repo as the NPCM7XX one:
> github.com/google/vbootrom/tree/master/npcm8xx.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
