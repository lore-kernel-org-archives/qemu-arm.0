Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1951889njb;
        Mon, 10 Feb 2025 05:58:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7a8mA5wwZQqkhwDtgl5+7dvvFtDandGhDXxOGlcdeoG7TsybIOz4n1Z75a9YzYoFjZFHv9NH19XHzbw==@linaro.org
X-Received: by 2002:a05:600c:a45:b0:438:da66:fdf9 with SMTP id 5b1f17b1804b1-4392499203bmr115283995e9.18.1739195887265;
        Mon, 10 Feb 2025 05:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739195887; cv=none;
        d=google.com; s=arc-20240605;
        b=huoca0ExoTNOAu/skg8lFX4q+5TEeBoMdKp0AZzg5gSRV2xcGgNwWZ6mrph7pOG6Ts
         fNRTs5rWHYTJVDUJKzJDggdNPkaA8vQ3+uxVA5kaGtcOvbuxfoNdx/PtRv38xTLV0YEe
         cyMhS5IeGK9NeFNlWwpcUXDEjlWQ2i9dvMOOVYWFNKTG3ZFa/zyqNfjlzRxuuLkm/vih
         jX1Vpkoqu/LA0KisNPKEPxJDeILK84UuypYU+0Ngmp8ye3G2EaDzqKBwO+7zMlgzO0xb
         oZ+8UzjzY7o0JEipQCf/TuflsGlfBtKNyo6P0p5VbOU0YINbUZZMv2qVrhCPHBTcx24d
         soUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pftZOTu4W41f/6GB8KhGZh3z4DebWeK+fUoY69RtqXY=;
        fh=lABwyW1ExP1bu9lt/J+ltqQ9JjYO15piJ3mY6hhAGws=;
        b=lwVXHCyTNT8OYMHDuQNu8kfSOzKPEBIKzvsx0sz5QaYw6RFrhGa5mR1Qju6wETyRn/
         Ob9uP5wxO70qlSx27zjH1ogxospDMcVKM7+EhMTOLAeHafTftzeD2nEVVhwIDGPdDd2T
         t5ecznqjxDZlEK7CwkRLtE1kIrVlk1BUX4gON7SrmPRrGZEnmcfld+BgkSV3qFg4Sk28
         WnwOqTb2KfuF407TZieoYV7H6zrK7tzkxKeQ4KIvrmeJfT3VaU8upuNaaSKOJl56Q/Qv
         pGUht7er76RxDTZsc3+OsMD/svMuTa1F2wrQh26j2wdkmgOvhQaQcsffammF3T0vBBM0
         9luw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HO60VYAD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dd3c43facsor1649666f8f.1.2025.02.10.05.58.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 05:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HO60VYAD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739195887; x=1739800687; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pftZOTu4W41f/6GB8KhGZh3z4DebWeK+fUoY69RtqXY=;
        b=HO60VYADeZVxDSMfTvmAawQMYwhR/rlb6KE4kreR3t9n6rMpm/u17AsAQVUqTthO0O
         hBIwSu9fBdpOgCzQRJ8IDsFF3wZgQIplQZI0o/GdSC8U5fRu3yPXeBltkQ1f9dRDtYno
         Y92Z8dblG8qaMpvImMSxE7Q3sloqHpzeozNm0VioO6XA/jGk9mIYYDJEm7qnhgf3Dvv2
         +BhzO+QsxcToq10PNxHOYpEfSMwPYxVUkKrHHzuIBKSQlRUlGzheav3iwntmP+OWEuLX
         4zoxPEzBB6/c+X7JnKztzy69bXglLwJfYtsT3ZYPvwuqwfpHI1upqSUDAthVqzUXNkMz
         pOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195887; x=1739800687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pftZOTu4W41f/6GB8KhGZh3z4DebWeK+fUoY69RtqXY=;
        b=Xi1O0nMrleaW7sACihudGP9L0wIVqWFE1FImcxpYdGDPg4e3JQxTSzCEK+GYwcTzQb
         VIIR/B4IePPm7Go7oy+XOPUVxQHKF3WDzFRaJti5K970nhMtARjbaD49c9nlIA33tDF1
         SoUZK/hinX7qQ9eNVMcMa8caG+cMz2H3WeDWPFylImpyGQ9SBBWEapzsj0MYruJ2Xauh
         d+BXwyQdmkvSL8e9ovxsjEiuN5AP4L6ICdmZy+5FwEf3rF64adbPxLSaL1O4ZtOWdkRV
         tb0GuKDsbU7x228uQRJY4VxVSf9/FYV6aNvyqcMosf44FpJ+t9OpyHMDswj9U8uwsQOp
         oFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp3Q/lAGAXiyuVXgC+riNrj/KDEIEzK/JarUGYtppY0lHK1d5hcXabenHdCDPGiifGW1wXshtIzRlzTw==@linaro.org
