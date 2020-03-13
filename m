Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501312lfc;
        Fri, 13 Mar 2020 11:37:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtdGUdzH7dMq3EilLbX9eLL4UA9Hvx+T/iEeDRtIK8/zOZxraXuI27admtp2iI0a6vcHIz6
X-Received: by 2002:a5b:c8d:: with SMTP id i13mr17715111ybq.480.1584124645445;
        Fri, 13 Mar 2020 11:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124645; cv=none;
        d=google.com; s=arc-20160816;
        b=TKf3rXf4Ntzg7b6NlaUJvkU1axGmbMtPL2TsIryg98qyVJsoT/HmSTGzlnaNv31Hkt
         ZZusGOSHCEuazDYAVQv+T9XaSP5YpsSChgAqutP4BlFe4E7dUPGrHw5d2weZlUsPw2El
         7ca0ZBEht2At6XMhmP3f41appwKjDV7zkHbN2yiEfqEcBUKEraw61RWktsy8LAJlbwKZ
         e19k2rjWwjRHjgRwvYRag9GKeS6EhpYx2WBmWHbzizNazcye+dsa29liZTkTZOFdapoY
         ReIgujj61aHn+OFmqHdivEpzTVzolR8wiGnE8M4UVxYFNuvLptRmHoed4ubzrZ2JctlT
         LthA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RNscj4znfEFoxUyR2eitCsjwBW0o2g2YBibwWrrvxzw=;
        b=lUacR2YTfKzMqdgPcrF8uR+GTvxuJufACwuGlqbagMAAZZtpkCHIR3SpX+t1iYCOTm
         z0SBaZ/dKuQ+VcmJyeJIwd5I440ZujKxjnKKs3Zpk78fBqqmobD1Oo5my412CNyaN5Os
         9Tq3J2RyvnK6Gy4VMXtwOcLuD3v8NWq+LL9fXsRoNMqgZ01kK0RG4mDOAfRxqVUsMA7O
         Y83QmlrtlxOUs1jksMFuJ8rD1De9uFC1cDk2U4mbzOVpwbrXEO3Dob06eTaca04D+txR
         VoIfHFreueWXz8bPl5dfQRoWzsCZ7iJt7def8gGY45Jw5o8Cb4PuH234CBeULNqScqR7
         9ygg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=durJYdeU;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k206si4761836ybf.32.2020.03.13.11.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=durJYdeU;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNscj4znfEFoxUyR2eitCsjwBW0o2g2YBibwWrrvxzw=;
	b=durJYdeUM0TRBu/gX3dQnZSfpWgVA+KuxLKRqqPerXzuBOLEUxtuNfXI7+XyZTlqzTIwKD
	Et6XJYdkmn/j6YqAigDT3MweTAl9SyC11/A/CUQcgU5QOA+prrPXKiR3KN1CdmkpbzE/pE
	4tLDuq6DiH6Vy2reIh7qsYa+1V1kL/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-sVgZMIi1Pg63RW3-ziRHlg-1; Fri, 13 Mar 2020 14:37:23 -0400
X-MC-Unique: sVgZMIi1Pg63RW3-ziRHlg-1
Received: by mail-wr1-f69.google.com with SMTP id 31so4760596wrq.0
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFdvn7QNDrVxUqibYwnc6bH6F2vFCMCHuZOu+Zd/Cpc=;
        b=RG6ESNra9Nc89i8ffkVRcFd3HHlxMlOTZHFEfNGDctFSxBHwn1owv2EII64v/3zPYe
         YYjP4ME/oP6ocF2aStmhMs7r03iCCRH2r/0Fas+DZUUp5iUaHVWTuTjKMogBCriG7cC3
         MyYI0Mcr2KWwcS8bnRQuFT1Ogp7T5xIfgZbWg+RamjDSuuBNTN6yVcE1Xjx+Q4nNbwYk
         WLFpYD2190cun5ObJ0DLnr3fCzx7keiDqc8QM65NhMlZyzcpKKypzJgb1nzfiVzfErZj
         PaPVByjk3tuKGug9/AqLVO+/a58teLbE280B0GJXqhk0jzIxcZm328mohyym7tN0IDoS
         TrUA==
X-Gm-Message-State: ANhLgQ1cPUBncM5qsL6SbgHzt13wjdMIG9iz4csb9CxdWhMr60L+7W7E
	hMnO4MaO4hZRY+ocJ+4ryrbLZtnAj4jzA2LnZokVT4y5YAFlObabqKfywPw9XoFJbOmDcz3mmQP
	3j7ROLIkiioQEs1xk
