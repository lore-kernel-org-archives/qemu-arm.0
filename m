Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880944ejg;
        Fri, 19 Jan 2024 03:41:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1JHc2kfRRjWRtRkhOuIzbhKSt/01iLI5k4VJegNOz0lXjiKrcIUObmHWEsfzkQYQ5xXeK
X-Received: by 2002:a05:620a:4712:b0:783:4d79:760f with SMTP id bs18-20020a05620a471200b007834d79760fmr1389197qkb.16.1705664519034;
        Fri, 19 Jan 2024 03:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664519; cv=none;
        d=google.com; s=arc-20160816;
        b=ct8rFzgsNyyHpowuvfIOqgU4LgZrTYM1zvClLv2tGlF0X+i/y6ehiK39bIv7Kngl1W
         9f557ZM/1zPvF1fe6iUf6jRE6rslbJQotYLcHwkcN21YU/hQjKHKItVfBAUSZjS3yCby
         me28Mqa47Id6m6P3nu/IzQr/1WsV0QxsSfakGQcOOLGD2Dv4Xaj3G72FTGiqSmf7Sxuv
         d5n9vQdpL2f+lGPSpAHOiai1duGG5iukS2aS7Bf1K0z3Ea9YzVJ1rUgr4mQLrbk1V5v6
         bqk8WKqm1d+6uow0VCWVLO5chvqwZWlRysJadGD+3KiBdOFa0HC9eSfOFWn/4SLpklW+
         W9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W6KPMPhrgsV+R1Z5ztift8+++ccJQHN9jxOgkalvdDo=;
        fh=PTYYIL7o5nvcKmhdZ8esiNe9bpTIp4+Nq0xgZ4+Jis8=;
        b=t4e7W08hcnV3IzaKZjxLn70i4JCdZG3HRXCQvAiHKvf4O0S4tAFC8f/rFkw+NbE7Ba
         4Nf+BjCHqNbHwoxpoQ5GXbMcftsferMMfrNHQHhJhgiZkupqSj0ltZdvWpb6yqSwFOx1
         C/d/boqGS0wzvfh0u1aTD4wJ0sEK1xICwFiCe87TxHNfgdAjxMC3czMFP/qePGfXlf0x
         LkPlq5il87wFEg7Ak8vuWZm8waziagJ9uTAckwLy65d5zYKDGJzv5Az6yg4ZS5xkc/aa
         08hy+HriZ0xP5ujZS6pSO2pwiaqeUHy5Aeyu2cZ8abSbFyuKUwpqbBVyDUzUBY6cSLwN
         HADg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdiKiNYz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a0a0800b00781e319f28esi15844364qka.160.2024.01.19.03.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdiKiNYz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQnCI-00084U-L3; Fri, 19 Jan 2024 06:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnC2-0007ld-C3
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:50 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBz-0003Aj-MH
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:50 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-337bcf021a4so456073f8f.0
 for <qemu-devel@nongnu.org>; Fri, 19 Jan 2024 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664266; x=1706269066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6KPMPhrgsV+R1Z5ztift8+++ccJQHN9jxOgkalvdDo=;
 b=DdiKiNYz0c/zCpyOhoeYIzrJK8kuod//4sgt9t55UmqgPvhgR1Df+AbDGpdvlc1kFg
 jQwuApvNkBVxPvaJ93DPIBIGzeDWviK7A9GSpyMBUfH9fcfKckVjEIssdDgm42Wh9f1g
 F5nVJT2yogi80/Moi0KD9NSvHfZ30Nnqm2EHUKquUqKgp8JoRYcG8Z8ji/Ln80ggiFPK
 w1TkboegwWVYERvB63Lm+z+xFtvfIz8/xvUj8Iv4UehIbrioF0vrWE2EZYo6OQFO81Dw
 mb7xE6cSlQ2Zr+iw5mCKcMbmwkmbPTZm7BlaHBfWECRn3OlXexAzmzt54/lTrYN78dwO
 Hz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664266; x=1706269066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6KPMPhrgsV+R1Z5ztift8+++ccJQHN9jxOgkalvdDo=;
 b=Jlkzs3Cy8G+irLDZtxG9rliUz9O48rIeovGx3aUV0UhkBhfIEAx2I7c1+E8iqWdjF8
 m+ESoJxVkkfTDM0wx6+zToqLIWPLGypVtHOeXW7Yv0VBv7ydW0Ays3PDfLPF9LDHvxde
 eOdn8PrWk1pMuSnZ8B8qc7pd5hOjr5ilypcL5UYlX69r8+V+rlUO4ufbEdEvYHZibbSm
 ZN0/E0OoLfu6O5WM6wU7g0b/NuON1KvFaaiZ/F0F+rQoXiyjemkuDk/If707T0/CcWkF
 BVUUQM3rwc0yj8NT+OvpERuO3vT7gHtyt6yazFkfGBPpz/AEhyKv1MtEt3VoGP1cs3rD
 givA==
X-Gm-Message-State: AOJu0Yxl9etRkQuctRVrkf+zT3ylXEzrcdEwbz9sUVXqEj8roPUkGnG0
 oT3PfsxcXQ8CE50T9C0GfIW/r+60+QAllSDFLO97MAXzGUX/9SPV5+yD4yVA2cl5UJvvXtWPLK6
 mpcdUug==
X-Received: by 2002:adf:e7cf:0:b0:337:d711:ac9b with SMTP id
 e15-20020adfe7cf000000b00337d711ac9bmr282569wrn.139.1705664266147; 
 Fri, 19 Jan 2024 03:37:46 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 n7-20020adff087000000b00337bb0f370dsm6313328wro.40.2024.01.19.03.37.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/36] MAINTAINERS: Update hw/core/cpu.c entry
Date: Fri, 19 Jan 2024 12:35:04 +0100
Message-ID: <20240119113507.31951-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: gxIpsFMM6gjO

From: Zhao Liu <zhao1.liu@intel.com>

The hw/core/cpu.c was split as hw/core/cpu-common.c and
hw/core/cpu-sysemu.c in the commit df4fd7d5c8a3 ("cpu: Split as
cpu-common / cpu-sysemu").

Update the related entry.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240115094852.3597165-2-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 760acdea66..dfaca8323e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1867,7 +1867,8 @@ M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
-F: hw/core/cpu.c
+F: hw/core/cpu-common.c
+F: hw/core/cpu-sysemu.c
 F: hw/core/machine-qmp-cmds.c
 F: hw/core/machine.c
 F: hw/core/machine-smp.c
-- 
2.41.0

