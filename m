Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432954ejj;
        Tue, 26 Mar 2024 08:46:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEM5gffYwcSXtwcFyd/4bxOSfXuKE4ASRowlm5Xt0ORlTecn52+W0CQp9uUTBsICru5gQV2rtk+w9VQny0aZg20bZMzk92
X-Google-Smtp-Source: AGHT+IG85RtrP812FnjIqz+MZHTEdaKKTeCyEhc15iwmI/4TG0fiMz0MvDhFScIrLmPqEKZZjcuK
X-Received: by 2002:a05:622a:1ce:b0:431:1ee0:26c0 with SMTP id t14-20020a05622a01ce00b004311ee026c0mr10681458qtw.3.1711468002919;
        Tue, 26 Mar 2024 08:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711468002; cv=none;
        d=google.com; s=arc-20160816;
        b=ekJAEoJ5XWYqNI5bpFXmr5wIVtMaY4U0/XSppZ6M2DE6EfdLDAQEPq8Tu2FOxZwvuz
         Z8dSykFK02h61zgCkit9/vwsf2BlxwkiY9jWOG3SxiE9cjKbS0AWqQvdmS8eDb1P9JBA
         GUQChvItZDJl+jhCqkaliUtSD4J3FToFir5Emlvp8G0IDYhXGqpo2VTv5RWNoGVyKxe4
         GcDxopBbf8c8vmy1RUq4fFMnbTy2gxBflAzYidrx584BbXAUQ3ZXhkhEFrX1mRcD9Yno
         C7bEX2mOWfp5TR+3F8KOIM1VYijkkredw/DiSPKdMsAn+Uix8Smef52zMe3KKJP0sOL3
         1l0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fauC/yH9kU0VZHj4feO8NJiXVYDlYdxvHhdtor8Edys=;
        fh=bt3B3Nx0RfbGf/wn/tgZqFegguczg+dHbvyQOx1eEVg=;
        b=i1HyqeYB/mVmJUQRCKwMUwgchq0qsesigoEVOXzxi4rJWFfamCESlKpz74EbY+4npK
         2rJ+aBBNyieCoSj9e1hDCT3ixS7eAWLdUu34rL6UDGoH/DDMeGb+592oHcgMWmn9q8Iw
         PeVBKBliDLkAYhsE6HVbFa+hoOdTIUzPPtZ/CP8BLvPmhvEN5uoIzIrXFiv0+cIe/ESn
         DbebmIznQ41VOHMi416G2BkFjXJuZC/f2c5RrYHdFe5vtCddyjWu+1f3VjLX6bTidQtm
         iklX0tx07CqCTop0VlD/gBLwqgeVJZkosYfZbFVW4ZNClZ3IfefHaLhbsq2YYKTAicL5
         ZRPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlPpDUJ9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey6-20020a05622a4c0600b0042f5160d02esi8044697qtb.618.2024.03.26.08.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mlPpDUJ9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rp901-0003zz-2T; Tue, 26 Mar 2024 11:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zo-0003ue-G8
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 11:45:56 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zm-0001DS-7k
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 11:45:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341d730bdfcso923843f8f.1
 for <qemu-devel@nongnu.org>; Tue, 26 Mar 2024 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467948; x=1712072748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fauC/yH9kU0VZHj4feO8NJiXVYDlYdxvHhdtor8Edys=;
 b=mlPpDUJ9MirdFE1yMXxP/N6UEO+gBont64n1BYfZvxhVvR032GOUQkZIC6Ph7U5KQK
 TLyIqb3vdlGRmliGSjpPIVbLbWKJG5mMyQtWYTsoec6XS8unx4A3AspQA0gOEyRzzCP8
 lZ6TYppKqIqfLkOEQDxcjv9EwIei91KNxMQBFkn+nanZqdysQoly1HLA1HtY88y89suT
 dlYdnMU2SBpgNOyuBKO2D2WJQ6pf6zObORJ6W+MJ5Fhtq47iCk52ATMw9Ljy/Fzy7fGA
 0NrP5qZ0eUdNhN7gm0FKeZc4CMB2bOcwQE1PP4Z5Zs2HeHRixiOZAwexrBxwh1vVb7qt
 K96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467948; x=1712072748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fauC/yH9kU0VZHj4feO8NJiXVYDlYdxvHhdtor8Edys=;
 b=wzIRs6ZMRQ44sWyHpY+PF31csw4j2vYojvsH8km0r0gtLDE2GIHRc8Do9nBL3rPh/g
 hQclzuFQ579dbbeRYPqCxsbPKpRgxJUCzCYoxOWVroiN5POCHFj2VuHlqkZiM+H7zS/x
 SwMoRNysx5iO92ZwQ3Sl6/2cUQ7MgPhQv+W6kiWMzHxU0YjAgTNB+tmVhI867bWu+Xvb
 42nimTD6UPR7lO/fGEVhPWB3srv07iDgosOxFbThP4OTtVwjrZsl36uAkPHey8Cj0FZG
 PoPgJzx9f0/F5hgShxd3PjYoCJjQTw6fQ/oOJW3maW9Tmm1BeSn8G2D3LEyfb8BThoEa
 pRgQ==
X-Gm-Message-State: AOJu0YxlhKEMyAXbxifUDXitbrub0OoDMMgrJY/BI+aK02VGHJyftyHi
 txgSlvyZypE59gDLj4g8YP8j3KL9Ed3jH5qXSASXTbFeI4z28eLOINk6Q3auw57Q86bC/jDz8X0
 F
X-Received: by 2002:adf:cb12:0:b0:33e:9de3:9037 with SMTP id
 u18-20020adfcb12000000b0033e9de39037mr6604764wrh.59.1711467948446; 
 Tue, 26 Mar 2024 08:45:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a5d4d0f000000b003418016b04csm12472452wrt.76.2024.03.26.08.45.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:45:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/13] hw/misc/stm32l4x5_rcc: Propagate period when enabling a
 clock
Date: Tue, 26 Mar 2024 16:44:58 +0100
Message-ID: <20240326154505.8300-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: DDhgvUCFKLKx

From: Arnaud Minier <arnaud.minier@telecom-paris.fr>

The "clock_set_mul_div" function doesn't propagate the clock period
to the children if it is changed (e.g. by enabling/disabling a clock
multiplexer).
This was overlooked during the implementation due to late changes.

This commit propagates the change if the multiplier or divider changes.

Fixes: ec7d83acbd ("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
Message-ID: <20240317103918.44375-2-arnaud.minier@telecom-paris.fr>
[PMD: Check clock_set_mul_div() return value]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20240325152827.73817-4-philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index 49b90afdf0..ed2dbd9dc3 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -61,7 +61,7 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
         freq_multiplier = mux->divider;
     }
 
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+    clk_changed |= clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
     clk_changed |= clock_set(mux->out, clock_get(current_source));
     if (clk_changed) {
         clock_propagate(mux->out);
-- 
2.41.0

