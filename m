Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1887810lfb;
        Thu, 21 May 2020 12:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLlF2yXuI1CYzn/Z2It5KowHNcK1TRGO+z6vmtI6U9ILxkE8VrB4cx0sBNDw+EBqMPZ7y5
X-Received: by 2002:a17:906:1cc6:: with SMTP id i6mr4951582ejh.552.1590091167926;
        Thu, 21 May 2020 12:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091167; cv=none;
        d=google.com; s=arc-20160816;
        b=koHctEakd5KAMYj+P6Qqbg1fGwzFpL31B9KpOk7j+wMtYHzN6q37jNTXyuJpfiZeMH
         5t1UPG7ozjvU3QNAHW3W0rhHw44+m9taD5yWwr9Dy010cL32PP2JZXLn+gra443+87hr
         FrIGaS8RLuHMf2Ca6SGVXXu/eyqlVZZrCU0ZTGNLYu3quSSl9dJzfofg6EE9sbMjkmEd
         4Y/bKYMLWm218U07bi5LQS8FB/4BlZAXpKl+z/hBgx6wbBTKC2lMGqv65tsxgzG3kZ0j
         tYymm8COv+obwXJAhVVOAWnur+vb/m0yexQiagwlbjNJOQnMWpBiNGYmba9sFEmQpRzj
         1Qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6PeCmJfD6OD51fUU+hNrH7vrDwGGc2lOMQ5vq5LtNDI=;
        b=XzdJlYpN5zOSw8NlT6r3oRTjdoU0biiBjE1qe7H4bxOBbzTX0hdgQqPOuvcqoz8tHh
         Oc9/1d/c29yQco2intkwnQ9RbU6iT7k7NsjL+wk0q+wMVBeGjNyTutAZvc3dPsn4W43p
         qhbhxkZ6rmNiDDijS2CgxZ/jCRvf49AimAJ0SDXVHpirVR9S72GdnR4p+a4vGNpOtnAM
         wlfUZ4OkltHN6lycQu6YHxbFbIbpE1qZC55hi6knA2R58F+v1WDc61p+Zd6ha1mnD2v/
         PWqmGaSFLe+3A1doaD3FDxbTGQ2MT8Vad7zOMW6dgfPTYJ2yG83JK9rNLr9HvoTwgEu4
         7f4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8c5+ZUU;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id ce6si3633863edb.379.2020.05.21.12.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P8c5+ZUU;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PeCmJfD6OD51fUU+hNrH7vrDwGGc2lOMQ5vq5LtNDI=;
	b=P8c5+ZUU6r8J+ROGnkbHfTqpmV2fvMIqJoSWoMQtx1Sze0bM6/H/kEw0HFJeMqIGX9xqoD
	SXUiWr0huwdc3nkYB2oIcVdLDI1vDNeEjQR6SVhIPMZwJYXAnVjBNMcKTEjjOH30267DTX
	o6qTqNsQQEF2v0Ivfn9IhguTl39Hrrk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-JiQ5sNr_MNimrub6w3xaCw-1; Thu, 21 May 2020 15:59:21 -0400
X-MC-Unique: JiQ5sNr_MNimrub6w3xaCw-1
Received: by mail-wm1-f72.google.com with SMTP id v23so2151588wmj.0
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PeCmJfD6OD51fUU+hNrH7vrDwGGc2lOMQ5vq5LtNDI=;
        b=ppMQ7q0OlsjXG/bVyeWP5r3nDiqSJDpbz/AwymbkcyhOcQnyk8mU76oxz2mvMr+dMU
         Sd9tN2vVuxnHPeKEPk7dybX9IZXYy4cn6c/qHZR69WQ2gu71A3QmmgY8YK20IiS2NVfI
         czFSdZr9iRnO4gUo/MSRlUmC+WyAuv8qaGZrbxs8lnWl+S/dVWiW+9n9iA4bXDsnn1fN
         3whrTqzfFQD5weQdJhHtyCyPg+H5DQCkGjPWWLXcIresDjwAAZMQ/3FJw8mFqjCncQbZ
         sx5hW315p3hbBlyL3DULbHil2dVwT92Yn/XpamizZyZBmZXZoE450883fnP80EL9roJo
         H9Jw==
X-Gm-Message-State: AOAM531xASDYyvP8IjUFPUIIVeIKhtZB9b11riy9UNIqStTtzoZbM3K5
	GLViGjmSI2gDoeB4sELR9Rmp4dQX9kBuQw72yDExr5DA993jQYqgLaHAggNlCiODC1r73Wlink0
	u9PG1E4ckGeiJWXje
X-Received: by 2002:adf:e688:: with SMTP id r8mr219328wrm.274.1590091160089;
        Thu, 21 May 2020 12:59:20 -0700 (PDT)
X-Received: by 2002:adf:e688:: with SMTP id r8mr219312wrm.274.1590091159920;
        Thu, 21 May 2020 12:59:19 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id b14sm8111464wmb.18.2020.05.21.12.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/11] MAINTAINERS: Fix KVM path expansion glob
Date: Thu, 21 May 2020 21:59:01 +0200
Message-Id: <20200521195911.19685-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: OW5v/4BKOBCd

The KVM files has been moved from target-ARCH to the target/ARCH/
folder in commit fcf5ef2a. Fix the pathname expansion.

Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87a412c229..eebdcc6aa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -361,7 +361,7 @@ Overall KVM CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
-F: */kvm.*
+F: */*/kvm*
 F: accel/kvm/
 F: accel/stubs/kvm-stub.c
 F: include/hw/kvm/
-- 
2.21.3
