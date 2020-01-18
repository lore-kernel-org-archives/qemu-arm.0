Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp620389lff;
        Sat, 18 Jan 2020 08:43:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzhiYhSdTO4OCB6nLFFwgJuv/1/fvVQgv9d8qMCMyy8MBcxhZFwP51J2FUzbY2E4zn9Nkb
X-Received: by 2002:ac8:4693:: with SMTP id g19mr13202742qto.295.1579365804641;
        Sat, 18 Jan 2020 08:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579365804; cv=none;
        d=google.com; s=arc-20160816;
        b=oVA6niSa6WD8RlCpDgmz9RRZHDLiw45yIYP+nBBBd/vBVtUFXf2yD+iLP9B1EDPmCC
         tsS13idbc+IWnuKUioxnjM5/yjfTFYdQc+CeYehpmLR3CXWwRoSeE6yq15hBy68rn3/i
         MG56zIIH6FWVU3BDVqJd0IdixDtkUXoQsBUi4NmUlZimEpYU9dEXDjTXnr6ZHXVRcrzF
         JxjTD90XZnfjimZz64U8OUEeOM7qPHsCCGkm9OzUW8vHA1A7Vi2hKNUpLe7N8j9Gqte9
         JIn6rprns4MJckYKKow11ni6+daXUj0m51OaHOz8MHPYQ1V4d1igd4FkbP479Wspjh0+
         tTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=vU+VqIHGN1BijkfK3vPdPlxjr39cqTq4olg29px/6oo=;
        b=utEUQjiQPNo8ytCA0tQtAKdVeP8z6rNI3zfmN5f86tcjnKBc7O9eP4SvPXWhfCiZ3Z
         Oo+Bk0N+n2/k5AXmMhCE92QEo1ZBR9UQXgS04AGuDH+myM1ssVm+dHqJnQ6og0w1W/3t
         u6XNVJCBSB8PWnJrbVrMcuZn5ylvDU0lJhGK+mHRqJsoMCGvKBOqEXKXXzHugtyl7B9r
         XFfgulQeQJyhqh0fk1t7fcvKYVEWKTPx9A7VsVAK7LiJ0yO6GRoIti7Bi9pMi6GOjUWz
         LgiDeQkfL0TMtBB8UPglb34Q364RgCfNK2O0fu9VWstG3VcTvOCzxM8Xqphqio6v8X4h
         QE7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uPz//ZtF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si16543836qtc.78.2020.01.18.08.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 08:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="uPz//ZtF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isrBz-0004rv-K6
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 11:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isrBJ-00042w-MJ
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isrBI-0002B7-LT
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:41 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:40115)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isrBI-0002Ao-HV; Sat, 18 Jan 2020 11:42:40 -0500
Received: by mail-yb1-xb41.google.com with SMTP id l197so6015446ybf.7;
 Sat, 18 Jan 2020 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vU+VqIHGN1BijkfK3vPdPlxjr39cqTq4olg29px/6oo=;
 b=uPz//ZtFoeXIRURh/9ksxf+hkfCDupjqzy4v7RMYejungSB8UGniLRo0oUwKrbhS1o
 yVZL+p2z32a/UtiggylKrVWXE4Z01CVCFPvi5ww4nailqxfRUH5enIzXWvkLyIkwsja3
 69zS4IdOpzygUEuLtiQGGvmHvON8ovi6SplW0/ZY9tO02oji32TBBkXXL7qc/RiauLdP
 /QKKwTBoW8+Ln+ohvsbfoBYCz3EsZaQf5q2PzEei4WOReaPcGMVl2v9kMBKRs9v7Hl2Y
 xX9mqGJVaZIbyJt/7OG0MnpZohvfYaCKBtRKIkjDTVpFJNwOwR61p1p9dSeQCJ86+2wX
 5xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=vU+VqIHGN1BijkfK3vPdPlxjr39cqTq4olg29px/6oo=;
 b=XlcYGjs+351/PhjLztbrBYNd3gonKLMd/dNRkjtqafLAYDW4IygVXUM4eEL2WDCD88
 xeRt1ryItsR4NDXvB8531hm+J0XRnnqLeFwByvYRn4WH2KrAlRPVcN8qniGv/IEoVDon
 e1IqS1ycS8smSdNBSIE+GUFaskE2+TRB/wy8/8uPlF4duln52UN4ql4bvOuG1tArhMPw
 hBPgPQncg0TeC3cx8oTD1du8xXmVIRKiju8OLxX+/qpOP4mVU8HClIALsHOGRqVN7FZK
 NlZKTCIUrQ52uxcP9Y4jEgUF+yxXvSqVTG6t9EsJekMcbhLaYugtLbNJoWAgLjSahcNZ
 pWjw==
X-Gm-Message-State: APjAAAXBupivMl9WV/vn3NYPHeSpOHKeb5Lc0I7GY9bkli208G39CTaT
 NtGx7CpOdjMUo4GXk+ZKjlE=
X-Received: by 2002:a25:5944:: with SMTP id n65mr5248639ybb.291.1579365760077; 
 Sat, 18 Jan 2020 08:42:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a128sm13431651ywh.60.2020.01.18.08.42.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jan 2020 08:42:39 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 4/7] hw/char/exynos4210_uart: Implement post_load function
Date: Sat, 18 Jan 2020 08:42:26 -0800
Message-Id: <20200118164229.22539-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200118164229.22539-1-linux@roeck-us.net>
References: <20200118164229.22539-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ljlAWzq0W3dY

After restoring a VM, serial parameters need to be updated to reflect
restored register values. Implement a post_load function to handle this
situation.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Additional patch to implement post-load functionality
    in exynos uart driver. Required for next patch in series.

 hw/char/exynos4210_uart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index fb7a3ebd09..5d48701b6d 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -522,10 +522,20 @@ static void exynos4210_uart_reset(DeviceState *dev)
     trace_exynos_uart_rxsize(s->channel, s->rx.size);
 }
 
+static int exynos4210_uart_post_load(void *opaque, int version_id)
+{
+    Exynos4210UartState *s = (Exynos4210UartState *)opaque;
+
+    exynos4210_uart_update_parameters(s);
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_exynos4210_uart_fifo = {
     .name = "exynos4210.uart.fifo",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(sp, Exynos4210UartFIFO),
         VMSTATE_UINT32(rp, Exynos4210UartFIFO),
-- 
2.17.1

