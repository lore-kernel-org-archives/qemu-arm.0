Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp732683lfr;
        Fri, 16 Apr 2021 14:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFHJLUvgu+A1pdhelZ01k0hiqbrY3f4DTvOfyL7q7xprggvSxZq+l1+/AiM5yYoLt+T7zK
X-Received: by 2002:a05:6638:1648:: with SMTP id a8mr5860744jat.25.1618607669623;
        Fri, 16 Apr 2021 14:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607669; cv=none;
        d=google.com; s=arc-20160816;
        b=WUyJBx8mTg7VwoNpQer/+Cr5zm7RWnmu84ah6MBdcXHwxQSyCCAWZzRdWZdoF0yrx2
         J1UC8vq0ASTywMcUpVzENQ1G+UJzvGIrrSA+x2XH9TqMXN/FFe14h1JZtuFwzNk+8bQX
         fBSRt8XY61eUoGVEb1gF90DAQeGmBN4Ela4HRTc1mL8mYZtSv5rSbbxdd4aOHtOd3N/U
         pxqLyY5LeGxLdmqv9CMtLHwK7qah9aivD8iX4Qzk5cG6DFsMVipLa43YLAI9zek6m7qU
         du9VsPt1YiApTIdO5MhX/A2MUXiu3rvnNao1lXyChipt5WZ8VC6VGiJh1UoSnO3AECJY
         LROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
        b=jbSq2Mg68OBanBw+Z9ViGxHie/fUBbtmQQ2rYsalZ5CpgdPJZad56/XjLAVl9hQTDO
         P2qTC7OvPtU4jM2hyuqvBBJLo75R57gFgpKPQe2+E5ZY62DmkWaMDpz2WFKat+SIvdFC
         ApSTmjoPKrjtMS8blBCqVLfB2eSY0w7C2+h1XyFxotvdvsCw395Zw5OC+yBWqhhjFAkQ
         b3oReBR9hGC+nb57HrAdZ4WgoOXDRAeJWlnNVFDjgyP69khgkN4KGFx9XVWGy/mTQ7jU
         Pmi4leOrs81cw3956rwkcPLjuaAZwb/OL+siqMmDE6hlHAJWorXJFpkxR+tsvkl2/G2s
         nXVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1IFdpLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si9296460iol.13.2021.04.16.14.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s1IFdpLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVnE-00038J-0b
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcN-0004OW-7M
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:11 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcI-0001Bu-3a
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:10 -0400
Received: by mail-pg1-x530.google.com with SMTP id g35so19964557pgg.9
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=s1IFdpLlqQ1L5fv0FTDrAIpbnnxa6QiLP2RYTVXO0aGQK7AL53Gsn/7oc9NWL7EAYK
 wfaFpkqhVwtpaDE6Ln7pG367e6S5EBUWs9LRiSxaFVeyxo/hQEgsx2rxFGLMDfuaC678
 +iZiSK1Hc6wWZrsx5VH6nA2OkDytIx+ewOgAag6RDrY+6DKd6fnIrguOUPVQx4RnVXHf
 ec57JUryNlheRWbMciUOFrR7LaS557vgapX+X8fk9L75f8YliAiDc35sKWJdt+EOqRRv
 Ji2gw0R6QmOaYD3+c9eCc0of/U3kGRi6zLfNg3lb+fA6WTx7AtkXHs2JElsZkXByp7Yt
 +2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWdhkzqHe8iJijTRujXmdCXfYmUKYPpZlGIVkZOqBWQ=;
 b=O5QMl4DhaNcRbX06YUaCUeQVUiPTRhMYLJQcIYy4H0AOSpm1wPZLq93FS5/3Y0QwrS
 Z7RlK1JgUoAGSqk0gFP/R7Voi+8Hvaga5hDXCAycRHi+PQAjpQsCZxL56HM6YFAcPwPy
 EDziMs5FHDt3+IsvsD1wpxJJXO5XKk7zjiGQHMRw/wx05jhG77vmWtomfS2V37y2TVRM
 OQ9EwZi+ciP0Q/PfRQxitc4enGO4MuoyRQ27LTUY/kfdgja8YFM8KIDu6WGZSmysrCch
 yihJOjE65x4PIbe5/ukNJ2XARaHsaCBjozatc8Kz7Vggu7jzmY3ht9z/RhSLzZYJEMTL
 sfPA==
X-Gm-Message-State: AOAM532N9YNoJILdl0LHzqFlc80N+OfYRUJ5N87KxiEWGPVgI4whYAML
 fcSEPmzwtgE8FbQT8DUhT2BjMuS5w80Nkw==
X-Received: by 2002:a63:2c92:: with SMTP id s140mr819968pgs.39.1618606984307; 
 Fri, 16 Apr 2021 14:03:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/81] target/arm: Implement SVE2 bitwise shift and insert
Date: Fri, 16 Apr 2021 14:01:41 -0700
Message-Id: <20210416210240.1591291-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghFKzoOqw0Ex

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  5 +++++
 target/arm/translate-sve.c | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d3c4ec6dd1..695a16551e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1261,3 +1261,8 @@ SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
 USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
 SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
 URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
+
+## SVE2 bitwise shift and insert
+
+SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
+SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c11074cccc..d74a15d8b8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6428,3 +6428,13 @@ static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_ursra);
 }
+
+static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sri);
+}
+
+static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_sli);
+}
-- 
2.25.1

