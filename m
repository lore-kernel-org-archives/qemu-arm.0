Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783902njd;
        Sun, 27 Apr 2025 23:41:39 -0700 (PDT)
X-Received: by 2002:a17:903:244f:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22dc6a879bamr106374015ad.49.1745822499583;
        Sun, 27 Apr 2025 23:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822499; cv=none;
        d=google.com; s=arc-20240605;
        b=fAMTysHgNg46vguydFfh2LYVlrPqzO6kYMHWu/6t5vQNC29lB63J5bbXAJGWu7FoRr
         mc4d4Rn8jOf7FvLC+7OS5n69lfVjMzk7CStTjojpPbUmsJJ0Z/RBHMgO/UaXYsD8Yubn
         SM0oqluvn09CUxRVEdz+uMjqIpHXrf/LpLc0r9zvuc814rFzjxEO/yn0pnH+MS3LlLLj
         TVSoDmky9VhWKhbi/L7Jsh1NfVK2U6b0u4LCYl3Gm1XrIYBWuh9ObiESb14sRDfH6HBz
         Z6XsOvaQoUTGTJqacI9xtR5KG2rx1yC/F7OWUDhlD0CZxjrziM6MrhouXntX/qCb8rcA
         ukQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R6jPsS98l2HtImWR7826BuhFjQUnhmK1pGYGyF3oAgs=;
        fh=37KpcqtTuseFE7FOP0LjWRcIeSo6zzgUSCtNRg+R2Vg=;
        b=dt4k1lJeoMC4qP7OuxDkIb0y3a3Slz/Qa/Yu8EafFPL9VRK63hA06EbS/3TiTzN0V7
         x27jkSQxMw1N3mA8I2EnVXlqP4CzbuyR/QrPr5YfVmUyCcBW+KeSRqoBpC0ZGgABNnNx
         uqvOHjM73rxpCX53ZoqQyEWfCLELGCHM0QUmcfMGW/vS3csAWmIPf5P1XqKYyBxRyQ5q
         NoN2Q538YXoO/F/ht3VAxJ8MNAi5pZqBtmsNRYzTH8rzCGC01cTpfrcQSj/dWImD6+ri
         tnmf4cACbq9VqHrYwt0nWaFLD+s4GipKu2A/lDIVR7gaZuwHinLVPASWLvDFgl4y0qhl
         YX3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kjUKR781;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4f19128sor69407955ad.9.2025.04.27.23.41.39
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kjUKR781;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822499; x=1746427299; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6jPsS98l2HtImWR7826BuhFjQUnhmK1pGYGyF3oAgs=;
        b=kjUKR781T1/lKIWc2CxcQ9cnRdk7kToDwfLmQG1gFH6aIAUIAgE/c6oKQ5A/GKMWoz
         ucOtxZUdxRWdmNCpXnVZeZ9nggBa0xF9pS4AIbr28a/wMYaHbkrPegOv63aaDdV7eZ4K
         U/z0wFq0tIgPCoR7EQAJN0it52m+7842jU3bZJm9gmKmW2xR2pX5k3uflZtbczeT07u2
         0xxX5mJCaM01Ohsg0KSKrWtW+gOU8C7y7oJtqu5D6zNvDZ29CGHi04wUiTbevULc7GC3
         nYIYCiTo6h4RMu41KwoJG/rW5a36SCgEEo766JdZS/SZnI5qxaw0DLUrRe31ObU7JWAd
         achw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822499; x=1746427299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6jPsS98l2HtImWR7826BuhFjQUnhmK1pGYGyF3oAgs=;
        b=SyhHI2lZXnyLC6X1jN66y6Jzxs59ynA44VeR8SLs0w6vz9fDHUfK3SvxIXIi117Ahk
         FAeGRlyyNB0HVJkzseM8Wp0piMTLa+dThPNa6BtOU3J8+6GYKG0JVN4fqEgyBVvTr66d
         6g/5WkwbOoEVmZf/P8a5bttywg1FOVpAYqtOVB01/cZSf7TJ7W9drbzj8jzTa0Rk7Oyl
         nDehVAgmS1+Sa85QyANuuuUJsybA7osNRjtZERVOmjZQ4Xgl2k432IerhEl5KQNYbjwn
         8CyvzKz9PhwGNwPn1z534+eWQsbBMoFDsX8H30lPqAf13y27FhO1VkzXtB06zN5rD2jZ
         I01w==
