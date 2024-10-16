Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp938753nji;
        Wed, 16 Oct 2024 14:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV0+58FK5cGXv2WG8/Z8RHcIitZEqDLfXPUxG78Xz19ZZGpQys5uv0q9/aG0KiWxF1Tb2wYcbAI1pddg==@linaro.org
X-Google-Smtp-Source: AGHT+IGah9DsLQDKTZb3SoooPARQZtUVIJbecKtrMDT1coPmrdw8IJw+ubr+UwpyqmmYEaAzP8CG
X-Received: by 2002:a05:620a:2544:b0:7a9:bb10:e072 with SMTP id af79cd13be357-7b1417c81e8mr875262785a.23.1729113966563;
        Wed, 16 Oct 2024 14:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729113966; cv=none;
        d=google.com; s=arc-20240605;
        b=ZR6E7PMlg0UsQK6sOPWh5BY5XoNjNTYIDbrob2KtCjKmQNNHczZbsMG64L6cbYoWoX
         rH8HSMzscEt4INGr6qtoB0G7R7QoXxBxuqZQ0SyxXtS3babB9YBUTDvkUbsmzm+abZOf
         JQZpeOdPTC8NA0o/T8Z2wyGnKUwg0fNj7NdPVpodKW+iQvotaZwEl48OKfmDggc3Drn+
         Y0chULR8FN64sQ0MqH232us1ED/t2cVMqQJY3tbDNW5rA35kA1OsG8WovqZrtzGTyFDm
         z2aqfWftoKTN6Ww5bcQ90lXL3iZvhuEPSDcGQIGrGa6ZArqZtOKOEPUthYyUGFaih9T1
         MzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IVwI7uw91/Pzkk9Jwk813s5wFhg5RsQ7pjAvW6ZM0yk=;
        fh=HpJ44jJu+4e/93kVlagYwrCNyprpMAndm8Qk9Mq8JRI=;
        b=PXfIduRCrnlzYdElBn5UMDG3RgND77OKNdjwhUBSnIzmeio9ef4kNGO38/PabYi5K2
         bgMTMV+3IZszFRRFxUz3XuhJ0up65CCiyC5mdkSeWBulg9mn+QH28xcOVHSM7cyQnanL
         mTdywGBV4fxGoht7jRx0GoELyiAKq27OWnCeWR/twfvqZqBS1mbUSRCkfJfjFcsOdceL
         StHgA7jsD6Fvk0C0C3tU8p09y9H3hig5HThxffze0OSVvhHEBgAk3+wbY1OmxIS/UaVH
         DQnKN7N5Rh/PsPRuFJ3wuEsKCm7WFONxjhz94xvpOwVB+irJL2UD/nrr4ZcClnAuHSRg
         5V8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWOAG7oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1363e1a2fsi462945785a.446.2024.10.16.14.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2024 14:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWOAG7oY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1BVI-00026v-Rc; Wed, 16 Oct 2024 17:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t1BVH-00026D-34; Wed, 16 Oct 2024 17:24:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t1BVF-00012l-Jz; Wed, 16 Oct 2024 17:24:22 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a3dc089d8so35288266b.3; 
 Wed, 16 Oct 2024 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729113859; x=1729718659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVwI7uw91/Pzkk9Jwk813s5wFhg5RsQ7pjAvW6ZM0yk=;
 b=RWOAG7oYfTNfVRMiQMzHqb5HQibO/pAav7cYa8FlEJFBsf4rUBne8cD2OcO6zviTHr
 BIRIZtBbhFAxA83rIpobOdIjvZaLuEwRwKLQlMJgfvITOi89KkFjS0ybMNahIL4UMSN1
 iL/jv4WJKGo57GoUdeeloUztWU1uXyrdMDNhq+EzSidn3ateUzBBiXJJFAIHppsfUpO0
 iObzxSbaxllZx2/Spm7ywmI3VNByVk/YRoAxMCubQsXUIsW+FnBI3GdZt65lLQjMBwrh
 17nASplr3lwfMszM1BvD3mw8WSUAZNdZNF3aqAk9/sDJ9SHjoDBk2Y2mBViBgFViozj+
 wDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729113859; x=1729718659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVwI7uw91/Pzkk9Jwk813s5wFhg5RsQ7pjAvW6ZM0yk=;
 b=w3pq7gVxGb1GGvep8E1m6gaJG+6CROnvxsozml2zwqf7kEFQeh3PaMsGgkm/JirnhY
 tDK1Enb+uqNyCdpOKi67+c303punnV9G2zC/tV6tWenobPke42X+jAWcTkKRIBODR7e9
 I/I3nkh0eacdihncORtbbQfsKkhvteoEKVxOLaBAlGrhJGvTQqkwFpsvPIUSEVAA/2b9
 GR+ty8iLKIm3XucfTGZr7WlB4wudNsVMsoEBic4NLomwnPgBr9uGTNIqoxWbdPXtXYsB
 2K0MkIGq4FgBv2BKqz2j7fi6Fe3INsuLPomgE3GWmyXpqQeoTtpwQkDTwRTQVUNULl+6
 w1TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7VmfSIG/enfooUthViXOut56iDursRKTzeNSdF02ee5Wl3FazNw5J/WB3f+DaNSFq8OXQJQJZ7A==@nongnu.org
X-Gm-Message-State: AOJu0Yxi5PV3bDI0FoUReJQE40PbvgBxdijEz7N4WG7p6IVtv+H6pNxX
 o6CQT15Y/ELWtO9v+mRWOdDhUpL4lWOjWGjl6uLg9HLjbHcsy0S2PeG0ng==
X-Received: by 2002:a17:907:788:b0:a99:46dd:f397 with SMTP id
 a640c23a62f3a-a99e3e9c018mr1643215366b.64.1729113858896; 
 Wed, 16 Oct 2024 14:24:18 -0700 (PDT)
Received: from archlinux.. (dynamic-077-191-025-143.77.191.pool.telefonica.de.
 [77.191.25.143]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29750a9asm218005766b.88.2024.10.16.14.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 14:24:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 1/5] hw/resettable: Add SOFT reset type
Date: Wed, 16 Oct 2024 23:24:03 +0200
Message-ID: <20241016212407.139390-2-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016212407.139390-1-shentey@gmail.com>
References: <20241016212407.139390-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vbjR8/zF0aze

This is a preparation for the next patch.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/resettable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/resettable.h b/include/hw/resettable.h
index fd862f1e9f..0f25beaf21 100644
--- a/include/hw/resettable.h
+++ b/include/hw/resettable.h
@@ -40,6 +40,7 @@ typedef enum ResetType {
     RESET_TYPE_WAKEUP,
     RESET_TYPE_S390_CPU_INITIAL,
     RESET_TYPE_S390_CPU_NORMAL,
+    RESET_TYPE_SOFT,
 } ResetType;
 
 /*
-- 
2.47.0

