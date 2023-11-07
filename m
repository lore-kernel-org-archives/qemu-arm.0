Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274133ejv;
        Tue, 7 Nov 2023 04:27:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy6hX0kFFw8PNI6qOpxqyw4MNZIG+aqHiCVS8+lC2siht3Rt/sCj2u4wArC94h78iJNlN/
X-Received: by 2002:a05:6214:2a4e:b0:675:ac72:f4ce with SMTP id jf14-20020a0562142a4e00b00675ac72f4cemr2868750qvb.28.1699360054601;
        Tue, 07 Nov 2023 04:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360054; cv=none;
        d=google.com; s=arc-20160816;
        b=G1yqx0vQWmBYfwGF+QFR0YEzJmgneHdLEGrT8mRZ7Ucq/dM4CYl42PnHu9IqmEcyg2
         jtDKUehyFIrIGAFv7hMlCxjiDnoV0CtSxSueD6KiqmhwHBhyVI1GALAoaluabxmOqLy7
         BEPqeWHVpUBQ4DHcUmxA/quwrbTlAVSz8SIJT3l2ypQEO/qYun0z7FzFPtAY1g/8FNn3
         f1GXYM7xLcy0/RO8Upyy9pqFqqGd9kx5zhqKASblQQT1JvOfZH17v42wuEZ+agMtz4kd
         wFvvgCisN7D4aY5y0xX3mI+5jSgbQIdx7iwF1QXWAQYiS3FM4jmmYI4Z0cv/P7dDU6vc
         8GKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TWjAMfnV0kRvK1CF0UWrM+tNZeOmTMW+hMb8e74FNo4=;
        fh=fIxgkU9hKSKE+S/E1Sv9exqhyypVK9uhZLhwSHjMAp4=;
        b=WvBau71CIdJj/i+SyE6yfhPPmTAUZZRfKDU/i6gzyJAKqKXbxh2l6P3B18sTo1n0gu
         PQL36tI+Ry9OVG7w0GxKINNaYhRYxFuJRSjo5vD/QYUQoEjKZJnjA3XZKA7SKugQjEog
         DuxLLE97OXK7KFzcECGbYVskWwgh3XyVU2k6xso6myBj+n/HTRKp3FAtFDssNRR++TUh
         ZtZWE/p/B3tfzNUAnwqWQvr1JhW5iz18wr5xeVPFpjE946WURjyAA8yzBtjyj/1i6ndm
         ujlWCsrYjeH5/uU1cxn9S/sAgagQUtzIIdBahJKNrHr4Fng5IzT54qZxV2hnYOlyXQih
         Nlqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqhVJ7Qu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a0b5600b00767185b2dfasi7160941qkg.622.2023.11.07.04.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqhVJ7Qu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0LAR-0007wW-MY; Tue, 07 Nov 2023 07:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9i-0006HP-0Y
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 07:26:09 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9Q-000591-Tn
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 07:26:04 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso12985049a12.1
 for <qemu-devel@nongnu.org>; Tue, 07 Nov 2023 04:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359945; x=1699964745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWjAMfnV0kRvK1CF0UWrM+tNZeOmTMW+hMb8e74FNo4=;
 b=eqhVJ7QuIvRb24GOGl+EQ+FTM9OPsBLY1YX8cGVCFtxsmHl1M9a8vkkNqHAv/4UcGV
 P59d7lK8IfXfxZkgdIJwkmfq+V4SxFdkRZ0O1xOZlUOPK3zvSup4I7XRPopEq7uH0BhF
 Z36mo0SLrsDJVpI4t+z8ly0zDZx6KBzbd5njFPLzVFNFVeNuHzjNR7BORETtp5qBLjsX
 OfSsRglpidGONn28eVgLEeihWQLFcTT67MeZ7z7F8UvNbe4wYj+z6nyRF0NLKEm4W01R
 7lcuPfB9LGmFpKtesZcV54xe5CswzTMKI/oRWZJbcwdlvhBVU//h8V5+fqoFiq8L2uyj
 jBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359945; x=1699964745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWjAMfnV0kRvK1CF0UWrM+tNZeOmTMW+hMb8e74FNo4=;
 b=L3IhT5pGRv5MYhXDgj9kxqhFbWExYSAoI55+7fnOB9qUYFbiwfU10Ink2AUBf+7ixi
 Od6BbyMai+m+Ewsx2bF1fiAWv3Q9YZYoyIZjH2lPamHFOvn0rhAfii/yF6WFZ8fYrlTi
 YYDl6Xt/lHTsbXeHK7VMcSczJvSTwF6BlwUYSmfkUsKbAVwZbmLFMGMou5xv3ftQzna3
 YDUwYnc8sr4LiD7saG5vCPe1TTB6NlzIl57rXELGbN0gdmTlPARfXXLFJxPJ5JcmIz5j
 hTpFrD243/XXysxNUWYY3zi/ZiwtGWHvRZfdkG2BgVcTJENVsOjjeip3CrcOpQ64jJEE
 MG2A==
X-Gm-Message-State: AOJu0YxOp113dnD9EF66q9xtEfM+xSz00BtC/hA7AQJhQrToGSm2I9Nc
 bine41A8cjiPkGyqLB2oY0OQmfjXxfTnYc648+0=
X-Received: by 2002:a17:907:26c4:b0:9dd:ebab:2bc5 with SMTP id
 bp4-20020a17090726c400b009ddebab2bc5mr2059350ejc.7.1699359944935; 
 Tue, 07 Nov 2023 04:25:44 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b009c3f8f46c22sm986892eji.77.2023.11.07.04.25.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 45/75] target/s390x/cpu: Restrict CPUS390XState declaration to
 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:35 +0100
Message-ID: <20231107122442.58674-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eWoqrbR80H3d

"target/s390x/cpu-qom.h" has to be target-agnostic. However, it
currently declares CPUS390XState, which is target-specific.
Move that declaration to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231106114500.5269-5-philmd@linaro.org>
---
 target/s390x/cpu-qom.h | 2 --
 target/s390x/cpu.h     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index fcd70daddf..ccf126b7a9 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -33,8 +33,6 @@ OBJECT_DECLARE_CPU_TYPE(S390CPU, S390CPUClass, S390_CPU)
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
 
-typedef struct CPUArchState CPUS390XState;
-
 typedef enum cpu_reset_type {
     S390_CPU_RESET_NORMAL,
     S390_CPU_RESET_INITIAL,
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 110902fa3c..942589c597 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -55,7 +55,7 @@ typedef struct PSW {
     uint64_t addr;
 } PSW;
 
-struct CPUArchState {
+typedef struct CPUArchState {
     uint64_t regs[16];     /* GP registers */
     /*
      * The floating point registers are part of the vector registers.
@@ -157,7 +157,7 @@ struct CPUArchState {
     /* currently processed sigp order */
     uint8_t sigp_order;
 
-};
+} CPUS390XState;
 
 static inline uint64_t *get_freg(CPUS390XState *cs, int nr)
 {
-- 
2.41.0

