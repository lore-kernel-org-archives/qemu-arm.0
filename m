Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3083528ejb;
        Mon, 5 Jun 2023 15:26:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aQa/dkto8MrUxhbFk7xJxXCvf2C1ZaYWTBNJGQDmxPqaYBiCb7A0iHS9STYwYSzzKkQ9W
X-Received: by 2002:a05:620a:2947:b0:75d:abfe:36eb with SMTP id n7-20020a05620a294700b0075dabfe36ebmr165194qkp.36.1686004019293;
        Mon, 05 Jun 2023 15:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686004019; cv=none;
        d=google.com; s=arc-20160816;
        b=ajhGQXJ0u85RrNW+bplHyV16+NDl/JTUQwV0XTPHay7iKJ9cEhKQ/u6vMd5xP+iL+t
         r6pt7V+sMjYgUBDFKKl0uAudZoA5bpD1U1PvlKZM8pRa986sTG0QZkAp1/MaX0AuiY5Y
         /fSNGzh9IrhTZYahORoyPFZB58d1tx1Wvb9j0f4aq4ZOUOpc5v/GoxlmCP3qJTohTlYm
         oj+wv9nhQLJDsSKg/KNwmi/0/gvsnMEJrji1TJXbJLnAqV4hoHinHU8oqv19wUJhCg8/
         6nnAEVcACzLjbH4V7XFkzVXh4nUpVDyLrZKR9Nx0hPvVi2LGI7o/M5H/880NieS2kkvy
         p2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SxRmr/I1VpSZkmrvvvEhVA2TInHdyZDnBscGrBEdNSQ=;
        b=qQtpVXEGvgvrq291eru9ofs/lZsefKhX486ORYWttSm1p2iiQ9k//jqJvOKcKelb03
         6gFJPcyPC6zGDmbU/KE5n472YSyNh44VOjq5Rou08ab2DcSllTTHKyj9fp0hIXZ/GpJ8
         WqBMWG9T1aXwGYV5FXG7iVOqOYBCr/vWZ5WtQoIapiuzG+sZ5aLurcR6IhNtNuQkP3aG
         d5Vt2dTaICOpABeKT1Q36UpaR9sh/ATpsT9wAsmPWhGwixcWyXea+Cyt13xfrZ1RNC7O
         UbTA1Cy5LfeSwQT2Z3t+XC4wPk7bxrJk18Pt0b+xIkRPMNI8d7hmMIRK5fjHlbdlmfCx
         cILw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQssGCvL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020ae9f016000000b0075cd6e9a4b1si5079223qkg.110.2023.06.05.15.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 15:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQssGCvL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Ics-0008It-O2; Mon, 05 Jun 2023 18:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Icq-0008HS-QZ
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:24:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ico-0005we-72
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:24:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so47982345e9.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jun 2023 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003868; x=1688595868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxRmr/I1VpSZkmrvvvEhVA2TInHdyZDnBscGrBEdNSQ=;
 b=aQssGCvLFKYPpOVBm8UOh8EL55qTwGNg1Jk0vgpc4ROrSkCfUdlTCr0hkP2tA89adF
 m1mrTvpC4Y+47EPDB3tqY72+gabE0peNZpeo1sPpFui88GrxX7/fpW8ULvbnPrbNgM5j
 mX6QTZ/+qQPLIkXwOpKbgRNka5rl4I8LTY+M/crF632TxCd8nv8HucddOuOwbHoe/fkE
 xyKnZbnZ8kenvwSpkKqmxVvQehW5uRSee8jRA5BD6sbEPKgw1zaJCkpu/0PhgPtLD6x4
 RQ2UWqWoyxNpXdw1PiICXFhlcTn7POPuS28aa+X6COfiwW43JhAyXSKP+mg2QHZURZBF
 pXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003868; x=1688595868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxRmr/I1VpSZkmrvvvEhVA2TInHdyZDnBscGrBEdNSQ=;
 b=CseI1YIQ8BBlRO/rHtHbvb918ukTpCDWNze7UMV4XUQlt9dXPFEGjOppsvOkWAErIs
 svuRKo1NjYuy9hyDmeQmdqoej0/57Odt0qHu7xvaOONh0Cjmw2XHhccswyAdnSRnzQmE
 OoKxVxpB/z4nfGen9cVAnyQ0vC20aT9b+33lr089tSHveZOfFEMJGcF4SVtCkRS55QvA
 F8mjSU9fOs9oq8EDzuzZGqR4l6MPY1csUzFEVduBCT3jyy7dYXlD/SQMt6JxaNXkmZs1
 wyqJHEYb6WHnHtdRA9l3hpKVcPL/j8ZbvEHx49BReu01uylWbsNSxMPnV5+Wkbx3TZu3
 ic6Q==
X-Gm-Message-State: AC+VfDwMH21w82eGwoJrbQVeID/ppsKrXa8HBZTelRkxTr3f8ivciv1y
 TuSGRZI2y5ZQ36u5lGAxKqNSy2tahWx5OlHrsVY=
X-Received: by 2002:a05:600c:220e:b0:3f7:3673:5429 with SMTP id
 z14-20020a05600c220e00b003f736735429mr355827wml.2.1686003868416; 
 Mon, 05 Jun 2023 15:24:28 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a1c7c0b000000b003f60faa4612sm11989320wmc.22.2023.06.05.15.24.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:24:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 1/9] target/tricore: Remove pointless CONFIG_SOFTMMU
 guard
Date: Tue,  6 Jun 2023 00:24:12 +0200
Message-Id: <20230605222420.14776-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
References: <20230605222420.14776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: SoaUIwt5kfVq

We don't build any user emulation target for Tricore,
only the system emulation. No need to check for it as
it is always defined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 114685cce4..cd34b34133 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -30,7 +30,6 @@ enum {
     TLBRET_MATCH = 0
 };
 
-#if defined(CONFIG_SOFTMMU)
 static int get_physical_address(CPUTriCoreState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
                                 MMUAccessType access_type, int mmu_idx)
@@ -56,7 +55,6 @@ hwaddr tricore_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
 
 /* TODO: Add exeption support*/
 static void raise_mmu_exception(CPUTriCoreState *env, target_ulong address,
-- 
2.38.1

