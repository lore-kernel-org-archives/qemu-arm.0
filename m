Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1285581ejv;
        Fri, 22 Mar 2024 09:14:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHsTr5bFN3639dkJ9orUEauV8yGSQozmEnRLHVpGS8ZAwoM+Ab8gzfQuO4UErN7k11eC98NGyZnuVirx+AmXo6UtTAGvPS
X-Received: by 2002:a05:6000:147:b0:341:bdd4:aedf with SMTP id r7-20020a056000014700b00341bdd4aedfmr287539wrx.25.1711124083303;
        Fri, 22 Mar 2024 09:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711124083; cv=none;
        d=google.com; s=arc-20160816;
        b=z37iSzfpsJZ3XTHMv0B4j6v37g7hqlQQp0hWP4+OvGpHv7h6wjZnvWUxkjIGIV3+oM
         J7GI4xDdmHPpgnEe55Ogyr/6o5RKZc/qE9JrBAF1QBk2SCVGMjGGfpNmqiTwiG9S6pBe
         Db+PcBWk+DosaYUQpVjO+qgvQh0UkPUBQh/wrWCo1pq3FKK+tXdZiiGUx8nl0DWT/w3g
         Zk/S40wA5hKCHs1u533SMslUjo047JyXQ6Vpypc4YXScGOeDxvd3kPwLWkoD0MfmKx49
         J1jfy1pOoWbDQVe3HTJ5fNXy8gGn9KxTg9PN9Zx1M/VKKzwU6wAFZuzhSqReDbJYC96Z
         I8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=5bUm49VP7Mf87j+48prRGAAOIN94P6PXBy1Yvr/+KsI=;
        fh=79Engmhb3UK/KEFwdw4xzGAo7WtH6flXKpLQDBizKqo=;
        b=InwWmWDb47agChfyRxPDiKALc57ME0ujR25m2XhtkLzElJJNIwd2/71HVFAMFKezjS
         pDWjBAPefFSiLAz78+F46Bp9YbW2/ejI4C4CVDrKQYOXCO0O35eEz36uwtIk9+OlwzMW
         yGm34V9NLK2qKuVfn0W5R/w4hXFbbdrLr07ioVNQj1JIuLZwvhBXUvJLzZGS3wJ/irBf
         PPo7bKwrEZs/2BvS9wpGjthIRa7FAF9mPsZqir6kJpounkLdAwKx7UynCLs3sqF/rPIt
         WOrGNZNsrAVWxHdxvjVD9xKViIrNI/wKpIOJoeN2JRD5WlbxymCzHbpuYHAwcs4jhvx2
         qVOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNhVj3FU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o23-20020adf8b97000000b0034049a28cb5sor596794wra.4.2024.03.22.09.14.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Mar 2024 09:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eNhVj3FU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711124083; x=1711728883; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bUm49VP7Mf87j+48prRGAAOIN94P6PXBy1Yvr/+KsI=;
        b=eNhVj3FU8WHFXhAmsPxO0sXI70EJczs1/x20xF1ncvo60QCiahl6f6Bg961t9FPiQr
         OiwuH3uS1ZeeIfdF7yt+E3YHj1b9/apejnboxCbGdfe8SFfmQBijOeDDd7+P9mOPoa62
         GSCjJSgvtqb6iOrC3BPq6Z/7Akfhn+zdRal/7i3b85i+xMS6Tiboa8ud9BIAZueU41de
         BeuZfxBUZUWBY3qWvrA8yRXieqBA0drwBm+G2ZwF/cOdQAwswClNpfF+iPALV4HW5bRc
         T17RQ8aNG/MUsVU+WmMPwGR0OEXURnfa/72RC7ELG+tgzBP0yoUGp29Sv1LVzqzrETS6
         Womw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711124083; x=1711728883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bUm49VP7Mf87j+48prRGAAOIN94P6PXBy1Yvr/+KsI=;
        b=j/2XsH36bEy6XjG/3YgTXwXE7gE9MQyzuIiEumbwvqclHuaFtykZY59RQEarYtzVEz
         MzKcd7fGgvRSHNm/q3GfTLAs/3Dk7gQLgwUewSwfh3xspldxEemtiM4mK6Sjbwe8RI7E
         FOAHFHxDr6M0cinrVU14Lz0+fBMs2avpS4LY4HcJfoPv27CHPX/JOTf9ZKtg+ItabbmR
         WqROGf/PDeEqtpUMC1Ip0QoDSPMwwe3uRBemjM3u+nkkd0wfyNRaaGL+umSffcqu/DYC
         K2n1FlKGwmn/JlEx2AbLP/0kIY8cWoeQ/MAKCBCOx1ZJj7KE8oaQV4Gm+jU2JoqKV6JT
         e+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVD7q++fReKVItPZtLDX6y23ztygzJZHlAAgqsKwW6zFnpgjx1DrGP5t39LylOFVdIevvh0a2o9uVMvhDDd6qTlEz+8s8qS
X-Gm-Message-State: AOJu0YzS25D4X/IlRXsdsktbMqHPwQiMAUlLncI1bYWDk63T0TVzk/Uj
	RzDUVkJX6GpyooXUaJ9RdY2bzCH8VXLd1gGujuOfaRiTkNNXJlpBMlh/7G4WFR+u4A==
X-Google-Smtp-Source: AGHT+IEDVYp6n8N+kPfYR9rh0qkEGDmpS/Fpb1POBgZYiskRZi37vL1PkK9XsuJ+ID4QEuHo2Z50CQ==
X-Received: by 2002:a05:6000:1143:b0:33e:d7c1:a132 with SMTP id d3-20020a056000114300b0033ed7c1a132mr1565774wrx.29.1711124082879;
        Fri, 22 Mar 2024 09:14:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.178.251])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d62c3000000b0033ec94c6277sm2351162wrv.115.2024.03.22.09.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 Mar 2024 09:14:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 v2 0/3] exec: Rename NEED_CPU_H -> COMPILING_PER_TARGET
Date: Fri, 22 Mar 2024 17:14:36 +0100
Message-ID: <20240322161439.6448-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eYZFq8Jz4lv1

Since v1:
- prerequisites merged
- s/CONFIG_TARGET/COMPILING_PER_TARGET/ (Peter)

'NEED_CPU_H' guard target-specific code.
Clarify by renaming as COMPILING_PER_TARGET.

Philippe Mathieu-Daudé (3):
  gdbstub: Simplify #ifdef'ry in helpers.h
  hw/core: Remove check on NEED_CPU_H in tcg-cpu-ops.h
  exec: Rename NEED_CPU_H -> COMPILING_PER_TARGET

 meson.build                   | 4 ++--
 include/exec/cpu-defs.h       | 2 +-
 include/exec/helper-head.h    | 4 ++--
 include/exec/memop.h          | 4 ++--
 include/exec/memory.h         | 4 ++--
 include/exec/tswap.h          | 4 ++--
 include/gdbstub/helpers.h     | 9 ++++-----
 include/hw/core/cpu.h         | 4 ++--
 include/hw/core/tcg-cpu-ops.h | 3 ---
 include/qemu/osdep.h          | 2 +-
 include/sysemu/hvf.h          | 8 ++++----
 include/sysemu/kvm.h          | 6 +++---
 include/sysemu/nvmm.h         | 4 ++--
 include/sysemu/whpx.h         | 4 ++--
 include/sysemu/xen.h          | 4 ++--
 target/arm/kvm-consts.h       | 4 ++--
 scripts/analyze-inclusions    | 6 +++---
 17 files changed, 36 insertions(+), 40 deletions(-)

-- 
2.41.0
