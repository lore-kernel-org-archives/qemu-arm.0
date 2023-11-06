Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2679551eja;
        Mon, 6 Nov 2023 03:10:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1DWJyfSCa4k+U/z6OOMUCcax5zs5BA43z57XI4wEfv+2jeNdP0hfEsxiFfYD9PsJA/xC
X-Received: by 2002:a05:6358:91e:b0:168:e493:2938 with SMTP id r30-20020a056358091e00b00168e4932938mr36599768rwi.19.1699269002597;
        Mon, 06 Nov 2023 03:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699269002; cv=none;
        d=google.com; s=arc-20160816;
        b=Du6FoRddMJQFdJG3aZt2daBHsmRhSXYhQ7Cdv6YEv98awA1BOrPBUyeUz6SGx+0Oz4
         IDsNN5d1pXXXA7xSh8qwOUO4lR99AMJd+DLTH/+yXN2SMf0TOpmhzUtdPfKBzci0oNZn
         6cgz7VPiHPQi3j25mCVTnpa3BXXxiAj8vykylBFfS1556CQ6u1jI3sm00vgGYd/8mvok
         vPzvgMzdG5Ita11DcwA+eUk7auhf1W3vjrq9xOtpKY2R4GRujfYcn2sH3eCDrC79LFQD
         zgpLYkdW2eXRLz9X4gfZvneaPKMvHnClj0kcQZrD62bYKliSiHSGKKQb1tYQmHHiLCpT
         Sqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/UYA9fxIVAJDV/ugwhxZLfTB1YL01/OCPxws1OIhgNw=;
        fh=/lh2e3kdFR1p/xQRLC4hlj1R95n6elWtlHxD1hYgJ3g=;
        b=UV1alClzu5hbAz7GhEk6Fy+ipSOdkw97RSwi9+VfH14Af6EtfSNU2oD738agotoutm
         eofdMo/ZIE8HDxHh0pcmevwrO/0OzE8n+HUFE9bezGFPOqQ7TImBNkkF7xsLvCkqC/Qa
         lg65BxrW+kyHkv02xJJefgnMgnmugof92z05NmBNpaRD3XyAeVObRxiSqCYywbawP+ti
         kOP6rPeAKCm7wGOnhbAFvQwOn4ze/k50J0zgITxuEpZHNQEyK/Gf5yTc23a9EtEt0yg8
         yFgT/EhrXuZoPNx5CYT49r0xVt+BGNl0RAb6vLq6ze85GfaDkrXVqm+0dCW+C+kjAVXv
         Bndg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2AqQrVy;
       spf=pass (google.com: domain of kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id ck16-20020a056a02091000b005b7c45b1f95si8826830pgb.555.2023.11.06.03.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2AqQrVy;
       spf=pass (google.com: domain of kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-724-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B050280F86
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CD41EB29;
	Mon,  6 Nov 2023 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h2AqQrVy"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0731805F
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:09:55 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6155998
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:09:54 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so3013680f8f.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268993; x=1699873793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UYA9fxIVAJDV/ugwhxZLfTB1YL01/OCPxws1OIhgNw=;
        b=h2AqQrVy2qtISuUIN5l52VZSVRUyRN8s56S4Z/hrVkM14shLLUBX6Hw+D0qhsjCzqB
         SeF6CWdwHdLiCiDiKnvChncL5WPlg+YKDFcAvTD/Kav9bGZ+7yGK1vDHx2urdMdhVWVr
         CyuaweiE1gfe6HVrBh4lMv4xA2/nfxICWl06ojUf7PqdkhL+XUzDR/LZCVEtMs3aB2ZV
         4djUEJQFCjj09zKBPox+GI3nZZ41fInymQQpUXvmayRgiZhdH9QPCPkjIHgJ7E5yotif
         ++sG90lDMOYyI+q8zsckjOrQFOYFWYKrV9jSAV9jvhc5ll/4wJDBltLWDs7yKPSwnDZi
         OfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268993; x=1699873793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UYA9fxIVAJDV/ugwhxZLfTB1YL01/OCPxws1OIhgNw=;
        b=Jw65RFEaQZcYE6yNHKmQqYrazBj9PDwMYwaegta0pg9IEWS0UvPMdXAOUkg2t/hJKG
         BeoZhtanjB9VX/uEvCY5RPOSd2Bpuw0Kmk6a+SuzATbuo9M6hFx4wsb2L6eeganIU3QY
         ljDxxRC/J5iIFfXuQ7rdnhLgK9XznhTENR0oGpDTKuJLLNFQAWItMPNxhFWzmbG9tyTu
         F15LqY77AdNHb8Yfbio2CVuvxrZ7tzB3M0039AwlKGFP9NzLYjg9GvpU4FUUWS3nBct/
         K3DQ23l7qClRXUiRe8+DH1x7IgoZJQaXJkXMaxoNOiviKA/utWtV7b/YnQzlXeWyZwm5
         mVRg==
X-Gm-Message-State: AOJu0YxSJPLUahvON8qDomZ5O+ZJSGOlK6cga1LyAJXMGG+K/6X+x/1Y
	xwGzBJFf8+DbNGmh9bLyzlALhg==
X-Received: by 2002:a05:6000:4021:b0:32d:b991:1a71 with SMTP id cp33-20020a056000402100b0032db9911a71mr27821328wrb.0.1699268992895;
        Mon, 06 Nov 2023 03:09:52 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id f18-20020a5d58f2000000b0032da4c98ab2sm9102932wrd.35.2023.11.06.03.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Titus Rwantare <titusr@google.com>,
	Patrick Venture <venture@google.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 55/60] hw/i2c: pmbus: immediately clear faults on request
Date: Mon,  6 Nov 2023 12:03:27 +0100
Message-ID: <20231106110336.358-56-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dT2l+F1DTIYO

From: Titus Rwantare <titusr@google.com>

The probing process of the generic pmbus driver generates
faults to determine if functions are available. These faults
were not always cleared resulting in probe failures.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-7-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3bce39e84e..481e158380 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1244,6 +1244,11 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
     pmdev->in_buf = buf;
 
     pmdev->code = buf[0]; /* PMBus command code */
+
+    if (pmdev->code == PMBUS_CLEAR_FAULTS) {
+        pmbus_clear_faults(pmdev);
+    }
+
     if (len == 1) { /* Single length writes are command codes only */
         return 0;
     }
-- 
2.41.0

