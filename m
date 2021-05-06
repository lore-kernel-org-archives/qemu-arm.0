Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1271713lfg;
        Thu, 6 May 2021 06:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz13uSTKTXNhQCpxVxHLDc/eXu6+0IDF7XSIUxXcx4bGOL6wZWy+XvgaLMAdO5n1MCCZ1S4
X-Received: by 2002:a05:6402:1914:: with SMTP id e20mr5227263edz.70.1620308284407;
        Thu, 06 May 2021 06:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308284; cv=none;
        d=google.com; s=arc-20160816;
        b=DoteNugvblPbmIHo6IMmUX0cwS5ZDz06U/+nTJ0GxLKkTlG/wzMIOCaG2CDR2+PuyO
         GnZKdcMKINOTor9r0MyptruRW/6aTsb4G9ALJtJDzYIcaN29mMNJ+KPwdVeGoxKK4YE3
         tvZZsguH5wQ/Q9CPh6if7dpmSm1j+Zqe0ehsquO38voGvxmftM0iEHbwPvct0Hx2AAFP
         CCh5bh1/vwu46n+aVDxqct+tjcjwfzaP7FMfM8HIznA9SW89zqQ8DI+kkvj87M/9j4Bt
         BBMe9b8PdH2QLIV/r5roDEExgdbzogkz8Bq5aYVXzYv9+2Ei9aHsRnKKn9yiRqPGae0U
         cVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=b4Q72tFbNM9A6AWHThcqfXNXd+FnyR9FkzuxJZtvue4=;
        b=ToXusuHHdi6BE/ifNloVQcdn2OMMdfubL4cCfaoODrRBmkOP29ljNN8OZBb2V4vXcu
         EMOouXVOFlWWYBDTTKmjIsdFR44QvRz3tigxIPN2MOsERJgh93xUPnctRKX8Kl9aCYXX
         U7NIhPlKPs8EMMhZjlwWQorLJoJ5/Wdd3A1Fpr2rHPQh2l4XS1w6LK8Z4KG31CBrRLiF
         aahqdX37QZVK3eb42Tx+ByXlysfORwrfC97U7xNbGTk6FkwJJe2+snkNjz1V+JdViY2D
         2eyTaLExCyK+eS3ga1gJK7Ux1DTlBmx2GTffg8XQIe6uv8yhtHtU1QK+hHxLtp6/1xYZ
         Iu2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEz+Jp84;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id jo9si2348793ejb.552.2021.05.06.06.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEz+Jp84;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b4Q72tFbNM9A6AWHThcqfXNXd+FnyR9FkzuxJZtvue4=;
	b=QEz+Jp84/yYicppmkXTj9lAnHYmfwv/SDriSRAIsnt2VIkjp6MR9IfAt5rXJ2HKowCuF/l
	uBHLUnE75+xWJPfhC1bnZRGJ/bi276jbeWipD46jtWm6hDzhsz9OZbOUkwR9hXk60scCrO
	x5G91SJncsMneH8J6lkmYRuGtW3tue4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-MarB8rTFMlK6x9dTjomm3w-1; Thu, 06 May 2021 09:38:01 -0400
X-MC-Unique: MarB8rTFMlK6x9dTjomm3w-1
Received: by mail-wm1-f69.google.com with SMTP id j3-20020a1c55030000b029012e7c06101aso1008863wmb.5
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vbCDEC95SLEC7NvBUhks/P3w4WBw9RAigT+kNtWZnU0=;
        b=Mkw20MDBiWOHMVaudRtujoMyL3Vbz54pGsXR+Q+ibqcUlxvwKPvPYAqVWv+saZM4Gj
         ka3B1pNiM5HhQkoMuw5iY2Xr19h7DTzKjZLHtpgCjqHxX6F4n72yepbWyvIyQtKZROYh
         aCR/sdAvh07DVJSNg7IbFofo1C2E1rm56FZ0wNTqH7QiRSjl+4VlcZPcpZ/6xsqJcWUF
         nkIXAdeyL3378gvz07HgN2QlHT4HE3D9BpGJeh+fMROpzfZtDh7LeVJhvRDvTaZUuINc
         xBdWhs/SF1KuGNn5s0+EcQdgfSMhbv8kqYelP+czaA7r9vD/6LP+VdFfivxbJ2Rmogdy
         zBbg==
X-Gm-Message-State: AOAM5326OQQIMtt3y9iSucWw7dxrtj9B979bRHJjmxbUckY24bJfRJdB
	ccNZpWB2AdJBiCiaghnNALyNq6VjxB9lxDv4AOC6Zw7SeuP94qKDYnDLIJWxmkWdqCi0I+c2kTK
	NCJAKgLbAr8XLF21Y
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5160050wrq.103.1620308280249;
        Thu, 06 May 2021 06:38:00 -0700 (PDT)
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5160036wrq.103.1620308280136;
        Thu, 06 May 2021 06:38:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id e8sm4414680wrt.30.2021.05.06.06.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:37:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
Date: Thu,  6 May 2021 15:37:49 +0200
Message-Id: <20210506133758.1749233-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aZwHynVc/FbH

The ALLOCA(3) man-page mentions its "use is discouraged".=0D
Replace few calls by equivalent GLib malloc().=0D
=0D
Last call site is linux-user/.=0D
=0D
Since v1:=0D
- Converted more uses (alsaaudio, tpm, pca9552)=0D
- Reworked gdbstub (Alex)=0D
- Simplified PPC/KVM (Greg)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  audio/alsaaudio: Replace ALSA alloca() by malloc() equivalent=0D
  backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD=0D
  backends/tpm: Replace g_alloca() by g_malloc()=0D
  bsd-user/syscall: Replace alloca() by g_new()=0D
  gdbstub: Constify GdbCmdParseEntry=0D
  gdbstub: Only call cmd_parse_params() with non-NULL command schema=0D
  gdbstub: Replace alloca() + memset(0) by g_new0()=0D
  hw/misc/pca9552: Replace g_newa() by g_new()=0D
  target/ppc/kvm: Replace alloca() by g_malloc()=0D
=0D
 audio/alsaaudio.c           | 11 +++++++----=0D
 backends/tpm/tpm_emulator.c | 35 +++++++++++++++--------------------=0D
 bsd-user/syscall.c          |  3 +--=0D
 gdbstub.c                   | 34 +++++++++++++++-------------------=0D
 hw/misc/pca9552.c           |  2 +-=0D
 target/ppc/kvm.c            |  3 +--=0D
 6 files changed, 40 insertions(+), 48 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D
