Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A41D65C56
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:34:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaY-00021V-CO; Wed, 17 Dec 2025 09:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsaK-0001m1-H7
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:33:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsaG-0007EC-JC
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:59 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso8470615e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981974; x=1766586774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKaSMi3pt0gIgplZvrijN03Z46js5TRmGQTJjQZggCk=;
 b=iw3VW9EnFvgK0Ka7oF0kkKjsnkdNSCHiq87BQ8+HzYJzo/ZpYfyDK/ZIiVJFF5cCNk
 Ex9085VWscYUJioZA9GOHpQDUY5tYcm/kq3bo/qPgvdV3Nwxo9QxEHngvLp+qeRQnJ7Z
 wLBZZwmUEFhFXsNF7u2cMOOylRRSDQEtit4MWbcg0Dx5Y92+ee3kwxBudfSPeDpdBIYM
 zWU8f8My2nhdpjBRNMSpJF/qnQGPEh9WjkOROGvCItkB2a2JqyJ23NJxz69FA9kCt43d
 PJeBQ0RO3LsOkulXNGTs4RU9qxWpqETbQvZri/BQNRBEcKyo2tlMF4QoQOhvwlbKxi/r
 Ngww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981974; x=1766586774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SKaSMi3pt0gIgplZvrijN03Z46js5TRmGQTJjQZggCk=;
 b=aiJErfsyX2lq6EsjINxqtiSrbbZdpSaytZ3s5QrGGq/O3XKhXxutWq5IHJkoXaMe6J
 oKOzjHx59ohHbb3mxh21vMjaGXijZU3T252UsSbrbL3/b7Nbz1CbSX1EHn9lLdWZ5D4p
 dbJk8GU9TRiuiD+h0kEqb4S3FE97pKB2XoACHUZyZ1V8LfviiT0Kh6KWbas4DdJKbtQX
 CiFyTkF0I7xIxqlx7gs6Luf9sMtsrAY2K10cA2Y72ldr/ZGjjpkD+vDgsRUZZz+OTLuE
 pdhhgcQPSgwcTjHGi+JEXY5kEOorfwq621ZvgKsLG1zehpJSk3dXYVjRNcMuoNjXs8r+
 EveA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcjy5C8N2t5+uxdDdF5PDiP1QEo3eW7pPYVUWLmQ7XEY9xcB3nnK45Ymcyo4W1SEJUlfjgv8LziQ==@nongnu.org
X-Gm-Message-State: AOJu0YzwXUGuHPzd32pEoRmMZJ7eobGGdWzm59oOVcUxjtQbt54odMj8
 vQo4BQXQV2+Xe0pK7mbkzDgbhDEU29pnURf3QH3xm78YLqTHuOEevgfU0O1oNi4j4W0=
X-Gm-Gg: AY/fxX4PL3W4Dm/m3EeV6ZuBJ7ztMtm6NxI+havYmzWeDJfxxPdjYopU6bVamwsXYDq
 yPnb2jKp5RGD3AtLdDNdj5AnRJSTtvyisuCHaPYlun1g6hL9x3OcB++5dPRNbuyKS+YuXdQrUcj
 9wTZFlP4mdy1sMkWbYCKBuz9XqkbjoM8qkWz7U7ujN/ibXSg/NVEq18v3PhTWNNFV1csXDwIfGg
 9/w7Qc4x1Ak4br6OeQf2b/oXGXftsSzr71GoNePJwjN8D3jAsgIVP29VJU4n/rspVd1Xp3xM/hD
 j37g57jT2eMfVE87rCNsmp0WmEh+IB4bpTahmGxxYFEK2seVR5mOTFxKN2xpe2OcK2ObpsyuXj5
 knYRddQE5F7xcxV0rMFmoDApozOd4Gs6h74w5lCIzXoboQjCH/typXQueFp/QGj7ZiTzSHGb0Y7
 E9qpCQ2gHO8xt0JrXCKaUWU2dW0vFb53FdYNJOFhXHpXuPsKhK6lpvrbwEWnIH9uV4MIxHEjA=
X-Google-Smtp-Source: AGHT+IHRVKUtS2MEM4IPi/MXXjtHq2fsKmWv8GwyE05H6zNhhaPwSybZ3Ilytm6Dcec8WiosK2BWMA==
X-Received: by 2002:a05:600c:a46:b0:477:63b5:6f76 with SMTP id
 5b1f17b1804b1-47a8f90cefamr184197965e9.25.1765981974512; 
 Wed, 17 Dec 2025 06:32:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1d20absm43939065e9.4.2025.12.17.06.32.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 08/14] system/memory: Inline address_space_stq_internal()
Date: Wed, 17 Dec 2025 15:31:44 +0100
Message-ID: <20251217143150.94463-9-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

As its name suggests, address_space_stq_internal() is an
internal method which can be inlined like all the other
ones in this file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory_ldst.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/memory_ldst.c.inc b/system/memory_ldst.c.inc
index b45bfecd137..d5776678edf 100644
--- a/system/memory_ldst.c.inc
+++ b/system/memory_ldst.c.inc
@@ -422,7 +422,7 @@ void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
                                DEVICE_BIG_ENDIAN);
 }
 
-static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
+static inline void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs,
     MemTxResult *result, enum device_endian endian)
 {
-- 
2.52.0


