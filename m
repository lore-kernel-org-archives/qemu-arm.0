Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4820024lfb;
        Tue, 31 Aug 2021 01:30:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2XG+i2CwOKPsMPCfYBl/BrilENuTPXE5eQqEpdydwDnMHqfK+XTypZjKgwTP0L8eB3G4a
X-Received: by 2002:a5d:851a:: with SMTP id q26mr12264546ion.163.1630398615761;
        Tue, 31 Aug 2021 01:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630398615; cv=none;
        d=google.com; s=arc-20160816;
        b=VsxfSQM+1e477sopd5Ht7JXEVTCFtH+qVukIw8dPYXKupeX5PPldQOG0YVhXS9O8VY
         3uuanQalOok7mPfkgM6HmQ3sSzpRfVQrRY89eX76KP518zlyM8pDrokoaRvjqtFrk/5N
         cyp+THT2RX/WW86IzTpgMgSCCHIH76TrQWFOa1/lawrKuIAvP4+5ExKefFI/93HMGOOk
         U05l2NAGe4GI9ro1Jt4raWyR3LG88eEzcv5wJXNIXhVoZmTmczbD4TOunZllXxDDiRAh
         rZTm0lkmecJg3qTXCOhSZgOeHRASqLioT3j6wCVSFdqofa9ePLnQ8bHKH5sgqwkSF3n/
         48RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=N/qQjY+2EjtN0MSOlMkA8DWPDyM1kH9dKRbxub2olSI=;
        b=iAObDnjVqW5vRSxLELJfij6vCGBlKjALzVnCPJhNVWnEKK4t5D/WyhWQXnVg0ig6ct
         6jIGRCwFdT5Pe/WxBQp5ndCMutM1btZU0WLoQPfQQ6URDdAUCyzxFjQlX2/G8y1LfJyT
         bAnkom/NETGVaeoJMPx7nmTZLgharwa2Wz+/nlv4bJdAF1koCTwz/mqTnMoYqsbGJ2aL
         OA+vpL/1Gmo0Ch3VsvDl9zYJjsI6pozioh5l2iLfWQ1oJ83E4mfp6EqF6EFeM9qjuJkX
         JBTNzCjYrasPp46+9MvpdyO9tdbybw0qFHMVLNJx3VmAnZBFNgCq8OvZeUc3k7DiqUBQ
         4rog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si18056325iob.28.2021.08.31.01.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 01:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKz9r-0005ry-1R
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 04:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9T-0005qb-Vk; Tue, 31 Aug 2021 04:29:52 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:24898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9Q-0007y7-Ay; Tue, 31 Aug 2021 04:29:51 -0400
IronPort-SDR: iY7Y/DdAVKZFCKMZRnAzJp+KI8QKgHazL2S2Feiw9LOM7V/f/FaIW4ekcCMaMr2HRINM2BZ8RL
 hufiBVQQSuk5taJLPRa9dbPJqr3YHZFPVzsLMox9Bhjf+RqImuBYKa5reINobjg488p5ew2GD/
 vWCewmh1awKnCYLkqqJz29TgdCbfTxBQLsUnbqQLcynMf87IHRyrpEHW/cvSa2RQ8qdCEOqdhG
 tCWp24Gig10OR5Vk0EDohkfOdIeGHssNW/K+HuGv/b1N/CB0wnCzmVNV+ZlGg/pVy+fBPuq9It
 Ms1l331+KpEAsMCu5Ief5P9U
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="42584013"
X-IronPort-AV: E=Sophos;i="5.84,365,1620658800"; d="scan'208";a="42584013"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Aug 2021 17:29:46 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3386C248D04;
 Tue, 31 Aug 2021 17:29:44 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C5DFAF453;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 3F96040164EBE;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v6 3/3] tests/arm-cpu-features: Add A64FX processor related
Date: Tue, 31 Aug 2021 17:29:40 +0900
Message-Id: <20210831082940.2811719-4-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.139;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hjQ18mOrjdz

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..90a87f0ea9 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -473,6 +473,19 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "cortex-a57", "pmu");
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
 
+        assert_has_feature_enabled(qts, "a64fx", "pmu");
+        assert_has_feature_enabled(qts, "a64fx", "aarch64");
+        /*
+         * A64FX does not support any other vector lengths besides those
+         * that are enabled by default(128bit, 256bits, 512bit).
+         */
+        assert_has_feature_enabled(qts, "a64fx", "sve");
+        assert_sve_vls(qts, "a64fx", 0xb, NULL);
+        assert_error(qts, "a64fx", "cannot enable sve384",
+                     "{ 'sve384': true }");
+        assert_error(qts, "a64fx", "cannot enable sve640",
+                     "{ 'sve640': true }");
+
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-- 
2.27.0

