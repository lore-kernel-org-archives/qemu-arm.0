Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2753344lfm;
        Mon, 29 Jun 2020 00:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysHVHQAPYpNPPkHbYQNioYVJWHhCoQwduZ12lBUTzRDOAax8lvw8ARX8zadXF9UT/Tep+j
X-Received: by 2002:a25:6b42:: with SMTP id o2mr26677720ybm.269.1593416849574;
        Mon, 29 Jun 2020 00:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593416849; cv=none;
        d=google.com; s=arc-20160816;
        b=L5TBCMjFAuXTLCbW5ht5BBXlz3D5QGG36iG5IIUO1SXICh1z9RdalM4dgaG1yWm0Ym
         f2ya9BzXxYjRfkw97oP+5ILoTnRxSL6CZ/eRQYwiPZCH6CrVDkvCVK4FZPOOyuwMbzmy
         35/9OBi9ciFPZUHg39I3nK3KbZKzip0emh8dp4BdH6bdL53ThX0It4ZkIUp9dz0Af4F3
         8XZE1oSfRPbgeg3i7W8BWDFBNLznp5C+cuzuSRZIlMErw2UVhDf0ivisZ5rsEro4TzOD
         7cfTD+EqquLg95vkXHKjGlrglOXDfmniPvczIIV0TvHm1VD3tjgPYRDXmeoO3n5im94K
         +/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EA3g3jLnXIf8aJQnmpGkok4BIBubDKvqorlCoqvInNc=;
        b=BMqI0QPiWEXfLxox3bXtX0E0VfLDNbV8II1dTDPET7/52jIP5LreqSmNFD9AwxxX98
         ofnK0Nob1BMqbtas8P9+746/oDrBF7s+IGbn9cOrHmb0Ydvq/w5yIudjHIT4cxwdINxQ
         5gO40OTT6FfhSfIq5dPUwvYJk8EPIdyA3f7gUoP0GHl1rfHJsyXNN4PYGh9L3DjQ39QN
         /OOY26kxTczJQ7QxaE+n7Srf+uoFqc8G+IDb5haRYKLI0+ITYU4LixHyUQq6AUq8a63d
         TdpnN8f2GV+B6fPvip22FPXa+tRdh1kCol/iHtSOpmXoAO3BB/1VRMxHdtgwDakoQp3n
         KRIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GgqZeVv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si31469862yba.151.2020.06.29.00.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 00:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GgqZeVv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpoVk-0007II-UY
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 03:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpoVR-0007HA-Ua; Mon, 29 Jun 2020 03:47:09 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jpoVQ-0005oH-CD; Mon, 29 Jun 2020 03:47:09 -0400
Received: by mail-wm1-x341.google.com with SMTP id f18so15117690wml.3;
 Mon, 29 Jun 2020 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EA3g3jLnXIf8aJQnmpGkok4BIBubDKvqorlCoqvInNc=;
 b=GgqZeVv1g2WzGD/TcD4LTFjBt+K76p+b69GXhImbCVfGLiKfVY5LJSYYHH+1A/6z+z
 PL9Ap7HFaMedyT+P1hOrgFCezdVWIfqcCWKC77K3yOF2VIVZQZVKeOl6EiRFdBX1wBwr
 11vkbm0KyuD7vi5B20UmcjFCF/5XGJYn/fvKUH+8uplefdKFgaVBriQm4fAAAUkabVzu
 GzzyvB9naPdJrnUOHxiLR6ADQ/3wiUP0tmHkPO0cdE+OimJCYcex9SZFtQTGw4VBVvZo
 s/yYEOlybbguQ1ghDLhMFemj5AYa8wLbQCrOLoqfg8zSH26VHvFWh59HXkd92MrpxxVb
 vF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EA3g3jLnXIf8aJQnmpGkok4BIBubDKvqorlCoqvInNc=;
 b=HdATvg9pSh8K6pXbfhuCbzJVmIOlxWnNMNSn8V6e0TpQxHuJ39Jzfb2vBmCDCNcKUO
 SeaSbYOuoCxJ6vZLci1yQW9lRHxiGPFIym3vZ4aurEmh2WxajyhySDN+SNZQ7SWEGsBM
 LACPG9GQw9NoxOc6AeThbi2C1+wymZU/xO8T3bT3dbecefnTHqfmlZv9tkO1TjDMrZdQ
 W76xMPtgR8yj10DuzHwqfoctrj/rgGdTeKDLT62an+FKAPbM5P0aYmpeZohBj7rPj+u0
 qUQU8cPXanqLLDRb+T5KCLwXUVA+lGRu2CWQ2m6r7bpHGTcwWk5NnmUgjvfVwCAZwdNj
 YZdg==
