Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp813145ejb;
        Thu, 25 May 2023 17:26:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sWOTBOa65GVpfTYvfTlQjQXnl3fc8wJpJFuw9TGxxLMULlZrIPFtzWJr0TfH77aVSRqch
X-Received: by 2002:a05:620a:2624:b0:75b:23a1:8e30 with SMTP id z36-20020a05620a262400b0075b23a18e30mr560567qko.1.1685060776671;
        Thu, 25 May 2023 17:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060776; cv=none;
        d=google.com; s=arc-20160816;
        b=n7ConaTiKKKqPqCDr4PwqvpUbCro5d+6p5dczyS7QLke+0iFGOyK870tYd4shDV8ax
         ysmkEfGinm0hGLmpzHH/U78dCBIMRs7Qx9t28CD6sVm13/6isvmY/9BvBZHUpRKMv9UN
         sLUjyfgYbCPwwUirHnpmyOxIr0k6r3XEl1J6P34x2m1Q4VintJkMgAB0sQ4e5jjDYspU
         jrxmxkVMpTjq7yHrBsXEhMk3LHERiT2530C4V4XGDnfCjMKVPq9ckvboe+Nsj5CQfEYn
         kyw31UWz/ZHDYrh09jOw693DN3xjMdvH32anj5BqBr5QJiW+4VQHkw5pK4h1aa4yKEM0
         AyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gjqymQC8hq32i71MwJu3fBXWpYLB+n1ecpePYVgdZ/4=;
        b=WgG+de27yZtPSsmysETvVHMWB0VApGy0GBe8pwi6GPRnR73X3Tvg64TR7ftGo9c16x
         XMXBXTisVg/fXJgAZiVmy4hGCbqhvtGrWrpu/Zsd/KRhisZJCWktGlA/TZ8Rf4KM90dY
         ODW+Y8f0uamJVYZmpa6W2fNUc6fgkNiGWu7lp9p+TD0OTm3+DDs5K0QvN/n+SMivFmcR
         jtI1Dvtk7iadZ2kcL+Xzgcoo9fJJ6V97P39IO+5WUI2laaLJ8Z6FmQNqvh7VZ6xLSuYW
         kOvZ2d5bZEhj2owfDy7xXeXekzWoEw3P+umuR1Reeo8kAx7gJBTwAWm40iNRGDR3XbS9
         gt+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGoxVflE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ae9ec16000000b0074e1f15fc12si984444qkg.523.2023.05.25.17.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGoxVflE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q2LFB-0002X6-0M; Thu, 25 May 2023 20:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LF8-0002W1-Ow
 for qemu-devel@nongnu.org; Thu, 25 May 2023 20:23:42 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LF5-00028f-83
 for qemu-devel@nongnu.org; Thu, 25 May 2023 20:23:42 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-53063897412so157199a12.0
 for <qemu-devel@nongnu.org>; Thu, 25 May 2023 17:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060618; x=1687652618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gjqymQC8hq32i71MwJu3fBXWpYLB+n1ecpePYVgdZ/4=;
 b=nGoxVflEL8AOyv0piJWRnwYflCRKLMbwnBRXIL9/o5/DC+9/OCEzNhcUxda+sUftxz
 aDlJ9la1gW2q4IE/Y+8ewO78UATICfX0/WJUje1HphqYVtt01bU79Fh0A4hbGd2OvqZt
 i4mcIDsVlcTQRvuCkfLICJuhx3avfDx/re7naiNkw/P4eL/NBDiFMi6IjH8UObmruJy9
 4kZk357tcW89+/KeuHkqaKdIUDjpZ8YWxRNHtIWD8G96QSTkek/5j6+huf2NYJ1/OZss
 KvP4KNZr4Fia6AV7g4crSmRGNVEmnwin1whRXOym3x89zcIaaPWuEd/bmRs3r1QeYKrO
 NcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060618; x=1687652618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gjqymQC8hq32i71MwJu3fBXWpYLB+n1ecpePYVgdZ/4=;
 b=HED32l0SjgKnT/u7ZGdIHKzxvnL7X1tuq1i/dpC7mF0+sKNSyBMiK2IdlHO87m/mzd
 wldHvhC6VkQowYk2MjxHwYEJti+52DgkrR1WMEceL62mxsp3FX6teYGhB7oRggAGs7dY
 krm8tVb+iKGO3yePPalG3DgfpCNojrXwBOe6RVJWBwlTzk5bwFuQzItBTYUTGgl9ZX5V
 qfQxYh/a3/Vc2yJYbi/PgxzqxSUOEoG+zN++sBBqIjKKoz6hG7ieGxp2ub4KBE+T84xR
 tmrsL9QaH8Oon6HH7lOQ3N8KhsCzX0tRSmtNMvT5oW2bNDFqi63TXhyYjd41vg5T0S25
 FI7w==
