Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp361375ejq;
        Fri, 5 May 2023 05:01:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6P+T/uwX8NtvXp5n1dEGIbBFwtjDaGZ3EYxPjtP2eyx2Ovy2vD++sm4CxnidAilGRgbKJt
X-Received: by 2002:a1f:4583:0:b0:401:8c97:737f with SMTP id s125-20020a1f4583000000b004018c97737fmr297015vka.12.1683288108456;
        Fri, 05 May 2023 05:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288108; cv=none;
        d=google.com; s=arc-20160816;
        b=BLoTB62d8fhNrrL0DSJoVyHm77Jt9swy9+15JEG1hYyje03r84UJGDlwoN17ve7kxx
         mAFsT+EHBcnIFagvTNFjEoiKzYo6AlazlJR9fTOfCPtCHF6ffppBm1/nMsi0E70DV3/k
         ivwEk0NMUVANBu0xptirl301Cq4RiJQitp8uGCFOVrLgTxV7K1Lv9qpS/VlKKUQLChto
         V3WPSxwD2QugDbN/eTRQdF3FQgZg8/MqBB+fj3ag657Lf18yZKSRWMRrwQU1VtMR0CT6
         nShqUlqYsWOUSlbh/mKF/+D+2B3Zxh0dm7Clt28Eky1O0ONfXYRaytdR1JrUWD6nobK1
         W8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
        b=Z+/PJXqpGOH7JVOrgPqKVMACjz0HKj7csCECtWv9ti9CjVZKTHh6bc+TXCpberStU3
         3g4SnwRH+/zsTtJtoOLtBBzvkDlON1NsTHq0VRRNwEHo2LmQaOL+eLwrNtKZ/FjdRHCL
         5UbXj/EppVSW5GhO7LNwQ7yiJAHQ/zCy+Vc9jX687ZLFMKjho/yQodtFM04NNaWfei0X
         0+SPZ9uq0g3mFtXN03mDW5OntZ1sXFgliXO8WoDGBXv4eFKBuNRZLDafGC+kX+FeueIV
         E0otVni6xCMiVFssTL/ZVoU7EKS2bQ/EVC7XYNMJEG5VskkftSqcqDcFw5rPYAbbgVbQ
         GHiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0lalG9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a05620a11af00b0074deadc85fesi629390qkk.125.2023.05.05.05.01.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V0lalG9X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puu80-0006SQ-SG; Fri, 05 May 2023 08:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7z-0006RK-T9
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puu7x-00022g-R7
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:01:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94f4b911570so256971766b.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=V0lalG9XXtCujSphE2jmcN7CLGLfvn0ySJiaRM3ot9Pozj01nX0C6Z70vzHr0uFV+F
 Fbqxm8wXkpBxsllSId1BPlxw4OlePFCF5oBzdj7paqlFL2itqxrU8aSvn+UHts3BaXys
 h4w/SAKTurLhJDLFVoM0IOg2CNlq2AP1bNDf6WmQWKb8sHUD6aFN1TPj/gI78Cm1Lmaw
 BxaNcazMnodF8SPBCXmtDutjwZ76NsbZ9pxgb05m2aODHOuj7Q/Dn13Z5MXPKyAHMwgl
 xc3DpxT4HYv9BhDd6UZJtV/RPn93hj/4FZfxIQ5jJ1Kp5yEamEKqq5du1dLue6IsDzhO
 Zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288090; x=1685880090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GPizfIbc69JR9QYgpsznlNOg6hZVy8+wQh+66XVuhTg=;
 b=eSHmZ+8r95P0M232QxXwI3ZiSgw8Vlbl5xx1eRTpE+zNiU6k7lW30KPf+/fJNzOdid
 SblhpeEK1soMiQndqDeC+w8gRLK/hq/lvhFQr8USXkfe3NO8KHJ8MhREFBlhkya/zuMZ
 keYDsLfGu6eS33ZoyCrCjYSiMz8B9G58oagpvx95Wu2YL7DEa6nYytsjYcqM/56PZz3q
 43CnAWeUy56byB3unNURqgBItvQTGcly28vzMaKRMKzfQghKyC61vQZn3aGVggeovowy
 HrhTQ61PwWps/VkE68gl28/wsceqJUQw/U0f8q60XJ+kzzLc4DBJu6j53KTx2pbWaeKM
 rXMQ==
X-Gm-Message-State: AC+VfDzxzMd3mkGxrxONJ2i1oHzILMqV9Mb8bK7hE0TyjVD9whGPBF3y
 qHz/SNTyCjZcW13bsP/BLFMDIylpNhB1Y94dB2i+lQ==
X-Received: by 2002:a17:906:ee8e:b0:95e:c549:9ace with SMTP id
 wt14-20020a170906ee8e00b0095ec5499acemr813409ejb.62.1683288090174; Fri, 05
 May 2023 05:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-22-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:01:19 +0100
Message-ID: <CAFEAcA_eSG4c1CKgOgOphM2yUZ1pL3AM6muf8Bcyx8zwXX9sSg@mail.gmail.com>
Subject: Re: [PATCH v4 21/57] tcg/i386: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: N89opAZUuA+K

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
