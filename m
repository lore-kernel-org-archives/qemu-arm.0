Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006784lfg;
        Mon, 3 May 2021 14:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDkFowjsfY/3ottdI1+3U4rVjlQ9G4YTuDqNkqwdzw81ZOfRBH/5VWTK//WszhO7ktyEQI
X-Received: by 2002:a50:cd57:: with SMTP id d23mr6255822edj.5.1620076252135;
        Mon, 03 May 2021 14:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076252; cv=none;
        d=google.com; s=arc-20160816;
        b=hFrHP+NDq0e5YBzUKbJvW+qombnokCBSoKmuW2aN2WrYKZ9zS3QsruCIafiTJ4xClf
         08pZztobnHTLppthQPMTIdWX8H7b49c3DSmu07WoEwod5OPIYwzyadVP/pVz9EwgcR1k
         KPb3wfOxWhqQZxFM6SIEOoQUCjtAFnqpssuKh2NFXwYirDqnfvh9lOFlMEop1CO4n4OT
         pkkalSEl+SvHZ/KhHJ+R1r4XWM/4P0vms9wxJdbihvbbJhn9GXjLZIMzhVOHm2z32PYV
         i/3HvTIn7dIWR18AJkvIxfyQBGiYDJIGTHWp/VGqqd1aNl7R0PkSKpd7EjKKICy0mSTF
         Q1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=uLP6Ie/enKBLyRvDkCVwDtMkKw/JA5DR3BskIq0Fpo3sFQr+w8RyokGH/emv1NuVUV
         /4W9PysL9mwSSu3tPSzol1Nlw63WVYol+mBF1UDGZyFHKTO1jsPYyUHpsHA2zYNi9z7d
         ys+My3vCfETd9PCymi26OYGKqPKZb0L4GQkzaGXpDiCfI4xk4iIWQOLRaYRVjYIfo75o
         ngVfiDgdlL9M+ap4G4Fjqgb7jiUaEK0gpbBcuUTe/SmLqo4HUjCi8hyH9WIWwq3RPBkB
         EzV8P/j4mn33KieqcnUPaxvj9L2EpSNb2w3x4tdAQ65NUok0lnXigEDgDyD8JZgbfQ1T
         Hsxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FA0HY/uF";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n26si895478eje.251.2021.05.03.14.10.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FA0HY/uF";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
	b=FA0HY/uFn4nQJsYqCZRUtQq4TEMHXswUkQMh3XrvAM4zhYBtG3eo/m4kEezzyeEcgEuJYS
	603TGzb2hXs1r/WT06bXh3Zyp8l9143awc5UBHSjC1zZeNt8fG+8WSOj6zgChDFOzz8KJg
	F//uotQG8Wglq3+uSOdypnCq7nUkSz0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488--NYzQlepNEqU4UdO6IcD9g-1; Mon, 03 May 2021 17:10:49 -0400
X-MC-Unique: -NYzQlepNEqU4UdO6IcD9g-1
Received: by mail-wr1-f71.google.com with SMTP id 88-20020adf95610000b029010758d8d7e2so4605936wrs.19
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=sPbC0Tuy6h0uVFR1Qvw/DM0vfRaYu3uJv2mjo+PrnPAM9dGnDvYrbLgVyM33E870I7
         iJZAS9ge4rBzwTFrML9BiQAEe/HZCFruPHw9P3linlGOB5wKb7G6EvZKqEJgOwB+6sdR
         zYJLxn+Mn8iVNwL0XR4BE319ByqK5dX/akDOZt+ANhRvQTE8w4Icn5dgb6jGmHNr7On8
         b2JX/MGiv/SEWKk7F9UijFIZdwdY7PPHsB4yd8vAQMWokMXvkVYeH2A/VEx46FDe0siH
         Orwvgb9w/SabfSv9C7ACdijz0HuR0gQ7GW7LzA7qaApDdy2X6jWmVOq3ZorPnK0n3pOR
         0xCQ==
X-Gm-Message-State: AOAM531LPyV6sXaDWozbsC9PtjBcPqDSLJOewFLRkLQ5h0yoqulipydE
	s/KOdjmlQB5hvwm2BP7c4c7yGzmx7MLMKwvSXB/rBfBo2gf5UilOmUSV4Jrz+6o7kK+2c5RHxiW
	xkIWAX2NMEqzzZFeO
X-Received: by 2002:adf:da4f:: with SMTP id r15mr26790890wrl.411.1620076248722;
        Mon, 03 May 2021 14:10:48 -0700 (PDT)
X-Received: by 2002:adf:da4f:: with SMTP id r15mr26790882wrl.411.1620076248618;
        Mon, 03 May 2021 14:10:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id m11sm13666910wri.44.2021.05.03.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 05/12] qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
Date: Mon,  3 May 2021 23:10:13 +0200
Message-Id: <20210503211020.894589-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Kg3uI0is7g1F

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
