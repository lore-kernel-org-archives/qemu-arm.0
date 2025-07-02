Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3786454dye;
        Wed, 2 Jul 2025 05:49:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdli0++lSfJH+KZ4hrIUWt4ZMNqoOnj0oCdZPf9dR4n0/dpIQfx8bhtxV5I8JYQyq2ZXL92c+1fb+P1A==@linaro.org
X-Google-Smtp-Source: AGHT+IGYsvumVCaw+9yIFHKlq96a62OeXVrGQguDJbUpTRamONIvnic6N7Mh7OP7vgwUPsTy7QP1
X-Received: by 2002:a05:622a:11c5:b0:4a7:f9ab:7899 with SMTP id d75a77b69052e-4a976a53c98mr45740691cf.35.1751460572689;
        Wed, 02 Jul 2025 05:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460572; cv=none;
        d=google.com; s=arc-20240605;
        b=ch/rmUlXK8NrQTlrOpACYqOzsS5v35q1znsADcVenY/xoOedGcp72srlrTQWTUhfXb
         nXX1a8RUSDmqtIDUjr1c5vD4OF5vnbMm7xw6sjy6LAN+Yx6rnzRv8VXUafvCIt2bmUSL
         IdHmzIzdKMdxo18HFMqMXsObCTGragLroMOLnv76kJhd/yWkOtyUganxYY6ZxSac1/LO
         zLLC6fNoNYNsx/zc+xaimcwq2pfwKl/+jOg0UC9Qq9EBTEWGOcf9DXDoyAXFx128ATvC
         +CmL50ppW2mNPFjBBXgPoXXTIjU3dFUtEJSkQzX6J3Wrm9ZltSkU1+s8Qs1pL/SdMNZU
         O9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gnQQwPUcGNU55xKcUQdL40GZ68GnX8A1mo+tbkfibgA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=Nd4Bty27o9QiNaY8FBUDiutkIbS/z8fiRkcBGINjxEecNh/UDYe61g3ELoaDKfUpJQ
         yHFwmQYE5os/ojERxrvHgQyI/cVYdw41zns7Izxr6r0wichDHUMRqLgvLIwU4JbJEKPo
         kWXgQLiQo6xRe4vm4cpfq3cu+F+Qqf7Fyedj2uxDt42KVpdxCa4/ViZeBIou9lhC7GwH
         vKww3pDFWdbhuAGtpAYo6TFAnYXQz8FmSp8LYZJCj1D1PaZ73LMS21KtcaLQZWybXKIO
         g/yY+MIzWYMI213LaTcudI6tgnc2ImdxWOKR7XlINCGdVc+8eENpfplrIbwhgrfKcRTr
         c/uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crq7ut1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fec91si132822061cf.112.2025.07.02.05.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crq7ut1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwqJ-0006Px-CD; Wed, 02 Jul 2025 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwn0-0008Sn-5O
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:16 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwmo-00038O-GQ
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:42:06 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2efb0b03e40so1236207fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751460120; x=1752064920; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gnQQwPUcGNU55xKcUQdL40GZ68GnX8A1mo+tbkfibgA=;
 b=crq7ut1UnDu1FdvCLzUKjKvVOP0GjiFkFHgM2OEM9brg0WNTQFr8E6EOaGg9jXkAH5
 l+e8r5J0+BhDpsgPWvMzvgEnXC8UKy6ZSwsPA2O76IP5fDyxntUMlmcv8IJ5a0tYQFq/
 W6/KW1Xyu5d+0uV4WfX3HXj4Z5MQmVucr2R1GteEGAZeVg4da8DvXK2JPs0C3pG+ubTz
 Azib2xzB+iRNJBfB9/gcA8UgvDdq8u2XZJ3ukXSTrBZDAWgjJjDQJE8ZLYt7RA3hwLa4
 +4IJcOTmHEE3sVj1/svq2qTQUl/f7iiIwmiYTItqlIkVCS5vCA5oEhHjIt/9+kokBjKt
 NbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751460120; x=1752064920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gnQQwPUcGNU55xKcUQdL40GZ68GnX8A1mo+tbkfibgA=;
 b=lzPDmj4mniVePFobeP5Ut977B5m8c0EyAxVgm6yUEnEQvOANGzTI877xKuah44lgNK
 HK27TngsYKrg47CufiYP54YWyuB9THqDnAfIyxWcVn0qp+tI4pqlzD1X7n0sm1szdqCI
 Vg0Uv95LFiaN4WDkbeE0j+pKHJQNbXcY79I9H/wrHwk+pIwxUnsjEgZ6OMHyOzuXVW8H
 dn2sP3i1t8tPxTXq5Y30MevP2BCwwX/xtgsVvo6Dlh9Zeqfy6hsWJ2tmOI5cAAj0V6JC
 bVRxkB3kMM7O8u5NgRV4sOsgJnOZEq1759RZHsGzo9NFSL3lInEeUSCcwXyD8PeUf/Rc
 Yv2g==
X-Gm-Message-State: AOJu0YyWSJY1zqBWr3u3nx8bZLnERMKVnpGUOQQBkRHUP54OEfvlqSbq
 +1OUOpUDhZgJwxtz7ZuYHw2lUPXglDLDBXxDpd02fkoT/j58eybNvec+meIE67TmdGCQ2niPEXy
 SQR0ZDc4=
