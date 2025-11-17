Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA07ACE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 20:39:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL603-0005Ka-IL; Mon, 17 Nov 2025 15:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zt-0005JQ-9f
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vL5zq-0000bn-6y
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 15:38:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a219db05so10310265e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 12:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763411924; x=1764016724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dQxn+7K1DnLqxzX8+uoAG3/GgxJkaJRF7+GxCfNDfM=;
 b=ykZbnHG4WasXQc+fS4neQXliGUX4GvxOPxyEnfoAtsTj6sQOxrunZulytBgbRhvLXi
 OI1PxjgA5j/QfUS5RnrR0UhbKMnk7T47zklAa1gVsI9dSkuAOOlgHG5fBpbjVpnsEAPn
 jL+VzR6zJMExJJFS7mX5mzAtg/6MxYCu+8kfXrtbhXK/VySuIjSIr0VWy+fOr0RE+nrf
 QD14tjUCCun14/KI829UypgGp+8KJPUOhKAKkWLtY5rsFKT8pgWD2+yqoz3HlcaS6uzg
 ghau0UTKWfbxz8+U0czjWnUIBQtP2oQ3HrOj9Q6WF9uSY5OOAlVDkveQxWEBrewqgZoo
 eySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763411924; x=1764016724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+dQxn+7K1DnLqxzX8+uoAG3/GgxJkaJRF7+GxCfNDfM=;
 b=meyNAOGRTN0gQlW3f98ENmIQWS+0a65WKq1o+tqbtFf4+lA/PFfYqQY74vTqF1/9F6
 eUllA0LZkhz+6UTEj/1MpgT3hoEWvr6vWv/nThNXde+f/8XkfdUT1jmsxSuHl1dByr+9
 HEoTdy78uAVljIwZ9ZqsLHLLDFqJRYF7Jqa+esSJRi3F7iHn6h/T6EyRVLE+MkidgoiL
 XEdT3yUT035GTBso6kJgt9WcE6F1zm+ZJwXIgooUbjOfTz22HwSrlgio1GEqmNW3nq70
 UjVWQP2SKfyhrQwOr/cOliWaPEqg0KhAz3dlS3JpaVB0pF9SK1LAT9ePEPeU56rHGdsN
 t0lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVIuq/wPdfcrtYuxx7xWkhaETwjLVTI783uB1ppxtu7RZp8IApdnntd5ZXFfm1pMScq0jjw7jUBA==@nongnu.org
X-Gm-Message-State: AOJu0YydbtJMA6LQyDAFU+agGJPj+T0/m199NChCGXR4N+EYnAiOYJZT
 r0VWx0Ixr+4EFlCs1FI929o7tqNcRBwr/18GS/dgUQsLSRRfYnSD9YqwupmH0zV0l7s=
X-Gm-Gg: ASbGncuKicbLv3JV6MLNVlJpUa6nhb8KjHCOujTJHU4OKc0s8FT+UAu740ZaFy6qEuQ
 AbesJwEVPwD6VNMwL1i2DsyijuRfd7AEWM9JFKXYY58+ExTQ56v2Hx9Zs/3Y2gJcj7AweZuwmZO
 IKzMlzp940h+pHIKjtlePQGNatWhAUpRnxPgDYdGywNEuWrcNmyQAY7RkG8dWlbKFmjxxsdoaHE
 wXh4AvzknZYpf5xeh/ScaTZZhSFEI/0YQM+12353WmTcoJFpfz/0peCGbbGGUjzOJ4NknZjIBC7
 UeArwQOAI19LW2WwV/CDBJ2nHMXsNKDvOC4CiXUzm4VGlaDxezfPUqzuPoH7DLXZ7pLjvdDCJ0N
 VsmXh6AgfMf27TTWxvZPW0Dslm1M72GqdpyQx8NWTt5oeubw2H6KkTfSzEAWd83lvt/L6V/GqXR
 HlQpyuCV//AvUjC5wXxAZhsiBx3IBY4nZ3/EZ9zBV8szkRWXpCPHMvRa0EIt9P
X-Google-Smtp-Source: AGHT+IGLme3x2Ng/f07RZoW67xnz84j5DP/TeuewLy0le9/Bq16JZ7Pe7g29mJr5Lt2Mt2h0b+4vqA==
X-Received: by 2002:a05:600c:630d:b0:471:1765:839c with SMTP id
 5b1f17b1804b1-4778fea2bf7mr114591505e9.20.1763411924405; 
 Mon, 17 Nov 2025 12:38:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e442c2sm335227675e9.7.2025.11.17.12.38.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Nov 2025 12:38:43 -0800 (PST)
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
Subject: [PATCH-for-10.2 1/3] qga/commands: Include proper Solaris header for
 getloadavg()
Date: Mon, 17 Nov 2025 21:38:32 +0100
Message-ID: <20251117203834.83713-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117203834.83713-1-philmd@linaro.org>
References: <20251117203834.83713-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Solaris declares getloadavg() in <sys/loadavg.h>:

    getloadavg(3C)       Standard C Library Functions       getloadavg(3C)

    NAME
           getloadavg - get system load averages

    SYNOPSIS
           #include <sys/loadavg.h>

           int getloadavg(double loadavg[], int nelem);

    [...]

    Oracle Solaris 11.4           23 Jul 2020               getloadavg(3C)

Include it in order to avoid:

  ../qga/commands-posix.c: In function 'qmp_guest_get_load':
  ../qga/commands-posix.c:1408:9: error: implicit declaration of function 'getloadavg' [-Wimplicit-function-declaration]
   1408 |     if (getloadavg(loadavg, G_N_ELEMENTS(loadavg)) < 0) {
      |         ^~~~~~~~~~
  ../qga/commands-posix.c:1408:9: warning: nested extern declaration of 'getloadavg' [-Wnested-externs]

../configure relevant output:

  C compiler for the host machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
  C linker for the host machine: gcc ld.solaris 5.11-1.3315

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qga/commands-posix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c7059857e44..66f3e6f6733 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -43,6 +43,9 @@
 #include <net/ethernet.h>
 #endif
 #ifdef CONFIG_SOLARIS
+#ifdef CONFIG_GETLOADAVG
+#include <sys/loadavg.h>
+#endif
 #include <sys/sockio.h>
 #endif
 #endif
-- 
2.51.0