X-Gm-Message-State: AOJu0Yw6t2mdwyZyQuUDsG6Q8dZCIIC+eUn/AneqPvbbqbMrFdCdOs57
	1ZD4UyhkLeBo4NpWA75aQmCH55Kb4HhK69weaImB39BiVWhXFWpOVqC3XFkovvGjig==
X-Gm-Gg: ASbGnctl3reEfirMo9iq2f5Rm09dEELwR6AQxMponQVxv4HYlT2du/6dNHZsqHeIJWV
	3ON0/9XXZJ5fbvhTL0henEE8GSyS4Pztylo0/sjeAK1A1EDgzs/qMNTl3/aXgrDWgbSrhLYN/gX
	jPHNVP5ObuhUwMor1OM/38VSQC+WdcK4ctPWx1cly9UV7Sm588GpxqRLrkkytM2nN+dt/+pOZlR
	Wg0CiPlO3+VBB7105QzWg5U8efczKlrVDfrmIleK4tlHpARXayQrn17WFIld9Wp51tuFCIs9ekV
	+op+jwPpefY0WiBthLNR3A==
X-Google-Smtp-Source: AGHT+IHaNYq08iPVpPn/doq9GXszwpXL1774yFW4fibBNLZ6jkVPuWar88biKdsU9DNv+DLpdatI8A==
X-Received: by 2002:a05:6000:1865:b0:386:1cd3:8a03 with SMTP id ffacd0b85a97d-38dc9346494mr10134005f8f.32.1739195886658;
        Mon, 10 Feb 2025 05:58:06 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd187360asm7596636f8f.43.2025.02.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:58:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
Date: Mon, 10 Feb 2025 13:58:04 +0000
Message-Id: <20250210135804.3526943-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T7rnDn8pCeCj

Currently we call icount_start_warp_timer() from timerlist_rearm().
This produces incorrect behaviour, because timerlist_rearm() is
called, for instance, when a timer callback modifies its timer.  We
cannot decide here to warp the timer forwards to the next timer
deadline merely because all_cpu_threads_idle() is true, because the
timer callback we were called from (or some other callback later in
the list of callbacks being invoked) may be about to raise a CPU
interrupt and move a CPU from idle to ready.5A

The only valid place to choose to warp the timer forward is from the
main loop, when we know we have no outstanding IO or timer callbacks
that might be about to wake up a CPU.

For Arm guests, this bug was mostly latent until the refactoring
commit f6fc36deef6abc ("target/arm/helper: Implement
CNTHCTL_EL2.CNT[VP]MASK"), which exposed it because it refactored a
timer callback so that it happened to call timer_mod() first and
raise the interrupt second, when it had previously raised the
interrupt first and called timer_mod() afterwards.

This call seems to have originally derived from the
pre-record-and-replay icount code, which (as of e.g.  commit
db1a49726c3c in 2010) in this location did a call to
qemu_notify_event(), necessary to get the icount code in the vCPU
round-robin thread to stop and recalculate the icount deadline when a
timer was reprogrammed from the IO thread.  In current QEMU,
everything is done on the vCPU thread when we are in icount mode, so
there's no need to try to notify another thread here.

I suspect that the other reason why this call was doing icount timer
warping is that it pre-dates commit efab87cf79077a from 2015, which
added a call to icount_start_warp_timer() to main_loop_wait().  Once
the call in timerlist_rearm() has been removed, if the timer
callbacks don't cause any CPU to be woken up then we will end up
calling icount_start_warp_timer() from main_loop_wait() when the rr
main loop code calls rr_wait_io_event().

Remove the incorrect call from timerlist_rearm().

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
As far as I can tell, this is the right thing, and it fixes the
"icount warps the timer when it should not" bug I'm trying to
address, but I'm not super familiar with the icount subsystem or its
evolution, so it's possible I've accidentally broken some other setup
here.  This does pass the tcg, functional and avocado tests,
including the record-and-replay ones.  I've cc'd it to stable as a
bugfix, but it definitely merits careful review first.
---
 util/qemu-timer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 0e8a453eaa1..af6e1787e57 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -409,10 +409,6 @@ static bool timer_mod_ns_locked(QEMUTimerList *timer_list,
 
 static void timerlist_rearm(QEMUTimerList *timer_list)
 {
-    /* Interrupt execution to force deadline recalculation.  */
-    if (icount_enabled() && timer_list->clock->type == QEMU_CLOCK_VIRTUAL) {
-        icount_start_warp_timer();
-    }
     timerlist_notify(timer_list);
 }
 
-- 
2.34.1
