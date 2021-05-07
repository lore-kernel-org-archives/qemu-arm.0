Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp450876lfg;
        Fri, 7 May 2021 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyp4LL66O+YHzho2TLediame/57vsXLWEK7sRl0yumNvBJXpQOxSrDztgPR2kTpD9lKTIS
X-Received: by 2002:aa7:cb10:: with SMTP id s16mr11761341edt.313.1620398601499;
        Fri, 07 May 2021 07:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398601; cv=none;
        d=google.com; s=arc-20160816;
        b=hESE3+NRw5r6G94h8kN2GsMBpbiDCn2SRTs+6M4utnHg3fZEJqV8BEfUfVTFFrO5lp
         xe/v6Y/U8JNQu+pez5OliTxpXTqVujdhcIprS6RlR1z4bN8B5I/nXXAUWsUP2Noa6qpa
         rG3q3ipianpXnUs4U4JSa2T6KarmYSyXq/N04AakimHn2t3bgNRz+hAtjW+mozhgKbGI
         H1peE6VWsZqTuF4qScgDpDlci6hs2D97uIcbZE7/k5c32ZVoddrc2z2BpMM9R42kw+S8
         yQPs1bz2BCPrsHuGmykwUcPPU/Gp9zXQZ53x0n5pKDFM8dzS9uEdVCiJdTnQmxw7jC7R
         zeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=EXbOk1AK+h+Zej7kIJqAzPYV2sQD1wcRx6tvZvpWRRs=;
        b=M9wBFd4GSWYsOnG2/6+98IQf+gTMdBJYUvVgQXUZLYfSHqkDX6TXOROQkWaPZwCRcG
         aNuQi9hBMHq318+PU0V2Yxp+m6gEN5tFBDO0uUFCbYUyIUr5NTH8fpqU4aPVtAFV9oiy
         TADrUeM+6R6CM7BUNWiJ+5AlcS/8X8t6Q9kosOJYGXmfapp7QOjIRHplmD78nMJOM3GC
         ZbMx5YL15xDQKIRzmbUMhKBjtZtAoRT4jougsCJnxsKXikDQn6hDNyFKwUSypliymRG8
         ZtS2Aolm5BSmp3aD/h/9pztGb6KYCM8oSMPqakecUgDWmo8UCOOS2mqMoG35pSn8jRDM
         oSCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wml8NScH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f17si5181157edr.441.2021.05.07.07.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wml8NScH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EXbOk1AK+h+Zej7kIJqAzPYV2sQD1wcRx6tvZvpWRRs=;
	b=Wml8NScHi6M0NZYm5/57+8ERbj2V9nJ+0gGZG2idoFgcvEhOl8rRg/LBeyiM5wMKZjR6Z2
	HBYEKcI1LU32PgdUDbuQZyGvQflz4zKjcw/AUWtiFFF29E0YEErijhjHMqXfS2RcLfoWqf
	K0F1ntQgwPTWZ5yKxVYKv1J/622uPAQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ecmVMv5uMsyZpNyIashsdQ-1; Fri, 07 May 2021 10:43:18 -0400
X-MC-Unique: ecmVMv5uMsyZpNyIashsdQ-1
Received: by mail-wr1-f70.google.com with SMTP id p19-20020adfc3930000b029010e10128a04so3672140wrf.3
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JiudAHyKwdcVvgn2Srg79I18dvicfH0KT9PAVjPO2k=;
        b=tvPfS4C7jVxUY5cP6l4bm+DmWIizJa7VvDvL1g9tqzAdGbekkentPjd1bjoHrRJE6r
         Ofh4C0vWr3OSTBWTaYq8z6XxpkweE/1ulEomi9Tdw8Z0HUKamGFlY0UG1j4MDmXc2a1K
         mh88stVGGrYsHIKvYN+RARRIR9RhOb7JOgof9LFANBKCVdgBAWRUA1OSUR7aUoKn8ogA
         zgghIRtNbdxU9dDpXtR2PxRvlJaEQgQd+cOck54Pp14uIsm8tNIcnqKVLRWLAPzA/lS2
         Xkci38cv43N7GXfJ+YwQFvlv7g2n8avrnxlvRhtId1yLyyguqC7QrnHQDQSnigEGiUXS
         nYtQ==
