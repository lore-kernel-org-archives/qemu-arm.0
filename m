Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1939683ejc;
        Mon, 30 Oct 2023 08:16:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM0E682RDO9PFwL19aayh0/pshm/UxpLeeL5+fQB+zs6aDIrWdZ7GZ8OVNDKWS+BsAFMzB
X-Received: by 2002:a05:6359:2c88:b0:168:d3b4:2dd8 with SMTP id qw8-20020a0563592c8800b00168d3b42dd8mr7968320rwb.10.1698678995890;
        Mon, 30 Oct 2023 08:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698678995; cv=none;
        d=google.com; s=arc-20160816;
        b=XIxHiitkrT4c+skL3VbikcY/jO918JIZYf/HbZtQhOzaPktvaMAVZjUU9DK+h5FMh+
         KSb7DqB7o1GccXYFMPLcSTz+pP+qqU1bl4mJd6NX3cVDeuvfqUOKiGgvQhQJX5udK987
         cdY1ID+2ulxnmC3Bwdbw5cP7gGv8UnZG2a3XrWeXKlRWL857aGxcVzK97xyLt8+UL6IJ
         1TG8A48j6nU6PNO0FX8xaTx3Mgjwi0a7jgbAi7J5D9iMV+SXudFcQf6sF8bCW+DxLE3n
         FZdZgXWsyjm05o35x3IXeojyV669+mz3Tmp2ctYJSWnd+7h2h0HUX2ysXYiPxcuo6jll
         2sZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1JUS7ifgalxeVgxcJbIBOgd0URmCI4bQYikVDqFMDKM=;
        fh=aCejG00mBFvUFyicGgwZuyWNmnQkTwZFkToSNY6Vt+0=;
        b=o6lkucgzGDsO9YEQlrMCJI1irNk8u+zDVXX6te3DeIvlG8j+HFOg5U/nb6wpkLCacE
         nqQE/0gUr+luLj2Un/2iOnc0vMVjeLMRM/rfn3ik14f0Nj2Ff99iL4gwQ5RY2sUwc2MV
         o6G3Od7Eesiqgpv+aGVNer4P1yQ/KzoeXD/kE16a0F3Tabh22OwoV1jytEOVk3ssK5cN
         oLMprjjSDygQnjWCBkIc+VcTeGf1gL5DMlcjbN21v/Q9R28qP+gbp8SxWmHD17fWL7Vk
         LHSe/QAcFxX5DuzhDiujPLVxGSr4P6gozkAH/qQkRv743bGmO6L3otAUlzSyW7wkaTkU
         IYHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=OunuuiTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kr20-20020a0562142b9400b0066d13abf4f0si6030842qvb.65.2023.10.30.08.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 08:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=OunuuiTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxTzv-0002q3-RD; Mon, 30 Oct 2023 11:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzt-0002ph-Ts
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:16:09 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTze-0002tn-Tx
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:16:09 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c5629fdbf8so63776571fa.0
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rt-labs-com.20230601.gappssmtp.com; s=20230601; t=1698678953; x=1699283753;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JUS7ifgalxeVgxcJbIBOgd0URmCI4bQYikVDqFMDKM=;
 b=OunuuiTJZc3cRRQkTcSz5+Vzw8MD92P3ZB0tc2UI/AptrqUGi9R3NlNKv/1BBt10L5
 ScEElok1w//DxGZgcqK8i04Mz71/OONO5ct955vuOj7djIF+ubxR3iZ/SbgssAHzznMn
 rFZHw98CMAJjCxWx18B77uLpF6yKI7NDUwvHiGOiWpwFP6NzJL+O5k3O4G3Hw/RQMC9V
 iwNbgFv8IxHUcHUhvuAC2RQ3SHBTZLusNLlLlB+W8OYwctY04eeu+NAKwVnxcuWfa3Xn
 vOm/5/eiGF27JVzKoeOWj/6x5rwNbD1UUkvU1NTnEld9epz7106+5KhWu7PnK4v8eBe5
 CdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698678953; x=1699283753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JUS7ifgalxeVgxcJbIBOgd0URmCI4bQYikVDqFMDKM=;
 b=xHQkgOzYTqdZQKyhUiaxXQTFGVUr5or+4tRUivOiaGIgcDVezQBQaO5mU87EYGDwcU
 0OP2oa/7WB7ZKwzcOrg8OoZ9x17JLpD3UkaB+Degfcmj2qZm04ajMRj11MF14Ow7IB2V
 A5NHTnp5shm1Lmp3s3AWRZXi+AUBkVlYlDjqD3YQK4g0Z+nDr2ZrbEvlpKcIlS79IWXe
 D+Z7p9EW+vDRaFJl2e0XyuG6+IJwfL+V1/UO/ovl0VXA2YPoEx44SGIl/mHPV/4jidWk
 Ykok5xmTrSmrXNYYYBcZ2kY78tJAQk+PJQcBACHXjvHTDf0x3AtSYO/qIVRo2PHOqHJ6
 g7aQ==
X-Gm-Message-State: AOJu0YwzMzg4qkmRU+Upw3iJT5y0NUBftz71i6WS0VLG+tkPOUmCJynl
 vf7LzkJrshCIahFaYd0SHQ1bSQ==
X-Received: by 2002:a2e:8910:0:b0:2bb:a123:2db7 with SMTP id
 d16-20020a2e8910000000b002bba1232db7mr7501407lji.51.1698678953257; 
 Mon, 30 Oct 2023 08:15:53 -0700 (PDT)
Received: from rtlap47.intra.rt-labs.com (h-213-136-33-86.NA.cust.bahnhof.se.
 [213.136.33.86]) by smtp.gmail.com with ESMTPSA id
 j18-20020a2e3c12000000b002b95eb96ab7sm1282274lja.18.2023.10.30.08.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:15:52 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: alistair@alistair23.me, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/3] hw/char/stm32f2xx_usart: Update IRQ when DR is written
Date: Mon, 30 Oct 2023 16:15:17 +0100
Message-ID: <20231030151528.1138131-3-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
References: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=hans-erik.floryd@rt-labs.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: lZC59t9WuvGB

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 hw/char/stm32f2xx_usart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 519d3461a3..8753afeb2b 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -168,6 +168,7 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
                clear TC by writing 0 to the SR register, so set it again
                on each write. */
             s->usart_sr |= USART_SR_TC;
+            stm32f2xx_update_irq(s);
         }
         return;
     case USART_BRR:
-- 
2.42.0

