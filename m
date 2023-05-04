Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp204797ejq;
        Thu, 4 May 2023 03:42:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QSqt1zgUIQRCbjQntxb+okafl94OCsgpeA5r8xFSwWGvWo9DETozIhEtiOisSIGuV7iYd
X-Received: by 2002:a05:6214:29ca:b0:61b:5a60:329c with SMTP id gh10-20020a05621429ca00b0061b5a60329cmr13366991qvb.39.1683196966171;
        Thu, 04 May 2023 03:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683196966; cv=none;
        d=google.com; s=arc-20160816;
        b=PMNmFgJCYv1hCQhdd57DIIJ5GwPVFnHGD4QAe4CFC1cqpuW/4Vn5nLAqbnVMPVBeMx
         k6Q+rh44WkshmKndRuR54q5T65HduOpLuSRQmLUCSv+vuszL6aIzbLh530Fp4Ii3R+Jk
         buOfnFS074Z7HTCn0GTkKZxkFtsdwI2X4QIX0l0jWnQtbRX8Jju03WvzPYCXf8lgim/6
         Gn51EPyhS8xwseWItjE5+i+LdNSleqM3S44Ic63Hr6kcwQjydY6VVjIpoqQiaGIRRkrt
         KbtFdBwa/E1Wz5VNNA3wEpnNoZ4xjqMqttNfHidEQA3WfxZy6+qpwvUbxa/h6od8YZ7w
         SqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=n7vQQ3BCTeRFq/ysBUUocz5IDjn6DJp11hxaWsFLtKo=;
        b=tG4/PSMOWpC9CS32vkLWqhER+vLg2ccy9jqCyerxxQOLq4ZmsOo7sCCxgeO7UDtvoE
         B06lgavrvuX/cZHXScO8Egob8SIpSEULfrxhD8XkXApSdf0qQQRefCpJRiNfvyaTtZhI
         fOzPAWSZ1v+50zokiiJA55vkNrAyj0Ns+k5s5np36M/7q3y8pVwl1Egjzoz7p2ObkJAM
         QsKXJ3Bhdyp95nd/7agWbxKkxGCnMuFNzAM224srXinnU9e0JfOcxdUNKtMpw6SJ34Zk
         t6Ira1AZApPpeXmOZ+qIqO6gblnKXbzoW1ioDc3OXy6PNSktoVx3tZlV151110ZFPpaW
         b4Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ues+fT0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05620a444500b00746abc156e7si20412757qkp.332.2023.05.04.03.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 03:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ues+fT0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puWQ6-0007h6-5X; Thu, 04 May 2023 06:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWQ3-0007gj-LX
 for qemu-arm@nongnu.org; Thu, 04 May 2023 06:42:40 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWQ2-0000yH-0c
 for qemu-arm@nongnu.org; Thu, 04 May 2023 06:42:39 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd87539c2so477474a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 03:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683196955; x=1685788955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n7vQQ3BCTeRFq/ysBUUocz5IDjn6DJp11hxaWsFLtKo=;
 b=Ues+fT0fjKGve6XPE8QqkySHLLemHX2SfNzF2f0THkp82wRSgMxGGoUIN+ampSwg5/
 iNO9I/qvhQBjDBgCoxeBNT5e3qCnwocJ3lkgNdLU5wg9Zivstd4WWc9FgP3rwKOoHkH0
 UTmWGUqEOGEfBGx0hhUN2RWEi22Uz6nx06kjk/vr7yGT5R32Z15iscFB5ff5g/pd3A7R
 TiIPiCnX024AV2aCan8BpC+jUaXgkYQQpJ+52F66V9ExAyWSxnalWVm2ZUuyZ70xaLVL
 YS2ey2JN32VBAnWJcpipLYReCyHva/U2VnfflbyBtd9N3/FM46+uHK0H5M9IdfkF111k
 3Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683196955; x=1685788955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7vQQ3BCTeRFq/ysBUUocz5IDjn6DJp11hxaWsFLtKo=;
 b=QgUSbm2cuggFH1ZafBhWo476QIfw3xa3b747IxMT14OVuBYBAB0GB9PPYNS43QXFwb
 0Q7hMe1robbfOqBd4JpmVf5YAWqglpPOhoy8zzqV3MSxQY6CUIKdayppMm93KbrEmUOS
 S8iK21eYuBFH/c3s13dXyJVD7nIu4b0egytapUwMfXgQEME5tg6jQJoZIXrX+x4ZhvGW
 YBh2D/dHdyw95TH18YdSYEGfteCpBsa5nWi/kYgLKhgKHZn21W6tC861g3aARjB+KwvG
 RgDztRrfShOasINI7p95ak2LYDn865pKwAKV1Fsx61kk+6rZwIizggO0cIiiCCsnG8bl
 gUjQ==
X-Gm-Message-State: AC+VfDzvfZqFXYygcqKo6R8jS9wqbrwrnscGnkUcAm0J9q+/9H8xr3Xc
 WEBLO34x9L+yQevVVCGwuZxbTw==
X-Received: by 2002:a17:907:948a:b0:947:5acb:920c with SMTP id
 dm10-20020a170907948a00b009475acb920cmr5989140ejc.34.1683196955009; 
 Thu, 04 May 2023 03:42:35 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b009596e7e0dbasm14655268ejc.162.2023.05.04.03.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:42:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix vd == vm overlap in sve_ldff1_z
Date: Thu,  4 May 2023 11:42:32 +0100
Message-Id: <20230504104232.1877774-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: +yNBUbRUTdcR

If vd == vm, copy vm to scratch, so that we can pre-zero
the output and still access the gather indicies.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1612
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index ccf5e5beca..0097522470 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -6727,6 +6727,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     intptr_t reg_off;
     SVEHostPage info;
     target_ulong addr, in_page;
+    ARMVectorReg scratch;
 
     /* Skip to the first true predicate.  */
     reg_off = find_next_active(vg, 0, reg_max, esz);
@@ -6736,6 +6737,11 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
         return;
     }
 
+    /* Protect against overlap between vd and vm. */
+    if (unlikely(vd == vm)) {
+        vm = memcpy(&scratch, vm, reg_max);
+    }
+
     /*
      * Probe the first element, allowing faults.
      */
-- 
2.34.1

