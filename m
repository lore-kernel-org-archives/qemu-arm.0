Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451002lfg;
        Fri, 7 May 2021 07:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmIe+qJ/OgB7p/DGm6fggblz6OJHcPisNswivPBVrZiq/gckG3/P68TEfvzgPN+3lrApfQ
X-Received: by 2002:a17:907:2bd7:: with SMTP id gv23mr10627998ejc.321.1620398612674;
        Fri, 07 May 2021 07:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398612; cv=none;
        d=google.com; s=arc-20160816;
        b=hOj6mhS44fn/tYGpRKjhy6+m87aXxqSd9nUoL+2ExeJ1IbwpPpyShoEX7F5P369Fho
         YQ54hqaAOx/f7nvCS0IMAi26+1T3r161bTu4WSdtjdEY+TdKIXG/3ZpY44kAksy8NkEV
         KPXRV3dSZPzXUKGQ4bUq+m16Jm9VRZzhlhZyg41Gu5BdnU4HZTa3qEBTgd7QYUDaX/cw
         k1bV3MAgohvKZWQggHLNSPO5v1KVg/lsDMgnHTdbknuqYQo96/gx/+ZB3uyGWQxSjCcY
         F5FDuPfRM2glmdH2U3g/26wUTzFtKr6vU2jIRC9tnnKmHgF0Xhnw/DrNxXM9xdEPp8QT
         As1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cWe+dxIQxlwOjXTVq4nmSO21Ag5LIQeGVfXOgPjRmt8=;
        b=zdyvMAgINPicgHCseSuUOhMPtyvJ3YDkTMtiksuEPSJWMJFC4P2wF30fkVeE3HrrsZ
         Nc0HCchgJCYeUWhWt0jCNdFpw7noKvxAO7E+Gxtjsdsn2k2na7zBgciDn8sRuOaEJkJY
         /zpNLzTptFaJ4+T/GzyQuiPrfpbiSHcv68bDN0B5BcUkh11ENubPN/ohVoytoO984TMA
         gL3qZvnzdxQuIseOTaa0smBaq510oK/ZBE7R5qCzpAptjjVXs/z0RGRy8tZbqG2ItBkW
         Z9hurRBfWFfH50H3VNfC5R0egSWmYGQj0rzN67ZZL8pfeVtAYUqLzc5ah/+98KADx805
         NFPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZaB6gKev;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dp7si4841366ejc.35.2021.05.07.07.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZaB6gKev;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWe+dxIQxlwOjXTVq4nmSO21Ag5LIQeGVfXOgPjRmt8=;
	b=ZaB6gKevzPVzKBe3fJgPItBVYmUHv/bwN0gfdmm0dfg3tRtRd/R1l1o9zO3oT88Uy2AMvE
	ZwUNW4L9mhpu6QkIWk0o7qcUf63+fo3ZjHtuOGU4r3FFOZKzmjrI9XvOA8iN/fYZToI9EO
	/Pl48VEDcNb0G5bhepCWg7Scn6UTGBc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-xbFG73Z3PWCRpcMpJ0jDpQ-1; Fri, 07 May 2021 10:43:29 -0400
X-MC-Unique: xbFG73Z3PWCRpcMpJ0jDpQ-1
Received: by mail-wm1-f71.google.com with SMTP id t7-20020a1cc3070000b029014131bbe82eso3990332wmf.3
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cWe+dxIQxlwOjXTVq4nmSO21Ag5LIQeGVfXOgPjRmt8=;
        b=f1gEzzlnq0KS9qkEn308GRR5nzuNxA9VN+BM2AUy7ZrfBs/5sba98fwjgid5Jdc0ux
         mag61k0g1IedRY6JSNwkzlDZ4U62dMjAzvTEU/yIHmWD+Q5GgDo86k/jpRPC+JNeROdY
         i60aSgU90Lw89bffoSGre9/0nkGYl2ZTT1KXHgCn2f1g8xw+SHfxEx4sKtqICZWZTY/R
         rX1F1arLnpGEY8dYWc5eLVRf6Ec+CPAejTKQjG/o2aas1GHko01cpCQSZWZsf41sssNb
         GcA6kvAgcAtgz2g4tFp4F7EVfvfUbRpVaTAfKvensc1vMasUFghQzWJryXkn/It4QOJI
         AYIw==
X-Gm-Message-State: AOAM531gfqIZlr7mO+Ykfbm8oyifGQ5q0+Wf88ocSgTLVSkLC/r8fOFu
	5m/nqtVctY1IKFNwt04l451grYZMHko2TChDjKgJ0g9iAlDT4mfKdN/KqEyhaKeabxUBwuSYAYq
	yvO/VoSD+JPbDcmIi
X-Received: by 2002:a05:600c:293:: with SMTP id 19mr10481686wmk.144.1620398607271;
        Fri, 07 May 2021 07:43:27 -0700 (PDT)
X-Received: by 2002:a05:600c:293:: with SMTP id 19mr10481664wmk.144.1620398607116;
        Fri, 07 May 2021 07:43:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id o15sm8521863wru.42.2021.05.07.07.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 02/17] linux-user/elfload: Replace alloca() by g_try_malloc()
Date: Fri,  7 May 2021 16:43:00 +0200
Message-Id: <20210507144315.1994337-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hubBKmB5Lvj3

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/elfload.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fde..dad2dac24a4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2591,6 +2591,7 @@ static void load_elf_image(const char *image_name, int image_fd,
 {
     struct elfhdr *ehdr = (struct elfhdr *)bprm_buf;
     struct elf_phdr *phdr;
+    g_autofree void *phdr_alloc = NULL;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
     int i, retval, prot_exec;
     Error *err = NULL;
@@ -2610,7 +2611,12 @@ static void load_elf_image(const char *image_name, int image_fd,
     if (ehdr->e_phoff + i <= BPRM_BUF_SIZE) {
         phdr = (struct elf_phdr *)(bprm_buf + ehdr->e_phoff);
     } else {
-        phdr = (struct elf_phdr *) alloca(i);
+        phdr_alloc = g_try_malloc(i);
+        if (!phdr_alloc) {
+            error_setg(&err, "Not enough memory to load ELF program header");
+            goto exit_errmsg;
+        }
+        phdr = (struct elf_phdr *) phdr_alloc;
         retval = pread(image_fd, phdr, i, ehdr->e_phoff);
         if (retval != i) {
             goto exit_read;
@@ -2979,15 +2985,15 @@ static void load_symbols(struct elfhdr *hdr, int fd, abi_ulong load_bias)
 {
     int i, shnum, nsyms, sym_idx = 0, str_idx = 0;
     uint64_t segsz;
-    struct elf_shdr *shdr;
+    g_autofree struct elf_shdr *shdr;
     char *strings = NULL;
     struct syminfo *s = NULL;
     struct elf_sym *new_syms, *syms = NULL;
 
     shnum = hdr->e_shnum;
     i = shnum * sizeof(struct elf_shdr);
-    shdr = (struct elf_shdr *)alloca(i);
-    if (pread(fd, shdr, i, hdr->e_shoff) != i) {
+    shdr = (struct elf_shdr *)g_try_malloc(i);
+    if (shdr == NULL || pread(fd, shdr, i, hdr->e_shoff) != i) {
         return;
     }
 
-- 
2.26.3
