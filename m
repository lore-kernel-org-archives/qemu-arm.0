Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179392njc;
        Wed, 16 Apr 2025 01:16:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:d498:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-203b3813245mr1337049637.0.1744791411970;
        Wed, 16 Apr 2025 01:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791411; cv=none;
        d=google.com; s=arc-20240605;
        b=OwTW/wtKZDRQSFm48uOc9fJ3t/bkx1TS1SKotxOqRHtOnBMS/ANWPQS2KEp6u7Nau3
         HZ2sBHkaWbFtoTR7kwtAO0kmcbzatXZEjS2ZIgH62obmtJhrgO3N1WytxiLah8wwRTNI
         eSyVrCE0g0FXzVBeZQmcrmwqlXUfC1ge/sC9ui/2ac/EAqDs35lpzQZiI8KmwuQYozix
         O0/iqqhfvAI0RZab0pRKsQuULXzPz+agOW93PiQLznhsEvTVxrSJcPaw+fJ/aDw/9qok
         8lqL3Q6MprpZWVG7cMRlLzPp5SOFF0TSOYrfU1m08aifxECUKPjcmSuFhxc2yAzgQwnM
         yEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c4klZ5LCWvRR7sigiHEe5f8QPHEXneqpNeiJtQ0wxIk=;
        fh=Rv1amNyz4yAFMzPGs11zYVXaOcUeuye2XowbgTEE6fA=;
        b=LZkwXT2BioPszSqnO8pHa928rg972MhJujN1hgOxKr8CNmiHD3VxjTgOsdcmrZ4FvP
         4BPbT4Uin9ZIydiCSkD5X83Pa5WU3xte/jkMx/ylqrEfM97ToncccsHRzbBFG/x2uqPm
         BF5/l0vobmKKbogKahFs8tUuL+2XItActHfvc2RNkgFdRCn/r4zrytdPpOK7eln2fqNu
         tEtWri8bD5XSCHHZTXt2P2+OeulOjM6XxXpQQTUhSJcTH4qmZh/W5m8Ikwjslo9tgN2e
         00GAl4s2MYH0YUKJuQZzArMEXIiEC/DuhvNApwGwtxBLT6+nJMVaXuRZCjzp5mEVjwUv
         pREA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJBGaRYF;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73c224e875csor629958b3a.3.2025.04.16.01.16.51
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJBGaRYF;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791411; x=1745396211; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4klZ5LCWvRR7sigiHEe5f8QPHEXneqpNeiJtQ0wxIk=;
        b=XJBGaRYFTBa7LWw6dQbHle+fa8zRLlp6zlPVWTr7ZjPxolrrVbT4+DSExH9tPehy2p
         /Q4eGOTjsXIcC2n8nStdTaxOpTmh/LNpm7DZ3sCa76QvI2VL/M6DUeN8hIM5FSrX70V8
         bs8yB4jxBt4+weOrfme5CZRDV914oc9OugPtaywciqHQNNURuj5NIM/RVb+n0Io+zmmB
         UiPPSp88ZwEyXS9407vERRREaC+DSqPhI0rmDJSfwOABQglNy1ZautJyuUPMfybN+NK+
         zi9he/rdahOOc8GwyOpHJ4z/KHH7JOj5/1YAoNuwDTie74FK2yTQc16y8cxQz91QAEbZ
         rd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791411; x=1745396211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4klZ5LCWvRR7sigiHEe5f8QPHEXneqpNeiJtQ0wxIk=;
        b=aWcFa80e2TsB9C9pCHaoJFH9KG6cC6YnqgIG88482MXIcY022xzpd2Afk3dqu0kBRI
         Pr/waSXPvlTjnRB2m2PcRUmVvwVvvgCxTEzkUdvik6sGpb1av46lA4zCJyOji7SvQvA6
         XNd9WZr/KQXj3lLLK+mU0de52sFz7/Duq1cbD4TImNxLQ1qH6wnbzVfzQh7BtZWwK9RW
         +cJxgKvcew5TuOzoxMSycLcQIH2P4QlzyZb2XJJ4FbXLeb32y6sc7HQDCN6MSakM3Uuo
         kENwm5RJVLIMfVbGj3nE36P3wHXulaiSZ9vrjhZZxqnUZGvlbGGOsRBsEprlWoJRCFli
         3yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRUhNpkJJT5jyxYO2n5BXXcTBD5YHHP4+Q9MC928h7ISWFgw7LqT33W7SSVFddheNjTLMEG29FeCtAkKkxWtKJ/w==@linaro.org, AJvYcCVpt8gcJyQbteZgzR/4iGbY4pqboC8v7ddcmC9VkxmTPPPfcTdQBJjuCm429bvSLtLoxZ6TL288OE9Z6Ntl@linaro.org, AJvYcCWKKxnSbkUmfMdcLEdBjB5iB6E7krQOkQiZ1jnjP2bFJAmhg/eAjDx2rPyP0njqKBq6J/ZtUxpe1osqBMRFEwxPFSk=@linaro.org, AJvYcCXs4t+3JLcXbRhgezTD5me4APGFNL95MuonTOzyb8zdvqEdfLO1dWZW6UB1KOtsL9ehZvKH267N@linaro.org
