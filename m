Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp477692ejb;
        Fri, 9 Jun 2023 08:55:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45wrsP0bHkL2LQpU3jUbB9aH0PIP2b7Bb8jqIyxadNXaQmQzFBEjNsga8EKDy5ulqhKwoD
X-Received: by 2002:ac8:7e88:0:b0:3f8:6c15:c3a5 with SMTP id w8-20020ac87e88000000b003f86c15c3a5mr2253196qtj.33.1686326129351;
        Fri, 09 Jun 2023 08:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686326129; cv=none;
        d=google.com; s=arc-20160816;
        b=xGk8aGk+whKsOfmV8nnUHY6pUg3+1klQg93MLpGyweUhZdL9271bzM8Ajzt+OBYHJt
         9LsMobkSaW3Fn6EbAHar/rYHVr9VU8lsPCisvIDXZOq4JCsbf9La9q9Wm7kCnca2LXgA
         YT55NFuCFEDo3x73xsUgKswDbn0hrkhcgfszj77Aw5N73SwD4TEcuKJt1O4YRfKolpI4
         abALv1Rq2dzbg8FQsu11YWDeagNu+ZGpuMWMJ6LP7b2AaDFzK2UjFnQi2CkOesVh5qJq
         t/tNF62Kj4+bqa43GrJpchipAn3SPQzg0y6nzei7AGiAecWa32DgLbG7m8buBAZ/YrGS
         ksnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gzyK1+R1Q0PBbWpAgX7HkHDOH+bFjjAYfW6YaQlCD2E=;
        b=iRhp3A6go9i37eDZzaSg7kDYVpBGcJcG8iC2STsh4wIZR4ZrB2aGJVxnKk0v8crU3m
         TeZKs91RmYJMKOdGcDvZcpPEwyxvGb2ru63P3ir1jFXQLvEFGFROzMdaSL9hz/781j8X
         PFWAlFWYvmN/8muCV/ReKJcR8w45Z8t84lF53CnQV5avn37OrVQobd7yWVDy6h8HUU2x
         gOf/V+HHbxwccylPUONol9drzi4rabKWyt6y7UgjtZ6BUQlMtDevCI6wG5UYKGBqBWGN
         A5dYW2OP6YyjT6lN89gW2GeuQ0kjXVwNE8Orc9E+6GBMQjVDddgLWLoAQe7S9qxs00SF
         Hs5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9OOa69o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac8580d000000b003f36c78b040si2274497qtg.397.2023.06.09.08.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 08:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9OOa69o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7eSH-0001la-Ao; Fri, 09 Jun 2023 11:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7eSB-0001l2-76
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 11:55:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7eS6-0004wG-If
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 11:55:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so1498292f8f.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686326099; x=1688918099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gzyK1+R1Q0PBbWpAgX7HkHDOH+bFjjAYfW6YaQlCD2E=;
 b=L9OOa69oHb1k9ANzMZQXMiQZwzh8/3t2DSlz9zLXYsph7ulDJXuRW2o7lsKWY5kUV3
 9Ki4K2wA8AGoB9rUkmaR3LFbT9wH9WZCwLX/4XowVKNO8PT4HbjpNMMmcwWIF0dKl6vK
 5ObQKvphiQFF43RctanL04A93MdNPRSn7x2uD+FsdYVFxc8D+1Hwzl6Njc/+kv7FQRbQ
 qPG2ojgYc/6tpQH4cTfAKQatfLkoAUleVyCEEo0DVpgAh4V5FkeyHZFZsfFSgg7fLzx3
 p9gMpKc5VDVL1XTY4yWH4nFo6JavqkMh7vnsLISmgpMtz4SHyuYkFWkdCVDr6kT0E1l6
 teMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686326099; x=1688918099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gzyK1+R1Q0PBbWpAgX7HkHDOH+bFjjAYfW6YaQlCD2E=;
 b=gI5nqe9UxpuLeI/8wGOv9TfQbb7i8CrnW0D6dLQYCLnCO4vvLG+vNmIfDP6uA2F/hm
 UoZWEiPwwykx43qQftf7ytLtaWFsQbzsUX3L9NKI0YsQVtwC3ZAgEROneoLynyequN+k
 yhMeNZaavEzZBKhgJCGSx8ewbK3yhhVfIO7yLTChCK3Usb1xrGTC9KSrZ95Wsu1NV7A9
 qM8omAdNqrSDh2YU6XD3KrjtWTN3PtkBnXt1UZBws/2rZEyNhOm3Z32z1jby9C+ptd4z
 rOsOnIdfBsKlcFzzToQXCkwks9vif7h+Ig5rAkOjZgwziN2J2Fn74fMeU6JtpRkJlt57
 CJZQ==
X-Gm-Message-State: AC+VfDwDgqFeos6XktXF5OQ/k6IMwHzyf/TFajqU39LaLkxxTl9x/O/A
 tWfTmEE11IltDqI6419+KpjTrpJbR4Iu60VGXpo=
X-Received: by 2002:adf:dd8d:0:b0:303:daff:f1a3 with SMTP id
 x13-20020adfdd8d000000b00303dafff1a3mr4556477wrl.1.1686326099189; 
 Fri, 09 Jun 2023 08:54:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b003f42314832fsm3097686wml.18.2023.06.09.08.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 08:54:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Return correct result for LDG when ATA=0
Date: Fri,  9 Jun 2023 16:54:57 +0100
Message-Id: <20230609155457.87848-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: saoDi9JcduwZ

The LDG instruction loads the tag from a memory address (identified
by [Xn + offset]), and then merges that tag into the destination
register Xt. We implemented this correctly for the case when
allocation tags are enabled, but didn't get it right when ATA=0:
instead of merging the tag bits into Xt, we merged them into the
memory address [Xn + offset] and then set Xt to that.

Merge the tag bits into the old Xt value, as they should be.

Cc: qemu-stable@nongnu.org
Fixes: c15294c1e36a7dd9b25 ("target/arm: Implement LDG, STG, ST2G instructions")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted this while I was doing decodetree conversion stuff.
I guess nobody runs with MTE available but not turned on :-)
---
 target/arm/tcg/translate-a64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index aa93f37e216..9ead91a450b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4187,9 +4187,13 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
         if (s->ata) {
             gen_helper_ldg(tcg_rt, cpu_env, addr, tcg_rt);
         } else {
+            /*
+             * Tag access disabled: we must check for aborts on the load
+             * load from [rn+offset], and then insert a 0 tag into rt.
+             */
             clean_addr = clean_data_tbi(s, addr);
             gen_probe_access(s, clean_addr, MMU_DATA_LOAD, MO_8);
-            gen_address_with_allocation_tag0(tcg_rt, addr);
+            gen_address_with_allocation_tag0(tcg_rt, tcg_rt);
         }
     } else {
         tcg_rt = cpu_reg_sp(s, rt);
-- 
2.34.1

