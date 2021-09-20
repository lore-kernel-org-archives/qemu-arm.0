Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1693129lfp;
        Sun, 19 Sep 2021 19:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz869h9B985ikdYtia+PQDGGva3Aqm1azGHn+A5u5GNJPRDqpAiOYBaEgmZxdStntCo0j7n
X-Received: by 2002:ad4:54ea:: with SMTP id k10mr23029703qvx.25.1632105946278;
        Sun, 19 Sep 2021 19:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632105946; cv=none;
        d=google.com; s=arc-20160816;
        b=r1BfLdIG2t+B0ZawkHT+usIAtoYIXekOE0onYCMyV5ZLOFKYpMHripiW0WKvJHnvkz
         6826fQZOHR2ojgkZaOLU6Q9R4oCXItAoWVr+1j4yUc0NZi34fiByBYJgWGe6R2aC/RIL
         X3o5c3yv7uIWl1iiIkrTs3N+ZFVgdYBjTtft6J6vHU44zHG9JKk4F1SlaL33fJtVMuAO
         1If6tAMjfxa1P4H5H7BCigJWPG6H5cfR+SZNHWO3eo0Hog+sEI3ns9YG8xTeHwI4wHGW
         lv3zW2BXC0TI6H4Czf3sn8VMt/0nNC2/8uO6z06u7+5onbSYVf/z5wRhIXP5vjwPbmSC
         eIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Zp6udU6vABHfcwT1lj6jsBUaWhiJFkUto34nvU8EJkI=;
        b=u8bqdsvs4SX4+6io78tOJUeNefnXzTG83D3WQO+/2SO5Q7erYGb1bJORhR2V+n3YsM
         CSTpus/0cKCkV7JB06MSo8J6SfBZdWMCYPQWtNDbflCB5MQk4w6HzwR0oM16TlN/QvGW
         it7B9y5FG5km3xqPg2GUJ/gAMntDOzndTrj33e6kOMMwJ/4agV3/3ZNE+Lmi+eDqzZEc
         IrRPCM5k3JHqOlkZbdczZTb3ev2fmc0Po4ZKtrfoCR9VLNVdEfn3iZGT8ExzrJ6MMvwX
         u9PkNvDQsYYU3jm44+PpiZ+oOvrIS9ctKHzYbyNeN6leECZfTTEQolz9ps7+YTTqXYGt
         wqVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0SpX4GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si4871392qkp.291.2021.09.19.19.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 19:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0SpX4GR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS9JR-0005DI-L6
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 22:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Ir-0005BO-UN
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iq-0008CT-5p
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s11so15860971pgr.11
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp6udU6vABHfcwT1lj6jsBUaWhiJFkUto34nvU8EJkI=;
 b=s0SpX4GRTo/TlrZ+CXhb3V608xcbIPDzEApbITrgbFP3mE0i2/iEiIBrsfKloIVP/Q
 S7fNEmAjqH64nJXfWqPf5X+Ivc9CGFHdH5iCn+w4sBBdaPvJRcI9q6jEiTo9YdS3FqCd
 q3ArKGetbm1JDjuaPY8/Refwh3WMKFMn9RI1Bv4qW0pxH8w11V01uSfLfEAhnprjb5Oz
 O6fZlJv/H8tCHn+BMicLAY+5mh9vvdnGU1I6Xj+ycfEJgr7ZWJztUN6KcHHbXgjWxlZI
 XYG9+BJN5+YwfWzCTKmZNWHpwAG/XIFFG5J9Nupm+p7/elkeCxhxgxsUZDeAa18cqYLu
 m/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp6udU6vABHfcwT1lj6jsBUaWhiJFkUto34nvU8EJkI=;
 b=z+ZBLDpobS7d9S2rs7oDNQDMUR6IEGw3k9HBrq9gsnefxLLBwxWhq3Z8p2bA/+5cCY
 /2Zt2AmBSsH/FSC+G1ezCyrdnDxdd+ssdclHTOljm3ZM0wK4raOqmgq6MMp2vFUa5TaW
 HNOXM9Xow8G4T7s5VF4p6v5kNHTYNA+tSfOnFgDZX68kyyOzVTIbbfdC0QEK5FUCvdKj
 RqXOsu3QL5z4nyA6xppfCCAq538cIf75oqheqLRNOM1+VYKSZJKHmiPUaYidFVxYhnsU
 Z6Db4852cTfkjjpMdxYjunAsljrlur3qQq5Bx3OUL/nI4PQTunMWErGOW6hmvyG9dbip
 zx4g==
X-Gm-Message-State: AOAM532n7rOQdiAqJcoMH3PgNSDzh4YLxN41TcbK6Q87i7Hm7vdI+SKX
 TAwvbZQJuCi5dEVqZHxXXyIiKtZ+gXtK0A==
X-Received: by 2002:a63:b448:: with SMTP id n8mr21467978pgu.31.1632105906228; 
 Sun, 19 Sep 2021 19:45:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] target/arm: Fix insn exception priorities
Date: Sun, 19 Sep 2021 19:44:58 -0700
Message-Id: <20210920024504.625965-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rxqIt0l6Xun7

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.

Based-on: 20210919015718.466207-1-richard.henderson@linaro.org
("linux-user: Clean up siginfo_t handling")

Changes for v3:
  * Rebase on siginfo_t patch set -- while probably only
    force_sig_fault is required, I suspect minor conflicts
    with the other cleanups.
  * Typo fix.

Changes for v2:
  * Handle the exceptions in cpu_loop.
  * Fix how the instruction is raised for aa32 el1.
  * Add pc alignment test cases.


r~


Richard Henderson (6):
  linux-user/aarch64: Handle EC_PCALIGNMENT
  linux-user/arm: Report SIGBUS and SIGSEGV correctly
  target/arm: Take an exception if PC is misaligned
  target/arm: Assert thumb pc is aligned
  target/arm: Suppress bp for exceptions with more priority
  tests/tcg: Add arm and aarch64 pc alignment tests

 target/arm/helper.h               |  1 +
 target/arm/syndrome.h             |  5 ++++
 linux-user/aarch64/cpu_loop.c     | 44 +++++++++++++++++------------
 linux-user/arm/cpu_loop.c         | 39 ++++++++++++++++++++++----
 target/arm/debug_helper.c         | 23 ++++++++++++++++
 target/arm/gdbstub.c              |  9 ++++--
 target/arm/machine.c              |  9 ++++++
 target/arm/tlb_helper.c           | 24 ++++++++++++++++
 target/arm/translate-a64.c        | 23 ++++++++++++++--
 target/arm/translate.c            | 42 +++++++++++++++++++++++-----
 tests/tcg/aarch64/pcalign-a64.c   | 37 +++++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +--
 tests/tcg/arm/Makefile.target     |  4 +++
 14 files changed, 274 insertions(+), 36 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

-- 
2.25.1

