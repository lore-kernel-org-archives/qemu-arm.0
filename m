Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp958765eju;
        Fri, 5 Apr 2024 05:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCgkrBj/gvbrTAXaB+8j2oA4hl9qN67ULKD/W6Omm7Hwb2nWkup+lXf2UqC1MZLtNP+knnnSp3k8kCcZc4DtSN69j7R0P9
X-Google-Smtp-Source: AGHT+IFb7RbZXe1BO8dpP3wL039g7aSQxW9UaGSlBCtsmn6CI1diG7R6Z5p2jJ/o8BwO9myE4SNs
X-Received: by 2002:a05:620a:3910:b0:78d:4746:dbdc with SMTP id qr16-20020a05620a391000b0078d4746dbdcmr4042859qkn.14.1712321676328;
        Fri, 05 Apr 2024 05:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712321676; cv=none;
        d=google.com; s=arc-20160816;
        b=ytGxfH0UQTSLwG2fGqmbnS4+LijqFzdKTeO+ykgRuJ9rfRmwoK6fwzun+Kf2heTzRl
         z9yqQ5PEDO9Rllir+vEFmHEXer6kqTG3Y3+4/P1fI+xDQPtq6fGbNGdbZRQRr7zde5v4
         vv7X8Mwl4TN/+gzjPcUc+uzyRwj+pgHp4OkLra5wNh+IH+iqGv53SDEGuDnF+3seqWEi
         KJGxS8a/NaamC2F2q0bmUFMaF0TI7zzTBOXCqXenqqUI61/m4GNfm1aMGxCHKvzMzY0I
         gqGlkZHjZP0OV9qajZor5RAYlaIanN5peU70Ljmss9Zf18bWQN1dMCc5fQUGPSIK9mVc
         H6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KW/JAdjkkx0AQWUZXkHf5lnnBtuRIMz2UCSnQC/OOKA=;
        fh=wu9k18cnl5rYt8f4LiDhF2TVvKKszzFD5NRRiO79Xfw=;
        b=TPgnUmbEKguRx6JPaauRGwkp/qzLWp/tsmy/jucu09V5RimKgcZy5pldWZhJNwyIFn
         Z8ECBlI9WRAPhD5HclQWMeklA01L3jQDyt9CpO67NqL9DH7q74Oul4fuucHyizItF0+4
         TbncxtAnTnF/dIAnxEcxnwlpKwRVVXeRgQninZRN8WCOPxF/jpl2wyxpWeV79wPe2Mul
         b/NWtyzVIcV309IKKc3pq3qcD7JMK9KpJ7uOppUrpOwU5oa79MRSManuMXeR3X09YKPM
         EVkQIgAJ3rusgwYVsf4vRIf1OQ+JOBBT3m3LZC+2ucZd1mXBX3wP55wnaGScXnMM6HHL
         +U1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASkQoK4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a0b4a00b0078d43cca0a3si1691944qkg.173.2024.04.05.05.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 05:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASkQoK4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsj53-0004Vx-QJ; Fri, 05 Apr 2024 08:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rsj51-0004Q9-MC; Fri, 05 Apr 2024 08:54:03 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rsj4z-0000rw-Eb; Fri, 05 Apr 2024 08:54:03 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2a2d0ca3c92so1323269a91.0; 
 Fri, 05 Apr 2024 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712321632; x=1712926432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KW/JAdjkkx0AQWUZXkHf5lnnBtuRIMz2UCSnQC/OOKA=;
 b=ASkQoK4OA/tJlI3DkGsXMAum/DvT+aLei0rwu3YpMsMmI/Zv52zy30MTqqdkiRbr28
 uaBxBsYcgPb51Sqi8i8bCTOByu1BFTItLFh9P6J6lM38yGhCVB2o+iOaYmQo9x8vnQ5z
 z/8uPYDFYiey/ml5PgF7yAazuyeK/WJOhR3bOHUDKM76L0syIDMe1tGjimNvGdKHUqr7
 L1hJhG2pDzr7LC9Qkb0pcJnhNPLdQDamxKop6mF7as5H+uZM9gTD86icXsZRV+brYIfb
 UFBi/V8M8Aj2JXQZjPWox6yANW21Ci+zOSnbdDTICFMNigR4dcGypRkR41BmUwZdVK6S
 5g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712321632; x=1712926432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KW/JAdjkkx0AQWUZXkHf5lnnBtuRIMz2UCSnQC/OOKA=;
 b=qWGvYOlaLlwxLp3Ay5ynf/anDLRRyBw/v+oaDhUYiavgiVR+DS4q2JNyNt0xmgFLa4
 M0m3jvuZibhoZOwOr7oq79BjXUt3h+V646JuQVXHnT+xCOCiIrnIGg+o34WC+w/V18Rk
 lA0wWA/eGkHw+Po75Wu+trM8EE3GA+t8c1giSilUzqphY00AnbTEg9oeTS+eEHDd7ZH6
 fLALx098wd5uiozYsNK6wkhTUbL7AgdPPKDTqL+14vyz4NVlOSBmKfdH/BsWl8wVtXZi
 ICD112oupFGalw7G8Szi03uXee8WR0hLtzb+aMVFbmyoVbBupqwdOhhJT4iB1gHY9hhH
 2+1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ofLuCRtOzYddaqpYl5fe67zpqguyVwLeOqH+jYdYS7uYXdAUDHMC1DyGh6eSMELXAaoi9Sq3ozpDIyqck31nSLFoxupf1JfEpD5oalcshVVx21+X5Sd+Wa+dqEdMSqrtu0D/GjUaeC8ZsAO7nuT2lzK0tCrgrvptuCJsE3WZrM3QQ2Y17VdK
