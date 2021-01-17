Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1967236lfq;
        Sun, 17 Jan 2021 11:27:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLA1P26Nz2ZPb7VFpp9P9kv4ihQlLUhEmNEIsIPbqYQW2sLCgIaFgn6yGsLVGIigTKk8TK
X-Received: by 2002:a25:b444:: with SMTP id c4mr30122846ybg.481.1610911654450;
        Sun, 17 Jan 2021 11:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610911654; cv=none;
        d=google.com; s=arc-20160816;
        b=b/7oTjFCZY7ag1tQDBfwxhCMEvyt8/RsEYqWHU69D5o43Zp80eyBWkaCrw95koAwfq
         EVRoDNlNaaGnYymYZpGmRWWefZHfFNiXT/yWqVM5x+Y+PhJlUxQlMl0ERYwNpXSsQdDT
         ttzaLU9GfZl7qzFujeFYN8kUFV7RX1MjQ9auLomeUXDjiE7EobsPFEad0pVMMFCIjDix
         znY02j78CMKFKIkPrTxh/QjrTiPdq0InGLaCDfxaRI5Cdecqnv6mhH4w/FMwvkbXNTJx
         BPo6ZjoHuRmpyose6uXWWkxT20yxmYzsueVQJRYev9IomL50eqBMTW6/Xpm22VZ4ifi7
         UCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rOquWOYfnZ1HWefCZ4bvuH3r0gldDGI6o719tcrABHg=;
        b=bxrLhuUOoUCYC2U7xmQiruiZbckvp2+v+8qsodWiRWEpeDwnasv23MyGxFORCIcM+c
         50Y7KsQUFxX/1AsXudl3/Mvs0MvcDOXunoWZWVxnAP446zhLdE1f8ajzLh6BAFpNe6oD
         nJ4jogQWR3E/1z4PKLD0BI3CuA52Y8wycswX/7rclKsiBgCh/qtVM/qTY5N9aYUNiokq
         5eAZekBFn9lU1ySGdpFDQ1OwaJ2eNfgaen7R3FGV5ozzfh+yjquthkP85eXnMDhNxnnA
         +8e/wS686f5JFTQzpkEEXymqdoTgy/9oXGZ4meiMahejKo8UHpelaXq8TDG6GHK0ThaM
         yPiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYnYeiQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si11809198ybj.494.2021.01.17.11.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYnYeiQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Di1-0008C1-Rx
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfc-0007cl-Tu; Sun, 17 Jan 2021 14:25:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfb-00050E-4t; Sun, 17 Jan 2021 14:25:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e15so5645117wme.0;
 Sun, 17 Jan 2021 11:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOquWOYfnZ1HWefCZ4bvuH3r0gldDGI6o719tcrABHg=;
 b=EYnYeiQhZt4kdpurJRBjpjb/bcj/11MzVB6hWoOub2Sp7mN8xZudoHD1j7ZrWLtX8b
 RoZq9fdOkXGhavJbK4w2KZ1U4vmkeqpQcgbobilX16Ho2RzHV78cR5aDm4KihvLCNsGB
 40Aq534HHEQK0hjW321NaI4/R0zR4TpTnpi7EZHcuTkRJvpZedDO0yHfqOYe5Kgpzis1
 /8fU/glBDGWlwlF7gpsh+z2eman6W7+dn4l9ycIV1mNS78snMvDt7T61OWT7NTKyd+1I
 nwYp5hA29Iti93NhAi6Hd8T6fDmYU0KpiX0fI3r9UK909pE+LSLosLz/E7e380/rSPxd
 1NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rOquWOYfnZ1HWefCZ4bvuH3r0gldDGI6o719tcrABHg=;
 b=KC5qs/UbJ7mIjkEhn3JrQCNaEmkv15qqT0SLfVbtbpJ8JjK/SpLXlKFlLqo5tEo+Rn
 TP5xb4elHHz1dQYeyhO1vJffzy1ob73Y3Cbi9vldOfhgad7nwrpCTgAN7UCMj1AzBNlp
 aFjJpDzMDgggT0xjFbynrsQpFhX16ncJoF4QQZYLVkdVIRoMXdMoEQHvzqkHv1I2ir3k
 b7734xV+8clmAVtxege5SxikdYrZWIFBBbxS7HtOWuK1XCxWccb5k2TtyDKlRViOJZ7O
 SBDvhhJRtMJfSdjglM/h7vEUZDhsj2aOIvoOq/Fwr/foi2dgLexPyVoG8okf63v69CMr
 4OFg==
