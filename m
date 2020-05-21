Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1887846lfb;
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHO7tk2eboJv5xw7/gJYRKT6iSGdfLvaVw7mv/Dg0Qrt18z7nNfcEPiBegHg+Du5LFzO7a
X-Received: by 2002:a25:738e:: with SMTP id o136mr18870150ybc.14.1590091170542;
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091170; cv=none;
        d=google.com; s=arc-20160816;
        b=MJoT4pjChNHoN2ZQX20pbSXovLBDIREq2f8OUru016RmWE4zdm+8M4mUAP73BrOVXw
         EJp1oJkOreqxvOv2jlzrGxww/0R9zDQeW8bvbTZJkzuF9wUoicYlYewHyMyuB3FczT0H
         hyU4Nswbhc/Tub9cAjLbY31ms0IRzi0H4kUm966Y5JukcbFgczjWwQhpkdHupUlI2iyv
         E6hY/d/q/gThuzG+sdfmhL1rBpn8l+RabEY33riY6FDEJ01aQ1/pMbLmTbI2ughoPDOq
         78XhMYxkwBY+LpGY3L81bTfPg1ZZePOQqWfiAm/M0SaidJJasceLDoNH7LqSx+9c638q
         b7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QUH1OFbHNzJeZmlQ3HgF3hr2B5jV9dvRYR22rsqFyDE=;
        b=CvgzGfvatkdhHDsNWgvF+ea7DFtXJLNwssoAZZ0GJGqu9oxhYIrvNwZkaZRIzuBHq8
         g9SlV/r0007diqKjJrhoFKljl8E5NGZrzvPAyLx/ewi9bOW7T3jv6w7z7fC/RD3BCz7Y
         Ah1UYZnGUMNZgrmVCXD5CBTGBM4FQCxR8f0on0mwIs/AuaO/pmh7s4nrFIDHc3+60tFM
         OC6pFIJGfxmIZAj6zlgGwJu1DQCFYgXrbyHa+LsUMRt85MvPaTO2bKrzvm5wv1hdyge0
         tD5UKdCVkkKOlfM7ZDiOR3Pc/IpTLqq8p3VUD51W2jgQga+BPlraYqkKBlQJAlO15QNx
         yznw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+p6UDX5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id f12si6019841ybj.203.2020.05.21.12.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+p6UDX5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUH1OFbHNzJeZmlQ3HgF3hr2B5jV9dvRYR22rsqFyDE=;
	b=g+p6UDX5YEpuAnQA/td6YkuJy+lUvWlqZZTE1FoAGJzI/1Tper8YvthCijYWzaAxvyT1yX
	5fnPJWVQnR9u3G3UHlUt6EMq0OsTSbjVJh7InMyfKPZcqlaQU5rgQxgWcNZhLOUdeoP58M
	cj4mWXZa2cAsdRqTJWToRTKZ3oyqu1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-fWP0r-fpNLiIVB3p-5eQCQ-1; Thu, 21 May 2020 15:59:26 -0400
X-MC-Unique: fWP0r-fpNLiIVB3p-5eQCQ-1
Received: by mail-wr1-f69.google.com with SMTP id p8so3361611wrj.5
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUH1OFbHNzJeZmlQ3HgF3hr2B5jV9dvRYR22rsqFyDE=;
        b=RJfkVeUmHpbyllKhBR9ev8BY7dXv75VdtPdS2SMBZylGiitbKwmk6fmGrL/xhOTebI
         IJa+MVYQFjvhpmOW5ndYHJ1730BkYvqIDxDg2porWyH6WyLGElyvRhHDZ3oY6LdJ8k/h
         d9zoVS0WN0tFb4IPNUkpX0sg8C/BdQCmL9ima28ER2oa/Dq+PwvRYY4ykSpkqbKOm7UY
         NtytWV5WRItN6z3N5ZmzIwHVyJ9XprUSxgUb97SG/FyGcHQ2IMowhsjgs4WOcYrX4YDp
         c9R24ERja4Y8LMuBrZJQ0TD1iybc1MSKtPktKufyrAZAuQ/jzfb+7Ym+Ktow2sOZl01/
         UZuA==
X-Gm-Message-State: AOAM532kCqMBz9seGO8ZcsEsfuCEtGID+ZpDFXIeL9q80VIZ1yV1tE58
	zD/f8ZkgCWLe642+I13GaLObYN6e0LRQPcySEpUDlr96SDa94aU1nZim2AuXk9jfwW3Ktui8C6e
	BshVgD0cq0XqN4BQt
X-Received: by 2002:a5d:480a:: with SMTP id l10mr218929wrq.318.1590091165275;
        Thu, 21 May 2020 12:59:25 -0700 (PDT)
X-Received: by 2002:a5d:480a:: with SMTP id l10mr218905wrq.318.1590091165117;
        Thu, 21 May 2020 12:59:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id s11sm7405424wrp.79.2020.05.21.12.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:24 -0700 (PDT)
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
Subject: [PATCH v3 02/11] MAINTAINERS: Add an 'overall' entry for accelerators
Date: Thu, 21 May 2020 21:59:02 +0200
Message-Id: <20200521195911.19685-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: yqX4bUpEhTqs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>

v2: Cover accel/accel.c & accel/Makefile.objs (thuth)
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eebdcc6aa9..d7b98f9878 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -415,6 +415,17 @@ S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
 
+Guest CPU Cores (other accelerators)
+------------------------------------
+Overall
+M: Richard Henderson <rth@twiddle.net>
+R: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: include/sysemu/accel.h
+F: accel/accel.c
+F: accel/Makefile.objs
+F: accel/stubs/Makefile.objs
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3
