Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117918njb;
        Tue, 9 Jul 2024 20:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFZYRP+UUoKPD/ARuJe6Ak5WnzZQejbnCt3RfhAHsgYp6JDAd7SyF368U0iqPXXfZB88mXZgx/jX6eJvy6SQMwWqYIMY8U
X-Google-Smtp-Source: AGHT+IE6vkGGt16k7EmMGV9vugcNUBZJFDsnW6LsijP5WalKPpN8awOSmxonLkfaB+YJJDT23UcR
X-Received: by 2002:a05:622a:164e:b0:446:5bac:fc1 with SMTP id d75a77b69052e-447fa8b515fmr47879311cf.12.1720582214925;
        Tue, 09 Jul 2024 20:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582214; cv=none;
        d=google.com; s=arc-20160816;
        b=ElrQ0yTgs2Esur90S3VMkG8i28Jlkh4CSytJ3j5uRl15rTeXeouJlWEnY6F2lox9/j
         fSFspQHjxUtWl8IXm7Qh11ZDDi/Kj9B7gsJyB1QxQeE2GvZwLG4QfO8eRaaCga0nYBC3
         B+9eXKMpWxeZFF1Lhhtz2htLWSIotMJ6BwzvfwTu24XIDkqoLeFq1Odc20QGBdy5h0XB
         Y2i4lRu+VzcqrBBhg4dwnOaDrtNi4LAuE0c13nm6qlLa9YbYdR8MC/zmcTeRHC2FPVcy
         CtDytYWYIPoFN9iUSReg/28xSfrVaeHZLoPRd+ay4HHpyIV3OIhuwtymzJ479HBt6cfD
         3MUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Jw2xHSdX8g/vw1Uzi7zPGtzp+K/GoiaBqk6O2xkkOJQ=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=XF896v8k7ahOHx3Y6CvAzk6CppymJ3P38w9gRfFe9v9X9mHGm6eNQzFAUrSCw8Fky9
         lohhD/pAlvwhcOIujEhu6/c98Efql/vLbSC5EVWQiEUiS/PbVgvlgo2HLlQOJ0FHdZsW
         uf/zGjiRMngBAGy7JLjlmPSbpUyHxW2eidxRJdWBoGxQbcdAVCxtLpMQu4lf5DIvuqBn
         ZbuKO+NFgGDh1t66JBhjIvOaalx76I7UhCIh4cMOmI2ysdAOslghDepE95NptrU5ICNs
         PbXdM1xDuyjmz9G8eau+rhG9fbIDEWJ0gRbXoi/EuMOAQczeiiTtWhE5pjvJINB49j1H
         xjQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcwVgpfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c0b432si34866391cf.711.2024.07.09.20.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcwVgpfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRO0N-0008Rq-7p; Tue, 09 Jul 2024 23:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0G-0008BR-Ra
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:24 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0B-0003gV-RN
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:22 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-70445bb3811so529901a34.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 20:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582096; x=1721186896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jw2xHSdX8g/vw1Uzi7zPGtzp+K/GoiaBqk6O2xkkOJQ=;
 b=EcwVgpfnF5JGd0ngl9mrK3Qgk3lXpx9tIy4MaK+5xxb3o5M1vaWDsfG1EU8GZvTp+P
 FJlgGhTpEJb+uJz2ExMA/7bguLA/vUWUc2SLr3SM0yUDuxNZajsOiSbYO8uxnZnjLA06
 iIBMzQztMfohIjUiEVIYgvZfbv+vQSZ93nlnwIoAz8UubctLZOsqRh24uD8F02a/NVQT
 jakL/2mabOlB5aMmI4W8cvue158iy8d4OGJAqdXiJisIhhvI5EOhIFk8fYaKhDd4D6d9
 BqGMPtK/pUmvTrHhY6efnYwn+RON8zwsohCRX27eHHbjMA9GEKHSugTa+RweqOLGUEnz
 Tuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582096; x=1721186896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jw2xHSdX8g/vw1Uzi7zPGtzp+K/GoiaBqk6O2xkkOJQ=;
 b=T1RGUCOxIICr3O9UV5BOGuSLENL7sJs40IW/vUdOC/wlcdUi3d4QUES8nnR/BsE2tb
 LcMwV0jY4Gpha1o0WiENrmr3Km2aYxE+/5hX2+0knQ57q1HKTEFXgYeH7IqpwZCtkNFe
 LWD1LAvvegE2Y7+18d6+GsNt86tNqWyNDvIYXHerpg4ZM9u7D6a3GFv3C4lwEE3o0FIf
 2Hi8FQd1TGOWemvNm/CVVIV2/VoasHISbeAX3Lhy85JeQOlFGkyHXD83V7Gh8LXFDrH1
 76TALwXHibmAnIHMKyPTim+wOrGi/b1PeyXp1R6II5bgERRTse8BviNQmIe2TSC56fU6
 JNOw==
