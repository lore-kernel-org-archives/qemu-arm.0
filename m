Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp118786lfv;
        Wed, 3 Nov 2021 15:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx11C53RvRe8umxHX5uLof8Z+7tjnyDzoqNNfjdkiECMUdDQv/UnGOuzZUOYt0srBnjqr+m
X-Received: by 2002:a4a:5a45:: with SMTP id v66mr862285ooa.26.1635977224278;
        Wed, 03 Nov 2021 15:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977224; cv=none;
        d=google.com; s=arc-20160816;
        b=0G14Nanzgg00lHtYBkhs4FMTk+hOfKW1pWsPhu7IznLkJRChk0pC8KNin76tQxdqN1
         ypwTi4VtSoGm0mOXfbrmP0GbUrlvhS5bqn1+dVEE0bazbV8jwGxULthK/X2ddCp2H6iK
         IkQ7MKeQCktdzFrm2zGzXKwnvkRsqUM3K1j5bnPOufY8VMN1hLIDPGVFMiOIzAqAFjx/
         8p39t+fMXtg/5pIMWv5hEMtcLq6tbGiRKZxdKAmy1rBl/yGKyO58FL0ujBf4IFLaEYE/
         Yc99gxOVe4aSlES4qeyhoQYgCw9MEl7tWx3BV4BTHCgEm0P53d+8ociMn2hx39B7MHjr
         NPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=4NP9rIxBTEklu2hTKeeix8BSJczBevQhyLOZN1vXyl4=;
        b=P3qISA3vcajST3ywQ/rpGZHV5+o2UscelLfYFaGp2muju1zWxU5YwxB8moiPek4ddV
         kr5AGVsdjBlA1Fg1hZJwlqsXrsd7ngm/LtSN1gY8SATCSxHvED3JY533ZQSpQuEm8iaA
         AcsBbfjMx4EIMDZIJI0MtNj2R16NwGG3mjdcE0O2C+jvlwVHkTD4j3jDBf6JybLqRw8g
         6z6Mkl1iOu07W+gTxSz5d+hSp0+5w5WR2xm6k1fto+LKmgGjIITWqkOaeDOd3ePSWxHJ
         a/L5xvsYgg3WEy27B/EB55l1wUkq+INEjmpmiTTaM7+sgOh03BWpCN5tMjVx+/3CFc8b
         UHKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HjzD7ZSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 59si4089311otr.262.2021.11.03.15.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HjzD7ZSH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miOPP-0003km-IX
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xgaDYQgKCPEpnaThmlaZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1miOKR-0003El-2g
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:56 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:56075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xgaDYQgKCPEpnaThmlaZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1miOKM-0002aN-05
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:53 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 n22-20020a6563d6000000b0029261ffde9bso2160336pgv.22
 for <qemu-arm@nongnu.org>; Wed, 03 Nov 2021 15:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4NP9rIxBTEklu2hTKeeix8BSJczBevQhyLOZN1vXyl4=;
 b=HjzD7ZSHFMQUj0fc+ANHMaObSi8ycW3y9crT6lTITfS0G03l18t76hGPqBQEVEg2V7
 dYDRjQAX/M1oeqvdfnusP5sji/vSG5hP4C3IGSaR3HeZhLNNsbZIw2at1pn+6cv4e7AT
 rbR6oGPxmKBPYQLwVEc8cgpryB6G3ScWqnZJB9PwR1U0bRbhgTxALqPTj0bC6Ae5m6fQ
 I/x2dLEHKx2aWtBi/sBevE2Awvzcmnj3qOdUaSISLKQGF79za34DtQqynwoHJ9xRZOPD
 +9+dqDy4WYh8t/sNNSoRX5T6Zy+mWYvq7df6nBtabvuVUIy0Vm/he1jnqhtRgy7QZpSx
 aWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4NP9rIxBTEklu2hTKeeix8BSJczBevQhyLOZN1vXyl4=;
 b=O5GZMcyDA71m4ffNPmBBgs5KPzhwlnhP4IiEeAtQoiFO+NNQ1OZdDgexOhhpDxAzZm
 hmAOPuw5imGrFJIjs1K2O2c6Ls2ORmMHhXr4vbTE/Na8x+8ELFewWjVNkhqI9WkWGIRm
 p2Gs4c9dTohY6P0yB6SvoSEy3NTUAZ50yPt1fkEK1HXJ1hRd567mJUgeG/RZDYF5dvDp
 wqPyI9F8TkSFfHtzWd4m3g3LwqKWR0O4F2xzbO8HtdtNbQR8ZqtpvoL2Gc+erE/QAtAT
 OPcBh6HeQtmNHTyJVYwB8ZxVeKdJiJzPmQoVNJHVdyMxdEe1MvjlSFWisYoCMFBm0emM
 XCNg==
X-Gm-Message-State: AOAM533Amki3h4fSJo3Gwm8E1l2Ui2de6/kmdp0VNl7J0bhXmMvlA2MT
 1IZApsgEhVDiQLFYYilcjpsCp1Fi+OcC2g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:9295:: with SMTP id
 n21mr17523809pjo.229.1635976902489; Wed, 03 Nov 2021 15:01:42 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:31 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 5/7] blockdev: Add a new IF type IF_OTHER
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3xgaDYQgKCPEpnaThmlaZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: sABz7hFrhrFc

This type is used to represent block devs that are not suitable to
be represented by other existing types.

Signed-of-by: Hao Wu <wuhaotsh@google.com>
---
 blockdev.c                | 3 ++-
 include/sysemu/blockdev.h | 1 +
 meson                     | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b35072644e..c26cbcc422 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -80,6 +80,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_MTD] = "mtd",
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
+    [IF_OTHER] = "other",
     [IF_XEN] = "xen",
 };
 
@@ -739,7 +740,7 @@ QemuOptsList qemu_legacy_drive_opts = {
         },{
             .name = "if",
             .type = QEMU_OPT_STRING,
-            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
+            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio, other)",
         },{
             .name = "file",
             .type = QEMU_OPT_STRING,
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..bce6aab573 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -24,6 +24,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_OTHER,
     IF_COUNT
 } BlockInterfaceType;
 
diff --git a/meson b/meson
index b25d94e7c7..776acd2a80 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
+Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
-- 
2.33.1.1089.g2158813163f-goog

