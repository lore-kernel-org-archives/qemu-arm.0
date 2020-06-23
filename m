Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4345225lfm;
        Tue, 23 Jun 2020 12:44:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0TyY7e5duOV2JK7raXnvc6+59h2BPBAvqI/8fLJgUbHdyu3YfceYWq4rbSYib+CnhIzXq
X-Received: by 2002:a25:aa70:: with SMTP id s103mr38999888ybi.492.1592941474523;
        Tue, 23 Jun 2020 12:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941474; cv=none;
        d=google.com; s=arc-20160816;
        b=Xa+uErUnLu0YYRYMiS8d4Bzddit78aPsv+xMndpfn4WgJO8ng6m7XluFZUQX12u8ao
         IR0JGct5k+GD3iL00GDI8k8n8EVscRou5r8ErANMte5Xmh0YfLe+LojphHGnNc1IMT/7
         w5pcGSPsMNQ0fTi3smt3OuQhG4JCdGTOCdBVQXS5ky7hy20HZnpTPhtjbnhFumJT2T49
         CYAMRsOTKDK7lI93VtG+rCaQodMew9nUhDrV2pSUg18BXZcize0gWyr3CMyKEkIfVHAB
         1XGPgGTW7o9x5If5sSKW8mCVT6ZhrNKeRi8WICUgKvGaS3ixARmhLzDuROl2YCDc2eiW
         9Blw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HXdDbBi3bOiwXrXGTwrvFGKvOYNgFlf/lfsSkNgOuZg=;
        b=a71Fd6FamoA4XH2XBqgph1sK0L2bLGwIk5qCAG6AZNhMdZBfFsO6Ka6NI8KAZRkwqq
         EBJlzmVynOWzdK/Ei9KnA9v7qQIl8xCWH4Bj8IwJKvYfWfbBzeD5loMlNnlO+CB3JxdQ
         ugoHZinKKUesKv211zVrpronbFxva+rtUGMDyyM9nHFw8vHRJuiLbghCc7GWxYgAPoFY
         GcxUxZVCE3LNxy8t78brf2X/dKXZqXYpzxIeCu7PJllrMT5BHVVgulGEZBkSsS9ygYPO
         0RrG+f2eW0PIRcSV1Ga0RRKpY4zg1hcZSRhqzNpTMcrR2CiX7eCgY9u/ITvHKRu6U2NG
         DW0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvwN7JqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si17858753ybf.246.2020.06.23.12.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RvwN7JqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnoqP-0000bB-Pz
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojX-0003t1-VN
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:27 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojV-0005h6-NG
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:27 -0400
Received: by mail-pf1-x442.google.com with SMTP id b5so10549907pfp.9
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HXdDbBi3bOiwXrXGTwrvFGKvOYNgFlf/lfsSkNgOuZg=;
 b=RvwN7JqUBDJu4NNvDP1Pi3tXUvQOkwbwPz6nncUYuJwgmJVsDU9zHH2Z246coIbanQ
 3An/HmpLr1VCZYjQEicbhPMsnSxrfGxgHUS6lNVsB5IrQWbAvk1LKm3iv/vPmKm5D8Wc
 txEF1MKiDrcQpZpSudoyzilhuqNoJZfTykRbXbZM3rYBIFo5dWJRBrVMTVt/wDptzu4E
 ugagcgLoB5Na8mowuVlAEIY+2KdTigxAZIU6WGScTzU1C9xb9Napsb8HK4Vt1WxXIIuE
 CfK54Mw0T7c013UOwG8fHq8KRBmRY4t8ZKYfEBg6vFABDMfCJUF38Xr+QhDwJ2ec4Xfo
 /FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HXdDbBi3bOiwXrXGTwrvFGKvOYNgFlf/lfsSkNgOuZg=;
 b=os+SIzQYOcxXH3Z5sf58TXMo+VF/JtMdOmGu8EY/hZyeQugK4WTooBhq0/iqePTQE+
 Lk1gZ/hb78WbUeGwrVwQLdg9hGEAqXveLCZKPqyx7hIZlwbqkGWt5AlDL8GythaR6l2h
 wRGysvcrNYz8Wj1goZ5RjbfJo1m/VhjdQ8jS4PpbRWa5Hd8Z34PoEa/Z2u4a8wXZP/cQ
 12ynmEHpT0GxOmEJ+zcSCEYJMR7W4+4lY9U24dOw09rKnRKEnHxrZAG6VA4HoEuDucM4
 1+eAStf4pD98TvOtw8vYyWIArcZgTkh/CcsD7Ivf8GJpyjDmKhrjlqOY9/SgUQOKHctH
 Pvyg==
X-Gm-Message-State: AOAM531zPP2979f8S6LBir8F78ufW3DatAtNX1AilnZ9jqHWDnPfKTrj
 mYPQecA5YtLaWL0HBBTvOgWtKw==
X-Received: by 2002:a62:1b82:: with SMTP id
 b124mr25980743pfb.172.1592941044414; 
 Tue, 23 Jun 2020 12:37:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/45] target/arm: Restrict the values of DCZID.BS under TCG
Date: Tue, 23 Jun 2020 12:36:30 -0700
Message-Id: <20200623193658.623279-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KlPqSbemg6/5

We can simplify our DC_ZVA if we recognize that the largest BS
that we actually use in system mode is 64.  Let us just assert
that it fits within TARGET_PAGE_SIZE.

For DC_GVA and STZGM, we want to be able to write whole bytes
of tag memory, so assert that BS is >= 2 * TAG_GRANULE, or 32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 10677c0c23..f09efc4370 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1758,6 +1758,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        int dcz_blocklen = 4 << cpu->dcz_blocksize;
+
+        /*
+         * We only support DCZ blocklen that fits on one page.
+         *
+         * Architectually this is always true.  However TARGET_PAGE_SIZE
+         * is variable and, for compatibility with -machine virt-2.7,
+         * is only 1KiB, as an artifact of legacy ARMv5 subpage support.
+         * But even then, while the largest architectural DCZ blocklen
+         * is 2KiB, no cpu actually uses such a large blocklen.
+         */
+        assert(dcz_blocklen <= TARGET_PAGE_SIZE);
+
+        /*
+         * We only support DCZ blocksize >= 2*TAG_GRANULE, which is to say
+         * both nibbles of each byte storing tag data may be written at once.
+         * Since TAG_GRANULE is 16, this means that blocklen must be >= 32.
+         */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            assert(dcz_blocklen >= 2 * TAG_GRANULE);
+        }
+    }
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
-- 
2.25.1

