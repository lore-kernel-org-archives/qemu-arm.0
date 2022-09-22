Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp296085ejy;
        Thu, 22 Sep 2022 06:43:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pDEEyW/Ay08gONEPtnE2+Aax75pSPBdfbBbRjbd6uwAlSeYdLQP5HyqCogzww4Od9YJBZ
X-Received: by 2002:a05:620a:108d:b0:6ce:612b:7075 with SMTP id g13-20020a05620a108d00b006ce612b7075mr2128423qkk.162.1663854184423;
        Thu, 22 Sep 2022 06:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663854184; cv=none;
        d=google.com; s=arc-20160816;
        b=JrKWvf/olFR6ChLT75iEl92Mmm5TAYtZqKstk1dJIf6WQT2gaimJFOhTNaCLu0Nx4z
         QH0R6lZQ8yLbJTGdrKFgn5agG2rPttZ8iO9DutaOl/kc2vRSbb0nbMfh9/6vuklI3dxG
         cq/A2bk+Zo7qa81MEwOS89dzYcNAnG86lnmND9zY/VUL5D0jBAmk5rJ8DIg7jTfsMovE
         Of9wGgcPY8ZDPwhpVjkVBECYktZF8flFRKKKMd6WSrOYuklGPWOS3JFI+6bnbTXTBwGp
         ZPQx3T49IFjdwsCTedtb0SPgGH/UN+qnASFsBXQY92mlsnM/CU50ieFWIgOmSmpBSqhP
         RfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sF67sX5By+JhvDokffB3dn04QMGzfEEwCtalM79dQ4Q=;
        b=LEhBF8RnPjl+O00lTjpiunZA3DQQWvz6OI9Jh3ZdRr9htejva6SXiG7BMXTK6LwGEQ
         G8sxQmWgiNiMbqlrI6Ngw8dpZGxiYQSERsuRBwaFlIyXKOkl3BrxwtXCQt1LeJhqwylI
         dZmgpntNJ+LaSqO2KAJWFd0puDrR6Ms6G8Q10EXMv9ecKnn75y/Y01O0/DBfu3E2PsU+
         xLZoEW1TIh8dXNfz0pOj9BZgF/GZC5DBGG5hnA6b9TKq3JlB7ojYYAqSF4WqvTOJrGE1
         UIrGjAGWaZNoyTtd0tuqOOb3G3AozBYqKE1wRtRjxr/gTGPoqI/gD72oqT1HlxgJTA9Q
         ja7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrGlLwFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac80143000000b0035ba3c48b6fsi3230202qtg.72.2022.09.22.06.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 06:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrGlLwFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obMTn-0005Nf-Ub
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 09:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obL8U-0007mE-KY
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 08:16:58 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obL8S-0008T7-TC
 for qemu-arm@nongnu.org; Thu, 22 Sep 2022 08:16:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id sd10so12227895ejc.2
 for <qemu-arm@nongnu.org>; Thu, 22 Sep 2022 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sF67sX5By+JhvDokffB3dn04QMGzfEEwCtalM79dQ4Q=;
 b=ZrGlLwFAQVbDUwz6wgYHWUEu9FGm1tVf0WHYOC2azk3n4D+7S8UvaEhaoNgCBZ5BVq
 VDFgpxMBwrhQ0cmQJngTSqPdQcd2v1j5z5XSJWDzwt5RpUWK/ozUJhXLecq+usDrE4mE
 lf8v9FsdbZuTC9oQQHM9vT2wOrj5bTkej6QHP79kOQa1Uq2pWy+iSRVhSrDvuJS9DuPc
 IMme0MnmdtnT5Ku+Mp+RwgmN6KdOMqtUV2C6WNgBgKA5Lx2JG4e6/7wzkCI+d2Gjf4ju
 O9Qo4wzntBwYScyZ1naSdtuo0gsXuUhCQP93cj+9/GEbXgCFt5yWOXgichDlFKYYa3bc
 p/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sF67sX5By+JhvDokffB3dn04QMGzfEEwCtalM79dQ4Q=;
 b=OnP3St25qskwE9c1ySu4eRq296ClsEQExnku9BuWDjyu0BWY9cZR8IjX0QFLiNJKBd
 yVtsa+cofpqMW56nrSR2Rb0bfJwcGuLktMwDAsdg3/iFR3G6nRniAzOndGeGzGQkF0dr
 z+7R3ESGcH+wKRGxK4EzAyT7MYVcg/Mt1JAlsnNyPOlh0qrkukx3/nHAJcbqtegmD4Of
 eet3DsjRYIBzQ5uTmgcY/KaUavdXHlKF6XmsuS15JLS2nykEcDs6HsiMUyVEW/VlDnxI
 ZwvdpRFlizTq1NziXqgXnRs+41FJxsJMdXzBrgo/ycpyXosAcu/XyFtXkPhwd10MfQA4
 jgvA==
X-Gm-Message-State: ACrzQf171wo3/IfTvVysRdvl/OvRYa6/568Ff3haeYacgcKLaOLFcJDE
 UmT1BppmEqxXqw+aAIYKaDpiZW0j5FUxMw6Fg7LhLA==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr2482697ejc.619.1663849014668; Thu, 22
 Sep 2022 05:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAB295yAkUjZLxOZ_b4P9r7JMhkN=iOoTYV6aYJa9myJ1EevHuA@mail.gmail.com>
In-Reply-To: <CAB295yAkUjZLxOZ_b4P9r7JMhkN=iOoTYV6aYJa9myJ1EevHuA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 13:16:43 +0100
Message-ID: <CAFEAcA8mGU1R9Q-kj8wYNLr-2wYLGD_h_qFJ8DYxxk-4GdyyYQ@mail.gmail.com>
Subject: Re: QEMU ARM patch - Signal TSFL_INT flag for lan9118 device interrupt
To: Adecy <ld.adecy@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRANB2YzwUZf

On Mon, 29 Aug 2022 at 20:59, Adecy <ld.adecy@gmail.com> wrote:
>
> Hello
>
> I'm new to QEMU, and I would like to submit the attached patch.
>
> To give you more context, this patch is required to have the Micrium LAN911x Ethernet driver to work with QEMU, as it requires TSFL_INT flag to be signaled through the interrupt.
> (demo https://github.com/lucasdietrich/micrium-os3-qemu-arm-demo)

Hi; thanks for this patch. I've applied it to the target-arm.next
queue (with some tweaks to the commit message and comment text).

-- PMM
