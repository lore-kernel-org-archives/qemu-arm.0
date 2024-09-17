Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp265406njg;
        Tue, 17 Sep 2024 09:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJnCztJ66oMh9dY4jtkYhrlG6uIN5dEGxzx9vzVXGbZaH3+JCta4c60HfWjy7U1sTM6XmYtdcjsDy0Ng==@linaro.org
X-Google-Smtp-Source: AGHT+IFxC3ldsvM77j39s1attNSTRqhzLk+ccMGY+gV3DJl0D21R/lLfhfEV/V/QUmukDUFmmO5E
X-Received: by 2002:a05:690c:46c1:b0:6db:d7c9:c98e with SMTP id 00721157ae682-6dbd7c9e3d6mr113155077b3.42.1726588931018;
        Tue, 17 Sep 2024 09:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726588930; cv=none;
        d=google.com; s=arc-20240605;
        b=V4paDb9ybDut2jx2KYtQaCIpkyqqYKgt7ut/c5FagD2qUy+BxqcKUUjHhHYU0UrbeX
         CrAzbv5/G79h62/8FKJ5WAh9uW8dsZo94byuHEYFwESoD952/3KeoyFC1jI1WKXNN5fz
         hFr1zyzwhCJ83IAntHXIJOVLynxKP7styIjksNDvFkubieOQP7IAvp8eTx/u4jsI7hti
         yLJYiuNmuCZDBv6KVugdDHtkVofxoiPp49IDJipV3BN4xzEJBkkmBYqzTvr5N6n5SKYx
         9zAhmI+Vs1lkii+ItI43G2suX1sLdZUzYYe4P+Nw3kBa3kuR2bGeO7NuFSI/1aYj2jp7
         O4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q/5xsMMvS7v+dj2//klH1BoTXqckiobFqW8DVaXBLmU=;
        fh=GuV53mUA6InJZz1qiPBU+QkpgU392who2xGMlIWFLr8=;
        b=fEz6OEVQwgVWZMvR1YwwRz56U339Ctaw6wwmS0KREqmnfqh7q4JlyM0Q9g2efBp2Cj
         mzcL0uCo43KYQg1drgrUw98VGGgHsXbVENzqGLUERSMpglCeVEqJItgQhjVcFiA3FPf9
         hC6f4qTusrGyjvzKx7/LYBaQHN11qx1U7/Kdl1Urb0XWZiN2dYTleGlDts+57q18pLft
         nCMlHpqaxLjEysWYhE6x5cZJiRiP+B42IYZrih8XqW2zGasw1PRcDOZbVyTr2Aq8n0r+
         K9z0IbDqSae2Twq6wodqZx6gYmAIBzd5x37pYukT71vvciP7W+Z0BncoZx3orbtOOFrj
         XoAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fi00pHDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6dbe5497f5asi40655397b3.413.2024.09.17.09.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 09:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fi00pHDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqae7-00076p-PB; Tue, 17 Sep 2024 12:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqae6-0006xC-0h
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 12:01:42 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqae4-0003x2-HH
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 12:01:41 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so4874106a12.2
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726588898; x=1727193698; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q/5xsMMvS7v+dj2//klH1BoTXqckiobFqW8DVaXBLmU=;
 b=Fi00pHDOj3ybgKr/iUtjrQFvX4Z0SlY0wEXk97XNLvZVgGvFUxxcEW2zApZnAst10f
 OIU+LDVVXFt3T/Ceb5NQJUtcgmxfKGVx7hojpAjEuOZxmbg9wV7QFcP+YLIUs8d0qClC
 a3zgtd5sIfFUNJweRJGk8xZ4dhej56x98e4ppwIDHmyPurhKlv6aT5WQO0UXHhx9/7zD
 O4Y5nGzTO3DZMteXMQhyoI1xXrNIyoCZNJFXi14vszacWnLiCJKS+H5eZGLFl20pD7zj
 4X7T4Q2Yzgb4gmkszv5kX80EESjodp+nwqKRfeu8U4lJIAY/embLrwflyJ3tFCoX5Er+
 mCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588898; x=1727193698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q/5xsMMvS7v+dj2//klH1BoTXqckiobFqW8DVaXBLmU=;
 b=G11KIwMTsy6eIV7JygyDNu0hEAIk76YX0c6juGLAWCSWzLjMf786l03OwtVd+RL4zs
 soV3VmlW3zRuUyRHqL7ct1Goupwplx4EL+rOMljtPEnuvAiAGsRPj38CQugJl9NLKBet
 ODb4kA3Mtr1lluFqdyim5xZ68BrNXqoxY3L/w8fVnm3c5z6RnfvwIsihWXzFvspjWr+U
 StWzXABpOIo1k/wdEVFT6xdE5W5Hmlhhs0DE5V10JBYR92fJSAJoP6PXEFA6Uz2vrEKp
 fRsS3fv+08KlSdrRURxdaQ4SkUlX0OZ6S9sBWT9ANlfhxTepPyzSwhiOJCUO6HaJpKI7
 EWlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSWUmhGXsVAOFo2bRPfBZ6mnxjlPJz+zEhasDhiwmoCkpYAdsJ4laxUO7jbD+Aej7OI+qAcrpQIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwosEr75kpXPx9E1tNNwCW/mKHLS9AE1F/quXkzDUQHJsxxat0i
 WLvrtC/dYcJ12FiWO2fjW2OSJZ6YdJ+iy4FhIFlrNrwX+AGTZFs5+4BDLOChxarkgwpvZPdOdhr
 TBvXHU0ahzVXEz6/NuCrpv97iAWV7wMIeYQAEGw==
X-Received: by 2002:aa7:c3c9:0:b0:5be:cdaf:1c09 with SMTP id
 4fb4d7f45d1cf-5c413e50f05mr14939988a12.28.1726588898256; Tue, 17 Sep 2024
 09:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
In-Reply-To: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2024 17:01:27 +0100
Message-ID: <CAFEAcA9W4h4TDr+d_xE9MB4Jc+bCeAS5r0MyH8tuMWssDcRqvw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] tests: updates for aarch64/sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: R9jqN51vs51i

On Tue, 10 Sept 2024 at 10:48, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> We want test to run on default cpu settings. For now it is plain
> Neoverse-N2 but we are considering either disabling PAuth or going with
> 'impdef' way.
>
> We want to have some non-Linux OS in testing in case one of changes keep
> Linux booting but crash elsewhere. So far OpenBSD was used for it but we
> move to FreeBSD 14.x due to longer support cycles (OpenBSD 7.3 we use is
> already EoL).
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Applied to target-arm.next, thanks.

-- PMM
