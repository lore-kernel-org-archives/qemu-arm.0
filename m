Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1540114ejb;
        Sun, 11 Jun 2023 09:02:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45yvl9gUCl1CM0GM9HdTvVrVtRQf6H4d5H9A7DSazIT+CGQTrDs9CBpIc2x1DyV38GEEu+
X-Received: by 2002:a05:6214:528d:b0:62d:e82a:1146 with SMTP id kj13-20020a056214528d00b0062de82a1146mr1724959qvb.42.1686499363822;
        Sun, 11 Jun 2023 09:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499363; cv=none;
        d=google.com; s=arc-20160816;
        b=CqbVTb8YdBCtGiTzsCJpxeOig4UWUFi6+UdQwS14DDNiFuKw50DhDWLA0hi1RdCnsh
         D4RO9HF9rhKIB0OTHux4G1flabTwtgIBn7rqx0oVPsdJ/2ZXBhaz7mZfjkTsaBz9j9FF
         ssRhcRFsy1ykufiktTziGZSbeE/NCt/yGC1JZJirIJidT0bylS38NT6NgPYIhGsteeFa
         4OYAk2txVKrKAdLhhpZG75hPsgk+Ac4iRnBl55OyYrNB5DKDNPmXNC3wik59zktORMZS
         IirDdflzZjdLlkNpp8LzCrUfji9Zl5tJuUDH+v2TxRNjAjTCsnIj2KkhiKj/3hKbIZb6
         rlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3mwJOChiCQUlVNSGMLtjTUS0WqEV7jHFVk5J5OdBzPw=;
        b=k7L/3jtVjAidoFlg3vEAz30ciBL0KKsbWq2HIaNL1LFyGOXw+J0l3xGFVGJffqsyMy
         LjqmHt4DEC0zxVUJJWvlz1Src5b8fOoJ9DM5u6CT8F6XyULMNZfsWAO8gUwrJLDOr2iw
         ekIAV8bYiA9e1/8sCF9TMUAa6qWLvkfVFPZIEdjAxgzJKSsCAnLcicWvzt91Oxva4OiF
         cCuliUL/j77U4d2q6SCg9T3VEMouq3WH8NFJtMrLqnEM2fylAovSXPtrsWTBwfAbyEr3
         6wpPGN3zumluGnZBXaFeStItR2sife+KW7o4pBKCpy9cnyQW6g8wCyrFrSTDimi1xiZn
         HBug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WD5Cf06B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a056214202400b0062de9465196si637364qvf.346.2023.06.11.09.02.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WD5Cf06B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8NVV-0006IT-EE; Sun, 11 Jun 2023 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUc-0005os-St
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 12:00:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUa-0000RD-Uy
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 12:00:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso25478135e9.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jun 2023 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499235; x=1689091235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3mwJOChiCQUlVNSGMLtjTUS0WqEV7jHFVk5J5OdBzPw=;
 b=WD5Cf06BdxEp5lJ9UcEmQwHjtRrPqplWvZXpeOrqx+O1Fws5QWSc9zINhHoFudIYV5
 bSuM2wfH7JCskPftP8s2lXh220Hx2vHtbTH6QCGdCHk2V4PvwwXj/PwxTpeCyBzQSIvB
 mcV6t76GA2oYI7MjBlW0w93iH9B1jkdrSEqkbOLqQOhYVzNPNl2QIR646lRWkVNTKLus
 LXpLBanNCQJbsEL1UFwWRUyLWPeBtf2IF6BIuLWE+N+1VkVEDqX6gosMrFsYpDpS8ggv
 F8Hc0tFIOOrE+QJ5+1V3sczmxz3O+I2qZeoiG44vAn0sI5QouGtdIBuz6GvoFvqwTevD
 wWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499235; x=1689091235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mwJOChiCQUlVNSGMLtjTUS0WqEV7jHFVk5J5OdBzPw=;
 b=PBKe7l5/ky99EiFKibXeXYphE0bo8AQop8K2ibeSglAVo3ayoSpxhOfBSLSl8yc6b5
 fUOIRqphn4nsIwMVOg6mqJ7zOb5ouiHZFeBHYPmRsPYOVv9nzBHGSQIZpaMTvCoVcDD2
 p0LI0YaLEDE90j4dFjrNCBc5NxHjn89nllN/PRh41jTnosmmmz65ib4Gbql6EdHsKLtV
 /jZi4rn+YVUvQX4CM6rlhcCOGdld3GNVjOwS8DdQe8vzVAINzD9Pi9zonA7UbNHsV1FR
 wwyeOjmRFCKHzwU4G51jluK7qO6em6wzXk8xyvp/+sb0ERySVCpdy5blVYmTMVLxlgjB
 LxwA==
X-Gm-Message-State: AC+VfDzSaDPXCtqH1HqfAcGnAliwdUy3V1KLMQ0NkubSsIz981d2Gt9H
 UBiqnJmf/+W8jIznXrUNLwLMtA==
X-Received: by 2002:a7b:c047:0:b0:3f8:1b55:ac08 with SMTP id
 u7-20020a7bc047000000b003f81b55ac08mr300586wmc.28.1686499234938; 
 Sun, 11 Jun 2023 09:00:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] target/arm: Return correct result for LDG when ATA=0
Date: Sun, 11 Jun 2023 17:00:11 +0100
Message-Id: <20230611160032.274823-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ycNF5G4bw0rp

The LDG instruction loads the tag from a memory address (identified
by [Xn + offset]), and then merges that tag into the destination
register Xt. We implemented this correctly for the case when
allocation tags are enabled, but didn't get it right when ATA=0:
instead of merging the tag bits into Xt, we merged them into the
memory address [Xn + offset] and then set Xt to that.

Merge the tag bits into the old Xt value, as they should be.

Cc: qemu-stable@nongnu.org
Fixes: c15294c1e36a7dd9b25 ("target/arm: Implement LDG, STG, ST2G instructions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 246e3c15145..4ec857bcd8d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4201,9 +4201,13 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
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