X-Gm-Message-State: AOAM531eI84xDbpTc8R0rTY1p4kWapkjWeYrgznHErE3YynfnzlLXUoh
 1+JKyDuo8FcdEQ1BMUfwiKM=
X-Received: by 2002:a1c:99d1:: with SMTP id b200mr17629965wme.37.1610911501420; 
 Sun, 17 Jan 2021 11:25:01 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c7sm26812421wro.16.2021.01.17.11.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 02/20] hw/core/qdev: Add
 vmstate_qdev_no_state_to_migrate
Date: Sun, 17 Jan 2021 20:24:28 +0100
Message-Id: <20210117192446.23753-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AhWtvHzTGWUz

Add vmstate_qdev_no_state_to_migrate, which is simply a
pointer to vmstate_no_state_to_migrate. This way all
qdev devices (including "hw/qdev-core.h") don't have to
include "migration/vmstate.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Unresolved issues:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg721695.html
Peter:
> Does this definitely not put any data into the migration stream?
> We don't want to change what's on the wire for machines that
> use devices that start using this. (If it does by default, it
> would be easy to make the migration code special case the
> magic symbol to act like "no vmsd specified").

https://www.mail-archive.com/qemu-devel@nongnu.org/msg727634.html
Dave:
> I'd need to test it to be sure, but I think if we added a .needed
> to vmstate_no_state_to_migrate with a function that always returned
> false, then I think the stream would stay unchanged.
---
 include/hw/qdev-core.h      | 2 ++
 include/migration/vmstate.h | 1 +
 hw/core/qdev.c              | 3 +++
 migration/vmstate.c         | 7 +++++++
 stubs/vmstate.c             | 7 +++++++
 5 files changed, 20 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1..d2c7a46e6a2 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -140,6 +140,8 @@ struct DeviceClass {
     const char *bus_type;
 };
 
+extern const VMStateDescription *vmstate_qdev_no_state_to_migrate;
+
 typedef struct NamedGPIOList NamedGPIOList;
 
 struct NamedGPIOList {
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index dda65c9987d..50559598eac 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -197,6 +197,7 @@ struct VMStateDescription {
 #if defined(CONFIG_USER_ONLY)
 extern const VMStateDescription vmstate_user_mode_cpu_dummy;
 #endif
+extern const VMStateDescription vmstate_no_state_to_migrate;
 
 extern const VMStateInfo vmstate_info_bool;
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..f0d0afd438d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -44,6 +44,9 @@
 static bool qdev_hot_added = false;
 bool qdev_hot_removed = false;
 
+const VMStateDescription *vmstate_qdev_no_state_to_migrate =
+        &vmstate_no_state_to_migrate;
+
 const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
 {
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc5..2c373774dfa 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -20,6 +20,13 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 
+const VMStateDescription vmstate_no_state_to_migrate = {
+    .name = "empty-state",
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
                                    void *opaque, JSONWriter *vmdesc);
 static int vmstate_subsection_load(QEMUFile *f, const VMStateDescription *vmsd,
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index 8da777a1fb4..f561f9f39bd 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -5,6 +5,13 @@
 const VMStateDescription vmstate_user_mode_cpu_dummy = {};
 #endif
 
+const VMStateDescription vmstate_no_state_to_migrate = {
+    .name = "empty-state",
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
                                    const VMStateDescription *vmsd,
-- 
2.26.2

