Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333515ejc;
        Fri, 13 Oct 2023 00:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpLjriAmt1MxB19ZMnd2t5qxqoBZs4i4vSUiRVFE9jL+7UNpgzkB3oiu9B9yXMcLGnT707
X-Received: by 2002:a05:620a:24cb:b0:775:c0fc:3c4b with SMTP id m11-20020a05620a24cb00b00775c0fc3c4bmr31825501qkn.7.1697183944160;
        Fri, 13 Oct 2023 00:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183944; cv=none;
        d=google.com; s=arc-20160816;
        b=KLF3UVRsGj25gHFhCnq5vJSAzltiHEDP8v85TyEWKwfUcnSMjp1C7odbNGZwfX4nKE
         +incvSQPZKhqBIpezsUzruHS3FPznKoYJf+bTKcmEIjtVEzXPhkVITRtvBCbgGWd3+hR
         wNpK06I0XSYxmUzvHKKHuR5d5c8s3YZdd6vq7C9ooGAeiMshSnGv2FTrzzd+fmbxzDPD
         9G+zIJyt8dTgOazfT0oQkiM1PQS92An5zHzrBf74n8Oghyq2HYv/p6cz0RKJTJVp4z0x
         lWGq6ICJrU5Hin1BmogtABuAp/5PMTuD3Vf77JlIqlbA+Ba6pO58tsl6MaKmkjyhE9y9
         pLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IVkjMSxl3+eH0Gmp46frWDOQAJV2R3z1peLcSt42xWk=;
        fh=kfRnWevg1jmrjhuthwC6N5D7aCsTzqsHSTkyAiKxMc4=;
        b=Y5sK1RTjVGdlnusPWnRFzr9XzILRX7x9oDw0Kl9PfolqmxvBwhODMvct4lyZrJEN8w
         4og1F0/4UDB818d2gHXbMS3ZswHdKp7J9jcNwJQ9zNSpVbPhkbWRJkkxQIZSmmLrHVi1
         aCvLzfgHG9Tyt3QE7uTmcezxoHzo6qc22IRzmrEG5YCSRPcOkl5FGZOZSrDd3Swlte3l
         aNRC4X+BraYnhkQXhol/nrqxNZAOTTgJeEFxfLTXJgOcmVd5SrzE4ZeE7blbfdiBLAT2
         IEjmdAnjt1Yy9UJUUb7vb5aPpJ3Sku9pzHW/+0GwgPebuRSjYy0IUyz55u3Q7U2Zi404
         e3rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpd2khwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020a05620a40c900b0077703bd9771si848039qko.364.2023.10.13.00.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpd2khwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCyS-0003eL-76; Fri, 13 Oct 2023 03:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxh-0000C8-8E
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxR-0005Ax-Pp
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so1699663f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183498; x=1697788298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVkjMSxl3+eH0Gmp46frWDOQAJV2R3z1peLcSt42xWk=;
 b=xpd2khwl+Fu+4IsRWVD4NxgtryZYrH0JOF5pRXCsduFgy2g1gaYA5JoPZ7aNXw/J+W
 kTT4caeqJN/4s+JfoOOibPakQnjyyM9Ktgk8OCK3PcDGLS67bdfD5Tv/VnKcrEI6PspX
 aagkqcqIQCM6NC2qh46/YO0mkp5fLOTcVANg1SaRBqvbrt0If09pfy5K8qwH6ny3lH9Y
 uXdgzRJbvwoyo4KDN9uVCrQUpo6EGbq8ITNe0OT0XvJX0tStrH/La8cNO6Sf4mP7NS/T
 SpAIILlwO2JyeNSFBNxzu/WPZ5IDW5GaMtm9ttFN7pO30vvwh/H3AN4bRgMr6PvVrvpY
 X6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183498; x=1697788298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVkjMSxl3+eH0Gmp46frWDOQAJV2R3z1peLcSt42xWk=;
 b=wr2B/PeVXi/7xnTZEQ3kMamy9Q45XETJtc7fAoZLuQLNnKr4F34Xb3o87edqK66Jt7
 2eMCWzpkcTONx1+C/UFHwuDcxd70Rh33XNI0ajSN271ngADWCKwna2h2j4g3tOukN5Eb
 VN4liM7ecOZptd/SSp8ycUcT91wt3kjkdd5DUr175SDzY+blDG6273YygxF0hjGzW1gK
 3MI04+Cv5CzPpYxAgBh/LEfKIfj37UU/ewWCa217mrgxlvDyRD+FzbPt1CuypXD/9hzJ
 voPhvysGwpp8vZSDS1l1PV0Fvgu8Uo10HJ8VIVqHqoA+s2F5Z1K05pX4rLpEOG+WrPlP
 UCmQ==
X-Gm-Message-State: AOJu0Yyww9vubL8wjUhI3s+xTzrzN3t1l98/6PXJ+9rISqdgK+kttoEK
 pfeAyt66Ek1Fz1prulmSdlhWhQ==
X-Received: by 2002:adf:f94c:0:b0:32d:a0a9:4785 with SMTP id
 q12-20020adff94c000000b0032da0a94785mr20256wrr.7.1697183498496; 
 Fri, 13 Oct 2023 00:51:38 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:37 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [RFC PATCH 47/75] contrib/vhost-user-scsi: add fallthrough
 pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:02 +0300
Message-Id: <b9b8043e46c25e0c209c2f96e9b8b44f40133fc1.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: hrmnV3v+VVFV

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 9ef61cf5a7..71076f579b 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -109,14 +109,15 @@ static struct scsi_task *scsi_task_new(int cdb_len, uint8_t *cdb, int dir,
 static int get_cdb_len(uint8_t *cdb)
 {
     assert(cdb);
 
     switch (cdb[0] >> 5) {
     case 0: return 6;
-    case 1: /* fall through */
+    case 1:
+            fallthrough;
     case 2: return 10;
     case 4: return 16;
     case 5: return 12;
     }
     g_warning("Unable to determine cdb len (0x%02hhX)", (uint8_t)(cdb[0] >> 5));
     return -1;
 }
-- 
2.39.2

