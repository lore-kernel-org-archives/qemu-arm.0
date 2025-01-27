Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2379294njk;
        Mon, 27 Jan 2025 03:57:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+Mdvw6stk9ZyzEmt0Lq3Ham27pGSIo4SfvxaTcO42Suacb0ja5wKJFtj2MU77YMCV497gA928cQBXoA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdenn7e+LqiBs7zlL51K2fbYHZ3V0wqOpse0i1QUwmsWUWJ6S4QRuBPiymgh+TT5zHbxdc
X-Received: by 2002:a05:620a:601a:b0:7b6:f1be:4f7e with SMTP id af79cd13be357-7be6320bd00mr6052107685a.26.1737979058898;
        Mon, 27 Jan 2025 03:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737979058; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1Wk4Jzn5gGpW4J3DsgTOfaUslSH33jg08IpFBGC8vgOnXVcGnAjR0R//Ub78x7Z46
         MI997hMNdirRegeJ8H1TjkUloiNj1NDZzjou+e2NmBZdudH2GEqniLNw8CLE26sBWroh
         YTMzLckGDy4WFHV2Lp4O1oPUjakOzVr/hv76++wLyaoAZB10VMrIN7o60v/spzkHN8M5
         7qlneo5HGw3qjOR1xIjrPhhQlduW0h4BEoENrjU0Ik7phhXHdvWqSNNcqaNlIEYqB38n
         lnSepSHRwtVB7Yl1Zl6ZZeKiO85i3pH538ZU1odcq5sIKasTNFx8MjVeCv7IG1bo32zd
         U5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0D0mBXBaLsDF4AjforVcC1QF9ut0pEK5UwN8hfEmGYc=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=ZWgIbBuZAehf3PylTx2F6fBKULq/gjowleY6saNeBDAmEcDQIfBrcFz1+ex8BNWp7R
         a/NZIW9eQu4IK3pycXq/gs7tYv2G/83K6o6yImDRphDZJjH1zfDKuP2HcgF+X5Ras1NE
         itSuSNwQ5NVyE4s5Ub/E0mFP6yQhEri/vvatSwJu1wWd2VXS/HJnf9/cshDBZjnAOLVQ
         8URSvJ7b6HHFRFect01QzgYd+/Q4DaKl34V5TaX0zB0JXS3w3+XX4Z3rEoMNhPVav5WP
         zATq9gvjuXBItkJ23y/FkOuKX0bqINgirGNkAR1rfhCDdSCMoBcZaj+7KM2ETHTML9l+
         e5Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlM9Fqn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2b903si918189485a.624.2025.01.27.03.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlM9Fqn3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNhe-0006Vw-1O; Mon, 27 Jan 2025 06:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhb-0006Uc-O1
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:51 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhZ-0006uT-4K
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:51 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so3613664f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978887; x=1738583687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0D0mBXBaLsDF4AjforVcC1QF9ut0pEK5UwN8hfEmGYc=;
 b=QlM9Fqn35rwC3hu59u9W0a5gJXM2fG3GboadZGAnC9qdmI7ahjeiAeMvXJpmU1G5eT
 yugwBkgwBUXIEStfxUrbBDizoL66xfhM1A2buDj008zOT9+78imocxebGASOKde+8WzN
 Mcyn//1Kg/7fQZQl9KfAvIAbinTV0hmKBaKS6TieY1HrbDH801P9AwdIfCOAe2D/AXlc
 4vK3i8XG+mkOir2pGes9viqGbR0QJb6K2bXtYnQUYi+WQ4LWEQFQy3a8vd/GOxMMYA5u
 68Z6gygGQyi/03PR0hAWi+17j62272dohX2F0qtgvEEtyB/vDzX3zUCsVKp+Bef0u5DM
 iMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978887; x=1738583687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0D0mBXBaLsDF4AjforVcC1QF9ut0pEK5UwN8hfEmGYc=;
 b=s8EHBJ1nYdf9SdQtGvsWspY/WMV9KUY1d/kHzWHszVbEFlEoejgFV4IKyImMuxqszR
 juBmrTdaIVAfR937yJW0xHTzD/2wajc87+5IMbDKL8kHUK8PiR3QIXtGcPjZ2otRpj7a
 /pQ0ZkhYaG6imqXZfANXHXWi+pTGKWnLQstqQhmM3vk3SCpbOVXkPExdxqFLKXb021SV
 tA7sBk9/nXJghQJcxLnPUbxA9owD5YsGLWfSPhZhjBahwvWfKYffDk4MFZSxMA+gt5kn
 oidJ4QhoXIj+L/DxgetbZU6QgLRTokCT844kyYA03E/aaJ4JCvH+/GrrtW3kL7n1tVVe
 7p+w==
X-Gm-Message-State: AOJu0Yyd7GPwanXHfDHDb3HxBLo1hD1hwN4M55DKvmN0GQ7HAyvCHaDg
 RTxGLZ31dpxQlrzU55cDy5eKXRyyi5tAMwk6YhyuF80UfW7vZ0dDXgKrallqtdY=
X-Gm-Gg: ASbGncupc5Vm8GlgEIjlLsa5XFgrFqf3K/4RXfjHUWKNWtADkH6IuMxcf+BQq/j5hnZ
 1BH414m9u+BGQqWHtxUsSgxc+judIoCwBGtV9Es0y0gah3UabqgQOrKCalDEFv+1VxvWiP7ONXY
 9n1DohMW7HvRvJhO6YRrfLPdpgIzVoRh2p0HsKBNLyoL1DVkOoTyxIoPRF7LFBUK2ZRcO7WaE9b
 tLLXGuCnmDrX6G1m0iah0RIA0qK2oZMxwmtz5tZWbkMNW5NS0fMc7UWRYYQjoDpbzDVzzaLgVBi
 PoHkMxy8MWIkWTEieMk7/fbLQbwgz3iir7R6ugewoREsUgRgBztiMAM=
X-Received: by 2002:a05:6000:2af:b0:38c:3eab:2e17 with SMTP id
 ffacd0b85a97d-38c3eab2fd7mr3370033f8f.2.1737978887560; 
 Mon, 27 Jan 2025 03:54:47 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188928sm10794589f8f.45.2025.01.27.03.54.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/10] target/microblaze: Set disassemble_info::endian value
 in disas_set_info
Date: Mon, 27 Jan 2025 12:54:20 +0100
Message-ID: <20250127115426.51355-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fRk7QulD1+FT

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 13d194cef88..7603d2e8f73 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -224,6 +224,11 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_microblaze;
     info->print_insn = print_insn_microblaze;
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
 }
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1