X-Gm-Message-State: AOJu0Yxni+ukjsQmLF4/TAVKgKXffN/kwSEUlTZj67s5rA7Of1lOsuod
 +m/NxFMPgEfdmWVirywG4LWODZbQKHOjtzyHo9dSPJUSKYQRj6kP+xHSGTy8
X-Received: by 2002:a17:90b:110f:b0:2a2:2cbf:2144 with SMTP id
 gi15-20020a17090b110f00b002a22cbf2144mr2255243pjb.19.1712321632507; 
 Fri, 05 Apr 2024 05:53:52 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au.
 [124.169.104.130]) by smtp.gmail.com with ESMTPSA id
 t19-20020a17090ae51300b002a2d8d34009sm2984414pjy.27.2024.04.05.05.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:53:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH-for-9.1 v2 0/3] target/ppc: fix tlb flushing race (plus
Date: Fri,  5 Apr 2024 22:53:35 +1000
Message-ID: <20240405125340.380828-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: W4xljjVq4fli

ppc's broadcast tlb flushe must ensure all vCPUs have invalidated
their TLBs when the tlbie sequence completes. This is not true in
the current TCG implementation, due to async_run_on_cpu() returning
before the remote CPU runs the job.

Fixing ppc requires moving to async_safe_run_on_cpu(), however this
API does not guarantee that either, and actually changing to the
tlb_flush_*_all_cpus_synced() variants introduces another race
which is that the flush is not even guaraneed to complete on the
local CPU. To ensure that it is, the tlbie has to be made the last
instruction in the TB.

Fixing ppc removes the last caller of the non-synced TLB flush
variants, we can remove some dead code too.

For others - at least arm, riscv, and s390x all use the
tlb_flush_*_all_cpus_synced() calls AFAIKS without ending the TB. But
it's possible I've missed where they do, or they have other issues that
mean it's not required for the flush to take effect until some later
operation which does end the TB. Maybe there is no problem, but it might
be worth looking at.

To reproduce, I have a kvm-unit-tests case for ppc but should be quite
easy to port to other archs. You just need to be careful for the local
CPU test case that your tlbi instruction is in the same TB as the
subsequent load/store that is to incorrectly use a stale translation.

https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc

The test 'powerpc/mmu.elf tlbie:tlbi-other-cpu' breaks with upstream
QEMU. If we use tlb_flush_*_all_cpus_synced() like other arch, then
'powerpc/mmu.elf tlbie:tlbi-this-cpu' also breaks.

Since v1 I understood the full problem and fix, and fixed the fix.

Thanks,
Nick

Nicholas Piggin (3):
  target/ppc: Fix broadcast tlbie synchronisation
  tcg/cputlb: Remove non-synced variants of global TLB flushes
  tcg/cputlb: remove other-cpu capability from TLB flushing

 docs/devel/multi-thread-tcg.rst              |  13 +-
 include/exec/exec-all.h                      |  97 ++-----------
 accel/tcg/cputlb.c                           | 145 ++-----------------
 target/ppc/helper_regs.c                     |   2 +-
 target/ppc/mmu_helper.c                      |   2 +-
 target/ppc/translate.c                       |   7 +
 target/ppc/translate/storage-ctrl-impl.c.inc |   7 +
 7 files changed, 44 insertions(+), 229 deletions(-)

-- 
2.43.0

