Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2655317ejc;
        Wed, 13 Mar 2024 11:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzu0ehQDRBpYSITsGbtmdS19HlHQdyIPDJBUBqBJexBd/clw+bxDgMgxqfKLiTHo4ZiA6swAf5Biqn0U7vLj7AlVgtUwQG
X-Google-Smtp-Source: AGHT+IGsM7LeHNPJZaUtOnYUBxpqXEbLLEv8dbVg51rnOA9vTyPriCOpE0PUaYEcXYopfHOYjIpX
X-Received: by 2002:a05:620a:1920:b0:789:d14b:274d with SMTP id bj32-20020a05620a192000b00789d14b274dmr671359qkb.23.1710355891484;
        Wed, 13 Mar 2024 11:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710355891; cv=none;
        d=google.com; s=arc-20160816;
        b=kq9LU4OuxgjgNerQhJPUPUjJXSkAAiT1n0RBeo9y4pAtl5ArISr8FiAA4bzTBlHILj
         URtvt8Vtjn7+HqVgA9FfLuRT9PAw5ugi3dqBxDp4ttMqYidV1N9UhSg8Bo8c9NgrW0qj
         kkeO5NSwSHsctALQMw5SLKgoDLI1eDEmL+I/9wQxwITJP/iccVRp6CNLXYTaYDgHwggL
         Q5d0FEgkDVRFxfFn/rx2AcjUd97xdkxtAGGqkO6fbk92S3/rgAiEqDmwToX6AqTtURT8
         qRoxPRNS3ldyXsI2BT56FzM4j14/D22lzYWBEr8sibk0i6bzu2uo2lwzohClM4oP2p8o
         XA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FWk3AJvtwG4+M7tAK6vUDxEOFolgTz5/lAeIi0nhTag=;
        fh=56zcmgBtUxUXUPp0YWabHIoiig8aO2eVuinpGVZR5MU=;
        b=SXT9gtUm/U+jsq/U6E7xDB5e2GlGVcqEggbb9+SJfLYdoUL/7eRJO5ePUfq2RBQ7WQ
         Hdz8wpsTAVAkmRTMXnSDaaOJcj9GZgPne8vR26FuyrGXXOUlGlo+hS68UL9WjHGT/Ntl
         zq/CTZdy/W7xaTXgzNN5KxI0naUutZYjDqjVb6YliPkAk8CXFFI2StOighJMue1ftVcN
         PEoAZkUJKjJaSzsRCmcA4jWXPX4WRQsiUZZA/v54PKR1DRO4Q7ZaBq3YPVqwihYaENhW
         d6+e6qMbKDBYFY/+vQvoZxKL/3Sh+GcfWEcfXT0TLyzrqbzwznnhuJI5cwqdE35E0Jb4
         z8NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQBs14mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a37c246000000b0078819050b61si10218842qkm.186.2024.03.13.11.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 11:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQBs14mQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkTgd-0001oO-JK; Wed, 13 Mar 2024 14:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgX-0001fW-SV
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkTgW-0004GB-7a
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 14:50:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41324a16c9eso1120685e9.0
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710355839; x=1710960639; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWk3AJvtwG4+M7tAK6vUDxEOFolgTz5/lAeIi0nhTag=;
 b=WQBs14mQmdx4bWTKOZGi9MDsZizypAaGwIHTJrn0xyQQpGx0vrHjbD6XQUOPwtkjMN
 0egPfX+B8/3uwQOa+qWavGBdcJOzruXY5qDHb2rcolYYWZUzsJ+5J6E2C3yzliMEZ8E4
 Ggo6vzpmH/1QtMYM5QX7Kv7IB75HKMw+Ko0sHZsNLz6TPepKty0CKyL2mzWfZKF2fIB1
 CJj57Su3NiaztYBuqQlg7IxyACSk9fszeWEb5n09s+X4HWuqk1EpP0UUfMtWNigGPGbw
 TgNlFfYlXuR2wiw4TBEHilHlnpVtinR6Q/GKai8+DUhqEojxT67Xm2a9au2Qum7/OLji
 E0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710355839; x=1710960639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWk3AJvtwG4+M7tAK6vUDxEOFolgTz5/lAeIi0nhTag=;
 b=sDgav6GtafP+7gRfAlopQE/VNr7IkJk76y9wZl99N7fB4Qk31wTD38dq4gFcWFZ7CY
 B+PX/xVgRUTrTkTs55abh79H6GR4VJVUMmkXOUnyWoXJqaQmCR9pL+3pcuBs2MtqIO6T
 W7cbRL8V47mqXvBFwiK/9OzqM4gIapGebVFi0KKvbdj5BOHffVgaziD720LyRlsPa0M1
 ezpaxe+zNOw8iZY/uK9jhflXh9MmmjsUKwcfXMMs/s/SpCLxQpxEO9vf3rcf/HufIF80
 ywvzv6U/ixfPsp4T0GrFIvq6PFKzodEBg0URO2z9T9HO42S//WiOqMhzzoQ5H6HrRhsj
 Wl4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2EA/rSqktDUI8eVBlrO0ebJG+KhelfbaS+v8ADLdRtzOvjgJowKP7eMeE7fWzcDNtB6S7fMKMt/cuzqG4cp1tjzbo
X-Gm-Message-State: AOJu0YyCIPKaS4OPNp57IjmnxbUFiZ3QVYwXhVz01KngK48FNi5bS/8i
 zW0nSWlTWsSMLx4oHlU4Mr8HYvIUwxpnUvXKPtF+89wlSP7neUZWpQoMsftf280=
X-Received: by 2002:a05:600c:1f94:b0:412:ea32:e7b0 with SMTP id
 je20-20020a05600c1f9400b00412ea32e7b0mr540827wmb.40.1710355838743; 
 Wed, 13 Mar 2024 11:50:38 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b0033e0dd83be1sm12254046wru.91.2024.03.13.11.50.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Mar 2024 11:50:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 4/4] meson: Enable -Wstatic-in-inline
Date: Wed, 13 Mar 2024 19:49:54 +0100
Message-ID: <20240313184954.42513-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240313184954.42513-1-philmd@linaro.org>
References: <20240313184954.42513-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: XKW8ccAA1Am7

Compilers are clever enough to inline code when necessary.

The only case we accept an inline function is static in
header (we use C, not C++).

Add the -Wstatic-in-inline CPPFLAG to prevent public and
inline function to be added in the code base.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index b375248a76..f57397aa53 100644
--- a/meson.build
+++ b/meson.build
@@ -591,6 +591,7 @@ warn_flags = [
   '-Wold-style-definition',
   '-Wredundant-decls',
   '-Wshadow=local',
+  '-Wstatic-in-inline',
   '-Wstrict-prototypes',
   '-Wtype-limits',
   '-Wundef',
-- 
2.41.0

