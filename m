Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp174342lfb;
        Thu, 21 Jan 2021 11:29:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs0YeIWLElcQpEPL5nfAl3CQPmYrSHWmcGHLuF7WpthWmD7G6u65VWfJ3I2O+INpWrpJow
X-Received: by 2002:a25:cc89:: with SMTP id l131mr1283174ybf.358.1611257386976;
        Thu, 21 Jan 2021 11:29:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611257386; cv=none;
        d=google.com; s=arc-20160816;
        b=tv4mG6MFav55uEYPyiApZKR631Ycc+AwYC0YX1cL+arfJXcNyuadjgnsw6Uu6uRWU+
         0ptn5VBIxcusxLylOjxbMdhaqpqonMTbcv8Kfrv0V0sUuis09k0P1vsk77yWvPTBY70j
         iNVLyYfGu8gKC2RdSgUUn3U8SV63VexGujF89Iiki2wGv/kOGAgjQw+uxqMaZWze9a14
         9UWbLi4ldqxPW+WzcGPmZUec8dchYFGqFjFD0/eqeZO0+zipUuD7T2/GYosKJKQy7m0h
         6dIWYjty0h8Nqh4SMN6nbDpXBUQAa1NtItKoSuY6hKqtDeb0aXmlJbeBINDF7cNTGDqg
         2slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vc7QCR7u1Td4e270u3SS7Eub90Z6eM3TU4b3gXUJds8=;
        b=CZliy19udS7V7d2+d2NnM1hPRLW+xLLkVp5oSialZfRqSOfKSugU663GBqeCbO9XIM
         t8ioIG42T+tFkNEoK69UUy/Mo7XOixUumTd+Zq3Y1glz/xYmUEhy+3Vpz0GGy02F2Npf
         7QyB8Phb1ag1/S61ogC+rDXA1iHTXOIpA4rmNUzg60TGEBhKsFKHiWwcMK2VuSGfqHRH
         oHQrxVQhxjNEDPV1a07gRFd5hVpgtVMGB4n72MYvZ1M8X4z5D9182tyquEFu73JO2F0/
         3AHqe1iWZPHmbO62uwhDXyPnBRuyzb4jvyRaPXeHVRF7zF9g4v9e0V3XQ5GPqXEDMg6S
         8FrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ri8eI31u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si4879333ybt.68.2021.01.21.11.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:29:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ri8eI31u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2feM-0006WS-BE
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIZ-0002j2-2w
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIA-0005xU-R4
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a9so2813821wrt.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vc7QCR7u1Td4e270u3SS7Eub90Z6eM3TU4b3gXUJds8=;
 b=ri8eI31uQ5rvNcDOJ0/bfBik8Or1KfvjxEdtCY36LpprRFRoZu8bxaCD9oC4Fq3drl
 65FbTUe8/ZKJNygoUdZ4V+x77TBA57qmSknLvBi/R9y4TltwwmCIVcW7+WdU6AVereaS
 zKzfWx2o9AT+ykI9szphBo+EsbN9dlB8Yma4/Ms65jxo5fBjdc7/2cs2gcgSOuk1eWPm
 w4IWRYaPKkERVc5ulZx5xMXS8j46s/KpwdiFH/dmuV9JY7sDJ4ds44GEGYmVouXmVKBJ
 8XQ5z5ExM+JOzaeX8bSZC8yafoLYcEjG4ZYU0lhWkfvgqVUVZWljHcHZ7RP722Eczub1
 TVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vc7QCR7u1Td4e270u3SS7Eub90Z6eM3TU4b3gXUJds8=;
 b=jbXqfa0yjoPwIMjMzbyU9lGDJ54wWKyRbzhgAYMgFA/o2uaepaC57mJrJq9RizJjWj
 G4u1HdfnrtmWsldKyC/iNZZaiSadFFWUiiKsVLlRLnEnhodaY+4drEMtuRHZfxOaWtqm
 nYzfnLVElb1isPucMGFgqO/ZUo7CvhZxiOcFbFzxGtbnxC9QcylWzrivrwoVuc2HcQSD
 ubRbQfOxo/RgFGFz6WvQ84goXPQyz61yBDd25UA+rX2nFHH0Y5HsOlsTI/fE1McLVvql
 ajqxuVgRlAV3+lID+WzQV8xcoF1VMvd6Acsa7YyPfVFxxfdaBaMdPprSSv0OpN0P3IXy
 MLBw==
X-Gm-Message-State: AOAM532VFD60PYbq+ulMkwTSyx6islnhRCnEBBK1sEdPX/JlPQYnCcWT
 v5HLDNH0h1opjTytdT7fY2Xprg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr916110wrh.41.1611256009272;
 Thu, 21 Jan 2021 11:06:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/25] hw/arm/stellaris: Remove board-creation reset of
 STELLARIS_SYS
Date: Thu, 21 Jan 2021 19:06:22 +0000
Message-Id: <20210121190622.22000-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ETK4yKVqt5KL

Now that the watchdog device uses its Clock input rather than being
passed the value of system_clock_scale at creation time, we can
remove the hack where we reset the STELLARIS_SYS at board creation
time to force it to set system_clock_scale.  Instead it will be reset
at the usual point in startup and will inform the watchdog of the
clock frequency at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 5acb043a07e..ad72c0959f1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -780,16 +780,6 @@ static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
 
-    /*
-     * Normally we should not be resetting devices like this during
-     * board creation. For the moment we need to do so, because
-     * system_clock_scale will only get set when the STELLARIS_SYS
-     * device is reset, and we need its initial value to pass to
-     * the watchdog device. This hack can be removed once the
-     * watchdog has been converted to use a Clock input instead.
-     */
-    device_cold_reset(dev);
-
     return dev;
 }
 
-- 
2.20.1