X-Forwarded-Encrypted: i=1; AJvYcCU1i7knH06BzvfHNNdevxXbEJB9pWIzyjnDLmVTRjJWgfVz53/mzvOutoVHejEp1pVuZNEYc8hhZYrCp/LvteEIKTM=@linaro.org, AJvYcCVB7c6e48ucpqlE3LLhV3PXE/D8YMiUrv/aVIIeyL/nDVQ0RIRcrZ2hIO2wsthQVGHsZ1RpT3yQN5K47GZp@linaro.org, AJvYcCXOFIeZsqPCyfj2feN0qYSFeqanTGdZysju3bu815Xz3yLddosdFgBCAUF4d7AZiUKZZ/eoYC1xxpG1BOlQB/f6Xg==@linaro.org, AJvYcCXaBnhlE6i0XpAuheNoex50OLO7CgjfwggslqpnxuDavrAnNV2ajc91usO461gecVO/O5nJEkuV@linaro.org
X-Gm-Message-State: AOJu0YwNkWGwPGTnWqZ+a7Lm2BgFF1+rJ4wRgIGAP2s7q3lNcVh9Fg6p
	UzaWckJ7KsfyvYqFcz5QTkACU3uTB/Pm9LnV7ua9OI1eaNDHS6WI
X-Gm-Gg: ASbGnct0Vf2ijbevDgAfXLpcmIChuIAhjYSovA5s4zmV8k2TAdhvri+1AjBOsLbTqKs
	AmmJYgiDLS51pJPEEuIZJpmuHeHDA9lpCfTio2f9WcA9x7j1AVQfIR3uWfMHryfOZ8eK7hNrxPh
	08F/MkZ+ap0Kdwpe4wTLav+KPi5MkmZOByYbwCIvsSd6HmMZr+N9tWFYYmT6Bmf95lt9IK0v2/u
	YVxhT6SGLX3gUiR5jotuTtjr0w5KVObisyCUnXciD9ZPbYz2IPFg998nFEpqGi3IRuq8rf2GjEf
	W44kc9jtJAgbbo/dZGPEr5FRnwDiHQVTpgxYzlNJxk0jHjMi
X-Google-Smtp-Source: AGHT+IFym8WIhNXoi7lOBk7iZe8tENzgr80vvYR/vFUOQ5RBVCxatIPLGd35xL14OlH/qqt4/RwAIQ==
X-Received: by 2002:a17:902:ec89:b0:224:1ef:1e00 with SMTP id d9443c01a7336-22dc6a0495cmr126482915ad.19.1745822498370;
        Sun, 27 Apr 2025 23:41:38 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:37 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
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
Subject: [PATCH v3 15/20] Disable options unsupported on Emscripten
Date: Mon, 28 Apr 2025 15:39:04 +0900
Message-ID: <79c5e591b634762703f3eef6427a192d145799e4.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mcds8ZWKVnZu

Daemonizing and run-with aren't supported on Emscripten so disable these
flags.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qemu-options.hx | 4 ++--
 system/vl.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 4ab2001df7..30c6385b7a 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -767,7 +767,7 @@ static QemuOptsList qemu_smp_opts = {
     },
 };
 
-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 static QemuOptsList qemu_run_with_opts = {
     .name = "run-with",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_run_with_opts.head),
@@ -3678,7 +3678,7 @@ void qemu_init(int argc, char **argv)
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
-#if defined(CONFIG_POSIX)
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
             case QEMU_OPTION_daemonize:
                 os_set_daemonize(true);
                 break;
-- 
2.43.0
