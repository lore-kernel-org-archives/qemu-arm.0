Received: by 10.25.159.19 with SMTP id i19csp857682lfe;
        Fri, 12 Feb 2016 06:36:32 -0800 (PST)
X-Received: by 10.98.86.145 with SMTP id h17mr2589470pfj.9.1455287792382;
        Fri, 12 Feb 2016 06:36:32 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id a78si20386512pfj.116.2016.02.12.06.36.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:32 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x242.google.com with SMTP id 71so4065080pfv.1;
        Fri, 12 Feb 2016 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=KenvIwYWiYpYTOWcCr0fJLwxOVqDrG+7Q3i33Fipl9Q=;
        b=MCJYm3oGEoTc4/V+FCdzsOPmeQOOEcI/RL0gTofepff3tGBqAuYtW/HjJYXI449uc4
         Afe3PuJ6BDJydlmgq6lu2bm6/LiuNlh1zwx2Suk1bC0rvWzveHa6AUcDW2dPVx15Drdb
         6X1OPjHtldW2rO62+Hx89owBtKdAyNmyhtWMD5RlNI/flnV7reZpHkMewRCH6PoTrGD3
         SCQBl//l++H80obl+mv8FfWlhgJyZthG9By7L/PEjp9ftOdtEWGD1b6zJw/sG/FU0TBE
         HYFsI7f6Jx7mlWFrXdWSfzSCFsrSmwlUaGHhOyvpG4FEq0IBVKx02/v5Tfsew/9c80Mi
         kckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KenvIwYWiYpYTOWcCr0fJLwxOVqDrG+7Q3i33Fipl9Q=;
        b=i6GgS3smChRUP4CxOC8wXXg6zauiGFuh1yejm9hA/YwKQQsC8yKTuT/h9jkAf2ptit
         1OQjVr+idU9KQEfUArQuku5nuWSLb0xarmJhKD57zZz0Q/QpoyGmvma9ac2O6s533sFv
         OjmAmXyh1CfubUHUgsoTlxoMh4vFbcm25LzhdsZaHKKVYB66AxnsaDiab2Jo+si61TXX
         kRJlABSrR2XPKXsseynsbyEpYljAtanANhtK3vEzkD9Szd5f75ShtWi4mptoJB7GOv18
         rA3s+VxHtSaFuZSHSOs215SJv407VoHc8bgiPwOx9M3gw4UOIOTio7Rysr6DRZ0OObpe
         PN8Q==
X-Gm-Message-State: AG10YOTLVumPBqJGXBqNjGyyD8pKPW1Ms6rW8BTAU4Kgc7YCmnHKGOskKkdkU/8ouqlCYQ==
X-Received: by 10.98.93.2 with SMTP id r2mr2642710pfb.64.1455287792081;
        Fri, 12 Feb 2016 06:36:32 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id h65sm19993768pfh.43.2016.02.12.06.36.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:31 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 0/9] arm: Steps towards EL2 support round 6
Date: Fri, 12 Feb 2016 15:33:53 +0100
Message-Id: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: woYad/18zDbR

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Hi,

Another round of patches towards EL2 support. This one adds partial
Instruction Syndrome generation for Data Aborts while running in AArch64.

I don't feel very confident with the way I collect the regsize info used
to fill out the SF field. Feedback on that would be great.

Once we sort out the details on how this should be implemented we can
fill out the parts needed for AArch32. Possibly in a future version of
this same series.

Comments welcome!

Best regards,
Edgar

Edgar E. Iglesias (9):
  tcg: Add tcg_set_insn_param
  gen-icount: Use tcg_set_insn_param
  target-arm: Add the thumb/IL flag to syn_data_abort
  target-arm: Add more fields to the data abort syndrome generator
  target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
  target-arm/translate-a64.c: Unify some of the ldst_reg decoding
  target-arm: Add the ARMInsnSyndrome type
  target-arm: A64: Create Instruction Syndromes for Data Aborts
  target-arm: Use isyn.swstep.ex to hold the is_ldex state

 include/exec/gen-icount.h  |  16 +++----
 target-arm/cpu.h           |  27 ++++++++++-
 target-arm/internals.h     |  20 ++++++--
 target-arm/op_helper.c     |  40 +++++++++++++++-
 target-arm/translate-a64.c | 114 +++++++++++++++++++++++++++++++++++----------
 target-arm/translate.c     |  11 +++--
 target-arm/translate.h     |  65 ++++++++++++++++++++++++--
 tcg/tcg.h                  |   6 +++
 8 files changed, 252 insertions(+), 47 deletions(-)

-- 
1.9.1
