Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1226212lfb;
        Fri, 13 Nov 2020 02:17:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9gN1kKWM+jzV79s0B0AluABy1B3MuRpL5t9NLpDx+lGj77pZ6lyRX7NvbgyksDfmKPMAE
X-Received: by 2002:a25:c845:: with SMTP id y66mr2292589ybf.251.1605262630485;
        Fri, 13 Nov 2020 02:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262630; cv=none;
        d=google.com; s=arc-20160816;
        b=Nqh3QqVtbRr3o+8F7z/0u+t4YIW8oxK4XhQX4xuxmNfpdlGAR1ooye9aAX4VV30Sns
         EzuJB3sZ4hAVlhSigta+NdxCweKiJg5Wm5geWOPvRbRwKMUHP0GEpawf+zRH3PtFT1bB
         oeXRplzof8Cl0smUtcNf8qtQk1LB/ma9iw2DlhcExsB21V75sh0PpdBYLOORirB5GWxv
         +Ualq3jRj9490+lLLi+Gyp0CBpkKySxuOC51XgSikOQypGppoBdHAXPq6njsl29WFqnu
         Kg6ptg4kIaA45LmqC2oMN5iaqBaKRWfH/duZwueOTLUgQpFCBkQMn7LluNu/prXHRCQ8
         RwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=9waHiCll9jkC8K2NE3gUVQ2pxiduXE8yB4v0+9V3JBY=;
        b=yruZZiTmpFIxseV28MroWjg8LLHghAtfVW21JKRtCv0qbuEabsVmksu6PlcYeJUV8F
         tiaxShmH8qPCPbOZj+gAdG9pEkvlea/Ii6ydHuQ4iDfqlaIwYrH+fUvQObO+p2ZxOSyR
         2l1HdS9mueEWnduf2WvEYNA1K3G5+jXMRg/wW3LoPn0j5n4m4NQATG/yRqhDitxUIkaC
         FMR7HNE2p64Bx4mMfhcp1hv4nw3dZm5Qf+yqBW3JD28Qy8nPW9Y8biIqNxZdoAgnt6kC
         URqYtXOEUEI1obq9ZySoViT5cn5Wwv1GNrUnU+gcO4CzJNc4RWHbH9whHVBp0z3LH2vL
         6C6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ebL+nXYO;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id d77si3754801ybc.153.2020.11.13.02.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 02:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ebL+nXYO;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605262630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9waHiCll9jkC8K2NE3gUVQ2pxiduXE8yB4v0+9V3JBY=;
	b=ebL+nXYOPmk+RbBzlLub11Hq7WxLcfCPLu7MupdaRUrH2SwwA6jt3nLY89H4s/FLPA+SkE
	dbhDD1ol8vNEL7aJAbF7/ILA598CQjlAaEfV2BXP5Iic2lgfEUrswvDTjypXlvaJxH2E3r
	V9Xn0/DqlP06lPIOzkzfX9a45QORgz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-aQ97opCMO1eO3Q-eHi9LHA-1; Fri, 13 Nov 2020 05:17:07 -0500
X-MC-Unique: aQ97opCMO1eO3Q-eHi9LHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 812F21882FBC;
	Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D4A575125;
	Fri, 13 Nov 2020 10:17:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 001/122] vl: remove bios_name
Date: Fri, 13 Nov 2020 05:15:03 -0500
Message-Id: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4BFn7LZAduy4

bios_name was a legacy variable used by machine code, but it is
no more.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 softmmu/vl.c            | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 817ff4cf75..1336b4264a 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -8,7 +8,6 @@
 
 /* vl.c */
 
-extern const char *bios_name;
 extern int only_migratable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..ab79c361b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -119,7 +119,6 @@
 
 static const char *data_dir[16];
 static int data_dir_idx;
-const char *bios_name = NULL;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -4208,7 +4207,6 @@ void qemu_init(int argc, char **argv, char **envp)
     kernel_filename = qemu_opt_get(machine_opts, "kernel");
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    bios_name = qemu_opt_get(machine_opts, "firmware");
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
-- 
2.26.2
