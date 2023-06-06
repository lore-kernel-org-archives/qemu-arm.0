Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3394446ejb;
        Tue, 6 Jun 2023 03:47:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+m/LMnWTlrJ2+2lW3Z8pz9mjsHaMUPdxmE+G2jx5E78DSqqAj32DaNd/wqUergDCFHGKb
X-Received: by 2002:a05:6214:27ce:b0:618:e1d9:75b8 with SMTP id ge14-20020a05621427ce00b00618e1d975b8mr1431016qvb.34.1686048420898;
        Tue, 06 Jun 2023 03:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686048420; cv=none;
        d=google.com; s=arc-20160816;
        b=NZ+NKf5P5TygBu4L7DxMDsXRRcG9BcvS80osB58Ti3aFbeO5lCxi5UKlG+zr2qXAiZ
         iJxmCZoFRg5njyM74cPzx5j1PgYj4OURMvr9AEGXaB49MXscfNub+xZvthSt0UC7ei3V
         PFH7IqiFvEsYSZ1qYmG1sBNgBRnLaydmDLEvu+X7FXSCdCl/FdtARsQd7PU2g6m8eumW
         Ujuzc0gTtoq+kORtk4//G0O71KCVHZAA7P/3hf1LvRXypYCozcIClm2LulR5Pfn69nlS
         4MQBJuO4S+m7tJYvV5ct2vLktjh/OrBlwmtKdgQZIvTZYQgUEupdOM2bO+DWTf9ULZn9
         xF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wQ8xvQXIw/NPA5OUrBvDh1xgwx3zEtlyU2wqK/K1jn0=;
        b=AhsMs356M1SiaBWyP/1mWFmK13veBCjan4Lwws71VPLEoaK7bPY2GegpF5hQ/MJwD6
         PAROV2HFURTZgqHDNbKRwhCwgzukqqA9YWNa78iEa6wzjzPEfZpH8Bml3S4ePyGo//aj
         GxVLtditTvNPhaRDKzY66kxiMLMjwJiOKjdNltau5FUOb8NbCIPCd1dNlFJRw/LAuc3p
         GQF08m6uyFCL4M5aEn02hlOCExvbECPIyCO1kZHS0UXs14cQPjtHf0YFSsTbq57Wws8s
         5FTB8HNOrsGdvJt5JJc8ba7OG9aYHx8p96S3lEPF5cN9YDWrZQWaUz95gMS8nc50QdoF
         JFjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDIqZkpm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1-20020a0562141d0100b005d275d01749si6533174qvd.114.2023.06.06.03.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 03:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDIqZkpm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6UCf-00015H-Lf; Tue, 06 Jun 2023 06:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCd-00013E-NI
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 06:46:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCb-0008GD-0Y
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 06:46:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f70fc4682aso51517125e9.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686048371; x=1688640371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQ8xvQXIw/NPA5OUrBvDh1xgwx3zEtlyU2wqK/K1jn0=;
 b=SDIqZkpmo0DpdmN8omCabDgc2adCxc63tiZpCXWEDRsprC/OSikZblpuuoRXkm9BQj
 w/KXU2I4XMjnBJITHSQbnEzNbHt+skwCB++3Pmq2fEJ9TBX+QA52xiQPpLjiwmA9wt63
 4HZC9gvXB8ntZgCe5U6SB9X6thQ0GjxTsCQo5YrUzNw30BYb8PUKonMTmStF1nZEOef/
 0JqzrlTlrd9GzEi3/ilUkf8fKkOsFbk4yWI+W6w0xxAJFYH9zT76sJi+h5zlaaUPcohj
 mBVp7Ul31x9oM+75iWlO67VG9gw42Yd5oCL6PJXpooOrqnxzhg+THXRZ8dCRr35Cs5XS
 q+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686048371; x=1688640371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQ8xvQXIw/NPA5OUrBvDh1xgwx3zEtlyU2wqK/K1jn0=;
 b=DevXZ/m+VPKvBmI0uX+GpjXociPvJEQaSBxgX46e0b4NKqjD3NxdM2gnc+X/XZSm/B
 sURmhnAKvPPLa00VKCEb9XsX4JKF1LeUWRB1f/+4us/+sHAXy2qZH1UEqHoFTk3Yxisk
 Q4goJ+wMJJO8gPrX9tgnIMeNvWF/n31N0wIP9Qbq8SmP3Xd67v765/BiRcAbHOHdlEUA
 7jtXyYDiBE0m7Ys9RyjNFttbkCVMjtABjU4AjfuWy39zHL3um2I6PWUuin3gndf8398W
 MRMAVhynET0R8F07iaNuhlmo4sntN0RF0YPlNdq1st1CqOSWnQFnEi8C7e1eTrVDShDm
 uvFg==
X-Gm-Message-State: AC+VfDzdbpPqAE334UgmjpZeSUvyoyU8aNyzsSo4auhsO8yVqm+iqJgZ
 xxPqHk5j6AV/2ioalDuTQDDbiA==
X-Received: by 2002:a1c:cc0e:0:b0:3f4:fc5e:fbf2 with SMTP id
 h14-20020a1ccc0e000000b003f4fc5efbf2mr1883013wmb.8.1686048371707; 
 Tue, 06 Jun 2023 03:46:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm12195508wma.41.2023.06.06.03.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 03:46:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 2/2] hw/sd/allwinner-sdhost: Don't send non-boolean IRQ line
 levels
Date: Tue,  6 Jun 2023 11:46:09 +0100
Message-Id: <20230606104609.3692557-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606104609.3692557-1-peter.maydell@linaro.org>
References: <20230606104609.3692557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pgaVfwfwd+mH

QEMU allows qemu_irq lines to transfer arbitrary integers.  However
the convention is that for a simple IRQ line the values transferred
are always 0 and 1.  The A10 SD controller device instead assumes a
0-vs-non-0 convention, which happens to work with the interrupt
controller it is wired up to.

Coerce the value to boolean to follow our usual convention.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/allwinner-sdhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 92a0f42708d..62df8f3d396 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -191,7 +191,7 @@ static void allwinner_sdhost_update_irq(AwSdHostState *s)
     }
 
     trace_allwinner_sdhost_update_irq(irq);
-    qemu_set_irq(s->irq, irq);
+    qemu_set_irq(s->irq, !!irq);
 }
 
 static void allwinner_sdhost_update_transfer_cnt(AwSdHostState *s,
-- 
2.34.1

