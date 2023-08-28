Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1748025dlb;
        Mon, 28 Aug 2023 15:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsLH+yGESMJLX/XiMyprBEUBemXqXQZGv/vnCyKnrLkQt6FnKNL1LbdwPvowa+t74KhY8g
X-Received: by 2002:a05:622a:1049:b0:400:9390:d129 with SMTP id f9-20020a05622a104900b004009390d129mr37854077qte.36.1693260854152;
        Mon, 28 Aug 2023 15:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260854; cv=none;
        d=google.com; s=arc-20160816;
        b=ZI70RQrM5wnzXywV49DXMmfwonxNCoooa89h5yr9kVZj0QuXi6v65V828hKmHGLpBz
         T2KlA5S1+Fgi/xFMyvWR0mIrnxRjyjLwAjBiA7U6rPVCQTT+eI3BG3yJGEzQ5ggitikf
         0KD1M7v1le8Cw4Z3neTfOtIcbvdLSzbmndclM6YS7XRtAJD1l6veiJt87892lnwYxc87
         m/uCmcCrR6Wgjf3pn9n4TrC2/4q1FE7rqaKlyuyqc0jIzAO+KZzveT22RJ7Kdv1FkKwo
         +uciVzGKWJoOe6qLpqA+u5jhZMLXLhGJsnN/J4IsCZrU9bQH2HDw+JHMdiWNPvUO5ge1
         7vZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
        fh=CBJPxJEjNCibwfpZfKrPGtkERKtYgP+G6TPhM7p5XaM=;
        b=ghmfageXjT2vVUeKWVqTjDxmRAzf2ZgIUUol9sIptME4RH/8UKus8KjQzme6UyWF3B
         zNksTb00L4EuySgZRMouZ1uEXNQg1TOMacEWJ5Fx57JPWrflxZyGkHfuVi3T0FvmpYGw
         hFgTpLTE9X4zvGsXQuAkHy83nFIS7HH0kHOWiVtbnzPEZAW9pJT8qMEiJGGfhxOjbqAC
         1W2cP/LSlcdXA7cYCdHIzja4+ECGbjCa+3yiGPQfqFDGHY6hmibCbLeg/M7WwjnAEOuV
         a/R6rGC/eB0BxSVEUR/JEBzsvo88ppHazUNB5E1CwT6u1FjK10iz0JwsIAMWUkkCJW/g
         Qihw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7BR8xaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a05622a044700b0040359cb66bdsi3154331qtx.473.2023.08.28.15.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7BR8xaD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakUF-0005rp-1f; Mon, 28 Aug 2023 18:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUD-0005rI-Cl
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakU9-00047y-9L
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:29 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so2312978f8f.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260804; x=1693865604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=P7BR8xaDjcJGshJySCVQVljJUEjiUazbpSm6e1BrSRK+dCfM7YZ4UL3KGATyHUIm1v
 0n6TjpdingX0FubBMXjURoyLyOfDVd2nooMZL2IRehWAnC46vCUeSBBlSRDJ8q0lv1iy
 vqYmYypvtpHR9mv8E0O9krIbh2FpkurwLZd9aUJJ8zeJbIpVvVwpHFDlnWptsZE2Sh2R
 dBN9pPlV+AW0EPgyUHiX12xfO1wwQam6kV0iXkZu1cRAl6xabGMr4M+KUfuBmj5LKWM7
 Auo23CNqfNZ74J7crYM8/Ey2XTjImyGGSVHQER1R8NY068/ItAuxIA8cBGehJEncdVg6
 Zx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260804; x=1693865604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=ftVRlSRl1ZKVyTGCpKfXFEXjoeTgQA5HxO4nbIXZmzVm5Q2XGsv+4eK41gFVhdKNW5
 m4ki9B+0doEtJGp7FDSRBxWYfGRPaE+Uy+wFYyff6UBrECSf+4nSPHKv3VRytvq726HJ
 REf7vhIyspAFWA27EImQl/SvMV2G+ZLgMaj9sG1NfMIXDjTkhVWTnl4ous2vT9x51n1f
 aZWEwoXtZE2hbRhEM6VlXa2tSKJPlcNDrZX0eQgYP/tALgTEIoZlrrKN0FBUXG1HsewN
 FADd5rBB7VP7XfHVDqXEBQ4sJe4hU3JTqhiL2i5/kUQ079QYgCIGAefR7rn/QDUkM4Vv
 QMVg==
X-Gm-Message-State: AOJu0YyEy1IH1OMYJv7j2NTruBD+XBgX/ee1+R1IJhn3hcNX4ACIA0AL
 t+qmkVi1rJYyuvPTrL+emiwK+g==
X-Received: by 2002:a5d:530b:0:b0:317:ce01:fe99 with SMTP id
 e11-20020a5d530b000000b00317ce01fe99mr605633wrv.9.1693260803920; 
 Mon, 28 Aug 2023 15:13:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfed45000000b0031984b370f2sm11756175wro.47.2023.08.28.15.13.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] target/ppc/pmu: Include missing 'qemu/timer.h' header
Date: Tue, 29 Aug 2023 00:13:04 +0200
Message-ID: <20230828221314.18435-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: VRcuLVjQfaZw

Since commit c2eff582a3 ("target/ppc: PMU basic cycle count for
pseries TCG") pmu_update_cycles() uses QEMU_CLOCK_VIRTUAL and
calls qemu_clock_get_ns(), both defined in "qemu/timer.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/power8-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7bb4bf81f7..2537cded83 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -16,6 +16,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
+#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
 #include "power8-pmu.h"
-- 
2.41.0

