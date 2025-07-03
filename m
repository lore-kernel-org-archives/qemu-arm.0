Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp436145dyc;
        Thu, 3 Jul 2025 03:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3PZMKqe26vSzh7QGS/s09Vfr9Rf115HwAleO0lDqf2VYAzopSzC/Bcmb8Y5pav/9MTLBD39T+L3aN0w==@linaro.org
X-Google-Smtp-Source: AGHT+IEaW323Qqo0gMkbIgZiHnnWZsGOR0nj+foOPAvyx8NcTprjyGzFRvOhwbMcTyEVbcQf4SRu
X-Received: by 2002:a05:622a:1827:b0:4a8:eb3:f6d0 with SMTP id d75a77b69052e-4a976a160a0mr99721261cf.43.1751538459698;
        Thu, 03 Jul 2025 03:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538459; cv=none;
        d=google.com; s=arc-20240605;
        b=l0i2PH9FQXwXQZ++L4c+OimPRk6Ovur9rnyI9b2r2uBvuhRIvaqTAbTIgsI5QGCdTl
         SuAGrH+BKpGmTG1ZL5Ol/hIB9AXHjIo+gpoR4EKnPRJ1casFogSiJDqAzhK0VIv+ZLJ0
         eMZueoReGIT7g3MtCht0eG7gfhtfv3Fo7HMg1n6oK4RFh5EBQNawqNu8fCBGUE1OB8jg
         Rzw31d68Mnihi3baVa8s+xBHsgQ42Nj9+X4P89KI0XEC0/VD+n4d+cBg4xRzLdP8RHj5
         ZCSLhglpBn3Rohr/5IgX2JllIRcDaVLnef5xv409SoeeN1z2jEsgJYHC/D/kdht0Jvkf
         CTJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OqVqdTNIkCziZsTxLyldsmzmSo/H9noC4yrICjC0j5Y=;
        fh=2PkEE+0pxt4oD7ADZwhh0HnrilmtX01pzDTtkkT6wB4=;
        b=LJz9owCglHjaMgnX3eXFOVj89mbEfvcMwvhWW+ebvCyXDBKW85PuO4GKVuRxqDwGon
         m66OFPlXsx7Hpp0KLSpb1ASj3MLNXCRUj9S+mnJgyJXA66OIDC7FlGiXlgGDt1cuMbgA
         e04TOzG+XqB472FHUtmf9BmlPL4qXjSsk39mUGQvvzjB1hbxItyYVGkWVMirRD7MjAKI
         Ha/nEbjVtFm7N9AGqLXcMEjHzr8DfvUTeTy+j0Mlelh4S21AZfhvBMtuLAOAPdPIuanb
         c4PvaHS/DzL4Itt5PTQt9y3Johp9MJ2rNAR0pZ3W5/kcCjUd7P+9QAuaRL/Ar1SDSsEP
         C7vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6ezhlHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7a3fsi148265651cf.249.2025.07.03.03.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:27:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6ezhlHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXHAD-00049G-1h; Thu, 03 Jul 2025 06:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHAC-00048n-3j
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:27:32 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHA6-0006Xs-38
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:27:31 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-711756ae8c9so79159357b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538445; x=1752143245; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OqVqdTNIkCziZsTxLyldsmzmSo/H9noC4yrICjC0j5Y=;
 b=l6ezhlHnfC+wOXNF9fWdk8Pp90W3K8at34TWW+QCYTNvixVXhxVQRLSxsBmI77FyH9
 ggLC4BkmuoW/4OB4CUTDLhV7SdXWp3o4XiSQSiWzuhwFIV5rSqItioMFlnzRwUrG4Dxc
 napHdnN2gkD/p+Fu9CJ9rpAy3wvzhkEZLmRzCxmD/t4hiXCd3DPutvKUY5+U5G8A2XyL
 tknXJM/W0ST3eVJNApkbZFNWbEObF0IA5XfvQFT7J8JKjxZQNiUWyRcmFiXshl1uuHZR
 2/NP+dfzYzZMq46WPmWNUf4bdQeMgfMXTlVdi0shx3BOtGreJQwuisTwNCgy34HXaOqL
 eeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538445; x=1752143245;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OqVqdTNIkCziZsTxLyldsmzmSo/H9noC4yrICjC0j5Y=;
 b=XqKb3TnnGyTSQRXs0tmY61b9NVVA8cM275eDAGHrNZswve0EFQMwpjXIY3h0IROG2Z
 FG0ZLU3FEclbinSFnZB6DVQkUFdswQG2RM+Zmg0skI4yL8Ylqg/+nUQhaiZU+seFLyNS
 FRcD9NCU31xBxyiPk+MmOozFiK93pJxk7Q+mhDDy9sXTdQ++npDdirHHVlevgmIUxIQt
 v60aee82D3z23AJGD5cfeSf3AuU+vuM21xWhWAuNzhTZ5UnMyvMdkkf6jMG1NutkLfMq
 CdhJsRwQ2YJMNvcysnNJBSaXbKKSeGMgDqAvT+fCc/P5ZueYopL43XrYabtxp5T/VYWN
 evFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrtySuHBVZqWhH1Sb7oEP5lnDbdmwf7t29EBacAtq5xT1xwH8HkGWPRqV9uTwKo+/etbqhwvziNg==@nongnu.org
X-Gm-Message-State: AOJu0YzZzhs+qYfUoc0fqhuWkdXOOdW52czWdaadMi0UgoX1ik+K94sv
 ZfL+7Mgc3JsVzAGrlOYnLyEb2Yxic4P9wrhzFPkFQ37sZfNRDWUKlAxrqFLaziId4ETPxxhdn+q
 6n+aU3P0v9sISPylVjTgNJhSYOu0noAgHguSbw3CY1ngWVWi6qdcs
X-Gm-Gg: ASbGncu3qMdQr3bI9u4YLoy8Uy98roRCzmnMAANsx7jz1eozoWGRD0mVC+8fH7tz7q9
 tHqlUkkLNNWafqHh27PWrwytbshDY9T/zC3HsnjjDd/q5LrawgjPQBsUd0vLKgJWWWiv+ZzryFu
 /uwQZXJs8aymHNZPUxe9IF04/y2wRLly3RTafcIS4QHOqQ
X-Received: by 2002:a05:690c:6ac2:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-7164d4db0b0mr90002047b3.22.1751538444780; Thu, 03 Jul 2025
 03:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-56-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:27:12 +0100
X-Gm-Features: Ac12FXyMZq8MQ1lcu4GV28UFbYIIHVfWjJcD7CGKCvxutd28q3DJKjnNxgk7A-U
Message-ID: <CAFEAcA9_WX6do8+O=zTLvDoKg=7BCtVpTX_hLmKisB96JtnV1A@mail.gmail.com>
Subject: Re: [PATCH v3 55/97] target/arm: Implement SME2 ZIP,
 UZP (two registers)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: 3AUHKNhK3eSA

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    | 12 +++++++
>  target/arm/tcg/sme_helper.c    | 62 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c | 40 ++++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 12 +++++++
>  4 files changed, 126 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
