Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp280827ejt;
        Tue, 20 Jun 2023 06:52:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OLNo5IcFDEfp4vMBqJPQJ7woZV3x+0Ndqa2Y2HMgVl/JYQlY2v6jBhtvgygZwd1YK46Z4
X-Received: by 2002:ac8:5a54:0:b0:3fd:ed40:adfe with SMTP id o20-20020ac85a54000000b003fded40adfemr8335231qta.6.1687269179144;
        Tue, 20 Jun 2023 06:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687269179; cv=none;
        d=google.com; s=arc-20160816;
        b=LY7CsSdoaDCZhC3K7U/R2cgGAd2XnJPolKj0W+UR1tyG0oZwmDXTHnTfRk40Kbplm7
         r8ADYdAln9Kwgm3wcQR8W9NumorGz3reB0hDL6YCyn0q7pnQu7u4Ggn8GQBDIelhDed5
         NzSnBljCNPT7E+QM4+VHaniYcoj6R8knpSMId5ueBgYqsPhMjA8HmDyi1E6kD31cyPCK
         hrhpxDOHMZaKfG+ddk8+1OGUm5aRzAgcBpcK1vzbCq4yKUUgCHdBd8sN6PbHokszZljU
         SvXEpqKJhhTQGEtMEAvNIbF4QZ2q1jwD440V39BspunT/Z2YHOgq6pYWxbcBRdQ3OazU
         pFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/L6k17gpEI8D2h8BVhU/DBfxSXfsmLSiexMsP6WVg/0=;
        b=uL497GtKwTEBmSHAJIcBTMfG37lEltMiJvE7w1sGXZlt+XKfk7HeHk4nohcyIo++dF
         n0bq0xT9m+JK6NOJ5sKVbX0KDgKpkfamoIlThG3JMrOPY8FhuN9knYqhB2z2fIm0PFje
         rQe9Q0RofzVEyutava/FBVUl0d/gUZTt2FHkxvLReQhRKAAuIRxazAvvZ/xmQ7I1IZK1
         PWqjb+HF5m1/lQyXPC0jfF5VB3JNlnfbyr0tr05lU2HU/bSCDSJUI9Hp8sN0nm/HTLI1
         oLGyhMPZ5Y6/EqP4guzgSGRoqidrc5WaKHf2NjQERqTHEFRBEyDC/1HH84kK7BBvlYGS
         T5uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGtY9CyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp9-20020a05622a1b8900b003f6b025c0c5si779843qtb.497.2023.06.20.06.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 06:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGtY9CyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBbmc-0007Ri-91; Tue, 20 Jun 2023 09:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBbmb-0007RM-R8
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 09:52:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBbma-0003Z8-Bo
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 09:52:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5189f49c315so5037857a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687269150; x=1689861150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/L6k17gpEI8D2h8BVhU/DBfxSXfsmLSiexMsP6WVg/0=;
 b=ZGtY9CySt4DtRMfzFBjsgxq104cF+hOvdgAK0EbP/H/rfqLnouMzpM+muXVHEqlH/P
 Oz24HDoga46sreGhkAR04n+Rzx63WlONX5eUi/r6EKijIS5qH0xRxCFTEDMKEU+QnEdk
 P8OCmWDGYYMoUoVySBjlbAgPjcnVw9yzuMDVv7tYSEpIkZZOQeJbMQ9Pci6LaKw0z9mQ
 gRFH4tGLeWWoTRkxFuVEdxvtc4HQGrdFATH8WwMHf8KvJmNX5WP429BwrBMf4qpRa7Es
 Tx04IBpCuLGqi7ToS14cg0dEMzkpS49c22uu6f1CFsBSV/DA94c1QHAreyLui+gGY4ZF
 wGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687269150; x=1689861150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/L6k17gpEI8D2h8BVhU/DBfxSXfsmLSiexMsP6WVg/0=;
 b=KBkOhRNlb/WL/4NtdMOE589tMbCBwZNoP0B6X/EUcM0cyASvzC3cJhVqcju+18lACz
 cS3m4a9f8mu+w56rZdUvLDZXzsNB7JSD0f7Un1yiWx/oWVf6Y03pjXHrE/swYGXnHBhs
 rdTIiPgVPGSRgiZoL5DwoRrXE+5C1lSVGZ4QlXyRuF9kvEq9ck1NPFuHBMyU3nc2CHO6
 LijUCSbLba5TE4f9axlc+0lCP2UrgSCmV720DkgkjFU+Fc6/og6gZpwLE1idQWswlID0
 jqEZG+kPhbB6eGzzaNTiIOIAEUwTO/P1hOnUejZJ1qKE3jpse8l8XMiH/HdCaPa5VVJw
 Pl9w==
X-Gm-Message-State: AC+VfDwmIdEndVIpBvVfXA+f5R+AAR23uh3OWT00dWhY8cNZAn5FPcyF
 Z8cP/25TjmCH86AYuy3Rknh6DrEkEDg3SQ9f27B8ZA==
X-Received: by 2002:a05:6402:481:b0:514:666b:1e04 with SMTP id
 k1-20020a056402048100b00514666b1e04mr7692584edv.35.1687269150511; Tue, 20 Jun
 2023 06:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124418.805717-1-richard.henderson@linaro.org>
 <20230620124418.805717-21-richard.henderson@linaro.org>
In-Reply-To: <20230620124418.805717-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2023 14:52:19 +0100
Message-ID: <CAFEAcA-MpN2kM3c4F=ihSEgetSQJVd0T9-BTUakTu=CAc+4HTQ@mail.gmail.com>
Subject: Re: [PATCH v5 20/20] target/arm: Add cpu properties for enabling
 FEAT_RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: eyY2lEY38zPV

On Tue, 20 Jun 2023 at 13:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an x-rme cpu property to enable FEAT_RME.
> Add an x-l0gptsz property to set GPCCR_EL3.L0GPTSZ,
> for testing various possible configurations.

Looks OK to me, but I think we should document these
(including that they're experimental and future syntax for
enabling RME will change) in the "TCG VCPU Features"
section of docs/system/arm/cpu-features.rst.

We could mention in the commit message here why we're
making them experimental x- properties too.

thanks
-- PMM
