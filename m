Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053095ejc;
        Mon, 27 Feb 2023 13:34:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9wPoXu5L34tPB6g2rj4pSg9Vjnbj1YelDPY1pQxUNDqc6+LuX7gfiRu4jcRnksUBCY3WDX
X-Received: by 2002:a05:622a:10e:b0:3b8:6ae9:b108 with SMTP id u14-20020a05622a010e00b003b86ae9b108mr1294705qtw.27.1677533677488;
        Mon, 27 Feb 2023 13:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533677; cv=none;
        d=google.com; s=arc-20160816;
        b=Ka/w7FatyQTZAh3vD7/YBRg9HNSiwULQ8FdtccCGM6eIh8JNNbgJ6zZ4uWrFtFb1sf
         SZv7N0g8+h/evP26BILwnCO3YPCBLKpYJmrDx+7uRtfhn0IVFmEpDO409yevA/aCUuV9
         O3ehiFqJz4mxWPmek23aC7BcqZmSkRM4+H0Y/CixkzDageNUqbDlKm9GVxcUM/Nfclca
         p6X/4X1zl14chXlVUtj5w2mdfk1O3Z1vx2NN3y8BG8JqC2KZDamEh6HR6eghkBNEUBV+
         U66YagEXD+O0Qb8M8B7TSeA2of5Fka92tN3y4B9/4jFmRaQxHpA++vIr5z7RLm4UA823
         22XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
        b=CbxYIBvj+mw/yO2m5jiv5KpYSigLvt1RMYkLxkxVMAU9CcmsQa3XDNH7qZwLbJdRXA
         micV6Jw7dr6lQdC6qvq84du8bpKpsJwNSbUMV1MO5Kgs3X+H0d0ubMErtjZweanGQTT7
         sIonzKGwhUsPJcSuwcyd5THWQ73ewU/LI+7WjrCrTqmZ3Pjy38IN2I6uq45/PsMWdQ0z
         VLOHPjxlRQTpPH8EU6Tcg5mwlNiDnc1wLBrRURK5F6Crd6fjSEVWnOYhqlx8zfcKxznN
         o/V8MODl2LAboEMZ0Qb9FPhwrFR371H2m6AdrNI0fXBOW/19A+WgJZOFkyMzPiOlMuG3
         GA9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=twBrrDzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a290700b007024a966418si7992167qkp.604.2023.02.27.13.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=twBrrDzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl7z-0007CQ-Bg; Mon, 27 Feb 2023 16:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7x-0007Bb-RS
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:45 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7w-0004In-DV
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso3571202pjb.2
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=twBrrDzkWOr6pmuZqIkvXFM3Wf0S4OVTus4rxaK6MgJneyiLUPL+9hhI01xA2uHWgS
 dIqP3sMxkCtcQbzY40ABrnPJUGoZ8jmk8c4KX75Msga8G67kmBf6zaboH4AThFemzuVP
 sS+grnnp52GbgPYyYW5fntdVzMePQV/eY+Iv5Xt3gTjV9Z4c93dGsYcrdO0NIGdJz1BZ
 l1DQc12QQzaJmicZoY7bIpvkjarpYDe126rj43gYk79knMTWjmwLrNWoK9P/WPnMYDKR
 qpP3dl1nZ71G2bptiYl/vdLFW7dXcFX0ReJA1tRL1VBwYR9QekCAn3gTY1ksUr5HFHcS
 uiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atup5JzD1u28pHb0Z+S8hkpRI38cVehaAA91hoO5SKs=;
 b=zeviS4F/oOUFi/EjyJwk2wcptDt5wzZ8zOgYmDODBKGbcrorIvH1Tw1N/Wj/z6XCbh
 wO/LFowsU6RK7mOJdfRVw53/OF80GfJDvGdceVfda3S7aP8z0judNE+W94AKbbdAT/+a
 DUnA5safKxQzlr2oUprEsuFT2GBd9xbIHkUlnl7ZCQzN5j9/01Da2V9FM/Kyas+9FEqt
 yZB4EG5AkwyxzcffisIdS6P53V8KXYLWI6GfVTNN67wDXJgESkSaWv8rZXCS3NTxhEGD
 P+5FgXprPc5SXmskyM1rKf4OhPEvbOlLTmnei0VVeL5p/UsnKFTmlDN+t4IzI1ZosDfH
 Qh5g==
X-Gm-Message-State: AO0yUKWnDgvRaYjLP6+wp0UB1RZTTdegfJ3g+3LswS7c6runKJi20URf
 HVX7KRVZwBwMoBaGN3HybLDfWw==
X-Received: by 2002:a17:90b:4c0d:b0:230:d6a8:a9e9 with SMTP id
 na13-20020a17090b4c0d00b00230d6a8a9e9mr523884pjb.48.1677533623242; 
 Mon, 27 Feb 2023 13:33:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/14] target/arm: Fix svep width in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:22 -1000
Message-Id: <20230227213329.793795-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zC5UGybIgrx6

Define svep based on the size of the predicates,
not the primary vector registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 895e19f084..d0e1305f6f 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -297,7 +297,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           reg_width / 8);
+                           pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-- 
2.34.1

