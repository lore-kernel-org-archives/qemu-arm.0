Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp395485lfq;
        Tue, 8 Sep 2020 01:17:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/QkcRnlBmJwWmb0/T8qH/hmYMlRtiAHuRnU+Tfu9/ttmAHAr1P3Jk3ekFcviUA5fzW7gr
X-Received: by 2002:a25:3201:: with SMTP id y1mr22149488yby.213.1599553047218;
        Tue, 08 Sep 2020 01:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599553047; cv=none;
        d=google.com; s=arc-20160816;
        b=i7+YwnSIgcfe1VQRQrW3vtA6XOunmZQRRhaJhKpTdRAKNfrlcVev273XhFg5ayTDJm
         UZpuMC3CkplItAfAzeffZVuAowhrQFMrHlaJ9XO/rV0jtBvq8+14OJsNWBTNEBQnKVLS
         UCC9yK9hxiX3MCdQR8Sng5tG8otxscyvOAjxHdvCFfjzWQp/CJgHhn9GAkX2RJrIfSmM
         wjqPtk3ij0FNG6RSzr5008ikCJpY3AjMZaWMXicJx4CpOYriZiw9u4tQAQeVCapOi78K
         /3TbA2f/gXBCWpoRw4NI5E/VLNYNJrfjKdAKlYsvkMzmWulQTt1NHv0S/EcZYs5hzY5x
         XGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zq8jUh6rr55C3iWlgIX0sFstenVLmlXQeyrdeGeUxsU=;
        b=xZtaW1N/57GO4E06O0zZRJMx0IgJS4vnvaJPdgp0GV15DRQMjY8DsDSTiGi8xSY7IL
         HS9Al0f/mg9P2by8loXjbcxlvA6oXXj9CVSdQASARvHz+EycBAzxCXJRzPSSZPsurv41
         XgETwD500x4YjV/JEq4c0t2atdsCGeA0dIQfaGlbfEMLu2fTafwLgBngWuhc7GHQ0mQ3
         +2S0QXuSZaz/aWDnIv6EZbS2x/jUjQNmiVCIyHCZZdrW/fr+uc92IqTbUhRMuoN0jPSM
         qJq+r69x6mSK6uO6LHMrt4OubzNPr+GobxzXiUn+5SSJ7DLzrdMoz57BwzLCSvULbipq
         KcvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfFfk0Hu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si14183788ybk.444.2020.09.08.01.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfFfk0Hu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYog-0004bK-Jc
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlN-0006B4-O3
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:14:01 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:37292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlL-0000VM-Uo
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:14:01 -0400
Received: by mail-pj1-x1042.google.com with SMTP id kk9so5266081pjb.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zq8jUh6rr55C3iWlgIX0sFstenVLmlXQeyrdeGeUxsU=;
 b=QfFfk0HucHpO/x5Jc0DCHPv1/TNxgbR0bKs0thQNWDve3EYX38Od2x6m0shvaVR3lm
 9IPFIl3SxZp1ttV76d2ZXNjFdLiO58rjGbORvuCAE5b8JZncIo2sVSmId5z8POfV1aH9
 mup4t48Yh6gCUidgmvJr7xt+opOUkEC8neR7IcPYhlSxfw1GOLIR7Gp6yRjKDAcniPay
 xPVMotf6YWG9sZvVyZXOEoAn8d2z5K75Fz7Y3iWfEOpVtYORH/cpPhYzETIDxnh7WFgj
 1BJ4jDdOBjd04i05OZ6LPLc+Y4Bq4tgN+lMr5GatQcVaVRxbQooWukUPSyU8MGGUsmWB
 AS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zq8jUh6rr55C3iWlgIX0sFstenVLmlXQeyrdeGeUxsU=;
 b=e77glLRoKQVtA3bnBWDtm2j8wWJFlaIkhWCu2hNqRnZmFuM7L7uaDdFUQzQeDtjNiz
 GZKXl7mgS4CUA5pk0fhTMMCkM1+FWeU3zByZloz2yVsIJWoNUGg2NMUWVbfspLRt2nQL
 UzpT4vFr1JywqN/v4FJQrLYpmznefnZByU+qWxbPtKNA12vT+DaHFfnsbuRU0QFZ3Rpl
 sm+kwXtIMA33YeBp45o3d5Pgt6iMjJxr0w07ATJam1oKgVGXTWofscgnZJP8WZvOB8EB
 4SduE6Vfsu2J4IfG5430kp+wL8crvyepU24bso/PNOaaJREpf95D1d9CNzGFkWhDHN/C
 jr2Q==
