Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706945lfg;
        Wed, 3 Mar 2021 13:49:31 -0800 (PST)
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr821569wmi.117.1614808171259;
        Wed, 03 Mar 2021 13:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808171; cv=none;
        d=google.com; s=arc-20160816;
        b=TWurthbk2TcoDs4wbMZoEyfYwSlLhgj9kbAzLDKcWPKdD5TcYzZ8CTRUJze9Tn0MGj
         a+KRAVSVldMZbHUzcTqdvktI6PrPh4RYt+LCLKK8SJC+6EnLWZW/OTihG1/FwmyygWUI
         wstk/jUEw1vn0wGeDgPhmUg6btvJCzL0FVdLY9pA6oIJlMnOKy48M0wiKzUeR7TF14ty
         R93OrMQMUDCjw0QHoUz+KDQT3TfLpXpL2r3j25Xa20dvwBYMATU+C3u9HsPU3BRtP63z
         RxnwGq2Aq2tn1s2y8g+kTgGD/6sA5d9L1u6IEvPEUfTg1LapW2joJzZ2r8Xp4XEMsLLn
         gfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=bxkFypL9ynYmWsntppZ7LktvbyLhxQp4d+/kAn8sAgo=;
        b=Q2FfFRiIrrOTwmPtqIdVbyVdP5YyZ77RWUuv6Vx1ElDlv+KBW1x+tELQCsAE2rs8Aq
         xCiQr+adiOEb7cXkpfVooRIc1IZKYL0SygvnDKLdxE3yYYIhs6ilZgwF8ll70iMmqAS3
         ukbIqQ++wPXysH39yaZUsPHY3HMYxglZee1k/izzGK1A860MWQU7yF3skVg0edk8hJCF
         uKGBpdj52lUbBnYqvId38U8poS9uCmf5cdlw0C0H6GuwzKomLI/spELbYBMUavcYHqYw
         9cV4QHaNiHv/7e5nUMYcQWE68xwmMYEOL8fOx+w2v9hcca22azofo4UcA4Jycmm9GcML
         KuLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MBF4+lTx;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9sor7675450wrm.24.2021.03.03.13.49.31
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MBF4+lTx;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bxkFypL9ynYmWsntppZ7LktvbyLhxQp4d+/kAn8sAgo=;
        b=MBF4+lTxuVvAnOCUmds0Qif+mBC839/cwZpVlFExnBSDxJq0zPe9fiuu+X20wPaSKp
         HUA2DhHdtUnQPmmwONDZVz2FtdSMAXVJjHBrkFo5Y7eWWMWWmMlJB91E/1q/xGdRLC5g
         E1K7DnDmYmFhlPAwNEPUCYeVHf00vOQukF+hvEJihnNa/47ymr5qPHXg3OOVdLoW2a1q
         t4hLkJqznaHlZZ3Wu+Z9qYcqzsKlwtQP9LhVkIsBOK4RZkudywiesPTs70J4Nn7IfYvi
         HOuMj3ZvWNav8bhX8wTzcbEOeB8c3dr7D658TkZdiKL8bhMEYmrmifgud+63wr9HdA4T
         aXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=bxkFypL9ynYmWsntppZ7LktvbyLhxQp4d+/kAn8sAgo=;
        b=mNDBU4CRhLhlf6wuiMWS9T2oyfd6Vx2NlSoCgkZhNAQj/gVneGDm0Ufa6/F9gLr0yf
         Ez4pva/jXHSuLtNd4/cgoR4iYdN/8v8Ws/EspcjpktFTjO98VNWrKhTYcQl0DY5M0coT
         WicNRMX03TUPEv7cZfhJ8MERfYkxRiznSni1Xdp7Rt0BmeJ5PQZ9oXoVOkWkae6j3We6
         rtmPHZU2XdjAHhO0w6jO8oHFCEIdMmkjFNq/UU62GAdZx+cVooP0AzeapOIs6XhjIJ/x
         f7A1EFGfESwbMKInBMj1yEPdntau6QtdJHZXEKXFXVBl7DflFAMKEGRRCfPkCF6l8W6r
         jrNA==
X-Gm-Message-State: AOAM532Ld6UykMqFxAPLV+yPpcMOalpydCwHiLmg7IYN7DmrgMos0sVp
	HsnOcNtPdcM3T5KvbGiME6E=
X-Google-Smtp-Source: ABdhPJzZfI7TQhb4TmfrwYHeRw812f6SyR8WPbICKpu/1KKUh9xn2khVtehQMbw0VqHf6UkDh81hMA==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr681832wru.197.1614808171102;
        Wed, 03 Mar 2021 13:49:31 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id o2sm6723019wme.16.2021.03.03.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 26/28] cpu: Remove watchpoint stubs for user emulation
Date: Wed,  3 Mar 2021 22:47:06 +0100
Message-Id: <20210303214708.1727801-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WGkXsR4eK8Om

Since we remove all access to the watchpoint methods from user-mode
code, we can now remove them, as they are not used anymore.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fe4206b540f..b708f365a7a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -916,39 +916,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#ifdef CONFIG_USER_ONLY
-static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                                        int flags, CPUWatchpoint **watchpoint)
-{
-    return -ENOSYS;
-}
-
-static inline int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-                                        vaddr len, int flags)
-{
-    return -ENOSYS;
-}
-
-static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
-                                                CPUWatchpoint *wp)
-{
-}
-
-static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
-{
-}
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
-#else
+#ifndef CONFIG_USER_ONLY
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
 int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-- 
2.26.2
