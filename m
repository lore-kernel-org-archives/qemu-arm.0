Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4350543lfm;
        Tue, 23 Jun 2020 12:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9vTlxErlhr07GbOqih9cnmfhYhkYxzmvcUQrwGt/BSvNDnY1lIJOSNB1v9r6yN7dzvIQG
X-Received: by 2002:a05:6902:1006:: with SMTP id w6mr39848438ybt.411.1592941995481;
        Tue, 23 Jun 2020 12:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941995; cv=none;
        d=google.com; s=arc-20160816;
        b=NfjnBOt8phBxnmprQZCiiNmIFOcqL2/QhEjlbuhfyaPsW8wahUbcmhaxsM4zJEkPeP
         12pQvzRIGMxeT26j4nleyfzkmgvBLN0K1Ucg0hnSMaX82t6ObV/DOQ/+m3dlFjv2GDmL
         SiTIGnfM296mo9x0KlGty2U+DmnNcugTkJ3qoMAerPdPFWnEmHsly+Blo1KGtfz/QbDK
         G709J6OyK6pviGZNJKmkpztSBqWBxXSN1Aie1qDAnLuhTXvqy16zTzSIfGchTULVZZ8u
         bhiq6Oe0oQMO407tKVN3Gd7pTo5ZmI5FM4fklmbaWl2pPY87ntjHNIAVWfjCSp5yoP05
         yMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
        b=V3SYVtZfZoFrzctudn+KHkhRxhLNcdsZwhkH9j+yWQy5e/pjm0K11fyz7utOYVc/eM
         tYfKjKCP3IwpEX6M1lOaVQIVEM2P0jfMfLLtNtwrgPrNQXhtNlSrM3VxgBsb5pIjTQ8Y
         NWpp+LznmLsVuibemMqkqB/lP2QfJdQSy81LzLv5RKAlOlaFMO2aIhdZV/iYUnNxf1k8
         2agaEXMLMNyYlv3W+haL0ozwA/INZuV67kfa6gxP372bwc7YZkDbdzwlD+EKH9JOfR+8
         wwcd/GlY5egHMHqnsU+mtLlzrXE4ny1zlM1kSVDfzaL17osTvG/vsnYTwkSJSONmWRCk
         neIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M76zOh8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si16660168ybi.263.2020.06.23.12.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M76zOh8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnoyo-0000Gl-Q6
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok5-0005GX-KH
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:01 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnok0-0005v8-QT
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:38:01 -0400
Received: by mail-pf1-x444.google.com with SMTP id j12so8338382pfn.10
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
 b=M76zOh8g1nzD8ykE8027goebeYeai4bA649NaA4G1gHsa5r6jQnT/WM7LW61AJDkfn
 YekIAyfY5N0U9+9p5gN4MUSqLF1HcpL0afenT+VCJJJWRLV8xVEzgN2GMm95zIRd/jcf
 X+MwVMQxBUihJAO7k0G/twbFiyNzZlY1Qhs8l1Y/AyAD6zApEk9Yo8QFqPIagK3zvxkO
 +wAs9tcjkq7cLV+QoCYtX2+IRuesQ2NRRuN0DI5xlqdZXvu0HCZ5yxlILOgUjrNEj8+u
 yoXpCQTkFMXnO6HEZMxFvLTiqRW8SbT+C5jWWULW13sP7krMCBUwERtNO1RJFcn+Rn1V
 GLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
 b=hiPJQ0OR+cBFbXVspCGvk+nX3Pl0K4LEYviMkz4VkdpjtFFcCy0oPNGRiO7MghITg8
 OqoR2puehjFoHeQdX6dbww8siVgEK7ofVci3eLv5wnW/ig8gDmyRr1aBCQnV6D3VOk0G
 aJDyDaqHiEB9IJmxUzf7cQXs1txqjFGXg8kY+H3I4xC571qUOQ1AkfdV6r+7h36dAjcC
 vLrC9vZfrgZ2kxoYk0II5pQDv5nuxn3h7TOTuhe14o395Eln3Gi9lw8LBBwrWpNjwvHj
 ws3/0HRcnVNZWZvrgffjIzr6aOeblTmrgPXOPeRMD3mSUbCj5sNF3n3VCJm0aaYM3Yq6
 AUDA==
X-Gm-Message-State: AOAM532O5hi8lod4b074jCC/q5H9PYkMhkRDUENgViEPgIw++2yeR6Cg
 2ozNnN1IOHcmky+pWK/T7rfVKw==
X-Received: by 2002:a63:b915:: with SMTP id z21mr19384826pge.145.1592941075565; 
 Tue, 23 Jun 2020 12:37:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 40/45] target/arm: Set PSTATE.TCO on exception entry
Date: Tue, 23 Jun 2020 12:36:53 -0700
Message-Id: <20200623193658.623279-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
X-TUID: +P5HiPxdsI2c

D1.10 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 23cf44fcf4..d220612a20 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9704,6 +9704,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
             break;
         }
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_mode |= PSTATE_TCO;
+    }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
-- 
2.25.1

