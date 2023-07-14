Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4132672eje;
        Fri, 14 Jul 2023 08:47:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFR8wDlcqyTYLWxmv1Khj7w1mRH798IrbG/DLFyHtb9E+3ivsSgVxNRMd9WcQ0hE9UPNfdi
X-Received: by 2002:a1f:3fd3:0:b0:46e:85b8:c019 with SMTP id m202-20020a1f3fd3000000b0046e85b8c019mr3145200vka.1.1689349642019;
        Fri, 14 Jul 2023 08:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349642; cv=none;
        d=google.com; s=arc-20160816;
        b=CHKC2OnuBaXHeh9TO/6zDw++lTC4dv7ZICb45jykG4EHflVCVDjWiFTzxShiE1dvxS
         EWU/a2S+zO/YHO2XCK7xf8epWiTLGVGYIGpaPZGQimNH+hlLJF26JF0wSw5Zi4reGXml
         /QPxa+S1hx7fDTglG7mLOIEYsnPZdZK2ddVLbHu8oKxfuTEm7KpxLXvQ2HQPTz3JhZ3g
         /UiLIp/cHaZlavAnhe8cinQQPXbZP2HV1wAoCRqpsX9c8Z422wfICwY4CbkVue3vp2Mt
         kaaM/LRtYzmUw0KudtcpeaA0RUCO8GEOvO/JvhkTD1OE/03VC1MsALIyyRNRMzXn+Nr4
         hl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BuUwbulU5zL9tN4hCYlIE1gc3ZvqjDoeI3CgFmuY05s=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=vhURnDHn/Hmo1CfbM8+W0Z//wXxVNGThO+uiIofKm6YEEa9pD1BOdkvPoPJ+hKQATL
         1JgoduVi+m1cMXVnI85Lrv3TMx85EoerNdaTH1887wFBFQh+NRVRX8+zKWzvzTJ5ASQL
         UFn822lRbHST0MlOpFvhLhf/0cHFDP1bDOzQ6MkjIkcXP8CCFaJmICbULZvb4Qeax1hZ
         VRCGzLJIs1voDZKuA+CI/Ox6hsafGor0FbofTV92wm1UMdQUrTLBkUDEO1LnGDfzQ06O
         ZnguGKcqyMQ/pm41gz+/v5IBnyhKPINgj6HIfhDx0D6PRHtsdGc1h9q3gk2O3vbO2wCz
         VUKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K1xbhVUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l27-20020a05620a211b00b0076721f3a2absi4457851qkl.727.2023.07.14.08.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K1xbhVUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0f-0007NG-Q0; Fri, 14 Jul 2023 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0d-0007Lv-Is
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0V-000784-AO
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:47:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31441bc0092so2190055f8f.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349618; x=1691941618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BuUwbulU5zL9tN4hCYlIE1gc3ZvqjDoeI3CgFmuY05s=;
 b=K1xbhVUAuJ3hjYDrUvp8TvNkYxIkOhCMjVcqGXw5fqbgbEO62fH0/9sH5BByXWlaa6
 UZLJHpSHva0rC5fsnO2Wm1U8wk1JxHaNQ+ExSENQDbMw9nNniPsv33WEXUitKGkCnuoH
 qKs7YDS0HKCwemwhmQXYhqHx7x+XACsEkrf5WAm6qFbiGM3N5lUj0a0/KPjx9C2iDqqf
 0agY5PZOd5vyOMfX7Hu2cXGjxYVDF1AUMpqdW5vImUCeKdhjjGWa7ElMAP4EtJpv0YNk
 Zv7lTJBNSH2MRIjqgLb/cDjYdrbhzyR3tuAPpMgZz6zPSoMIK8cLJxRF/u4d9Hbyc5Dp
 Ghuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349618; x=1691941618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuUwbulU5zL9tN4hCYlIE1gc3ZvqjDoeI3CgFmuY05s=;
 b=Y9G/AX+xmTgNeymkQUwrn7pp5lbt/09Y0L3dntUmYJv6RrxmsiuluAEE/L20rqCu5V
 vhWx8AvPmCc97GrIDfNefE8IC6qE905UM+1T/3KjTuvB/xw+7AKa8pgeGw1JyUzDTmA0
 6vcjUYgyxtlXbEtf4lb5ebNYIHgzpSK0dUVDQ73BpBsm0lo8HQ5WCtrYUbEG/Mg2f+A+
 pRhBJv4+4/VvfavscAZMVxoIEYbznuWoUPuLTLrhKd+NJHCySa9LIhDnpzkPE+PjeAFZ
 4M25GS8k8FKx/tPcFFUbiDUuwOJcSGq+v5NnUyggJkIrSVAQUUf8nxfFFUtOXVV0PjuY
 l4KA==
X-Gm-Message-State: ABy/qLZDDa/HSJ4Ntw1yKXuIKt7BcXb7KoNaxWeu0skiuvSkvdKoX/0H
 X0gP7hbxTs6tW8h+N+KfkYtfTZ53zc6JS68Q1w8=
X-Received: by 2002:a5d:68c6:0:b0:315:9d61:6e66 with SMTP id
 p6-20020a5d68c6000000b003159d616e66mr4770217wrw.9.1689349617995; 
 Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/14] target/arm: Adjust PAR_EL1.SH for Device and Normal-NC
 memory types
Date: Fri, 14 Jul 2023 16:46:48 +0100
Message-Id: <20230714154648.327466-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: utfxtT4naCvT

The PAR_EL1.SH field documents that for the cases of:
 * Device memory
 * Normal memory with both Inner and Outer Non-Cacheable
the field should be 0b10 rather than whatever was in the
translation table descriptor field. (In the pseudocode this
is handled by PAREncodeShareability().) Perform this
adjustment when assembling a PAR value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1e45fdb47c9..f9c00827018 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3342,6 +3342,19 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 #ifdef CONFIG_TCG
+static int par_el1_shareability(GetPhysAddrResult *res)
+{
+    /*
+     * The PAR_EL1.SH field must be 0b10 for Device or Normal-NC
+     * memory -- see pseudocode PAREncodeShareability().
+     */
+    if (((res->cacheattrs.attrs & 0xf0) == 0) ||
+        res->cacheattrs.attrs == 0x44 || res->cacheattrs.attrs == 0x40) {
+        return 2;
+    }
+    return res->cacheattrs.shareability;
+}
+
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              bool is_secure)
@@ -3470,7 +3483,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                 par64 |= (1 << 9); /* NS */
             }
             par64 |= (uint64_t)res.cacheattrs.attrs << 56; /* ATTR */
-            par64 |= res.cacheattrs.shareability << 7; /* SH */
+            par64 |= par_el1_shareability(&res) << 7; /* SH */
         } else {
             uint32_t fsr = arm_fi_to_lfsc(&fi);
 
-- 
2.34.1

