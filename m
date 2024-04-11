Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp855145ejc;
        Thu, 11 Apr 2024 03:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI3JNVRnBd0rwjhBQ1og/ACXoAPms1BxBU/h6o4D69A48hI2tjCiaKkPxr6US1UZZADSjq2GT6a8bPBBkqvv3ZZNH5gTur
X-Google-Smtp-Source: AGHT+IFsAoUqW+fHAeur8WbUMum2o6QPJwvikHuEka+vsFmbJPMD9wd7p3YD+9d3U3E9rhBxNgJl
X-Received: by 2002:a37:db09:0:b0:78e:bd2f:1088 with SMTP id e9-20020a37db09000000b0078ebd2f1088mr3584981qki.4.1712830802516;
        Thu, 11 Apr 2024 03:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830802; cv=none;
        d=google.com; s=arc-20160816;
        b=tgXNydXwwrEzQdG4XlSFTzYYwoIq+ayeFH4+1jrvdzocSiZFwD9dikMQ66q2D5e5p7
         fhJAO4MI2tSXA1eGrZIeNk7hnuMoMB+hkvaZPcM7v9jYVNmNXtoALjW8jXMAHWqjPMxK
         QGmI3m+7NN4cVcJuPUutAXVpWQIWyPX5PGor+CZ5AF9PO3iJ2rnfGQV/a1QA+0Ct5qBG
         GjY2tmtYLiVM1nOwJOzGpJ1codGokuC057tg8xG4NWqJKfv+Yp7I8sPVXbxiX1yepplL
         5oGEYTvRdCwxusNqmre6PvnPkGqM0e6vdLDGYEFTlHL6S0ODk512naDgZh7t4Pp2sqeF
         uy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0NkZbdhuZimuvYHJRoYOcJ4m476kCV6CLgO0HzeNjj0=;
        fh=26SfYfEj+utkPiFaGsK8WBn3XLLjCJh8H8HBQX0FJ24=;
        b=NAN2j0cN16Akzu4zk6gEFvCBCirxJ90f3Iky5yP/M5X4tob/EpjlnbxNqxZxD3g2Bo
         cjsQMvgUBwfkeA4Gm8N/gzMBqdMCmNPEqQUq/3sJLs8Xx1zz1e6UD2SyXdgR4Hn5fyeI
         mqw7lie/VlgN2X8YNWD415XNyR/IIAlkTV01+mPWlvyZrMOr6Kb3b0voUGHsIUGvr7gV
         vRMBYMtXdl9vnrIM1rYFRtyeSwrVDaJRfJQnOvXL+kzT9vWjg/6Yg+90SI3qpT2PBTXi
         Cg4BocqwV+c/QbwNI4rpoS0Vm9O3woaNLJLCD1wvGzqoFjK0HXjzIDaiJq+aQ3sf+oqq
         IY/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wQxCVpM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a094700b00789ed3aacdcsi1232122qkw.239.2024.04.11.03.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wQxCVpM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurUr-00061e-N5; Thu, 11 Apr 2024 06:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTy-0005FG-HR
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTw-0007Vn-Fe
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-417d08135b6so5089685e9.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830590; x=1713435390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NkZbdhuZimuvYHJRoYOcJ4m476kCV6CLgO0HzeNjj0=;
 b=wQxCVpM/tsYxZblIZozkm4q1DN38xsPQGDxCvZ/LWsfnrjZmLFdc3Bmz/InSAlBuOl
 WSSOlBHgqsCdTq9J0gd3/6+X6eHdDbvRT18KtjJQQhtrThT+VTCkKevSEfLTRhSiwLf0
 26vece0JrNTX0aFxfO4ZX7IH1qD8e3KLW8VhwNCTtRwlpQCUjpXF6ampdmJwgPR9RWRf
 2FsX0Aus4ZAHSERlEUuuEEJba1NGrjYtFfH7qAwpx5v3WmGI+QIM/GeLgJ4cYavRazTR
 5JariKb09vxVvWzJZZ5INsijJjHfmeJZmq5XY0DnF7q7di9mYRnkqIuGnO9NgWxUhLSD
 AyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830590; x=1713435390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0NkZbdhuZimuvYHJRoYOcJ4m476kCV6CLgO0HzeNjj0=;
 b=W3HRr42wzn4MfQgdUE+TMMp2tp+Pr4aJtSTEHC00jYV869ZJl5RGye+4U+g9VtAOK5
 mfS/kA8bRUsyR/ZmrtVo4b5EOsXPW8v6qYbsavsN5rJVVA/XEpOwz6KXVGMHks2uB8Lw
 vFukbDyh5is1qegphSzccsKLUqIpKERa2Tomuax4GjlCUdbCluaALeFy8Z8mNKj+t+Nw
 X9T4zS0X2uJ42Izu+7YvcZ7Uiw1HT0PlshZEMANz6bMP2ow3ZBtjWDekMpiGIqFknZsA
 QWvhpeUbUzvvUr2WLD33xFh1MN2E/JzEFtc5aOpoxfGwy2nWADGhLb2QcbKlC8uPAG8d
 38/w==
X-Gm-Message-State: AOJu0Yz93u+9s5u8DwBJMz/UuJasNbdUChifHkoT+Hlr813lELDc2aki
 jcBeeBaBKC+NowoyWp2WL9UYzi8o5sVSf4DdGcYH4wyDSvdXX8qLunE3Ix4+JoY=
X-Received: by 2002:a05:600c:468f:b0:417:d75f:fb4 with SMTP id
 p15-20020a05600c468f00b00417d75f0fb4mr1182890wmo.10.1712830590481; 
 Thu, 11 Apr 2024 03:16:30 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b00416aca5ff66sm5046906wmq.19.2024.04.11.03.16.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 06/13] system/qtest: Replace sprintf() by
 g_string_append_printf()
Date: Thu, 11 Apr 2024 12:15:42 +0200
Message-ID: <20240411101550.99392-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9wMa18TMJHE+

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by GString API uses in order to avoid:

  [120/169] Compiling C object libcommon.fa.p/system_qtest.c.o
  system/qtest.c:623:13: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
            sprintf(&enc[i * 2], "%02x", data[i]);
            ^
  1 warning generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 system/qtest.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/system/qtest.c b/system/qtest.c
index 6da58b3874..22bf1a33dc 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -601,9 +601,9 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK 0x%016" PRIx64 "\n", value);
     } else if (strcmp(words[0], "read") == 0) {
+        g_autoptr(GString) enc = g_string_new("");
         uint64_t addr, len, i;
         uint8_t *data;
-        char *enc;
         int ret;
 
         g_assert(words[1] && words[2]);
@@ -618,16 +618,14 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
                            len);
 
-        enc = g_malloc(2 * len + 1);
         for (i = 0; i < len; i++) {
-            sprintf(&enc[i * 2], "%02x", data[i]);
+            g_string_append_printf(enc, "%02x", data[i]);
         }
 
         qtest_send_prefix(chr);
-        qtest_sendf(chr, "OK 0x%s\n", enc);
+        qtest_sendf(chr, "OK 0x%s\n", enc->str);
 
         g_free(data);
-        g_free(enc);
     } else if (strcmp(words[0], "b64read") == 0) {
         uint64_t addr, len;
         uint8_t *data;
-- 
2.41.0

