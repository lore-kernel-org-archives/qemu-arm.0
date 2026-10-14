Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6ECC6B1F
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:36:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvOU-00060a-RT; Wed, 14 Oct 2026 05:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvNe-0005R1-1l
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:34:39 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvNc-0000ft-HE
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:34:37 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-170135e43c7so1206632c88.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970475; x=1792575275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IAa9EYHeaBZV1We1wS0Pw4Gbkg3A4EQ75sck0EgY0ZI=;
 b=LbmZWUAIbHt3z2zBA75HKVQQGMDF8haaEm9QDZZV0AHaLV19EZYJPWPpBJyurG5+O2
 naD2JSuweR9TaVypEddIlF45hTifdeTRP8tD8qzRiRHornQt/Wk0INl3ZkxUxmKQLNEM
 YLuqGIR4VR7s+EfbEJwxz8SO6Z0KIVA5jiaSkllcsQ76GzY14DHu3vnu6/WmIEbm6WsN
 BDXrJuDovWFr4Aq6tk0j2om/pXBjEDXXilvd+wMkJpjIIAh4PDOArYBvFWT9CIej8MgD
 2nDQJ+IxB1pRSrj5dWIoaTGXuqFfDW7vD8A/TeEH2D1I5BsJcBEL7GPmXhKRx0/V26CI
 8qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970475; x=1792575275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IAa9EYHeaBZV1We1wS0Pw4Gbkg3A4EQ75sck0EgY0ZI=;
 b=iBI6g6KloyW8zFwNS2wPQu0WuQKIAEx+Vp8HJ3onWpO4Z1ik5beg3Z7VWN1BvQr7gk
 3IT6yw3JuezgtN+WpwW3Wg4LADrG/40+326p8Gb9cBT8a1ZhTdpJ/f1x+taPXPdiaEcj
 SaSzwZOyWVJlC40EB1epqHG82HWDspF0QqMVr1l3jVdmU8rEvcmurEgS1raPHFfZ/3fg
 h+xn145ZtCA5DDTGxCRKlXm1FsecNlBt+mfgSdr17wDJR7Dg44wZ3/lllxSe780Qhsbb
 aOmn6JHWuLyc02xpfN+/kpCNqiFVSVR+P636UtmFZQ3LWuc1m3pbjj90hNXNCe1tZdom
 EocQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiMxiv0749Ri4ZOTaciEA1L0LgqT0jaCV2J/wA1Ik8O2gkauU/HOkaJBN3vU0oR6CigxIr3lmzhA==@nongnu.org
X-Gm-Message-State: AFq9FYJXcoJ6tOfAn4x2R2ldTtrMkjsV5buH8gp3DlvDROtemtZhnAKb
 jrt65oMbMCln8TjxHEng0zZAT3nr2ccENF8o7jh5yDUH8V9oD9E83i/5
X-Gm-Gg: AYBFou2av9jZK0bwjAYFu6cnnCfegoeNtS9Xwtfi3Wo3unytsqX5ITlWNu7IEi8ed97
 FiZtOslGhyUtIMxcqCWnDo1upFEHSbnOHoNM4ajDcwHt0aluQjWeSJQmEi2IqUPoUNq00Wc/tEN
 7lE9AFI76IFbOI6yY21jMLoIE42TuXoVug9nSJhZ7pH2GIEp9/r+sL6leQD1Mlt5F7alqapb9fI
 inD+QeTzDlCUbaF2E5pXKCYnnmF6ppX7lbG/wpfTj62qRe3iIiX/WDgMrJzmlmmyTON1C36vy3i
 GrJnd6D2PN6nprjzKqzJLIj6GnecRWkyIwvUAWpvftDZxbdoHWXVnxCQFYlKec/8q/rxLQmtXrA
 LT9NO/7Wqysc/PvopYSWSqEEdUI8bX69GYgN21Fbkqja+4c6BUyVwL1vP2Id2DiUFvftaR01i6m
 6+rjCGWVQswb+bF0E9xN8YQmmY9tyMCV3ypAcyE/CmaAhhNB9XTbPkACxKsIhTfOEbTFEPyjgtE
 ojoDpu57IZXorkHrA==
X-Received: by 2002:a05:701b:2713:b0:168:6ad8:e8b0 with SMTP id
 a92af1059eb24-16a6187f095mr23324103c88.14.1791970474962; 
 Wed, 14 Oct 2026 02:34:34 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:34:33 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 15/34] hw/scsi: Avoid guard loadparm with target_s390x() for
 s390x in class_init
Date: Wed, 14 Oct 2026 17:31:25 +0800
Message-ID: <20261014093152.834-16-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is for avoid call target_info() in class_init.
Now we directly guard in scsi_property_set_loadparm instead.
Don't know if its an API break, but the smallest change.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/scsi/scsi-disk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index deb33ac1dda..276941ae537 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -3179,6 +3179,11 @@ static void scsi_property_set_loadparm(Object *obj, const char *value,
 {
     void *lp_str;
 
+    if (!target_s390x()) {
+        error_setg(errp, "'loadparm' is only supported on s390x");
+        return;
+    }
+
     if (object_property_get_int(obj, "bootindex", NULL) < 0) {
         error_setg(errp, "'loadparm' is only valid for boot devices");
         return;
@@ -3196,14 +3201,11 @@ static void scsi_property_add_specifics(DeviceClass *dc)
 {
     ObjectClass *oc = OBJECT_CLASS(dc);
 
-    /* The loadparm property is only supported on s390x */
-    if (target_s390x()) {
-        object_class_property_add_str(oc, "loadparm",
-                                      scsi_property_get_loadparm,
-                                      scsi_property_set_loadparm);
-        object_class_property_set_description(oc, "loadparm",
-                                              "load parameter (s390x only)");
-    }
+    object_class_property_add_str(oc, "loadparm",
+                                  scsi_property_get_loadparm,
+                                  scsi_property_set_loadparm);
+    object_class_property_set_description(oc, "loadparm",
+                                          "load parameter (s390x only)");
 }
 
 static void scsi_disk_base_class_initfn(ObjectClass *klass, const void *data)
-- 
2.55.0.windows.3


