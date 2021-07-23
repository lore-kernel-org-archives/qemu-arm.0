Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp713319lfc;
        Fri, 23 Jul 2021 09:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ2K3k81QvlL7lNTMZudrUA4dKkImoIcyrYHAMWjSn6vLIEdBxGRP/000DnVHVvuvvWX/c
X-Received: by 2002:a05:6e02:12ab:: with SMTP id f11mr4050192ilr.200.1627057535360;
        Fri, 23 Jul 2021 09:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057535; cv=none;
        d=google.com; s=arc-20160816;
        b=rxj6ZSLUr0uj3+4DlLkodetbMG9M8BfXoaMz+rG7TBYJNYIyM1+J0iHumr6ai0+eIz
         7WqTnmnpmcj0DCdsHFlqHsETzNHEKDTNbzLVo/3dvf8dfnaAIUvoFRsCpE1FHPmpAUBb
         1EFCPKVYjxv8GcW2wNBr9PgZhsDvI/Wl8Dn2rJpj7RLp/mpF5RHHEQYIXIRTcOzoyIld
         X4MihJbEJ8d4hlxnFzU21M8xR/MUOy7TbSqqek7VcPqPxZ7gEJ8Tlghhyd0EnJxfOBpe
         7+Wguvr4uO20IPKD4vMSXArvF4zCkXsxCy9EKJVf/YQ1MnUbEY+LNhL51X2VqPyFdBzm
         KRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9nvGoOgx6h6XmbBua01EVVw7UXwgA9qVC9DjO1im9I8=;
        b=OHIsdwBOC3lbUQ0VxKD4dZFV8aqMNjVYVfMHRzZzUCszBQkpp+wD4OC/QmDMlw7BHF
         SgZJ+P1XHpsWf6QLkXKQT3z7vv9OfVlpDTobO+Ya2RyZD9pdvR/ChQBhAmTz6arqWuSY
         oVXVrzqYr62V0jTMRQsS81vz/BhgYz5g8NAJAnKBNt/+dAV8WW3tTR2+pMoEtl6qraV+
         gZaCJMtaW/ilF9WcwnkTfWuz4huPbAQr4RhulIt9ouXexFIVa/sq/99V73IBRQtQ0UMP
         //vGjTG8bifiXWtmNqWNTG9mR3Pnc9nScyjC7yvE/otA72RS+vcKq3yPjRnnlyiKktz7
         3tRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mU5feMaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x90si23735559jah.3.2021.07.23.09.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mU5feMaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6xzS-0006pf-LY
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0008Rv-Ps
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvs-0000lg-48
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id b9so2123955wrx.12
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9nvGoOgx6h6XmbBua01EVVw7UXwgA9qVC9DjO1im9I8=;
 b=mU5feMaCGu8BBRFIKhPl/v5gTzExIgjISaZWcEaPKwyDQc27xBkXLZeR9ndAsAnjkY
 eblmDUyFFhZTq/lu2EZjXYfdrMQj39T7jsJIBXe3ZPtM7hWLuajBXfqfe00skItUaYiw
 z7eRLDKTCnTNwDmW2tTanUE3eMWsww4gpc+5eUxe/ksVQMzGPPEY7AuJJ8ioa1V2Onkz
 1FkT0/omccDIYwsRWB/76VtdLNlPoNgGgt882L2PduHLJ0ADZrQOgVS6cG420w+9Wqan
 NwJCFtCWNXaMI17R+kfa3c/Qt8y32MaQ5jhNCXikNL0lGil0fljDMDXFjpieNER0ua+g
 W/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9nvGoOgx6h6XmbBua01EVVw7UXwgA9qVC9DjO1im9I8=;
 b=m/7nn/N1qdtx2QnqVVP5xskfnx03n4AWG50jMUKKWmFh1gILKYjh7QrSY0NHzxJeTQ
 6YNj9PA8QkwkdRkvqZXMmOy+DnKp0NHkxn0N+DJr31s+X9T8mgzqeiqIouEuAQd7m2lw
 80Q8Tn2qHjTLVjDKmtwS6gQc/9LfolPo2ZgmY4mggndt4TxznbNGV9qwm7k2fMqL+U+l
 jPyfgOU4P5I0+gWp/lY5HVzzKezAU3YkmY7qjFbiY6IHguZn2ms6R/U2fz2G9k+veUdg
 KTEehBycXMRTk2smG6fPun2fdFEd9r3IjlkA5sMKLzLRoQUqgcRvpdAleKY/35EDxCWt
 LS/A==
X-Gm-Message-State: AOAM532fuKHwxQ1f1RVVHxGZEFaMl+eadDFfUVk0oKuEr1p6Q5eDtbmw
 dkgaefpDgoI6O8sl4eqZrtRl96wvCb5glg==
X-Received: by 2002:adf:e610:: with SMTP id p16mr6456978wrm.98.1627057310805; 
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 3/6] target/arm: Report M-profile alignment faults
 correctly to the guest
Date: Fri, 23 Jul 2021 17:21:43 +0100
Message-Id: <20210723162146.5167-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c+TLxC/5lL+Q

For M-profile, we weren't reporting alignment faults triggered by the
generic TCG code correctly to the guest.  These get passed into
arm_v7m_cpu_do_interrupt() as an EXCP_DATA_ABORT with an A-profile
style exception.fsr value of 1.  We didn't check for this, and so
they fell through into the default of "assume this is an MPU fault"
and were reported to the guest as a data access violation MPU fault.

Report these alignment faults as UsageFaults which set the UNALIGNED
bit in the UFSR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other approach would be to have arm_cpu_do_unaligned_access()
raise the EXCP_UNALIGNED which we already use for Unaligned
UsageFaults which are raised by m-profile specific helper code,
but I think this way is in line with the current design that
generally prefers to report exception information in an A-profile
format and then re-arrange that into the M-profile information
in arm_v7m_cpu_do_interrupt().
---
 target/arm/m_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f352346a964..20761c94877 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2248,6 +2248,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         env->v7m.sfsr |= R_V7M_SFSR_LSERR_MASK;
         break;
     case EXCP_UNALIGNED:
+        /* Unaligned faults reported by M-profile aware code */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
         break;
@@ -2320,6 +2321,13 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             }
             armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
             break;
+        case 0x1: /* Alignment fault reported by generic code */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...really UsageFault with UFSR.UNALIGNED\n");
+            env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            break;
         default:
             /*
              * All other FSR values are either MPU faults or "can't happen
-- 
2.20.1

