Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F08E7FDD6
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:54:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnExQ-0008F9-3x; Tue, 03 Feb 2026 06:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx2-0007v9-PK
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:12 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx0-00059P-6m
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:12 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-653780e9eb3so7516165a12.1
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770119528; x=1770724328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XSrliXOCATefwQIn64R/qg8IArPF/GMhbm/SYSQ7GEc=;
 b=tzrpDTIh4P5p9GJ5JX4dHf0q5vkIxo3w354uoJ9adIX/lh7vrDVxtP1Q6+hLcdaCpC
 0IzVV8H1aNgUuBYAhydm97zeMqTzVwddrNQIKeT9RpsIOEPxOYW+lFuJJGSg+FqDHqdW
 n9VBIpQ0IHYV9T3K4Lk+NZ7pxi63j0z9KbFT+Xr1lUvRvxm08YACPszMNwAf/VL25C/S
 dUhgXWp0jfEMIkaa3zUelnJHmOK+Qz8bHbVx1Fno6Q8pgtX+drd/oIowrs0DbxcUJnTb
 sob6HsQ4NpjgYz0YgFjEF3mi6wICz0W3LI3YKKY8PV3Q3l6T3BzfCPkyKiEkZTmto1/b
 vJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770119528; x=1770724328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XSrliXOCATefwQIn64R/qg8IArPF/GMhbm/SYSQ7GEc=;
 b=hsnkqHbPxlgnr+sJkezf6PfeCqHQ0UID5nDwDq+SCbX+Nm78KG17AeHBO9shapS09L
 jqM3p4s3unkNRhFZHmpYs23MNTcj1AMc+cYRRcieckvtWy5W82dSYiMOIvClkFCT6M7f
 zdbZ2q8P2z4vR7z7qis7yGBGZFTz0GBhZrE5bTi9U7yiEdmFTIq9EL8Bb6p3qZcdAKa6
 pzR2RXUZT2bf7W0pwaPz1myJXouKCJFZ6Z99+ED5j4DDHx7EpyrfHU3ST6FnfGJcYglT
 BwCQKhjB0QWxcWUmRslsrI+UJjHyQ8H1joeZZPEeJ1Q6/dFKnC35fGBOKGmNscRTzg38
 f59A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8GTM1pbHJS93vxd4C6Pp1v0AmoR6kfDV2dsKKn7y84pWv49mfk/S9ZXDeg0Ip6Du8qBsQM/TXgQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxlw7kQwjcFLJikGHTB40X3cSlSJmSCaAccBFqiS/vgkZ9QC6de
 ylKCEXjhHYbFN/zM+hmlG/b8P8OGJi9JLXMamV3kA9edD2duT1FolUaX2tGdWyVbcl4=
X-Gm-Gg: AZuq6aIws0w5KG0YYlcO1zYrBPtfghK8Szo2/gvIAwsybXOEG6c/Fx3qLL19j/20Cl9
 qsDf1g/QJGJej4IucnloiRwlUsy+UtmEXMRINnJF7YLVloWkJXsCs8FjLaPiJ2LJtDHfnaANawr
 U1QbbMxuMvTdwlhh76YFnHtz5ZA3oTuXJyFleYxlxdzjGlYlccWTnSy2iOWR5s3VvP5dG95YHID
 NPBpWvAV0GS2rTpsSGM9TEmTrm4/tIDZqf76z4FRRzCJzzH2EKXn7YmMzIpNJyvct+WrKBGh/iN
 dEw6GPFPh56T9EAgMCq7F6TajRgmo4PUSwwZ6egg5DPLkZu9JuMqg7FIr9l6vtfBgDAO8wNSaA5
 PCYohjHUiOlvOcrde+mAeEkpWuat058CO0bPmyHv8bvyYncIL+4dzrZXrjAa35SQuxxPaKtpEGo
 HZIsoMWNQxIEkAZLu35AmV7Q==
X-Received: by 2002:a17:907:70c:b0:b8a:fa35:989f with SMTP id
 a640c23a62f3a-b8dff696c1amr916446166b.38.1770119527895; 
 Tue, 03 Feb 2026 03:52:07 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf184e5dsm1040894866b.43.2026.02.03.03.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 03:52:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8407060072;
 Tue, 03 Feb 2026 11:52:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 05/11] gdbstub/user: localise variables for reading gdb socket
Date: Tue,  3 Feb 2026 11:51:55 +0000
Message-ID: <20260203115201.2387721-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203115201.2387721-1-alex.bennee@linaro.org>
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

Keep things tidy by moving the declarations to the block where they
are used.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/user.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/gdbstub/user.c b/gdbstub/user.c
index cc71cda3e33..c7a3ef947ed 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -198,9 +198,6 @@ void gdb_qemu_exit(int code)
 int gdb_handlesig(CPUState *cpu, int sig, const char *reason, void *siginfo,
                   int siginfo_len)
 {
-    char buf[256];
-    int n;
-
     if (!gdbserver_state.init || gdbserver_user_state.fd < 0) {
         return sig;
     }
@@ -246,11 +243,10 @@ int gdb_handlesig(CPUState *cpu, int sig, const char *reason, void *siginfo,
     gdbserver_state.state = RS_IDLE;
     gdbserver_user_state.running_state = 0;
     while (gdbserver_user_state.running_state == 0) {
-        n = read(gdbserver_user_state.fd, buf, 256);
+        char buf[256];
+        int n = read(gdbserver_user_state.fd, buf, 256);
         if (n > 0) {
-            int i;
-
-            for (i = 0; i < n; i++) {
+            for (int i = 0; i < n; i++) {
                 gdb_read_byte(buf[i]);
             }
         } else {
-- 
2.47.3