X-Received: by 2002:adf:ef92:: with SMTP id d18mr18557126wro.193.1584124641899;
        Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
X-Received: by 2002:adf:ef92:: with SMTP id d18mr18557095wro.193.1584124641662;
        Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id n2sm12942644wrr.62.2020.03.13.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 05/14] stubs/Makefile: Reduce the user-mode object list
Date: Fri, 13 Mar 2020 19:36:43 +0100
Message-Id: <20200313183652.10258-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /ISv/fznsO5b

These stubs are not required when configured with --disable-system.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 stubs/Makefile.objs | 52 ++++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index 45be5dc0ed..5ffa085c67 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -1,46 +1,54 @@
-stub-obj-y +=3D arch_type.o
-stub-obj-y +=3D bdrv-next-monitor-owned.o
 stub-obj-y +=3D blk-commit-all.o
-stub-obj-y +=3D blockdev-close-all-bdrv-states.o
-stub-obj-y +=3D clock-warp.o
 stub-obj-y +=3D cpu-get-clock.o
 stub-obj-y +=3D cpu-get-icount.o
 stub-obj-y +=3D dump.o
 stub-obj-y +=3D error-printf.o
 stub-obj-y +=3D fdset.o
 stub-obj-y +=3D gdbstub.o
-stub-obj-y +=3D get-vm-name.o
-stub-obj-y +=3D iothread.o
 stub-obj-y +=3D iothread-lock.o
 stub-obj-y +=3D is-daemonized.o
 stub-obj-$(CONFIG_LINUX_AIO) +=3D linux-aio.o
 stub-obj-$(CONFIG_LINUX_IO_URING) +=3D io_uring.o
-stub-obj-y +=3D machine-init-done.o
-stub-obj-y +=3D migr-blocker.o
-stub-obj-y +=3D change-state-handler.o
-stub-obj-y +=3D monitor.o
 stub-obj-y +=3D monitor-core.o
 stub-obj-y +=3D notify-event.o
+stub-obj-y +=3D qmp_memory_device.o
 stub-obj-y +=3D qtest.o
+stub-obj-y +=3D ramfb.o
 stub-obj-y +=3D replay.o
-stub-obj-y +=3D replay-user.o
 stub-obj-y +=3D runstate-check.o
+stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
 stub-obj-y +=3D set-fd-handler.o
+stub-obj-y +=3D vmgenid.o
 stub-obj-y +=3D sysbus.o
 stub-obj-y +=3D tpm.o
 stub-obj-y +=3D trace-control.o
-stub-obj-y +=3D uuid.o
-stub-obj-y +=3D vm-stop.o
 stub-obj-y +=3D vmstate.o
+
+#######################################################################
+# code used by both qemu system emulation and qemu-img
+
+ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)
+
+stub-obj-y +=3D arch_type.o
+stub-obj-y +=3D bdrv-next-monitor-owned.o
+stub-obj-y +=3D blockdev-close-all-bdrv-states.o
+stub-obj-y +=3D change-state-handler.o
+stub-obj-y +=3D clock-warp.o
 stub-obj-y +=3D fd-register.o
-stub-obj-y +=3D qmp_memory_device.o
-stub-obj-y +=3D target-monitor-defs.o
-stub-obj-y +=3D target-get-monitor-def.o
-stub-obj-y +=3D vmgenid.o
-stub-obj-y +=3D xen-common.o
-stub-obj-y +=3D xen-hvm.o
+stub-obj-y +=3D fw_cfg.o
+stub-obj-y +=3D get-vm-name.o
+stub-obj-y +=3D iothread.o
+stub-obj-y +=3D machine-init-done.o
+stub-obj-y +=3D migr-blocker.o
+stub-obj-y +=3D monitor.o
 stub-obj-y +=3D pci-host-piix.o
 stub-obj-y +=3D ram-block.o
-stub-obj-y +=3D ramfb.o
-stub-obj-y +=3D fw_cfg.o
-stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
+stub-obj-y +=3D replay-user.o
+stub-obj-y +=3D target-get-monitor-def.o
+stub-obj-y +=3D target-monitor-defs.o
+stub-obj-y +=3D uuid.o
+stub-obj-y +=3D vm-stop.o
+stub-obj-y +=3D xen-common.o
+stub-obj-y +=3D xen-hvm.o
+
+endif # CONFIG_SOFTMMU || CONFIG_TOOLS
--=20
2.21.1
