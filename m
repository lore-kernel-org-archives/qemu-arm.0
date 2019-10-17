Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1344084wrm;
        Thu, 17 Oct 2019 11:52:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQPrz8fmWc1/mmRwqj5qf++R39jgDYBAzE+dqJPPDICeILDsuDwrHB+Nq2B6PgeGuVJaK8
X-Received: by 2002:a50:8f03:: with SMTP id 3mr5553048edy.195.1571338349275;
        Thu, 17 Oct 2019 11:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571338349; cv=none;
        d=google.com; s=arc-20160816;
        b=0aOnkLrXzhvXxRuYmMT1JuE5FveI4Xsll8uLVCSBm7qg9OVdHpnbKZHmSw+Zn05byD
         MgSPb5ACdqAhSilZpxJ5OYKeOEx+KUAQwqlpE626yWWHIDqL5aMHCR2AkR5L8bjMUKui
         rNTUSD8ksFB9wT9kE7QNSJZFGtd398BGLDPDnJxcdNhipR47mzoLobYf+/uGueyCKYmj
         6aVHPLLsk4xe1K1xMUBF8BAkphoxIluvx2ZZnsWMpscQ27peW+xoxbkIitG5M0037k5T
         35MniGGRilegGPRB9+tVcCTN39McI3tzOh6Y/k9/PWMSuukKOJlnXJrIW6om8gwHD1Ml
         xFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
        b=aMJ4+gqJa38Lxl94nYLrnPfd7DoQWEV/FzADhATH4++j9ebeL6O/PqQmjO5MNktocK
         K2oMz2fOfsRjwHPyAfycmf5tkdXIjPIUi8gYpLCX//XaNorBmWhOB2FS06CnGE9BXwRU
         l47n+A881VjfTff/VS4KgFxSJZszLPTWWxPBOvr9A6pNIq8VycxKTKH9Ot52fshKGBYM
         OS2Hn05L5IcoQviXolcfO+ypL8cO8RLeTjoIPQ7cvoEzMQFcQc/NT0sbyJqAZwf74Tgk
         ikvgyiRAnq5XY52+7TH4mSZrWE7JpJkFjovXFZ1NfSjTiTIRiS1DsG7aTJjrPqCPrhTv
         aZ/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DYDYv4z5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck10si1909633ejb.181.2019.10.17.11.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 11:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DYDYv4z5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLAst-0001xR-TP
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 14:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArs-0001C3-MM
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLArq-0000sJ-KF
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLArq-0000s1-EN
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 14:51:22 -0400
Received: by mail-pf1-x441.google.com with SMTP id y72so2199531pfb.12
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 11:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=DYDYv4z5rYOHKgP6fl/oD3gy6IBcwlCqU6Lzlv3YGFO/8SgQx3joZpGJThFmfmg0zW
 OkKJlj2e1FzwP+0oSvb4zOC9V3kEUMaQ85rUx/HNCgjsaQ/Y6yDYxzDF4rBhb8lvgsuJ
 DHR3tIaDWRfRCeUNirUziKF7BcSO5GsHFOenZeZYdByCKSvRZs7yjlsVcmkRRwRrOelP
 kWv2KfQj81uoYjaABTZd59k7DvZ0FwXRCTflLI7grg0vr3Xng4IFSv6BpgRkinPpT3KT
 k3YhgAN1i6OdqKwNrkiX3ONQbaJnXfaxJGUe2DY0K9wggeKOx85bGRZfHRmazbhYY0Fl
 tGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBA+abtZ26hlRDDlZ8eTB3Pn4yNYwZChmFB+u2JQGOM=;
 b=EK4YiyC8tHFt41plCb0S/wMWxpW3Agnywd17/oAo+5Sgeh4HQgqbjlVcG4GFb4Ieda
 V3odT+oE8DyGvh1d4QR116sS9aHxZI5uDoMGwQXxhgmkf8O7ilTLCTcSXKXQQYdiJVqd
 HdFvLUbWCKGH9f+tayxEEr2B+opjWlfIZtunU+ZlbUDWSiMSVcKRFC6F7d9xLSjCZcPd
 hyNn4DosMIHbu+2jRw5FPr9k5wnePEEaAUAl9X0zPFkm1l6yHhPlI6QXBCil/IZq9WBd
 zh//o9d2mcJ7RDtYL0lvSMiuc+jRC2+zureAybRWB45X5YgcJhwRVsW0QnELTlyOgu3j
 sXWA==
X-Gm-Message-State: APjAAAWc8LTB37VxkoQUKP8nw6HyGmEco+e0/KNuLWIwnaORfhBeiO35
 j8CeoLrb1iAfA7R0SJ9qnDVvfA==
X-Received: by 2002:a63:cf4d:: with SMTP id b13mr5600676pgj.396.1571338281342; 
 Thu, 17 Oct 2019 11:51:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s97sm5009256pjc.4.2019.10.17.11.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 11:51:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/20] target/arm: Split out rebuild_hflags_a32
Date: Thu, 17 Oct 2019 11:50:57 -0700
Message-Id: <20191017185110.539-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017185110.539-1-richard.henderson@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0aXOkMYqJTmH

Currently a trivial wrapper for rebuild_hflags_common_32.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 296a4b2232..d1cd54cc93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11106,6 +11106,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                   ARMMMUIdx mmu_idx)
+{
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+}
+
 static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
@@ -11218,7 +11224,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                 flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
             }
         } else {
-            flags = rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
+            flags = rebuild_hflags_a32(env, fp_el, mmu_idx);
         }
 
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-- 
2.17.1

