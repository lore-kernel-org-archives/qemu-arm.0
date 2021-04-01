Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp361358lfg;
        Thu, 1 Apr 2021 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3sVlKAuG6Y49sug5wdO6eGGwNYkeWe8KAuu2WeRfYoxzPeZ5NtHC+hyWjP89Qp3eaMdib
X-Received: by 2002:aca:1014:: with SMTP id 20mr5632652oiq.40.1617273851570;
        Thu, 01 Apr 2021 03:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617273851; cv=none;
        d=google.com; s=arc-20160816;
        b=w3QxMUTEXXqMi3q3tIdEf2MjYrbAGnADB7KKaDO+M0WE+/88MRPxyK1o1j78wfJOj7
         n/bdb4nHU1sgmnel9+wTkhOf3TH3kO/xPHCVRjv6DqSCWmGav188H/kmxXWwV5bgOffv
         NwWekyAa7uTCHoxjO2V39yBk5uJJg0wNOca+g+8sJy1cToJybCxnSic3ODeQ2F4JS8ix
         9/gv2u+9EuiI9q4Mv6AVAD3uVjLyUNYVWieILatXr92zFGK2pmM5OUN1yhftR75NJ2Kv
         TYD7st24Spll681pg8jFJvXIQvnRwsnVzAu76wS/1CSiSWshp1iASftVme8LYoR4YJ8g
         cY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
        b=KFvzZTxAoXg/8DvjoL5UwaVz17FQfClmwj4pYHxuZKKey9edv+EJDcu6kNbe/i07Ie
         gPOAdkfP4pbHLWFG+6Pxs93VFGnvTQcVG3r0wvsDeSI3+dFXdN0lAdTZRGkV69YuMfzT
         CiVNjHT2f+1prpD6gn/Sw52ulQM2TZi8xtOnQyrd4IPqBy5v6MU5PmLf0T6yQhzfJtMz
         n/6m9RWnu0kj+zaWD37NX8CF5JR0t3KcwfILW8FTLUYMfJqMbWZg9CLWP3TEsDF4PTti
         eGQtFjRxLSxLSWvY5QNOtniwF45ClzcFZffQDAYPreaUFvYSnfvSnDWrA0JVsqsiq/YA
         Iqsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vYCxZJgC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si4334930oti.304.2021.04.01.03.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 03:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vYCxZJgC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRuo6-0002Of-SR
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 06:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulM-0007Dh-O2
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:20 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulK-0002Qw-Cl
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:20 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso1762106otp.0
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=vYCxZJgC9IYUahRmaA1hiotepZBdCe/oSE2KE5ADOywUfuk97sQdRFvGPI8sSh6TOP
 uPJjSnzNicVOqN0084yEIY3u7409qZ4v0UevAmVvjo1H9q5roEvkZTPVsvmvuDAOSVIq
 7xzHwvQX9SSTVMq1cnlmM8o7XRSFwekvqtbMDZvN3TJC953Ny3gJCZm8I8F7RHvwVbbt
 76VpQpRjoMnd4bhBVTKOjDuKZcZno+W/ZSD531u2tiyYvofepvB3KoVd7hjY3044O6yx
 cy5GjeOQLL5SQSuJAsk0gn6IWGTdm+RiFzlMlULJPFwakQajxzSm1NIv1fRK2wQutVhS
 dc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjlPaXyuxmJc78UBaRD26ugJ56+ZZ/y7y6+y5dorLqk=;
 b=rp0bjAJNNqqp5wPOdpbSU0bv+T5PZYuBhBK8DdfzyxdcGGzhZYUkF3kWgZiJRW0c8I
 X8WA8quFcZKDuD487/W3r1DXqylPOf1CVSg/3419qz/3pRkk7zssQsFujKfuqI8bpKoh
 IcSdOayiXgTSByETISx+TLeJo3sHyGTlxxRoHSJuFLz6WHN9Y+JOQdaeVGbFPBY3o8Tu
 Ff7HDoaU69XeKUmty52HocwTHwMkYVf3nGW3sYfj7NYrFoSYPwHsMMf62UeKNXMmox5b
 joi9E+kaiMg4F+lSPdTtugYMzQunCPr80yxun1Xd0b3Nld6gaC48V4LehaRLBMQvSG2Z
 jwNw==
X-Gm-Message-State: AOAM5339vtQlBjxS99F/HMoRwid9BSFKiQnYMgTwGLNKJTsUhuR6ebJq
 DdzWf+3JfXbk3Q3D8rkmHPlfz3QwTuBDz6s=
X-Received: by 2002:a05:6830:401c:: with SMTP id
 h28mr5936899ots.347.1617273677386; 
 Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:17 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 6/6] target/arm: Add vCPU feature 'el2' test.
Date: Thu,  1 Apr 2021 10:40:58 +0000
Message-Id: <50db1700b4df48acbecfda077b2220a0e3cf6b49.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYGASlQEpWDu

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/monitor.c           | 2 +-
 tests/qtest/arm-cpu-features.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..6c39238925 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -90,7 +90,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
  * then the order that considers those dependencies must be used.
  */
 static const char *cpu_model_advertised_features[] = {
-    "aarch64", "pmu", "sve",
+    "aarch64", "pmu", "sve", "el2",
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..be07bf0c76 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -509,6 +509,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_steal_time;
         bool kvm_supports_sve;
+        bool kvm_supports_el2;
         char max_name[8], name[8];
         uint32_t max_vq, vq;
         uint64_t vls;
@@ -533,10 +534,12 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
          */
         assert_has_feature(qts, "host", "kvm-steal-time");
         assert_has_feature(qts, "host", "sve");
+        assert_has_feature(qts, "host", "el2");
 
         resp = do_query_no_props(qts, "host");
         kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
         kvm_supports_sve = resp_get_feature(resp, "sve");
+        kvm_supports_el2 = resp_get_feature(resp, "el2");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
 
@@ -602,11 +605,17 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         } else {
             g_assert(vls == 0);
         }
+
+        if (kvm_supports_el2) {
+            assert_set_feature(qts, "host", "el2", false);
+            assert_set_feature(qts, "host", "el2", true);
+        }
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
         assert_has_not_feature(qts, "host", "sve");
         assert_has_not_feature(qts, "host", "kvm-steal-time");
+        assert_has_not_feature(qts, "host", "el2");
     }
 
     qtest_quit(qts);
-- 
2.17.1

