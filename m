Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2825226ejb;
        Mon, 20 Mar 2023 06:43:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set9MYsFe+FFt+lYEc11FVQlU9jwoAP49bGqhUbttEP7BInyU6wh3fBPkhmZVXv8tDcP+B5Wz
X-Received: by 2002:a05:622a:34e:b0:3bf:bbaf:5c82 with SMTP id r14-20020a05622a034e00b003bfbbaf5c82mr19246066qtw.21.1679319839138;
        Mon, 20 Mar 2023 06:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679319839; cv=none;
        d=google.com; s=arc-20160816;
        b=oe0MH0sK2LxUfXckmWP3fI8hutJCHar+A22biAvCsIl7RwLV2S7+tiZS/pklb63y2K
         xrMnOOvz/Dk33oF2SewJeufRqbIA9qSOXMap5wUh3do70OC5YoRF992Xvy/zRUa04Yp6
         f36p+wqP3rP8R7WSLeUFEkVOcqeLRUo6dWj/SejpJq1Zt8Gn7ndUBQC8dP8t5h0VtIB5
         O3IbxVPIrQW0YZF0UaaDi6ixjZpoZ+GeMjRk/VXtXwPe579y7FI/sjuE1aXhsJGz5lLm
         AUyxPteDuitPAWrypvAHbuZt/eC5NPFTq0XtQ8xBqhSOZPf3ojPkSmY1xKsd8f5tx4qY
         qe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z4R55UzzwJbIFt/nZZoBFKmO5Aye9nghmbpLFsyQ7dw=;
        b=bB3Ma5BKmYlSYcXcEkVQZAWHEIXN30Q3sabqxfMm9yAY9v9/9FU3DnTem8ir8sVWWP
         glG3XR64XZp13LfOCZMu7DvmqTyVDXDp+egZOwvVq4xmPJJuIXWrAutp/t62iR9BFki9
         XbIgBEfn8muNmNLmNTBWjGudxvN6mDDaBaXd4opqmMvWZQnnD+LnTyeLqkKIVw+23KOb
         lRNaDGSgHgmJBXGuMTH8XdkbQGGAuZsMmJrNPi+WoCRYz4f+xPnrTcnYDzgpNHXWUijy
         ZGQ8AiXKIz9s1+xZUZJ1jgeXVYOE+aRpOxx+OA/zAsf1pQFtZvBCJvYE2KTj+dJoJROy
         03wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MkAEBo7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05622a008d00b003d6cdb3f764si5954915qtw.373.2023.03.20.06.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 06:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MkAEBo7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFml-0006vd-E2; Mon, 20 Mar 2023 09:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmk-0006re-F5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmi-0001wE-TT
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id i9so10403338wrp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4R55UzzwJbIFt/nZZoBFKmO5Aye9nghmbpLFsyQ7dw=;
 b=MkAEBo7XBPIN3WB1Okk11aFvpIMh7HXkYTZ++sbfZTtiBg533ac1IG/SAqTmKCl8Dr
 jyDF9TO2qHfgszZ9CVXirBHvxXB/84bB8S1LLuGlksk7yOEwHdNCeBPY5OVIE94354hR
 Xb7VgXtebEtO4W2v4L2CcNZCwv30JViD35HkYTCD94gA42ASl3xRo9LvsfKYgwLMMabo
 zWCRLRByWAEV62XIiMKeoUP41qrQoqMFMZZ69tn4nsw37AiPK3ILx3VWGWrNFplQgmH3
 sr+xQA7akW3WpbCjzjnZrjvvKO6YbjZEVYp0Jc5HAlr5PKVgcn/P0oNdwDiXlPghAyFb
 f5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4R55UzzwJbIFt/nZZoBFKmO5Aye9nghmbpLFsyQ7dw=;
 b=TQXvs/aFlqJZYVy6cCZJSRqnrUYYeeU1BYiavT3Q9xQkA5YhmwWfdoFdjhrUA7l5Jk
 EyeZuLaHCULg65bI4siFJhFhpCEWf/sFOTo8E+8d+L0/xGj4X/X77ft5gQ2yJ6VVPgtz
 xL2rRj+cPfMLAXEEhxuTw/pQvGlwi/2k/DD1S4Lex/vXasQ/zb0KjaIH2HVHsElZdQtY
 vnnkm4TRoqfaFHqZtR9TZrm0aqgazt80cbk93tqIQt6hAz4QHJV74vKDSyBC2cN4yedw
 yrn/tYQjdrtox+YCCVLwsJ05SRHn6iq20s3t0FX/UxdTbSc3/OaIft7BXnZqaBl5LHe1
 nCXw==
X-Gm-Message-State: AO0yUKUsfbRaRD4gxErwaHQtNA6/jTrXvylzg5Pg2af3JD/WHcvi6OGn
 DZ1sX4DORtZpUQK9mrJpjx4VMngIeHOzYadc2zjLCw==
X-Received: by 2002:adf:e407:0:b0:2d1:f705:a602 with SMTP id
 g7-20020adfe407000000b002d1f705a602mr9668033wrm.22.1679319767378; 
 Mon, 20 Mar 2023 06:42:47 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b002c5706f7c6dsm8935371wrr.94.2023.03.20.06.42.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH-for-8.1 5/5] bulk: Replace __attribute__((noreturn)) ->
 G_NORETURN
Date: Mon, 20 Mar 2023 14:42:19 +0100
Message-Id: <20230320134219.22489-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320134219.22489-1-philmd@linaro.org>
References: <20230320134219.22489-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VmC3s/ZFPgcy

Under MSYS2, G_NORETURN is expanded to '[[noreturn]]'.
Simpler to use the same definition everywhere, unifying
the code style.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/os-win32.h | 2 +-
 tests/migration/stress.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 0c00890a5e..0b9cae13e4 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -67,7 +67,7 @@ extern "C" {
  * which gets linked automatically.
  */
 int __mingw_setjmp(jmp_buf);
-void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+G_NORETURN void __mingw_longjmp(jmp_buf, int);
 #define setjmp(env) __mingw_setjmp(env)
 #define longjmp(env, val) __mingw_longjmp(env, val)
 #elif defined(_WIN64)
diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 88acf8dc25..54a95c07f1 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -36,7 +36,7 @@ static int gettid(void)
 }
 #endif
 
-static __attribute__((noreturn)) void exit_failure(void)
+static G_NORETURN void exit_failure(void)
 {
     if (getpid() == 1) {
         sync();
-- 
2.38.1

