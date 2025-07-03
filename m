Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp419881dyc;
        Thu, 3 Jul 2025 02:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzjHBjAUnICILYiBtKXNduWmtDXIkE5nOqXuUw6mDVzQCjVhld8PmMxmuQ9TRhv0I9DGZGD9PywNRZrg==@linaro.org
X-Google-Smtp-Source: AGHT+IECYVwER0sWHr3XXLypLzqCguletdm8L9QWSNa5RBEmUezH57E/wyabBd1Ctou6yonFOTLD
X-Received: by 2002:a05:622a:4c1a:b0:494:70e7:1528 with SMTP id d75a77b69052e-4a98ae496c1mr26261751cf.24.1751536398191;
        Thu, 03 Jul 2025 02:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536398; cv=none;
        d=google.com; s=arc-20240605;
        b=Hv6H8oH1Xm4oR/l969xaJ4QCfyqyyuGFiuS9DSNB2mnitEXTT2P9nnqUjp7A/wKsP1
         a5ae8TypwEAzW0/gGk6/uNRbOW+/RVDvhXlTAM81SN3T7D0FIX2/aCfh7G582sNZxrNO
         8MnlvFIeGhZTBHz9+yxJZGIj2Tq785/0eaQc3g75554ASGEEeX61CmwvXKefpOQk9079
         U0iPY0/ibHkHvDH/pCLQM49amKF+lZYqr4RbIpJ+hD7pDnuT1cbV82cdqyrF1vi2dPzm
         6egECWMD97jRstlWEHECyyu9hYVB4OQLKXTCLv63AmR1H0K31t4G7Z04poYa5zvN9/dD
         yomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bNPhw7XgE5bX3PLBlDJTCYk5/d5NJSqKBENsp4LCSrI=;
        fh=ttMYojOc7onvRPhjGUkCyDEO0UJ3uaL440kDYXEbQwk=;
        b=bCll05a67OQk7/tY2QadyhQpH105wNF0iK0cOe3409Rt0UyfnCFANh/RLHohBO4/9d
         v2s/DpUsEnkWPITPNnzAHxzlwhEfanxlBsjDqb+WCp0sAhUqhY3Jkp8+RQRVfLhpKseK
         56YuLkFjJKi6PYxg6+ufHH+UNJ1UVP8CNa7H8l6C9hRVb75McZ9IsJrlABWUcA4t/XDj
         x0XZ54Z2ohBkyKx2FQdGPH1+IdlFFnX74BIESBB3PxG0oz1xl7x1hq/8U4fzZ00pY3Kc
         l3ieLvZeSdJgGe9zD7hpQ5YQatPrjJQfaMdyx0oS1EvumTqr74k6xFUfRL4hzdnfM1E3
         CakA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNAcIBA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc100e9dsi162387241cf.71.2025.07.03.02.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNAcIBA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGai-00008t-Mg; Thu, 03 Jul 2025 05:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGah-0008U0-8z
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:50:51 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGae-0000oC-Ey
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:50:50 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e898fb745beso633255276.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536246; x=1752141046; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bNPhw7XgE5bX3PLBlDJTCYk5/d5NJSqKBENsp4LCSrI=;
 b=YNAcIBA68TlXgqes8FVjyZAk0GViCBZVNASyr6+dOn59QhxGUx/GT2C2f5CF8SfFFd
 vfH5ejoYduG5VdhdlLZoNV7RNLnt8+wCNBsYC3X4Bi8DpTaUWtwr5lyilim9wfb7cyLM
 Rfgt76IfZI3xxWJgrsuXwCH4Yfju4o3n1gIPrZXQ+HXvz3+TPWkIxe5v4R16SPaeYg0h
 3OCQdbaPmoTdPoat0RBXpJQTE7WJ9lndYwYSqkgkQe7AvSX2l2pW9Prrashm+aQMcinj
 dQCkIBUdVTjS6RVLt382vfl6XfG3vRPUR/QOOZkQ93qWp6uGEMuwnX92ajWE0tyz8DWC
 8faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536246; x=1752141046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bNPhw7XgE5bX3PLBlDJTCYk5/d5NJSqKBENsp4LCSrI=;
 b=hxOC5ckYbFCjCvf3gTUhQEBfW/KPKNdq/cBCskPs3lVriQdxjRdxe5DnI179beOQGK
 htgCSOIkOqmtKzgJofFSvF0fni4S1ctyjH3twzAlbVjmCF4iUMeM/Xw/7T6dTgVSKkuD
 UZcGOwjtetCubPvvpe10DRo4HtURSsiNtjzp47NxNZuZK5z70fGync4oxkdP9LG4NIZU
 MYLsInvtxmhcGCp3/mQG3BIWAZ5ugGahoq5R4zQaM8hFu0nFuxywOS0s7VCKO95cJXxg
 ATkXF93DqQEUn+y7wcAqn+C1QGHeN2TmiKdsbGUr3XdwlLmG9VoMmo/3miAHhupMx8gQ
 3MNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMat55lg1Fme3J0Z6qATyJh0McDIli4YIVwd8XL9hY9Da3fNfFBxqwSRiWnj4UVPCoE9aYCGcZSA==@nongnu.org
X-Gm-Message-State: AOJu0Yy5KoejmSaQltUXCENbul30E5temhDcJBvaEQiTB8xqjyCvPtjb
 gHfuo6CoQufoIZC9vqaDgdm3rwh+iTAqe0K550EYnAVRUcbFxd4oHJC/T8lZu/Gs3mwn0JOVrbF
 eCH1+MycEj2UXQtIxy2pg7utBAw2Wivq66LG1IQtM8Q==
X-Gm-Gg: ASbGncvKy72sHqgWzhiXUZ4heWUNk8/pV18Rcf83deGLL4Fddi3yDjbW5XtXYoqETu9
 ONwqoRXZpPoWl996V/AcHw46rlFVu4HO9jr9okmaKkoGDxmWsOU+r98MvX1AKZP+xz4DgAlzUbT
 AKxo9KmDGN9mM1jAcYR6uMezswopW5mR2+C4nWhEuESKDl
X-Received: by 2002:a05:690c:3388:b0:70e:4d8:5cab with SMTP id
 00721157ae682-7165d018322mr17392077b3.2.1751536246004; Thu, 03 Jul 2025
 02:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-39-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:50:33 +0100
X-Gm-Features: Ac12FXwfAtilA8WyTw5k-y7EPz27vP7VlFNddFTXcEVHIWm7_9rF6AqJxRrp0mY
Message-ID: <CAFEAcA_Onz-bXJ5k_Th5j4ZEP7pMAFarZOiDvFh8V7cF8cC3AA@mail.gmail.com>
Subject: Re: [PATCH v3 38/97] target/arm: Implement SME2 FMLA, FMLS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: OXLpvm7gFSUf

On Wed, 2 Jul 2025 at 13:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 95 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 48 +++++++++++++++++
>  2 files changed, 143 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
