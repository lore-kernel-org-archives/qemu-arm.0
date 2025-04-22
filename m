Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137006njd;
        Mon, 21 Apr 2025 22:29:59 -0700 (PDT)
X-Received: by 2002:a17:902:ce88:b0:216:410d:4c53 with SMTP id d9443c01a7336-22c5360cademr222412295ad.41.1745299798869;
        Mon, 21 Apr 2025 22:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299798; cv=none;
        d=google.com; s=arc-20240605;
        b=EQKzVCv17txXPXNnuvP+G9O2huCVc8936ORIFGGR8MH0KKvO5FtMZi4fJx9D0UtgeH
         0A76j8p5P7w0zNWqbZsB0A+9hnZkH1en11v1RYE0mEfhVi6AbaUofBVsz8IFw3knR9t8
         XaZYbCSVz4z2MqtIQkzTRMzNyoHgtaR0b2L00alcS+uMPr0Em6fKLud7WkKsISxG9jEm
         /oWLNOC0gkxujMnevCLcY3S8W3KPVgCdhGTqFkLHg/HsV+9YbsLSzN0FkXdTm/4Gu+uK
         GBCgeniAbvlFLCw70exgpOePsrORv8hL3zX83lcSUFZlZHMoAu6NzkpnpZF+pFW64HSM
         hiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=91nDVfsZm/oDTvNCG5UJidsky4wokob61rkejiRrWL8=;
        fh=pFX+btgQyA6TGMe1oOETEmRjoOUbz6VTB5ewTB2+jyo=;
        b=N2hehZEacIp5W2prWUTlXhSfiIPABe6Y73N6F0xdOJ6S87yUWOoC+1uCUeJXuNu0UE
         24pXEiXMRQhwpwfVTvTdaOie2/2UH5h+JVrwOHDovLH3CcV4j3GWk/oibh2VlYH2ZOQ/
         vJtiLl8GSi9bbHoY2NbwD9kzQHzT0q2d/QShMQxdeXrAotXY2XnYW7kodR85CXJQJLnR
         W7JlGVfhs7vJMKwv3PirPSAJH12VEQRlJYsYhBXxyuUBnUyGSH2aNjcfS133Y77cl6bl
         g2+rjG8tUGSTbi1OQlJ4WGDzgcTbszPkhY5P+Ruq+WTx6qBsnzGKl9bpGMnv539jM8qM
         CQ5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="NPo/Hd5X";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bde6casor55665845ad.7.2025.04.21.22.29.58
        (Google Transport Security);
        Mon, 21 Apr 2025 22:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="NPo/Hd5X";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299798; x=1745904598; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91nDVfsZm/oDTvNCG5UJidsky4wokob61rkejiRrWL8=;
        b=NPo/Hd5XLAtsnTR6J6VSEnC+eETyRdvh47P4AqSHDDcIeGC8otHjy+Mt6NyQAhVbfl
         B0bUmFzri3VMF1v0WrKabO6b8EnhBuI6dzDV4W5EFI3seNtN38ikdwj7J4JQOyNiIYs/
         jU/aGk17fb2k9PPYzqYd+OR0kNDdVZNjTtjLhudSbhTZ0+SokCOks5v9p1/uJK6P3xCC
         nME0oVaAuwThTwM4Rn9avDZF/deYDYDffkmwQyUewqrSurkNbgsvcciVLXy/vPRVJkTS
         lrpzxeUxUdtsP1rwhn4Um6sl4I1IRPuz7U9UQDdcMBEMETLWmZLPd2+NagkYKMl9oL0V
         Ac2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299798; x=1745904598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91nDVfsZm/oDTvNCG5UJidsky4wokob61rkejiRrWL8=;
        b=WkN62NTt2+hkGSvj6sTsdhnf0j595ZW3yWQRpfHJeZIp2x9xrE0A4kbEUh1remMiQb
         Xseidmsi08x/VafK1pl4YvFnHBnSn85ud4snqN6frtD1RZbSfMIFJZ7BBxg/Zw+Y/yDY
         SxlCrhGnrZgkF22g8j4geASoGHqQuvh/ymdUwbRXhW59b3jvqdqjJtp6rLhJ3wUYx9i1
         3/X07nEqErApf/4b3POvbdtDi/6uPotFw8HRpGzoERohnhK5T2/3DO2JkYE8uaS4Qh2e
         de9D1/Xx4EJb+g//zLdqfvOQpibP1QU3l3yu7vDXNENFi6Mw/l88l/oBUoYwBGxYmq2D
         YpZg==
