Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D95CE7FDCF
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:54:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnExO-0008Do-CZ; Tue, 03 Feb 2026 06:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx6-00080m-Lb
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:16 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx2-0005At-B3
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:16 -0500
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-b8837152db5so879623666b.0
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770119530; x=1770724330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0V2C0hSasiZ0RXRAJCGAe8Bly/ben/AN3ObuqG7QFIY=;
 b=yMOIfzMCS41ghoCvKHzb10f7vGUlRTEtof/FNY9DtIUmXEqz4QSfZaYF5OlkhaS9st
 0cCdxS9bDE3E6Qvg0W4NwQsZb9OA0he8jrTOgqPYGags5lK7jchnThcRkjO+7S911TRR
 ZJ0YghxN4hc8y7GKZoBFi8xeBG0ccopnjqHXRGUjziMpE/Mb3UqllOgLm8tgz4vTePrN
 zKos9Txs6/oe9HGOJslmMbtDLmKQKIbg7usOuueeCN1bj4HeKR5aHisApdGDSFd5shKn
 C4bryNf7vXDKDjgPSh4xa0ZZC9q1Qb7yS4ngblvKIh+k9yl91XsU4e1mPtrElzWbON7C
 s68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770119530; x=1770724330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0V2C0hSasiZ0RXRAJCGAe8Bly/ben/AN3ObuqG7QFIY=;
 b=QiED6r6stnNbhgb6fCTqT31heti0S0IZX2i0xDLG6ZVOV18mfmfAOmumdYYPy5WaIs
 uR+EKL9WNXTh2xru4o7hbSn/1fasAj/GtVIGI9YUkwVoL/g54FNoARa1NO3o31ISf5PF
 ig5yPKSHstrDKgXDdJ7vu2yAHTlEuBKGN/Yb5jHmiMoRnUNcIjex9jIyJ3TjUnXQeQp8
 NnNWS0983dNwIu64SgsNAp4kqqdwjYuLcrMW781nc65j2NCQO4yXW2n7IBYEcpT0aTw8
 JVd2g9vz2eh/7ZeNA6UFIyN1fvQfOPk5T4+kvSPa7BPfM+/QxqDsRK7PmP2yJWVJyuKC
 g0LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEM3u4LJgYO/3SFMQcRyCKWepWwclcodxWGsFURSzsgWSo0PiwGLL98i2TWRAAD1e+eO0NQpLXQg==@nongnu.org
X-Gm-Message-State: AOJu0Yxttr3qG1qEHYtDO1fc/wnFvqX+LtNRIjOw8NQlY6kjf6k70fMS
 El/4CFd4bIxbpV49z1Nn4sgN2TS4awzl2nvB0ca1Q2hPoYi9hdp3JYwXIBH1gth9Lb7aH4gJjL/
 cZbAWrhU=
X-Gm-Gg: AZuq6aK9vUBZCIeJ3zS+Xe7+FXIYvf5bf40YaqgCs9vIbvW7+znZBKrpmd0frbUsGCu
 pPuczSqO8jMNMJ4zwrkyQLFmnc/IZZc5U+mLW+XMzJcji2lH9Di4mz1icwXSh3zhEK5L1PA03HF
 VSpvJOMO8wW9+S4jvQDXveUGOWt02Hoz2Y53h2z7yP81S93+woCpsCuJE6V7mY+2de/qbTDIMQS
 xEvzBcvlqUIq3Qyt+2iKZjLfV8Jez9AtwsuBwD+Vs8Woo3Ds1ohGKeButwcDZ5TCkrd+MDaQM+c
 lY4KWhi2bnW5h6wNtxNA5s1TIY90rHG8nZo+1KBdfC68KhOh/ffdZRp590U1BWCFO97WzeMG5ew
 tntqftAhQTF+S226ooRaip2NHOG2/wh9dh6ATBmpk20Bn0WyeruiF/+6P5tzvl3eLdFgPGF7ca1
 WTVCmgWh+14BE=
X-Received: by 2002:a17:907:2d0e:b0:b86:e938:1b21 with SMTP id
 a640c23a62f3a-b8dff5d8e42mr918857266b.23.1770119530082; 
 Tue, 03 Feb 2026 03:52:10 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbef86991sm1042865266b.4.2026.02.03.03.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 03:52:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B4AC9602CD;
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
 Laurent Vivier <laurent@vivier.eu>, Yodel Eldar <yodel.eldar@yodel.dev>
Subject: [PATCH 07/11] include/gdbstub/syscalls: Add EIO and ENOSYS GDB
 File-I/O errno values
Date: Tue,  3 Feb 2026 11:51:57 +0000
Message-ID: <20260203115201.2387721-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203115201.2387721-1-alex.bennee@linaro.org>
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Yodel Eldar <yodel.eldar@yodel.dev>

This patch adds the EIO and ENOSYS errno values that were missing from
the GDB Manual [1] when the other errno values were defined.

[1] https://sourceware.org/gdb/current/onlinedocs/gdb.html/Errno-Values.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20260116014612.226183-2-yodel.eldar@yodel.dev>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/syscalls.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/gdbstub/syscalls.h b/include/gdbstub/syscalls.h
index d63228e96b4..6200416f77a 100644
--- a/include/gdbstub/syscalls.h
+++ b/include/gdbstub/syscalls.h
@@ -22,6 +22,7 @@
 #define GDB_EPERM           1
 #define GDB_ENOENT          2
 #define GDB_EINTR           4
+#define GDB_EIO             5
 #define GDB_EBADF           9
 #define GDB_EACCES         13
 #define GDB_EFAULT         14
@@ -37,6 +38,7 @@
 #define GDB_ENOSPC         28
 #define GDB_ESPIPE         29
 #define GDB_EROFS          30
+#define GDB_ENOSYS         88
 #define GDB_ENAMETOOLONG   91
 #define GDB_EUNKNOWN       9999
 
-- 
2.47.3


