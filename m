Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2824046ejb;
        Tue, 28 Mar 2023 10:31:40 -0700 (PDT)
X-Received: by 2002:a05:600c:210d:b0:3ed:418a:ec06 with SMTP id u13-20020a05600c210d00b003ed418aec06mr12729735wml.28.1680024699867;
        Tue, 28 Mar 2023 10:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024699; cv=none;
        d=google.com; s=arc-20160816;
        b=d91Ma6n4JXGlWqYyBX33ZEsgLnsNqXyvCHsLUcuB5n2S5T3Ud5Ij2iOuWC+t3PZX0P
         MjUgPbTFj6nmUx1q4fB2/nLBi5uMXGu68Z7uIXPzgpeYJfyWrMBMDoZF2ru6xygF6vXN
         BYOxmjCI0vNXedA2BGc6IJz/LWlJF5s97Kf9jQ8vzYGimWWbezyWVeQlpTQ2V0cMYhLB
         adsSgjNYouCVlTqLrS6D2f/KqtU7lMVpKVtZPpcA9yIN1rpPM6OzOdTCymuz9soPevTr
         0EgZZlE6E7VliTbn55AV1z3YBL6xMlf14fgndWYNInRmmonR7K753PIYq08WVBW8BZyN
         Ly3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6MbnN+0f617dsehwYtlh7IWt8dwxE1cjBMBOmowF/jo=;
        b=ugyLLdczwyhhriaEX6K3iYnr83yippvCX6QYH3pwfrsobzjecEDwzdoekAPJ0GCdiE
         9ZefSH1ln22v1yy8SotYVv+5QruZ7xdAIdgZTVYQK2l3jht2IC2ueO/Hcr5ju+6FBPgn
         ykO2xvL4eqZyH+Zzf2G1kjRbLbuZI6hvyFvRwSF4C09TwWyJB+uEqJXjCWn8GXT18Lfu
         pV1dnw5PdoPUI9oWcB7gpW4BTBaqKKMFN6y+gmNP94yOe1SQGUrttogClheCuRBU0WmY
         dseu4GcafqRU+UQQ2WcmKlBf0TNxaBq8vCBthGwykDmVHsakT3veTyTaV95XLqlT5kXq
         rsnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vi8NBOJN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f18-20020a7bc8d2000000b003ed2a453fbdsor4223543wml.39.2023.03.28.10.31.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vi8NBOJN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680024699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MbnN+0f617dsehwYtlh7IWt8dwxE1cjBMBOmowF/jo=;
        b=Vi8NBOJNIaL4iwmKYW/PpwzdiWYsFRvUddBLaqryeDI70WY0Oy2d73T0GBar8fT1NB
         66DvxYsstnj/vPT+JA6j4E6VyKP0irgJ2/Iy5ci1ndgoiAomaEnQExlQNt644ZApOjSM
         5gf0M9tQLUsBOniL4N9ajmop5HVjbUwLVpkn+q2VAZmgnJb7AVenFfmumtwiQITOsfEx
         t6iYLRcYqbJIfGaFb3NtjMhcApH/+SO/c5MkJFyb8hau3tmKfNx+qt97wNW+SjNkaMCG
         bsEWeGqllJ7zZKuyYylIGdXnif/MpVMTc7V+uiwStXJ2mx1S9wZRsAJS7VsHHxBCQmJT
         w8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680024699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MbnN+0f617dsehwYtlh7IWt8dwxE1cjBMBOmowF/jo=;
        b=KTtMmc9ZjZw8fF5Lha09Em1lJJG3j1WaGy/zqorm68VGRcEwUPznNyVhLvEQfkZnIg
         m8HHUzKhy66t/L848jsaOo8/BK4B989Xue2cLaywG5hnbe7efZeajrC/A7pQxs9ndGRO
         ik22YXcDxkt5H43d9+BumvkoHCcjIEGebHNoX2/DWh49Vw1V8EbKAUeP1V2uWmxSl32Z
         SYZ1x3y54a8kVDQa8xxFz81DdWjkkFAgoprEY7zFdBbb+IR2HAnTIphn/KK2H7oD6EPc
         mJMI5LA8Pvwppf7DRKmBXUtAwPw+dk4p4S3/B/QeTfr+P34f+D4/F0t/geQXv8KvTZu0
         MnvQ==
X-Gm-Message-State: AO0yUKWXImRUYVg95pfrnbqN3cPwQG6m46YLPBWYN20ylDwqBV5CF7BZ
	JgMTkdyJEYt09xNgqB1gn5fv2dtn
X-Google-Smtp-Source: AK7set8Mmo+1n3OHQ5g4OfvYMwrs4HJlZZH0POTRPmIjvHUca6eFRX/JiDgvHoeOv6WIKTuIxEEAQA==
X-Received: by 2002:a05:600c:21d8:b0:3ed:2b49:eefc with SMTP id x24-20020a05600c21d800b003ed2b49eefcmr13475865wmj.3.1680024699656;
        Tue, 28 Mar 2023 10:31:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c3b8a00b003ede3f5c81fsm13483453wms.41.2023.03.28.10.31.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 10:31:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	kvm@vger.kernel.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 3/3] softmmu: Restore use of CPU watchpoint for all accelerators
Date: Tue, 28 Mar 2023 19:31:17 +0200
Message-Id: <20230328173117.15226-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328173117.15226-1-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z77J2XRXTR9p

CPU watchpoints can be use by non-TCG accelerators.

KVM uses them:

  $ git grep CPUWatchpoint|fgrep kvm
  target/arm/kvm64.c:1558:        CPUWatchpoint *wp = find_hw_watchpoint(cs, debug_exit->far);
  target/i386/kvm/kvm.c:5216:static CPUWatchpoint hw_watchpoint;
  target/ppc/kvm.c:443:static CPUWatchpoint hw_watchpoint;
  target/s390x/kvm/kvm.c:139:static CPUWatchpoint hw_watchpoint;

See for example commit e4482ab7e3 ("target-arm: kvm - add support
for HW assisted debug"):

     This adds basic support for HW assisted debug. The ioctl interface
     to KVM allows us to pass an implementation defined number of break
     and watch point registers. [...]

This partially reverts commit 2609ec2868e6c286e755a73b4504714a0296a.

Fixes: 2609ec2868 ("softmmu: Extract watchpoint API from physmem.c")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 softmmu/watchpoint.c  | 4 ++++
 softmmu/meson.build   | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ce312745d5..397fd3ac68 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -949,7 +949,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_USER_ONLY)
 static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                                         int flags, CPUWatchpoint **watchpoint)
 {
diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
index 9d6ae68499..5350163385 100644
--- a/softmmu/watchpoint.c
+++ b/softmmu/watchpoint.c
@@ -104,6 +104,8 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
     }
 }
 
+#ifdef CONFIG_TCG
+
 /*
  * Return true if this watchpoint address matches the specified
  * access (ie the address range covered by the watchpoint overlaps
@@ -220,3 +222,5 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         }
     }
 }
+
+#endif /* CONFIG_TCG */
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 0180577517..1a7c7ac089 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -5,11 +5,11 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'physmem.c',
   'qtest.c',
   'dirtylimit.c',
+  'watchpoint.c',
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
   'icount.c',
-  'watchpoint.c',
 )])
 
 softmmu_ss.add(files(
-- 
2.38.1
