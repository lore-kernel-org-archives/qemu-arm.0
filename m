Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2956933njc;
        Tue, 25 Mar 2025 15:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTFDNnBBxwgWojEnVF31aDd/ihProugK4g42DN0TO1rOEC2UNFOut+/QKHaO+afKAMaUs154AfJ7/3Mw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDc52XkufnrJcP4z+JxbaWPB9WmSGyU4eUoVNmFWmlo+yqW48fRNvCOGZ8oIeWitFAyqFe
X-Received: by 2002:a05:622a:4009:b0:476:71d2:61e6 with SMTP id d75a77b69052e-4771de1935fmr300969461cf.45.1742942885087;
        Tue, 25 Mar 2025 15:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942885; cv=none;
        d=google.com; s=arc-20240605;
        b=L1axU/wUNZf8U3UIKsY0e8wGDYo9Xp+QTXS2PHfE43kdl4Vd/3jHcJFFV6Im7SQium
         xI1eIQPCo4tNfFXlkFm6MQ5Ho6d+Fjj2cP/lxataQRf8K/uULv5AWrXX2CDVtZBTMSEu
         qeSZsbaV7iYV9W7c+4McBNd9rVKt6p79goR8qk6ZJfllnZF8rmevJcP+BTd1V9iWcYiz
         gD85ZINpFSjAhD8dJhkSMKb0SgcKA8X4/NIxRoq223Pq9qYA6skHYCP7VNK/RTQ8argt
         ziw7IeqLLWE0vu06wLw7ZcPE/2XUb7V1f3lEMjkmLascyCG9WpLTaKnP0mGbbX3KTj9O
         dseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nzqWg6apFTmrvlzKNkVE/DNpvTLzQXt9JAyNTfEbkHg=;
        fh=o7fu5zEDeGj+KXGD/HIeqQq2vOJcCXTtjC8xtpbKq/Q=;
        b=U2zr9AT/l84a7rF25+3CA0aHkl0SPlCSjDRbCw6aH0m7jGZQ09kQtxMh0t3zepWTLd
         5scwm4POUASLMj8tTzs2pcUwVXBFUYgOy9l6y07QAwo7wWsjSrWZy/eWPiwoTpNyyWpX
         URg+byHiMAoFY7dG8+bhP3Yz63gc3EHaTRjMHeE9+uYc25JsSb4lJCmnr6+dhEgu6fJk
         1fWqZe6eY04QGj2q/XEMt0B8PF9ccL8YmNw9ezOO14CjNcEmUkX87TvCs8pBvbp0oWOM
         KjHMxgNpCbHqJyKmM8gKeDYvQqioexJa1z6UCxZOB8HiJL6C6eBhDc81CLvaHwLqegrA
         EtpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdNBCWWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d15b1d4si111838591cf.110.2025.03.25.15.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdNBCWWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0H-0001Vq-UG; Tue, 25 Mar 2025 18:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzu-0000v4-V2
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txCzr-0006yR-Ju
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:43:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso46812765e9.3
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942626; x=1743547426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nzqWg6apFTmrvlzKNkVE/DNpvTLzQXt9JAyNTfEbkHg=;
 b=gdNBCWWI6gAs8m7v05zYj0ItwDQlMvWg356mNwUEH7wfNqOK9xLUU2j8u6iAHxFbpK
 9AoE2buGVuj9+Ep6K2yZeIYWnE7CEhqn6slMUIBwsExl8yFbj1iyjAatt9ZpKX04Af20
 ZRxGP4f+BIGJaBH4EjbIWApoD15lyoJAj6IKKjQV9hThKNTPnjzkzl+MzxiAF2KEamyO
 HZqDvW9PkQF68VxAamWONrJi0I0iW3jAsSLG5PZS6PrV8KQc0TbJTl5GlLtj7mmg8SZU
 yzg5w9rrSBQ3SYdrfBiSXrjEP0q+EEqogguwJg56icgV5uqMNwqWndZ2+GdvUzTvJVZs
 5U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942626; x=1743547426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nzqWg6apFTmrvlzKNkVE/DNpvTLzQXt9JAyNTfEbkHg=;
 b=YEUotrZE8Qvp1r4V+1JAwvyBc9rHnXkG6dzxnxqz1H5FixmwSbJwJO0Esw5P/vsDlW
 U+pcl5uy/tEuSvNckJ8hXn4yA+8hsrTfYcHPPqdJglbpX0six2/v14w95YslhEH2QN8P
 PwvQTN8G89/8mzRoe47/eSRpOwnatoSUSxfHefuPF31RKsEfhJBDhOZ2YSRIxAIcKTFL
 itWMNDY8NMhkOVr8OPfmdlmNnd7zZ7fF4yfFPEpjMAkW0m3aXWiTJUCH0fG5u8aTw2Y3
 We9/MemWgzt4M9EuYa4PGuP1rAHmswmcV3QrGCHqeaKybBPdHW1B9XMcOslEWzBDa/98
 MFyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ihQF16Zs0WkItWBCMhcZnn3Bfqa3P5na7ldSHv3TEMCLrDmh2GMcpC9Z4ciky8LDCLDwKkX0Nw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0UC4WbXYG+4GAypk9y3YjaNRFuAevPsZjhGpEv6iwa8ENmp2i
 yxLV1zfzUoosFZaRpcx7WRFEPBpF8umtBusjcsXP776DVe5trdy4mBrSSoEelU4=
