Received: by 10.25.208.137 with SMTP id h131csp819504lfg;
        Fri, 29 Apr 2016 05:08:05 -0700 (PDT)
X-Received: by 10.28.227.138 with SMTP id a132mr3509397wmh.35.1461931685761;
        Fri, 29 Apr 2016 05:08:05 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id a2si3848337wmc.91.2016.04.29.05.08.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x22b.google.com with SMTP id a17so32897600wme.0;
        Fri, 29 Apr 2016 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=TU4PKHCoH6mVO/QvnQ+mIa6zpnEYFS1FWItUriJHYhI=;
        b=KB6pqtbCp1uQGbIsj7HurrAetibR7TopUQ2+EGOpHqzGT7Ygf+3AoWKbb8HuxKRGLq
         XzgOepGz4HxmSpvinMlF7UfJLE7hQZOk6fG/OrTgjLhub/sLQBJvcp140oaslW61dzIi
         dXHACmIL3v2F9hrMshf0zYaA4UHUcVCLz2DwAHKxIz3Bxklcg+AfI7Lpdabn24n0eLbN
         1Vxw5Bbwiy5By+p+4OrKkS4Bs+8KkTUKR2IOHdHHgIlWsVPf8eBYGrWQAaSv2Yc8MKML
         4MrS9pYJkDmE2pLplx8JfQ+rydeVLEMqTLN1SIul5mudDHN6TCRmLHKgklkBveIPBV8E
         8p6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TU4PKHCoH6mVO/QvnQ+mIa6zpnEYFS1FWItUriJHYhI=;
        b=Dlrf42ZHjOzDoGcWh7uhDnpI1MfIaIal0RD+4beOAs07dDypqmmZBU7WEmFu1u3GQM
         mlub9pEmSCA2QwGGVy0svIssII4ZcC5UTGkp6sNkr5oqOPckfmweDOnZ7ZWX/M2pscHF
         eZLxzNRP4t5CG63jr7AP5MNU57/RbRllo9WQa8QwCUkXndUTBKQmJFeli8/5fsutEdXm
         axgQaDkGMLzwMaVCh1NjPbMv2AeEpAzaJZ+khpslpctP0O5glabJGok14Zth7IWBZmqs
         pcs0y+E2wB9ZP8oCWQ/bNNLVIy0FSpE2Qv85sB4rRs8oZ2B0WZOv6NN013Zs/d+2basQ
         uOqA==
X-Gm-Message-State: AOPr4FWR6zkAzWTaiA+tkc23hBmfPS3TfH9HZ5hOo/yeIY/lIJ7rtifgpF6uRZHJst2c6Q==
X-Received: by 10.194.32.165 with SMTP id k5mr8168749wji.23.1461931685407;
        Fri, 29 Apr 2016 05:08:05 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id ip10sm14523086wjb.33.2016.04.29.05.08.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:04 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 0/7] arm: Steps towards EL2 support round 6
Date: Fri, 29 Apr 2016 14:07:57 +0200
Message-Id: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
X-TUID: UWyw0HFyIMlF

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


Edgar E. Iglesias (7):
  tcg: Add tcg_set_insn_param
  gen-icount: Use tcg_set_insn_param
  target-arm: Add the IL flag to syn_data_abort
  target-arm: Split data abort syndrome generator
  target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
  target-arm/translate-a64.c: Unify some of the ldst_reg decoding
  target-arm: A64: Create Instruction Syndromes for Data Aborts

 include/exec/gen-icount.h  |  16 ++---
 target-arm/cpu.h           |  12 +++-
 target-arm/internals.h     |  24 ++++++-
 target-arm/op_helper.c     |  47 ++++++++++--
 target-arm/translate-a64.c | 175 +++++++++++++++++++++++++++++++++++----------
 target-arm/translate.c     |   5 +-
 target-arm/translate.h     |   2 +
 tcg/tcg.h                  |   6 ++
 8 files changed, 233 insertions(+), 54 deletions(-)

-- 
2.5.0
