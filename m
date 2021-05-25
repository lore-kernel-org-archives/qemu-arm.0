Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4045729lfm;
        Mon, 24 May 2021 18:58:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqNZiSc/ydlWmFzBKM89z0ZNoSCUIFmUuYA0urL3bmlpH/V0VzjHKeID+rmYyPLQBQ1EV4
X-Received: by 2002:a05:6602:1494:: with SMTP id a20mr18063666iow.100.1621907895688;
        Mon, 24 May 2021 18:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907895; cv=none;
        d=google.com; s=arc-20160816;
        b=ArBA565ljGR3IlZEM8hoHoEtDSaRohxTeYRulh5bR1Z8c7Es4NpSD4Zuv/7tIFri9e
         rnN1iYJJ+esufLkM79H5CCKYOVgZKYeODqHs/ROMQfc9CEOskH27CuWHUpmnKT7ZSCwG
         Y6Xf+Rw9Evpm9OMdGqlrVq2ZqMrHm0Ko/3w4bo3PoBmqR/GdVcSFn+cJiJxs5vcan73i
         Aj1/TtcUf6zbr9STmPbWbCcK/TbYfLcsNBtf+wLb5PIAEeRi3rcEOGRVZxivge3JG3qt
         m4ViBtHmzdNyOxeMID72rLZLuL6pBXjsDwcoWXP0qpDbyhpPeoQp5g2UsaaVM2GtgSvr
         +GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oldk+knzMpq2uW/3oLaoYDRDODzDy8i55wbuRwYP8h8=;
        b=vWIgLke/3VPLCyUBfcSP7II1lAamV2Fhz+7bs6Mv+OwRxgH68//ArqpoXUVw9UEGcR
         I2w7GNXWBltLnQ04ud9A8LKdC2CH0ubhIy8abQLkwu/jEuhNYPDwdOp/KijuLqqqRh3U
         4Bu+GLWb343rcwhjIh2M9h33ZoUTu5gpujWIpBN11IugL8Y0J2jvNf81j3KiMrjA0UhR
         qbPNo6Avcy7oAAF91M4Pr7umQaMzdGhUX6gpqIFPwG7UnrzovI4WrD3CSqD8qsLdCKCH
         QAkF1BZwevQp/hJuLnyDi8QLYEkxZMrX34MTABpJl3NisFd8liC+rUFJsdaJK/XnJ2dW
         w7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OV32m4kk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si5465263jal.117.2021.05.24.18.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OV32m4kk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMKl-0007SO-1P
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYD-0008O0-J1
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:05 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-000475-Jf
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:03 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso11565480pjq.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oldk+knzMpq2uW/3oLaoYDRDODzDy8i55wbuRwYP8h8=;
 b=OV32m4kkfxfWHwJyCUuQnFLS1+Gge+qVsVE5HvoxlW5uZ9IDcw0FZ7WIfRoI87do+q
 alYcmedogu2gxsRf5iY91HwKfHj8I4ABV3lT2se14iYwQtDh/vDb29r1JfHlMSuPBYwK
 4KwNJivLk1uVy6zXtkfhM8Rr8p/Txdc0ul/85Frpf9DnjwpusEUwoTqIlvq4NMWdCM1q
 XU2qds4NSK+LcoOJso91MNlNuXg9d3is6nCL2y34Wrr7bzmumsJ0n6QkD3Jx33v99e0H
 iBTWRVYi0mqyM0CpAcBIkYONy/Pxhs3PMgv0tfQs9FzvrduX8T+/FvG+511Sa5IEJI2q
 jeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oldk+knzMpq2uW/3oLaoYDRDODzDy8i55wbuRwYP8h8=;
 b=ZrqKS66SKgaUpyYhzF3DvgqhIMFGxrnqLOVfnWb02S/XnyZYY5STvx6noe/sfb4Ex0
 87PCtePebT2v4c2rtULQbh07t4XzZgkZeZAbgapl2qSJVVsVXs5jii/FNS0fNdh7Q1nS
 Hx1p3Q4qxx8JXtLyejcPCd/ZWRExp18xU/cW4GOupQ0DdIUrxZtX1gkDYHnvjTWgXO0B
 YtHgITO8n8LC+9cIqLWjd302CvCogHBGtYCKmhUnzvKW0MGlGT8krajdgfR1mriGbkxQ
 33EHwyCE8E6NXqTx0/tb+rvbCkLafyKqMO9DjvOEhk4wIe9dYktNyso5RPpK2JaCanBQ
 UlQQ==
X-Gm-Message-State: AOAM531a8YOrDXgrgSr0ofT27QS63assGEb1qkenIgEk4B7n6BhufCk2
 2h/Te2+Roym13YOw1p2VO6KZIS/kDxTquw==
X-Received: by 2002:a17:902:bb8e:b029:f4:58d1:5170 with SMTP id
 m14-20020a170902bb8eb02900f458d15170mr28067026pls.84.1621904861562; 
 Mon, 24 May 2021 18:07:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 68/92] target/arm: Implement SVE2 crypto unary operations
Date: Mon, 24 May 2021 18:03:34 -0700
Message-Id: <20210525010358.152808-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +4EAqJyQgWZj

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9f037fe5a7..a9cf3bea3e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1558,3 +1558,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae078b095a..79b4991549 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8148,3 +8148,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1

