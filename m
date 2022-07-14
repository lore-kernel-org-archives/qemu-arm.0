Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp794757lfp;
        Thu, 14 Jul 2022 11:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vPn8bzhKdTYk5C8/YoU1FzeWQ6s/ofQTZUjPIB3BVXMKGB8N8sSfxZeteywh7l0iwC9tHO
X-Received: by 2002:a05:622a:509:b0:31e:cd3e:dcdb with SMTP id l9-20020a05622a050900b0031ecd3edcdbmr7828589qtx.379.1657823973034;
        Thu, 14 Jul 2022 11:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823973; cv=none;
        d=google.com; s=arc-20160816;
        b=RUPK2YrYaKxsEwVDS3G+16L5kvSCS4VcXJE1vRBUl8CbZ5762hH/ruHKwyjLuTy1mn
         6oAdYHUb9gt5A7bTzZQCIHIWAZ8S4Mi/fBaBxo6m78EeJISoEEuLBSNasWo/8sYNqGRo
         gDCbHRC3aSrlKcsgoAa9s5FxO3kD9puzwLd6xXLd0Di0/9rxh16FPvjl9xFnIvAO+UD1
         yYCyy/HiIbg4FB4O2qlOxWAlQVwXIKgCuIRUQuXnMb31TfGiICBC178U4tqfzbJYo8NE
         FapOh/8Rl/hTJTh+JNMH/xajBYAzjcPwjiCaZd3BeR6YSvPDL2+XsUapo8xyjMNT0+13
         c5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
        b=aWWFX7pT/TkheE1kngsohLUsCKbEp9c9cUi3WTv+7YCRlnwKRY7OfYzwa9/f1W9T0M
         On6b8AEulWgGRhnUL1DYeuJAw/AnMbzzdIijRh4mVV4U1h64d1/2sQuhZMZgbbOlBX42
         Ijd21FP8iyRUUHYCjOzIpJ0AI8IWB/BCL6/YlQFIV3uMVATTNxUpxb+DQEnPlcyCtPca
         Bo9Uv6mgyakxkQFELsZiuuGrXue1rimebW7Q2LAolnPqjowvgmiIwxuJs1Ychi2Mb51K
         HI7cMm97aWpNpDVnBO0XEaN+d6FBNKMSVx9YA1Kis1KjF/bjSQpZ1pJJWxWjqi4GqgDR
         7XVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Wv8eRwP/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac84e94000000b0031983f57a40si1927639qtp.108.2022.07.14.11.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Wv8eRwP/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3kK-0000nK-FG
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YWDQYggKCoA0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1oC3a1-0005sw-6E
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:53 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:38567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YWDQYggKCoA0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1oC3Zz-00085h-Gx
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:52 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 v202-20020a6361d3000000b0041615ebed02so1580144pgb.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=Wv8eRwP/9XrCa7R54Lef86tuEJ23mJfrbeZjpkLIFtxI/ubS+Gb6V3g4cSJaDpMObb
 2b+C1CHaE7DniNtosnVIFA41BtmQpoB/pMg4AxGjv31P82x7u+G2Zog0VnSnNouM4cRK
 9CX4Mc9ZFMa1iTEgBPbKop1OoxJeDyk2mU+lBL4h6ex/hzPLiXHfVhL1hRhy44vopJ6M
 htj243tIBd9lY6hlzy6lYgR+lVYaTYgewvm8YXxySBARNUovDS1Gy8SXHIK+PGKjJ6Mv
 ysg6sYH9zacOrhT/65ptlVzGYdgwmtC59q7vS1VHYdqaY+BKUFfOOQ2YmwBqjD+8fSEL
 buiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=prn5BikvGTxL+T2eAjDjh7w58x/7dVu2XkGCxJub0TDb95qOXgdjA2gwT/mvq7oZHB
 OeHw6gNdqtAIXStI1gezeQ4ts00ycGiPa8hkNGV/Shd2OYRDZZd1CJpLY+XpuRH/M3GA
 LpREN2E2SD7620te6lHb4uP4U6gu54WUgNB7Wcd3qzza/0Ex4d79LjLq9RnHA+3ReC5P
 xTrR101Qt60gQfrjs259rJCd1QoPZLTELoDvg6HaxMMqBY3fjn9VJJJp+oiS4FyAoJPy
 M2XDlksujN89sCRrUfdBtW5K3FsyEolATJWS5icbD2DhClJUkUvD/40SMWmn93ulbTug
 HDrg==
X-Gm-Message-State: AJIora8RXUO0G8m2HX5T4tC7sXUrof70GiaGF5yoIGVIDcKunEwd1lRH
 mnKARadDQiNqDDGP7HQ+KUonUU+rCrhJ2A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:40cf:b0:16c:6c93:9734 with SMTP
 id t15-20020a17090340cf00b0016c6c939734mr9998631pld.98.1657823329827; Thu, 14
 Jul 2022 11:28:49 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:28:33 -0700
In-Reply-To: <20220714182836.89602-1-wuhaotsh@google.com>
Message-Id: <20220714182836.89602-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3YWDQYggKCoA0ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HdxyDtr4i1x

This type is used to represent block devs that are not suitable to
be represented by other existing types.

A sample use is to represent an at24c eeprom device defined in
hw/nvram/eeprom_at24c.c. The block device can be used to contain the
content of the said eeprom device.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 blockdev.c                | 4 +++-
 include/sysemu/blockdev.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 9230888e34..befd69ac5f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -82,6 +82,7 @@ static const char *const if_name[IF_COUNT] = {
     [IF_MTD] = "mtd",
     [IF_SD] = "sd",
     [IF_VIRTIO] = "virtio",
+    [IF_OTHER] = "other",
     [IF_XEN] = "xen",
 };
 
@@ -726,7 +727,8 @@ QemuOptsList qemu_legacy_drive_opts = {
         },{
             .name = "if",
             .type = QEMU_OPT_STRING,
-            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio)",
+            .help = "interface (ide, scsi, sd, mtd, floppy, pflash, virtio,"
+                    " other)",
         },{
             .name = "file",
             .type = QEMU_OPT_STRING,
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 3211b16513..d9dd5af291 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -21,6 +21,7 @@ typedef enum {
      */
     IF_NONE = 0,
     IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_XEN,
+    IF_OTHER,
     IF_COUNT
 } BlockInterfaceType;
 
-- 
2.37.0.170.g444d1eabd0-goog

