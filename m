Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674545ejc;
        Tue, 12 Mar 2024 01:24:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVz7AO3vgKBZjwZDKoaNuAch68H2Fgj0yu8fF2WuOCjHlYs882MK7t+FSogCFu0BgerdHyVyCNQdHMug9N9TiS1X7sTJ3+K
X-Google-Smtp-Source: AGHT+IFn9t4nfn2orYYmAHwNEEZMLGjzVB8v4pIFeNytOTQ2FC9/EB8P2FQFwVKrEobHaqMXmiwB
X-Received: by 2002:a05:620a:22ad:b0:788:67db:5d79 with SMTP id p13-20020a05620a22ad00b0078867db5d79mr1171387qkh.38.1710231840413;
        Tue, 12 Mar 2024 01:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231840; cv=none;
        d=google.com; s=arc-20160816;
        b=0dTFCm++LGJQRJ1cnrpdpO36aiFkUv2OMI6enqIwQ3/w7MnlOJwbBatnb9uSC+U1OW
         o5pg112tVZCg68za4n9aRkXrrGYYrG7wtFJcIvo3MjEReUz4AcW0QthnTroG5DQUvkic
         IwjDkY++JMayiD2h7WaUthV7TZJliTArRQWSsCzRf3UYkChdZUX/DaU1tR+WjFX6DDeW
         liBvEVlDpo939oZMfYBwIxLASvwjUWbsHvilBU6hcQ3wGrPKmF4kzK7oQ9VLZOs2GL7u
         7iCcYI0a8hodX29rhbX/X+XkYhRCnmcGmRIQMKJJxu/YXYDQx3QeqQRP69cFLACXYcsZ
         fsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3FG8zZPJK1bf6KOQDF42ZpXKRx0qaQ0s6JgBLKqquGU=;
        fh=ESiONvI8PaUGHCZgeqhUcYigQ9KFk/fqbQy+oU77eX8=;
        b=nVB/EZm/69O0RNBRKEOfdXaBTg5elfgNlLIiei0MTQPffTAPrGMsdhhWYAgWQSFC0x
         cMi5NR+n1bwKTaYvSYRkEVLy3vtTidmkW76EM+o/k9GDP9wb6K4BWHS6XAFuWsgT8WaY
         3RTz5FI/vBXljYbKoAM2HMhoRLIhfCIS+90YLGYNUGc/iRv741HoLms4YMbcWya7ZWf/
         shNICPzDgdbQ1LGYBhfg/sVO9OZihYhayz9qdVNWE6GWYM6zr2erDLfUWEuWZ0a46xYg
         rAfWqTIB6YIO4ybbPBsRn3ZcBLyZoms33qxUyO0FRCTFMNd3XaWcMtGecXL3/USjHKAi
         1RwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1j1qLwu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a05620a16dc00b00785d68e7bdcsi6801987qkn.205.2024.03.12.01.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A1j1qLwu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPm-0005kl-Gd; Tue, 12 Mar 2024 04:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPk-0005jj-Os
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPh-00019c-90
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:10 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4133100bccdso5024535e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231788; x=1710836588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FG8zZPJK1bf6KOQDF42ZpXKRx0qaQ0s6JgBLKqquGU=;
 b=A1j1qLwuGMRGbtGfo7okEOBKDikyI0zeXLTiJTSJXo2ywBZt7setZb5E4Ugpjg9kd+
 u+cR6Q+oF78noG0Ed6WBQAT69FWkNPfKBFnIy1yrlfJ4WUfDGhfaLOA39xNNhxCQEG7w
 RjXAWUeC+XQL1/to/OQ9Hp3xhpyBlNvMmPQCqNUw5hmrN8oOuhSdpDCay7gz+Ep8JsOO
 4PvviiFS3EesELq474IqOkclVZ/JAt+PBd/fq3i2hbw7aWieH0mPg/ezhCVtnWRkB9DP
 ZgdN5stDM3VOGphko+5dF48wg2Cd6pfX11y4tsd3CkRAiuMi7HpVUoww3RxSjbWealXz
 1/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231788; x=1710836588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FG8zZPJK1bf6KOQDF42ZpXKRx0qaQ0s6JgBLKqquGU=;
 b=h7MiCTNvdqMd1wawgbdzoF6YuSVxrOMh0OiPMiNqulqJIROgWIm8ytcacjN/SiIkZi
 MqamWpHQJ4i8sttye0y6GhgyIn3TAITLaO8GbaPv4vnYyqXkLuhOXv2kFBYFsMJGMohk
 PuZuM+IdMJ1nFLe17AIwcvxWof22XiAplMiQkfwcTnUa6woP/549grgq3XxIOJ5W7PnU
 6trFFsz3+HeG3k5w8XsnAJr1pqcQseyD8uxCTONLe7jcuHTGZDSc8Wy0bdm2tPnIRGMK
 SH5laGr3jyttfTsLWRxXk+NGAsAJSvGKMETQqEaXivAGISvjBBA+6R3Rbffp6j/3OB5j
 1Z1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfCDiksAu8CCB2QTHzOu7YXXWqP/NN5tT/LmNu/6RQtnLoyCw+E2PbgcQQ3OmKEkAuy0P4yH8NfTHeer4kFoxvufS+
X-Gm-Message-State: AOJu0YzxsKUxoXqU3oAEYoMO28USxDTGWtHCwIuh5dyGnf2KWj9u+C8h
 mEeaJo9jxbMuTxvG9T5zBNGJApj/tFq6JAAqPAUUNbfdQCh5XNYl0/9umVlcK/79y/KQOqJx5aC
 A
X-Received: by 2002:a05:600c:3513:b0:413:1741:289f with SMTP id
 h19-20020a05600c351300b004131741289fmr7491099wmq.5.1710231787739; 
 Tue, 12 Mar 2024 01:23:07 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c450a00b004131388d948sm16112266wmo.0.2024.03.12.01.23.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/13] hw/core/loader-fit: Fix missing ERRP_GUARD() for
 error_prepend()
Date: Tue, 12 Mar 2024 09:22:29 +0100
Message-ID: <20240312082239.69696-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 0q/82pOu21Ko

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is &error_fatal, the user
can't see this additional information, because exit() happens in
error_setg earlier than information is added [1].

In hw/core/loader-fit.c, there are 2 functions passing @errp to
error_prepend() without ERRP_GUARD():
 - fit_load_kernel()
 - fit_load_fdt()

Their @errp parameters are both the pointers of the local @err virable
in load_fit().

Though they don't cause the issue like [1] said, to follow the
requirement of @errp, add missing ERRP_GUARD() at their beginning.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Paul Burton <paulburton@kernel.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Message-ID: <20240311033822.3142585-15-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/loader-fit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index b7c7b3ba94..9f20007dbb 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -120,6 +120,7 @@ static int fit_load_kernel(const struct fit_loader *ldr, const void *itb,
                            int cfg, void *opaque, hwaddr *pend,
                            Error **errp)
 {
+    ERRP_GUARD();
     const char *name;
     const void *data;
     const void *load_data;
@@ -178,6 +179,7 @@ static int fit_load_fdt(const struct fit_loader *ldr, const void *itb,
                         int cfg, void *opaque, const void *match_data,
                         hwaddr kernel_end, Error **errp)
 {
+    ERRP_GUARD();
     Error *err = NULL;
     const char *name;
     const void *data;
-- 
2.41.0

