Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp191471ejk;
        Thu, 30 May 2024 05:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj5y8BQp95g0g7hY7CEr5lJYWAMuzoddFzV++gh2eVi6k/G1vDmjHdxxlE1jmF7kMAx4PrQca1b8pfyj0emZpzL0/D6y59
X-Google-Smtp-Source: AGHT+IGCDUj3g0j0DFnwOKSTbggn/4Gfbci5XDOCENrNnNONYn8AsWhZ5+/D2YdRUYaiLGvuCFFj
X-Received: by 2002:a25:dfcd:0:b0:df7:b7da:d217 with SMTP id 3f1490d57ef6-dfa5a7b42aamr1952318276.50.1717072196775;
        Thu, 30 May 2024 05:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717072196; cv=none;
        d=google.com; s=arc-20160816;
        b=J2bmFgfGtTIC46/acpAY1v78Gq9RZPuGEWvkvAy3H9Q1Y2znFDyoqxFj1HNjbTCq1q
         G4V1NFPSqPTNjcoGXDyTmoNbQlTjdE5+AIROPsM1mb6d0criplPKugiXP/RD91nM5il8
         oIA82qJ49zP0tjNYb5ypRf+WBQoEu2e+D11W6nwQYgcfLJXiv4HUfP+vvBvQofP0znns
         2v6JlXoKjvBuNVd8rqLy8mwB8ejPYYSfPiHpFdqrmd1ZCSqqTrN4iPd7WYld57um7D0D
         BRNWb7+rQVFXu5W+hH/bOXhwtv7+j3UtDniu70//tlaJvz9WtJqy7XqI7gpLqpmb06P3
         8Yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qRZ7ZnZOeXHTO8JumT5AdXrYgBeKK9mS6c+lZkJv7rY=;
        fh=yu/1iw6YLWXI7uXxSgrKK4x0RLaSttlZFKnA772xgXY=;
        b=SPkSLE65eSRC8iHBUZ/QHT8I4Q1Foq52+fdQBAr5+YD+4lQiN6dEFB7sNOSeAXkdLz
         JqQV6DVSTcWNm8jUvZbFaUTxByexMNVtaEqFnGXsw01iQyOUB88CckCrtt9GLPH5B3aa
         S6IxSUyl+TEM4saLiXFewBd/Hlej311nwe91aeNFC6m20n2ea+P5rMNIw5CCggoWXUS3
         qK8lojeDA9EDS7WRlf1PfTOHRapltDhPtX5dZSZbnJK4be+lh2xUk7fxVIk/j1cDr7Kn
         ozzTBKxsSl2hobxFr+jE/jjtOIFivMJ9Ht8GB24ovDSbBfyvHeSkuOVLa4XmGgYV+MFR
         WCgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D59qSO1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794ae71eba8si1408338585a.167.2024.05.30.05.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 05:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D59qSO1z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sCeui-0005YH-0I; Thu, 30 May 2024 08:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeug-0005Xb-9F
 for qemu-devel@nongnu.org; Thu, 30 May 2024 08:29:46 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeue-0006vc-PR
 for qemu-devel@nongnu.org; Thu, 30 May 2024 08:29:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5788eaf5320so1003690a12.0
 for <qemu-devel@nongnu.org>; Thu, 30 May 2024 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717072183; x=1717676983; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qRZ7ZnZOeXHTO8JumT5AdXrYgBeKK9mS6c+lZkJv7rY=;
 b=D59qSO1zRpleQ3ZDC89w/pR9xy5jKcSNZ2q8lIPM5OqDk+yqW4xkrM8emdZxyXEy+u
 qv+GRkAXzTik6Pszi/1VKS3mI7Z3nVge8QVoSK6l8Gm7T8OQVyD/trcJvuPzqnEPch2A
 +rLs4UunXkRNyXdtKIFsULvBKzJpyHAAIZQkK7cWZvd3HcNLyegR58xqg+mznXfaJx2f
 8+U+X6wO74lYzNeHIuirUSMLuh5/Xm3Qx/x38a4roG0OCjZsswwzSmczH6vybPO+ipaB
 gacOpXhr1ZDpgN1EIyEIOrEB/nUsqy+2fxijDSVztvJIroFD5jGo56h2uICrllJLrZ5B
 ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717072183; x=1717676983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRZ7ZnZOeXHTO8JumT5AdXrYgBeKK9mS6c+lZkJv7rY=;
 b=na1UjHqFUYMctAtxymCxSS8M4Evc8Y8sfzWP6O7ySbPiVOz2Frxbi/DH2fx2aQKOb8
 FoivUA1UtImL4Fc0VIWecN38IpsgNNhkTDDw/QauqtKRceHahtfG9+h4mNyDFBquciAz
 iTn9n8NMDirgQb3LyTKM8MhnMg1Mkbe1Kk0BCPdRpS/Tx9Ase+8NFxucK85FxlgCJJiS
 x8B32aJ/ql6+CO7IZQv6mm8YXCN0mFsk59DmgSqsdGjvCcJyvlehtmpuN+XGKuQlArOh
 qr4fUujev3/tc8IU6pNd5W2yWgTxJvEQAbVxOn+EOAi4kZHWnMrHLp7QsN/kCDD3jmWv
 SfKg==
X-Gm-Message-State: AOJu0Yy6CL9DzAVMhNgGrKG9rW6U1KcJRTrkE5PpNJ7QTVgwiXZmfw+z
 5Y9Jti9f20yhpnr9+TJRz89+PbGYhcl112ptjoCalF8k6fQ053YvR8pWcJ3o8ouzzi3GrYjWmNR
 Ps3ouJzk8mbGeOFzD9QUIExT+7UMVP1g3VtC+UQ==
X-Received: by 2002:a50:8e15:0:b0:578:5771:dc2c with SMTP id
 4fb4d7f45d1cf-57a177cf233mr1450134a12.3.1717072182872; Thu, 30 May 2024
 05:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
 <20240519094106.2142896-2-rayhan.faizel@gmail.com>
In-Reply-To: <20240519094106.2142896-2-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 13:29:31 +0100
Message-ID: <CAFEAcA8kids+GheYkBDJ9+0=y51Xpgb1AEjRJfZtxxf-KYH2DQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/nvram: Add BCM2835 OTP device
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: td27Kq86s3JI

On Sun, 19 May 2024 at 10:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> The OTP device registers are currently stubbed. For now, the device
> houses the OTP rows which will be accessed directly by other peripherals.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