X-Gm-Message-State: AOAM5307tffegtaYlmzTeW1aS5cKA1JcRTNBa0lVd6YgCR0kUtzbqlCX
	W78x9XR2EqPm/kHkEz8hNrKWuRE1gH9WY6QLZymbO5tKL3IddNVlp2BShpT6/hjcuNnU3LTZu6X
	gemxNq89UFBsEfv8p
X-Received: by 2002:adf:df03:: with SMTP id y3mr13224973wrl.409.1620398597801;
        Fri, 07 May 2021 07:43:17 -0700 (PDT)
X-Received: by 2002:adf:df03:: with SMTP id y3mr13224963wrl.409.1620398597683;
        Fri, 07 May 2021 07:43:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id m7sm8980967wrv.35.2021.05.07.07.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:17 -0700 (PDT)
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
Subject: [PATCH v3 00/17] misc: Replace alloca() by g_malloc()
Date: Fri,  7 May 2021 16:42:58 +0200
Message-Id: <20210507144315.1994337-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZkhGZuOWV18Y

The ALLOCA(3) man-page mentions its "use is discouraged".=0D
Replace few calls by equivalent GLib malloc().=0D
=0D
Since v2:=0D
- linux-user calls converted=0D
- bsd-user returns ENOMEM (Peter)=0D
- built on PPC+KVM host (David)=0D
- removed tpm mutex cleanup (Christophe)=0D
- included Alex gdbstub patch=0D
- added R-b tags=0D
=0D
Since v1:=0D
- Converted more uses (alsaaudio, tpm, pca9552)=0D
- Reworked gdbstub (Alex)=0D
- Simplified PPC/KVM (Greg)=0D
=0D
Alex Benn=C3=A9e (1):=0D
  gdbstub: Replace GdbCmdContext with plain g_array()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  bsd-user/syscall: Replace alloca() by g_try_new()=0D
  linux-user/elfload: Replace alloca() by g_try_malloc()=0D
  linux-user/syscall: Replace alloca() by g_try_new()=0D
  linux-user/syscall: Replace alloca() by g_try_malloc()=0D
  linux-user: Replace alloca() by g_try_new() in ppoll() syscall=0D
  linux-user: Replace alloca() by g_try_malloc() in setsockopt() syscall=0D
  linux-user: Replace alloca() by g_try_malloc() in various socket=0D
    syscall=0D
  linux-user/syscall: Move code around in do_sendrecvmsg_locked()=0D
  linux-user/syscall: Replace alloca() by GLib alloc() in sendrecvmsg=0D
  audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent=0D
  backends/tpm: Replace g_alloca() by g_malloc()=0D
  gdbstub: Constify GdbCmdParseEntry=0D
  hw/misc/pca9552: Replace g_newa() by g_new()=0D
  target/ppc/kvm: Replace alloca() by g_malloc()=0D
  configure: Prohibit alloca() by using -Walloca CPPFLAG=0D
  configure: libSLiRP buildsys kludge=0D
=0D
 configure                   |   8 +=0D
 audio/alsaaudio.c           |  11 +-=0D
 backends/tpm/tpm_emulator.c |   3 +-=0D
 bsd-user/syscall.c          |   7 +-=0D
 gdbstub.c                   | 322 +++++++++++++++++-------------------=0D
 hw/misc/pca9552.c           |   2 +-=0D
 linux-user/elfload.c        |  14 +-=0D
 linux-user/syscall.c        | 137 ++++++++++-----=0D
 target/ppc/kvm.c            |   4 +-=0D
 9 files changed, 277 insertions(+), 231 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D