X-Gm-Message-State: AC+VfDxJBocIhf6ku3RsaBypYtCJhbpQxMkqOkWTlCCp/W7TcQcs4WP8
 tIVhlzG+Uunl18omoRsRwuzbyKITzQyczz/Zh9w=
X-Received: by 2002:a05:6a20:c1a0:b0:10c:4e7f:1a5a with SMTP id
 bg32-20020a056a20c1a000b0010c4e7f1a5amr12752187pzb.49.1685060617971; 
 Thu, 25 May 2023 17:23:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 03/16] meson: Split test for __int128_t type from
 __int128_t arithmetic
Date: Thu, 25 May 2023 17:23:21 -0700
Message-Id: <20230526002334.1760495-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MEItfVDbz7UX

Older versions of clang have missing runtime functions for arithmetic
with -fsanitize=undefined (see 464e3671f9d5c), so we cannot use
__int128_t for implementing Int128.  But __int128_t is present,
data movement works, and can be use for atomic128.

Probe for both CONFIG_INT128_TYPE and CONFIG_INT128, adjust
qemu/int128.h to define Int128Alias if CONFIG_INT128_TYPE,
and adjust the meson probe for atomics to use has_int128_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build           | 15 ++++++++++-----
 include/qemu/int128.h |  4 ++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 78890f0155..b5d923ad2f 100644
--- a/meson.build
+++ b/meson.build
@@ -2545,7 +2545,13 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
     return 0;
   }'''))
 
-has_int128 = cc.links('''
+has_int128_type = cc.compiles('''
+  __int128_t a;
+  __uint128_t b;
+  int main(void) { b = a; }''')
+config_host_data.set('CONFIG_INT128_TYPE', has_int128_type)
+
+has_int128 = has_int128_type and cc.links('''
   __int128_t a;
   __uint128_t b;
   int main (void) {
@@ -2554,10 +2560,9 @@ has_int128 = cc.links('''
     a = a * a;
     return 0;
   }''')
-
 config_host_data.set('CONFIG_INT128', has_int128)
 
-if has_int128
+if has_int128_type
   # "do we have 128-bit atomics which are handled inline and specifically not
   # via libatomic". The reason we can't use libatomic is documented in the
   # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
@@ -2566,7 +2571,7 @@ if has_int128
   # __alignof(unsigned __int128) for the host.
   atomic_test_128 = '''
     int main(int ac, char **av) {
-      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], 16);
+      __uint128_t *p = __builtin_assume_aligned(av[ac - 1], 16);
       p[1] = __atomic_load_n(&p[0], __ATOMIC_RELAXED);
       __atomic_store_n(&p[2], p[3], __ATOMIC_RELAXED);
       __atomic_compare_exchange_n(&p[4], &p[5], p[6], 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
@@ -2588,7 +2593,7 @@ if has_int128
       config_host_data.set('CONFIG_CMPXCHG128', cc.links('''
         int main(void)
         {
-          unsigned __int128 x = 0, y = 0;
+          __uint128_t x = 0, y = 0;
           __sync_val_compare_and_swap_16(&x, y, x);
           return 0;
         }
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 9e46cfaefc..73624e8be7 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -481,7 +481,7 @@ static inline void bswap128s(Int128 *s)
  * a possible structure and the native types.  Ease parameter passing
  * via use of the transparent union extension.
  */
-#ifdef CONFIG_INT128
+#ifdef CONFIG_INT128_TYPE
 typedef union {
     __uint128_t u;
     __int128_t i;
@@ -489,6 +489,6 @@ typedef union {
 } Int128Alias __attribute__((transparent_union));
 #else
 typedef Int128 Int128Alias;
-#endif /* CONFIG_INT128 */
+#endif /* CONFIG_INT128_TYPE */
 
 #endif /* INT128_H */
-- 
2.34.1

