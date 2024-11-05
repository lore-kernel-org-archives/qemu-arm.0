Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2910773njc;
        Tue, 5 Nov 2024 07:34:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxyhMQhsrLnMtLK8k/KuAUTWjtX7wc3+q0J7VgpFi7MIzvQGG4/vbv/Y4bgvCcRHvJglCbAWf5gwLE4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGFkXfQahKVvprE2msOZWZXPc0S+m8xl6U7/DsGPUO1YLn+Unag18iLMJgJ8xJLkzgYSe/j
X-Received: by 2002:a05:6358:728b:b0:1c3:9552:6f41 with SMTP id e5c5f4694b2df-1c5f99f7e9cmr752408355d.17.1730820869191;
        Tue, 05 Nov 2024 07:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820869; cv=none;
        d=google.com; s=arc-20240605;
        b=Op+ZgOAPAipC211K6P4qvBmKw5GBfZs0kihjHxulJ3bAKKxLY9pwU2y9+3DlyfOOE/
         gULIQZK9uCm6u/fgz2+dFZQZT103+szFf9mSFYJDiJlZ3yf5A39X1J/+CB3wGzb9rrsA
         W9FC1PfiA8xFFDoOtgNWTO+Pf+HsVRIqNrsUhedjM0b1sfynWyHZfw9i1yCY0JKsJlgm
         whRppOMHNe7OmYFQutpla+lDQn/IfNI98Ed/Th0a/tkpqD4lj0I8Mi0f7bTYZe0BpjRk
         2QfShfrDThPGZrokaHh18CBKfZPlTlxt7ZGXzeg6QNbM+8PiRybTnmSeYHa/hL3THuka
         lrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=e6e5Ww4LvQ9/g+FYf5Agr7f1Z75ZZ1aahBrgi7IWi+Q=;
        b=UxP1RTi+GRtr8MhCkaGwaCF75xUa19uQ5R58H3hBfIJrhVfaEz4I5cMbNwpvKo0oHM
         4ioyMiqqcNzbWpEAobLVphht0XNu2FZUoPmX5uwfoO1zM69+rC90qNEqWnAXcKI5digq
         ef6arCDB6DsxL1Bp3t2UCY03uiOEriANAjJD4GiOeHhEtYZ44skzv684XoaI5M1psU+u
         rl28itKqXScEbn7GjvfCphp0/NNjdrpzCHDu7PkZn4etG5AgaEEkRo/eJ/64mj4xb57L
         DLc1WPk/XU8R2qaFAhRgiblv95/rwQDFcwWBtzJ8NEVuUamEeKMTtqmGLWgM50QvbV60
         MeQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=KDXpFqK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-855dae7e6f2si2690227241.154.2024.11.05.07.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:34:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=KDXpFqK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8LWS-0005hh-0H; Tue, 05 Nov 2024 10:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWJ-0005cf-4l
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:31:03 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWH-000448-7q
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:31:02 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fb49510250so57139341fa.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820659; x=1731425459;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=KDXpFqK4NWohYhRAJenfaO4ayqLoIXIysNgfdMim2Vs31/6rrf2vzlsUZRnms6ffVo
 pGbnx90diKuhCz8wBacdrT5khXEyF8I96SilkDFObaq9eWp2cucuPClP9LRH15U+8GQr
 XpFhhGWrAXpcZYvNAZBR0ACRMIk1pfbsDHIfUNWR3TUBToKlZsm1MRMPs5BC+hPPvQnY
 qUzQ9TAdIIGNQUi+NKO/iHLwikEPMeLIMVkRI6iPm8idozPbBWveqpG0DPVDkrpqzDzQ
 kj2EDdjpomdKTw8pKg0l3hjfg8sjbTg5+Wsn6yZZ2isnoz8qjcX/qprLJr0Use70Xsb1
 DQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820659; x=1731425459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=dj/DXNoXV10hGvkw+fK/AD0gV7WFVNDiDMgClaW03UoQ06sZAL+pLG17Fu1CZMbo3p
 EzCqNmCsUWGVS2yayYTgWxqyozFp27JxndtCzHe+F0lPPcrv95DPejkj33A6iv71UCu1
 i59HI3Qvu11QFZ5L5TrSGxu67F9hLU8VKpFdOpF48iOlLQAFrbVijS/fUdQeZknC5rab
 rR0wNlDQgVButuzq6ad4rProOXgfsZEJgd97vwSzaTQKJbgcKDluOlMC6Zm2PSx9oCy2
 IMSEIYKjO/F3BDJG3YeiGmmSBgSN91ZaoeKCbzNW790ubd9hMCveFqT9exw2+cMiqfTq
 ZX9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOqFLhbi1QSxK7VjjNjlRl4B3DPAeqIebfzMErUWNiHQ3C+2qBJ60UvOfc1VktakawvqSSRluPrg==@nongnu.org
X-Gm-Message-State: AOJu0Yx6SL0CEQjZAHlMLWlK9QY/B5j9ZlCy4MG6sK9w67YOVVLDMccZ
 IGgiYbn2fRep0dlgdLwdRc1W+uMczz+nbU5FMp+MzXHEXM7SfbTIok8N+N8BRw==
X-Received: by 2002:a2e:beac:0:b0:2fb:955e:5c17 with SMTP id
 38308e7fff4ca-2fdecc4d509mr108404421fa.40.1730820658545; 
 Tue, 05 Nov 2024 07:30:58 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:57 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v7 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Tue,  5 Nov 2024 16:30:15 +0100
Message-Id: <20241105153022.91101-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241105153022.91101-1-phil@philjordan.eu>
References: <20241105153022.91101-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::22b;
 envelope-from=phil@philjordan.eu; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: FAehfipJuEvs

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 6cea483d422..b45b764dfd0 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.3 (Apple Git-145)

