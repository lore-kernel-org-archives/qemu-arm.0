Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2160894njb;
        Mon, 17 Mar 2025 04:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV69jxk5ACsWehVGDBpD9LULiX1yDaVuJEHzjmkMIV/+dWG+61xKpg8r6PCwVeUwOZJshDy7tt1JChSxA==@linaro.org
X-Google-Smtp-Source: AGHT+IF6x8bfm9urRYFBOgLV5D7fTTcfucMWjJqrvZf52G9lk+U07g0x4U+QbR8955YcCGBk75nj
X-Received: by 2002:ac8:5a13:0:b0:476:823f:5f6c with SMTP id d75a77b69052e-476c8149ce3mr180423571cf.15.1742210241196;
        Mon, 17 Mar 2025 04:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742210241; cv=none;
        d=google.com; s=arc-20240605;
        b=EKeDh39jXRwBoVxzfb/d5UjGx/GemnJ4ZiM3E5Cuc6y7FNetnuEul/zIbuDJTIVbV/
         AE/OmeXAAH8Y3gtZkzImAitJg23VgQBcN2UpZpm9XZK2tKE5d83TUwiZJYnDhj4WIyDL
         CrJPkQpy2Nw0G/74Y2C5OXY9srh93/WHkea3EI6uK/xNpFtEHMbBvXcBtd0R4kqWWPJ2
         +7r2OAc/89RagygCMgxF1c2vRNbQzwG3awPkPrhblbh8aHkSktAVxbZkNZWCUqqxNNWI
         WjBqMGhQ1t3Qyelyx7ZiOqquHzEpPpTVzbp1pF8EMKwKoFVmAE37Ev6qH6QXyWX+Pkiw
         1SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=n00C0NGiRsylPrGNrVbaRTDfd35POgbU+yC+rvmTlgo=;
        fh=Y6491rFhbW+ThdGAYvBdUzBHN3wlmEpy4KQSmFkoKH8=;
        b=Kq7n7OAl5JFohhJo1DDA/7HS5G6HY2YTvrF19iu/rq4l4UJbHb6lRgbCImTuBUkML+
         fg2L5fVWHci8arP+blFlFw+bRcD4PZ8KvkE5ZkOq9MFY+21rKm+rHAoBkTLu3Oh74G0u
         WJRFTIQBr4tfhWD0x4kRAAlwhv3DtdouUIi4AGnzLrKWwGjOabtQIfl64vfxQuUjcH6F
         LQ+bbbR4G5GNQD0urxjtCShtatp5Vig2o/ECrQhHBl3/urMeklek9CJbd9gNVd8x0q/A
         aVPpNTUP+rIMf1O2m/FGSmtKOkKSLOeH1OnNbyvqehBTc85JVrliAzSlijBd3MLVUS4s
         VtUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=A8LPcIbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7d9203si101893331cf.271.2025.03.17.04.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 04:17:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=A8LPcIbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tu8Sk-0003Hu-Tp; Mon, 17 Mar 2025 07:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8Sb-0003EC-06
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 07:16:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8SY-0003lg-Vm
 for qemu-devel@nongnu.org; Mon, 17 Mar 2025 07:16:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22435603572so64283695ad.1
 for <qemu-devel@nongnu.org>; Mon, 17 Mar 2025 04:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742210201; x=1742815001;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n00C0NGiRsylPrGNrVbaRTDfd35POgbU+yC+rvmTlgo=;
 b=A8LPcIbgN/ydIJcFU58qheueIGIUZvBWNgXqoihK24JL9tVa52sTlXwz+XKXta87kH
 9xvwY15jseuBFD4eDM6sgpIFcAQ9hPBxr4Hjgdkn2niZGXknqOwUOu+Y7M6+pny/bqgK
 Dbk9UCJzt/RZRLTNXsO5dvQYEtfsjb3dEPkMXgJgMPY3hEO8NbkiTTGye5mAfRYeKVKq
 c0yEjm0ohd6PpOgQqpmms/jDdKux0WMPIcNPJqPrWzDz0CLrxQotMw+Bsi/XrBrXZ17y
 b1GcKIILiw/Jsl3HxNN0uZc3Ym3eTg8XlymgnCD0vbGMi4uswSHFJz3DfORo0i+hIiPd
 c7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210201; x=1742815001;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n00C0NGiRsylPrGNrVbaRTDfd35POgbU+yC+rvmTlgo=;
 b=Vx+nULosh2DyHE0549X7nhPNXdr/Vf2reeyy96xkhW4NodPhHdRIabmM4D7YQHP1DH
 foGfbxFl70Ol+Ggz1/dOZkzFkzPEz6/RsJh/LNOd2k9xmQjCYv4dycmaHuf96UM5JRsO
 7X9rqDpeSytempxSahQfG6KQRJKRwn3ek0W7I8LX4kPOo+Mz0n8QvY6os5L+bgwcwMgr
 0Rqq38AHCsm8z9ZsSooaBIoojP8fdSzm/wiN4Q9ocSguc/jhoi8KF7CEV2xjONcl8btK
 ksdWZWe6pLGnFPXkt9KMQwWxxxQ/B0AU2SwwJTjEUcvmxeDzc8vGRyPvOUiRzv/enwxp
 ymtQ==
X-Gm-Message-State: AOJu0YxJUIzph6m/3pVhryjcTDwZteCw7w72NhUUHEkGuSyy5OksYAtd
 j0r4mDLMSkTaDW9WnIVoy3ugEDLXiILDduewrBPhpp1a+uxW8M6Zt2kHdhTv2AE=
X-Gm-Gg: ASbGnctY9krf1XFTac/c8+LChVWs/Lrr6kGJQYdHlPi7rfKRVff4xMYb2J0B9nK+3ma
 08BiKj6o642u5RqZ7y3HiQ1psvCOJXjJiNmarL5qQ/jSmRDEZkO56pr8ny3k0ytp3GWey8eq3ju
 bPu+Ino9jtjviOocrOocxZI9mx+d2LpMug+OS5aNscjGlpQ5dNUNq7yAGUBTbobW8T7X8ElrCBd
 0Bmjq7UEGVl4YdLHltEE8IMo1zhocRHRwRIO4vhe3qaZ/RbtYeCtc/Wd+cAMwurw0OAquYShREy
 1FMyoPdQ/oQrPu9rNhPswuzJrf2j6stm9UeU+NQRsKARUS0m
X-Received: by 2002:a17:902:ea07:b0:224:1eab:97b5 with SMTP id
 d9443c01a7336-225e0a1969dmr147611725ad.1.1742210201344; 
 Mon, 17 Mar 2025 04:16:41 -0700 (PDT)
Received: from localhost ([157.82.207.107])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7371155e3a9sm7317149b3a.71.2025.03.17.04.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:16:41 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 17 Mar 2025 20:16:24 +0900
Subject: [PATCH 3/4] target/arm: Expose PMINTENCLR to GDB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-raw-v1-3-09e2dfff0e90@daynix.com>
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
In-Reply-To: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: SkLYu60W32p6

PMINTENCLR and PMINTENCLR_EL1 are aliases of PMINTENSET_EL1. Expose them
as we do for other alias registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5ce468ac2693..2dd8f4d56a1e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2025,14 +2025,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
       .fgt = FGT_PMINTEN,
-      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW | ARM_CP_NO_GDB,
+      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write, },
     { .name = "PMINTENCLR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm,
       .fgt = FGT_PMINTEN,
-      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW | ARM_CP_NO_GDB,
+      .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
       .writefn = pmintenclr_write },
     { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,

-- 
2.48.1

