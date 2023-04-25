Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3725086ejm;
        Tue, 25 Apr 2023 12:52:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zvrihdlrab6tY0MFwy4O8hJ1J+ZGuAmErCeKujNc4zZdFl72upF15ENKX+xqZJYA0kMYjO
X-Received: by 2002:a05:622a:1446:b0:3ef:5bfc:de85 with SMTP id v6-20020a05622a144600b003ef5bfcde85mr26121600qtx.22.1682452374573;
        Tue, 25 Apr 2023 12:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682452374; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0YjguiKG2ren/mSzP1LNVrcePIjlQjpWeUn8HPv3yU3mLzah8vJF00VEjo4ZZeoqD
         X8KnUv5AP9/BXGvGy9EGIV9/olzCbVMnKCTAca7wmeDCWigtJP2jxj2gmr+xIHZhfrmI
         FOFMlOAhhuxgmNT631NfLzpKPa0sBW9i7NStmpftOqxs3PmswYp/wBstaByQLPCaNY6b
         OfQAN8vxmT4DzRjGz9kqX9OvPHyOUbdYsyIzPcK/CfSPGC+kmIcE2sP3b7tLEW67NXP4
         RPX7yigw7twwYzddNSlbeqRCHs47KKlboyf2ev9oFiYBU/uUKdD1xts424kS+0cnz9aW
         QfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H9XjeSNeXS5Zbmd8g+CH15v6ygPNvoJcpM3DeEPFM4Y=;
        b=z4VN4kNM2QCQ6p8HIAT75FeKmVH8rK4JAoNWF9FXuyZdrl2xq5m0apvrXbncK3EO9m
         u6A//XBApkkQpGQpds8CDJWlTUt6fyi66+bCD6RPywsvNmQUQG9RNu/31iCQ1jI53lNQ
         Wd5GPnfwrOdMlDTRnM/RXhSZwdEHphhQsWGoFn6Uv4RyX7J8FxegPcbcvsHwrE6ikzjz
         Aa0x5XaiIXmKUITGcSxSOuglhte1X/uYhvn/SjHIF7ndWooC6W4ET4Qq86trZ0p3PyXe
         tcIXLP7JDgTVmJGg63NQO8ZPYjNIXoYwAi8k06gbpiwiBLWNpUnYHdK3Ky5zax4s9eXZ
         le5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeZrJKWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq32-20020a05620a46a000b00747a2434db2si9480600qkb.766.2023.04.25.12.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VeZrJKWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prORA-0004Jx-T0; Tue, 25 Apr 2023 15:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQr-0003mD-BO
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:35 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQk-0004rm-09
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:34:33 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8a6602171so59399821fa.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451263; x=1685043263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9XjeSNeXS5Zbmd8g+CH15v6ygPNvoJcpM3DeEPFM4Y=;
 b=VeZrJKWbqt1v2tq7WBTkORWe/bPwYoLDgzQF4EZrFLzH/H/NHwlZeJBlFeZRpE1TEZ
 MxIyWxI2eN69eE7PEUYwFbxe7bsqO95BU3Bd+OgjBDUBRu+eCwJXpxboernQngiMjk4q
 7+hsm/W/KK615pNR7+JIS+w4IIHffg5tLDJLa1zDYtFGWKockZ2EKU3SSGizA5Djt+5q
 WjLQOC54ZsF6iPMlLCTB92cTJSONySg4e58Pq24ic41I3fOoWuII3Ost056L0AxLWR+0
 thYu4Lv1HvGASiLjgQBOKBABnEXZlc564szMppmw1bj7oUZ7WHBjLKAiur+GLekP2TI3
 H0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451263; x=1685043263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9XjeSNeXS5Zbmd8g+CH15v6ygPNvoJcpM3DeEPFM4Y=;
 b=NtcP3XW2W1UQXDk7OKU+Yv++GafIpoAXhrQw2TtJcKuanGYe+lD7wxFo9Eb329MzLG
 U3HVcaCDPSJToO9JTv0ECRSfkwSd5sX/SHRZMqvq+Rgs0JqU3wY+cBdyUnAiVUO6KRAh
 HHaxgqBhGa6YP21jHx0/skmyvjkIjpesgNRswEzJ/wKvFpGJpSVXEecUZFKliGzm8LtQ
 kfoY51ndveuujVdJXlIKDY1XwrUsHVuYHavvTOn16wMAElW7BOQoUiTiWDnaJiQ6dam6
 v1xS08g7YZOHFQnOEmDna4QQy/Rl7vFhhEWulrIVu7PYPB7qqCJ1KR0lyEq0x/TOEPVJ
 WtLw==
X-Gm-Message-State: AAQBX9cPrHDP/IQG10i0MvrH5q8tUhJzjnPCJpqu/AebGFrQf6ReiylS
 eBZUo+sHAdn0tCR+NIJ4ZJDUrno6SmxGEUNs/BEtdg==
X-Received: by 2002:a2e:9686:0:b0:2a8:c759:af08 with SMTP id
 q6-20020a2e9686000000b002a8c759af08mr4263534lji.32.1682451263295; 
 Tue, 25 Apr 2023 12:34:23 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 23/57] tcg/ppc: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:12 +0100
Message-Id: <20230425193146.2106111-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: cM51bjRwCLXD

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 86343ea410..94a9f70e17 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1965,7 +1965,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_BSWAP | MO_UQ] = STDBRX,
 };
 
-#if defined (CONFIG_SOFTMMU)
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     if (arg < 0) {
@@ -2015,49 +2014,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_b(s, 0, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        TCGReg arg = TCG_REG_R4;
-
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        if (l->addrlo_reg != arg) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-        } else if (l->addrhi_reg != arg + 1) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R0, arg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, arg + 1);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R4, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_call_int(s, 0, (const void *)(l->is_ld ? helper_unaligned_ld
-                                          : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1

