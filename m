Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1584406eja;
        Sat, 2 Mar 2024 03:00:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhFhiK5S1zaVZ9mn6/fkMhwzN86cUpQcRLNbMGQNjXYGKSQVDPYUQpNEU764Gcb9ppmJumkKeg3KukbgisujEyO2qIsQFQ
X-Google-Smtp-Source: AGHT+IFPnZo4GrBOUsHMIuHolX7mj8mSlKuJklp6icSmXZgTA7nlhmC1abbHjjep/TwHUkgTUnCt
X-Received: by 2002:a05:620a:209b:b0:787:8dfb:6303 with SMTP id e27-20020a05620a209b00b007878dfb6303mr4390208qka.68.1709377208235;
        Sat, 02 Mar 2024 03:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709377208; cv=none;
        d=google.com; s=arc-20160816;
        b=cxmX0Ib2lLurtQlDv59pKnTdkH1389Nq8M2t5UUWo/g6uKKgJ14cOtIHtU8l2eEA4N
         oLOj9uMlcumtERImhbFjd3GI2ssvPjbtKaZt8ccPJLUVyRBS4OFtx8m2++VQZ8IeUBND
         8vtBgW9v9Hb4Jfg2XiW70d1sHvpbgbKYgYpRBLqwpHrbzHkzlYEFNUIskhvXk81leWdV
         bQ481HzmpCcsirV3hlieu0OlXGDPqNlGXLuTy0TpIoQZYEwjLlZtcZwlR4OgSP/7T81J
         98fAphB+WaGOG3JR80y7IipfrwfNfXB2iVgK97fMsl4xpveMq0xo5HKEP1/k2Jxp6/Tf
         lJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fmQgw3K4rJPuao8UsehHU0Q2R2CBEgNDV+jIA0TZycM=;
        fh=uYDMNQ/tDfFpaMGUdHeeg4NIi3yEkHKQXv0eLhe259U=;
        b=HBLdX1dwouAMs5iCEZ7FsK9HAKYUqpQhfR05GYAZfuSq9K0wjHLlVAViQwO3m5DIUK
         g2pXdSubYyKPVESmgG+QMFNgk9axNpUK/S34NfQTC1Lchi1eNtcUlGQowndn0w5ZuJuj
         WzgsmwRcX8gZaL2esXyxjbEnay247o4T8HN2sQGjotKRAawvRc6w3YI+tF+fHpRKnSGV
         yBTgB2QXxPWvesRRDgIqIe0WxEX+ttxODdIsKiPHKSKADeYQB/utx9G/b5f7OJXuYGH3
         JROFqJZmt4guBoTkbdA2BxTxCPtY5lCx1RLSalQcrUeAWWgj7keiqWm/HAqmf8OKBZiV
         5Dhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nI/ix9Fg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05622a131000b0042e6354194csi5810629qtk.603.2024.03.02.03.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Mar 2024 03:00:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nI/ix9Fg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgN5b-0007hz-TJ; Sat, 02 Mar 2024 05:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rgN5Z-0007gh-Kx
 for qemu-arm@nongnu.org; Sat, 02 Mar 2024 05:59:33 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rgN5Y-000562-56
 for qemu-arm@nongnu.org; Sat, 02 Mar 2024 05:59:33 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so4230486a12.0
 for <qemu-arm@nongnu.org>; Sat, 02 Mar 2024 02:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709377170; x=1709981970; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fmQgw3K4rJPuao8UsehHU0Q2R2CBEgNDV+jIA0TZycM=;
 b=nI/ix9FgohsjxAkd9x+X8sZ9sxmPzCWJAtqE9aO0z0iNCpeIpv99HRij3WIebgCV/H
 fKuqvrbV3/DeDK2Q3Y0vouvLvFlqiJ0xJcoTI0iVB+2m3N/IQImUG/FnG02nlNKn40sh
 ZLTk239VemQSX45th5M8C8IjNib9jh/KN0FHSFtv4q89cXEAS/yXSVqO4rnhMPHhlUG4
 3QoM+Vr8tnikXq1R1gdXrk1r5XFh6eUH/f4XtTu88Ir+u5RBp8jFqLN/uJAEKES3ua1f
 v/yOf91eEl7bc9U6sqBTM0V3m4MhMEUupMNlmK0qT1Cs65OmJPmzkZwRdPuu8M5NXYs+
 hNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709377170; x=1709981970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmQgw3K4rJPuao8UsehHU0Q2R2CBEgNDV+jIA0TZycM=;
 b=U3m3mTeBphi0vAJZ1pN9ay9zSt2/NDbSAw5B5RQTOFKVBjnyXtokrGkcMgg+KZBLtP
 Qo2vM2yQSCl/ArOzN7XsVrT5SK9xNi8DXbINXcAWm9vltzMr6ZAdzTc7u3XhDOCHNeH7
 TU5BAdclMOpbrMDs13u0RDYQC9Qx41XzjMqeVFzaVEaoHgZskr475RyZMHjp8ujVbMYn
 CVUM1f3181ajQJTZSn7Ki+DxSGrW1CXDHT5uPqXRpORN5zBOgWfTq54oZ0fhlDRlKaZ0
 VNtG/0jUt9CDec0eLw66cL3Ox8nsykmlpgXKmN1Ro0KyWGnTfEg6rCRswyxeDVpxEWsJ
 zt8w==
X-Gm-Message-State: AOJu0YxWc6eoBwn47SKxkgU4B+mOc2C8NbhK1Z0w7NHeWtYEFxyXG3sV
 nsYz3oDmbvA6MZPCNUNlNvqthAPsQ9VmU2fJZt2Nt0AojGBgzoNlHgUB4Y/aVPBapeZmyhvLd/1
 AZJbcTiS9ylaiFoiKJ0SAhIPGvumKs9QLRrYhbg==
X-Received: by 2002:a50:85c5:0:b0:566:1683:f517 with SMTP id
 q5-20020a5085c5000000b005661683f517mr2987722edh.4.1709377170358; Sat, 02 Mar
 2024 02:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-8-peter.maydell@linaro.org>
 <97dbadc0-a9f0-4c32-abb1-7613380e2a5c@linaro.org>
In-Reply-To: <97dbadc0-a9f0-4c32-abb1-7613380e2a5c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Mar 2024 10:59:19 +0000
Message-ID: <CAFEAcA8PB=601P-sWbBfVbDr1DMyLkZ0V6aseEX5Z=s=Bv0v0A@mail.gmail.com>
Subject: Re: [PATCH 7/8] target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zp0m/O9lZUnZ

On Fri, 1 Mar 2024 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/1/24 08:32, Peter Maydell wrote:
> > +static uint64_t gt_phys_raw_cnt_offset(CPUARMState *env)
> > +{
> > +    if ((env->cp15.scr_el3 & SCR_ECVEN) &&
> > +        FIELD_EX64(env->cp15.cnthctl_el2, CNTHCTL, ECV) &&
> > +        arm_is_el2_enabled(env) &&
> > +        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
>
> arm_hcr_el2_eff checks arm_is_el2_enabled and returns 0 if disabled.

Yes, and if it returns 0 then the E2H|TGE bits will not be E2H|TGE,
and so we'll incorrectly apply the CNTPOFF value. We can only elide
the arm_is_el2_enabled() test if we're checking for some HCR bit
being 1. (I also initially thought the arm_is_el2_enabled() check was
redundant and then found it was not :-))

-- PMM