X-Gm-Message-State: AOAM5303AL+hx9AcbLS9S3Q7lxsGuOQH9obXcONl4c7O0bjroYqGUYl3
 sCcViZHrImOh3cx2ceH+S+I=
X-Received: by 2002:a7b:c0c9:: with SMTP id s9mr14564257wmh.166.1593416826514; 
 Mon, 29 Jun 2020 00:47:06 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id s18sm52669882wra.85.2020.06.29.00.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:47:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/pca9552: Add missing TypeInfo::class_size field
Date: Mon, 29 Jun 2020 09:47:04 +0200
Message-Id: <20200629074704.23028-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lksJb6oD+4rg

When adding the generic PCA955xClass in commit 736132e455, we
forgot to set the class_size field. Fill it now to avoid:

  (gdb) run -machine mcimx6ul-evk -m 128M -display none -serial stdio -kernel ./OS.elf
  Starting program: ../../qemu/qemu/arm-softmmu/qemu-system-arm -machine mcimx6ul-evk -m 128M -display none -serial stdio -kernel ./OS.elf
  double free or corruption (!prev)
  Thread 1 "qemu-system-arm" received signal SIGABRT, Aborted.
  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
  (gdb) where
  #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
  #1  0x00007ffff75d8859 in __GI_abort () at abort.c:79
  #2  0x00007ffff76433ee in __libc_message
      (action=action@entry=do_abort, fmt=fmt@entry=0x7ffff776d285 "%s\n")
      at ../sysdeps/posix/libc_fatal.c:155
  #3  0x00007ffff764b47c in malloc_printerr
      (str=str@entry=0x7ffff776f690 "double free or corruption (!prev)")
      at malloc.c:5347
  #4  0x00007ffff764d12c in _int_free
      (av=0x7ffff779eb80 <main_arena>, p=0x5555567a3990, have_lock=<optimized out>) at malloc.c:4317
  #5  0x0000555555c906c3 in type_initialize_interface
      (ti=ti@entry=0x5555565b8f40, interface_type=0x555556597ad0, parent_type=0x55555662ca10) at qom/object.c:259
  #6  0x0000555555c902da in type_initialize (ti=ti@entry=0x5555565b8f40)
      at qom/object.c:323
  #7  0x0000555555c90d20 in type_initialize (ti=0x5555565b8f40)
      at qom/object.c:1028

  $ valgrind --track-origins=yes qemu-system-arm -M mcimx6ul-evk -m 128M -display none -serial stdio -kernel ./OS.elf
  ==77479== Memcheck, a memory error detector
  ==77479== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
  ==77479== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
  ==77479== Command: qemu-system-arm -M mcimx6ul-evk -m 128M -display none -serial stdio -kernel ./OS.elf
  ==77479==
  ==77479== Invalid write of size 2
  ==77479==    at 0x6D8322: pca9552_class_init (pca9552.c:424)
  ==77479==    by 0x844D1F: type_initialize (object.c:1029)
  ==77479==    by 0x844D1F: object_class_foreach_tramp (object.c:1016)
  ==77479==    by 0x4AE1057: g_hash_table_foreach (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6400.2)
  ==77479==    by 0x8453A4: object_class_foreach (object.c:1038)
  ==77479==    by 0x8453A4: object_class_get_list (object.c:1095)
  ==77479==    by 0x556194: select_machine (vl.c:2416)
  ==77479==    by 0x556194: qemu_init (vl.c:3828)
  ==77479==    by 0x40AF9C: main (main.c:48)
  ==77479==  Address 0x583f108 is 0 bytes after a block of size 200 alloc'd
  ==77479==    at 0x483DD99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
  ==77479==    by 0x4AF8D30: g_malloc0 (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6400.2)
  ==77479==    by 0x844258: type_initialize.part.0 (object.c:306)
  ==77479==    by 0x844D1F: type_initialize (object.c:1029)
  ==77479==    by 0x844D1F: object_class_foreach_tramp (object.c:1016)
  ==77479==    by 0x4AE1057: g_hash_table_foreach (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6400.2)
  ==77479==    by 0x8453A4: object_class_foreach (object.c:1038)
  ==77479==    by 0x8453A4: object_class_get_list (object.c:1095)
  ==77479==    by 0x556194: select_machine (vl.c:2416)
  ==77479==    by 0x556194: qemu_init (vl.c:3828)
  ==77479==    by 0x40AF9C: main (main.c:48)

Fixes: 736132e455 ("hw/misc/pca9552: Add generic PCA955xClass")
Reported-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pca9552.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 80caa9ec8f..68b574d084 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -410,6 +410,7 @@ static const TypeInfo pca955x_info = {
     .instance_init = pca955x_initfn,
     .instance_size = sizeof(PCA955xState),
     .class_init    = pca955x_class_init,
+    .class_size    = sizeof(PCA955xClass),
     .abstract      = true,
 };
 
-- 
2.21.3

