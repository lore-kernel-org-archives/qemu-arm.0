Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp626367lfm;
        Fri, 17 Apr 2020 08:39:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpjXSce5hO0vsR7rhojPtN8fbEWWN9XWzJOKYP7vUTi1htLvdskAlI8Ztkdvp6TCrOEEFj
X-Received: by 2002:a37:4852:: with SMTP id v79mr3675489qka.459.1587137956288;
        Fri, 17 Apr 2020 08:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587137956; cv=none;
        d=google.com; s=arc-20160816;
        b=O7jDGijHoVckoyhSsZFgVKOss2P9wqO2q1PT3hpr1aoHG1VkzaGMBNKPGw3a5LFces
         4RtthmINaXxWzQsWE0h4OhE6V9lAWVDijffHfU0qQ8h8qBFY8sAj8jrcLGCpcv1+mpWh
         680lNDmmdm7EKcIqdxwm+Yf4jPnrr7eMl12NtgDJ95c6OlAmg4jXma6xVJjLD0FboVGw
         ymY+eMVTn8MxIMu83do2mwWSX1si+bRZqiCH25b6ULVnzIvxRsYo5xbMVfLNTxaJoxj+
         oAUlyIKO3hkX3HkNmaGi0mpVUdAFGT1QA0kEfnPLyJ6KPRXyYWfRZ7J4HaG+w/lPrL5e
         Jv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vpOPoBv3VCeeI/djzLeiwb4idyChbBwxA9Kjfv+P0Q8=;
        b=qM7Ua4BG9oB+GQbIDJDp0lg6M14mOL2cKp6H0YJmIJeJ2SPLuNOW8fb0zKyq/5KTUf
         9Jhy2Ld7PhdOlqpfasI23LTD6ntJ9kuV8n4tBYdZKMmFhwpf2mGpSnmb7UZQt3E2VVfR
         n2G+GVrGNTIu92LOHJXKxKrOvRcSI+ggcpgINIMtNJzyEiR8hKEhC32z3xsgdWyAgLra
         7yIR+tiBSW+4+eMDrnsjDB+agIMFqgh9/s8idVLyPWa3g4O0V3nFFhDRfjt/bAvgG64c
         A6ws72Rt9pCSBVOAsgtVA+Fd1Z5sXDcrdm+AcoOaZvE5+DzaD9rGTMY42eKhgfWjLE2g
         x8/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=alh0W42K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si4611645qkk.368.2020.04.17.08.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 08:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=alh0W42K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPT5H-0001n5-OL
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 11:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPT48-0000JE-Pu
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPT47-0001Fs-LF
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:38:04 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:32772)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jPT47-0001FA-E5; Fri, 17 Apr 2020 11:38:03 -0400
Received: by mail-lj1-x242.google.com with SMTP id q22so2519834ljg.0;
 Fri, 17 Apr 2020 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpOPoBv3VCeeI/djzLeiwb4idyChbBwxA9Kjfv+P0Q8=;
 b=alh0W42Kd7XuS1CWL5Byu57eYQ3IMeC2R+2RfytryequfExch721WW4VdfY8mtrT30
 D6BKpQrSAEmGJfs9Frtgg9kKKfREBo3ibBvi55epnvOtokD0vqNAQvVL31vLk4xjW5pe
 nsZqPZ3ugOMdh2oNIG3CNWFrAZckSVyoUYrgfDusctrHVAUxROrPPdM+0vA6cBNzRlPH
 AOEhQXNWm2qW16pRfCV1TrwdGC/i8ZgCiMLNoiHFyrcPBB5OrMmY8HvFE5gBr4w1SO+H
 79tBF8rBLABtJeCWvZL1sTkguZ6rEhs53av6xXKJyMwcK7KVP/JhdPt3fXlYlP1h6GD9
 g+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpOPoBv3VCeeI/djzLeiwb4idyChbBwxA9Kjfv+P0Q8=;
 b=Et7NIM9hKzyiLplgFm0QfhgX+oZ2EsvU80Ck9Emg/CTOhlnVyMVU4J5gc5PbyIJLzo
 s59CYKVdd2Hb1ufoC2RVL5z6E9Jn6eAlGgCLtz1g1v/g5oyPh5FVOfAuNo7mdTwvMok8
 sKA2aGHaJIiFO2xS5vc2RxDqDDL0sH81JmhItAInGdieiylalFmmRC3Zni5cO97QzYmr
 hs/JJ9DWaoaWRYCj6KBECWCtZGFz3wmFsowo6DiGgZgfRQiH01pjUMuS7XraYW2+Y0+/
 c80oDRJtFcOLXXZ19V7ItzFp2W4C8QJBEluaUoYlWAfu6hM7yB1maXqH5fcG+rJ8HbXe
 OzrA==
X-Gm-Message-State: AGi0PuZOsSi5gyHNtLZEUv2sv8IFezsCWj+souQ3bjjXsOcsHr+6fptB
 +c8mzYpP7TPdpVXmxU4S9ySWff6lZHo7WQ==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr2615318lji.156.1587137881605; 
 Fri, 17 Apr 2020 08:38:01 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m17sm4331869lfp.25.2020.04.17.08.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:38:00 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal: Setup the ADMA with 128bit bus-width
Date: Fri, 17 Apr 2020 17:37:59 +0200
Message-Id: <20200417153800.27399-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-TUID: qy4PYKoWqmfs

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Running more testcases on the upstream models I noticed that the
ADMA was not setup for 128bit bus-width causing some tests to
fail. This fixes that.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal: Setup the ADMA with 128bit bus-width

 hw/arm/xlnx-versal.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.20.1

