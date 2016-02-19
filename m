Received: by 10.25.208.211 with SMTP id h202csp31063lfg;
        Fri, 19 Feb 2016 12:04:58 -0800 (PST)
X-Received: by 10.98.69.78 with SMTP id s75mr20951243pfa.102.1455912298062;
        Fri, 19 Feb 2016 12:04:58 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x22a.google.com (mail-pf0-x22a.google.com. [2607:f8b0:400e:c00::22a])
        by mx.google.com with ESMTPS id x12si18353533pfa.98.2016.02.19.12.04.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22a as permitted sender) client-ip=2607:f8b0:400e:c00::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22a as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x22a.google.com with SMTP id x65so56425615pfb.1;
        Fri, 19 Feb 2016 12:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=USmM0WRcUGgN+bACXKXSOFOm5RHlnj6c2NKXE5nc/78=;
        b=NDFugZTKV6rcmnb6plM28GTABz+LAjvpj6dJBmuci8cEF31xZ/A9MU2nNb1cZ3uY9z
         yt1FBrI273nCIZxULn58bXQB+xgfz1NP9cXA5es5tWxt6Qde6cTH1htTsHjM6ko5lZTE
         Gbk5UiNhnjqYR4YEuT+dF4OaRf/5eeKmLOwsL8x1ffRnNU9pmKaascMAfP7/0/nnBXZR
         3TruUXXRdo9LV5XyejSD5BSX0LKEECY2QRIBB7jxpRxkWvXKkNVfXqR51SnXg5LwcFh/
         jNlrjt9oWSpyDhvrnEjy4LNbDrmMHGHCI+0Wb4sleBx4T3zQxLos60yJT+AgIhzEiCLD
         9zuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=USmM0WRcUGgN+bACXKXSOFOm5RHlnj6c2NKXE5nc/78=;
        b=GFWA2sp37f/rd0HVxpkSdgSxueGqw/6t5nz3tYcjdw/URik3qXkJVS7KzADu1nALFh
         RMohiO19XKyBsSiM5lyNgnyg5chVN01G0yCg0hrKNWn7cFa4q7MqybL6zNiNBn2QicjC
         hOyTqplzOnNQGQu0PFyZeY/l4ygQRrSEfR1Lyx1j/HI4Not+IZLHnQW30zrx7xRT1VP4
         bgkbV+U8bVVdRsGGUEvtksnyD5UmjtG9r7qjOs20tgfCzH8GNuDdEkGip6KgQg7l1QjD
         SvnGCy/uGIsD8RD4E48CNbIhEcKKOWHNS830DDUdX/Lut9IV3+K7dCjZjBNH/Muc8DCj
         0PBg==
X-Gm-Message-State: AG10YOQbEnd3+J9AEmGoZKGzUUUu5oWLkguAaSf7QnNawmpoGZ/DFGoN2loKSInD2cGaUQ==
X-Received: by 10.98.17.92 with SMTP id z89mr20748755pfi.16.1455912297554;
        Fri, 19 Feb 2016 12:04:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id s23sm19659111pfi.12.2016.02.19.12.04.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:04:56 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 0/8] arm: Steps towards EL2 support round 6
Date: Fri, 19 Feb 2016 21:04:44 +0100
Message-Id: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: 6qFHUmATil/v

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

v1 -> v2:
* Reworked the syndrome generation code to reuse syn_data_abort for
  the encoding.
* Reworded a bunch of comments.
* Fixed thumb vs 16bit IL field issue.

Edgar E. Iglesias (8):
  tcg: Add tcg_set_insn_param
  gen-icount: Use tcg_set_insn_param
  target-arm: Add the IL flag to syn_data_abort
  target-arm: Add more fields to the data abort syndrome generator
  target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
  target-arm/translate-a64.c: Unify some of the ldst_reg decoding
  target-arm: A64: Create Instruction Syndromes for Data Aborts
  target-arm: Use isyn.swstep.ex to hold the is_ldex state

 include/exec/gen-icount.h  |  16 +++---
 target-arm/cpu.h           |   2 +-
 target-arm/internals.h     |  24 +++++++--
 target-arm/op_helper.c     |  41 +++++++++++++--
 target-arm/translate-a64.c | 123 ++++++++++++++++++++++++++++++++++++---------
 target-arm/translate.c     |  11 ++--
 target-arm/translate.h     |  27 ++++++++--
 tcg/tcg.h                  |   6 +++
 8 files changed, 201 insertions(+), 49 deletions(-)

-- 
1.9.1
