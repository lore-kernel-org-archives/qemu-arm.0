Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301647ejc;
        Sun, 26 Feb 2023 21:51:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9b0Lkl2zWjvuhu+eptmDcpQMKsZ+jJmg62KuS44DkXpGvM+dvTldpukKho3PM4ACK6/Ysm
X-Received: by 2002:ac8:7d52:0:b0:3b8:4729:8225 with SMTP id h18-20020ac87d52000000b003b847298225mr29224960qtb.9.1677477098052;
        Sun, 26 Feb 2023 21:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477098; cv=none;
        d=google.com; s=arc-20160816;
        b=cER2HxiVpKM8Son5CEm3ybKT01nVeL7181b7eDB0Ta72fZgu67jKrDkYtmKN2yBHbv
         r6vY5ymIafPqJgBm6nTtARN5oSvwooclhgT1MQFCPzwjUPs6GVoSkZ1Wi3LsMJYMowPK
         4TUB0u7sqsc6WVZFp6cLx+TUrPkHmCbDZ/XA2ueio4d3h8UF6m15jrnwG15pGVFYhBui
         XF0ybQ2ykUKhyrbIySRy5Hl0fvoc+npTgt5lIIztbt3P7x7HfZvx+UYNzlmE6WKzrTk7
         QxDiXsgNoXZ/26j4eAJNy9co4rGqKvk9LxXwzN5BUk2WOwbt7SFjQ5mxT+EcL3p/YTcD
         AulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
        b=bR5OYVQxuvdBNvrMkHWb9bkLPWV2ynfLUqFqHDguf8F/7YE2+yZ/sUuC6Ql4Rilco6
         zJVQE1pJozSyOg/QvwOd3p/g8JN5soG06EwoD3VrFQdVGdfG4ZutvCc/n3Cv+yDuhAls
         A09lGfJ8Dif2JT9knqqmGMc/SzB2htt582ZVAVTZXgvFg0fVZN0hOR1Osjmw2NwfNDs+
         c/ZG4A+GKxg4KzZF6eN2pHbKtdTQ8nKawBrElZcnm/k4Pn6Yj590mu7jyMBfDC2TXpgd
         RmOtACqtvYwIAbPTqwBA4XlcO+auxcKhqjUs9z2mIGzQNJxPVTzRGek4nNDqbqZc8IKU
         3qaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saUlNmAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05622a018d00b003ba260b32efsi5482228qtw.786.2023.02.26.21.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=saUlNmAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWER-0000Zm-Rx; Mon, 27 Feb 2023 00:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDG-0003Tp-Aj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:19 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDC-000315-Py
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:38:13 -0500
Received: by mail-pf1-x444.google.com with SMTP id cp12so2040945pfb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=saUlNmAiPUlLxAbmr2ChMTkrmHqhis+3yd55SQnZO9n3SYyLn03AA3qsUukQ6XjLKi
 bN2xzDxLEM2/L3Lq/CtOYautj55z6KUKYrHpw15LxNV1WfBJmdAAATH+HmCdV7QK5t6u
 CJ4M5j5uHZuG577nzuxnx0yBnhWkNgpKQL68CAXUrBnWp0kbIVlXjrgNdjJYA3sU/7Pb
 6/pqHKifXapmrhsZXzvLb7MtfumR//4fjfAUDE/Ojo9lEynyY8oLBJxavG6+r/PQMOaL
 vxjB0L1OxbmS6pwz0c+6anB5Ff8ECIxKdiNf9qqn6BxCdzSrg+BseC5P1DLpC4Ywhd9Y
 Cfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFzuw10fPpVdZT8YHItC/Ct7hZDecHi/kBTYhZQX5Yc=;
 b=xCxdmVXXgm2O3vkeJtcf2qEk85CJrOwHLqgu/+LHHW3OtQcnEGzD0sfptYR4CsUHHN
 niLnlCTj2GN817RHfC0DEzSeZqBRe+tP8skYGsGjeysA6mLGt5Ux7d0x4xu/TKPoymif
 CcC5xLq2ZJ6j9EH65T/RlQMdvfdhn2TFDYIndjJxf/hi5LL9faYDN1HvAGqyV970kSe/
 L93VlcCHI2RXE6SWFHycT9ugXYfgd9PMK6lbMzl0Dl7LoeIPWw9ikUs8UuQEGuvIdBLL
 JUCDtzoftZ5kRjGnVPXFqcWb3NNEDi6AEtGdXts7mYY1hOnAREu5HnxOs7dip7u7BSqY
 i1bw==
X-Gm-Message-State: AO0yUKWHPln/CFefASPDQ9/nxqOLbzKVTGsQpt7Rjus8YEI2vSiiXtBV
 x4BCSGuaY5UTHjhw1H3+g3xrdQNr+kqsp2Rwx8ltkQ==
X-Received: by 2002:aa7:98c3:0:b0:5a8:4ba7:5840 with SMTP id
 e3-20020aa798c3000000b005a84ba75840mr21645028pfm.26.1677476289091; 
 Sun, 26 Feb 2023 21:38:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Date: Sun, 26 Feb 2023 19:36:53 -1000
Message-Id: <20230227053701.368744-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
X-TUID: 976f0GLwZJw3

This is now equivalent to gen_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index dfb9c65b52..3025040640 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -307,26 +307,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-HexValue gen_tmp_local(Context *c,
-                       YYLTYPE *locp,
-                       unsigned bit_width,
-                       HexSignedness signedness)
-{
-    HexValue rvalue;
-    assert(bit_width == 32 || bit_width == 64);
-    memset(&rvalue, 0, sizeof(HexValue));
-    rvalue.type = TEMP;
-    rvalue.bit_width = bit_width;
-    rvalue.signedness = signedness;
-    rvalue.is_dotnew = false;
-    rvalue.is_manual = false;
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_temp_new_i", &bit_width, "();\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 HexValue gen_tmp_value(Context *c,
                        YYLTYPE *locp,
                        const char *value,
@@ -2161,8 +2141,8 @@ HexValue gen_rvalue_sat(Context *c, YYLTYPE *locp, HexSat *sat,
     assert_signedness(c, locp, sat->signedness);
 
     unsigned_str = (sat->signedness == UNSIGNED) ? "u" : "";
-    res = gen_tmp_local(c, locp, value->bit_width, sat->signedness);
-    ovfl = gen_tmp_local(c, locp, 32, sat->signedness);
+    res = gen_tmp(c, locp, value->bit_width, sat->signedness);
+    ovfl = gen_tmp(c, locp, 32, sat->signedness);
     OUT(c, locp, "gen_sat", unsigned_str, "_", bit_suffix, "_ovfl(");
     OUT(c, locp, &ovfl, ", ", &res, ", ", value, ", ", &width->imm.value,
         ");\n");
-- 
2.34.1

