Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3560730lfm;
        Mon, 24 May 2021 06:29:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBs4kpJQ8CG5OHhu+oDUncbRePyMXOj8WQXbNarchr6Z26THEHR9NziZfj06ZcseZxzjqU
X-Received: by 2002:a67:1906:: with SMTP id 6mr19230706vsz.6.1621862995721;
        Mon, 24 May 2021 06:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621862995; cv=none;
        d=google.com; s=arc-20160816;
        b=VwU/PX3wqu4K3/aEYhl3p8zVNPI7c4z1cA5629vzaKaZ12wBkyHMgAANbaOmo4tpkC
         LxB70IUBnfZkeux+MEnjJilSgfSlCohMMEOYqIJaNQrCkom1l7cFmYsXPYYnc1lM1YeZ
         lMZGOlJ5NTLwfaHYAc/Fef7YuIB/gZWKQdLv13PK11aIHs4XkJFss3xQoFMkpCBfNKFW
         4y/5wnvshDHh4AHWWpw3YFiBvkJlxO4aIo0eZeuHKPRPhZiDwyYW7ljUdbYnpb2JsSkl
         JxpSbOk+1ZpnzCLdEP1iVA68X9FBOdlnWe0ICD7jfnlwRbgd2vLlmeqyK+C27nBy3xxZ
         8Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=B5vCchJTb7GEbpfbedteaBDjGdQPYwb2tJtpla8Bjo4=;
        b=XVmJRN5GFuvG444U9fnRJp1bdbQwa9RwC+4AOLGAmAXIjOznsXVlDONPIX8OFIXuzh
         JR/GiSwyTd0DzdXDpLSWEBsHVxpAuGlVtYfCs7FWc3iHCtjnNvu9jh2/GqSMpwh7LLIC
         nRHf4AScQ4NO7bgRK4iDiio2m9DSCPcewfM7zTOIVqNySPOFM2d257G4EKAMWoiI45ol
         LpDQYi0njmz1IXSaSYJwsVZMJJrSkI/zMm8IPRECK/oV0ysRrXf68y7E7bpXiJykV3lA
         SYP+koDjQax/O/5AKFNV/h0rjVdkQqd3CPrCNdqxgTestpu7g/rWKMo7QA/XXCp7jdob
         xkOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GHe0wSQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si5541187uaj.153.2021.05.24.06.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 06:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GHe0wSQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llAeZ-0005hz-09
	for alex.bennee@linaro.org; Mon, 24 May 2021 09:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6B7-0001ig-Kg
 for qemu-arm@nongnu.org; Mon, 24 May 2021 04:43:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6B6-0003u3-4b
 for qemu-arm@nongnu.org; Mon, 24 May 2021 04:43:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id i17so27629761wrq.11
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5vCchJTb7GEbpfbedteaBDjGdQPYwb2tJtpla8Bjo4=;
 b=GHe0wSQnIRdGH1QJmN15ywx4rSQhTHGol2S9l8b/BfcpvUfhZ9LRTRtxquKveayIZ8
 9nnkGYzNcSgunz0LY8Mj8LhaV9cN1BYCMvr5e4O88M1W39MqCocTKuc8xcAuDl+WAiAY
 poamHUv+B13uGmRFl/4OvJ9sV/qQr9sDVV3GZcknZHZK0N+bj+QeYksYReopj3YuFnsI
 AU9oQYcZ4d/khWRgXQEvXk41IeCwCX/HG1Ar7Z//X+0fU6FjkGxnXPyedIfZtq+6IXPm
 421ZV32yTFeamULJu7TlMdewI+4ZfyrRE66xTtUnVJevep2MZkkHt60035dwvZuLWWVL
 H4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5vCchJTb7GEbpfbedteaBDjGdQPYwb2tJtpla8Bjo4=;
 b=KpDrB8Swv1UO/YkNlIxazMkIA+pjJDPYV2e+IFhhWRvld0g4ulHLnYxmojF954hg/f
 etwBXkPA7zxS91R8eZaeXww4JeQq4MbDaappRMU+NkuO6JV7cT0sc0UElNT9lO8X7EdV
 jyFWsaJIfZvrfLlwmxfseyLfyr33Sp/Ufpc2yYTyXx8PbZnyHOT0wdCoKGpe9Y8lkOUL
 X7IAgDK07CyP9yIg0EUg7Lv+3WB5+QV/1zko51TPmsVdOl0bzrYY7gs/lI2IJ3gnjiiI
 pPExlk9qSWOBqXxhcrcUgP3Jwu4mfjTbtBQHODNtc2WU3oPNmBwEG1ihON9jk49phpuT
 wr5Q==
X-Gm-Message-State: AOAM533NG6if16fG9C52Ix0YwjRzg4X5WWIbPf9WMeWqJZMfIVvuGHfn
 UOTvWindBtYIMUxp1x6MrQS9fCoqHfBBLv0cxphmQ34jKo5U5RtJ519Uwi6O4TwsCM0A3R1pp16
 Op6/nlJplVSb9T3rXQLcpZ5L5Ys0OKQB9qrw3BmyHIyBU/Her9JV2PJZQ8CQUxF8A6A==
X-Received: by 2002:a5d:654f:: with SMTP id z15mr20791984wrv.64.1621845790357; 
 Mon, 24 May 2021 01:43:10 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id i11sm11505262wrq.26.2021.05.24.01.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 01:43:09 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: don't clobber ID_AA64ISAR1 pointer auth
Date: Mon, 24 May 2021 09:43:06 +0100
Message-Id: <20210524084306.1666265-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 May 2021 09:27:31 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 leif@nuviainc.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZcyaof14pgF

The pointer auth properties are added to the max CPU type but the
finalization happens for all CPUs.  It makes sense to be able to disable
pointer authentication for the max CPU type, but for future CPUs that
implement pointer authentication and have bits set in ID_AA64ISAR1,
don't clobber them unless there is a property registered that can
disable them.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/cpu64.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..81c9e494acb6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -575,26 +575,31 @@ void aarch64_add_sve_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
+    int apa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, APA);
+    int gpa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPA);
+    int api = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, API);
+    int gpi = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPI);
     uint64_t t;
 
+    if (object_property_find(OBJECT(cpu), "pauth-impdef")) {
+        api = gpi = cpu->prop_pauth_impdef;
+    }
+
+    if (object_property_find(OBJECT(cpu), "pauth")) {
+        apa = gpa = cpu->prop_pauth;
+    }
+
     /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
-    if (cpu->prop_pauth) {
-        if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
-        } else {
-            arch_val = 1;
-        }
-    } else if (cpu->prop_pauth_impdef) {
+    if (cpu->prop_pauth_impdef && !cpu->prop_pauth) {
         error_setg(errp, "cannot enable pauth-impdef without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
     }
 
     t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, apa);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, gpa);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, api);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, gpi);
     cpu->isar.id_aa64isar1 = t;
 }
 
@@ -662,6 +667,10 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, GPA, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, API, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, GPI, 0);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
-- 
2.30.2

