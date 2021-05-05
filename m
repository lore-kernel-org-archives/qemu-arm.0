Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp272347lfg;
        Wed, 5 May 2021 05:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCRrUoiHczAlO8y76BrmnRaD26QT4BO37paky/luSzReQudnmM3BtIui719cAcxh+nyXzX
X-Received: by 2002:a17:906:3e42:: with SMTP id t2mr26828977eji.508.1620219515996;
        Wed, 05 May 2021 05:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219515; cv=none;
        d=google.com; s=arc-20160816;
        b=tpaMu78f4nLwcXDlttcdSz5KVc/CeL/3e1hAlEqowVfemjyeiUzsobX8UmFcYierv+
         e5acr4wCYibGilEqD0XpH3Jn4apyh5JLbhgvfCjociNR9RLhCpzW7r2rqqZn8Kl/CVkE
         xJCewHjg1vrOAYAWmWL4jwJIyY8t5cVyFxIYOE1fWnX1YwLM5xRAUCPoilGzv/BWGqwa
         fw7eJ+g/f8w85R4dczkUtlLkaAzS74+Yr9cQ6Kq2LFyx6P5UbSN7xSjc0W+Ys2vy1tao
         S7/87gb7MMhnqh9XMhN+Ujs7X+2twLiBg5OMtXm3AtjgRHmJV2Z22Jy9N0w8q7rSsYZl
         Q5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=mpoxQVOB3i3/sb4d428r9PIMWhei2Y+liMjGdFrCT37tUrqZpvOI67E5WjbSov0GB+
         5KAC5cxmv9Jovt130Gaz5o3zYQC9jD1B0vbrlwkrupvQeyRSoL3FAaxo1IlOUYGLC/5f
         b5dYQGvqiAQ7cWexmFuQhNQ/94ixbNMHVsNf/ykPk8vwL1gTMRMlOTAMmg8QuVbFayHe
         R97Z7JWVqGr3MWIXDkwref0c1UXT0oUA5z6SIO/6DbgnnliwDyQLtncMw0oJgbzpPB8S
         2ldPTuF1z3Hb40ATx8+N5TdJLhR/Y9OVPBVyuJeRSeKNSdnZkMYP4n1Pf8mo+bItCRWq
         v4Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6UblkPR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e9si6384710ejq.308.2021.05.05.05.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i6UblkPR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620219515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
	b=i6UblkPR7VJgCSNDx7M+cb0zD9PhoceLfwEz9+j7MkG/yOWNeQy8PyVd1KifyScrsZItfb
	I3vALcm9oZ+QhTFY4qybr26uhe7rrhY5g0GnO1hhhQLQ3/RNQQ3pllCOXUOker46zlG8jK
	KDXiDiSli+UX8vqtatPHk/P3Ewhvmxs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-pA5apXrKPImWkiVYHVsmWQ-1; Wed, 05 May 2021 08:58:33 -0400
X-MC-Unique: pA5apXrKPImWkiVYHVsmWQ-1
Received: by mail-wr1-f70.google.com with SMTP id 88-20020adf95610000b029010758d8d7e2so652300wrs.19
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 05:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
        b=pqndNIJF2h5hauldL7EacVjacWvyyicATmkXZFwiaMevT4Gv3TZccfmG8wVTRw7rBB
         BISTYFZXDawku3Kl6a+Q/+TkjXkmDsOxm184CiqJ9UybM+195HuG3NkGjLtruOc/7Y/G
         AekxqchsgjZmHgaG1vSRfwEpL2pu8+Xuy3a7KmhvyB3xA1K0JdluVijkxHkxz1NrB09m
         UZJRBPBO2ndCiNgsOj6grd5KjLiRlw3g/bOwhSICnc6ebLW1WcwMEwMYWk3tJO1tQGzF
         Mgsq7Nagpp/yjtStMjJoC4j/Va+rM1cRMcCfRBUlylzpM9iJKtJL755ZTAzi4AeaJbUz
         nA6A==
X-Gm-Message-State: AOAM532CQAFl8WlSaZPAUVQgMQhmNc69Jl4UB23i0d4ewLfDzqhgdRKT
	aXDesTg4AAPCK90qaQqX6z+dXnOYMzyBdv65/y+QiTHIU+BqLaXhMnQkzKAfhGnlYvSqMKMAj4A
	t9+oP8Kj2rKYdNtCu
X-Received: by 2002:a5d:4412:: with SMTP id z18mr37885714wrq.103.1620219512549;
        Wed, 05 May 2021 05:58:32 -0700 (PDT)
X-Received: by 2002:a5d:4412:: with SMTP id z18mr37885692wrq.103.1620219512393;
        Wed, 05 May 2021 05:58:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id b6sm5296646wmj.2.2021.05.05.05.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:58:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v7 05/12] qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
Date: Wed,  5 May 2021 14:57:59 +0200
Message-Id: <20210505125806.1263441-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qG+4ZaDOXGfT

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
