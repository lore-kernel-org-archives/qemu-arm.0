Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706567lfg;
        Wed, 3 Mar 2021 13:48:50 -0800 (PST)
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr871842wmf.68.1614808130318;
        Wed, 03 Mar 2021 13:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808130; cv=none;
        d=google.com; s=arc-20160816;
        b=jCh1t5CjNiC0Fye/9c+3PHeB7x7NAQhUoNeGOwQI8D2jA+ufQzTa4Sx8SmXFBswCKl
         w37ojMuZGFVbvasOUjvNWYxz0q/rvNUhYV8EcFN2glzSmXs5GDC0fp8dVM6omzuO8hnE
         N0a0FCh/a2DQD/+ltLGNoKKCwW4uElUs/x/PUwqrNA7tA7B96NfltL5O2YlZH5g98ZTv
         o/J4x+SPF/vz9xuUSsLiKlsis14OGy9AUbTyWO1ks0P0ftf0TNLf3ClZnF+3akVnsZ3A
         Ms2Qt9ouruRhRLYcY+f9BlsBLQAXIMg1ePBnAJKRPngr1VihCqV5YvbDehqAVvGE7i8W
         H7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kUl/TkScTas4U6LyrmMWcrV1B+r956Btg0Xp2UUszDg=;
        b=Vr1WnggZ1UFhC8woGF9MsDC8wS1ejVrq8gsqKhUrDuV86mReAuxLh38LYDFlT6Ii1Z
         5BIE6x5E02DsvNrzBAI2TsAGnphMN53QvRFM7mcUrIyb74z0MqroGbYzy/C1OPg/A2fN
         WZZt9d9tNpgGXkz8sveuln4Xnyp+n1V45ZjnMqdmdQtFXrHV/Gjp0GPNRq/UcDcn9J6R
         gTubdqm0jA+DtPa8Z8gFyNnLWwZcCHVGHOPlj9KlSdqxrKVpQc6R1NxsvDx5D44dz7sA
         LeGNjYsmFFd//0HpXI4jEADrz0DR3t7v348XpZ4vYzShrqXCZ0cPgdYrLgbcMjrwekRJ
         IwyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qInQaYFs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v1sor12498832wri.17.2021.03.03.13.48.50
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qInQaYFs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kUl/TkScTas4U6LyrmMWcrV1B+r956Btg0Xp2UUszDg=;
        b=qInQaYFsgsE69kLZN8Q0oTBi4JLGigTuAdCDOGlOkRUemirQGKUfhX9Pj8PC4uUvOY
         t88ghIacqaz2h0fwh9VbeOOOA44AWZ8O1H6BxbhYX/Qocj/GqBvR0tugFD/qlPvaCtYs
         s3bJFoCvS4S+9FvE9WV+PBiKVXDaEfbOFTbiDKnr8d2KZEJ8ZFoN7rKEXDRWVlm1COeO
         I4K7tzXcd9paZ0L5tbFEnJ1QUlimRuBh2lQgGI//cMLR469o/3detg+i+YJPevuQA7rp
         4tj5UIKf38In16T2tGimCGGv5kdFEbIYLnGRnSaedNXc9dEifVo3xXRJ5ilbMN4+XSU7
         whOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kUl/TkScTas4U6LyrmMWcrV1B+r956Btg0Xp2UUszDg=;
        b=qc5hdp805YgS5MbjKgb0GtY/i0mWme6TceQF2E705kbGCGoIG5fpNvAd4u0ZF81Uea
         KVkCiZmB4DuBviSjWCdCTxdc2iNKFvlnMRh4xnfJSI+cREioxBCYirWt/ZDLk9ZnBXeT
         XCR5vNRexhce4VdRyiLlFPOlQTGNE2VwxA8t+6L0+tLR30xtUGPzaGNrjLLT5rhQEpoP
         IV0H2NAnB6Caj6SN8xG5xyGP3zj49yh49x3jCPs0Q3eR83628CivltCrKHUkzoz3pmxi
         QZFrF/MErb+IB2nITGRygcFUHCpT/zD4HKWC262XWxdIWQLRoNvgo7+dh711uP5qWi60
         vqJQ==
X-Gm-Message-State: AOAM530ei4SmGsHLiTJOvNV5XxPsiNMEnjuySPnGebluOwDuRjQGfFzF
	T586/H+vkNt6NGu7IeIzh6FLjnO8+rI=
X-Google-Smtp-Source: ABdhPJyY4HgQ86PsHHmKaXEniS0UUWIyAYBaegUuvR3TasK7FrH16cvXpoFJEK/WJ9eL6FDQt/11LQ==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr666134wru.127.1614808130141;
        Wed, 03 Mar 2021 13:48:50 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id g63sm7463370wma.40.2021.03.03.13.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:49 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 18/28] gdbstub: Remove watchpoint dead code in gdbserver_fork()
Date: Wed,  3 Mar 2021 22:46:58 +0100
Message-Id: <20210303214708.1727801-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HE4D9No5JUo2

gdbserver_fork() is only used in user emulation where we can not
use watchpoints because we need the softmmu slow path to detect
accesses to watchpointed memory. This code doesn't do anything as
declared as stubs in "hw/core/cpu.h". Drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 3ee40479b69..f3614ebcc7a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3349,7 +3349,6 @@ void gdbserver_fork(CPUState *cpu)
     close(gdbserver_state.fd);
     gdbserver_state.fd = -1;
     cpu_breakpoint_remove_all(cpu, BP_GDB);
-    cpu_watchpoint_remove_all(cpu, BP_GDB);
 }
 #else
 static int gdb_chr_can_receive(void *opaque)
-- 
2.26.2
