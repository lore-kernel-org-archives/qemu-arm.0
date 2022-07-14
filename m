Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp793250lfp;
        Thu, 14 Jul 2022 11:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sju2+FsOCHQ+njPeqD5RghHCOi9SCLBBnuSpLBClej9WP7k8Mxcq4AzX/C5LNe7FfiFvAX
X-Received: by 2002:a05:6214:e87:b0:473:129e:224a with SMTP id hf7-20020a0562140e8700b00473129e224amr9137241qvb.29.1657823651104;
        Thu, 14 Jul 2022 11:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657823651; cv=none;
        d=google.com; s=arc-20160816;
        b=RRahnptc6tjhn0f++WmDAeZhwA9AMIhdTI8hqq8zPgRqJjCd/ivL/BbY/X38AxOL7p
         j4sGygiqFYc0eX+JHuwdOwpAE7G2jk7NgAF+mOadBp9QtpnW+dJHn4K9XOCYUIdCcmWB
         5LUQLkUwn/qBEkSKUWJ1O+AK0c3J5eEi0DDLmmmEkcImE6VIgc5uEWTzpDOKLcttDU7T
         qgK1I/kLYtmBfGedzCIgWbNIkYInzwoEY2Tlw93gl/mL388HFoKrwhA5WhVTll1Nronh
         f/9wuTFtbg+fVz6U0JbUBoZSstjMUpean52xkruip5sJd3qrs9COJ18kEhJjcdzjaQuP
         BLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
        b=0qXohTRFlt4cvoCQF+6TjwmMY/2HJtBymTvzGkp4VoGlQvGMKY+lL5tqlpYadlFxXO
         yQM6Dd1sis8wCqwltM7eS01rkATwJY4OZ9WWY7ehW9CvC4w6NiKlHTGhJz/Cz3TriR21
         b8hDiyWb39r5BOHTq2U8E73XYJyNdIRzPGscgDKoRGFeKbC0AOyp5heHCXH67rBFgTuf
         mnttwPoi0YpJW29ONQgZ0eX6wDSHH8JDhEOxaGEXuERQqXAwjNWbKh+7CXUDreKRJPIy
         j8lUEyQW+yZQz+3qeoOwg+pSCBPzx8XsM/QZqtYktJx/syRQQ0nlkCXwdGZ5v7KvmWbt
         PbMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TsjDMTFy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk29-20020a05620a1a1d00b006a795af46besi1732733qkb.56.2022.07.14.11.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=TsjDMTFy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3f8-0001JK-JM
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZL-0004Sv-PZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:12 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:46603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZI-0007kv-UY
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:11 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 o5-20020a170902d4c500b0016c643623e8so583117plg.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=TsjDMTFyTE6prRqAJ2cjQUdwmtvh1yxWKiWHGVHGAWCa+wb05IpZDy5f0UOa1VWDkx
 6bxxwbGBJ8R0TuS3iXBvW/0jMC4fOLh6GUNBVkSBBCRy+e97hSNrWCcDQ+L2wPx5n6k7
 cpw4K98+VUlk3aqIJ7fi9QgiH2lu9KwmmKiyqHppUr0l1Klpa9EFJvL0AOUlSVAjNRLN
 iinNzSVFa1ovK0Ql2Cg8ot0N13IJi6OWzo3t7dyPw61Hdl4jyo6X7IWeL7kVnGop5fCq
 waQ73caFoqB7hGQcTwjlq9BAgXzyMP6ymsbJ4EawiAM9YWYRrjalk3K7VB/Jdd6dq3IZ
 FdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=tEVO/WyDFrdLASJFtTcIWCu9cb4aCCAOkf5WUv+9akSSu9Vh4JLPz9eyt/yvKhBJjA
 rct3g+OlugTkN/J6iGCxTndj9TuO1nuT85mUvngfSRzXiZlhQ4RedUK9dWc044EgRv2h
 f0EMlUPgfjFB6Oj/VZdmHJGe+tWTGnSBYU7neTmlAbITX9E5trU3PDvpnnjh3ZnU8yqp
 I2pXTW2skHEkYtT1qy4fJD2H+yI94m+/ntRAWK9G0zWKmHkjwsmtgju7RlVKQPQJqPh6
 PzdnHlcWTx0g/N2c70YGM0aqB1V+NE9jsatnJvfI2xuw+lvJ9GneiJ+RXxYnBnjgUO0T
 Pyqw==
X-Gm-Message-State: AJIora+MzkznrJmX0ZuMi2oo6cU1wlHMiDHos53dF+9TUpfaDbqxLFg/
 mdioORhQUHsWnaWpRcPxSM1yhfAZ2NvaJw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:408f:b0:1d1:d1ba:2abb with SMTP
 id l15-20020a17090a408f00b001d1d1ba2abbmr17792151pjg.152.1657823287351; Thu,
 14 Jul 2022 11:28:07 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:44 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 5/8] blockdev: Add a new IF type IF_OTHER
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3N2DQYggKClYKI5yCHG54CC492.0CAE2AI-12J29BCB4BI.CF4@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 2qDWiSgG9muz

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

