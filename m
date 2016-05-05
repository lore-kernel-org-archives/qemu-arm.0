Received: by 10.25.208.137 with SMTP id h131csp813466lfg;
        Thu, 5 May 2016 09:10:03 -0700 (PDT)
X-Received: by 10.194.115.230 with SMTP id jr6mr15144445wjb.125.1462464602963;
        Thu, 05 May 2016 09:10:02 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com. [2a00:1450:400c:c09::229])
        by mx.google.com with ESMTPS id je6si12414811wjb.162.2016.05.05.09.10.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 09:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::229 as permitted sender) client-ip=2a00:1450:400c:c09::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::229 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x229.google.com with SMTP id g17so35760638wme.1;
        Thu, 05 May 2016 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=S+I1PYlyk1pTNDFuK5wwF8FNiXI8IjRkd2z3XSbtVq8=;
        b=JRKimURZR4SGq5FlvqAkCE/3Dhf6Gc6mH+MML8vqkWaopDB5zqpEqCK4aj7qFcN1oO
         sj6PbWzzjOMdWfQq6n7EhOGbAWB80eyK5ZEyTP2i9LW2FUSmASEAc2FAdgT5zXwH0beS
         oxV6sYlK5Pmd0NdDm9WmkXyu8NRm2NHzASH0kxS5tj9VE/00/IlsFGw/eVk6FQLTKXiC
         ng1WYLRsfuqO9vMWAT42uBB2WkY1WVaGXVcQq/pEj9/TkSncsx1qaI5Yr7zX2fAp+r4V
         gFXjaw2sp94NFf95JAFQt/eCGJxW8zdLHd7N0qKLGxKgbpJ7zNfBswA40eCZwcATnolV
         0BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S+I1PYlyk1pTNDFuK5wwF8FNiXI8IjRkd2z3XSbtVq8=;
        b=CtwfQNYlzur7YGOcwoDCWbtezl2++0a4Xw2hCl1KJoBoMTYRIQES7s0tJJvtKnDJ0z
         v2TsE1AwCJYWqzlZhqqDu7Jom0Vrpv7zpczfHTGubgAcWjxV0axOFvxELw54e1NLzQ1n
         7hCLrwgmXq6J5rK3LaIpPKaQsM5ni5LGZVYiwU2JcAns8O+YYjfqES0Ywg778moXc6n3
         O5M8HnQlYrIXf8ycc9Gu1kWKB2FgCC3nwH3ZioD9Im3tNRkIzTebD91oLggXPu+QNDcw
         a4F8G/vuS8eowyCjVdorCBPg5/fNIjtYBbPfGHgkEgvdgx3WqhLrckLWQsTgw/dcczdM
         scjw==
X-Gm-Message-State: AOPr4FX5ftEWsdVs4ooLmCxlZj/aLnfp00cmdtcMiO1RlIV8G8gRqjQclZS6pWO17yiaag==
X-Received: by 10.28.1.143 with SMTP id 137mr4100709wmb.17.1462464602666;
        Thu, 05 May 2016 09:10:02 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id cf6sm10426161wjc.12.2016.05.05.09.10.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 09:10:01 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v4 0/1] arm: Steps towards EL2 support round 6
Date: Thu,  5 May 2016 18:10:00 +0200
Message-Id: <1462464601-10888-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
X-TUID: uCg02ygc9lYe

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

ChangeLog v3 -> v4
* Assert that we only set the syndrome template once per insn
* Mask out upper six bits from syndrome template
* Remove the _with_isv versions of do_gpr_ld/st
* Mention that we only handle AArch64 in the commit message

ChangeLog:
v2 -> v3:
* Commented on inst start extra words
* Add macro for word2 shift
* Move ISS field collection closer to tcg_gen_qemu_ld/st
* Changed logic to compute regsize for disas_ld_lit
* Introduce syn_data_abort_with_iss/no_iss
* Rename some isv naming to iss
* Drop the patch: "Use isyn.swstep.ex to hold the is_ldex state"

v1 -> v2:
* Reworked the syndrome generation code to reuse syn_data_abort for
  the encoding.
* Reworded a bunch of comments.
* Fixed thumb vs 16bit IL field issue.


Edgar E. Iglesias (1):
  target-arm: A64: Create Instruction Syndromes for Data Aborts

 target-arm/cpu.h           |  14 ++++-
 target-arm/op_helper.c     |  49 ++++++++++++++--
 target-arm/translate-a64.c | 140 ++++++++++++++++++++++++++++++++++++++-------
 target-arm/translate.c     |   5 +-
 target-arm/translate.h     |   2 +
 5 files changed, 180 insertions(+), 30 deletions(-)

-- 
2.5.0
