Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp782643lfp;
        Thu, 14 Jul 2022 11:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7jslOSLt230lvrY7C1Eld8zmbA8Xu7kzcUcN1mfynni3EL+N/L+XM/5ytqD9qIma/o5bC
X-Received: by 2002:a05:622a:1e0e:b0:31e:c9f9:fe1e with SMTP id br14-20020a05622a1e0e00b0031ec9f9fe1emr8772080qtb.369.1657821897728;
        Thu, 14 Jul 2022 11:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657821897; cv=none;
        d=google.com; s=arc-20160816;
        b=aoRzgJ6n87UPHmIBaFuQCY0FDtBQSrgZxOIoaKeDVIHaOmenFid2gs3x4f0v7z8UWq
         kFdjPAyI6GSrE7fX62Y5XN1383l6u6VLfccUx6x8P2AQAbRY3M7oIymDLNXdQZ7xxB7t
         kLsVULqrbEIPylBFO+dsmcLL62Kg2wNowq4ahHME8sLITybfYV+2kG7GmUu9UHGz9d9y
         wsLggWmw/uOe6w618yEkqg1H597YbKLaWp/uH9jgconpdcLZOAUU3ZucQD7j+em84CbZ
         KXx68LmFARdOyCmt4TN9a6ww8T3t3zWNfUR1ubGwgmvV3gCKdMNDPwPJJi1JRzL+mzPn
         rBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
        b=YH2cjEgDMIYx14/0TsGxIKUqFVuq6rE1h+ZhC5kOycQoxjmTbyImKcgZRRqZBFb4oq
         chj7UJPpH45hIoMmjLV8V1MNrjF3PONwgk5QkCjewT99dUZ0UQ5QUS2iwTx8zTRcEsYB
         0hBCPD08DJbPzTQN1krbPoc62kOhtZgldMQa9BV31ioma5G3mt6yyQfLtz0ByN2jC+QF
         XoTLSH9VqrzAZfr9Nzwnx8F9Q+xXrE8t4pIpMm//KP/0WCgCW2JCjCcd4Wm/3AfP4liA
         7DZGWdjm3zTAPCBlrm3HvfypTlRLyDPpcnlnq0L8m6/AZY4Hrn3oYdqzhC9pmtatyek6
         fHnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=G7IYwQ5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc13-20020a056214230d00b00470aaf26e3esi1257458qvb.586.2022.07.14.11.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 11:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=G7IYwQ5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC3Cr-0002xI-6O
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 14:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1oC38u-0007UF-RD
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1oC38r-0005iz-K3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:00:52 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 a127-20020a624d85000000b00525950b1feeso1509461pfb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=G7IYwQ5h1bHSdQ3N/q8pFT24ntNQ5vvXIm8atu3VilaUa26UORR7UxTJOmJEglp7A7
 6G1KcQ1bBoEZxO+Qjc8RVxYb1UY1ABt8RnVNbJW8clf/88gUOH1japMiNdsnZsrybX96
 d4JV4me52Klxm9iz0hKhwosK9xudupOJNE0V89fvvUvRmaszOPUhlG5y16qzhZERXThG
 DqDzM7gldaDksPHx1GqLhnnb62NTljnlzvIue87+UPARA730QsPmSP8Hdrldp9P8PjmD
 kUQJI3VYgDlV0rb11APm6Z94qwYbOjMwTAqAzpGpADoQIq44O8JbJklhereGmi3qcdNl
 WXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=W5HdIYZvabDXn88OiY+HL0ZIRBJ+FpGhhsFX/xssn/M=;
 b=Gec0WcntFL4UIu8fG5cMxcOkOS0qJ4o5AJ3wXc61bbqdqdYqWBMdiz4E1LIrORxga4
 ULCv5mV23LfZPKxvgYAFA0SATxR17UfLW8WFXxeO1paYgCLisDHFSQMFGFvC3j/A2/JE
 OF9VohuhP8IxhDdRfMt8ktDlujUZSm/hk+xcsIBK9+JPZko2KGge9cyYy8vZqVefgYpv
 LcPx40g/RV4/cd9hOuJeYEIma9GHPSwNyS6HnOTwzGKuTJtDYyhfEZ5xv/DxqXy1EV72
 MzDvJ0QHWztTShL0IPSU71DF5gvuUPrbCjP3ZdMBSNlSSdEL9kJNmxOaUFfRLHL0Uldf
 peSA==
X-Gm-Message-State: AJIora+KqfpOC1pq5SKyGT+MoLx4sNGkbc0qBYh4Ww3CZfpQDCfcjA/6
 x69EVq+o0MZ/JCYNQ56aJtQgsWfstNNU1A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:3346:0:b0:52a:c0cb:ae8 with SMTP id
 z67-20020a623346000000b0052ac0cb0ae8mr9452245pfz.37.1657821632780; Thu, 14
 Jul 2022 11:00:32 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:00:03 -0700
In-Reply-To: <20220714180006.77360-1-wuhaotsh@google.com>
Message-Id: <20220714180006.77360-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714180006.77360-1-wuhaotsh@google.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3wFnQYggKCtEJH4xBGF43BB381.zB9D19H-01I18ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
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
X-TUID: 36G2njZRK5Tm

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

