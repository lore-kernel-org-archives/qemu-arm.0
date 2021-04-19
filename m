Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1496501lfb;
        Mon, 19 Apr 2021 13:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZRXoHlre64fCAk6zt0dVWBkqKFdIPqPHQfqU9OmI6DuDrHN8FqAJqH/ChCvBtnpO/UebP
X-Received: by 2002:a5d:8c89:: with SMTP id g9mr16196421ion.27.1618864941685;
        Mon, 19 Apr 2021 13:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864941; cv=none;
        d=google.com; s=arc-20160816;
        b=t2eHvkI7Ndg7air0RLPjF/IW0qHbplh6hE64AUUE6B/XWkKV63QjoMEXtl67i46Sch
         W6lLpJwGjzRc3MZ3glP52DcjTsj2pbmBiB+8Flt7O8F1gV8yhMwSwVv2UbXQnPqgL6sp
         4ZFWROgfHN2eh/si7g0bYO/zDPgBTePQy8PocjonM3JF8jJnkgkqhRfGo0Yj6hJNe5MM
         RXqmhI4/kpXusbF6OukUYl4gv3QFBpfbVIqgb0feJEy+weW+vveOKXL3fPX1/Ig6N4jX
         HhM3IwiXns1JmwaVsY3dtTUBqxwwIZ3K3u3ZxXtTxCtyRWz6lHd8U4v4DZceTWoSfeRE
         sCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pF6fmfH76/v510dCB18bQqtlH7/Yj+pRg8bcSl8DNoE=;
        b=z0Ovec0jexQN4tWCXNepQXE6C2KARk1tzbZFYM5gEUFuOQ+i+3+UwcbwBnmcuo+vPc
         iiV6oU9/JJ8XP5/CwfhQLQYcfsEdkXVEfApPr0ngIfaX1HYYddK6pqBmOSdLhSuzSctN
         w1tLnhTr5iGQaIhuS/40Dv6Wn4Kwkfb8U/hgO95hDOsmGTsGNChnHlesWI1VSqnf98+p
         OvajG8hX8qRkweRWkZ2lAVPK9U/76a3s5ZZ/7baJDI+xIjMl1ugpuk5Kak6S0EZoHG5e
         itf23ZjRrMdsHB6JMM/aWQQ/W0ue0JRS/Lvypi6dtvyYU69EnK22sEvY1kpkpEdWZ0hj
         J7xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e9U3+aMY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si13412769ila.29.2021.04.19.13.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e9U3+aMY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaiq-0001NY-Uq
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQj-0007ef-8C
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:37 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQh-0002f0-Lx
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:36 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j7so27111991qtx.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pF6fmfH76/v510dCB18bQqtlH7/Yj+pRg8bcSl8DNoE=;
 b=e9U3+aMYpZ1GqYCJnVskuDvuGKIylM0V9ZMPlrechq07ay4ZvUy5I13oFsTifc6jSK
 2VSFYVC+Ml/5n8edwkzk+Z9yxvpUl3Cd1ziUuRGVz98s4lhXiTIMtjER9jMvsXeltpJf
 yneHyVXsZQpzCeoEEEwwmDYEbfUP2aXumWv1zg9pmBK2x6m4ZCyh/YMpHKtgIEHaS3KY
 +eFQFY6CkREk1HNwWBoZHKihPkTfSm3NtTGx5h2OiBwjoanWaOdIHofqsAhV2G2GOuvr
 qdE4CBafK4CFy+GukdQhc6D2B1BzcA4Yl+uqqdZs2JexQ6Mg1DYeLRNUIiv9p1vumkuE
 GpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pF6fmfH76/v510dCB18bQqtlH7/Yj+pRg8bcSl8DNoE=;
 b=R4eDm/SL6MmQ1ve4faPdN5U/XHDIwmRfMZG+li0i6zbvtybX/WcNFbmQNvMvXleYNu
 ck1RmqsBqq8on/Li++d3vDxYVVLDGnaohBRd76If3KWFblw22gPDz4vZAdhMCvEfwNPE
 SF+4tFWdFYAGp/zIJlTxSKFKmZ9z9Gg39ms2miUCCs9QD2/+oyhnim63ofNMUL4P2l/w
 aSjzFtEQh4Al6crK8mGVZ3W2UKVtUjhRep0ZaFdJP4lvXzTb1Kw+y/j0bMPfDxuIrfp/
 uho04vLXW6StufuA9Mey72rm9QVaHoPMPbPWQYAp/tIOW48G+QonKSfp6L9mf9vf/1B3
 9NzA==
X-Gm-Message-State: AOAM530gxS+NFQ0UEFXY7Pqk2e2wC+3VliU4CyvSRbSuxgoMih65p4nr
 ahniqzXGoWxerG/r+TE+i5TIWo4WAvmtJEml
X-Received: by 2002:a05:622a:170e:: with SMTP id
 h14mr13291322qtk.287.1618863814785; 
 Mon, 19 Apr 2021 13:23:34 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/31] target/arm: Enforce alignment for SRS
Date: Mon, 19 Apr 2021 13:22:45 -0700
Message-Id: <20210419202257.161730-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdfnVOCkrrbg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2cdf58daa1..4decb2610e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5200,11 +5200,11 @@ static void gen_srs(DisasContext *s,
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

