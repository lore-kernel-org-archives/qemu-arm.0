Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp659701lfr;
        Fri, 16 Apr 2021 12:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKbQ/+d56s9KFCNCMdWZtaYA1zZvWQy863YnIK4lFlM4eyd9/KjAlrYEjl7iXNquqKIcMS
X-Received: by 2002:a6b:7e0c:: with SMTP id i12mr4755404iom.196.1618600559020;
        Fri, 16 Apr 2021 12:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600559; cv=none;
        d=google.com; s=arc-20160816;
        b=QhxFy4edoQdvxoV8AUod6KZJ6m9LOdPyGWL6XU/tHk2aGMOw8j7/2qBypMAW7Zbxcg
         QYfAHurPQSDCI2gUqv251qvlTyOeWtRxpfldiqEhzqSzJ//GjgvfKvXDk7AkWpky1C6T
         aEONu+AaQuBVJWduKGcHq/RXzfKoaVQH1BOHFDTfOjMjTabh9srca5GSD8kH0/Y4PAgi
         nsylofzRPfFQHV+WltnNDnS2cSnPZs8VWMezn/mUQ+yUoLkRgteTHb3UYJ92hZ/fWB04
         i6teC3cPUVC20+I575A/kd1qfTp93lXbaqBpTY+X4Q/Fonnh90aCmezNZC3tyfHoEJhQ
         boqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
        b=g6qj+B2tuRh0O04+5PFnTQ3FNgFLHC7kl4HW9aQgBCl4AMCn+PuJhbp30F0S/rI2pa
         nq9WgHDVehd3mF6TC1pT+p4nPiYVnYNSO/RxUMSWr/oAaTT7fTyNEXsai1MhD0KtGkVq
         EU2sbNYlRL7HOpaZqXpe4bFHASNzhUsacpPC8nN1E3hG/64D/vtmXK8fgmiOn0V0PrID
         as+E+S2Ea7CKFBFNtVgbdsU/PaTEts5RX4UCOweEUFVBmDUgN9BLsUVG/jUVOD7KthO8
         EwXssSFyoySY0ykl8VgOKxqd6h6TMndBkLLwiGgSJMvWZQIhuafAB267px4/sHdDco1B
         4sIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=df7qR45v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si2777417ila.16.2021.04.16.12.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=df7qR45v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTwc-0006N2-Ah
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThr-0003yR-Ih
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:43 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThY-0004Pv-0C
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so15117465pjv.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=df7qR45v3HbO40nbnKm+iajt4hX5QOAn1rOdywRK2LRqEDBhLqDd6W6l5o2fUKiwSu
 SVikwL6aUloRzn0zM5AzMI3MkGYNlMQpyhxwDnGbFDPXQHvdBC1uV+ubAUqg8c5rX1Ak
 B3TjDC0Sw0WMb0uxmX4ItwLRfJd83hGVzf9BD4c82ZTkNg+7r3qGC5v3KrV2TlXnQX4p
 4L7UvS2xsNWZwMwP0ERdjXET/9UUhmYF0FlU0djrLw7Z2ka4rpvwhNKl1y3nGW5GQIfS
 b/GKSM92hnib5bOz5Fc08DLpyCKyTeCk5GolYn4JfnLU1JeV1Mzr2MiKRpznFAxEroBo
 wNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=SMxaKEl1CxJ059sr7G2i80aWA+/DYoKlAaQeWxK+Nnd80ik6b6odmHEAwgweCT1cCP
 QJDBJJ8nK+R6MIaVbAb2zb5wFacIMhEGCnmvtC+yDL/BD3QzEtMD3tYdH2lPpuSgNBUR
 UVwfEACqR/3HpXvXfmvAZ40vmu302ozydtF815WqcGfrW2gjMfdgSygCTrZRFm5atOr6
 5Pb26xUBBjSdb7RIEmhQcRwXT6bNETbIe+4N+ftdh42Z26I0CqSzs31GYh7UtAanFki1
 3IsuL9TiRGfajkhoOsk+9LC3f0jJJPPh8NtUWqozzfUDCoSKMXhX+/4Yl1ln5FhrjlZ5
 0HBA==
X-Gm-Message-State: AOAM533Kbh1J6+WcSFhO/ROq94Nw8+SayKLwAM2WfDuOLjlq+T2sE/rC
 s7XrxsHcJTosclgxq2CiOPzIpkJu7ucX8A==
X-Received: by 2002:a17:90a:cc0d:: with SMTP id
 b13mr11122306pju.219.1618599619640; 
 Fri, 16 Apr 2021 12:00:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/30] target/arm: Enforce alignment for VLDM/VSTM
Date: Fri, 16 Apr 2021 11:59:48 -0700
Message-Id: <20210416185959.1520974-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 84Dj9+77btkT

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c..f50afb23e7 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1503,12 +1503,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1586,12 +1586,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1