X-Gm-Gg: ASbGncvASvJ9WnMM+CRu/ff/3ld3jk+22jqzMcKgMrmGwbBo1vhgCHSh3cK3Ov91uSe
 6sTUfSK+W9ZYrxWmgo1UjWNq/odcbC4ETodoU7I1nDFLiMaIJ6RckwGC7hbRdixZ0bwhQMGvdoz
 wGv22Z9paRlOS30/ZMTwX/KDI3nVMVv7r7UQOeOMRVTjag43IYV8GezXkvfhRD+vV+NfDk3IkkM
 +WIKDPSupwC7S1VAuEx2qDpDaRnfQZNHCaB/reCGo1/wzk+p3tR0aqpEr1KsGMlBDs6XwOifhsc
 kBOrGi6XkZjJBamm2xCm+buQzBUmuYGTbFpebphrdCpPt22ybBgayYWz3EWw9vW/EuribQ==
X-Received: by 2002:a05:6870:d0c8:b0:2ea:73bc:1304 with SMTP id
 586e51a60fabf-2f5a8cffcd1mr2281248fac.30.1751460120333; 
 Wed, 02 Jul 2025 05:42:00 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50f7d89sm3907004fac.34.2025.07.02.05.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 83/97] target/arm: Split the ST_zpri and ST_zprr patterns
Date: Wed,  2 Jul 2025 06:33:56 -0600
Message-ID: <20250702123410.761208-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: M+p9KVbLGGel

The msz > esz encodings are reserved, and some of
them are about to be reused.  Split these patterns
so that the new insns do not overlap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve.decode | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index bf3d4f4853..7020771898 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -252,7 +252,7 @@
 
 # Stores; user must fill in ESZ, MSZ, NREG as needed.
 @rprr_store         ....... ..    ..     rm:5 ... pg:3 rn:5 rd:5    &rprr_store
-@rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
+@rpri_store         ....... ..    .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
 @rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
                     &rprr_store nreg=0
 @rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
@@ -1334,8 +1334,16 @@ STR_zri         1110010 11 0.     ..... 010 ... ..... .....     @rd_rn_i9
 
 # SVE contiguous store (scalar plus immediate)
 # ST1B, ST1H, ST1W, ST1D; require msz <= esz
-ST_zpri         1110010 .. esz:2  0.... 111 ... ..... ..... \
-                @rpri_store_msz nreg=0
+ST_zpri         1110010 00 esz:2  0.... 111 ... ..... ..... \
+                @rpri_store msz=0 nreg=0
+ST_zpri         1110010 01 esz:2  0.... 111 ... ..... ..... \
+                @rpri_store msz=1 nreg=0
+ST_zpri         1110010 10 10     0.... 111 ... ..... ..... \
+                @rpri_store msz=2 esz=2 nreg=0
+ST_zpri         1110010 10 11     0.... 111 ... ..... ..... \
+                @rpri_store msz=2 esz=3 nreg=0
+ST_zpri         1110010 11 11     0.... 111 ... ..... ..... \
+                @rpri_store msz=3 esz=3 nreg=0
 
 # SVE contiguous store (scalar plus scalar)
 # ST1B, ST1H, ST1W, ST1D; require msz <= esz
@@ -1344,20 +1352,22 @@ ST_zprr         1110010 00 ..     ..... 010 ... ..... ..... \
                 @rprr_store_esz_n0 msz=0
 ST_zprr         1110010 01 ..     ..... 010 ... ..... ..... \
                 @rprr_store_esz_n0 msz=1
-ST_zprr         1110010 10 ..     ..... 010 ... ..... ..... \
-                @rprr_store_esz_n0 msz=2
+ST_zprr         1110010 10 10     ..... 010 ... ..... ..... \
+                @rprr_store msz=2 esz=2 nreg=0
+ST_zprr         1110010 10 11     ..... 010 ... ..... ..... \
+                @rprr_store msz=2 esz=3 nreg=0
 ST_zprr         1110010 11 11     ..... 010 ... ..... ..... \
                 @rprr_store msz=3 esz=3 nreg=0
 
 # SVE contiguous non-temporal store (scalar plus immediate)  (nreg == 0)
 # SVE store multiple structures (scalar plus immediate)      (nreg != 0)
 ST_zpri         1110010 .. nreg:2 1.... 111 ... ..... ..... \
-                @rpri_store_msz esz=%size_23
+                @rpri_store msz=%size_23 esz=%size_23
 
 # SVE contiguous non-temporal store (scalar plus scalar)     (nreg == 0)
 # SVE store multiple structures (scalar plus scalar)         (nreg != 0)
-ST_zprr         1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
-                @rprr_store esz=%size_23
+ST_zprr         1110010 .. nreg:2 ..... 011 ... ..... ..... \
+                @rprr_store msz=%size_23 esz=%size_23
 
 # SVE 32-bit scatter store (scalar plus 32-bit scaled offsets)
 # Require msz > 0 && msz <= esz.
-- 
2.43.0

