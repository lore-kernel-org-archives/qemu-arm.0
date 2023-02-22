Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827600ejb;
        Tue, 21 Feb 2023 18:35:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+OgeVmn+WbmJ/D3FpqgUHhG5JDGKWcH9Af039cCaCz8lKXKWHwit8/Ga7ZUWcOMMka32py
X-Received: by 2002:ac8:5c8c:0:b0:3bf:a72f:d0b0 with SMTP id r12-20020ac85c8c000000b003bfa72fd0b0mr5034423qta.61.1677033347874;
        Tue, 21 Feb 2023 18:35:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033347; cv=none;
        d=google.com; s=arc-20160816;
        b=eCm0dV7WMgwldjggq/XyaXNXIXPl58DROqnf9FY51qzOPdrTq1NU8/txuXOjgDhcHZ
         QnJMGkYg+1OejFEErqcykhrTJlGNpJ7NQ/WboFelt0UCKN6dUIMJs7vzQjPQMwvuyTA0
         1C9F4MSE/QgRfFMwN/VsL633majL2hlZKINAfIpvqKu0caYhmyFJLMdrjkhaYy/dRQrn
         pStplks7gxkG/rajnyvHUcFfWpZe+KqPfwatRrYo9OXUrZ1JAMqGo4MFICZgfQIqU3Sz
         Bg01OXGkUDYXQp/hYUKwNyRah89Hi2BFDoVJBuLb1qSmGmDWcd9yiYGXQALULKN6yyZJ
         qXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eh6Hd17AKGFWk8yBVtARAQj9lZij9aVa5jyFKRWxRtQ=;
        b=rMJPSrYlsdgc4Cln3N/ccc3qsm+tZImDn3XQeJirY96A6lsxbGO7zuPPT4zg7bp5oW
         72ZxbIKqHKQcXQBkHa4RLePVoOluU1xM8byz3bwGRUxB5unezkICjpzqvXxAj2FcU0Sy
         xNAS3aTa+aAfAlu/FnBvjjxfA/2hbGGzdpGK2OPIuG5kKqFCiTW3QSj5mY4Wa0Jl0QJN
         uTXJ1kN03n3rxuiZ+/Ah/HS92s6uNkgz63xBklwN6wLOw5V2nHEQBnxWjZJMlpSMtOOp
         GUKon11LYyJw5F3tQI7aoD3NSf0QzeG+HSJrmyBbkRfNHwREjrL6o7WCRipx3FRnYsm4
         FSbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfPmPXGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm24-20020a05620a1d5800b0073baa46e8c9si399193qkb.660.2023.02.21.18.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:35:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TfPmPXGZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexP-0007Zd-Nk; Tue, 21 Feb 2023 21:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex6-0007Jy-51
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:55 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex4-0001bT-MU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:51 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso6969169pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eh6Hd17AKGFWk8yBVtARAQj9lZij9aVa5jyFKRWxRtQ=;
 b=TfPmPXGZysN96bsM6EUpb9vA4/oGjhgDcNfpnqvcf0aXTqa+LAflL68DYHumj/SCED
 3TKYlpYwDyRuUU82kH2cMr+Zd5aYuvcJxZVIZqEo/ozIZQ8HxH3H/W/zojk9vTS6uM5Y
 5+496PPOT1N27GKiFoxvMfeb/e9nbHCIqI90IDPYUJ7FX20Ge+KPc7QNhvM6FAXODn/Z
 iLAbIhX8H9i4Mp/ieSecEuCOtJ6kEOLVbVcZUe4+U3vmxJIMVDldfqC/pF8MDp2u1MMv
 Sdv998KI+vn7GVMhseZN3w9LNkCdlE56es/yVSVM4ZTmUcEfCDmUdc7jH2q82Qvgktuf
 +9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eh6Hd17AKGFWk8yBVtARAQj9lZij9aVa5jyFKRWxRtQ=;
 b=RwoYZL9qMpaHU6c6RUhir0AoPIyMeBkdBIoOGxvkYbYfJPYrhHpZHw/6D/g/jIIk1u
 V5FgVrc1UF5mmgG6n2FyEFXyD+1boGwiNxh83zN1jyxYRNYac2jOCwWSQSFtSNpnYgZF
 PdvaMQ/bvkFawEVpdrdHWEa24oflum6MX2KHxnYe5TczD5PxR0TvAdKLoaKXQ5x4vkUi
 x6Q+if0zA26IB+kZrRl0Jn9TKgKTjy8iH8BF2cNJoPVLhkl/qr/WzF8Ni6FyzctsSO8O
 gG4meBp7l8w8u3FAPZlUbkhWOgYDLo72MbboH0O8WGnbghZa9Bosppk3jwX5+C//sVsx
 Kn3w==
X-Gm-Message-State: AO0yUKViQwS5myo1tMLQCfbUoK91nxTRJyNvLF43c03hgdGWclANCR/r
 L96rgyPbIBJXnBGT5Y9Zrq9CU7NxAhTypSvq6iU=
X-Received: by 2002:a17:902:e545:b0:198:ec2c:d4e6 with SMTP id
 n5-20020a170902e54500b00198ec2cd4e6mr9377571plf.38.1677033229298; 
 Tue, 21 Feb 2023 18:33:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 07/25] target/arm: SCR_EL3.NS may be RES1
Date: Tue, 21 Feb 2023 16:33:18 -1000
Message-Id: <20230222023336.915045-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RCDbhwUjlU3H

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3650234c73..ae8b3f6a48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1856,6 +1856,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1

