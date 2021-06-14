Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2074180lff;
        Mon, 14 Jun 2021 08:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6wR2dV04QwHTZpDfoWRUrqF3ZiQir1AyutQ/xRRQ0x5zh0y/DZfubVqCKy4KyxzznPHcB
X-Received: by 2002:a67:fa11:: with SMTP id i17mr17976919vsq.34.1623684558360;
        Mon, 14 Jun 2021 08:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684558; cv=none;
        d=google.com; s=arc-20160816;
        b=gk7SxsHcu71L7xFktq998T2qWbJxvw+F8tFv6lkoLgimLVjiCdW9P2+km6SEM0qB4P
         RgX3CHeik2F92cIPly1jtSKVXFz3+zESisB+nKvYoGx92OqQgQsLEmfl0I8wew1GHAva
         MVJCGVmVr7MO74/8Uw+7zoTAcvUX8GrxWjFds3YNN5nFVvmTGv77oFb+v74MVH5QqJ24
         ELTZUOlqp+MArDkna241tJ7LymWEz6oHDlwGiigvsRhlUUKe8bodoX+LMewrNCRpUa9D
         3ekwCr2AtZhuOAKdsmUkiDWkCIqjpg/kuiRmy8WL1NcHoB3gZEr4OMjGJKgpmu6wNO3G
         geHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9OglXdG+3qIFM1/585RKljc74ghmEcP98y3gerV6BHM=;
        b=jZe8P+/6um9GhL7c8GkPCG5hJidIXp1FhXoX2HSp2cfsbcrFGYOtfGwnyRjEqwNWGy
         LJ+YLDkDgocnTWFEknLZUT5+bHLrEr/Dw3VqWvnlx0tWIiVvh3NEHlcvRPOqEzPsmtTc
         RsVV+aESy/FtYWX1R5JIuI99OZLyLID+pHiAJDBziuhHah1HPtjDJ3wpKnst/Rm0WJK+
         FJgoDOT++eNcgUuZniW0qi4sV7zSoDuhB0zLeBEWxd5s3JA9rghmS3C/iSieaM5zaGGl
         ke7LSQdkPVy8v0O1hJGZprDSvI0K4XOSxNqKAJb9Yad0R6VqdT1ZG3MzLDxasWpE+lOE
         S7NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UN3NVwIe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si6335577ual.49.2021.06.14.08.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UN3NVwIe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoWb-000138-Kt
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEo-0001iG-Jw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEY-0000SY-AH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id a20so14981254wrc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9OglXdG+3qIFM1/585RKljc74ghmEcP98y3gerV6BHM=;
 b=UN3NVwIeBGMVi25ofnFNnahRUNFd4YrdeZ88GTM5JevXlugH+5PkW8ehnKGgfUM2dy
 /cQIrFgOyIJEjvK+mjE6LP5EpDkgkZ/HbnS7esMmKfO/DYOC5PY9/no22fWDm+JFeUXP
 aAIsX4OYmwSttoVeIF+eyafhmmlzkjIfWDAstx2gKyPbUHnhdn/sLNG2wSfNS+JpdiuA
 jpIzmjFkEFB/B1fZMSjXLA7pTjlj+BsX2JqQiegU67mdXDm/KjQ7crq3KG3ejZlmGUSQ
 wD9TRAqafULU1Vgk9yx9s5Un2MiEMHb77JgNS/FqfGtQok8J4sGNBkSV8WSqu1zndocY
 u7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9OglXdG+3qIFM1/585RKljc74ghmEcP98y3gerV6BHM=;
 b=mOddsSdd7WshNUklJKRWVPkjfM8mWBzCa/kMglzZhFYmdKAt4EMNxEUF3u2RZwy5aW
 5upEtmlQnkuIYGkCiFgDTXjWf/bT14xxq+mJ32jRlOnb+lO7dF6QAULiuiRWAg64hqGN
 uNnyCRJnBOXTJaHUjs+u+Ee1GrD5+4PECHbJm2CMVolZZvRFSTnMCRXbeRJbXbO9liVS
 VnmzPMwK3/reXOeoiAKpmsz3mDYYswUV9yGI0PfXeE0qgb91AwpRUnCeyyHSFXqyWRr5
 XOjtQniXNRnbrv4H4BuE3G9/n6jkSc8wvNhHltbL3x6shNv9rZFvpXD3blDz9upWDvPg
 KH5g==
X-Gm-Message-State: AOAM5307my1UYTf2hnHitvfybymYyKBROGJnxxvSl/kcYQDZJK6ftCCw
 swN2ABf0f7FTOBDA0d2Ws0S3Fg==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr19260135wrn.157.1623683436901; 
 Mon, 14 Jun 2021 08:10:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 32/57] target/arm: Implement MVE VMLSLDAV
Date: Mon, 14 Jun 2021 16:09:42 +0100
Message-Id: <20210614151007.4545-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a0US+k7eKrbw

Implement the MVE insn VMLSLDAV, which multiplies source elements,
alternately adding and subtracting them, and accumulates into a
64-bit result in a pair of general purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    |  5 +++++
 target/arm/translate-mve.c | 11 +++++++++++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0138e28278a..7356385d60c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -152,3 +152,8 @@ DEF_HELPER_FLAGS_4(mve_vmlaldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vmlaldavuh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bde54d05bb9..1be2d6b270f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -145,3 +145,5 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+
+VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 84c67f153ee..bc9f053219f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -537,3 +537,8 @@ DO_LDAV(vmlaldavxsw, 4, int32_t, true, +=, +=)
 
 DO_LDAV(vmlaldavuh, 2, uint16_t, false, +=, +=)
 DO_LDAV(vmlaldavuw, 4, uint32_t, false, +=, +=)
+
+DO_LDAV(vmlsldavsh, 2, int16_t, false, +=, -=)
+DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
+DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
+DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 7052a4219a0..150e4d0235f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -461,3 +461,14 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
+        { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1

