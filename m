Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952515ejd;
        Thu, 18 Apr 2024 12:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzLLXpwu52KGdgONd+UauUMAppL4U7Wv3Stnm7CTmk6fhCmcgsJFIiJt6R9IbJvSl0pZ76WNbvgxHFUZVx4vQZtzFmwYdE
X-Received: by 2002:a05:6512:3131:b0:516:a13e:d775 with SMTP id p17-20020a056512313100b00516a13ed775mr4103lfd.2.1713468390542;
        Thu, 18 Apr 2024 12:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468390; cv=none;
        d=google.com; s=arc-20160816;
        b=z2uxMTxaMl5P+Zmp5LYYoDqQ0F+aCG4/m/qLNVFDRS5dmj+6kH5J+gYfAMHJDqUHaZ
         dJIU81gbvdyhawP/1lg8sDY13UKHAOG0d3ajFdqojt/6FFFwa4YtOMEQ1ZnW6yCa/6bf
         QZm+gk6wwq9fdWyZZlSKey3hqkK+8RqvQZ02TEtpgckqhcAV5yWMCriyGQ1mpA2/9TQp
         AvyRCfsX33VbKMz9jrH5164A+urnKjFGE3EhZFD4ExImOYJZf3ACb4QlaPbbGf24K4GB
         cpeAbpbKImBHFkvg5qTXuLDVwKzv5vkQiERwNd910uueMxV9FhdiUd7wbXd4xevCwaRm
         NwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3p8Qs3F8jC3emGpbq1YTEbHVimCbjmiYVCccpiO4GlE=;
        fh=qKdD0wcBgmBJSBvvywtRtwX6XRMCtrAxheVqmbwtVfc=;
        b=ZRHpoGFs1oXil7WLzMIJ1pLNGpcT5I0MGFWZMbdXVMG0oPEzvZmNuzqwbTw4gNJ/cs
         c4MM/D9LfdgFwQ8BcXPs/PWqsJmNca8jxdSZ9pWbJr7aBE+iJSGo8qdNU+HQ5RXCoqWM
         1pmPMJPEpXPGF3wT7/y4aY0Izxg9sUC7uqzms71OY31BCdCvLlXvsY6qp0M/HcGOSc7r
         20QEbN2S3FniNXdtdvi/bttSdYSZQ7uHKOZ4vW507jLo1YobM/LFr9bLcIKU7dgYlWBH
         aPk3f02EItKKNk2IPDw2E9wJswKKM5SMgdBlypbOwh3golZvjcIDBXvfEG+w4uXcAqeL
         JEFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMG3vZYK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9-20020a199149000000b00516c8cb664dsor707377lfj.20.2024.04.18.12.26.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BMG3vZYK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468390; x=1714073190; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p8Qs3F8jC3emGpbq1YTEbHVimCbjmiYVCccpiO4GlE=;
        b=BMG3vZYKGs2jUQTSvi58AWV6hDgI2uQ8pV8rrR7slHpGPqF/juMQGJrOznMxqeURV9
         O1ysxvuIJs3WN5YF5zCwJZiXDH/OokqBDP8ozAKdvpQzeMAYctDjQd5Gm6ca63kC/GX+
         1FDyfC4XHUVgmV+6E6a2NBPLKVYiNeov4a1ey1YsH53vTqxMopttdlP/K9KNpYPMhE3f
         XZ71qq2P8PnuSL3sG/4Vp3ZQwv+UX5NYjiP1YofN3/zhcLlv2Y4sHEAj5z8WcwF1lhZz
         DYki2Sr6WfsBu/61MqQuphd48AcH13qL6yVrxKbVu4DKCsekKEZp2Wvz9Ltfla5xr9eS
         HyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468390; x=1714073190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p8Qs3F8jC3emGpbq1YTEbHVimCbjmiYVCccpiO4GlE=;
        b=na8aVMmZxLQJWbk0DFpQxDIsfs+kCn1W49wbe9KG5uX/X5q4bXQtf+THpa/UJfHY1p
         LYz9FxyMdljxLk9zQp7RWhpp8Er8bzkNZTPguGdBfWP/EkFY4K0euNtls7iNBTpTCm4T
         JVOXddg2iV2d0AMPH3uLrqNbtx9ZIs0eajcwqmyXJzoktdrupzPDzzhQnBFcGDsESHg/
         xpsn9vvxH+ZgP1UdKYhnm1LuE5olBDUrS2ghUNW4wrQw+AYEHJgsSngIETJgHkdzrC7y
         qVdx3lS5t/xReqiHwhcod21DUgZcONm7NdrpMXW/C7PMLSdOX/IDJtlz3Hwp5BPr50HS
         65og==
X-Forwarded-Encrypted: i=1; AJvYcCUUx9wHMYwBw7boDtKiY1uahDgWq8WSftJpM6YUHggzbw+BQCdWhUO6YNE7PJLEe17WS40481PPFuvtIJgX8JB7Ul5BPcCs
X-Gm-Message-State: AOJu0YyhkQVdeMgDmgW4GNo5IpccN84fJVAv8nrPHWRHjfDvBowkZIPk
	VLPp5RCUJOdbDUh1JlFarZwcCKwyC6nVuTM8TqXgof3zScCpAbvelBd1kOWhBp8R3A==
X-Google-Smtp-Source: AGHT+IGc0qRkEMLMTGegLV4EypFFITOzOda0O4GHRkc0UB5yO1McHeMMwCZLkgpZNT6hPX4mXdod/A==
X-Received: by 2002:a05:6512:34c3:b0:51a:affe:2526 with SMTP id w3-20020a05651234c300b0051aaffe2526mr460238lfr.62.1713468390092;
        Thu, 18 Apr 2024 12:26:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id es13-20020a056402380d00b0056c249798absm1211244edb.71.2024.04.18.12.26.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:26:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/24] exec: Reduce tlb_set_dirty() declaration scope
Date: Thu, 18 Apr 2024 21:25:09 +0200
Message-ID: <20240418192525.97451-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7ugRyYjEsXD2

tlb_set_dirty() is only used in accel/tcg/cputlb.c,
where it is defined. Declare it statically, removing
the stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/exec-all.h | 1 -
 accel/stubs/tcg-stub.c  | 4 ----
 accel/tcg/cputlb.c      | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e4cff08db4..778c82ba8e 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -641,7 +641,6 @@ static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_set_dirty(CPUState *cpu, vaddr addr);
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 
 #endif
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 8a496a2a6f..dd890d6cf6 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -18,10 +18,6 @@ void tb_flush(CPUState *cpu)
 {
 }
 
-void tlb_set_dirty(CPUState *cpu, vaddr vaddr)
-{
-}
-
 int probe_access_flags(CPUArchState *env, vaddr addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 93b1ca810b..e16d02a62c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1039,7 +1039,7 @@ static inline void tlb_set_dirty1_locked(CPUTLBEntry *tlb_entry,
 
 /* update the TLB corresponding to virtual page vaddr
    so that it is no longer dirty */
-void tlb_set_dirty(CPUState *cpu, vaddr addr)
+static void tlb_set_dirty(CPUState *cpu, vaddr addr)
 {
     int mmu_idx;
 
-- 
2.41.0
