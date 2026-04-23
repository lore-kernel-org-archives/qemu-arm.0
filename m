Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1E5FDEE3F
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 18:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFyOe-0005mb-RN; Thu, 23 Apr 2026 14:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wFyOd-0005mA-Ju
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 14:03:27 -0400
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wFyOa-0005ZE-2R
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 14:03:27 -0400
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-2de831d2b20so5455981eec.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776967402; x=1777572202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2dxn0WMrqvKqs3p8nkU2X7bmDqRObx6LQxESo5qD6I=;
 b=cGyXB/WwFhGo+57CywCcdmkQrsjfoSf7B/pMqfo/h2/bGdUm6EvUU4kXYNX6Ttizgr
 oX/2ovD809TLK3xLMIlyVoA8kuLV48RttcR9aRqB1ByWX3UKFWxfO5eFax/ohhY3Iejj
 EbL40a5KpMD53oEah4EMjXmMmE3rjn53mOnLjLp/WZo19wKdb4dQeQBX/R0sEDMRe8Wl
 truw0EyB8HAUkuoRIdHas9KdWSI/sONTUSbaBLKprSosFKqd/W59BEprZHsfALWHt/TF
 qglReisLCqLR5AQQFBIuTBpyHHMFAWApj1GaTFxyOs3KDt25MfKIXqzQBgDI+lyMVxjA
 hvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776967402; x=1777572202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A2dxn0WMrqvKqs3p8nkU2X7bmDqRObx6LQxESo5qD6I=;
 b=WMj2uak7WNNh9DPygqZl+9w6SeKSy+sl8b/4eF2J3HN7e0oj90CvaGiwMVgjqFBP9y
 5QTJqYVLVV+Eisx297qwHilsC0h96/jNDUx2fehWxbUkfWW6LY8l4ZXV5nVMYwxL4zLE
 g4FKRfog8ZxdNoA9pDnRYBJpA49O3hYUrs19xpWCmavy/9tiXgJnmcJY1uMGtU6UDw3m
 VQwPldtXgFc8c5j1ogFQ8VIC9XLS2E8WaWQVRrWA9POY1Sj52qEBpBrNgdunKklCEJqr
 n9+Rk6ahou01GNeu2bq89HmefYcmzW1my6lpnL+c06aG99n2IwyBjccgESNj8CT9gtKX
 LP0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8h2te8RLRF5Lf50xD9XCchFD5z9KHZVh4+IjHFT3dhO994ksjoKcjF+fWlWi6TqlCU6s6OZwe4ug==@nongnu.org
X-Gm-Message-State: AOJu0Yynibvy/xpavkXoVcOaddGdSuVVzOTHUyKVpBqHyn8lniopYuqq
 Nn829Mjms5jxYPUNCNUBHS3FMEMCb1Scu3D36innAEBHMzR9sAj46x52
X-Gm-Gg: AeBDieuCBCWCgIYwE8+ISzkfLKpujVK1KFioSYNiqRtMR1UhsIDRHBY+6JQSYBTnM8B
 lDvjz8J6fRfv37zZcTKdcH/nkKmLd6Tiw2jQ+0VA4oa6rarGXK+Sidbwm26SGxGLUg23GRu70np
 kdMTvtL3Xy0UvuRb3d7S2vu5wz2mZjREX+pxj9bCSYLIEO6nSvDc9dbidrmaWlxzKU2v95MOWFJ
 6zHhzBqJ1PgRMGFDYTPXkGfSbwsC10sHLggQGbUcaMwFZdnpehkmMItOMvREbYd0Fd7k1K5HVYb
 Wz0yuvrNfn78zEuwACXl7fChqPsgBhzz62wAWSkCeQdd+MbUTSKwLGHpKfnlpOlBqSY7L79nc8Z
 s72t7Vq9li1LzxkXd5pjjvZj66sspfuTX2K2nnTt99nVcFgFOhJ9sX7R6EAU8MiDr/easOJtV8i
 ZFXRXLyBm2HhzG2vn0X5nJMQDE9otjl9Y+5IekVOGfUH9wdk7sJXreRg3ViaOFIB1Z
X-Received: by 2002:a05:7301:4094:b0:2da:a813:a613 with SMTP id
 5a478bee46e88-2e478a31c4dmr15139257eec.22.1776967401760; 
 Thu, 23 Apr 2026 11:03:21 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.177])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2e53dcb487bsm29131271eec.31.2026.04.23.11.03.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 11:03:21 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 0/4] virtio-gpu: enable Venus/Vulkan without OpenGL
 display
Date: Thu, 23 Apr 2026 15:03:15 -0300
Message-ID: <20260423180315.53821-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317182049.33848-1-lucaaamaral@gmail.com>
References: <20260317182049.33848-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Ping (second). This series has been on the list since March 17 with
no review on v5. Marc-André gave Reviewed-by on patch 1/4 in v2.
Patches still apply cleanly on current master.

https://patchew.org/QEMU/20260317182049.33848-1-lucaaamaral@gmail.com/

Thanks,
Lucas

