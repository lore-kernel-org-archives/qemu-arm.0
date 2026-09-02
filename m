Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84562C61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1oK6-0004RM-4V; Wed, 02 Sep 2026 13:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1oJz-0004QJ-FT
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 13:00:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1oJt-0004N5-Ma
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 13:00:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49b392ccaacso19491845e9.2
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 10:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788368415; x=1788973215; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VxjCDADMFtbU025cbNtGeiXEjtB4LHc2bYXLYp0e3hw=;
 b=Z8lFUfD4Pvuzn/qTxaZ0dmmw9qsxBphuL8UQgQ2S7eN6ymVxV/oWRqdZNKwPr9FsaL
 EpeXU8cb6GVbKQnWKa4CpmMFYZEmP9nk7/I2e9GlACcdh4bKiX+z+7LHcbbhEG3WGYpE
 nKdBAaDEyJgN2lW7sE/TI7l6lofiwG4NuUosfcM7BGNe1gA2sLaO0d4xfrd2XZ4OjvFt
 LZoF6plY9rBmKhfM6ykCMkloggk2Cm/EpSZkdkv/uK0MZ+420Oa82SOyeP2+ubsAP1zc
 gEwVyrPZVapomnxMZoppsoDDrDD3CVYP9iZZkw/634K4k6UifV8vK+bvMre3j/KtKqaQ
 Fdrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788368415; x=1788973215;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VxjCDADMFtbU025cbNtGeiXEjtB4LHc2bYXLYp0e3hw=;
 b=YnlzSXNltLYXTNIFAOk4Dhs/l9KgR5FmLKCy0XvzLNanKqgvHbbtM2qE6mBwGn/3C8
 639NdC8ib3CKV1r17sJhbze0jCPbd09wmT1ZyoodppvlziVDAe75sCZpC/+iv1ZYHJxC
 0cZH+cBxdHLohT43o/mdgqQ4OFJ7jSCcDpk9RtSSAt2p5Ei1FaoPzPe/UUxYCKiuQy5r
 Cn9rWKZ3gdZnuSow+mZ5ySqtKVa/BpOsD5ajwuHyhjgwxoKVv8Pdvi8VeUwRwP+9aOyk
 lwc2ppl8U+JzAWVnd3LN9dTpsTavpwTvYFrOdYMfPftMuGEZ+trAqJLN73f3cnK7re82
 Y+Kw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTnnqigCNPiru52EH5gCyCdk/RD6grrRu3dzRR0+cDorrdyohgnzpDlnWt/0GaDhfVYhnhctoHxw==@nongnu.org
X-Gm-Message-State: AFuF++lURpXi9ef4g9KCFtXbkZHWfqYs1ORVdQASd/N6bDUobKsrSKvB
 WKThFW8xyayov+iscdz+pDpQWgc9BI5irApE4eUVQwQ0cMuhEJXkjbmnQSbOW9hOQm8=
X-Gm-Gg: AR+sD10AAwAO3cOYo4FdDgu4jp8DlAf2CrBl/npciKOi20yuHXaNjwRgMKcAglRlbtR
 gJx0NGw0JGsW7Mp7uOMhOSB2d+zd6JLT1AgRaInS0tvqz2+qhD3IMYJ1kpAHpdK+Dbg0Jsnd4In
 KYfe8YDfGhQmu1bvIEq+fjHCaQmMyxixTExY21ANL6CWfaKPiC0QuGGdJbGV+Bg/GbvlbX23/ec
 XfcIlRrL8Ad9vKK5mVBJPA16rkZigvLDNLgmlwoR/hk37OvEpyQcA34ih92qPqQrx+BEEBnz37O
 M5udFlT6syDH6QEP4TtHruBqAYKrB/K78ozMObLrc3UQEC/JCfi3qFVyjrP4GxMWcV9xez046BA
 mJPGw53zRjzLIZuLemgfzhU8YXU6UYjw9h09IcyVbDvgu++fFXXBa9rr/sh4z7a90HmeFPsC+/N
 gMD9JavyU1LFkHzFosKzOQ2biLQ/itZvRxS1IhV39cuwJvxF32w+15Z9/e6Oj1
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id
 5b1f17b1804b1-49ce5842935mr139277165e9.9.1788368415039; 
 Wed, 02 Sep 2026 10:00:15 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce55259ecsm47071755e9.2.2026.09.02.10.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 10:00:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4BCCD5F85F;
 Wed, 02 Sep 2026 18:00:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:STM32L4x5 SoC Family)
Subject: [PATCH] hw/char/stm32l4x5_usart: Accept character input upon RDR read
Date: Wed,  2 Sep 2026 17:59:55 +0100
Message-ID: <20260902165956.582901-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Looking through existing serial devices this seems to be a common
pattern so it makes sense to me this is the right fix and matches the
API description.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4389
Reported-by: Jan Brittenson (@bson)
Suggested-by: Jan Brittenson (@bson)
AI-used-for: fetch issue, apply proposed patch, verify build and qtests
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
NOTE
  - testing with the AGENTS.md patches - I asked the agent to:
  "grab the details for 4389 and apply the fix to the local tree"
  which it did. However it did remind me at the end:

  *(Reminder per QEMU policy: this is a draft for you to review, adjust, and commit. Remember to check whether `Resolves:` and `Reported-by:` headers match your preferred attribution.)*

  ```text
  hw/char/stm32l4x5_usart: Accept character input upon RDR read

  When the guest reads from the USART Receive Data Register (RDR), the
  RXNE flag is cleared to allow receiving subsequent characters. However,
  without notifying the chardev backend via qemu_chr_fe_accept_input(),
  backends such as socket-based chardevs in polling mode may stall and
  only deliver characters once per second upon poll timeouts.

  Call qemu_chr_fe_accept_input() after clearing RXNE in
  stm32l4x5_usart_base_read().

  Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4389
  Reported-by: bson
  Suggested-by: bson
  AI-used-for: fetch issue, apply proposed patch, verify build and qtests
  Signed-off-by: Your Name <your.email@domain.com>
  ```
---
 hw/char/stm32l4x5_usart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index dd1b0991956..0b02dde1f8c 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -441,6 +441,7 @@ static uint64_t stm32l4x5_usart_base_read(void *opaque, hwaddr addr,
         /* Reset RXNE flag */
         s->isr &= ~R_ISR_RXNE_MASK;
         stm32l4x5_update_irq(s);
+        qemu_chr_fe_accept_input(&s->chr);
         break;
     case A_TDR:
         retvalue = FIELD_EX32(s->tdr, TDR, TDR);
-- 
2.47.3