X-Forwarded-Encrypted: i=1; AJvYcCVeSvX737IHVJPWHYo7rV4rbOtB0gLsdpDobviRaPeVoli+Ng33cKCL2//Y1JifZQXa5yptvhfi@linaro.org, AJvYcCX8+biEIbhP/buftTQYv26uq0W5816pxlc+8/kFBbOKD7pSOTYrNS+MQZzO7mffu04kkI9cNrEu3mq0UABF4IM0/RQ=@linaro.org, AJvYcCXKXvSjII76kj8SZfjmkk/g6ggTo6Y2bXOFEHoFqcop6kRvr8SgOpHsblujgKmTKxTrNipXVMOVxLS0toeB@linaro.org, AJvYcCXa+VhsUKHlmU4HpFKghxEUrkfuEXvWQXDkvocNiLOA5KersJB9w0a41Xvjq/4tjskw7K+kOdp667T/RjqqijkiIw==@linaro.org
X-Gm-Message-State: AOJu0YylUEAmfSG9FndTN9NJ5oYABBDfXOs0nW/e1F4i9khn14Zmhrqd
	n6j8OQhxFF83Rl0TZxP+FxD6BoNSE5II5+J9Rqshcq2xZwEVZfIn
X-Gm-Gg: ASbGnctPtUTVdlxXhSErBh8AASlmrO2APUuCa39ZVmLkaYDSh+mClDO3QugsdhdQbgi
	Fw9EXag89jabds8m8ifSpBZ2xi2gys/hKuSNhMP71zV8M3800zOZzW33TYsIFA7fSK/boe/Oeex
	dDgzsHN41MK37+XZtl+tFQazPuWuThfnDY2nh7gY5n+wx594ahf3O2ye11V4AYPKJeev6EOPQ0i
	C4JUa7aMVFqazzEqT12jEE8kY9pAr65rCaup8+B4Rf13VCsYFv3zS8KjKMJwDja3VcFZwRUyaLO
	un1Em9z9mrAUr6uLa8Bg4HQmbslpPYThsmExA/Z8wEprEhJ93i1jSEM45O0=
X-Google-Smtp-Source: AGHT+IGnrKx9om/fH6E5cqBCPzL1EC7kn1mhDUexl2Lee4iRQjz8WINSi0mIksnLRWfOJyN3waQVew==
X-Received: by 2002:a17:903:2a8e:b0:220:ca39:d453 with SMTP id d9443c01a7336-22c53583e56mr235563765ad.17.1745299798322;
        Mon, 21 Apr 2025 22:29:58 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:29:57 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 15/20] Disable options unsupported on Emscripten
Date: Tue, 22 Apr 2025 14:27:19 +0900
Message-Id: <047b22618137ad1fa0abbfa061726ba08605c4d9.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7uTCIEjTAf6A

Daemonizing and run-with aren't supported on Emscripten so disable these
flags.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 qemu-options.hx | 4 ++--
 system/vl.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

V2:
- Unified two consecutive #ifndef macros into a single condition in
  qemu-options.hx.

diff --git a/qemu-options.hx b/qemu-options.hx
index dc694a99a3..aab53bcfe8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4862,7 +4862,7 @@ SRST
     Start right away with a saved state (``loadvm`` in monitor)
 ERST
 
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(EMSCRIPTEN)
 DEF("daemonize", 0, QEMU_OPTION_daemonize, \
     "-daemonize      daemonize QEMU after initializing\n", QEMU_ARCH_ALL)
 #endif
@@ -5249,7 +5249,7 @@ HXCOMM Internal use
 DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
 DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 DEF("run-with", HAS_ARG, QEMU_OPTION_run_with,
     "-run-with [async-teardown=on|off][,chroot=dir][user=username|uid:gid]\n"
     "                Set miscellaneous QEMU process lifecycle options:\n"
diff --git a/system/vl.c b/system/vl.c
index 8d89394b45..255ea3be6b 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -766,7 +766,7 @@ static QemuOptsList qemu_smp_opts = {
     },
 };
 
-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 static QemuOptsList qemu_run_with_opts = {
     .name = "run-with",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_run_with_opts.head),
@@ -3677,7 +3677,7 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
             case QEMU_OPTION_daemonize:
                 os_set_daemonize(true);
                 break;
-- 
2.25.1
