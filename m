Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4302318ejc;
        Sun, 26 Feb 2023 21:52:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/TIK5cpAgntVS/rs3pKHWzR9lAEcV4e7DxaORpFsZBV60ZcUJ2ONwOXjX+w8KMPCQbEPbU
X-Received: by 2002:a05:622a:1704:b0:3bf:da95:da89 with SMTP id h4-20020a05622a170400b003bfda95da89mr2801601qtk.54.1677477168402;
        Sun, 26 Feb 2023 21:52:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477168; cv=none;
        d=google.com; s=arc-20160816;
        b=XrEG5BOVjMOsuV5t48hRFoOvsiA6Oimy31oR3/7xk1N0zO6w1WX+XjSz2KhqRltdoo
         d8tjWs/l7Yfia2t46xprwNj8n6xQ7g7svDGOAAsSOEc6B30JjdOQHG3UY2O/xwbid3mc
         O+xiNcPIkvLSuz6OsLgtlXJy71KCFbziCeGartfz0h34RTOiYE5AmVVmkwEXFUenvxH8
         zWx6FrVwvkQH4p9XdIa7ewaMgf9lZXQWpkn3itCkndElzGC4ktXcyhp+1en7+hwFd8/d
         vuFZukchhh+L5D2sf5fpCPo33gGmLVbz/WHi1HUuIPbtjsdJbziyFgTQCMotlm15oiRo
         am2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YWyB6GQNgVYVxuAOGEyoKh6Pcm1Ty+r0BVfYb9qxS/M=;
        b=ZJrxtsduD8CKbIlTheS4MOHA6N6Gu7AYpkM5n+Cth4eK5WyE6LniJ8M8jVweP70E5X
         BtVty8wn6HllwQGZr8YhjhdeI99jJBAFvYQwBWORDMbE+oZTGQBbC2Rg5fXHURzDkFUG
         JV09o6MYoNtq9iSIkuVNZJyc9dU4+j9ciAdlAq/kHAR0YuvXPrDT9BM93/et3EEsHgLY
         pGp7O6NOksf9Cwk8jjJW66tcYoz6RbBTnHiCEOudkCtbM0o7GpkyCJFIy2uVVwAlJ+K2
         BnoUBV09XN60u8AEjonGmlTB/XBvi9pNeT49hczLNOpO4H9X2U97MzkDdiH7HveFmB8q
         MfFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EukppHBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u39-20020a05622a19a700b003bd0eaf04cfsi5968613qtc.401.2023.02.26.21.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:52:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EukppHBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWIg-00051H-G6; Mon, 27 Feb 2023 00:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIS-0004TF-19
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIM-0004rQ-S5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:32 -0500
Received: by mail-pl1-x631.google.com with SMTP id z2so5528949plf.12
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWyB6GQNgVYVxuAOGEyoKh6Pcm1Ty+r0BVfYb9qxS/M=;
 b=EukppHBPd8MCw6RtCfNX3p1XFndx5p1rr2qQ9UOXDXvnMBdEtqWyW/5tTegUSwh6FR
 utONsUUC1TVC70DZDHmIAYYDE6Gb6PoePLCZ+4BKfqmI/Fe4ne6UqzdP+WHjeCXKfM2Q
 jWohcY0kBUSl0RgSedpz5PjIw8cyVCBstkSrr+r8Q6Zm8XRZj6v/6VPswbVYLu7bb5Zo
 ++1hOM8yOxfmdbDCT5sBOR8UZDnVVZNVa7qnNImiIpCLFr1+ydkLaUnmR1shnsy2e1p6
 Gi62FtzXacX+3vkBlAS5CPklZCFUEQCByOCNIbykTXLykIe3Kps8b8wRjfF8IFRpy51l
 xaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YWyB6GQNgVYVxuAOGEyoKh6Pcm1Ty+r0BVfYb9qxS/M=;
 b=vdLE9b18RSYtook3ISQS+EjnP7VFYDwD0mz7gqI+Fc7lbMkAhmE2Fey6Dw2AgbAICG
 OoEzbsTV3h6pidMBIGhNvaG8NPeJQXdSaU+7e5KYzH5KjA0hqvSMtIVxMjH3KiNjCQCI
 uH6iNGR6sA0jf+d54Buh6UCSrfYxXc5jke9Z2ajW9dUqPNzIh1zMOs+Hm4wYZep+aW2i
 jldP2Q/R9JRivHgAvP+bpFUUnf6NroYmY6B+rEX4/ZfqaPoYIm4KLEmwKpfiDnPvOnpT
 V2osVzjBZBYqGAzp6zgN6kNsyQBlWoY80/cKOVdhTWCXIy3I+yp+YZs1mHzLP5GiGr01
 fhVA==
X-Gm-Message-State: AO0yUKVRq9n+44MYmzQTpjAGzU4Wn4LTgVYvaym3eV9h2Wped907ujqV
 15lCweZewVl7ddDnqmrpGekFCXesq/1SNXTKLuA=
X-Received: by 2002:a05:6a20:938d:b0:cc:d20c:434f with SMTP id
 x13-20020a056a20938d00b000ccd20c434fmr7510407pzh.59.1677476610033; 
 Sun, 26 Feb 2023 21:43:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 17/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_pred_assign
Date: Sun, 26 Feb 2023 19:41:40 -1000
Message-Id: <20230227054233.390271-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +grpZSgsVY1Y

The allocation is immediately followed by tcg_gen_mov_i32,
so the initial assignment of zero is discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index be979dac86..760e499149 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1743,7 +1743,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
              "Predicate assign not allowed in ternary!");
     /* Extract predicate TCGv */
     if (is_direct) {
-        *left_pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *left_pred = gen_tmp(c, locp, 32, UNSIGNED);
     }
     /* Extract first 8 bits, and store new predicate value */
     OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
-- 
2.34.1

