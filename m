Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp153919lfb;
        Tue, 24 Nov 2020 20:07:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye+cdL9/wHk6rIySgNEI3jzLf2e5GQdRMd+wMOgcrraWUjuVPQ2MLG4e+pdjcXOH/n7Mfn
X-Received: by 2002:a25:75c3:: with SMTP id q186mr2152756ybc.460.1606277277813;
        Tue, 24 Nov 2020 20:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277277; cv=none;
        d=google.com; s=arc-20160816;
        b=VzUdCdtcVToikbEXaIWhj9U/h1ARoE7xu8LkRcIqXDtcbPi8/TQnYNrjRXXIKQMKGy
         fqiukjrk2OorR1/I0t9fVb/7dzdDg3RHLJzL+3ctsmanUg9ic76dC2bp/FRn6M1JKD4f
         RQl3j2Lm0BibaamPKn7/P9WfmaFV9Ux8Qk216t9zPU8AjdeEwg1Dvme9SjRvOpk5dmvE
         RTU70rwuVJ9bR/Rb2vPNSFM5Wv9e52ztafuzEJk1Ibmqnz3nIOZJHbZFlbno/TWy30rr
         ihxWZFnNiRpdsEh38ev6Y2VDv6Ko2llGRIoPigp/GAxSyTBZ8nkdDNfn9VXjO7levvm+
         UeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y78iUWT/hOzRMHIOoD0erIhCqyR5Mxb52awjOekSD+Q=;
        b=0zhxI4BTLD+EtBIcx9339iE5sFO5N/tdG3L0OGQ9BCffpHMzE2IYomCkcmmfUQoI44
         gWycfn4EUcHCj382ReXU0xV4jPP9RB2JobJZquMJbBdWSAsLCQ2ioWmXjtC3JrujvI7m
         smO70YcG286ArWpRr9SXQi30qd7fSOTP0QXzYFgMNQXS4DpGK5HvKEGVmbfdlpEDWbNm
         mh3VTcMk7V9c8ZAvKgsY0I3E/hrM08pay3sDhaPtTM3vStYLQjNbJxgXdxf0tNQxijKx
         r6fcJ19FK/k06DhxFixH7b36/6GTItx9qH16Wk2CBjAQwy12yB7iMxAw91ieowW/MPSq
         TnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC2RLLNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n63si973417ybf.485.2020.11.24.20.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC2RLLNc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm61-0004r5-6v
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4z-0004lZ-4z
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:53 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4x-00062T-Om
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:52 -0500
Received: by mail-pf1-x443.google.com with SMTP id b6so1087784pfp.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78iUWT/hOzRMHIOoD0erIhCqyR5Mxb52awjOekSD+Q=;
 b=bC2RLLNcAclmhM3NQj+ZQwLRNUosmXiAPMpXDQI7MDU+mk9yI+25CcgC7pfmmcSN+k
 L0dtygWruuvqMcy2vama8ceJLHZwDrsWHTAlm5cuvrwuefhl1Fkiezv2JQZ7HrjXsAmP
 8yBg4q4MO2ygWD7R+WM4dPuxwRuVhHrWiS+EDEPuOOBxy/MPH4l21BZ7zLBen1sbDj+1
 bZsCfoi1y3J4m9ncRSVOjYBOZz1WcHrg4RcNLsGwe4nf9BcfaHpkPxaw0anqeqqwO2o4
 c9rDNmY9r6oXSUQxWy6Dh2u+EVq0WJ+QWGOmlCUvDlOHdXIoTHLOgSZmrfiyozERbcXz
 6fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y78iUWT/hOzRMHIOoD0erIhCqyR5Mxb52awjOekSD+Q=;
 b=MF3WzvO8TpOGeKliF8J7Wwua0VNtBeiOnJh0xp76fCmpYiBhOewo1ZPQ0bYqmR62QV
 G56qTgZj3txGE1z6nlP4s0yrf2dpjiq0X/bI/0QgjUSVEVwa0zoZ0jX86M4miMJQsF2u
 DJ3vw6SYBQkXI0H22Q8bgurT0J8PLh8FWY4I7utTxSd4p+ENbxakWnLBTgACLftmxXNc
 0M0YPl29O31DCjyFQCFlmZfS8Eeqoa0lf7e07o192aAa8z1K/qqN7hVfxG9aOiIQKaRU
 WYEIv8zzD2ILR9xxNFNo7LiihuhP1XZY1Gb2YlcXL8/qKFG0nuqmrhUp6uT9hDk9e1xF
 kHgQ==
X-Gm-Message-State: AOAM532QJTy9BFvzD3VDOXGApHcGt6FNzUlyJ1GO6WujVU06yhRl5Fkc
 3iHXrjAh/Cy5Q3eotpAPSWEAyFb1re1rJw==
X-Received: by 2002:a17:90a:fb41:: with SMTP id
 iq1mr1860037pjb.140.1606277210180; 
 Tue, 24 Nov 2020 20:06:50 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] target/arm: Enforce alignment for RFE
Date: Tue, 24 Nov 2020 20:06:35 -0800
Message-Id: <20201125040642.2339476-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nIxxmPlwS5kg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fe4400fa6c..4406f6a67c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8250,10 +8250,12 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1