X-Gm-Message-State: AOAM531zk7wPtqkb4oMnLfBaMftMqHON0x9ymlHPG/yKZpUmvWzMRJ7U
 LhaglCdZPSF6SMh4y1SsVFkf
X-Received: by 2002:a17:90b:1212:: with SMTP id
 gl18mr2103309pjb.138.1599552837216; 
 Tue, 08 Sep 2020 01:13:57 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:56 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 12/12] target/arm: spe: Add corresponding doc and test.
Date: Tue,  8 Sep 2020 08:13:30 +0000
Message-Id: <f85b67a841ad86f461c7dc0c8f5f8b1e5d490da5.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=haibo.xu@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPfeauXFXqEZ

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 docs/system/arm/cpu-features.rst | 20 ++++++++++++++++++++
 target/arm/monitor.c             |  2 +-
 tests/qtest/arm-cpu-features.c   |  9 +++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 2d5c06cd01..5b81b9a560 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -344,3 +344,23 @@ verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
 example's (1), (4), and (6) exhibit recommended uses of the properties.
 
+SPE CPU Property
+==================
+
+The SPE CPU property `spe` is used to enable or disable the SPE feature,
+just as the `pmu` CPU property completely enables or disables the PMU.
+
+Currently, this property is only available with KVM mode, and is enabled
+by default if KVM support it. When KVM is enabled, if the host does not
+support SPE, then an error is generated when attempting to enable it.
+
+Following are 2 examples to use this property:
+
+  1) Disable SPE::
+
+     $ qemu-system-aarch64 -M virt,accel=kvm -cpu max,spe=off
+
+  2) Implicitly enable it with the `host` CPU type if host cpu
+     support it::
+
+     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index ba6e01abd0..1b8f08988a 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -99,7 +99,7 @@ QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
  * then the order that considers those dependencies must be used.
  */
 static const char *cpu_model_advertised_features[] = {
-    "aarch64", "pmu", "sve",
+    "aarch64", "pmu", "spe", "sve",
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 77b5e30a9c..4d393fb2e2 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -494,6 +494,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
+        bool kvm_supports_spe;
         char max_name[8], name[8];
         uint32_t max_vq, vq;
         uint64_t vls;
@@ -512,8 +513,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
             "with KVM on this host", NULL);
 
         assert_has_feature(qts, "host", "sve");
+        assert_has_feature(qts, "host", "spe");
         resp = do_query_no_props(qts, "host");
         kvm_supports_sve = resp_get_feature(resp, "sve");
+        kvm_supports_spe = resp_get_feature(resp, "spe");
         vls = resp_get_sve_vls(resp);
         qobject_unref(resp);
 
@@ -573,10 +576,16 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         } else {
             g_assert(vls == 0);
         }
+
+        if (kvm_supports_spe) {
+                assert_set_feature(qts, "host", "spe", false);
+                assert_set_feature(qts, "host", "spe", true);
+        }
     } else {
         assert_has_not_feature(qts, "host", "aarch64");
         assert_has_not_feature(qts, "host", "pmu");
         assert_has_not_feature(qts, "host", "sve");
+        assert_has_not_feature(qts, "host", "spe");
     }
 
     qtest_quit(qts);
-- 
2.17.1

