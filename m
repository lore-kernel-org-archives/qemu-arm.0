Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C86CCD5BAB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:47:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLhv-0007ox-BV; Tue, 19 May 2026 10:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLht-0007oH-Qm
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLhr-0007eu-S5
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so27745055e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779201962; x=1779806762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1V+GWtucxSZl1YZ8nu1MtklisKojriGnpVCnzAvOg4=;
 b=rrLyvnRyLBgL6Xg5TzFdiBDYMlTmdLYi3t1l39I2B+3mpPBC9SqKuqzIkPX06Jo/HB
 d59F3Mvpoogyl0HtKdu8CEmnpXGkVE+az6lMgTVY0uXeKdaJUGiRcyhOKdgKa6b2TIOF
 hf+EfET5d6KHNlTictPY2EJSoDOGv+ajQ69s/iI2LfPa9yNU5qKNLQw5rY0ujMQVnoXb
 XKFITI/79fNNEAVjFGkr6vlKFKN8Jf8z0PJHn3yWfdh+IQzfTW0SCegOONDKs7f4sZji
 TJ0rLc52Sa8oohGQ5NEv2LdydrY2UH/0yNJwcZwpvD4pIKYKPpWnNFtaKHFEaDt7nSnJ
 gjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779201962; x=1779806762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K1V+GWtucxSZl1YZ8nu1MtklisKojriGnpVCnzAvOg4=;
 b=gep4bYMWt7Lj9PjZ+s/8BNcjMSUaw0dAdaNak9iafy3TIB99KO/rPT5LphEVRwgsPj
 W3RQXV9uTxrE/FJSp2WwBQdxZzVtFo5D3Yb86ypGPAp3FzZcjUiwyL13AzDUTMCou5mI
 i80RR88VcvpRnv0fjsRq8mQlN1W3xpOizXHWHh606VZgxgFjJt53K22SsXYhVwk7VuqM
 ir64w0WBLRLt1YcTwwKMPxW4j2qvI/EXUEtj1dascIZ77MpVWGmt03al6iZSMFu/4rHy
 PVjXm2RCaOxb5Alc/tS5wwN7h1bL3ds3IaAkM55rQvZQE1r+BhcEtHmid+sXL9hJKJ5b
 c92A==
X-Gm-Message-State: AOJu0YyFppr17ZbtAK0dJBTMAkOWSADngIH4zJfSdrZgnl38AO9sUuIX
 2Thgp9rg7QOfVr72/dG0tAS6AWMYmzkcGjMK1PYdj0wlcX+cW5urx4JGOLbuJmV8hz71fcxqOJo
 ggSwOM0o=
X-Gm-Gg: Acq92OFAlnQUXDAM00MO50S2JEv6zlATsgBpeblyIvGaXasN0Bo04s50jubmNei/gFW
 AgvQaqGxep4bYSn4zMUoTZboZ8pZtZlBfd3myh2rePRI0oUIAADH+/CBFOAr0b9Y053O7u6FypA
 5oPCCQ+XQ07qIvXC1audi7L7lPUFS/P/WJl10L/HGroT6ZuEFUtWUnYYRkTBYcmaQbWthkmhui6
 1/Vvt4wRSxPsCfpBD7SEzGFj1YJxjTlAqGhUw+SoXdeP4xPSOJxaZSQapwxnRmoBJfPnHU+xybk
 5HSVuxps0OoaEOPWPuOadpBZjegzOPk2xiiZC4oQveZKgAoI43rOnmyRqhdl76ktbCuJapaHyvv
 a0wVM3bv36y3cyvNlFaHH8cb5oPFY1j5d57OED9draPaBDsjx+CvwQZonorX01SmvwdQ9MoAC7W
 QrrMcISf/JHgGX0ULgRSnF8ykr3zBUvDvMLCmwRkzzS7N2RESnPv5+NfJoMMf/Efm7MeZiS3nt
X-Received: by 2002:a05:600c:4fc9:b0:48a:5821:5ffc with SMTP id
 5b1f17b1804b1-48fe60e473bmr275437895e9.2.1779201962193; 
 Tue, 19 May 2026 07:46:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feae166dasm124982975e9.9.2026.05.19.07.46.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:46:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 01/18] tests/qtest: fix discarded const qualifier warning
Date: Tue, 19 May 2026 16:45:36 +0200
Message-ID: <20260519144553.91483-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Matthew Penney <matt@matthewpenney.net>

Modern compilers warn that the result of strstr() may discard
const qualifiers when assigned to a non-const pointer.

Make 'found' a const char * to fix the warning.

Signed-off-by: Matthew Penney <matt@matthewpenney.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20260514191844.105888-1-matt@matthewpenney.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index bf9284b9a13..b1e06ea364e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -2146,7 +2146,7 @@ bool mkimg(const char *file, const char *fmt, unsigned size_mb)
 bool qtest_verbose(const char *domain)
 {
     const char *log = getenv("QTEST_LOG");
-    char *found;
+    const char *found;
 
     assert(domain);
 
-- 
2.53.0


