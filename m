Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4843651ejq;
        Fri, 12 May 2023 07:45:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4r98eVnFsJ48FuBQTUUqEoCW1tacARtfI8MHvlUIlv5gycpHiNdQEmxcozTO/y8nzwL9NI
X-Received: by 2002:ad4:5bc9:0:b0:5f7:5ae9:813d with SMTP id t9-20020ad45bc9000000b005f75ae9813dmr34152736qvt.39.1683902700205;
        Fri, 12 May 2023 07:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902700; cv=none;
        d=google.com; s=arc-20160816;
        b=eQSCU472X31yKRTP00IIxW4H600ABlyKlJaDPgicHlS4bbUd/6VtzRlnhryCP0w7Ib
         0qPq0yn9Eso3RqU49D9DMF1rWFObWDn7SrUgSkO64/GvRDTMyjN9Ps6cxrQ0DeY2Xhr+
         FXOh0lOKOm07OPUzpQ3bX06ddy+jTi49OnNs436u4hz2znJ6Xdy9nVXHwMUnphvmFdO+
         5kUFGo1cPrsakl2kWRP1JKy9LWekhgEAWM0zz+An6d2+K+63HgXBlmbr749gw15kOwkW
         /Ct7Clu1Pg8bL1UA40YmI6HH3HqrZWcWnjvg/q62YfNCoT27KoT6MRrjMFb290kMK4+D
         EAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F7ZdreOn7GzP2/qhzWCJzqHK4hMlTf1RtG4DdFV8A+I=;
        b=1FeGBpmvT/NoUtKGA+N9iiJg6AEgGWBOZZzv1VZjnWDe1hrgHwJrFn+wVu5hdj3Gea
         ms9MmoAClyFEwugYyFCblaqcOKwAplj2Yao4cHxXxFguaVmOgLvmhnfprrHd0xC9Xtl1
         6lUVzwYV0xxkP4UEVdyjK3uiZuEpVzSkMYq818XwRUulhe0UcqsOKdjTMS2+WoO0eg3x
         4pbKY73SJPPu0p8iQzDRZsFikLAMsI1deZLsjUnw1SsWrINBrh+IbxjtSWmnZ0ldoGk9
         qK5qxopjbTXjP5WVnTnP5RIWGDXOJFiiaFuKBVcMF3HdBAum6Gh23F+GE5FEkPwe/TDw
         Fawg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruCmCfeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg15-20020a056214252f00b005ef70d6a66bsi5637965qvb.146.2023.05.12.07.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ruCmCfeA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxN-0006nK-Co; Fri, 12 May 2023 10:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxM-0006mJ-3v
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxH-0004hS-Jf
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-306f2b42a86so6675609f8f.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902469; x=1686494469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7ZdreOn7GzP2/qhzWCJzqHK4hMlTf1RtG4DdFV8A+I=;
 b=ruCmCfeAjlWFv6ZAPQ1UCtxDHaOIBb3VUZxb6qXl4HP1Q4Vtwp4zJh6LG6zDL17gqI
 gQtGlrIR0fUBGWUyD8zMvHUMPAYMc2Xh1Eb5Jyy/oMANuGsrKI1Hz/y3Q06bC9/+RBYN
 zKzm07JtdFVOu8qwjznHxzsgW4YtdpUDN+rcWSOsbWe6aYTOCWRwekXgjTYRxSWxHBLw
 0Z+kUMUrUS5oGJyh1eE2AGyC03HVpg5KftAyIk/8k7RKhA4foVXbViTxRSWQqEYkVy01
 eo0GnWXEgTzdTfgSbrE2F7l5GAYuuSR8S3x3nrZYCIkIv2azjQGJrDpgoYXAE8SeGYr/
 aGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902469; x=1686494469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7ZdreOn7GzP2/qhzWCJzqHK4hMlTf1RtG4DdFV8A+I=;
 b=dejUwTBuyp8P1p+SNBCpqrgj0z0GzPwziBDg3nKmGggYKUURA+y+002M2DRWPccBIt
 Hp1x2V2E1nSzF+sBLCcLLyawG/zstdCUMXNRv9l0KfuLg31GYD6FEWR5Hu8I0M8EJ9vJ
 C6icwRJZRjhvesm5KyIh4UhX8ovkL/YYLl9ZggD+IKEBRedvm2guzPQQsU6yQdN4vdLp
 m9hDTM51c8Vr0lXXFZi2VmfDSUq4X8wQS65WYxv9Qmzj0ASJ64UmuMOdqbp1KRRWoTwR
 4YD9x+Wd4hNYJlR/lk/aZGOo8nKJSsBOaJsDECPwFDH4krapOoSLriwNoGLWim1Tptsu
 FM/w==
X-Gm-Message-State: AC+VfDzKdfczhFpuYlwwrtORCce8y+92nAkhXcnlnvIeEiqikfNbjeh4
 0J8Tk4xArSt8BueiAO7knOO/2kn+iDxYBAe5IMo=
X-Received: by 2002:adf:e991:0:b0:307:a58f:5f7b with SMTP id
 h17-20020adfe991000000b00307a58f5f7bmr8780705wrm.64.1683902469393; 
 Fri, 12 May 2023 07:41:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 03/20] target/arm: Pull calls to disas_sve() and disas_sme()
 out of legacy decoder
Date: Fri, 12 May 2023 15:40:49 +0100
Message-Id: <20230512144106.3608981-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kzIHsn3FZSF6

The SVE and SME decode is already done by decodetree.  Pull the calls
to these decoders out of the legacy decoder.  This doesn't change
behaviour because all the patterns in sve.decode and sme.decode
already require the bits that the legacy decoder is decoding to have
the correct values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7862e9dd4e3..2845febb713 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14205,19 +14205,6 @@ static bool btype_destination_ok(uint32_t insn, bool bt, int btype)
 static void disas_a64_legacy(DisasContext *s, uint32_t insn)
 {
     switch (extract32(insn, 25, 4)) {
-    case 0x0:
-        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
-    case 0x1: case 0x3: /* UNALLOCATED */
-        unallocated_encoding(s);
-        break;
-    case 0x2:
-        if (!disas_sve(s, insn)) {
-            unallocated_encoding(s);
-        }
-        break;
     case 0x8: case 0x9: /* Data processing - immediate */
         disas_data_proc_imm(s, insn);
         break;
@@ -14239,7 +14226,7 @@ static void disas_a64_legacy(DisasContext *s, uint32_t insn)
         disas_data_proc_simd_fp(s, insn);
         break;
     default:
-        assert(FALSE); /* all 15 cases should be handled above */
+        unallocated_encoding(s);
         break;
     }
 }
@@ -14445,8 +14432,9 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         disas_sme_fa64(s, insn);
     }
 
-
-    if (!disas_a64(s, insn)) {
+    if (!disas_a64(s, insn) &&
+        !disas_sme(s,insn) &&
+        !disas_sve(s, insn)) {
         disas_a64_legacy(s, insn);
     }
 
-- 
2.34.1

