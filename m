Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2495747lfb;
        Fri, 22 May 2020 04:51:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymOHoxWVps+L81VJoV5hFilmmbZbAMwVryvnojU/kyOFPjVO5VIv0GyBET5pH+kqlYGfAA
X-Received: by 2002:ad4:46e7:: with SMTP id h7mr3264542qvw.221.1590148262139;
        Fri, 22 May 2020 04:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590148262; cv=none;
        d=google.com; s=arc-20160816;
        b=kiNDsJlna2Qpe1gKghKrPUyH+CAas88v/ut5B1ClOMzOL0Vlwwe0H0WDY35pwt1lDr
         kwtHpOvB3QivRsiT/PIDDsek118gBB1t7Nte8sWNIOKunRgV3Lsnb7+oTX7BTvd1Qr1R
         FZzsOyRS7L3JXpVaOpUfHv0wv+izkJUUZpnOcK2G4URJlfydkYqndL0uRJ5RfZsO+GGP
         p4ppV9lvHA2RtwcjO7VVoZpesjUbrFtBRfYgk0wNdCQah75DHa7I8Rsdsop1SbvEmxh4
         hfR3o45xIyn1d1ONgzHxdPNALDG3sniyabqnp4pT1zyDQLHBCcbRmBx3Sw4quWX0N4FN
         oluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=9rh1KUeQ6WingxFQSV+jD7fxH5dhUVTY+XOuOWCo0pY=;
        b=PlzKasJ2RCEl8XGs9P4dL+bR9RC5C/uEkSgpyyEv6eycaunwOCk+3sXCL4jdv6mqcH
         bmvP8vaoFnb630cDtgIhbusrepDEtvzCrPH47DBTYYxDe9MxgbvVrAoUdT6VxmqA2sp8
         OqUUzFekytFFihM67qBOx6e4EnSlD0kQ/dAIwIbfjyp54LKWCGuYtXFVOeUW8Ylg0tfr
         PkCNJoMRAaBu6Q/7d8gLiQap+u1P+n26At3W5ZOypHgKwNd7UzkpbLnwFPenI789QpwR
         dsE7OFsTqJIXcurcrJa/Ps1Xpjmn0UZpH9zI4DM9tZQY0D724jviMOs/mFB2L0G4OqZ0
         kcUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IF1ba+2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si4840891qth.290.2020.05.22.04.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 04:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IF1ba+2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc6Cb-0002xr-JY
	for alex.bennee@linaro.org; Fri, 22 May 2020 07:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jc6CU-0002wf-JN; Fri, 22 May 2020 07:50:54 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jc6CT-0004bm-Rt; Fri, 22 May 2020 07:50:54 -0400
Received: by mail-wm1-x341.google.com with SMTP id v19so2593910wmj.0;
 Fri, 22 May 2020 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9rh1KUeQ6WingxFQSV+jD7fxH5dhUVTY+XOuOWCo0pY=;
 b=IF1ba+2ociACaw3elbBtT47u7XAO933QRtZvVojyiLSAhkAMMHDrvSrsYdqlKxLbK4
 mBx9o0ZMXbWk9YUw+j0EO4OmAxht6Mqrzj4oB2LOj+1a1YHeCt12cxUG5PDmiBxDrzso
 nuqtHN7ofxpp8Pe/VOy3dtHqH7q5o5Re0QPcxQUxObT9qRzAYj6bDyie8zwPKB0fWFJ0
 yMfqmfCBKOMT9fESj56cZvteYL4FWo+VDIysI8pPCGJmYhPcXstHyORwM28G9Dgi57vY
 YiTa7NdlB0VJknODaHGvq28/NTJWtpTaBAXR1Xhap4baA/09oAOpi03UORadwiWF2D0m
 9bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9rh1KUeQ6WingxFQSV+jD7fxH5dhUVTY+XOuOWCo0pY=;
 b=Iqh59L2EGsdStMeO4Ta6fZLc1jtF1+bcPnU+vbHPMD5OdFXR/+5hNKzc8E2ERqpk99
 BxZdp0gW71rSzmAQ7DeMY1rHT4BmRA955uRq7uJj0+DJbggKvwdqi6qSV8ZPdE2DTh/T
 /g2ECAvPf+b2B4hS9mxo21AYp1x0YISd/u42UFvLYdgW5oI44SgS1oWECqiAmU1oerJs
 kv294uFK9vA+fDJtsVZp+3KLYRi6o9gfypVSdI4LN6g9kQ221tNil7KHmV04QzGEyWkc
 0Awm+ZpMAUzSy2q0hi/7v6i9w+6yqtqQdWeYMB8hNL6OlAJ4WBFzuDlkYnmIUYipis5t
 mHSQ==
X-Gm-Message-State: AOAM531vD8U5U2FcTvpnUfsj0jmR5V4/DRwU2r35wHvysEQVn4XOpqmD
 HK/gKeD+hgyVxjF5NAt7LCM=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr12515149wml.62.1590148251451; 
 Fri, 22 May 2020 04:50:51 -0700 (PDT)
Received: from eden-linux.lan (bzq-109-66-59-205.red.bezeqint.net.
 [109.66.59.205])
 by smtp.gmail.com with ESMTPSA id m3sm9237640wrn.96.2020.05.22.04.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 04:50:50 -0700 (PDT)
From: Eden Mikitas <e.mikitas@gmail.com>
To: peter.maydell@linaro.org
Subject: [PATCH 0/2] hw/ssi/imx_spi: 2 Fixes to flush txfifo function in
 imx_spi
Date: Fri, 22 May 2020 14:50:34 +0300
Message-Id: <20200522115036.31516-1-e.mikitas@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
References: <CAFEAcA8FFc_Vf-UQO9f_3qoXiCJf9N1uWh7qB-WXrEWTzKBu8Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=e.mikitas@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 jcd@tribudubois.net, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 e.mikitas@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bIX41v6wO2g3


This patch series contains 2 fixes to the imx_spi_flush_txfifo function.

The first fix prevents a case in which calling imx_spi_flush_txfifo while the 
controller is configured (by the guest driver) to use a burst length that isn't 
a multiple of 8 will cause an infinite loop.

The second fix makes the spi controller compatible with slaves + guest drivers
that expect to make transaction larger than 8 bits by removing an unnecessary 
cast.

This patch series was tested by running `make check` and by booting linux on
a sabrelite machine (which uses an spi flash)

Signed-off-by: Eden Mikitas <e.mikitas@gmail.com>

