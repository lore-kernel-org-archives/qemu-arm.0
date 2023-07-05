Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3579475ejy;
        Wed, 5 Jul 2023 06:32:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40tFYZnorvKyk5yBP7V7hP85UJlKHJOmurJjS9R6iyUSNXrM3Hu6H2w97aVqQ8ta/7XnEs
X-Received: by 2002:a05:622a:1826:b0:400:9aea:b6d2 with SMTP id t38-20020a05622a182600b004009aeab6d2mr21672108qtc.66.1688563973097;
        Wed, 05 Jul 2023 06:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688563973; cv=none;
        d=google.com; s=arc-20160816;
        b=blBvMFEVCHrTs9YT/vwKH+UXoKmUVeuNjPrxVADmuqpE0fkF8IhCskuHoWuQ79MG1G
         X4iqiRydIEv3dfYSo4tzYkO2+MSsIGhwBUZUkNkzeqv+k0ScIT2S0DKzzDWyQb0TKDVg
         RM6iGzZ9Tq2aQ/cZMz41qaAzabD7+fzeYzD+7TP3sF7BdCpLnNw7PE22aGVo39OwpVHU
         k5m861JAYbAeVOPM8SQGFEWUj2uq0h5syTsTyh/eTobI7L5m2DKscCQkvcN79Agiir/G
         jkBq0pmfrlUplYMbgvNPKV6CzGl8EHrJXIg4QjQ4WBiCHNEg+zxv7WvvtYsTUcGzjRpQ
         y/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W5L5O6YuXvA1gkJxg2X5z0QB/Yl+Zb8DVDs3tCRC3SE=;
        fh=QXqlxiHoBliGFMptr7ZMhDvY0ya7oCRNrlYjmpX9sZY=;
        b=hvhF23mkw5LhcfPKL1HWCvwD/z8Q1PZZIqBuDH0lUA9KBAMsNdyGm1v6IxXuAJkyRK
         PXsxciPgGR/bmoHWPC3h/q7w8JypOBJQKjGtXdfO3lQPZAqXrNe1rCEbgpWJ/5l3Kahq
         c0D0xpNEmK97Frd1RAsjoMInmMawl1Cs+NcjFIRK7cUh4Zc1ukbIpYxWjIJA1sTHVQhA
         YfQJq8ly8yBQ35iKxrCNBn8iqPJl73aWUK10654470YXE267fQnySBnFagJCTOVDDiY3
         6lvj2YucQN2dRek5fWhNzc8hLoUhY0nHUW09w9YhFncl3q5LBK5DObRwJjxQV8cMmxCe
         a8Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smJuboJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85745000000b004018e5cbd15si13064061qtx.143.2023.07.05.06.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 06:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smJuboJx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH2ca-0006Ol-0k; Wed, 05 Jul 2023 09:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cP-0006Mf-Dp
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:31 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2cJ-000219-ES
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 09:32:27 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51d804c7d14so7669179a12.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563938; x=1691155938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5L5O6YuXvA1gkJxg2X5z0QB/Yl+Zb8DVDs3tCRC3SE=;
 b=smJuboJxZxqWVhq2qfGMiGBglMt5r/4wcLpj/V5ygXtpT/rzOyu7yFPnr1eNgVviIs
 TsOi44QXlc9o5XP5RWAdTuoOHEJVO7TOKcYfg4AY2cog87IDysIMMHSrz7d8wsoRCYOC
 p/rAm2IOKT45lVnnZecaGs6vUSBLz8O4Hu4Vo694upTmxMr4I30+J7fbqRzI26m26lvb
 OCo0quaefvK/laFKpXYv/2J/JueWU71eUBOy94O2MCzmfNA7fNoJJecLVNGeq1jIHoz/
 x3n8GhqGfXhnTVusKa3ghhyqKp8jn+KUANJSDAjSQx3OS9201/pmOSFSc0FG0zhRTWSB
 StzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563938; x=1691155938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5L5O6YuXvA1gkJxg2X5z0QB/Yl+Zb8DVDs3tCRC3SE=;
 b=QfLi9Iku2umrYloIH3IKNwLhCtTI6/wyQ+cjKTMpfLsEX9b+PqZGh5nsvakm1brzt+
 Tdm0SB7fc6fAxhX4QRQ6ARRvmlSbZJeII4g2Pw02bpHD61TLqXrFmDZNYcvc0YpbN6l1
 SOEUeiiYmywEF49Zm24t7qy3zVTLcY2yVUE8yeXb42XOapcWAjI3FjOaqfdts+8wkFII
 jaeyj/28+T1gHywL6LlOMXc+zfyxPq480OrycNja/GskJUyoi8Hx4rS5bpq+W+6+05W0
 9eEWvmWcL2NfDcpYGNTY/MpAKDl1/+RVScKoX4GiKmMIe25Uy1hRFTaLmxYY3bpEMDeA
 e48w==
X-Gm-Message-State: ABy/qLZKJd9Ax6HoCO+1CiZi7a4jJ4CWym6dF/y451A0S+1QwxaAUQzp
 QUFzqhwHznY/CcL9LJIv6DJzIQ==
X-Received: by 2002:aa7:c644:0:b0:51e:29e1:b6c7 with SMTP id
 z4-20020aa7c644000000b0051e29e1b6c7mr392572edr.33.1688563938463; 
 Wed, 05 Jul 2023 06:32:18 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7cd05000000b0051da8fd7570sm7823672edw.41.2023.07.05.06.32.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] chardev/char-fe: Clarify qemu_chr_fe_add_watch
 'condition' arg is a mask
Date: Wed,  5 Jul 2023 15:31:37 +0200
Message-Id: <20230705133139.54419-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: OYQ68RDGiuyB

qemu_chr_fe_add_watch() can poll for multiple conditions.
It's @cond argument is a combination of all the condition bits.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/chardev/char-fe.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 8c420fa36e..309960046a 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -179,8 +179,8 @@ typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *
 
 /**
  * qemu_chr_fe_add_watch:
- * @cond: the condition to poll for
- * @func: the function to call when the condition happens
+ * @cond: bitwise combination of conditions to poll for
+ * @func: the function to call when the conditions are satisfied
  * @user_data: the opaque pointer to pass to @func
  *
  * If the backend is connected, create and add a #GSource that fires
-- 
2.38.1

