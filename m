Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2392107ejx;
        Sat, 3 Dec 2022 15:20:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4qRrNdL2tc1kFS0mNd0q83cQF891MjOpQweaw9cU16DW0wKacWaUFjd7avXBGSrKgptM5h
X-Received: by 2002:a05:620a:2047:b0:6ee:f574:af5f with SMTP id d7-20020a05620a204700b006eef574af5fmr51720755qka.761.1670109634274;
        Sat, 03 Dec 2022 15:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670109634; cv=none;
        d=google.com; s=arc-20160816;
        b=sp86ZUK2t+4O8IZaxkI4ikDmqvI/G48tLpUaaxdQo4DKr+ap6h3LxNXoCzLD1t4w19
         fdy72vMuhg8vlkwSg4JePe+gaIYXluX+pD6FRdXmSsM0ApE/NCNK4Ib5InPsn26zZZ/r
         UT8OJKztAP/hlNtrfFhPYTjaAz7dXR3HQ/srsKcXJroWoK2hiiWNexEE7ApHOBoSib5j
         Pes+vrMDJAA5UnMitdQbZylgjga+YSx3aP0ZnwrbMOcFSney3AOuqJOChKHeJXChB5cc
         7PdyRmPCnpE4nXWM9oPgJolBxS4TGBpiwrA/7QmyoGNNT1FRQjNW2pbc+zUIo6aJ1yvJ
         ESmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hNBvOLNtuNzW6P6rPNag+NZ5QBlW2U7hfyBqq0mBtpM=;
        b=ujwjfQAzcU1JHQGsClAUHNiLtKF6pZm5665AVyFiWgVFBWzHHq5ZwBFkedde34i6aY
         J1EjDfQ6zLePUMJBf7sy2Frs9QwGtiLP/7uX8hlXiiUpDhKI78ScQ64QK3t/4797DDjp
         ceXi0HEySd8seSw9yeJIYpRxRJ5L3v553YWFPBTSayBa8Ypt5zoIMa0DXecwfmzPRmCl
         qubLTWFbLaB19EJnneGwy5sxAAG8go+QNIx75148f2ejejewg74L+OyyVXakwk4bFDlz
         4C4Ds24cdbLiR4yorBLiYcCbH0q6GEdgIaj6oiTzw11OjO0Bo5cxvrUPOU36YvEPjshQ
         tjTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YZr3fGfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn15-20020a05622a248f00b003a5504674e8si6486004qtb.278.2022.12.03.15.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Dec 2022 15:20:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YZr3fGfh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnN-00008A-A0; Sat, 03 Dec 2022 18:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnK-00005s-H2; Sat, 03 Dec 2022 18:19:42 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnF-0001Zt-E0; Sat, 03 Dec 2022 18:19:42 -0500
Received: by mail-lf1-x12c.google.com with SMTP id b3so12939689lfv.2;
 Sat, 03 Dec 2022 15:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNBvOLNtuNzW6P6rPNag+NZ5QBlW2U7hfyBqq0mBtpM=;
 b=YZr3fGfhbGKZbZJxG+qL9GjfNDERMfIw+EVS1gdY6JcYJ5k3pBM+YxG5S8ydp0ztWV
 aSi2bPWR8BnFnEtVeL/y8rD1+zH9QUcVbeWYpuXP//0IgOFveW4YamsK5EiYP1TBY/cA
 Kso0XDc6PCCmETksidRjTpuYwdvVYozNi9YGHThMcvNtQspTd2ILJa5iDVTSVgnNg+bi
 1Kg2ib19OaqD6gTQAKl25dyIvnCFHrfdJSk2NC60gL2F3d0OA1dv5fzZ/FMHqEgX31bg
 Y5JRvfkWSBKr8jElp9Vfru0BNwnbRoG/2ghji9ieIiJfp5pgDsJ6pdGIxqt15Ob+caw7
 KDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNBvOLNtuNzW6P6rPNag+NZ5QBlW2U7hfyBqq0mBtpM=;
 b=ddIYvtHfEBTYVO3/Tz5PuPBR7X/EetQV36kwaG0XAqClX5oSZfrZZi2lh3xrsUdWEr
 fdrSzPIPjtRc/WSPcdXjZxXcCPtuWzgaKQ8rBP1cW7Lg1hJNezY/XaQYICPo+nGrXtWt
 WjxzJeKAnKKUZk/BlbhP1DXCRJ7JIf2l5jWfG/2NBOvREcRFyb2f4bbS8EaZusfFuMww
 HL7+OOjk1A4n1E1BafzRaIRFXs/Iw0dSjjWPtw3ovokmkyCN9Vq/yhGra5RpMqFhGAZ4
 rjnR+WrDKJo/t2B5yFAY3zBNgo7+iOggJ+kyNgVHNiY3ZaS6m35WvhsdzdSnFWDNI840
 cnfw==
X-Gm-Message-State: ANoB5pmQ6ULCldNPDhoz5fZwG5lVAqaVYOzSLQSsx5ekwMRnVZyrC5Tu
 DMpupbP2Sts4aWOQWAudJu0=
X-Received: by 2002:a05:6512:33d1:b0:4b5:1c86:9267 with SMTP id
 d17-20020a05651233d100b004b51c869267mr10259308lfg.297.1670109574586; 
 Sat, 03 Dec 2022 15:19:34 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:34 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 5/6] hw/arm: Add AXP-209 to Cubieboard
Date: Sun,  4 Dec 2022 00:19:03 +0100
Message-Id: <20221203231904.25155-6-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Y+bcMZQvhWqZ

SPL Boot for Cubieboard expects AXP-209 connected to I2C0 bus.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/cubieboard.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..afc7980414 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
     .loader_start = AW_A10_SDRAM_BASE,
@@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
+    I2CBus *i2c;
 
     /* BIOS is not supported by this board */
     if (machine->firmware) {
@@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
+    /* Connect AXP 209 */
+    i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c");
+    i2c_slave_create_simple(i2c, "allwinner.axp209", 0x34);
+
     /* Retrieve SD bus */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.30.2

