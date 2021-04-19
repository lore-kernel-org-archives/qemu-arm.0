Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1493041lfb;
        Mon, 19 Apr 2021 13:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOQ8Q6187uOmrKDUiDBz3sg6GNYgJRysaKRhV5qhkRVzzcJFmFJYFM5ApkMJlonOxxgW7j
X-Received: by 2002:a05:6e02:12a7:: with SMTP id f7mr20526382ilr.181.1618864600163;
        Mon, 19 Apr 2021 13:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864600; cv=none;
        d=google.com; s=arc-20160816;
        b=AWecyutoAAk7RUZdMsYl9BfuIcFEApY2YYaVoJk05jZ3sgBMVJ84wgiWU+bn6pYM/3
         BlFOwymyOqaV6xGHPqmTBPAfuM80PsEssLEdzPl9i+mZ2/xkRi1gx4qygK9ulBhypZXN
         PuLPS2knK4AqYvLPOTZ5M7//vGfCNPL6eFxu+En2wRVdhFz4xEkIGrQ8z7uq6YT5xHsp
         cSSyh7LpL1DkHiEcgGAA5ZboFUeodcBdA+GkoC082pBYCOitf+Bl99YkexVjY6YDpD/2
         1H8a7vIyA5cK89GR5WScf0oGCoudmn56Une/a7pzwrqMZyo3MzOLzoqHEszyRrqM8iqi
         Z0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Yfv64dvMhdyEtoyrk3pC9NLOz70qBRB1xfI2zMRjLVI=;
        b=IjjmF49sJO9pc5x+K8o1ALw8MVHvbMYY8cp9SAy5r0YJvSobg8h3ZIIy2RPwFQS3CE
         YH0p4YTiQ8nrj1rSp9jrxJvvaWcnKYRv+h4496z4ggGWUim7ma7wJ3v6rDZusX6F/ATv
         mP5STCaGsrTXZeImf5l2PpBrDBSsi34kGW7uT4XKBaiqwMURdymb3uApR22o2YMYj8oN
         EKAWuldmMN/T8PKQ1R75dxxn087x2j3Y3O7RFzrEarAMhSAdHqz/tv9LxId8cN1Umll2
         nnfC/8pStnmgdAaEwkZegaW780huYR/PPMgju3br2FOf1rnEnG+Of3/rBZ5MgbkHdpGb
         fU/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d6DmnOsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si15727134ilq.159.2021.04.19.13.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d6DmnOsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYadL-0003Lz-Fi
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQP-00070h-Ka
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:17 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQM-0002TA-Oz
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:17 -0400
Received: by mail-qk1-x732.google.com with SMTP id x11so37131012qkp.11
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yfv64dvMhdyEtoyrk3pC9NLOz70qBRB1xfI2zMRjLVI=;
 b=d6DmnOsKPEMOwJIhV5jigan/+j0IzvKP4qJwp/AFeFhul7j/0FhxT82VykeWS+Xj/Z
 m85bTLoMRFKdNFqZ1Kafs1wsw0u6BJLyv/7nqbIW+tBzCwgsSmc6FChtj+/0AAAav9CP
 f2jLtZuT2DH4sPg8MLdRGWmElyCSB4BHNM1V7Np+RqBH0jZ8Y9iMuJ28Lpo3yY7LO9iC
 wCzRp6huA1F4ubaty+6YCrW1PQcSILz2JR1aWPmSGfRoTOUuuBxhkb6+D4KE5UNM2wx4
 DCvTmUVb93Ddd8X++2rA6fPkhj06oGI/r/u7f2harn5vtuYpjmkCFj9J01mmSJF07So/
 haQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yfv64dvMhdyEtoyrk3pC9NLOz70qBRB1xfI2zMRjLVI=;
 b=JD/a/lzbM2tyTT4q+JfqlOb3SkQ7c5MPRFSIQK3qJnKPJ8BRbGo1swnlo7l092SqUi
 +Ksy+HQOOZ3hPDb8AZ9mSsrlTB2aiJLFykmBySaN7XsMTs1v4+rQnQlKkg/mxzMZ4P9c
 ozRuELrPg9TlE41EU6ODpBo98X81wrhRIJk31+BPW6oGDbHaa+4p0bl10z+7gUkKMNge
 m6TOdiJdVgL289oyz8SfA3+uLTuyOAke8Cm+yBx2s3XJw2mrqhHccTBrqvtqQBD6HAJE
 aQ0qGnc0pR087FoeU8P1ljMvrD1WhDK9rnNEXMUuHpfwrdU4h3cqbKL57XnrF0t2XyZO
 ce0A==
X-Gm-Message-State: AOAM533uuy+KYllHIPnPuK9RJhO7zd2ZukvHOp7iwu9TJ8abH4o8+de2
 sOnG0nWtBwWD5MQwa8a6GZRjdA==
X-Received: by 2002:a05:620a:1254:: with SMTP id
 a20mr13950049qkl.15.1618863793832; 
 Mon, 19 Apr 2021 13:23:13 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/31] target/arm: Use cpu_abort in
 assert_hflags_rebuild_correctly
Date: Mon, 19 Apr 2021 13:22:33 -0700
Message-Id: <20210419202257.161730-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lpc053qWO6yY

Using cpu_abort takes care of things like unregistering a
SIGABRT handler for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4aa7650d3a..8275eb2e65 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13257,11 +13257,10 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
     CPUARMTBFlags r = rebuild_hflags_internal(env);
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
-        fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
-                c.flags, c.flags2, r.flags, r.flags2);
-        abort();
+        cpu_abort(env_cpu(env), "TCG hflags mismatch "
+                  "(current:(0x%08x,0x" TARGET_FMT_lx ")"
+                  " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                  c.flags, c.flags2, r.flags, r.flags2);
     }
 #endif
 }
-- 
2.25.1

