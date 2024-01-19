Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1237508ejg;
        Fri, 19 Jan 2024 14:48:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1kFpeUtV/P9TYz5L2/h9JCr9IV4d/+IXBFafqx8NnW5B7CLL4q9CCu5I1dCFsQ4pFjJi5
X-Received: by 2002:a05:622a:1496:b0:42a:36e:2ad1 with SMTP id t22-20020a05622a149600b0042a036e2ad1mr467504qtx.126.1705704510266;
        Fri, 19 Jan 2024 14:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705704510; cv=none;
        d=google.com; s=arc-20160816;
        b=wYUgVeykGBkcdLgVYfZHAiKi9x/TOW3eZ89R1vHe/zX2thwHjJZOYJsKs3cxancZZe
         NjtlGWmJOuwrxdfDL4ul6Ppx/k/5zVa0SmNr5pWqzJ56T1dMBTsf6QEndUmu2aY5QwsK
         89pAbFTVoIw1lPvasmXCPkzz43D7nUJQZ5HYycigrxO333JkZm3DJOKvO+O7TzgXXNwi
         Ji/Bhn+lahog7y60hpbAva310fscyMyYKcLzMReiAtaMj37xA0eitDWC4+4nHrgtWNEL
         OWTxqy/fMRn5uHqp9SqSen1srpYj7VH765iKxUoeK22oemoxt/BzjPEdymjFMrrU4K8R
         trJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RlF5tx7xWYSxTMVLwpyAF8EB6pJi/TUpAYiS0HlHtDM=;
        fh=FGhvf/J6viukKll+OHHiF0KzEfQoh7e0u+ACsGzuW1Y=;
        b=RhAU1E/QlhqzIEzKbdMZMTvymn8eNlB2tw4G3pD4AHUzuzUhND0XaiG+1Iiowu6MZi
         O9Zyc4wOAp/ThQVU7I2/eu0Sq7/390V0ci3kHVgpxaJ4fEzHJrq2zeqTzyHL1+RPgLtc
         HTPfXjYreDPXCGRhnQ4WHcUOd++OFhD9qb7ElzRm9/EavRD7Rk6EWW6WGtMG3YNJpDaB
         0jIvKNgsTT+4Dmwd3uzI6XH1CfAMTPl/t/ghZsPXyAqQm/NpPuiPt4UAyuP+0RT0CLDK
         hPHcKlvQQYSv6Z60UW+48MzkZjh9ruu0F/WMYu9JX4pKKrVEp48S9dxRU43XhURGrGlL
         Ip0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOSYHa64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020ac85bc3000000b0042a1337cecasi247720qtb.662.2024.01.19.14.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 14:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOSYHa64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQxeN-00060l-77; Fri, 19 Jan 2024 17:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQxeJ-0005y5-Ho
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:47:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQxeG-0007dg-GZ
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 17:47:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so14011585e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 14:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705704459; x=1706309259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlF5tx7xWYSxTMVLwpyAF8EB6pJi/TUpAYiS0HlHtDM=;
 b=DOSYHa64G0b28VBRLJfF5T+VycvLItk5q+drKduqvZZ0EAUP8CqkWv4qsuIHmM7Sax
 N4ldTBS/wwjB7bRwi2WWE//WIFp579AUm2YydPbB6C61kXXiZZg4ZIbSE7oo8044uer8
 nQhdbwXF4UbHQn6Wn6Fb/pdEJllX/ERgFSaX9/nkjxbu3lNW/IsbRbpRKbP2kig9LR9c
 5BIL79/qmqnn67snkc2inia3mB6U+9aNuIcZAmKg+35Xom374Ly/8LQJ7DTIMlYJ+FC3
 2JYcutTecEdTJHBQRvKWncW9YE/0ITqBxq7dnZYR9+tU/oAnBBndYVBpqw6eO3E62+GE
 Br8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705704459; x=1706309259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlF5tx7xWYSxTMVLwpyAF8EB6pJi/TUpAYiS0HlHtDM=;
 b=OQdTMjEDQWNRqEPi1k6FDexZK5JRNf9mRWkpaw/g5XKKxLlddetkQN8IU9U6xQqRcn
 NvkqGEwiTLY4MqqW2DtmIR1mhcLnRrbncw7Ecccmo59YrLb80mAdedzBwWjd94iASpIX
 K3lTz5OxsMWsyp0lwFzDs2jkt5EViVE3c4QOwwq1aHCnZNYnu696TcXTE3NOj90ic/hp
 CGDtDytBo3PuGdQPk/RxRVNv9Jp3g+c+mw9ABGpNKqRG8uvZ6TiU90k1ry9yo7IeMETm
 qBaczLYnHsPYhINb2D+8HtHUghOx+ZwO5DZxbrdnzRp30Dm1mO1jjqOEQVqyMpU+H6J2
 Dj9w==
X-Gm-Message-State: AOJu0YxdPe4B5HnkSKcCIy3mZ+XQ7tkteYFv9/wDfeMv0GyNc0lofdcg
 s9bpKiay929FPVxAuddt2PIsbI+nVDqJwlUEOPfig2C3+d/6OYj+PlBR3knXFuA=
X-Received: by 2002:a05:600c:2259:b0:40e:81f8:2f8f with SMTP id
 a25-20020a05600c225900b0040e81f82f8fmr171262wmm.110.1705704458757; 
 Fri, 19 Jan 2024 14:47:38 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m11-20020a05600c4f4b00b0040e86a4c0b3sm11853619wmq.11.2024.01.19.14.47.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 14:47:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 18/38 1/2] tcg/aarch64: Massage tcg_out_brcond()
Date: Fri, 19 Jan 2024 23:47:36 +0100
Message-ID: <20240119224737.48943-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110224408.10444-19-richard.henderson@linaro.org>
References: <20240110224408.10444-19-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: L3xioG9crfyh

In order to ease next commit review, modify tcg_out_brcond()
to switch over TCGCond. No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 70df250c04..a19158f4ea 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1416,12 +1416,20 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
                            TCGArg b, bool b_const, TCGLabel *l)
 {
     intptr_t offset;
-    bool need_cmp;
+    bool need_cmp = true;
 
-    if (b_const && b == 0 && (c == TCG_COND_EQ || c == TCG_COND_NE)) {
-        need_cmp = false;
-    } else {
-        need_cmp = true;
+    switch (c) {
+    case TCG_COND_EQ:
+    case TCG_COND_NE:
+        if (b_const && b == 0) {
+            need_cmp = false;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (need_cmp) {
         tcg_out_cmp(s, ext, c, a, b, b_const);
     }
 
@@ -1435,10 +1443,17 @@ static void tcg_out_brcond(TCGContext *s, TCGType ext, TCGCond c, TCGArg a,
 
     if (need_cmp) {
         tcg_out_insn(s, 3202, B_C, c, offset);
-    } else if (c == TCG_COND_EQ) {
-        tcg_out_insn(s, 3201, CBZ, ext, a, offset);
     } else {
-        tcg_out_insn(s, 3201, CBNZ, ext, a, offset);
+        switch (c) {
+        case TCG_COND_EQ:
+            tcg_out_insn(s, 3201, CBZ, ext, a, offset);
+            break;
+        case TCG_COND_NE:
+            tcg_out_insn(s, 3201, CBNZ, ext, a, offset);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 }
 
-- 
2.41.0

