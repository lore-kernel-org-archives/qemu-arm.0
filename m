Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1147153wrs;
        Wed, 28 Aug 2019 12:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqza3S8/xhTxw4b3SRlKsC0OG7hNdod55CLcJ+N5L5FZ7h7H61JHV+wD1ioCJg8GFL9Uk2s8
X-Received: by 2002:a37:b102:: with SMTP id a2mr5645249qkf.298.1567019139805;
        Wed, 28 Aug 2019 12:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019139; cv=none;
        d=google.com; s=arc-20160816;
        b=TxVfThotHgmBdUZKV2Mx48kFg7vhjFJCl8Rij1tWjsSvipgajrMjR5xJuwvV7MEBGh
         fw1l04w1BDtbguMI+kulmgi7KBmUoMXeMlNh4YDmy/p6clxYuZTiMMuHUo/354s5m6R+
         BhoJgCs0CWCv6dw59nMQi1TmVYmArKvnF5lj0WGrxyHjhJASXWOaCmKKrQtEg3l9MAsW
         MC60GweF0RoCF+6w9oBS+Qcbp3nYv84RWutnnvRNbdaORkduA5WR+ZOJylguE30TE1oq
         waqzHQOD/yxA0SCXHhy14+DgQTMgRza9I83VH751Nx3wPAE4wcp1EouBkFcfmPuMlJmp
         uYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=jAqvd/2BIuSZJ/quAHqjRlBcC779AH2rhSu4pCUKbkY=;
        b=wDyrRFoW2Sbjm8FSjLIVJ3KfRYlHRfu+u1A4AW5zhU99O9tezAZo1GP9+mEHJRKbB1
         3x+M1GZ/7UIIxHYIQsSNX22Yf0tMzrXbJ0lhGyoY1Nv12zDmM4WMCeRSzKkPYyEAERhk
         BhtYPi0KYz5M0IAJkjOrQ4KfSEMywZDnCaZTuOKhNHv+de3VWWb0mUjUrKPufewXuwq1
         WIKSTV/Hc1RJI+kuwYmocfpNkTbNN/qTh44QqwdwPmRbmGwEHINRfXfiogEMdhLx31PI
         yoHsASYW4xB+OcCf5vvd/UpU1pUfbDhq6Rw/2EZ+RxJSIDmN5R7KlUGPtl7EUrh1cqfH
         fwxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cwqrKVKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a50si4619qtk.284.2019.08.28.12.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cwqrKVKk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33GE-0002xP-0g
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37313)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fe-0002vl-12
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fc-000845-VH
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fc-00083b-Pf
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id q139so364798pfc.13
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jAqvd/2BIuSZJ/quAHqjRlBcC779AH2rhSu4pCUKbkY=;
 b=cwqrKVKkM5ZDHJULoLzd1MCeKIvJCsqMAGtjwM1WNM7n+rhC4YXa/ccKWJkv8YEMmv
 JjWU2O2Bq3SUEmz01uGx2lSLb7aa9rdCDAQ2kIW1/M4VeXP4EYwSpzagpH8tz8sqM4Sh
 d7p7jC+crnZ1u4+rIfNMhw7u181jPTsCIhLo5nhE00FXC7B+oTl8tqR9VQEeqIQ9XS2Y
 1HeQggQK+WwyhcTUeswIOq8q7EONBd+EHc/3uIZuw53/DQMK5WOyMk+zErSrXcxA/s2S
 WBODvBSQZKLE397QAmOKFPtUFwzrmk1C4pjmsH3+PJji+XpTsrRGXqBlMwtQ2GsmuzwY
 AqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jAqvd/2BIuSZJ/quAHqjRlBcC779AH2rhSu4pCUKbkY=;
 b=bj9zYVx3YQwXa+QAF013XBvWA+4kFXb7w0JGjtP6/fkGLWndfMV/vsWlegjlyYH+yR
 2DERNPuN2u8LCS052O6bltiGCI2qriPSPc9P1ftjMoOURgHEknNayIlVeod+Lq0njekX
 +kQnRNLohvH1FIM2t3IYVIno3BYcCjG/h/Q1VlSZ3POY6hdY0IW+3zl8O54tewmBR+II
 2sO17XuflS30Eh7tZgn0Nhukm7++TfhR6xJBarBLZs1o1o2i4ezltCZyNi7VDaNMbfPJ
 PQ8Zt7b9Qz5UU4C8FgPhB69LgFIK8Q9Fh1PCZfFFefnyOs5/0om9fOyJE+mvCTAdkio4
 cYmQ==
X-Gm-Message-State: APjAAAU8mB4GRL4EG0EO0F07uE7ywxxnw9O8FCiEYr7oubQ0MqqLncHp
 HwOF8P5HgTzTI1GQ9k8tHs1DzYSTxT0=
X-Received: by 2002:a62:e516:: with SMTP id n22mr6559250pff.105.1567019099849; 
 Wed, 28 Aug 2019 12:04:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:04:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:48 -0700
Message-Id: <20190828190456.30315-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v3 01/69] target/arm: Use store_reg_from_load in
 thumb2 code
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D2SVxhvnng0J

This function already includes the test for an interworking write
to PC from a load.  Change the T32 LDM implementation to match the
A32 LDM implementation.

For LDM, the reordering of the tests does not change valid
behaviour because the only case that differs is has rn == 15,
which is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cbe19b7a62..35e59a8a16 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9707,13 +9707,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
                         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        if (i == 15) {
-                            gen_bx_excret(s, tmp);
-                        } else if (i == rn) {
+                        if (i == rn) {
                             loaded_var = tmp;
                             loaded_base = 1;
                         } else {
-                            store_reg(s, i, tmp);
+                            store_reg_from_load(s, i, tmp);
                         }
                     } else {
                         /* Store.  */
@@ -10847,11 +10845,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_temp_free_i32(addr);
                 goto illegal_op;
             }
-            if (rs == 15) {
-                gen_bx_excret(s, tmp);
-            } else {
-                store_reg(s, rs, tmp);
-            }
+            store_reg_from_load(s, rs, tmp);
         } else {
             /* Store.  */
             tmp = load_reg(s, rs);
-- 
2.17.1