X-Gm-Message-State: AOJu0Yzt7h5UnQ+P2VeAv5jr8KrohZMHYIXfjahuq3kMS46bcW2NfmJy
	qN5YuS65LK6kVwTUFq8/TPBiVBnyW45TqG6r4o5KD4ZGLR3iKM/g
X-Gm-Gg: ASbGncsjPl0FFBHFAAywM12lLsSBHnD/iunxoR8zoD4GLgl5LQyjdRdOd8eQf54A+0e
	HgYHN4AAzm2thS4CsQGyaRuAGcXo+GKh58BxbQGVcKDj52USqsIFkAXNa8Vyn9HKgD3Vksbpc5V
	/fQek5mWXS7cHRsSCD85Hwegm6BwySf9VhIjK531oOGK+AcKVGYnfSP25B9QNvG6vR39emn633n
	9xlPlvSxQZ0zg9RC+fd6Q/psRsF85b2fkdcK5kKtLhdhguptEh62NeRr9QX10o+5gTchbwXfbB+
	kr2GXmUta7p97QKJ/MhbwMlMnttdGdDLPgkiWNyxDCiS4L+sjiTlvqa3fw==
X-Google-Smtp-Source: AGHT+IFhoIl7I56S7fT7c23WuBVz8x479Hd++Aam1yHes86eL19L43Zv+85HiEDav9c321yeBTTcSA==
X-Received: by 2002:a05:6a00:2985:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-73c26dffd2cmr1421139b3a.9.1744791411149;
        Wed, 16 Apr 2025 01:16:51 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:50 -0700 (PDT)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 14/19] Disable options unsupported on Emscripten
Date: Wed, 16 Apr 2025 17:14:19 +0900
Message-Id: <c2e3a58825c39678fcde361b685d1bd69d2fb1dd.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MqPct2soIFqT

Daemonizing and run-with aren't supported on Emscripten so disable these
flags.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 qemu-options.hx | 4 +++-
 system/vl.c     | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index dc694a99a3..20ed22afe2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4863,9 +4863,11 @@ SRST
 ERST
 
 #ifndef _WIN32
+#ifndef EMSCRIPTEN
 DEF("daemonize", 0, QEMU_OPTION_daemonize, \
     "-daemonize      daemonize QEMU after initializing\n", QEMU_ARCH_ALL)
 #endif
+#endif
 SRST
 ``-daemonize``
     Daemonize the QEMU process after initialization. QEMU will not
@@ -5249,7 +5251,7 @@ HXCOMM Internal use
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
