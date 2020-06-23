Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4355632lfm;
        Tue, 23 Jun 2020 12:59:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT/gR7X+n7onWBHIiocQ8aqiNZPPuOtJdrB3YNUPuTlqqFfeOEDjnE/6CBzIYPXggqKfo6
X-Received: by 2002:a05:6902:1007:: with SMTP id w7mr44905617ybt.217.1592942393023;
        Tue, 23 Jun 2020 12:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592942393; cv=none;
        d=google.com; s=arc-20160816;
        b=x4ilrFCnrq7Krkj61HdEuPBkehdSuQxuzY97ngVPIPOo7IPzDAVliugZeuTeAnIduv
         E3jjHJHYdSztWQG+mLDYv3/Snaza8DzEGjlDKn1oF2hhck0PFLYIT0MQStruRaU6WnEG
         vEQVTrmApDeEJLDG+73dp4ddyn2ClSmvbssBQ+ex5o7DQN5jjpPcHmsnrM8okPgW/t/s
         h6IyzNcVrxQtxnfyn8LDwglSskrGBxwy9kOC0kTVEIod98Cq8nWG9pFR/bjioNb28rza
         XIkqDoEaOr4jXv6ApCs6b4bJLxOGYt/GAYa2vSS1SeDcXeYK2A2zjd/X7n5mXU0Fsuqq
         TA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BIDI4y8eFVZNzUa8YjAQRJHPznr6ueMv70vaNDO/hJo=;
        b=OK/nIQfiC2pmHHa5WWKGQNnhNUyVjqAxrYWjqUNGOJBtAMrPhz+w3YdoUaivJxttKD
         JC8oT1kJBqlm6P3l8oO1c91ed0viQfQfGIY+/OH79J/FvJZ9aPJ6VqwUxr8uZXTqucPx
         TGiRYn6xpxsb+CvwCK+ycfgXaig6qaN3CSCCCvJGGf/m5pdK6o9yqqG6hgSCLhlX7fQN
         x4SjYAN/H64AtLBFZsb/H+kT8JOHAXcdk+Ln344eftVN9DH4QO5dOCryP6DYmV0sFSrR
         E10lWG1ACYeEGTTOve87fyo4Xt1YolxUyHbLHf/U+dkqNuD88pmfH3f8BoAxKZMpjgFt
         fTQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EMGn71k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si17508294ybm.381.2020.06.23.12.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="EMGn71k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnp5D-0004wO-IE
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnokB-0005YW-Ca
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:07 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok7-0005xk-8O
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:07 -0400
Received: by mail-pf1-x443.google.com with SMTP id j1so10575267pfe.4
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BIDI4y8eFVZNzUa8YjAQRJHPznr6ueMv70vaNDO/hJo=;
 b=EMGn71k/3JlSw7+jy10c1fOQ2PLVQgFaTYgv5Wn3Mu5p6pOq6cXXIdeHjA3CM7CBm6
 CDuxnVxqHaClWrhmrLfHvrs9g1/0flqWwozVbs3A66QNBX7YRqivGhZbkiT3uNAfaU9g
 YtzqlwJKr6XYynwx2ZPXoS9QHtZRUcXCDtCj4WDyeMXBVayrLXPBXmsOnaNxnurzSE9P
 FmJ8RSJAR+C5EYmrGhWP6eg6BjbEdcbe/IlEmQGsG5OrbBiVz4eYVSXl0sSF9ysesizZ
 i6WIMW4tOL8ywte8TTDd5eIs1ybpDwwWUCnp4QWrzlAmYaamRcbSdFQXEhHY197NkYaV
 GH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BIDI4y8eFVZNzUa8YjAQRJHPznr6ueMv70vaNDO/hJo=;
 b=hPRbTJxCUD47YmcvKCEIEbJONDMcm3M4vlfvmYMSxonKIZBMx+6wng49QoC5kAxT67
 tt08D2H3Oq/m9Bw/jQkRn1llCDt6PCdcGnTetZTZSLWQ0JJtpiVkHTWdkGE5oa+MxFn7
 ks4XjA0Yzk4islFiUSomVdIP9Xvpm7gOY6+tx1Or55nt9CgKWOD7vN1nnydLg5VuzQnE
 4NPD+pIuDK+jI46ky1J94I/oU5UANtTKnfnKDUHlVnKdqyIrJ8mfwOo5MlznwQB+oUKD
 Q++Xved4rDV1qzG11l6qWyLIsFujJrST1sNM3z7Y3EWL0YekBcZmP7YBlJZqIf5mxQ+R
 BC5Q==
X-Gm-Message-State: AOAM5329AE1iRxtugNbrUm45oGSCA+iBrZ70veRPyCKJlF2UrDRkHJw9
 yKPpyL0I3ME3iNibxHhgo6ofYQ==
X-Received: by 2002:a62:8fd1:: with SMTP id n200mr146449pfd.3.1592941081904;
 Tue, 23 Jun 2020 12:38:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:38:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 45/45] target/arm: Enable MTE
Date: Tue, 23 Jun 2020 12:36:58 -0700
Message-Id: <20200623193658.623279-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 0NgRTsAabSWU

We now implement all of the components of MTE, without actually
supporting any tagged memory.  All MTE instructions will work,
trivially, so we can enable support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Delay user-only cpu reset bits to the user-only patch set.
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 778cecc2e6..45b0ca7188 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -654,6 +654,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1

