Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615873lfm;
        Wed, 26 May 2021 10:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3O/dqK3pj8hRR1ZL1ZQWkV4s0N1nj2VxlGijmzr5YR0XpNt0p/xUQ+Eu+ngPiWWsCyiKA
X-Received: by 2002:a7b:c10a:: with SMTP id w10mr4489760wmi.21.1622048735393;
        Wed, 26 May 2021 10:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048735; cv=none;
        d=google.com; s=arc-20160816;
        b=remFh5vkDc2UWV2LN8Y5CyuMNmeD9P3MiMZo/FvqFO7qMD9e43ykZHiQUi3Q8+JwNL
         ulTD2skQqKsOGXfWrxIi1ydsvaAD9zEyhuzMdqJMzXB4r30K2sH3HPTgH+Wg8/sB9FSu
         FNe4Hm1lqvwNP3mZbB2C9lJuOEbFxenWt5gYUwBNNIaj/XfFpMj0X2TmGBTcgsGv+2wr
         BUDDJxmW63WIEgt0OsfzstqaWdnXsZ61nyrlLuUwALJrGtjuMgdLmjvWNPEGe4DO7IX5
         aah5eGcHpAgb5603Vi9v60jLpsVHvBk0uoh7wuBkUim+wczmMYzwsJnOkQoKpzuedXlu
         OO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=wstmOpIoaRN1U3z+LE1gcXtjVUfgaSE6PukRLIlGefkrYSrnDF6blUjak7m6q0e0aq
         9xdmk7QLnqtLwtq0PtfHBNXIZpAweK7tfoiCzsFdu76PLqZDAs/7LE8j3Cd5VdI7PDR9
         kfelXRwCaA2Zr+Pk5+UltgbHIc4rpVWfLZuKnlzFgD7OywzivPVVEsNG4EqfQiV4YFAf
         HZtEre1KTCfjVmqZQ3hrG/zp4RRp+ceKSWXHPfErLdf4I89TRGa0ovTErtiGw8RY17zq
         j+pMIeNDGv0o5YKk7OKgZ6djiXD+NjJJZ05YkKXIHLSfzBP1DaRakhfZcBsNszh21pR/
         u53w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YCrpZemD;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id pv26si18202473ejb.97.2021.05.26.10.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YCrpZemD;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
	b=YCrpZemDHrrSmk6gXPy+MlHlSUJcJ+iRlcZAF397X87R0cpDpFWWZJ5iU4LYf6aEtul+d8
	jcv+8rZMcJJ3KvRG2vbQwNJGhAzWbLcKvgOrs6dAqD1ssBsI/ExcFWcOu5C3mOid3DJELY
	c5972siJLzl2PUcxkDaC2LMZ0TvmRKo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-aTkzE-LGO0qOsI0uk9w-Yg-1; Wed, 26 May 2021 13:05:30 -0400
X-MC-Unique: aTkzE-LGO0qOsI0uk9w-Yg-1
Received: by mail-wm1-f69.google.com with SMTP id l18-20020a05600c4f12b02901921c0f2098so763467wmq.0
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=jXS/TGVXh8bf9IQ2kiXusIQ8bOr5e7ms0iwvrWwQPA9I7UOGhSGnGAYngXvHMzhN+j
         7vzlzwZGYbJtsF2mMXseFhZsijVcSG3IFR5JDtBdn56Quhu8ipUvYeSIyxDFemqzWHbV
         u7Z0cdoqf38q3hbXSqUzJrlQKm8u6mFzZuZZ0UFglEjIk9sIgn6YGa973cI0mp2kiKKx
         wRRxghUUViYO8IpjZPC3QyJ4s1blYqaEv9eSQgvZ+i/OgiN8qONtP/5Ob3obfGBFOsFJ
         I7cRV9tTEiDfKxu/z30ZRa1eFhMEQaK4BfSRiTt4BC7UATYGAbRUuJ6y5JpV6g1GntBR
         Yf1A==
X-Gm-Message-State: AOAM5328IrXxmyK6uif4xImSV5oVrxeJ8peTH8BdDELy6t5aFOP7jlKE
	yap9U9ytO7mX23GBH+4t1/t+SAYmeeY0CWNpvz11vOzCvumPfa0Vp5/QIALk8XjTVbmEPYTS8cM
	Rxx6NnbqLC3TC9LT4
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr33128018wrz.79.1622048729785;
        Wed, 26 May 2021 10:05:29 -0700 (PDT)
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr33127995wrz.79.1622048729660;
        Wed, 26 May 2021 10:05:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id t14sm6719869wmq.16.2021.05.26.10.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 05/12] qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
Date: Wed, 26 May 2021 19:04:25 +0200
Message-Id: <20210526170432.343588-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lXjzqfAL6S3k

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 7f4b2521277..66300c3bc20 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -604,6 +604,8 @@ int main(int argc, char **argv)
     if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
@@ -611,8 +613,6 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
     return g_test_run();
-- 
2.26.3
