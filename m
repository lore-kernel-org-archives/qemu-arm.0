Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679072lfb;
        Fri, 15 May 2020 10:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0yQjXc2/wU3bWUywd8E+RAc/kanzWUvbfuaOoyTAqp8H4qUYj0RDmjZ7oT/WNJ2hQct1y
X-Received: by 2002:a50:d2d1:: with SMTP id q17mr3976627edg.39.1589562508670;
        Fri, 15 May 2020 10:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562508; cv=none;
        d=google.com; s=arc-20160816;
        b=adnHOjL6ZGn8t+KapHJ846aiJmyqWeqLwIgUEKkBy+kbr4p1iI5nulIWPV5rRAT8f8
         U/TRh4hjOgSUkchK9lJfy6Q5cv8OnAbHVNBF06yXB+WaJxV8zzd5DbeJH/ehHh9uaANS
         6y1CRCCY0uGc7UQdvKoM5vUNJmQlA8M1sjiVxYNSPpaOLvRgmI8TwVhEOyEjbQ410JCP
         7t25Eg41fgsEK0ncZQoFCqiqm2qEWvCtr/B36q5e5UsyteY9/vhdS8K3H7O+MoiGG+Yy
         Wf7ZlMgG1oJMJed8eRGTZ6u0fnt2xuShPXL5hbar7YPGvg+ukEivXm6sJHjVmCnvYvit
         khNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WuX27WNv6Kn8UhBL2AA1RqIUWcivIj63B6OZkuFogSI=;
        b=VQh0qAvk+06HyisnjZbU7dM6bDVa87OWS2A3mAUluqrEVCBssE8KAqu5mUKbN/y7Et
         nwRvzr4mHcvYoyJyig9NmSL/dKhOiPN5icxDucdvve7OJ3zInB3QBNkl7B0XaQY2+Nzw
         652mgD18ynWbnjDqc0NdQqykCT9/I13mS6MA/NvLsvb3TLr7vPhRzsfx1aRq8n2my1Zg
         NQBJXMbtu9av5pI5g6fvqWDojqBMY4q06Z9b8jdFFL4RMv6pt57lQG7Ep+1djrTXE+VX
         BugVFbkFKAncrAXtKiXp0R6iaXkhNEqvakyxzlHqtJAfqNHXuvjVW+K/GcbDYv5Z5qtX
         poIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CNYb+K9u;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id gr5si1503835ejb.509.2020.05.15.10.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CNYb+K9u;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WuX27WNv6Kn8UhBL2AA1RqIUWcivIj63B6OZkuFogSI=;
	b=CNYb+K9u6q4QgCptcZ84HYvfcPRls4kVlj5A1F73pe/4lzZWyVgWGEXNcIcqK5kz1yBMHt
	E4EAn7Ffe9ltfIIQ0fr++E4sHbvTZntF9JpdzWLscHG4LtuXPW0QJgLh59V2I62QQe0Aa4
	yhQ3tsKy/5HshWLP2slI1QLZfyYk0Lk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-sDY71yCsNGuTrlYkwYoIPw-1; Fri, 15 May 2020 13:08:25 -0400
X-MC-Unique: sDY71yCsNGuTrlYkwYoIPw-1
Received: by mail-wm1-f69.google.com with SMTP id a206so1259732wmh.6
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WuX27WNv6Kn8UhBL2AA1RqIUWcivIj63B6OZkuFogSI=;
        b=Qvxxseb//HPPtIPSv8u83dPwJ0Jb9xPwMlGLKsw/ID5oFdbQAjTo8JyzNNIV4r3pdY
         9rL1kZLXETX3MPFXLV8Nqk37nGUzM5C3eppNGFrAhnReJj45CNWIs31KBJ4BSwLfohn2
         aqTAjh4F/PoA0UuU8MaEuKMYIw3+A08Rw9fNyaCseRezuKOTJERL5K3T78d4/L+GiHCi
         bPAgje3GCWf7TTlBTI8ln+8mpsbGVm9zeCHbqpIKAQ2QY03N8dwDqIobdMwoWUYMCfge
         O5FF3PfZQ6syjHYs4r+317S93Ose9Wy3uJ15VScaSX710UeB9Az5upcWBcdqFXbnp86C
         2TYA==
X-Gm-Message-State: AOAM533ZiSL9A1w/Cd2mA91RmrDYLzauOCmKTk2VUGyGUxSzIi+Cm0b2
	Kcji9rcEWMRbBs2Q7oMML4S7JVtFuQ31HnSPJITxhX7UbnFpgzSvFjSDznKtMaWDMIDvm1ISqFm
	AsE9x08h3U384sEaZ
X-Received: by 2002:a05:600c:2041:: with SMTP id p1mr5373983wmg.152.1589562504034;
        Fri, 15 May 2020 10:08:24 -0700 (PDT)
X-Received: by 2002:a05:600c:2041:: with SMTP id p1mr5373962wmg.152.1589562503876;
        Fri, 15 May 2020 10:08:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id 5sm4554811wmd.19.2020.05.15.10.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>,
	Vincent Palatin <vpalatin@chromium.org>,
	Yu Ning <yu.ning@intel.com>,
	Tao Wu <lepton@google.com>,
	haxm-team@intel.com,
	Colin Xu <colin.xu@intel.com>,
	Hang Yuan <hang.yuan@intel.com>,
	David Chou <david.j.chou@intel.com>,
	Wenchao Wang <wenchao.wang@intel.com>
Subject: [PATCH v2 03/10] MAINTAINERS: Add an entry for the HAX accelerator
Date: Fri, 15 May 2020 19:07:57 +0200
Message-Id: <20200515170804.5707-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 6CatnLmE/kno

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Sergio Andres Gomez Del Real <sergio.g.delreal@gmail.com>
Cc: Vincent Palatin <vpalatin@chromium.org>
Cc: Yu Ning <yu.ning@intel.com>
Cc: Tao Wu <lepton@google.com>
Cc: haxm-team@intel.com
Cc: Colin Xu <colin.xu@intel.com>
Cc: Hang Yuan <hang.yuan@intel.com>
Cc: David Chou <david.j.chou@intel.com>
Cc: Wenchao Wang <wenchao.wang@intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 659092eb43..5172e9a734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -424,6 +424,12 @@ S: Maintained
 F: include/sysemu/accel.h
 F: accel/stubs/Makefile.objs
 
+HAX Accelerator
+S: Orphan
+F: accel/stubs/hax-stub.c
+F: target/i386/hax-all.c
+F: include/sysemu/hax.h
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3
