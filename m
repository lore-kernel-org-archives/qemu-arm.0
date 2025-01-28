Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006807njk;
        Tue, 28 Jan 2025 02:48:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmB1Qugd/HEDsm/H17cBDMwdcor6k2rL2SMbA+piICJSX1g36LZf7vHYBhH6ZiO0ON0Wrv/SiPjUbBDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH4x0PlBoTo/Fzh4vTEYE9ZrQX7IhMlKKME14b53Bg/zocCAAGhc+PSD4tp+Hzx94WFjXNo
X-Received: by 2002:ac8:7d4e:0:b0:467:54f4:737b with SMTP id d75a77b69052e-46e12a87937mr685687421cf.25.1738061296955;
        Tue, 28 Jan 2025 02:48:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061296; cv=none;
        d=google.com; s=arc-20240605;
        b=VM0WDFefGfDXy+CaEpF1UdYDCEgIs6s1TVk+bW4KbdrJxySoQXc08FvDCj0cx3Xbqx
         Lr7ss5oX/YjAb4IH8ZEd3UGTyVO5kksuvbObNZ4H5gmzJswElWOWlvjXUWQ3dUoRHj8Z
         rdYt0w9a1mrgXy3RjeSiyucV/GzbUlo4aI0+EZT4zGR+cZO1La9rAsHrhmP8a3Ll3n3D
         y/xO4JzD6Fwr8T+48QR3z0HDJf3KIq6gxoGRr1YcJ+h0Q7Fz4/OMS+sgr1GmTgcpTm0Q
         gBMdvGHcsVXxdq3wzZgS/wWHnVZbFvpDD2UqMMXpc1dHu3W22V+pLiaRj/HK7gBjTKV/
         XOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P84lmvWRoPuZSyE7d4+2LbnhWUe5f771b5Xano3sRNQ=;
        fh=+G2pS+eHXkXmiTvBmAfp3MHxpcQy3FOKsTHIyiZ8RcE=;
        b=FrW8kPamr80abtk4TvhiaYnGOLSGIWxaAY9SWq5DnZPQOGN8cCfBre/M9seU9Y2um2
         7I5uvGC49HW2Mh9WyL1FIexddyevNscJoA3LcBx29pSGtiPDUXllxM7z50Ij4PRCTEBx
         SDY71OrcirGgPj8eogcp0YYXN0908pUW9Qu7+sSQpo8Hwgj2eUt0B8D5JRf2Akld46fx
         C7ngWIIrMBDEGIyy9mFI/WJBnfYNpreBKqVzdxi6QBXpnpTj6xm79NMn4pJ5B2ymmKpA
         FwGk9zwzqz3rLRFhoGflI7oUwDpcgvyFg6TBHJpx5uZ7xEnvlJsWXlcxsHkUjypp3FzR
         N9Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQ3aaO2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686cb82si129673841cf.59.2025.01.28.02.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQ3aaO2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcj76-0001tM-WC; Tue, 28 Jan 2025 05:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj68-0001AT-B2
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj65-0003a1-LR
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so3334431f8f.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 02:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061131; x=1738665931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P84lmvWRoPuZSyE7d4+2LbnhWUe5f771b5Xano3sRNQ=;
 b=OQ3aaO2wabwlC+BpjNqzVUObLquPwFMMt1Pp53vcDoOjZJ75SvT4Q2ov2CzqDE2cm1
 mHS5miJyb0dfd+Yz3ITcs6DNSssPhO6SrbeDJ/zlxHuYMjVWcJDWB6qmxR0/8Rfx13z1
 1hLY74PKeqUEBFH833plgPMxvDGqVaKJdsSUa7keXQVvASzLpdEmOXmss/CdOPmaY/DH
 hb0yKcjaFeHONxyEUlgzA9Zrzq+kdF1Dhl/BtrNty9UH02RnlBCYiPLie1WlSdLmw7H7
 aiR989cnHWl3FQQwu3iVUq4Ku3mKHN7P1bFeQ8sdSoxiCdEC84uiTJ6YSLafnU4dLqA0
 6wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061131; x=1738665931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P84lmvWRoPuZSyE7d4+2LbnhWUe5f771b5Xano3sRNQ=;
 b=vp1IeOqpRhC9SveYOUiw+uv+EBP8uPtjYyH3AS6JQkmb0yTSA9d0dzY5ffj5s4Pjax
 1h83UiHtKOejQDkTHyRtnF/SG+0WnwKzuaU+bYhdN27ypJjRNbaOgo9pfnlbYkJEBeQG
 HtiYlpQX3HDtxjH8zkbUgxbsvck9FgsWg62DJH0+NrpySHaWH8w6cImv49nx8/pI0Aig
 HHRNHUM3yOQN19kCK2UVXreQOYS7QPs5lGBG/9FUlyT+NbIh+aTb4TGq3w65sUz0NidT
 N72PlB1isrbYeDPLTPn93/CrG8SyEwAMPCjJ9e4WPF5HiRzfwd44ut86u7FEgsmSpGVo
 rRIA==
