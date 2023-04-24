Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2596091ejm;
        Sun, 23 Apr 2023 22:42:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDTO6QyqycMRdpYIYlDyFH502v85tZvXGYNzvt8Y6ngXmbMksi+rft78Y27c1TUzA6vb2/
X-Received: by 2002:a05:622a:189d:b0:3ef:37d5:49e0 with SMTP id v29-20020a05622a189d00b003ef37d549e0mr18588803qtc.21.1682314976196;
        Sun, 23 Apr 2023 22:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682314976; cv=none;
        d=google.com; s=arc-20160816;
        b=OVNxn+Taa/tboO5c2dCr8kgotNHgglbi9l/DqCR+LcCpn4Bwag05TUvaS8Nl8gN9bt
         O2BFM9tUFL4YJoDEvup7HNk1Ktg53NwYEvLyv1vpPVk0fToVgQP+GsgkWxfca5D9Rdgv
         S+LpJL37XLH5PPaHEFc5kgx/wqQ2snhaXiPGctfV0GMEIxw/kJD0ucdVaxZYOQyfm0mQ
         9t61xlG5j4Sxjh2WwtXBP78UMlVy1Yw///CSlk+3rs30tkWLRr/k8MRMiRokVAZ/ODTO
         6+7j8z2zQ85QvviFqTvLCjlWS60UJ9f4baXdueRlyppqVxhQZws92gr38E20oEXqYU6G
         gnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0fR1b522KKsIelYZfiuxLUq8SgNfFMeT4gqF0CUIbNU=;
        b=v4GTRpgslzKLmkBiF2wHbBe7MNaMbrJN15SwmUe74onCcX2/m3C0kvMpfLlLHSdm2F
         W8bfkN/JyBjReQvXb7W4xWPhS3XPNr47r3mSyQgURvWFq1jDzjkJovN3YGJirr+LFM92
         5kZaDBaSNXgBijFGss3x883oAdybZv71rWsH+lGWJid88qtMVz+TmfarSq1Fbd3zIF74
         vw9yCnEL03uUTSD9pPpPW36mv4fD7L6svdNtb3LfGHs+FzU5TdLMINFXvuk9M6QEXMzT
         /yrs4APbJeVFWiRZs9Iz6Nw15Or+Qprq6OdCngIuNwwz7g/1vflz9xqk7QXHxdVptk/x
         VUVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RADtIJhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05620a430900b0074ca9278d05si6604198qko.379.2023.04.23.22.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RADtIJhD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqox2-0005HT-07; Mon, 24 Apr 2023 01:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowy-0005C1-W7
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004EG-AR
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so63431485e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fR1b522KKsIelYZfiuxLUq8SgNfFMeT4gqF0CUIbNU=;
 b=RADtIJhDr5EG/Rj6SUP2fKHSeCECGxxk1crSfv3iEca5bbWFmxfcMl/nQUXMwhKIdu
 ka+YVSa2HOUpX9zyYkaC5AtVBNXpHANRhe6ezTR83p9xp5wWog1xQaPzVAYZabUpeFsB
 AIaSkriboY4DUwyt27jazZUCrs4Nyx5LjFYx6r0PQ18jJHYBoZ73BFsgShNB0H3hrtL6
 aXUONEcIiS/jgjSRSSAu24NBEXp4ryIcteF6Z1qn1FnhMHFpSlPgfMZrV3sjRC7WXn0W
 z3F+f4JXxPO4DottMedSErUN5HAS8F+VKZBWnyO+1AuuESPkKgO0GBBOJoN+OL370IYF
 eO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fR1b522KKsIelYZfiuxLUq8SgNfFMeT4gqF0CUIbNU=;
 b=fhfG5PpZ+6NPLU393UKk9qCxuEglIS4Hxv3N5ln8KLOHELcm3s0eeFZnFgIE9HljwT
 k5fzBMleabejKWG0UmMWGh6JXoZSZS14DF5nm10f0r54eW2amIA0ceFzYAh4PNeXddma
 08kiP5IyoM5tAD+RUmthFSRMD5yI5e6mEjpKOUM1cxEw3tJCR8Nsu3SUmf/RUZkNQXQa
 ns8xYbzR1SNTZRlOTghOQJK04jodwmGvnoc3qSZ9eMrHFFpSVzWpn+U3EQ4nhl+G1VIo
 J0YByyX3IX4pvGQTjhfJbhLwlD6Fp/k5Udd0AwEt24d+CVTiUseHTvPD2kMkYaRRHNnT
 z0Pg==
X-Gm-Message-State: AAQBX9fgS0AMFGbb9NAdPHSbEWh8aLzNFVT3f5b6qEzChlnmL6L7ah8j
 0EBIKHzIWfn7sbW0gTspbdc+sw==
X-Received: by 2002:adf:e711:0:b0:2ef:84c:a4bc with SMTP id
 c17-20020adfe711000000b002ef084ca4bcmr13177344wrm.19.1682314867709; 
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 02/57] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 24 Apr 2023 06:40:10 +0100
Message-Id: <20230424054105.1579315-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: z1IyAGY3sKFC

Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
extend if the register matches.  This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 346c614354..a83ebe8729 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -582,7 +582,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
 {
-    tcg_out_ext32s(s, rd, rs);
+    if (rd != rs) {
+        tcg_out_ext32s(s, rd, rs);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg rd, TCGReg rs)
-- 
2.34.1

