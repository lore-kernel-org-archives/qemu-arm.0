Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373761lfg;
        Sat, 1 May 2021 15:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZyjkDyLW1e+CONM2Lk8S4+VEwdLbYN840Zbj2/6+RhLydlmZnMEgr8d4RZOpZf8UJznU0
X-Received: by 2002:a05:6402:453:: with SMTP id p19mr12983712edw.88.1619908629300;
        Sat, 01 May 2021 15:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908629; cv=none;
        d=google.com; s=arc-20160816;
        b=D5wI/xX6mclN4N7DF2jm5VVLdzchvEso8OZ2rW+VoltfCwGBan7/CuQFnr2N+5fWtP
         F/28frON1fJ/ZyY8xNRUR6c40zC/jWtam3fOwqenAqfjmzLAps+eMzJZ94aDJ12ectRK
         +caCPtXZ8+gSlMwBHfBQhBn7Kpku/za2B5QbfIvZhYJI0VB/rkMIRTffp/ymhBVYPwsR
         Qh9mh3tD58vb3Ei3Yw3he0WF2Zsh/lPyoxpqS9FK8B7BoUOGk41GNKkI/8euJ+YsXIgr
         gw1jepzc+FKPqES2WMmz3LIdJGriHq6rmZE96LxXq3BqwqyAK+QRLQBRadxZhG5N7oAZ
         L97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=Nwey61TpHZ5PmUT9pLT9SPFfVnK9RNAnYLKbWfVbn2ULnCAmTXMIvEH38fYB9IGp5i
         871iPEivGb2sMTvH0MkV5PLYCMydog0fFUr8cREmSi+S4mTdFfoboVb+qTXLVnJjpddF
         Yj2V3C3z12e8vNmFZ8ampPZfWP5lT6Ruhf1lZxjIKytNS6HHvM8SFPL+qOnHsKt2OlH6
         K7BofwPDhv4l3KIrZim2RJNG2lODWYjcRJp5ZQGoj1DulOOW3l46Ia4qCG7foLwOT4U1
         DiVzA6SShFnAsXeDU16jvsr32dF6MotJMDIN3JqZ42psXt3RnvKqNphzBRc6B2bB48ZE
         LDZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eHIAeIWb;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j11si5494997edw.435.2021.05.01.15.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eHIAeIWb;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
	b=eHIAeIWbqj0astnoA60gFDaDFnuwXOxrXGW0Emt5WWW8q4y3qxbl+5FBptTy/RdRDnNL4b
	fR96/w0OLIdQ8hA4JRiDN8P4//6i+HAxBAfW0Sqq/dGHyMTjSsHTRP+uUR6sTiMo0Sfv5y
	oUSxxcEJ5sK/QRsuSv0RpORFgmmvW1Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-NYfz4vZ5MXC2bAdiJxP2mA-1; Sat, 01 May 2021 18:37:06 -0400
X-MC-Unique: NYfz4vZ5MXC2bAdiJxP2mA-1
Received: by mail-wr1-f69.google.com with SMTP id 4-20020adf80040000b029010cab735fdeso1283922wrk.14
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=CXJ0J/o6crlRxag6THmxYZz9uYgyVs3OXSSDHauATiVBTCzgQirSc1n9gdoN+HOW3X
         bmqqWZtRTbyWKPYFItf1lRNGl6Xh69SMrKUHpGwiUd+r5TNoaS3kQ7Z0hh9LZEFkJ6UL
         Sk1K46Bf88FFYqGzGyWg/B0hVtJ8a1iaD0OrESTFys1FY13oobu9idTDzbJ11SwHx1bd
         ttf31FEO4PTznREUXoxta4C5v5KJjivTUxxV4gABN91D1AAD51uGZyjuoAF6gHRa7hUZ
         +7BE38yiSQ1U6SpDKsXdeZXpieKY5sa+d0vktjyVdfcwQqQZrWVqFxIPzXpk6lxhzGx5
         MJWw==
X-Gm-Message-State: AOAM530zrh2Am4BYZybvl+36m77qBi5MdDOjCbheIAxn604EeDYnQ4CT
	iyuS83iGBV6VlrHodvaekDkQpxFm0SkoEHwYSL7GISDpA3qah6Xrja/jYxhwt8W/gVKsl+xwDV3
	KKLEGjRhHjY3kum0c
X-Received: by 2002:a05:600c:1907:: with SMTP id j7mr13076077wmq.158.1619908625560;
        Sat, 01 May 2021 15:37:05 -0700 (PDT)
X-Received: by 2002:a05:600c:1907:: with SMTP id j7mr13076065wmq.158.1619908625457;
        Sat, 01 May 2021 15:37:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id d5sm7408486wrv.43.2021.05.01.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:05 -0700 (PDT)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 05/10] qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
Date: Sun,  2 May 2021 00:36:33 +0200
Message-Id: <20210501223638.510712-6-philmd@redhat.com>
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
X-TUID: CuCTTHLH1t7h

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
