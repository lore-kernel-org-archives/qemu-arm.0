Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5083207ejc;
        Thu, 31 Aug 2023 06:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5we3NpmZ1YDbJ8qpLOBQhkHhrfhmR8T1LdAE5U+YReLOLbwTmLFRVPUZ+nhtEcrVQyXn
X-Received: by 2002:ac8:5d94:0:b0:403:b395:b450 with SMTP id d20-20020ac85d94000000b00403b395b450mr3374794qtx.2.1693487485055;
        Thu, 31 Aug 2023 06:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487485; cv=none;
        d=google.com; s=arc-20160816;
        b=LIAnBfqA2rcMFrfFFqoDZF/XdNgu7rfhVTkVGOIvYZXBxvNulpcW6CCUyh6ODnTG6C
         pmUAp+5O8VTzcT8Ka2bwbPX4frYWLjAWaOZM65nGoF21FA6kzjLpEbZbVLuyvDwAe6oz
         vSAbgHMUMyYw5rl97sLF3qyy6XQiLvi2VZxD0iNk+T9zrMvxblJPNYe92jbMMC2xvsQB
         TG7rthpDOWWjkjxIBYDv2lC/kSlmnjW0osPxcnMbtqJrdZYZTpzChEIm9tFsDaO/80pb
         TmKkOKGx1gK1CuPZsnGHTix2CkCJbiM0qJw3z4ZRPy/8MluSh5V538zFlqdzCwp1oBK7
         Rhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lc+zehBV0WTpSARPKJiAuhNqXhUfl1UCHLHXG51mOVw=;
        fh=L4xYMHiSCfHm3TO7F0WSv42URi+Ecb3wLcnZOGsxOjw=;
        b=mxt01OKr9/VvSbT7EBApfzdfKopqcQcT17Pwv+/o4Rw0E8d0SjCPYty37e0Xu9PyWT
         DF7Mq8CmagUFz/2oi8T2ul/uV3X7xFfK/qMg5kUD6IBbJW1e5XUF6lDxyOcmDymHhyxS
         kESSw0eJzmq7zYWYXjJzP9Aisy0GRTztJW2BiudTEKnW4vL7KeQDuDVTjqaImXThBBtz
         58gXfrqY/UiVgfRhv4XYz0qdIigstlkjA/hOGWJBLC8Lpq2/c8K47qnyKvDmCoQw4og2
         JwSq38biLkREnaes4YLPmmGof78LA4AmFFhavrzY3DbQxF6UgPFGyZSuYpNau22b31mj
         K4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKVejxWm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac87f09000000b004121c851f94si846976qtk.58.2023.08.31.06.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iKVejxWm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhJ2-0003VM-LL; Thu, 31 Aug 2023 09:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhG0-0003lw-Ge
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFw-0005ff-Ce
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:58:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401d10e3e54so7222775e9.2
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486718; x=1694091518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lc+zehBV0WTpSARPKJiAuhNqXhUfl1UCHLHXG51mOVw=;
 b=iKVejxWmiOlaX7GwaZhPI00nnP4mRWxHV5NWtMmhza8vkLICaoFbTz8k/1WUU0RWiy
 M8JeVs4gAIyD5kk7Oyq3Kaef91CwojZ/e7qJdzBOALnplBBJKtkmiB4v8VMA/49mexq+
 431hsYh3t06rueoznQNw51kk7G11tLzB4NQlGc4EUhLD2zp0muQo4ehPsRmSBkyGx1X0
 elSXlpr+O6NqfVFqVhXKV+7YZzoQNt7lu3B6rcihmzv1DoybQiicBqWLZFDudobHGZTb
 PUnRE+swSFTxAJn7x7yLGKc9sVdLewRwCj0kDP8LihWaPg0EyBHUkOdqOpWue6Btdfoj
 0a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486718; x=1694091518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lc+zehBV0WTpSARPKJiAuhNqXhUfl1UCHLHXG51mOVw=;
 b=SREDqkxei0L0+llDzCMqT9AvpNNe8efUcrdKIYKVfhkSAI7AMoUOHHctXLuuubDBZT
 KJuWhNrSTh3F0FzUdXCl4rZqLbAH16Z6PTOD+g7OQlT4V2V3VOa7l1R/GHc23EXONUSW
 81kVLPaTPxLef2HUN3TDdZdtY5kz/+y3mTZSpxUfS99rnubwKGLxEO1W6b/LKSzHtP6u
 JNN3eOQ9Txowmn04ID4CRmGoWLir9eGtwMv805h9sk/MaclNZ63Znu1lSlRG9JAFuo0D
 FZBp9dmrt1G1GCixQsh0olDeT64ze+kn7M4Kf4vJr3LI7sXHXxz9DlKUBJV7SgTmpbkN
 STpQ==
X-Gm-Message-State: AOJu0YyeyEa1vTDhFLfn7BCyoESH9qdWaY3dcZ1aXzJVQObgE6mbcY1G
 ZrG1sIfwwN6LTUAu1F+l5wBfP8vDA2hLIPHkRJY=
X-Received: by 2002:a1c:7215:0:b0:3fe:111a:d1d9 with SMTP id
 n21-20020a1c7215000000b003fe111ad1d9mr4139380wmc.25.1693486718798; 
 Thu, 31 Aug 2023 05:58:38 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a05600c218200b003fef5402d2dsm5122852wme.8.2023.08.31.05.58.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 19/41] chardev/char-fe: Document FEWatchFunc typedef
Date: Thu, 31 Aug 2023 14:56:21 +0200
Message-ID: <20230831125646.67855-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: Yn//nuRbIzrX

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230705133139.54419-4-philmd@linaro.org>
---
 include/chardev/char-fe.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 8c420fa36e..0109602d63 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -175,6 +175,20 @@ void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 
+/**
+ * FEWatchFunc: a #GSourceFunc called when any conditions requested by
+ *              qemu_chr_fe_add_watch() is satisfied.
+ * @do_not_use: depending on the underlying chardev, a GIOChannel or a
+ *              QIOChannel. DO NOT USE!
+ * @cond: bitwise combination of conditions watched and satisfied
+ *              before calling this callback.
+ * @data: user data passed at creation to qemu_chr_fe_add_watch(). Can
+ *              be NULL.
+ *
+ * Returns: G_SOURCE_REMOVE if the GSource should be removed from the
+ *              main loop, or G_SOURCE_CONTINUE to leave the GSource in
+ *              the main loop.
+ */
 typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *data);
 
 /**
-- 
2.41.0

