Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp488183njc;
        Thu, 5 Jun 2025 12:36:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/MxX/d+CWF2huo7ZoNmZChp5uCN5zDCyW6JduvUJ7GldQGJCE8wfwLPF6eFvRN5p0musvE+66JLm5zA==@linaro.org
X-Google-Smtp-Source: AGHT+IGMazqsbzAWa1kKyiQ/Ui/W6i89/v79FYSG3v9NfuSwMLfR7kdP+ISf8uG+wAuxy2u/crok
X-Received: by 2002:a05:622a:5c90:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a5b9e52b0amr18552161cf.31.1749152210968;
        Thu, 05 Jun 2025 12:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749152210; cv=none;
        d=google.com; s=arc-20240605;
        b=BG1yvwmbgl2hfvSCVTSzBIanSBKIU6tn1DL9gANEBEuQQejpTz0zydrl+9/AbkIfHP
         pHKvhBhs6ZUTti0Q2/JQUoJNx/3LEynw6eKY4kgtqSj4CyF5RH3AaXBsUFsD7i0OmK6p
         HyWFlb118RlLSM9x2emocRK+WvjQI9V6UbvIoqgxFqbA2yYIahdQEZRkDtmNaqF5ld5H
         FzF3GY9TX7mxj5ywHAQqsVeeAXC3qkdCylH/be4I1X2fhoQWsAP63Dcg2eTVtrlDQV0r
         Bm1n+xlgKKw8JeWMPZwM/OYHLgRL+kjWTO66srZ1VO9L4EztGTkPbsvKw6+dggYKNQeN
         /NXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0H5JejayswNFHuNqdTgm/gmscONTNKgClj6tOp77taE=;
        fh=4h8nYkqSZR/NsvEVgsamRLVoGtMitGyEZZrWhPRdZB0=;
        b=K7cQ877OzuITviOXsUXXsuCsVArrfJLjP8X91fUeWj9kw5mhchhtHaBJxoLbHoILJg
         GUUSKsJyvFuhsUluCAVTvamCKTucGNopH04kHsO1I9gk0k7efPG5JJQWoh64YYOTZTr1
         ZVAKamC7P7a6+RRVvDBl0/qByTrMm3WtNxjqWwlEZ/nyGZ4Uzpr33bOMEIoFoxE4Y++F
         zUPW2Cdup98D7m1wztQbAyPINEM+0MoETGv6+U6pzU0uiCIEzofjNtfw2PRAllSR5F7F
         Gxpj2PfBahpFyt7gopL/jMoPfAYdEnb47jcKPe7l8dU4o68PgCKQOLZGLLXT/viPl45v
         IbBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPJVzBor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a61985d4d7si128981cf.272.2025.06.05.12.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 12:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MPJVzBor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uNGNj-0006mD-8H; Thu, 05 Jun 2025 15:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNf-0006kn-Ca
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 15:36:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNGNc-00017o-S8
 for qemu-devel@nongnu.org; Thu, 05 Jun 2025 15:36:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so35612f8f.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jun 2025 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749152158; x=1749756958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H5JejayswNFHuNqdTgm/gmscONTNKgClj6tOp77taE=;
 b=MPJVzBorwr+KwcPCwwXI0/edacaAKd1su9dFvRHqAbc1Ly49UrxFBNE5Q20wK/0v+Z
 5XhSWlZ3LM94cBhYyqUaO9cSQULa0plEmXbkbbH/Ii6PDyrOsuBFk071us8KZBoxOyEN
 WjaWB4h+dwdez5Gw5cI+jSHGSSk5GyaOwNq2macnlFB4sc2HqvcaZNojRicPl4jL4Rrn
 vpGcTd/PtGr4ZV/Ta4JCiKyDuXAgQdNGgZuS3UjE5PgvIKwGEzxkRPt3wfnxqUiM8p33
 8KGRENZDXavIyPJ8Vi+um4Vd5O7XlxvH8rOsPCU4sKJW2lk00RPkjZf6N3JuEuO8ided
 ty6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749152158; x=1749756958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0H5JejayswNFHuNqdTgm/gmscONTNKgClj6tOp77taE=;
 b=xGPiUC4hvvWurMK29xu5zLor4W5yKeZW9o7PsuvFyx22vZ5/znM7Hs19rwLiAg8vRW
 51KAQK9v3TliuFYE7XMIgRKaxxJlO5b/RAiQhUQC0dF2OuY6CtUicGb50XDWkJOtS14R
 BQ3v+k5RRRKi6NoqKa0S/DCw71G0HhZvoRJAePuBIJRegZwp5+Kn9lc/J6qm5cXwzYoQ
 On2PjA7Qzljbqp168Nc3tMK0G2o2fZLxFEVfCxZG350mHRo9K8CrvR/2pAG8+UbFsbTg
 QeLYcdMwHclOd3v/MjDDZ1q3KcuSoQMHFX3oTxVGo9R2kBIkm4D1YJDDAT6o0Z+wGNw0
 CrBg==
X-Gm-Message-State: AOJu0YyHyO+7nOBdz3h+Izeb7LzASJNtIDigtYGzRKjDakktVfreFWMb
 QC++8L9Epi2NmfwkGuw0IRLYxkIT00qrjeXmeF9N8HJgwbi5beZzGmbCUHWjVMZsEbFnItpJjIR
 k+4Ve9CY=
X-Gm-Gg: ASbGncvxHdgEwGgPzqKpXmMVnr8fJTakPK3HoommRqcTPepdwkOUGuQCfmepJ5DDnaO
 D9hAdAy3WnLwTg72njlkejgsBTuvzWNqHd185UiOjf5Bi70WgGtXTmaI2sJbgYQq8LhPCre9dlY
 DJRQ2hzK1xz1Q4dBzu+zZqHnSYZxqjcmxt5fn3rXlnT6blWnmz2n7PjY168U9519RKTaPgSfn6j
 A+WLFxUiC8Lg03CDW3Ehmwv5WaZIpNQ1dPGZFDuewvOMTGc7b0wBzqBNnZ3CPG95tr5JHy5YlDl
 isZrD/K+MCwFBVyXqImsA1/9/dtsCTsGMorK4r9JGnDUA5Gb7f4oiohnuJQ932nfb4bHnpTdOzH
 JVROgH+1BUTQyMaD5t6qfvy5k4gyalkEDsHZ0
X-Received: by 2002:a05:6000:220d:b0:3a4:f744:e013 with SMTP id
 ffacd0b85a97d-3a531cb8521mr290974f8f.30.1749152158248; 
 Thu, 05 Jun 2025 12:35:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm59169f8f.69.2025.06.05.12.35.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jun 2025 12:35:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/4] tests/unit/test-char: Avoid using g_alloca()
Date: Thu,  5 Jun 2025 21:35:39 +0200
Message-ID: <20250605193540.59874-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605193540.59874-1-philmd@linaro.org>
References: <20250605193540.59874-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: X3sKIuu3ozZC

Do not use g_alloca(), simply allocate the CharBackend
structure on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-char.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 60a843b79d9..f30a39f61ff 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -993,7 +993,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
     struct sockaddr_in other;
     SocketIdleData d = { 0, };
     Chardev *chr;
-    CharBackend *be;
+    CharBackend stack_be, *be = &stack_be;
     socklen_t alen = sizeof(other);
     int ret;
     char buf[10];
@@ -1009,7 +1009,6 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
         chr = qemu_chr_new("client", tmp, NULL);
         g_assert_nonnull(chr);
 
-        be = g_alloca(sizeof(CharBackend));
         qemu_chr_fe_init(be, chr, &error_abort);
     }
 
-- 
2.49.0

