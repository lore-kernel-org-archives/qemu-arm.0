Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12996EDEBFB
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY87-0004k6-Br; Tue, 03 Mar 2026 17:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY85-0004j9-N5
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY84-0002Ri-5K
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so52930395e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576530; x=1773181330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXoZ/fOhayTS8r0vRAm++6Mi1cXikEvcCxkP8GuhY3Q=;
 b=kg0FfzW9jYgQcquMqQeVZKov/EwkSt3HGsZ+iPvUaharvQXzRugTHOw9WT9OOVv4ah
 CEkUlnV+wTaegJMsOdwgjK77+qlQviiEyGitYCKMifI/WJWpv+bXHxmQ75WJE9YP/kt8
 JKiKLk1rIsnN9YU/ixFaynaLhVam7P0nTsa3QdjDDNlBMlqB8Zg+YhEHBT3ZgjogI05W
 bkMZrsQpC3mUiPmOBjQQ2S6r7jbWBwjd0FvTMzmHl9aD+BRte8BF9Jfes0ZTzG3hkplI
 frm9CaSTuYOvGQe6pNn86XpHhNaHprG0Lc4CBRS40sbFi+Q07k8eLk6sDRGag9sHi8Nf
 JKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576530; x=1773181330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RXoZ/fOhayTS8r0vRAm++6Mi1cXikEvcCxkP8GuhY3Q=;
 b=JcYgpho7P7Cpy62NqdecTEbJcDYMFWeo+bFX9ecWyP0wSMNSkGrb0LPnEO8yn8u3Ro
 Db/lEuhslljd3mNQ35PeBWjuXpAMLw8HumWGub4LGv5XrvAjcTL3mrjU5kx2MnoDrtcj
 KDSqaMpXbNmDPBGeLRAMGntxruYf2dfDvtwUGrH8MCrFt0im2MWPJRrfc+DZwGw3Q920
 BgRL6XWUwxVEQAn+I5VKwIFQi6MUmTkySuIK7Ak3ljmNFs6ygvgxp4flJ9EpQqkrE7d9
 MwrNgt58nwzNcTJhQ+PXlbDpF+gRiuxq1bN4eHStpvDN9tTsTVMRFloGuoooiQyDUAE/
 B7Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa01gJSpD1juSYPrWEYKO449e5HozKuhZPZwn3aJr1cPQxraGg/MG+5yWYxkUkD1MwdTZS9+sBAA==@nongnu.org
X-Gm-Message-State: AOJu0Yw27ulFKP6CRr2z983Y2iTvHywvZxg3RQd9eRsa5zcFcIU0Wuts
 m9lO/8Lln4VId6aZmV6rGxKHnnhafBx/vktFFcfaI8u9DpZkwevcrKWr
X-Gm-Gg: ATEYQzzm34BSykI6lm41bV1QLWCg2rrkkcrwbxiifK3Sy/rbSgL4t+EocYrmu0STm0h
 kZ0cLqy7E7NO+KCKepgz99StphA1Bg42fIUKlgicCR/0XqVeLnNqubogQCNHY0N0Ctdh6221SFu
 lQskyGTXVcNW3StuvmdkXksEIVw2ew1IctvJ30di3sK+1x8QZ+HvGNxDhR8TXCRls7Pzt8R+0dY
 eP9pEPD+07UnUmalxN1xy85RKQKGrmDOqP9+JZPVVDzzau+nzIKRpznsf4mHVPZZV7yjlxUTCBT
 F/jnSoXvxf60QAtWRcWbxVEu8cwEWd3NTUpWvS/XLGdcbFQMl96PIh2XWDZoao3oILVaAInnku0
 prKWTBmqN9N/CIBgpJNKaxDv8Bdj1ylacan4p5Aaiyu/U35MYREkRpRu1qVJ+Efq0VUF0WYTEt2
 H1oKAfxp4hJLmwhyHEsaoPnFaqwtXZXT8Z8up8gt5KLoQfs0BFsUlDNyT+OALiGJ9Sh89nhCb5r
 9vqcthu6CjA/3bU4aIcbhh1kdtNn5Y=
X-Received: by 2002:a05:600c:4592:b0:480:52fd:d2e4 with SMTP id
 5b1f17b1804b1-483c9b78c20mr335635305e9.0.1772576530219; 
 Tue, 03 Mar 2026 14:22:10 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 07/13] hw/char/serial: Remove stale comment
Date: Tue,  3 Mar 2026 23:21:37 +0100
Message-ID: <20260303222143.142741-8-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

There is no "is_load" flag and one can tell from the method name what
the method does. Remove this stale comment.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 2c558cb9fc..f73de1ae4f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -281,9 +281,6 @@ static void serial_xmit(SerialState *s)
     s->lsr |= UART_LSR_TEMT;
 }
 
-/* Setter for FCR.
-   is_load flag means, that value is set while loading VM state
-   and interrupt should not be invoked */
 static void serial_write_fcr(SerialState *s, uint8_t val)
 {
     /* Set fcr - val only has the bits that are supposed to "stick" */
-- 
2.53.0


