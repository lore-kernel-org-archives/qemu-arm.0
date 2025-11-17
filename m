Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD46CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 20:39:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL60B-0005Kx-Tv; Mon, 17 Nov 2025 15:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zz-0005Jp-67
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zx-0000cV-BH
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so49787355e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 12:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763411932; x=1764016732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IwAOx9Hsl9tPV/fbNKmTyyOWz5fj4m6Yt+dsMAsL3yE=;
 b=WiZbv2fA/4PM7t0bv5ewJXUmSs2S3TXGbpWB0/o6aVzO2Sv2TrHQaiZgLX7YxepP3k
 XIEbjPmoeXRWmcAWQxBScjB25qTgN2W+jYa8otYZYqQYlMoe70Q1K1sUi1YdoHIv5cWF
 nIlnYDlnoYXWUq6ys4x/GZODTw1ElRWZitAWaCJ+OXkbrm09K9c8L5cdBDhuYG6Z/CeM
 KXo834HiVEKBsHJfTOdSr6luNb/Gxg5ckAhn7DD8gHbzi74bCMXdcE49vh0IT2cv1ljD
 fYXgs1YuaDweritKxqsrERy+Gjb7tY0gMzsfT+kZu531nPwYCmzPo4OY58eZLJEBsQcH
 lshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763411932; x=1764016732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IwAOx9Hsl9tPV/fbNKmTyyOWz5fj4m6Yt+dsMAsL3yE=;
 b=PF2GXctN/uebcFEsMGJMSTeGKnYv7VNVlLRrcpisqc9mqfgN/HCgX04JHBPlDp8KlN
 Wb+iUxNIKqqtpBTfc1ONlimt/ES9eYUHnmNkniz0fenUU/I9OrP0z3NHBoRQixU71a1i
 0yzvpLzfiytm/4oOQ2vv730IlmIFqZT9OwwtUcAjRrygABMB+WvgifmY6Z5UZlK4ITWr
 y+ExziNH9nEJcXT0KAV/17UE1XC0Ef4XJYGf2ZyF0Uw21/gxCCn5lKazAGLpP06sNErb
 ClL/54ULG4ff8s5AvwOrtG9zhQ/ZdIOhwGpunPIi4zTJ49cdznDsKbqqIYPsTNdSh7HW
 /Ecg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTDRuzy+ko4jMzV/lBEv8LQB0MT78SJdroXOB6du5bk7y+Yt3cXVCSI9x16+bi7Rw3fGFz4OgtLg==@nongnu.org
X-Gm-Message-State: AOJu0YxQ3h0YumGoDRumvdCwli7I7msviBStPbL7lJLOUgTCnsQ1vU24
 u/GMkDouWIellk445pewT7dnc++fTphDAzLby8NbxPWpkzUQ+ynBwdrluvqGcq4NSQs=
X-Gm-Gg: ASbGnctGclEfgn33z+NU23k6dgNw6egW0d4kUaM53Sd9t1LR6u0hyeGwJIxJvAGUbI1
 TSoalGRhm8LwE/46jMhwsl1ZQ/jvZ0kCc8b9vo1TN4aFvwiF+5TtvMlG7udvDqRNnKNjRikKh3g
 NcR8/gJO591z/rjKSpcwNhgMeZpZWTxBCaoTkgFiZ1dL7K482VRgOm3BhUvGn9cL+WfV1ahgqKn
 KCvdxATwppA10Tca5xdvTf7MOnxT1jf6RQgnbNlCj7RwmkPGFJUMjeIEycjXab73t9XxGXzmpkO
 zAWJ/8xRg1cAwSe4M2RD+GqjAa0+naWm/Je69ZVdmOLT+esyD7qTSZWdSbPxv7ebM/DXEFYWPtE
 JjvreAm9TXONJXXY3exfoFGEVgUE4mIE1t1uxQhj89Z8fq69ydtM6ePRSSDnLUO4I8TjK0mc5en
 G6duFWfsnjxshFvK2FtoUFWg5KYDUiK0fctcKwKPXBMR6GkrhrLB7CjeTMzKUrEFuSxbCthiI=
X-Google-Smtp-Source: AGHT+IFz3b9knL/n8h8K6LzdtzVWHarlefA9XTMY6gkk6Uew5Q4u/PObyg7yUaGYeDv4G6ug0rBG0w==
X-Received: by 2002:a05:600c:6052:b0:477:9986:5e6b with SMTP id
 5b1f17b1804b1-47799866420mr56228585e9.28.1763411931622; 
 Mon, 17 Nov 2025 12:38:51 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a0f4ff42sm90424585e9.12.2025.11.17.12.38.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 12:38:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nick Briggs <nicholas.h.briggs@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>, Eric Blake <eblake@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH-for-10.2 2/3] migration/rdma: Check ntohll() availability with
 meson
Date: Mon, 17 Nov 2025 21:38:33 +0100
Message-ID: <20251117203834.83713-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117203834.83713-1-philmd@linaro.org>
References: <20251117203834.83713-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Commit 44ce1b5d2fc ("migration/rdma: define htonll/ntohll
only if not predefined") tried to only include htonll/ntohll
replacements when their symbol is *defined*, but this doesn't
work, as they aren't:

  ../migration/rdma.c:242:17: error: static declaration of 'htonll' follows non-static declaration
    242 | static uint64_t htonll(uint64_t v)
        |                 ^~~~~~
  In file included from /usr/include/netinet/in.h:73,
                   from /usr/include/sys/socket.h:32,
                   from /home/f4bug/qemu/include/system/os-posix.h:30,
                   from /home/f4bug/qemu/include/qemu/osdep.h:176,
                   from ../migration/rdma.c:17:
  /usr/include/sys/byteorder.h:75:18: note: previous declaration of 'htonll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
     75 | extern  uint64_t htonll(uint64_t);
        |                  ^~~~~~
  ../migration/rdma.c:252:17: error: static declaration of 'ntohll' follows non-static declaration
    252 | static uint64_t ntohll(uint64_t v)
        |                 ^~~~~~
  /usr/include/sys/byteorder.h:76:18: note: previous declaration of 'ntohll' with type 'uint64_t(uint64_t)' {aka 'long unsigned int(long unsigned int)'}
     76 | extern  uint64_t ntohll(uint64_t);
        |                  ^~~~~~

Better to check the symbol availability with meson.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build      | 1 +
 migration/rdma.c | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index df4460035c3..72edd6097a4 100644
--- a/meson.build
+++ b/meson.build
@@ -2663,6 +2663,7 @@ config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
 config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
 config_host_data.set('CONFIG_GETLOADAVG', cc.has_function('getloadavg'))
+config_host_data.set('CONFIG_ARPA_INET_64', cc.has_function('htonll'))
 config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', glib_has_gslice)
diff --git a/migration/rdma.c b/migration/rdma.c
index 2d839fce6c4..337b4158899 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -238,7 +238,7 @@ static const char *control_desc(unsigned int rdma_control)
     return strs[rdma_control];
 }
 
-#if !defined(htonll)
+#if !defined(CONFIG_ARPA_INET_64)
 static uint64_t htonll(uint64_t v)
 {
     union { uint32_t lv[2]; uint64_t llv; } u;
@@ -246,9 +246,7 @@ static uint64_t htonll(uint64_t v)
     u.lv[1] = htonl(v & 0xFFFFFFFFULL);
     return u.llv;
 }
-#endif
 
-#if !defined(ntohll)
 static uint64_t ntohll(uint64_t v)
 {
     union { uint32_t lv[2]; uint64_t llv; } u;
-- 
2.51.0


