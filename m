Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D61E7C712
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:53:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnExc-0008SP-SL; Tue, 03 Feb 2026 06:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx9-000821-8o
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:22 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnEx4-0005CT-3E
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:52:19 -0500
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso974866566b.0
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770119532; x=1770724332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4p2xjSQh41Ag5LxVuPwppS8kSDsK6cwuipOCAHLv74=;
 b=xrAV/DZLQFYUJ4F2ROtfldJxJsKbB7I40BkDMDisQGwzAoZa9ugvkDXnUAT7m+DoJh
 RU0O0YG9Bbs0MFyTLcBaSdlbJq1u6U+oPoN/P2ny5w41RP81pYpMKnF1OktnS3KiamWg
 uPFtqiZbZv/neTvRUTcOBY/bNzpEi+Y4iioYw+7oanOiUxmtnvKKQKP+cKfLddddByrv
 pBT4SfLr0CD3C8M3EAR5jZPTPAxEPvONud2XT3tdmGSnj/ajRY5BGbweFw24qphIxtrA
 n4RxSXnWZ2LXu5uls6y3RU1c6BhX1/Z2yILhFrj0YLegyjIdFOo0Ikk3/hLQebdVky1y
 X4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770119532; x=1770724332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q4p2xjSQh41Ag5LxVuPwppS8kSDsK6cwuipOCAHLv74=;
 b=TwBSA0XqiPUAjjl/qyAG5b0AAZsk5a2UABI9uiP5j3y+hCR9TrWZoFGPQQFsozmfGp
 Kzd9xMSpISDOSGh8uR1m6FZ03rZ6v1eK9zIgmuiC0rZ4YISdwVT5oa0blg6xqZHi4IYC
 7EjLpatGYHEuatkb2bQVgD9wlcbVM/ED+vcWoVVqzHf20ccwQoPniFLnqKckqa0H5T1z
 HUDkk/4Cr5c0IbLqVPrJZT6sfCfvA4hb1ooRQITbMpC41WwaagnDWKu1f9aCKgTnt/Xh
 dh5fVts0WqDGjTOx/3/HVkBKwsahYTIK0HKQt8mtSlTf0UTV3GLW8/AT7DI+gsy6RYBJ
 j0Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVExJfCvYFFTjQhmTyvq+Mh1fmqkTmO3r2D4hQ/VFb0+9ebOTLu029szsBoqhzH1psPr1Sld9YfSg==@nongnu.org
X-Gm-Message-State: AOJu0YxYeJBhbBOB3urxdsGvAqCCnYa7hMKQhbTPprftwyogIUy4XLGs
 P/ZVX7t4iDsiK1h6LONkgNG11LzmeeHWijIB0uJsvF+5vO3rh2MzUXNKyydbyWy8TVY=
X-Gm-Gg: AZuq6aIq10mqYcTDQ6EFMwoB1ts96ZhQcziQx21Aig2G/AtyPRV9TUXNRGjSAMJWLhE
 dcB1RSdGWMh/R8swHjZMAm/kZBOJAN+8ySpjRCjjcVeCGyicWKAIV2mi+wcBG+6wDDx72+vbBHt
 q4qb8UDkNdE5zgAoaI6DLA1Pp0zhlcCr+eL+4zebnHGAHQV+xByx53oj0jRCSXhF/OvUQK/g2+w
 CVdCwwpbFywvOGe+/TQ5WKtQozpq8fNN1YTu4/KAWwdjPJC4mLZ4muM024BsU1KJbkW1C/K5O3t
 ALxSRTUZFqw6fiHJmR2hIyCZT2DdwzR+ai7eYQBqGL02CTZ3kcNrgbqnOtTA36bYmLnP+B6S+Wr
 xsvhvHtlR/ej1YMJkW03lm34UuVDKzeSrLQax+IUDycx8760Ui5zsAAMsZ3ppZ0INrk+biucYiO
 LdTBKOUBYCc+4=
X-Received: by 2002:a17:907:7fa9:b0:b8e:7e21:132c with SMTP id
 a640c23a62f3a-b8e7e214381mr246135166b.59.1770119532214; 
 Tue, 03 Feb 2026 03:52:12 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b4691e78sm8931802a12.17.2026.02.03.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 03:52:07 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0AF91603E3;
 Tue, 03 Feb 2026 11:52:03 +0000 (GMT)
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
Subject: [PATCH 10/11] include/gdbstub: fix typo
Date: Tue,  3 Feb 2026 11:52:00 +0000
Message-ID: <20260203115201.2387721-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203115201.2387721-1-alex.bennee@linaro.org>
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x644.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/commands.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
index bff3674872e..989a95c33f9 100644
--- a/include/gdbstub/commands.h
+++ b/include/gdbstub/commands.h
@@ -50,7 +50,7 @@ typedef union GdbCmdVariant {
  * '.' -> Skip 1 char unless reached "\0"
  * Any other value is treated as the delimiter value itself
  *
- * @allow_stop_reply: True iff the gdbstub can respond to this command with a
+ * @allow_stop_reply: True if the gdbstub can respond to this command with a
  * "stop reply" packet. The list of commands that accept such response is
  * defined at the GDB Remote Serial Protocol documentation. See:
  * https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Stop-Reply-Packets.
-- 
2.47.3