X-Gm-Gg: ASbGncvBNIG5dPuLKdOrtqeVUyuNDZc1n+C3jYOHetZUwYo7dWx867HOODthnDXDYyj
 rPHQgnDZaccY2WCKPkWM2oN8kqcnOiLfURzDpMgSBmJU90CPkNGUZY8wsYVwwqAGc05G5xCZ3rs
 bJ7UeLCay1OYVBdOopcDTB0wfLGo5ZMvwwEcOkYCiSndo5JOGIQp/1IZkywGJJqjJv3L1mlq+Hw
 89st44FHhsJ7CGQwpUM3vQW1nPSub+7C9dkR0oEWqXzIGhdhiZRxNSXbDNLRy87gllCCta878l8
 PZdHAGGrS+8tBT7q/2G6aRHu+fne0Ed9MtL3lgaDMirryPDyrUZCebZdPzxbbxOLe5VXsgmhkNF
 z2U2str961fGMUtTBQwfY2j98mjT/4w==
X-Received: by 2002:a05:600c:1c19:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d509efb48mr157940585e9.12.1742942625793; 
 Tue, 25 Mar 2025 15:43:45 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b565bsm15149881f8f.58.2025.03.25.15.43.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:43:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 06/12] hw/i2c/pca954x: Categorize and add description
Date: Tue, 25 Mar 2025 23:43:04 +0100
Message-ID: <20250325224310.8785-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: NLwQOxnkUhqh

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/i2c_mux_pca954x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index 779cc4e66ed..100b8d86093 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -175,12 +175,18 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
 static void pca9546_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "PCA9546 I2C multiplexer";
     s->nchans = PCA9546_CHANNEL_COUNT;
 }
 
 static void pca9548_class_init(ObjectClass *klass, void *data)
 {
     Pca954xClass *s = PCA954X_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "PCA9548 I2C multiplexer";
     s->nchans = PCA9548_CHANNEL_COUNT;
 }
 
@@ -226,13 +232,13 @@ static void pca954x_class_init(ObjectClass *klass, void *data)
 
     rc->phases.enter = pca954x_enter_reset;
 
-    dc->desc = "Pca954x i2c-mux";
     dc->realize = pca954x_realize;
 
     k->write_data = pca954x_write_data;
     k->receive_byte = pca954x_read_byte;
 
     device_class_set_props(dc, pca954x_props);
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
 }
 
 static const TypeInfo pca954x_info[] = {
-- 
2.47.1

