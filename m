Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2889943ocg;
        Mon, 10 Oct 2022 20:37:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6O3/ARBc9464Th37IhtW/p99LL8NsG15f0zMUtjGm2nA9A6Rkj6MtsuCKER4BkOSHPAGbk
X-Received: by 2002:a05:6214:23c5:b0:4b1:a94e:3a21 with SMTP id hr5-20020a05621423c500b004b1a94e3a21mr17830168qvb.90.1665459430239;
        Mon, 10 Oct 2022 20:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459430; cv=none;
        d=google.com; s=arc-20160816;
        b=Jeupr0YWly4uJ7DW6vuF7LVjAfu5MkcyIJ9F/56N4DA/rqFzhGGEy4tPanPjep5GBy
         02mcBv4XgYve7+wgROOGZaOQIaALf+pzN8E+/zOL4mpUjt9+L9qQK1dey7m9z3cwCLwc
         JFOJhRUYKCmRlyj5+GroFcuzJjPmGaZqDRIBVxyMnsjnzg1vuJaAjRGmiRhq8k16XwuD
         s2M6qsORN1WtEmN1cbwNsQrYp6gHVl17cLWbiB42EoS8zsYNRFGo14VTS57Y+9ctzyn+
         dK4X2ivyr2PCL3QUY12pElH2Mn4J4lbKCABolDv7PW4Yf6jPdS4KZGm5v2Jr7/3Sxo7a
         Bc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eI+72a+zEZxV/Jolsa9Dnr52GdI9trlBieK7TxOdCAo=;
        b=WsV/zgJ7xNqY3uEELgxKPH6kEscpNzUb+e2GcT6jcuzbuE8NINsJ3LwPQ9CdJHMtv4
         SwLaVxIoDI/WIMJvUqpeGwuCt41VxSnkrMi51oD5rczfkQJK7JMi2kg7Lz6YPdOmirEU
         oY46PhCNYdWOx1vaGUoDm2bE2CS/MZDMBCT8lY8j3m55L47bVzOmhPcHWsWA+QIa0n3f
         WB+RUZL58JacFiM+/u4kptk2QugbwN/OX00XhvsymO6zKtTM3rew1va/NOvR9E3X7gZn
         nUZr/0o7iHx1z2uuTCFvAmdE16cE/JKGZcPfwzWogT9ymz+w2Kj88+maO636j1+mPpl+
         tYvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvvEwixP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch6-20020a05622a40c600b0039703a4a99bsi5359610qtb.443.2022.10.10.20.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EvvEwixP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi64r-00051Z-Qq
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o4-0002dg-LB
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:49 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5o3-00037I-4Q
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gf8so11337169pjb.5
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eI+72a+zEZxV/Jolsa9Dnr52GdI9trlBieK7TxOdCAo=;
 b=EvvEwixPpytt52H1US8QZnrl4ptv/e3tjqhY1PZhjdzyARkzS7F6Hg6lMhTAMKwRjZ
 PYgKRZ/Lb5JMx80fPtRgOBaon2N4Mi7nz8QT8++SUgaRWDBUERYCMXMdH6nQhldHI0Eh
 5Z6LwRNEvh5OYcqBNmPhv1W4fmIbPozLd9fwpTje/6pG8BCeNqsDR6EgebV3XBqBv2ru
 7C5rILNL9hACqIOqruoNoX/ESGq1vQdSeOe1+Q/YY6wqfB0xGHVcIEZnlraRB+s4k9N+
 rDOwcPMzQKSo8zCkV+7d1NSTo32ylly2wvVw77QIrpX4irURekA8u1bdewCqGFWr/Olc
 tWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eI+72a+zEZxV/Jolsa9Dnr52GdI9trlBieK7TxOdCAo=;
 b=nbhF3JsJwH1eqHriScxGuv1VxxEc8QmISA/+kAWV4f0q+WKTqP6kY477PdN2OANneI
 oWWVXa30YBbdr/LTuJfi7cbpY7jJqhQ6u3M8b3lZKRWfpfZgz+Xc4VpgxdpU5QZl0deQ
 iEz8mfemRLc1q2Yz5oGLJiy5ZKwpLGg/pB8w5Cn5rh1KyLWUKHjMWi13DL71OE6OfkYL
 z2w7qoyHErMPRs6LG69knCovhuIjD/UWsrbm10hNVwrTlrDp2kf7s9/P8WDgMdOWetnv
 xyz7JTa46GAA9GG9ekcTPJi6shIT199U29C+IlCg3PROhIxfTf+SnZhD62+SFAUwuO9H
 GtmA==
X-Gm-Message-State: ACrzQf3b6lrCZjx07ngS4mQm/ocTEpRun3boDjVypFne91ZdN7GeLdTh
 0PZ9iZqKPvqAOk77kNbs5gIvgw==
X-Received: by 2002:a17:902:724a:b0:177:fd96:37bf with SMTP id
 c10-20020a170902724a00b00177fd9637bfmr20897117pll.25.1665458385374; 
 Mon, 10 Oct 2022 20:19:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 17/24] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 10 Oct 2022 20:19:04 -0700
Message-Id: <20221011031911.2408754-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 55uZnqt4anci

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 76ec7ee8cc..e195d771e0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1

