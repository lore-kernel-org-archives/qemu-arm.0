Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2387252ejb;
        Sun, 3 Dec 2023 16:32:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEy2hQaqJkvYXP7FUR1kYs2I4xMpvQvm5jvVGiWfLwmZrHHb9F66Tysp2XZxBeEO0+ZUbJ
X-Received: by 2002:a05:622a:e:b0:425:4043:50dc with SMTP id x14-20020a05622a000e00b00425404350dcmr5780534qtw.107.1701649950786;
        Sun, 03 Dec 2023 16:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701649950; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+Ump+JUmjjSz8agw1L73UzsCXT6VNt7XxGKZ6Rk5hRxcF6R/IPn5wKzw0XyVf1oVO
         yxFw1v6P41WGVC7K6rkK5fzzcPxIoO8OZJwp/dI3h0iU9xuTUy9aXWd/H3g+6YqSKF9t
         l0eykr0/fSnkOzBtCRp4CuBom/luJGjguthso5xr5bmAVHyKWQYMRah6CEHWFWr34sQX
         wbJIsEUV6u6Kd4wQ3IPwpSKwZ7qZoSMRFHqgJGHNnuN+mRUZcxR2zpYmq9F0CgUP2Y6F
         xWbxnKjrGrNvTkaU/pjKbN8TAWJUYtYP5kx6fy+5M7dGPwsctPes3kgOw3gtf7Qe+jU4
         PmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=igayQuYX/F7iH3RNFaYv1D/3MuPEz8Ua3kpb9vPSfPs=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=MgcBcA3KBZqf/DVEmA+YVhMVUszpzwGYML8bqOTuilK/GBgzQz2svh6okOmTquq/U2
         EwVsah9aRpRWjk/VboOgayobDSbrnCRkPZIN9VIkpdMMCQU4gAtBUdeXU8FqBOWvnvEg
         cf/DauviuNTYRBjSJG5b66cZF/ZwBLFUyJQW4cqjNsextL+XgZJNjk9DnCywlk9U/qn7
         frE5MORYUVn5/q2zt9jbTeYf9IceHNfVMe9oTwYlP3ugBB3cIn1FudKAncz6Hwtx7FE9
         BoFIGNjl6SDqL3WFqdxFMzwLdBuu0cKdztfU/eMuSg7kHRfqApoa3Qof3xzs+HkQ9MDp
         lpfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Do8cNZhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eh13-20020a05622a578d00b004255525d8e8si1445772qtb.593.2023.12.03.16.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Do8cNZhJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9woT-0007Ad-Ne; Sun, 03 Dec 2023 19:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnz-00051q-Lt; Sun, 03 Dec 2023 19:27:24 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wny-0000L8-2j; Sun, 03 Dec 2023 19:27:23 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5d4f71f7e9fso24244207b3.0; 
 Sun, 03 Dec 2023 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649640; x=1702254440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igayQuYX/F7iH3RNFaYv1D/3MuPEz8Ua3kpb9vPSfPs=;
 b=Do8cNZhJW5JRZAPco0FvBELH0G4dda0xBue/tgJ/LXFSJ5qWaW2ofp6cRi6kczLkJs
 8fvevEwkPzFvH0GXLjnxRQ2BSBpEZJ+GzaM7oDzNldR/QG+0/nvUx22BTL5tzNHtvrAR
 FAGwkfc5sRR4ExXMFswK7HxbVB13YzfIMJRhlqlN0JZNgNeysHO/3EtY7JekaZhVancL
 KFLlSJ0mhFU9lZhuB2H+2pxTFBatHzdjqdAuk37FUDb/8eE0K/5X7fdkiRy7VTTc2lg1
 kfOmEr/JXrEi93AxdvspikHEjpihrF9oCWXJj51wtNOgvlm+WI/1581vtWqiPDicPPVa
 a3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649640; x=1702254440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igayQuYX/F7iH3RNFaYv1D/3MuPEz8Ua3kpb9vPSfPs=;
 b=ZMCr5XIdC/q2eHVYWYmXmCJBpUDkeYTCWlX3a27xI4dBZFGZdNe6ycMnUcDgPrUEqs
 eo7E9hpvdGp6d5nJdJUBo05e7feeT3VF+wTWFHJkMUmRecbY8UgO7H9i6CGVR2DSEHrG
 6/zuctc8ukOEH9MwmiDlIEcsv386btDC+8NW5wU+RZgiL1woA87lYVlMXpU5z5mYb7Hq
 cOFEfh6k9lwHf2r7UECWamIwSrI4TjHD/Jzad/evBl9dtVZskuGDrQCcBzdf5kk5gg1g
 LSXFC56Ih0ezrAZZvNha5xLTdcYs5eiGuxsar+ldGsehn8uRIQ80WGd+hd8S7WwXUoUW
 qs+Q==
X-Gm-Message-State: AOJu0YwGBwJwXpP3ap0Nj3DQxzQQXcIrZx3L/GPQY6upmV47nFVMADcO
 riuPGnSR4jzpQi6wYQis318oMaBmsFgtJQ==
X-Received: by 2002:a81:4ecd:0:b0:5d8:1e33:483c with SMTP id
 c196-20020a814ecd000000b005d81e33483cmr604997ywb.32.1701649640566; 
 Sun, 03 Dec 2023 16:27:20 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:27:20 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 45/45] Add RPi4B to paspi4.rst
Date: Sun,  3 Dec 2023 18:26:19 -0600
Message-Id: <20231204002619.1367044-46-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: SIhiI18mP2vj

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 docs/system/arm/raspi.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
index 922fe375a6..db9e0949ef 100644
--- a/docs/system/arm/raspi.rst
+++ b/docs/system/arm/raspi.rst
@@ -1,5 +1,5 @@
-Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
-======================================================================================
+Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``, ``raspi4b-2g``)
+======================================================================================================
 
 
 QEMU provides models of the following Raspberry Pi boards:
@@ -12,12 +12,13 @@ QEMU provides models of the following Raspberry Pi boards:
   Cortex-A53 (4 cores), 512 MiB of RAM
 ``raspi3b``
   Cortex-A53 (4 cores), 1 GiB of RAM
-
+``raspi4b-2g``
+  Cortex-A72 (4 cores), 2 GiB of RAM
 
 Implemented devices
 -------------------
 
- * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
+ * ARM1176JZF-S, Cortex-A7, Cortex-A53 or Cortex-A72 CPU
  * Interrupt controller
  * DMA controller
  * Clock and reset controller (CPRMAN)
@@ -33,6 +34,8 @@ Implemented devices
  * USB2 host controller (DWC2 and MPHI)
  * MailBox controller (MBOX)
  * VideoCore firmware (property)
+ * PCIE Root Port (raspi4b-2g)
+ * GENET Ethernet Controller (raspi4b-2g)
 
 
 Missing devices
-- 
2.34.1

