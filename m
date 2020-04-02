Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1992926lfi;
        Thu, 2 Apr 2020 06:47:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLFRU3BDJxiwmspD5eTODW1zSG5J0lkWv/ray6x+aEjPs0iI6iwoc0FgjDuhyzqBEWgcRFp
X-Received: by 2002:a37:274d:: with SMTP id n74mr2639935qkn.259.1585835230400;
        Thu, 02 Apr 2020 06:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585835230; cv=none;
        d=google.com; s=arc-20160816;
        b=nRx9vaQkdpHt7rtThQjiiqTEIcJYipJtZcnaXPUO/L53U0OCD8h27RwSbKICCjHtsv
         qAvkh/g0fngYVcnP8E3e7xdvgngo9NDQxuJkeBp5qHpPMCobVF0WrIaM6poY4poJ2GZ1
         QgGcklOGDBsvkSvnPoFBsyLzaSqchuZCuFEVI8oj0aRqjQcGzM/KRy5VVFE6ptQGHP97
         PcJbEJIQEb7Iw6vAf36AtBnRueyNms1LG5B+e/r976Ak8BWO9kEpZKYo3ApCWOPYiJG1
         dISW23NJRXRcoBMsbn80StvxvNBjqm56OzhidFubaJ5cTJH+p+BIGuzn5UuDsxthjK6E
         EwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=a1+oHXuKff6r/woFFFjfDPVNB78x30jyW/Sxef4N894=;
        b=J0sJCuUNGH6Q8yN5DYNNW04C8SeL5hBR57OB66IheIEzhIp9nxr2SsrGSCDg2ycXks
         7YkD/aU0IXFfct4wJyxnr4m/oEpfuAMiVlyT8OWnXo0IY8umjQaMW7MlUFO9kxJ1Dys0
         7/QRk4N8Putt0LoAMiBy7Uj4Vxck/BMMps//JfccBta2YGVtpZ+e3oCcn4gfGA16I0jN
         zqZgKHMIrqGvHQI8UBTuyNCOA0Ibah4iyBqvQmS18pwEbhwOzcjGoGjvske9hGNeux66
         fw6A6nAtfYUBFR5uoMmlfCv26CNe6iN3wKdN5Jom12mE8GESh7ho77whWB2HJM1qzh/D
         ZqKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=STvhflsw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k26si3355869qkj.242.2020.04.02.06.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 06:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=STvhflsw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jK0BZ-0006Q6-OQ
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 09:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ah-0006Nm-SD
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ag-0001pm-RL
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:15 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:39423)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jK0Ag-0001n0-Hv; Thu, 02 Apr 2020 09:46:14 -0400
Received: by mail-lj1-x243.google.com with SMTP id i20so3275850ljn.6;
 Thu, 02 Apr 2020 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1+oHXuKff6r/woFFFjfDPVNB78x30jyW/Sxef4N894=;
 b=STvhflsw6eolqY0UHQEGzqbVyOhbYvFOu2Ob9oaj4ToQgxJOJP5otOAS5KOHY1fkLB
 7D/gEN1CBaiLKVh1TyH7u+5qiqAsuajkXHoHn3+sy8wzDEmztIIMOA7nuGR5paqiQyJx
 0pW4WXVkq99UurAI6nDpeQiGujwRnz2UqsrMVJVAkwWmY6F+xEqK17mzJYGkm9gaAlNL
 MwaHjsavZ/1AxCB9p2g2ECUbjScgypuMMhnTPkrhxyK8HEWzahqTro/naMnXhskJU1/h
 xYcRWFrjAQBHNZr0O9kSw4TROFYlE6p2rXJ4YqwY+KYEZeYdUZWdBIr+Lo1bdH7+LC5I
 d5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1+oHXuKff6r/woFFFjfDPVNB78x30jyW/Sxef4N894=;
 b=dODNJZm0ITt6XFQqu8/VJD7kem2OqxAnYWwX8U8/fsKTaMTnZ4Vs26GIDgAreh2RgX
 /TvHVSQU1FB+/TnR9Gr43fP1jD9+AkSdk+I4iJbDqhL6M48/UbFthYAno8SzTTg3KFow
 W4SpnCnQktB/+AVdOYx4RKUEn7gYRpvMJVfSi4piDxv0O1zqeADrZpJTdYdhlpIFLh6W
 rraD+IB94hM6NHvlScUHOMg25YxBV+4G3bG3CkPRJU8ltPpEnAYFuQZ8JtnO2TNxMsgZ
 fnlQiLVXGc5QGh3+4eKdMJEpCeZuWqgODqneZqfawtxDHJeHwECEhxVcWjrTK5SHcwpv
 egsw==
X-Gm-Message-State: AGi0PuY56C4eNQ5gaqSuTE+3gFjX4eRRpfAWYbTvdoLey+hr4J4dyFPD
 xnjRRxotzsL2l7cmQ/SXzntix6aaswTf5A==
X-Received: by 2002:a05:651c:1aa:: with SMTP id
 c10mr2103915ljn.53.1585835172206; 
 Thu, 02 Apr 2020 06:46:12 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c22sm3849538lfi.41.2020.04.02.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:46:11 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] dma/xlnx-zdma: Bug fixes
Date: Thu,  2 Apr 2020 15:47:16 +0200
Message-Id: <20200402134721.27863-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b7SNdEKMOOm/

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

This series fixes a couple of bugs we've ran into with some
proprietary test code and drivers using the Xilinx zDMA.

Cheers,
Edgar

Edgar E. Iglesias (5):
  dma/xlnx-zdma: Remove comment
  dma/xlnx-zdma: Populate DBG0.CMN_BUF_FREE
  dma/xlnx-zdma: Clear DMA_DONE when halting
  dma/xlnx-zdma: Advance the descriptor address when stopping
  dma/xlnx-zdma: Reorg to fix CUR_DSCR

 hw/dma/xlnx-zdma.c | 56 ++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

-- 
2.20.1

