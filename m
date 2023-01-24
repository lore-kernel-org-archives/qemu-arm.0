Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294824ejc;
        Mon, 23 Jan 2023 16:02:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcSvpUfyyXffHSYzoXuQQqlMMZ7VALdwuySRLlwOj8fmCL2V3t97+xOTUFEEA/p9q9aNDf
X-Received: by 2002:ac8:5150:0:b0:3b6:3030:33c0 with SMTP id h16-20020ac85150000000b003b6303033c0mr38840769qtn.58.1674518557147;
        Mon, 23 Jan 2023 16:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518557; cv=none;
        d=google.com; s=arc-20160816;
        b=VBHz7YUE5XRl52E9HM67Q1gfZD7A+vG/i8uNllWI+Mp/mLbLAEmRF1fuDwOsL2duLu
         A4yHiLpiksLJ09hM0nMhDqv4zMjokaEQyQ+eD5rNWnzB8yPjEX4iqqU0eh7fyGQT6mY8
         DvpKIvAzQ2jdjgxkoJqmI9jVXCzQaWfz8mTVX3keju3fw0ybNTMssw+JlWymRslKUtJB
         LdIbdBNJddqftPsisahfQgGKnG8YMvUhF0X8pFN3ByXviVKut0qYJnDFAQyUnMzMOsHl
         pytqNWlyXp+TJZKkSIfoUEjU1bfFuTr1T2yeiyfM/Rmd/8LVlTBoYQj26XPC04Mik5pG
         mlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DNS5CavC6F+QLt2NSfLD1RbK1wX4rSbKBJ1kXmgpOIA=;
        b=KLJFxa6xZDTyDmsFsNHTbXiV5vrSIgJ/JuCA6Z/zP6F7zIMb9KzMExtvFlw29sjwev
         TQXtutPShsLE35rqqVjsOEheJKSmcUNf6C8ZLJsF9YkRSarLI4NgWAkeDQ/tSGH+nuvW
         tOZGYN9+wtT3XXg+mitWpRNa08xiCZxBvzoTnDiageuy7EzmlvUpHnMfj4UK4EkRpCVI
         HDPKlKFAkMbR4daNigUzkNkDDQLaQKe4ViznlD9l6xxgbdqSQygOhxkhsDFu24dfH3iu
         Nhiee6bQxpkT+JQvM+VRNr8IeLZ3FOsPkw0ccaoSARIzZSayBU9RIYoDdK7KTZI8nMSi
         Klrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rt1Wx/kB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv27-20020a05622a0a1b00b003b64d8ccd7bsi330294qtb.668.2023.01.23.16.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rt1Wx/kB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6ke-0001MH-81; Mon, 23 Jan 2023 19:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kb-0001BI-Qp
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:21 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kY-0001yw-W0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:21 -0500
Received: by mail-pj1-x102a.google.com with SMTP id m11so1387642pji.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DNS5CavC6F+QLt2NSfLD1RbK1wX4rSbKBJ1kXmgpOIA=;
 b=rt1Wx/kBl5utOTqE+Kg8fZ9T4MeJ4TgpBe1uLkW+N11ZZ+81cIyUbkE0tMFU2jQk9G
 6ArR2fsq0aNDOUAhCB1y66tF4rcml5fjEwJjnkoFCsz11jGh+4DCcHwRpw6JzU7cf5T8
 kPobgi50U4LQ1JzHwVCYVC7JlkJtvxZQVFl5tJxN9Pk3lhge6wyc9jlHUaVhAX4f9cWq
 7jg7j98/0qxFJSXE8Vjmjd6sf0jucldpfiBQDKa5SBlK3U+pPDSk2nqBWWiM3gL395Ut
 Yj8Ry+4/4gg9zNsEACfcWzKaR2kNt0U0q13uk9yp5Ie9yzaLUN7T3DPqnVETKmaqel/j
 Yhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNS5CavC6F+QLt2NSfLD1RbK1wX4rSbKBJ1kXmgpOIA=;
 b=NVdGn0KHGAiozqOze9eyL3aVnkpleI4qpFjjr3D1wLGqBDFg954ceFxLZDr5vFWl9X
 FJlMjCr6HcHgUG8n+0+ENWtjZ5N201+4lD55teLJuKnqX0wGeT2U8GXdGg5x5hA3aJPL
 gOwnMdugwttTUH6OUvqMIzkCm5Tub27M0yykSeezb8vfbcEi+cGwCPr2wCSr85mLDEXf
 8iA4LYSbJaIpuQJ0nO+0siJYWvngVsl/NHEWZXb+5ftLYsIlH8v+MMyftsZlMZEtZJtY
 gLJHAX4otTjNUI+cbyaSNxAN1aNw2d9jnc2aI/aB7J2oYmk1TkXjF+UDA8ifpwVS4OWC
 WGTw==
X-Gm-Message-State: AFqh2krS3o54Uo9ajPR9o9xnJ5Zl6r6ySkhyZQ+w3+2OpzQoOeLP2jVK
 vHbrSBZsMyGtmQdlLMRoMLVSTI3Ge9p44LX+
X-Received: by 2002:a05:6a20:b71b:b0:af:6f28:7c42 with SMTP id
 fg27-20020a056a20b71b00b000af6f287c42mr25354464pzb.62.1674518477525; 
 Mon, 23 Jan 2023 16:01:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 18/22] target/arm: Add GPC syndrome
Date: Mon, 23 Jan 2023 14:00:23 -1000
Message-Id: <20230124000027.3565716-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wqGN1V9SXX3C

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 73df5e3793..3fa926d115 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -49,6 +49,7 @@ enum arm_exception_class {
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -237,6 +238,14 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1

