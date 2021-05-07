Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451860lfg;
        Fri, 7 May 2021 07:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Z4pBANCVh3sKZNpnWauOJSeq9Omhjz47tceWC/kQ2gSykzYN16dYX1TfSu9MsfZ6vW6+
X-Received: by 2002:aa7:dad7:: with SMTP id x23mr11923904eds.86.1620398683580;
        Fri, 07 May 2021 07:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398683; cv=none;
        d=google.com; s=arc-20160816;
        b=T9qyYaMGKVx/jvCmxs4vyLzrkhDLx3xTNvnIq/MkRtHM9zuOXSK8eNhY9U3PHJkySv
         FTfcVWq1MfWFb2/kUw3O+aPszeEgIfK8OGNSzYpqiPVnWlsqIcMu2VUG4tqNd88OUOOe
         gKqRRI4GJs7W0q5av8JVsjetezx6TVQLNfEFAEbXZRaSFc1XpBJNalTEMH3PGlW822vF
         wAGHTvAGbkBTWCRqEWXqY/nsGfhkTk2RXKtCyaA5g7msO3Pk24T9GRS5RBh+o2OJcNxY
         IgYC8cHx2zCGt8VoO+8A9T88eRRya6RbFd6G34AvJwyIo/D3b5w6BPSsAsHf5nMzkNnI
         j7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3LzYOi9y3/bAg2bf530/ErMOAU+nSy3193hDlzyrvOQ=;
        b=EizWzbmFHGxQVpx+22mgAIMkRSsh0QQjZ2FMjMAOxioNwpussxVkrMUmb+QuqxrRac
         hR7ptNRWVxgAFdIiqisFmX0+kDt+U7D+3RsupH/8KPeUX44J4e1vAG5oj8XCdw3XZrsa
         /bXWkphPJIrUnv/FwvtY0ncKa4+E4kWI7bJSGdq0SLdtAIbqvyGIPpPpadJsaReiaLhi
         /SKyNFyohy/ABT2iM2iQ4tOQI3Ws21aGzGfiTXrVsBuK1AyTYbSLwXNUzB5yKkpVP7Ju
         97GvUbVCP1QSgSl4VG5A6Ua+tCNfCHbb5CqUpaBSh+G5Bh6eoawnlYPpvQvnhSOhHy4Z
         ubMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T+CYQsN0;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c13si5046516eje.45.2021.05.07.07.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T+CYQsN0;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3LzYOi9y3/bAg2bf530/ErMOAU+nSy3193hDlzyrvOQ=;
	b=T+CYQsN0PkVXYgqaHMxK+gvJwsXsfdqrvJ3vKUt9/VapK8iwtF79BIOtBjD2Q5anSizQeS
	3bGbj5ByttxYMzDMKWm2DfITFKpj0rnJ3PKOkmmT7uIFMa743XXfaYE+8lUZp9CznJiAOn
	19jK9C7W+H9J8lc0vgtMm68Fr+btBC4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-k4ln4VjuM2awACVdUKu1Gw-1; Fri, 07 May 2021 10:44:41 -0400
X-MC-Unique: k4ln4VjuM2awACVdUKu1Gw-1
Received: by mail-wm1-f70.google.com with SMTP id h128-20020a1cb7860000b0290148da43c895so1464863wmf.4
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LzYOi9y3/bAg2bf530/ErMOAU+nSy3193hDlzyrvOQ=;
        b=JUcVoxsLApMqtzZv4H5Jlpt3xqmuRWn8fx9AwtbgtYXORXd343xN7u2cCmKhYCcsf+
         Wa0YDt9+RN2FA5shbG5qzqem79Q4mLE3C2BJU05/2Rdm1hBMgqm82nQSoeQNRhEJFGXy
         33uYmXDzBi8E3KYd9g+sAs3jZ9AbVIB3tg53zgi+tgH1MwNxnLzRWrQCLB7lofTiCZ9n
         QTTBsBmflzs6UER5DcMMgOpch+h4xPSX9BhUMnVlzzUv6HlYoQfuZd0zE3cUoPXlagje
         UxCtVzeN6mkXUnAaVQRJ/21fc34zSpkbh0HyhyaMWsFNLSLGBe/Oz8WfKJfajL948xN3
         5Xlw==
X-Gm-Message-State: AOAM532OuQog6mPJxp2i7a2bq8GgDPbVATxTWgN4GsR1z2PBYxK5puIg
	bKGdgfw7Z8YzfUuHXX0Ncsi1CsmRztbHn4TZ4doDVxuEmi1pzw52K3jBZSDjSmncXIvW3gDu+Fp
	ZtroTEp1X1frcU7pX
X-Received: by 2002:a05:6000:144:: with SMTP id r4mr12809718wrx.128.1620398679874;
        Fri, 07 May 2021 07:44:39 -0700 (PDT)
X-Received: by 2002:a05:6000:144:: with SMTP id r4mr12809703wrx.128.1620398679711;
        Fri, 07 May 2021 07:44:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id a9sm7223387wmj.1.2021.05.07.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [NOTFORMERGE PATCH v3 17/17] configure: libSLiRP buildsys kludge
Date: Fri,  7 May 2021 16:43:15 +0200
Message-Id: <20210507144315.1994337-18-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0BasmnMFHYmJ

Only enable -Walloca when libSLiRP is not built.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 67cb6d5421c..ab5b6248253 100755
--- a/configure
+++ b/configure
@@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
@@ -5255,6 +5255,14 @@ case "$slirp" in
     ;;
 esac
 
+# Kludge pending an alloca() call removed from libSLiRP, see:
+# https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
+case "$slirp" in
+  internal | disabled)
+    QEMU_CFLAGS="-Walloca $QEMU_CFLAGS"
+    ;;
+esac
+
 ##########################################
 # check for usable __NR_keyctl syscall
 
-- 
2.26.3
