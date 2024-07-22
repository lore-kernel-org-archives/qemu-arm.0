Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2049933njc;
        Mon, 22 Jul 2024 10:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsUIihz5MocdAwravAd1uvs6CwL81ubDbBmgDIXBH2qUlKzOsbKGO+hHE0DQDO43GKdeKAfBkuxdSbijMRci+oZF0Ri9k3
X-Google-Smtp-Source: AGHT+IF8I4hdGxUB7pj/8BKSYlCs2YENhF87nXALg9hGYkWbmg43lX7VMeV8DV4N1QK0xxWoqBEG
X-Received: by 2002:a05:6102:1626:b0:492:a261:5e25 with SMTP id ada2fe7eead31-493b06d941cmr962558137.11.1721669430856;
        Mon, 22 Jul 2024 10:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721669430; cv=none;
        d=google.com; s=arc-20160816;
        b=W0OOsXXuEacnth8utvz0K5uysV+nSNxq3J/gkIeGohVNJIt1NGjGijSYBgbcFNk61t
         Y5TdXMMQq+/axbCf27h5PQ6o0ZggNVQYPnyDRZ4kN6W/OMKMS6Qch1mXXXyJyhy2IyKJ
         qv5I8S2/zyQo4sXU5V0Ed3vKBQTCioFBA97FquYswYgWIeuolc0k7GnqS16XCQSJZRjk
         SLbXioeSOr7hq7WvZmCKFeO8f3rARZ0JhAjfwTU8b6Wa/XwJeEI/ENoM+b+Duwu2ZK38
         Fj/YcJZM2n0jwshXmbJPLmOoZzU48SmWxxA3HJgVASb99RXoDqHd7nWmMQKz6Hn6jgVI
         xW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8nfDaGNYYtX7WTms9otZZ/RyOW6fJggHI+PAByoitQ4=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=mcXpDgV0ao7gdsLjcTyLO1UDuLoGxgga7mcS982UcCHR8MOIv4Z2U6HCIfO6gnudel
         aHFsPc/hD8l4p0hoJouR4jGIvtl5+qw3BaZ6btce4NVO96zIt6BK8Z0hpmSIDRIHHpwD
         B68icoQUTTlcnnIc0c38iayaR6n20VHV5POuG5OorjTdxRbrmTEv4o5TVL5zYyNWmrBC
         ZX9GRtn00kWqJPlQf/097a5HZku1Xzu2ssl6IZB5Ff5Ra4Gm/vDY+GrDO4u55GnbeGTc
         hMcPphpFKnOIVaX9dvodIqyweJzfCD74nSZ48zhtn0/KclXs4ShbyfCzyE2dmqvVqASK
         +fLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tcp7YWDt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4929bbd4074si591241137.143.2024.07.22.10.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 10:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tcp7YWDt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwrW-0008Vr-15; Mon, 22 Jul 2024 13:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrT-0008T7-Rv
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrP-0006Nk-SK
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-427b1d4da32so22219905e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721669400; x=1722274200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nfDaGNYYtX7WTms9otZZ/RyOW6fJggHI+PAByoitQ4=;
 b=Tcp7YWDtRpvssscB17O8CJJ0K1Yook0ZQ0ZdLXoZbozNBycZDgTt4Kl+8+SqogyexN
 O7kD8GL768c7N9YJFd1BU+U3bzU4bIEfeLIXAMuN5KecC+RZgn9JhrVNT3wHHrEWweOm
 4Ps64CWkY+SPF8jwRX0Ey7bY8nro7uVzQs7BxqoSS1uNXHA6LcKK2QzZ3LNgnCLoBpmX
 yNG3qjhgw+c/KQ/TpNqpwnc9m4cA1p3CTMgTFZcktezSIGQOoJaSMD28pq/Is0NN4U/r
 aNPBeFGtBSm+9fCC97XxTJIVHGuDwWIFqX4Sl0wVJ02T6FOyDGG4YPa8gSVvLobsGVUv
 8W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669400; x=1722274200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nfDaGNYYtX7WTms9otZZ/RyOW6fJggHI+PAByoitQ4=;
 b=n4yC2WseJlxs9VYYkreI+ifNDKKZgjDSULiQ/FKcGreOj7KPic5jMnm3Rhppovsc9l
 SuP2bQowIFVq69bWmS6Ma6SPGo5vmmQTy+DwjvYKOrPmlGut1ntULa+1CHvgM6ijBZ1m
 dQegeKYbsMbhTdQYTqEpPRM7RdxdaXL2CPeRuSXxLzZ1ZG8GDMsaT/N1pwLAfvSnTzov
 lE3b5IiXf2cWH6ladZymZ6dmovG4DhTpMEjFkrKKaJktKV97Y0WDLj0ah1M75Y62d7JE
 T/m6jqjFkIMK/uF3m93CQPe1TFoth2b+4CT8N5IV7yq2PJyBjiy+kkpgSOpNXMESX6Rd
 TXDQ==
X-Gm-Message-State: AOJu0Yw61ApsVOTKvmcJo8Q6Ra3izlVF0cuGoSJtoUp7ZEksYuUB7IHy
 ikh565CCE5wMNS3aQv7CmwJ4zXoerifNcUa5FLycvLVs4Za0MsIJ4T1OKqcOajWeRCaNGXVkIdV
 e
X-Received: by 2002:a05:600c:4509:b0:426:67fa:f7 with SMTP id
 5b1f17b1804b1-427d2a954c2mr89604295e9.9.1721669399753; 
 Mon, 22 Jul 2024 10:29:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa493sm138035665e9.10.2024.07.22.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:29:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 1/4] target/arm: Don't assert for 128-bit tile accesses when
 SVL is 128
Date: Mon, 22 Jul 2024 18:29:54 +0100
Message-Id: <20240722172957.1041231-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722172957.1041231-1-peter.maydell@linaro.org>
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6flyg4ny6UAE

For an instruction which accesses a 128-bit element tile when
the SVL is also 128 (for example MOV z0.Q, p0/M, ZA0H.Q[w0,0]),
we will assert in get_tile_rowcol():

qemu-system-aarch64: ../../tcg/tcg-op.c:926: tcg_gen_deposit_z_i32: Assertion `len > 0' failed.

This happens because we calculate
    len = ctz32(streaming_vec_reg_size(s)) - esz;$
but if the SVL and the element size are the same len is 0, and
the deposit operation asserts.

In this case the ZA storage contains exactly one 128 bit
element ZA tile, and the horizontal or vertical slice is just
that tile. This means that regardless of the index value in
the Ws register, we always access that tile. (In pseudocode terms,
we calculate (index + offset) MOD 1, which is 0.)

Special case the len == 0 case to avoid hitting the assertion
in tcg_gen_deposit_z_i32().

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sme.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 185a8a917b0..a50a419af27 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -49,7 +49,15 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     /* Prepare a power-of-two modulo via extraction of @len bits. */
     len = ctz32(streaming_vec_reg_size(s)) - esz;
 
-    if (vertical) {
+    if (!len) {
+        /*
+         * SVL is 128 and the element size is 128. There is exactly
+         * one 128x128 tile in the ZA storage, and so we calculate
+         * (Rs + imm) MOD 1, which is always 0. We need to special case
+         * this because TCG doesn't allow deposit ops with len 0.
+         */
+        tcg_gen_movi_i32(tmp, 0);
+    } else if (vertical) {
         /*
          * Compute the byte offset of the index within the tile:
          *     (index % (svl / size)) * size
-- 
2.34.1

