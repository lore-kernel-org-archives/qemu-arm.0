Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp984603ejy;
        Thu, 2 May 2024 00:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQwlnZfKnOfldCy+5pcV0PPFqYWxzodpwASJ+CF9Vf+rDXkzkJIxxZ0vhT6ITGvZssANFOcFOfANAakrnUZOrgg0WFIT+f
X-Google-Smtp-Source: AGHT+IGyyzzHzCnXWlBveTmh9bBrzb7PoCySAAe+zdY5TWUuiKi8zC/LSl1vUgeqxB0rUzLeaPwc
X-Received: by 2002:a05:6830:19d8:b0:6ea:20b5:f3cc with SMTP id p24-20020a05683019d800b006ea20b5f3ccmr4803303otp.32.1714635741338;
        Thu, 02 May 2024 00:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714635741; cv=none;
        d=google.com; s=arc-20160816;
        b=a2NV/Es/FTPLdc77JsKZ2r9Khc8EeZhFAuh6o+XFbcs75H0lcgbd4sJoaeCJ2jo9CU
         NtHAljt44dAIUmkUr9YLRk6E+DAJQ+oKJbkkdm5lAYnDekPCssOIfQsZjEtX6RD1Xufn
         XcOx8Kwx2j0WbTsYxzXAYislLM3V2lcp/XWFT01O/L0PNdoX0bjaa9qHqghHYEia/IoD
         c6Ugpqh5KKUurFTJH1/5Ikkl/MDF5PtPbBbW0+sENIw9oHqqFB43aWIlbaC2NEKJCw2/
         HL0ejHI4JC2VpBIBhtqXB5bUN7zHh2SyC2KpjDgvQBSvBbhOh80jJIqGa2JaDYnGCP1p
         QQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uJqQFQLxnDneJQpNwePbjyQtotXX3ciG0fz6r7EnZkI=;
        fh=ysFvVapCWSsrXxt2pUQROhE5Rwdkc4Hto/2afKI1B44=;
        b=xkvKGcvrmB//wbRG7x/AUM4sTGymqNA3vw7Asc6srAAnI4L0eqWSvspf5VMtIbTyVb
         tIimRFW+2qkXFx4zmRUSJ571a7zcZwlHMUyR1jxbtXerEwopTYd/DEFxaiVYuHDoVt5v
         Zk8Sp2MdtRFiPdaI11vNOinytVZ4VbMr71b6Ib3YeQqJ7WDRF3DNUSncKKoWNNZjw82A
         LJM0eD+eMnftaPYwbSTv/gcMNd3Lk50/OEvZk41+/VYl6SWtN/ewX0C19QsTeHiQmDVu
         T4rvY2Yl3Dzkwl2aCEfCY/uD2nU8z5daLatBNCYUP5A4htKBf0CRapyFooXD9w5LT9MV
         Ou3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOeuon0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl12-20020a05620a1a8c00b0078d660e8c23si390878qkb.479.2024.05.02.00.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 00:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOeuon0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2R4w-0008D9-3N; Thu, 02 May 2024 03:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s2R4u-0008Ct-TA
 for qemu-arm@nongnu.org; Thu, 02 May 2024 03:42:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s2R4t-0000Ip-Bl
 for qemu-arm@nongnu.org; Thu, 02 May 2024 03:42:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34ddc9fe497so666003f8f.3
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714635721; x=1715240521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uJqQFQLxnDneJQpNwePbjyQtotXX3ciG0fz6r7EnZkI=;
 b=BOeuon0KpcB/2NusDzgya7gRV36zYV8NiblZBvjvArI7CMzfCvoepBpcIHF15kiBCu
 lXAhyuyeYozCFedk8ikU8haNaQeMB6okb8a3R5Cb5wIft0Ue+Yl+Ss/mfe8TLOw8MSYH
 TplMSurF5D5X2nGJwpEjA//Hp7gFwIVAtEcCTenZgmwatZf8N6dXQIXVMy5KNuYcBFxH
 AT56i0rdKq3pFS2rF6z2GIr0+DnUVzmqNDfNfs2XSzO/Ba4Gyl5Sfat/MLqhWuCciQfU
 nY+1nkWWkAsQKAf327GWqX/xHz9o+CfDVPUrxxeJTf728kxTgzQu2Ld3BIv4UEXg7/+D
 kK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714635721; x=1715240521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uJqQFQLxnDneJQpNwePbjyQtotXX3ciG0fz6r7EnZkI=;
 b=Gqc9pfXHwHlyukrHlmiFPVMYDIatRe5YzH3FFrjuS6LnwhZ9v60/ZJV7xNPdreNWj7
 QNRnbV518UM3vzhribNR0MYKb8Lkxt4uUzZAUw/DwCHcY2ZJtvy7LENO5KKWq3Xa3AiW
 JJOy6BKxhi593djb9ftP6w7h+up5Y4OUxdPeYjO7FheB9BJUGqXEuUCxeSe8pTZt64XN
 +qbto9U9kKg5X1syN5CCfVIqXabjFiJvN4s5p/72Lh/4eUd700ueHolIat83t2Hmleg6
 OfjUzXvOC0nqELPdQ6gsUiMEjDmCZusv0v6Lm9Z0e9wbTSnV5WerGkCK/X0wC+P0GoK2
 7XKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFCG/+kw+I5I4U+CEsUJSGIs9Y5YO2uYbngX63cVpTMCOG9OKSlKtc0CG49vzjRycykNdbp8XuMB3B0cs0gOKiLygy
X-Gm-Message-State: AOJu0YzfsWzJmbCBveOefvYwk1e4AdeDwaXJBk/GJPFipGwRhR/zFrXO
 qjnguado88tV+A6agomwxcfqvQOxz17nMvKeaa7EvdTPWlDw7BbFylAoT9R+ToQ=
X-Received: by 2002:a5d:6ac4:0:b0:34c:fa17:f4fe with SMTP id
 u4-20020a5d6ac4000000b0034cfa17f4femr1168832wrw.21.1714635721145; 
 Thu, 02 May 2024 00:42:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.215.106])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a5d5917000000b00346ceb9e060sm556455wrd.103.2024.05.02.00.41.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 May 2024 00:42:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/input/tsc2005: Fix -Wchar-subscripts warning in
 tsc2005_txrx()
Date: Thu,  2 May 2024 09:41:58 +0200
Message-ID: <20240502074158.85800-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j5Vgd6l1tolA

Check the function index is not negative and use an unsigned
variable to avoid the following warning with GCC 13.2.0:

  [666/5358] Compiling C object libcommon.fa.p/hw_input_tsc2005.c.o
  hw/input/tsc2005.c: In function 'tsc2005_timer_tick':
  hw/input/tsc2005.c:416:26: warning: array subscript has type 'char' [-Wchar-subscripts]
    416 |     s->dav |= mode_regs[s->function];
        |                         ~^~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/input/tsc2005.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 941f163d36..fa93eb5d25 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -406,6 +406,7 @@ uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len)
 static void tsc2005_timer_tick(void *opaque)
 {
     TSC2005State *s = opaque;
+    unsigned func_idx;
 
     /* Timer ticked -- a set of conversions has been finished.  */
 
@@ -413,7 +414,9 @@ static void tsc2005_timer_tick(void *opaque)
         return;
 
     s->busy = false;
-    s->dav |= mode_regs[s->function];
+    assert(s->function >= 0);
+    func_idx = s->function;
+    s->dav |= mode_regs[func_idx];
     s->function = -1;
     tsc2005_pin_update(s);
 }
-- 
2.41.0

