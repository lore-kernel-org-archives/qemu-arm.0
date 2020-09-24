Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp165721lfq;
        Thu, 24 Sep 2020 04:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6vRJGf85OMnmcO/vsOzF1MkKJq/7SW862krasWVgICQ5gxMRJbH2RH9AbkN44J4Y/zt6g
X-Received: by 2002:a25:b993:: with SMTP id r19mr82884ybg.374.1600946402671;
        Thu, 24 Sep 2020 04:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600946402; cv=none;
        d=google.com; s=arc-20160816;
        b=GY4V0x2xt/djwMubd8pjnDMxMK93qSa2fDbMaplC2pE/kxTvU71MUskLNYjTM6QeBK
         JmiH/qvXQyFydSPjrPdyYBy4ew7wY6aJui/pUTShSElZDA29y0tRXhGocKR63GwCU1VI
         YwGjNngzng7VH6jSkT9dKt7yDF6aKQWe+y541BM7vNq1narSsnkMPs5ZdhTWy/dhHHPy
         9mf4HkNZI49zr79Y98Ds/HOk373vEGrNvJmk8Puj6Dsq+SbHDEuQibmF732MbTWaQfd8
         860T/Rp5YhdS48E6FMQRJuQ1EqM4o3XrlTozNgrV+FlcXNUx0/ZSjqc9G/kPa5Ea0tNa
         rCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jRYBbPZdjZNqhsxNCbQU/40Ab/DhwUD75yfurRb+dzI=;
        b=zp+YixNfzZmPDMAu8hslpLh/TmIyY5syINTddkF7tj0IvKxpKnEbOMDKh9YrgCKqdW
         X7iXzg9awPab/tod7UPyCqXLClQqwcGVMzdcwNyZQBtchkURd4cuSGMdScG8b+cj7DSP
         s3qdpLSj4rhrylkPGFjAu6nIpum2F/WzsI1wFiqx3RYmoXnzxqoY7hwpt8z1/VXUJY4g
         SWz/jlKECkYkKqXfgKnwfrj35OlMtcE8LZCgCmHMZY12ZqLlusQryhHhXZhiUPh3fgCO
         AmVPElV/qwXg59Io/g9tOeOWxiskXwnpw5EERBcZirr8o/31OnGcJhKUR3mUrGspL8mh
         3OYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Is6odIUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si2766461ybf.118.2020.09.24.04.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Sep 2020 04:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Is6odIUB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLPI9-0006Ej-VT
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 07:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGS-0004C0-3l; Thu, 24 Sep 2020 07:18:16 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGP-0003uJ-Lf; Thu, 24 Sep 2020 07:18:15 -0400
Received: by mail-wm1-x341.google.com with SMTP id e17so3140458wme.0;
 Thu, 24 Sep 2020 04:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRYBbPZdjZNqhsxNCbQU/40Ab/DhwUD75yfurRb+dzI=;
 b=Is6odIUBW44SU+LOw24Ds41ytKCpjyYfE5RPQtYIYtm+eQ4P9Cf/DgLI/wI7IRQ0Jm
 VFaTWi/irZbMVVGWzMKlZIw1MIqIRy7xS/25LD9pBV1regbR1Cp8uoDo5ZQz/l5rPwee
 Jgcj1EhTXNVncjoaZ+OcPryas61G5V97go3najE+iOLO87Gih1Pxa19AoTQ2TK/GjZ14
 GAEWI0cHsfAmtjci5Dr2fNcBAcjil2jCbtYWAm+t2N8SEBx/nXb+GgOsU7z7s0N6tuOS
 UITzH2A55p/X4JdgLfznvCesXdYbIiD3buXZVD0xWMmCgde6np0F8jTq4sqPHm3qXxr5
 K3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jRYBbPZdjZNqhsxNCbQU/40Ab/DhwUD75yfurRb+dzI=;
 b=KALP18+Wq25nxYa+13jBYShlFnUhT/eMkQKa0eDxYhCdJGrHjar8sq+UAm66V5Ldm9
 MggrP8RnJG9aH+W8rV5W7qPNbqe8AHbclK5S/+xfnCcBx50FnQgGitqu2x1LAtXTcuPC
 gyfFp+kQKC0ZHVsMEXdUOIbKcvmdN9F77qCd+Cd9uwxnsLBwVsYND5f+0mpH4EOIPPho
 18RRzFLJPBh7Q8+ZHZci5rFi9HRqRprbosuuEsMGMyFrzaqMPhPrKaudlq30KWCeTqU8
 fbFs1DCw7iF+kpe/Wxro1jQkzAGHV4C4U/qR7FdjXyUbR0aEzfm62tLBCnLfjrwoX3Bn
 aYSg==
X-Gm-Message-State: AOAM532XEtLjmdgW3muoSwT8kZ7idlnbb2wqec9BygIkkNiq6NRD+d2F
 ihgfbSdUODh3yDEXJdPksMP0VxJSlGI=
X-Received: by 2002:a05:600c:216:: with SMTP id
 22mr4004200wmi.149.1600946290374; 
 Thu, 24 Sep 2020 04:18:10 -0700 (PDT)
Received: from x1w.redhat.com (234.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.234])
 by smtp.gmail.com with ESMTPSA id h76sm3400363wme.10.2020.09.24.04.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 04:18:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] hw/arm/raspi: QOM housekeeping to be able to add more
 machines
Date: Thu, 24 Sep 2020 13:18:00 +0200
Message-Id: <20200924111808.77168-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+lOb5AwxxNd

Machine-specific patches extracted from v2 [*] and rebased.

Series now fully reviewed.

Since v3:
- Fixed typos (Luc)
- Added Luc tags

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg680135.html

Based-on: <20200921034729.432931-1-f4bug@amsat.org>
"hw/arm/raspi: Remove ignore_memory_transaction_failures on the raspi2"

Philippe Mathieu-Daudé (8):
  hw/arm/raspi: Display the board revision in the machine description
  hw/arm/raspi: Load the firmware on the first core
  hw/arm/raspi: Move arm_boot_info structure to RaspiMachineState
  hw/arm/raspi: Avoid using TypeInfo::class_data pointer
  hw/arm/raspi: Use more specific machine names
  hw/arm/raspi: Introduce RaspiProcessorId enum
  hw/arm/raspi: Use RaspiProcessorId to set the firmware load address
  hw/arm/raspi: Remove use of the 'version' value in the board code

 hw/arm/raspi.c | 152 +++++++++++++++++++++++++++----------------------
 1 file changed, 83 insertions(+), 69 deletions(-)

-- 
2.26.2

