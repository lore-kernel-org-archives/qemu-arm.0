Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp616864ejb;
        Thu, 2 Feb 2023 09:57:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+4aPKlZlZYfyuIuglH1JCXEoENo1mfr3oflegi7tzgJ4jfqgwRylBwZOMKTmR8Zdrz8xgn
X-Received: by 2002:ac8:7f47:0:b0:3b8:6aff:9b61 with SMTP id g7-20020ac87f47000000b003b86aff9b61mr13204174qtk.23.1675360669149;
        Thu, 02 Feb 2023 09:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675360669; cv=none;
        d=google.com; s=arc-20160816;
        b=n1RAS+qmxErfF0tuINa8DkrthDjIwh8UTOaYn70cUa5iYVWUvy9XfHQbGlb8f3IQ/b
         ytb4whK3Uu9DpR2QtyyidGlXQmkk/bNDA97BYSsfa9/XBTps37LT+JgxZ9DvlEyen2iy
         YOIOupCaNpiHFFGQdYpFbTflJmFkrm6mLCNMpDMkP6aGov6SXrj0FPOEHeXG+YWVofR5
         0FmixoBYq4UYqtCd1lcq5KC8JDOkHg7E72i/+U345orYFpZY6I1u17v3sK+RhWG7LolQ
         43Lk39t/Y8NKR977Ge6/obJpVpU7/lBizSv9AY6zFSPUOUk7RoiqH/zcXuRfUp/zXNsD
         NHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M6jS0CqXT05TF8VGyyPb39G9NGW2t9U8pkO4RoVI5SM=;
        b=DYENU4/fMvWUc2UOEH39a5pLbne3doWhB7JKO/OHkek3hznGctyaIQvtIe4LhYVdMp
         1cFWHzRfrPRqgAwY00HhSzE5qmvGh1q8XwtXM1e6audxHlj3U6aWNq1pKhibHNoY5JP0
         WOt/VqgItTfJZwAnberN7EgkJgOjQkvtqfHlD/9jg2GBAy8WnMwh9jU0pfRXRnvK/nGF
         GMlNbLSZPG7yZymD7dFddL/6t/UTtZWDWroGvD9uH4094Svm7prcSOd++wMdxzEAv324
         gh0M/ZI+eywlzhK/tB6XMZwek3o4+YnhOVDUZNNRLcep6Hvs1ZhqqMSSiZ01W7OxGchd
         ru1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HQZk/kFh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e68-20020a378247000000b0072804dda761si136448qkd.685.2023.02.02.09.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 09:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HQZk/kFh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNdq8-00059v-Vl; Thu, 02 Feb 2023 12:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdq3-00054R-0w
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 12:57:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdq1-00022w-Cq
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 12:57:34 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z1so2646141plg.6
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M6jS0CqXT05TF8VGyyPb39G9NGW2t9U8pkO4RoVI5SM=;
 b=HQZk/kFhzG3vnC1H8kwsNLOdhx0sVY3/j9/k50gLqk4zzNfeikIBYJttvgSU2Nmj9D
 6nO+IGdAWoiYKV28fPVBH2f3qgicWpg0RfP1d64xumvKycThTcBgt8qv2QbTfgLYx2Sv
 Cy7cCMRREc7kqsDF7f9awgcApc03JgTIUBnRN8VM59RUjHxxxtCt35Dha/3v61TPJ+Gt
 JGDMVsJbLrWh91l6t+2cDFqKP3dC7qB8rizpoK2ahyowuYTja638GMMNHNYK/gnQWcKB
 VcW3+bJaGPUyvBhHt3eVUof2VEjONSkMFPO2GGEMFoBXCnODEzzjryojWLTSbmcnUPic
 ZR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M6jS0CqXT05TF8VGyyPb39G9NGW2t9U8pkO4RoVI5SM=;
 b=6bKbN5hfNGSXsXxQp7qgpbb6InfNgM2rKKNTDCrekzKYfAyTHnv+PzNOC0VmOGYORX
 VxjoXbh8TgB+n+tfMee3kietH9EmMHs+JIFa1Q5SRqNatqikP0rHY0fDMASmfyWRiSuj
 eEU6tUkZ2bntSlx+FW6rtIDCbjOZqhibdsP2b2mdWRvJZUN239P0kJgIbF7Oc25d1WLL
 +Oe0ijGMTlz3wVwDdQWT7D7duLKboDLmCkxeP+8EKAMwV7qgMJEg0jyYU0VoSkkNwijw
 jQmmJAFK29PV0YdcQI0uxDJKyh8jzFH/Q9/TnJWNRkXxAhXP8k0WtUbU61X42RSQBmcn
 oIPw==
X-Gm-Message-State: AO0yUKX61e9dyi3y3QA52KSSydN7WbGteKwCe/aWUAzSNPDTBXjaPVnk
 21jBy1FOCZiOprP4R7bkoQQ80UO7NW+hU0KGysBFMQ==
X-Received: by 2002:a17:902:f552:b0:198:a5da:bf6c with SMTP id
 h18-20020a170902f55200b00198a5dabf6cmr1810195plf.9.1675360652058; Thu, 02 Feb
 2023 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:57:21 +0000
Message-ID: <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: HzMChQZi4HMZ

On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
>
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
>
> Alex



Applied to target-arm.next, thanks.

-- PMM
