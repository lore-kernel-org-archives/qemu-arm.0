Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888267lfb;
        Thu, 21 May 2020 13:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC3R/s1yKx7n2qcVQTJo+kX5ibLTzMvj02C0xX5hYWeStx0LV75ObC0LsEwjqQLoG9ZShf
X-Received: by 2002:a17:906:cd08:: with SMTP id oz8mr5543697ejb.90.1590091206822;
        Thu, 21 May 2020 13:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091206; cv=none;
        d=google.com; s=arc-20160816;
        b=JS/TKWj5kJIvtKt8KNF7rFD+EXTfpJMbDS6de6qgK+lunkWavvQfQoE7gKpZP+Wsf0
         HYZDWuWGIkEyIN9IW98v5zkWejxD5uHjpd0SwbiqqmNXEQdQtxl0PjBzdQK5P4Gr5Rmk
         CxfBRQshxKx/4/q9Rj5HXfB62DGR3c/jIgcxIJ3o54Y9KG5Jh0hJL7ZE9yg+Adi+Bx0I
         zJHl5gACwaIutDnBWdJLSpY1SiwoynHXNBbZqzy46c5Dx4U01kgtzK49Lfwn1nds3AaB
         KOYhgjotuo0a+QjDf3lp7EiMPaNPeLrNz6+1Eyh/wJv0Bp5AT2oiC+GUMU+nSgOXPInG
         F/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uCqDKoDbHDQzikos0o2LjEgWBMdVhgQLRqeJNp7F0OE=;
        b=ztGHV7uOhkNY8s/gobBnQ0O7k2WIPwJFQEcrjriMPhkKdd0RAFQN5zgDlMoW/gfyiF
         YGeBQU9R6CoeF5+skIfjmKciYPGCqUZr9t1qg/K7Zf6JnngeVjTKpdKfcQYDvpMhSLnw
         RCthZrZGo2/ydYyldl+5gNQWk3Qm/91hCqExdYYdEt44nWIUZb76PRWMgyJd+bOmMzxG
         BlNbRz5LsNPJtlu03BdRHQZZJRgiUlH+xJjDKQv9hE7v9Y7BNabqP6ae9aKlM39uxk2Q
         LAcNRiabe5O7YgFJTaJErRlgUuCnOmgx1VFD+ryt5su+V3ItMcCHQp9MNk+NHltV1EMe
         w65Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Igl+592c;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d6si4187311ejr.157.2020.05.21.13.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 13:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Igl+592c;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCqDKoDbHDQzikos0o2LjEgWBMdVhgQLRqeJNp7F0OE=;
	b=Igl+592cCZi5xZTbaimnn82OFX526X7EmIlrCj6L79afLwTJTLjK33TM1rlwMnjEMXwiOb
	OKbwsoN/KE/ld+6QJT7F2fxcK7xi7cweU8B7nrS12h79nfaXeM3v4qFTR8qQ1fVXQQW8dg
	RTgEQYI3CgN6PO26DK9qWGYImjt8rOA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-LKxs32K8Nv-YbpvKnywHYQ-1; Thu, 21 May 2020 16:00:04 -0400
X-MC-Unique: LKxs32K8Nv-YbpvKnywHYQ-1
Received: by mail-wr1-f69.google.com with SMTP id y7so3347471wrd.12
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 13:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCqDKoDbHDQzikos0o2LjEgWBMdVhgQLRqeJNp7F0OE=;
        b=I70CRU0hh4xrwYvFI61aZzcyb+t7EWptj92JKIwEKllcO86vnjgCsZ+jc3jWZCvYTY
         eOdkOOPuqmOrtjw5ufZZhjWvMJ/Kq2Mt9V45l/WBIXQuWI7AT95fV9PpH6aJNvNZiFkV
         rkOM6dt1Za5gvIv84xAjLgA+rsmjhA10+a6GUBoWgMHIMsVSjV0BtVMT5De3p+sgk30Y
         04k/GBNenr1xPlRxXE268is0b1hoWhXFs3fF+k/d0LmN+QOF2Z3UnpaA0ePu0zsLbHL5
         jG18rzqabaT69NHfpMQSnnQ0grWfaPgZtoeauvY87UZ8JLjeLDwF32bQo8zgrbneIw9a
         0TQQ==
X-Gm-Message-State: AOAM532pb3zGInTXeC6675m5CzuKBwHz9OB7jvxdNAAXlRC7mVkFboO7
	0RhBM+YntTN5WmWeZP6cTYAJbqamC+giSFQ2bOnn8B4442UaIvmZ8YCFECgCVzw8lgrHEGL/aV4
	yH5tmeQNWdm9s9lfl
X-Received: by 2002:a7b:c205:: with SMTP id x5mr10741391wmi.135.1590091203065;
        Thu, 21 May 2020 13:00:03 -0700 (PDT)
X-Received: by 2002:a7b:c205:: with SMTP id x5mr10741378wmi.135.1590091202739;
        Thu, 21 May 2020 13:00:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id h27sm8466721wrc.46.2020.05.21.13.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 13:00:02 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 09/11] rules.mak: Add base-arch() rule
Date: Thu, 21 May 2020 21:59:09 +0200
Message-Id: <20200521195911.19685-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 2DK64mkHe3Zx

Add a rule to return the base architecture for a QEMU target.

The current list of TARGET_BASE_ARCH is:

  $ git grep  TARGET_BASE_ARCH configure
  configure:7785:TARGET_BASE_ARCH=""
  configure:7795:    TARGET_BASE_ARCH=i386
  configure:7813:    TARGET_BASE_ARCH=arm
  configure:7846:    TARGET_BASE_ARCH=mips
  configure:7854:    TARGET_BASE_ARCH=mips
  configure:7864:    TARGET_BASE_ARCH=openrisc
  configure:7871:    TARGET_BASE_ARCH=ppc
  configure:7879:    TARGET_BASE_ARCH=ppc
  configure:7887:    TARGET_BASE_ARCH=ppc
  configure:7894:    TARGET_BASE_ARCH=riscv
  configure:7900:    TARGET_BASE_ARCH=riscv
  configure:7920:    TARGET_BASE_ARCH=sparc
  configure:7925:    TARGET_BASE_ARCH=sparc

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 rules.mak | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rules.mak b/rules.mak
index 694865b63e..55810d0cd6 100644
--- a/rules.mak
+++ b/rules.mak
@@ -438,3 +438,19 @@ atomic = $(eval $1: $(call sentinel,$1) ; @:) \
 
 print-%:
 	@echo '$*=$($*)'
+
+# base-arch
+# Usage: $(call base-arch, target)
+#
+# @target: the target architecture.
+#
+# This macro will return the base architecture for a target.
+#
+# As example, $(call base-arch, aarch64) returns 'arm'.
+base-arch = $(subst $(SPACE),,\
+		$(if $(findstring mips,$1),mips,\
+		$(if $(findstring ppc,$1),ppc,\
+		$(if $(findstring risc,$1),risc,\
+		$(if $(findstring sparc,$1),sparc,\
+		$(if $(findstring x86,$1),i386,\
+		$(if $(findstring aarch64,$1),arm,$1)))))))
-- 
2.21.3
