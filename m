Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4988364lfp;
        Mon, 17 Feb 2020 03:46:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyIlEVK+XA9cfwlsesVrMoh5P9+kNPtR7z4tmiD4S2lh8ZE+G+kEo78BFHqghdNtYer7+8
X-Received: by 2002:aed:2ac5:: with SMTP id t63mr12266642qtd.315.1581939962559;
        Mon, 17 Feb 2020 03:46:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581939962; cv=none;
        d=google.com; s=arc-20160816;
        b=Ttcup0gFlTVbRqmkiyY6hGw+B26wP8+7ilj7pWIB1nR/oq0YHOuQnvHHh5JeAx30Yl
         7kNH6JSHajybPzpAEvryuWuiAfr4VbZwwq/XM3pVnI0+2oCCZpC91sW5UBdqmW9CgI6L
         DnhPJKLkJ0MGW1DEplvIhxfA250hXmEKxcfT4BfUs69Wm2c2zQrw/h/kCwOhulpGB8BA
         8O8ONel1pPOP9lAh8YEpREnzwKRNt7J9IcKIWv+tjvIvx/7JTkk/xv5acJ/T8TxPFHLb
         oY/ICzqoTgczcwi7M4zEUBM7XQgE1lR3+LlFDFitQCS9V6/CtkMkjzfdEvKFetk8toes
         sSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CQieaLe+XzdG/scqrmf0SdvellEvi4/sJOsfkTjUk/k=;
        b=p7swAx7K2RAU8T7XGIDzP/8zOfExIWfBVYdl7vgMuFWvz4Ozl3ZxyIWZZKEhPXRWC8
         FBGZ2QkNxVr1sEiRVO5YIVCuRmUrYqPNOm0MwpU98aWj6TD5ggRX2MJk/HXweHOEY+qw
         4QSYjKAlR83+pUJyumAUaNrKB16ahHKZjZmWe1OmQg8RgU3WoTqSj9p3lv1ZWSb2QrAJ
         3XOn1PcpwouFD+rEkNIAAwNGDdcA0Iricc9c0gukVo49/DqavvhrhKHADMsfAyjHVQv8
         hq8i6lSXVFXWflAzdHeXlHpgm+RWpRNLjaHoRaoHcQOnU+NdU3rXvPwHZUgU5v1Bi8U/
         0xCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="IXIUOD/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si197525qkl.25.2020.02.17.03.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:46:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="IXIUOD/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3eqf-0006W4-T5
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqL-0006SX-CP
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqK-0002Nb-CP
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:41 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38341)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqI-0002IN-7c; Mon, 17 Feb 2020 06:45:38 -0500
Received: by mail-wr1-x443.google.com with SMTP id y17so19314236wrh.5;
 Mon, 17 Feb 2020 03:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQieaLe+XzdG/scqrmf0SdvellEvi4/sJOsfkTjUk/k=;
 b=IXIUOD/tMMjlZo2zjX9iGESFe/AKtsDvRbx/V/mhLn3FuF42j6ZcuBvCJtqv/b9lrN
 vZK4CNKbTZnZzbFN9DAwiTMlp5OWHCpktH38QBI05Vzm5TQGW8JynuIVYxCGLjNy7qdN
 bVkSf3cROrY2WGaZZFKFq3cHSEDqHu7KeLivWZqmtR6QykTuq6GoIFXEIPgIH8iQ/1TR
 ypGAkGM7lkxSeWBGVR43IFUe2COBUjCcdx11eVonxxAw17JNXMiQXfhxjZqydbSjeStJ
 YydpEdzBvFWCaqr2Qk0Ar44ZRKPnbKbHrifH47c4EBJihaOBQ2W9E7bT+qtOFfuKXW9J
 q2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CQieaLe+XzdG/scqrmf0SdvellEvi4/sJOsfkTjUk/k=;
 b=pxeIHzmNdiiqDaw8+l4YK8Rl+wIsKk8kpNTECsSGAwTDJnB8AWm4Y1/GNKX5/C/5CJ
 NoZSUriqYYlWwXG6xrNUOmBLv1kTv2MTqSkqjLz26UE9+P8+TzXEx1L+mZ9eccFkpdC3
 ZAFdXG5JcIzbXvnXDm0Tqh0cvEDndmS3Cy4Q0gfo9FxrhXgtAxEO8c9moqkr+h5o5EGi
 e8Jubr2lRAwFMBlH1kUHB4P/YEzYIbmDiVrygSfHLBuBGjKkJ9z9sgHeULUVtWUStB6A
 vkkxa1t1MOOZcsTnCA6Ru4Mr8R8NBPipjf1c7+WzmvjxYkNmKWfcexMM5yvvtcX7ctHr
 oIGg==
X-Gm-Message-State: APjAAAViVpFNv2Ub8nC/HC8JE9N1a0maxQ0maiIByHrvuQw5g1gNRPoY
 MgGtGgIwLe/MvtfsjnPFyzzXbxrNpZ4=
X-Received: by 2002:a5d:5273:: with SMTP id l19mr22952522wrc.175.1581939937009; 
 Mon, 17 Feb 2020 03:45:37 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] hw/arm/raspi: Remove
 ignore_memory_transaction_failures on the raspi2
Date: Mon, 17 Feb 2020 12:45:21 +0100
Message-Id: <20200217114533.17779-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRuk1QFKnVuS

Commit 1c3db49d39 added the raspi3, which uses the same peripherals
than the raspi2 (but with different ARM cores). The raspi3 was
introduced without the ignore_memory_transaction_failures flag.
Almost 2 years later, the machine is usable running U-Boot and
Linux.
In commit 00cbd5bd74 we mapped a lot of unimplemented devices,
commit d442d95f added thermal block and commit 0e5bbd7406 the
system timer.
As we are happy with the raspi3, let's remove this flag on the
raspi2.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 90ad9b8115..221356933e 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -324,9 +324,6 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = cores_count(board_rev);
     mc->default_ram_size = board_ram_size(board_rev);
-    if (board_version(board_rev) == 2) {
-        mc->ignore_memory_transaction_failures = true;
-    }
 };
 
 static const TypeInfo raspi_machine_types[] = {
-- 
2.21.1

