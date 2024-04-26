Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638947ejb;
        Fri, 26 Apr 2024 12:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsRniO6ef90S0cmFeC4ex8ZsL8s2+AkvZpD2nLS2Wc+PMuIzi1f7ZntkdcCK9NfkCVtqywsPO/BKJLP2XxIvhuHQi9237+
X-Google-Smtp-Source: AGHT+IFOmdg7QK6wBM9ee68/zGE03jIdHh5hraoiBDTt4rmz4YZenA0GKuUELZ/M1Ktq+sZys7fA
X-Received: by 2002:a05:620a:118b:b0:790:a508:ede0 with SMTP id b11-20020a05620a118b00b00790a508ede0mr3601838qkk.64.1714160864622;
        Fri, 26 Apr 2024 12:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160864; cv=none;
        d=google.com; s=arc-20160816;
        b=lQzrvTrF2Ty6pwkyb1RJ3Mym9timdUSOSlRP0/c2CaJ4FB+EJXQXXGTSMKw507qGNP
         ejVDaZCgEMFAjUoe5Z6Nu61/nj3773ghqGEJL/iy2dWEafKcffzGAGAVqoXgnJ4sCusu
         R9kZHEcgOPPigIYU+9WW6bU7CwsfOSFCZEcrEcPRcsyP7y4XT1Zl1DzTlzTB1axtHVNy
         BVQNgIIe10eXhcY7DneLPCCx1xHPgKVa4DE1jDAK+uFX3f5EyfEt6swQdOHbWeRfhSuf
         1bCJV15GHwkYiU3xo8Hqr9fTeMKsjY+a+JtBnOP+gquvAi2mj+HbneJ1UEAcy2AeoavD
         aZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9nS9nr2d38U1wk5zUyYU/3btoMDNoRWUI74KASdsEvA=;
        fh=5/3pYq1KAvHonxEvUpwdHvaCf4rwzSKbdhOfqjldFeE=;
        b=eb10hGCOqey4JqUCbNFgEYCRMs2VDrN0m1KcMhF+yTsceTVXBsBJ1WbEDd2HelPn9f
         31KZpiW6qOfbDFcDJ1Becliy5gggKVYGFrX8a8tYRPn04VKH3bRUGSQKvKqbPVtyFdHN
         diMtYCPKYEQ6DwKGhi7NtE6ZFY1Tb5zXwda1gu1LC09Mwcu94Ezxo2GWw1gS3hOV46tQ
         AnCAuaMy5PHFfKfe8ey4Y0oiB/C/FXjFO9VrJWfw9H2ceByyzDKo9CLZpZ2+KGoKpJwm
         RPh+5ii6xD3WayYiZHe/1QMAr0rlAqyEUGMTTq0UJIpdSYKJ9fr8sN1oA/hBwaiKYSxZ
         ESFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+Tkf84z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op50-20020a05620a537200b0078f0ee4b1d4si20613805qkn.506.2024.04.26.12.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+Tkf84z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RUV-0003dI-JR; Fri, 26 Apr 2024 15:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTx-0002A0-FQ
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RTv-0003DI-S7
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:43:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so2712406a12.3
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160618; x=1714765418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nS9nr2d38U1wk5zUyYU/3btoMDNoRWUI74KASdsEvA=;
 b=g+Tkf84zsikpdMkMbE1hkX2lh2LBPmBiUoxePt0vAu4H3hyEJSkFWmMuxgt/baL1qI
 C1jWSFh0DEAU0/DHBV5XRYVo7eoL/emcw7cvaJhusHjEoM7NgzunVTn9w5mQHbOCRZPb
 9Fx6YQ1gjviUPG0yY84MdMxWwLXZsN3lJTm56eykf89e/Fx4aIPAhze+h7dfDrUQzwYe
 JYJDPh8ERMp1SykfA7eXkoZi8ERWdrTDdGwYScDRKEwQ5jcGa80Kq+VzO85tztFKkTSM
 OwucoPCEpVV78CZFbiSmiii9IkJT4rttSOWzKzF/QGLed+us+ohgd7j0W+rVfayB4rht
 20Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160618; x=1714765418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9nS9nr2d38U1wk5zUyYU/3btoMDNoRWUI74KASdsEvA=;
 b=OcWJwPUsY4M40mwp73ZcWDTaD9Pm9BkyZdF9e/L0KsNU8J+7TQ6bkcdVQDLKnwCPCP
 h15UigDroUPOnbH7MTZf9nONAP8IzTtTBIIOh8E5U+WAKGSLmgiD4Sdz1TUJSGK3uQS4
 W/nUznRd6yNtycNC7nzRuts7g/cwHfa1gI1hBntdEUDpdk3yD7lIR/mgWjT3kjIBKGyp
 TZFKLWA9kRf9M+T4Qak+Hm2C86i5YP5sFWNdS7NDWw1WS0UF5nVuGcCLIeDjKD0G7mHA
 Nc5PkJoggV6yYAxaXrV5E7lPZ0GUNqqDLVjnnQKEo9X0u9fal8SN2lRVDkKe4wjmXiMq
 w1EQ==
X-Gm-Message-State: AOJu0YysliIvG27SjjEhJWW1HN2n3mK+r09DxImk6SZy7prQDA5BRihB
 DZyNWCHACP2kevSpR8FyfAiqVtRLvWjftvqP4XYGyTn721mdLdOpLL5j69xIWLTj5Lak+kY42Mz
 kaFg=
X-Received: by 2002:a17:906:f292:b0:a55:90c8:774f with SMTP id
 gu18-20020a170906f29200b00a5590c8774fmr2654479ejb.16.1714160617899; 
 Fri, 26 Apr 2024 12:43:37 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709060e0200b00a4da28f42f1sm11065387eji.177.2024.04.26.12.43.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:43:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 16/38] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Fri, 26 Apr 2024 21:41:36 +0200
Message-ID: <20240426194200.43723-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: 6EOgnmOOdA9i

tcg_cpu_init_cflags() accesses CPUState fields, so requires
"hw/core/cpu.h" to get its structure definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20231212123401.37493-12-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 9c957f421c..2c7b0cc09e 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -37,6 +37,8 @@
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
+#include "hw/core/cpu.h"
+
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 #include "tcg-accel-ops-rr.h"
-- 
2.41.0