X-Gm-Message-State: AOJu0Yz4sPJVJU4K0hFHKT1jAahue+RNsYZc6AFqvkl91qrPSMes11X5
 0TlPsW6uzw1O9wYgeZYSd+HAR6nzjZoB2HZcg2ZzCdymDajjsDbs6c3feIjKnOs=
X-Received: by 2002:a05:6830:1b73:b0:703:5ba3:5806 with SMTP id
 46e09a7af769-70375a131d8mr4441182a34.22.1720582096380; 
 Tue, 09 Jul 2024 20:28:16 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 00/13] Fixes for user-only munmap races
Date: Tue,  9 Jul 2024 20:28:01 -0700
Message-ID: <20240710032814.104643-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Jxnx69JNKAl

Supercedes: 20240702234155.2106399-1-richard.henderson@linaro.org
("[PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS")
Supercedes: 20240702234659.2106870-1-richard.henderson@linaro.org
("[PATCH 0/4] target/ppc: Cleanups for dcbz")

After looking at the first dc zva patch set again, I can see no
difference between the memset used by dc dva and the plain memory
accesses used by SVE and SME.  In all cases it's a host memory
access that might fault even after probe_access, due to a race.

So I've dropped memset_ra and memmove_ra, and instead expose the
basic set/clear_helper_retaddr interface.  This allows one set/clear
to cover entire loops, instead of trebling the overhead of each
individual access.

I've included the ppc dcbz cleanups, so that the final improvement
applies cleanly.

I've updated s390x, though it isn't as clean as I would like.

I've tidied the riscv use of tlb_vaddr_to_host, which Peter noticed.
The usage was incorrect in general.  There is no race condition
here because it still uses cpu_ld*_data_ra in the end and not a
bare host memory access.  But the ongoing work to improve riscv
vector memory instructions should take note.


r~


BALATON Zoltan (1):
  target/ppc/mem_helper.c: Remove a conditional from dcbz_common()

Richard Henderson (12):
  accel/tcg: Move {set,clear}_helper_retaddr to cpu_ldst.h
  target/arm: Use cpu_env in cpu_untagged_addr
  target/arm: Use set/clear_helper_retaddr in helper-a64.c
  target/arm: Use set/clear_helper_retaddr in SVE and SME helpers
  target/ppc: Hoist dcbz_size out of dcbz_common
  target/ppc: Split out helper_dbczl for 970
  target/ppc: Merge helper_{dcbz,dcbzep}
  target/ppc: Improve helper_dcbz for user-only
  target/s390x: Use user_or_likely in do_access_memset
  target/s390x: Use user_or_likely in access_memmove
  target/s390x: Use set/clear_helper_retaddr in mem_helper.c
  target/riscv: Simplify probing in vext_ldff

 accel/tcg/user-retaddr.h      |  28 ---------
 include/exec/cpu_ldst.h       |  34 +++++++++++
 target/arm/cpu.h              |   4 +-
 target/ppc/helper.h           |   6 +-
 accel/tcg/cpu-exec.c          |   3 -
 accel/tcg/user-exec.c         |   1 -
 target/arm/tcg/helper-a64.c   |  14 ++++-
 target/arm/tcg/sme_helper.c   |  16 ++++++
 target/arm/tcg/sve_helper.c   |  26 +++++++++
 target/ppc/mem_helper.c       |  51 +++++++++--------
 target/ppc/translate.c        |  24 ++++----
 target/riscv/vector_helper.c  |  34 +++++------
 target/s390x/tcg/mem_helper.c | 103 +++++++++++++++++++++-------------
 13 files changed, 219 insertions(+), 125 deletions(-)
 delete mode 100644 accel/tcg/user-retaddr.h

-- 
2.43.0

