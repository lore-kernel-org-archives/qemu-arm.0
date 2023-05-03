Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654409ejm;
        Wed, 3 May 2023 00:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6K+1PnU3bOGD36tsuyOEP9NwvDZ9PvxwHJKSAbxKH/+z8H4H4wUdOHJlktyvk9ZF9YuEpO
X-Received: by 2002:a05:622a:46:b0:3ef:2db1:6e75 with SMTP id y6-20020a05622a004600b003ef2db16e75mr32213816qtw.24.1683097972506;
        Wed, 03 May 2023 00:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097972; cv=none;
        d=google.com; s=arc-20160816;
        b=yinoOquF8PXzyZTsZfodrh6hIvDQxzl4Ig4e1EG6PFdU+uN2S0i08/TCtPrhhJ6Ja0
         wlK9yoO4DZhd1YqQ56aEqIot5O/TAghbyJ7Fn6fd23KnnN6V1wl7GysiEkqM5fCCtn84
         5FZPCDfUtcuk7KWtfEScNy/sN++QtAWjZt7PJd+Qz19yCqPiYBgWoLbtQTg4ZABVuW6y
         6FvZI1VN77CB+5wy8WBnRBoTk0DfiqFR+13wmM5KqWnw2OElWkQEdeZ9bAtaxr8IfzOh
         jYfwQ/ixEE3APmirctyLE05d5dsR00LYs9iaCGFsdB/pXZ9l2nbo1TCMUaQKm10d+N8b
         +/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
        b=xgsFnQdBJpzO+tnRfpbJNkQgrYI+drvQUQ37hsnmH0zFzZda1CSgAZb7eyQsX9mGup
         HY5NXElBzwGc0a+/97A7ve3bHPWnLeRcjQ842YgSclJRdr88YCTgR17l7hWnhUMHk9Sd
         g7PbHekdOy8f8f0YapZyvmbjr4Uqc8+hmc1UqwuZ0JPEh1S3wId/cDg8DiU2LH+NqmTV
         WVyY2dEChM7ql4EgnlI6Dz9SwZsFXVTiWhvCFlPlsGGV6jH3NpKDvq7dnoylrEe2hZe/
         uPOeF0Zf00Gr7c4HRFyMk+6GLW7pnKs4zfkvuD9N3Y00S8iyJK7jMD8CMjbPoJrx6l3E
         9rag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfptR6pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020ac85bd6000000b003d4c9b6488fsi17935078qtb.33.2023.05.03.00.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfptR6pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6dz-0005Fx-1G; Wed, 03 May 2023 03:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002z7-Kw
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00073w-78
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so47656345e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=YfptR6pqg1Vnv0yQUAJz8GXu0u9C5ZCRaGoqgRok2t9NXbAF3kw1MsI8r3SZYdp+py
 Y8FdFW6U81nJnORVVXzt9vtDJw2X0ujdKHvgpuFc4Ng1kP5lFFfiW4fRJi5tzv1fUR48
 RljohxYQ/KiOfi9FP/o5Jrx/SBLlxSUJBg59TAwHPuDJzikfeEQ/aG5yFWaCvHsfl8Fj
 kaDfx23Z6erdRu6WlBKZEQ00w7SMk+LjzTIR2Ljq14siaaVUqwuT6HyGHbw2UhkhUzX2
 1OuDXyBvzWf1pvM/pP8PLZFEx5TLVoLiRljiF2cGh/B+DuijPyq+D6xTnTSd72ymJADB
 bZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097832; x=1685689832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhQ4va+L9W76HQPa92crHAm/u67MMsKKHsaZ1OacYxI=;
 b=NsHu2PmVr1A01LQTAewr5pM1QM1jxvCsczq5doa+fvf2Ule5kIpSf64xxcqjwuPypr
 +fGBetkyzpZNOYZSZNzScqIemLS7qoiSvSrAtWg++POkO4hbB8YbJs0VmP8asMfUtQN0
 5odwx649ethvP6iRYRADyzI76672vI5Jz06PmiwGSazO9P9ofOR0XlMS01R0l2Nd/1bz
 nT+XEYeAabTn5bocOhVs/MxN7gzvf0xL5LyLT1RRbbjue7vnCxRrmarcIcyquj8rzko7
 dyDPPux6uDjFWzJn7GZGEcwq2ixlRBv2dWWvrwnejHXD1KaN7E7vu6RhDcIHW5jWF1T1
 aNwQ==
X-Gm-Message-State: AC+VfDypL7Q7tLLSz8V/7rqEZ+R3omSIXiLJLKyZRhJQNbjY9BaTSQAt
 FiL4GvfJGCxBBSRBvA9t5GZ9QQ==
X-Received: by 2002:a7b:c047:0:b0:3f1:979f:a734 with SMTP id
 u7-20020a7bc047000000b003f1979fa734mr13807508wmc.11.1683097832611; 
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 46/57] tcg/loongarch64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:45 +0100
Message-Id: <20230503070656.1746170-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8T+7varRRIMe

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 62bf823084..43341524f2 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -826,6 +826,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -845,7 +847,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
+
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
-- 
2.34.1

