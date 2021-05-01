Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373689lfg;
        Sat, 1 May 2021 15:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9fcPxBiTZ9bajgxYnifbeqKINtH3h2nJx1XFgr0rjx9mTLcZHEH6lQRDBVfsJwknz/Pj1
X-Received: by 2002:a17:907:2bd7:: with SMTP id gv23mr10390741ejc.321.1619908621291;
        Sat, 01 May 2021 15:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908621; cv=none;
        d=google.com; s=arc-20160816;
        b=zNr40l66J2QcAIZUhpLXzX8ldNK197hni13inFsxCyuvSLrpiJFjR34f07bmLTsNgy
         YtMkqQnALTR1BAhRAFH3ev8/Tbc+HtNjsck7GDeJf0lUTY/pCerecZZYg71QCiiZa4ZD
         UAPTS+Hz0cm3YrkZfj+P0ZctRdQJoBmdof/W/RNxGv1m34dGD2nGLYHJpizns/awvHu6
         IkMqXu4Np6khm4cjzytKDLAyunoGa4OzJWpsgjFgkaNFz5vS+lqdg08BkLXHtTSuh5z5
         OtRekY12+7jpODSZk+WoA7eH3kY7dcCNIfJ3m4R4IOxsz/nyeKMzhPe91OFVJFh/269s
         JvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
        b=yzcXunhu3I8EKYmpW0vlEt+EBkcdwJ++1xo4V+fbn+CI24budYzClmWbbUA3nEEzUE
         iZHjGduL16L+gBJ+BACWf9M1t75EySBfd44QLTusIrp3ZHYFhkXl25cdz8zkQy7CdmRO
         41Ykyjvp1XKP3++Thz7vcV+uL4EiG1n80d0tWFIwUruGNbV0/Nh2VNP9jWLBYgTbrBjW
         y9Mv8RB+Vde5SCxd3sOc5uIFfR6TUDil/LHdiTJgiGT1WqWN0vFp/WS71idHpuMqsCIj
         2Wu5i1ZbTEnidaPmc0RG2pZtg2FW7Picck4+v0tLAg4CKPB+UsoU0Uiy2N5g2Kd9HjTq
         IjAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y9aW4cdZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o6si6679735edi.480.2021.05.01.15.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y9aW4cdZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
	b=Y9aW4cdZbDCJQmCNxx2SFwXlTwjAL9ykDOxZ1rxKlchKBvAECKBpY0F32P9l4gj5pVYrey
	ALYEL9LlDYw/bY972OrNRGJQjVWcSc5tvIzXhGLoH2qQjE1PiiqA2zFRIx6+3zw6dkpsq6
	BxEmXLW+atY8ATbhln9nzfk4q4qZUFM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-INo6R0OOPaauH66f2hd_Sw-1; Sat, 01 May 2021 18:36:56 -0400
X-MC-Unique: INo6R0OOPaauH66f2hd_Sw-1
Received: by mail-wr1-f69.google.com with SMTP id t5-20020adfb7c50000b029010dd0bb24cfso654718wre.2
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
        b=jvLv3tWZvtuiKN1GFBvQSYsG+giAOI6LXMApc85nf1MiJsAhekmi20gb6T2ga1vofD
         j0Uq7+dlXIBg2kJxLzhIxsewce208PdmVQT95AOTR1NyUbToS8bmun0ysL8DphuEC7fZ
         fIVe/fFpVF6Ju1Ofr2YwAeK1JmdIJ/mHY9jD+V/+rlrQQFoIegq0ozm0LZCuFt7b2str
         r2v8RXxZIS23JGl6E3Zs334OBBd66qXHZ5aXnc3MVl4bCTDBbKKa/q/dIYI/BF6PUK0G
         ggfE0vbP4+N7AoirLPYYlNkX72tUs2quS3jxNeiQ1Bjbh4VVt7be/vxkat2q9MvnE61d
         xNOA==
X-Gm-Message-State: AOAM531jx1i6Ykeuix1bTcAc/UM7ov8Z4Y/vWF7NdHQU/Hu3tSxVp2AV
	hVfviMXmypzmaHMVYABOSm+SVQqOV9PN4xCN/4lO1Jd1h1v9jS4wqm7eWZdqseO/Thb3bMIEz/E
	ZubE4ojYg4L37/S3P
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3860673wrr.111.1619908615702;
        Sat, 01 May 2021 15:36:55 -0700 (PDT)
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3860658wrr.111.1619908615597;
        Sat, 01 May 2021 15:36:55 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id s16sm16600778wmh.11.2021.05.01.15.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:36:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 03/10] tests/qtest: Add qtest_has_accel() method
Date: Sun,  2 May 2021 00:36:31 +0200
Message-Id: <20210501223638.510712-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FMKhd/Pqjl/b

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
