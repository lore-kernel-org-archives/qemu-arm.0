Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2639498ejc;
        Sat, 25 Feb 2023 01:23:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9JQVNASRkiSHmv47L12Hf9tFllkN7j6ePw6FTTzEF9PmYq0gJEqeIIQJRbFtdPr6s7HD1R
X-Received: by 2002:ac8:5a13:0:b0:3bd:1bbc:8d8e with SMTP id n19-20020ac85a13000000b003bd1bbc8d8emr21277002qta.0.1677317036370;
        Sat, 25 Feb 2023 01:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677317036; cv=none;
        d=google.com; s=arc-20160816;
        b=c1IAedXwh34h79gEl1cWWgC46k4GK0aXCSu9Q560hRBukaSNItACFR/RNdaGcpmo6g
         qRyy4fyx9I0gvlEhiYAAm16hqPBM8EHsWlfxmrh1CMjPXRr4dj+cfOO2kMJC571tmic+
         wu/cYDnGpfzmsxFSU816uCo15WGYKh+6EeHUzJSu+dd5P0X+GIsp9MyEGvPZydazYedP
         213T1yyHmWS2pHo4Z+1AJ8DJYxg5V44EeaBicOXK+YnAtAreuZXH7Nystlg3NjcyUlqy
         2yeuoM5blGkrh1Dj0QzTQx5S5mSf0C1NIVTOIUemvdlSEvaOjUzFQwdc4I4ui3GCpu5t
         n11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
        b=nWqeW+lr2YU7EUz8jVA+ce0oroEPej3fANaS4z0uuEzLvxqR0yk16dqFEen8cdnWXp
         kL+4YvLv7rlV2YM9u7C4sQuRVTgrnekTp+kghcNiQ5d7oJbqtPPpd4Fmev7u958LUWu9
         U+APNAGrNb4qBB8I/D/zl8w+n4t84bJLbRcVToulBucaaf4pP+QyPkKF2RmvXyZqSv9h
         4dZeKCAuxl9rqPu3i92trrL2LVmIuwo1bylywgmATlmgXk2yfHtt9zF4LwqwgaXU3o2+
         Bq+A52miqRlzw1QPPUAWY4aqk5BcEoxc1dRL4muSBN/qyshl3JFVIXpQo0BqZGxWjsDy
         lJZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBKnV54q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac87d4b000000b003bd19338152si1699271qtb.129.2023.02.25.01.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NBKnV54q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqkL-0001S2-K7; Sat, 25 Feb 2023 04:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjZ-0007LB-Rp
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:49 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjT-0003CV-Pe
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:49 -0500
Received: by mail-pf1-x436.google.com with SMTP id ce7so836570pfb.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=NBKnV54q3Z6jHE6Qzv3Tt/wufkrfFtRH2T5K8lRVcpAt3oDPz3m8vsedzZ0HqqmuTg
 YRvdQL3tKyG8QUAeBdv4S6RgpfL+1PfBL3ssVQd57qMfuh8eon3+j8Qq/er0DdCZVTo8
 E5hGMDvCFi7jVBEULj6T0KQycbQPozkNW067HF2Pf/7ouhdUqGZDN1IzQEDL/CAICgCx
 JdSW/cPuGrm6DBNShDSzncNkCKF3uoT3e/rpkMy8rzHtTEe0bS/7XnziUZkxa93O2wk5
 N/gPdrzHjISX4Gg77uVSeotlQ2R60h1ArctgOzljRMjkzn+2KwYyDysWfjizLSt8S1H2
 Sn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Wc1hlFKIswkkOoSzlvhTQxjrrbSS+xMNCJHLW8hOEw=;
 b=xjWPtg8hqzeg7oK6SYoIbDIJgFiM7RylJqQp5wkKJ/8CtJnHUESrmD6N5Eo+MV+9C4
 g1NnjbRzyT+pGbgl7qX05M4uOGF7YWEkov3YujRZEEabNmbRVfoqDIzEWwew0b44blub
 /hadj/V0qkiAP81o3PbH//EbuB48WfIsTZKHmaPJmEFF2/7FH06mCxt1CPZARAEzbfiC
 +jdNnFmfdCop5BCchX/K2lSFNHWuV+f+kYDDpyM7Vg+a7T+/DB1iMURMGEGwt8CsKvQa
 Zy5ZKfem9YTvNSNLPEA1zI23kJeFxgI64zT0WUAxlVFhs9HKlYtf1wZTEMjincHb9t6E
 U2kg==
X-Gm-Message-State: AO0yUKU5jHkn05m4kYhq8DWrGa0hDOpz2JH1TmmP+s8xF2L7LrF/4FGH
 akO6kawdhjklhyrNMJxSOaR3p7A7jSPqeYimtBg=
X-Received: by 2002:a62:19d3:0:b0:5aa:2d65:4733 with SMTP id
 202-20020a6219d3000000b005aa2d654733mr17319512pfz.10.1677316842751; 
 Sat, 25 Feb 2023 01:20:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
Date: Fri, 24 Feb 2023 23:14:24 -1000
Message-Id: <20230225091427.1817156-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 0MmEKCOXQTF5

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 733a2fb228..bbeb85832e 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -62,8 +62,6 @@ static inline void gen_tb_start(const TranslationBlock *tb)
                        offsetof(ArchCPU, parent_obj.can_do_io) -
                        offsetof(ArchCPU, env));
     }
-
-    tcg_temp_free_i32(count);
 }
 
 static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
-- 
2.34.1

