Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4242636lfb;
        Tue, 8 Dec 2020 10:14:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuUpIRHi/3qxvUE1k0bw1Wp9Hto/tGjpGGcZC6necebDixyyJrBXQy/Y4WzfnrbpkeHzR0
X-Received: by 2002:a25:b812:: with SMTP id v18mr35620035ybj.63.1607451277491;
        Tue, 08 Dec 2020 10:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451277; cv=none;
        d=google.com; s=arc-20160816;
        b=BpHvgLL1V38LdnKq9wKfdydCXP2S6K10+tPvfpOo4GFPWJi4emSowSr/p7LyL16hUY
         mYodZAo+vWhkVutxdOe4wksDP4rK9hT1+54F6VDU86tdD+3G6UZdVeEX8KOHvTLa2lTY
         kZAZO7dOXcpxC9njUhFPiaW1azNTJ7Fbtc1PBsPZnmFdQOiAeFaC5tRlY803IspTzoS2
         8qynIq7iSZ4UobogIhDuU+mtB2mOfHyifa2yDDWC0e2M2h93zb/DpUmi2V6tkcR0D51M
         /C6S6nO7+fO2zsqLyatE79I6GgDcr3rhe1z/vWihosCsn0Z2bIr6EbU5PDT8bCFu6sFW
         OmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7eYNYi6nRqgOF9U1+OBQOhH564yszaE/ArldGpU6S2Q=;
        b=twmLOEGP5AeaiXVTeL1G/6BRAyEmGxa2uZLtyXoao0ZjkhNvD7zAWISjRu0QRWmXe4
         Sa7EOgsubcIM0Sfl9y6j8SlYu23i0SfKCC9SqbNxMyZ3Q1Pzo7JqWfvHvnpyHCgkG/do
         pmG2D+kvoAop9Kker3jXeQ+oaeukP5aHMI0H+vhC5UdA2u5lBXjfBpJURYo1zEjoYD2n
         weEdeMxX8M4LHiirFkcnxwNp4lcWO03Qe/YxgCGLRUkn/tK/tejpXVQe+eRN0vHFgZtY
         7nDm1IMhWYrwKq1GhSgwueC3jdcMGQ5GAtt84FvpfdM14hiBWEududWQDeVUqmKrhzpd
         iFbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tQNwyo7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si11765947ybk.374.2020.12.08.10.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tQNwyo7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhVT-0003s8-Dc
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ0-0007fY-DU
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:42 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIy-0006NL-Qg
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:01:42 -0500
Received: by mail-oo1-xc41.google.com with SMTP id t23so4231295oov.4
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eYNYi6nRqgOF9U1+OBQOhH564yszaE/ArldGpU6S2Q=;
 b=tQNwyo7r0z6wULhVOktBLG7Y8qLwEnzk1uU9wbIPFv+Pfw8ucbNNDvFTvVzTW8umbS
 6EzKyp/lAeVa4A19uJ5qvticHaDwUACwQY0t1U773b1DZnkfJtnKmMyjSePIL1ZHBKtm
 M0+N3dwSetsgr38wvO/nCY4yI4/7FHKz3TLGA9B+8nP95phRMHDP1MDfNUueJ0q+n7R4
 2M/c+E+IKF4cHI4I/dfY7rgp4l/rb6RpgdPODkrELOjHRIu9StcKld17KI7ATONoW1sa
 fRkZeirVPOKJrfheyXinULlnJ6f/9RJ/o4AhvoxDYzDBuV7yhR+zrn1lR1VJpJN1eyxb
 WoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eYNYi6nRqgOF9U1+OBQOhH564yszaE/ArldGpU6S2Q=;
 b=mR7gyGWy9cWviCyhkc9DHW5JCnR2TqI90knwTipMR3azpD3YP1g/K6PLwuQ+0LhzX3
 ZJZuzP9qylRXctNwYsBmYjENaaXHJkaiFPQDQd2ln8JQ33dv6/tpyvnMh7H9L+zS5uGY
 vA7lv+uaXCMwHS2GOnKzFR24vCR2IZDa/oYAg2D/UuFbQMuFGmeYNk54+chVOoPsp/NG
 Mwaw9SNYU07QtPrKaOOieNuEJXwaKFTpOHpY8Y3QaKEE+GFSEgBTDSQ362rTyH8nN4CC
 +0hA0Bic2XTd+TLJ4Ra5jsTuBZnUJbI93bMCUkL3Tqx3x2bM26Kmk1ornND6vAnh2O9O
 b2/w==
X-Gm-Message-State: AOAM530GsxDySj0hS4QqcZZL+smXM7xZbF3X4lfyaPIjc9CYW91TupIY
 AAUVg1JCJhZOz2QxCzKhryMdOA==
X-Received: by 2002:a4a:9c48:: with SMTP id c8mr17342328ook.84.1607450499646; 
 Tue, 08 Dec 2020 10:01:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] target/arm: Enforce alignment for SRS
Date: Tue,  8 Dec 2020 12:01:05 -0600
Message-Id: <20201208180118.157911-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnJbtwVoQZZF

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a8bedbb45f..c7e01ea73a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5134,11 +5134,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1

