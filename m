Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1646777qvb;
        Thu, 15 Apr 2021 05:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysxus1u8oBaa0Xs8HlayZRmXYUar93b5TvLg4B3r0W9E/e6FlKWqyvi5pJAE4rb3JPy89M
X-Received: by 2002:a1f:fcc5:: with SMTP id a188mr1652549vki.4.1618489751753;
        Thu, 15 Apr 2021 05:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489751; cv=none;
        d=google.com; s=arc-20160816;
        b=IgjsAGdEkuIg5mEaUI3FtsEntLI48uZEYzq3JQGYIXZdaqdq8OA5zBCzkbYbrBtfoC
         QA5jujblD5/sFYwZDaM9s8Jsnijh9kOSDtsOQSIWdr9IcNKh6CnznMZRT2rE4vSNP5bC
         zS5UrQ89Kmvy2hQZNo6u2fifZVCrUcCj+4K662MAYcmrCDOpT1APTlTSn03bZg6CAhp3
         E7CbCaQ46eeqJP3MPLnO/LPwL0+EqztlC8E1EMDRtBjRITw0P9PYMF1WnlFUnZRhRnBI
         aGIi419mMWKecd1RpwulLldnnWs/vUAuiolWpRIYLan1C8xRwY6aUdlmOQDneutdcjWE
         yuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
        b=ZIQyecB5sRK7pvUJ7oF9XDiObKWgumv5nAyRAuX2MV74Ga9fabAWwObOsM6iMSDc6Q
         8Y/SEAXPcKsRbj5MRpXgJ7we8uqICfkrEEM7NBrgu74VuXD1LwjWfKKdsywC61OVqClZ
         MDbhH1KYwcI1qCof48G6ZJFKeyqcWtTrzaDb7+Z2s4qLdoY7og22xPCbJq5oHNUiEwgC
         NzLLOX+1OQIlgtF1lDlGpiUY1MErjHukq38h3/uEEmJv3pKzA20WVwa90jH1kHXuIyfS
         J9Dknoj/H45Qe/pwV5ugwtTM1jux+fEjJ+G5tps32A9To0kTptPFk2dSS9/K/wzn+JpU
         a8mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NMH9F2Xz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si944034ual.62.2021.04.15.05.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NMH9F2Xz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX17P-0004RE-5i
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15C-0002x0-0O
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX159-00060P-NW
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=NMH9F2XzumnaE3zEHUYPvf3o5kkJ8g0XsbXA/4csCYVfnvFy2m1cKaJDEVYvsVtMRFVOQp
 1WjcqIM1BYC1VO0Bz2KgTaoL6d0ByXUi2rpUlER0acV5F9VykJ8GbIlrGa+BRAwhyfJ3yA
 BgtJHStPqplCxmSxDH396pg/iqISKmQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-jwDfUz4JOSaxPsQJoMm5GA-1; Thu, 15 Apr 2021 08:26:47 -0400
X-MC-Unique: jwDfUz4JOSaxPsQJoMm5GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a1c75030000b029010f4e02a2f2so2830895wmc.6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=W1PhiOuS7d8XyfXvV2CYWUD0BT4zlnkFPBjdpNjIrOnz4RttwhEjr9sChRN5MKbEGs
 JCGvcdvkK3L82cf8S9k/twoImv5lHX0REefoku6t65xVvSch7O7nmR/oad1bWoiQo5uq
 qvltKhlenCXIxVsdtcy2R7L88kcTTu8qaMEkIGsFEtoI8Fw3tAlJoxjoAneNHsmrikLR
 cgyr3aoVB/bkCE8/jbrbpKtX6wLWB7wa+d8Hga8DxQBfvuoajXs9g779Yl7OCByuq4AR
 2OOw6VuyxIloqM9a/DgbmAUSRAkqlYat0VibBTDY3JeHUAQse+vYVs7g+GjClaBK0JM8
 alog==
X-Gm-Message-State: AOAM530czV/vD0o7PNVgy+ANw2wdfbRNoqmRyYLDUpUz+WM9FYN+GhuO
 hsIuN8/urJbiqdu8D3wDuDbsInlCUnPoGKEdbCy+KUF1t3GWukg9DvHAFM9HaeF0ythcdQXgt9g
 B4re7E6ThP5MlC5icISQ/3hHIIL/hF5q4OrzQfMFmaIw8RrVc2YB+nreXSOTbWeu2
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr2619761wrd.159.1618489606443; 
 Thu, 15 Apr 2021 05:26:46 -0700 (PDT)
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr2619727wrd.159.1618489606241; 
 Thu, 15 Apr 2021 05:26:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x17sm1399684wmi.46.2021.04.15.05.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] tests/qtest: Add qtest_has_accel() method
Date: Thu, 15 Apr 2021 14:26:29 +0200
Message-Id: <20210415122633.4054644-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MM5cFCQneMbL

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v2:
- reworded (Eric)
Since v1:
- rename qtest_probe_accel() -> qtest_has_accel()
- run with -machine none before creating QTestState
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d44..d80c618c18d 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 71e359efcd3..2156b7e3972 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     return qts;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+    QTestState *qts;
+
+    qts = qtest_initf("-accel qtest -machine none");
+    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *name = qdict_get_str(accel_dict, "name");
+
+        if (g_str_equal(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    qtest_quit(qts);
+
+    return has_accel;
+}
+
+
 void qtest_quit(QTestState *s)
 {
     qtest_remove_abrt_handler(s);
-- 
2.26.3