X-Gm-Message-State: AOJu0YzQgQ2u3EdzjT7g0wr8KezOUz88QHx+tduItKLOOMLTr0ue+arj
 z0LuEbuvx7E4X+hf9ymhS2uWl8OYEz/KO5hmy6UzUx+/IFPOQn/YaaGMhEFRUUnJkf5XIh2ewmp
 B
X-Gm-Gg: ASbGncthZx1CNJuMmHQx+XN9lNh0UMhEXOptmtzZfD/eYmS3DjJrjNpj6KTkSozW8sa
 VTq5mFNPpqtkIhx1vusSbXmKFzjxNV9xPnNVeMv3KWdxpnLg6agrAS3YIGpTbV4aI6kDI3RgmnT
 lfn2rlNUl4ttKOdzoVC4E2+W0PkDio7IVpbwEgApFWSLFLoTQbwlcCGhS3/5hBXUkJTYVVubou4
 djuHfVZ9gfU4el42KAOdxERRdkgJf0McwAhBMvp8jBOOKj9SOBIDadCjMVV8oTIvTMgj8/5izzf
 k45Ds/8NOLHinxiL5cAt
X-Received: by 2002:adf:fb84:0:b0:385:e328:8908 with SMTP id
 ffacd0b85a97d-38c49a5d44dmr1754140f8f.29.1738061131513; 
 Tue, 28 Jan 2025 02:45:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 09/11] hw/sd: Remove unused 'enable' method from SDCardClass
Date: Tue, 28 Jan 2025 10:45:17 +0000
Message-Id: <20250128104519.3981448-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: eVX3WBDnO2mB

The SDCardClass has an 'enable' method, but nothing actually invokes it.
The underlying implementation is sd_enable(), which is documented
in sdcard_legacy.h as something that should not be used and was only
present for the benefit of the now-removed nseries boards. Unlike
all the other method pointers in SDCardClass, this one doesn't have
an sdbus_foo() function wrapper in hw/sd/core.c.

Remove the unused method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sd/sd.h | 1 -
 hw/sd/sd.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index f2458f37b3c..d6bad175131 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -119,7 +119,6 @@ struct SDCardClass {
     void (*set_voltage)(SDState *sd, uint16_t millivolts);
     uint8_t (*get_dat_lines)(SDState *sd);
     bool (*get_cmd_line)(SDState *sd);
-    void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
     void (*set_cid)(SDState *sd);
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0330d432fd0..f781fd1641d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2831,7 +2831,6 @@ static void sdmmc_common_class_init(ObjectClass *klass, void *data)
     sc->read_byte = sd_read_byte;
     sc->receive_ready = sd_receive_ready;
     sc->data_ready = sd_data_ready;
-    sc->enable = sd_enable;
     sc->get_inserted = sd_get_inserted;
     sc->get_readonly = sd_get_readonly;
 }
-- 
2.34.1

