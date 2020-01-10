Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1174229lff;
        Fri, 10 Jan 2020 12:40:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIKkQMVkFipOQ0XsxTuCEWW0N/NvUZgieFFCbYbmvIjWFtRtmuLL1pIEZbxaqnSvg7VFV+
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr5627649edr.57.1578688800435;
        Fri, 10 Jan 2020 12:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578688800; cv=none;
        d=google.com; s=arc-20160816;
        b=CsfZ5UGA6HzVd/2Ti3CWi/wwNFHvDEBMhjEtthPtsQELEvdSdkXHR0AMT26E4166Qz
         ozGTqP5+UBjCeesey4Hq+S2UEv8Lve3tBJrWU8duMoceV0vwk6/m29RO2+K/okp5C1rD
         eopfp3H+cFc1H31i29s+tS9isz4Cpph/ghUdYo6yun+ds5nZILJnv0YUzJhtNtuvqQst
         VLXu5ZopoTQFcfz1R5fsgj3ELAWqFW5Enk9nBdtzKdddj+BSBAS5FiWTiWBdV24iU/4y
         rpAwvxF5PBsn/2ctq2Rnexo1DPdbWimQDIwuoWarxu+38BrUASdTw2ZPxGBphjpXcxAu
         9hTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=irep/+RfcBft4z9KkuKqHnhbPXbWLZRDw3qHnl922SQ=;
        b=IhGtjR9QUQfndgNwu25ogPRUUJRINZcQUGqHLMuPBv8nhb73kM6QDRhyrBc4Cls2lL
         5c1VtMbmDRAgoBrhVtM7qP/UPzxQHItw5Y6RRho1UyvZVT4l6ZAkF7zJeGMEY9LkErqU
         XOqls2CUvurXC9HWf9+T1exH5itRJEwbaT8/8UNxi19lFuDK5kWhB1a6+6XRb3HUyNzY
         0MBmDwMeOAuzqJ/8aUEarcx9YXyrBUlIglhZ3/vSUF4/X3nyovIrTBFSwH1uo9VMklr0
         Qh6xgMxhj3U4bdD2lucQFZzkqSCzmA73hCHOSdZGH9LHEw0T4H2yjxU2sbVOAHlBXQUJ
         a3NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6K9Dwmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy21si2145581ejb.38.2020.01.10.12.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 12:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6K9Dwmz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iq14Y-0000Rs-IT
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 15:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iq14N-0000RL-Fw
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iq14M-0006jI-Kv
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:47 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iq14M-0006fj-EV; Fri, 10 Jan 2020 15:39:46 -0500
Received: by mail-pg1-x543.google.com with SMTP id x7so1510195pgl.11;
 Fri, 10 Jan 2020 12:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=irep/+RfcBft4z9KkuKqHnhbPXbWLZRDw3qHnl922SQ=;
 b=l6K9DwmzWHnqBskAFfjR+ffdwh5+5vQv2KtGULyyDCcX7Imzv3WxmP87YLQuRH0s2J
 iGKWGttMiRJ80eKQ6LnhcmTW84G92pcvOxvhZGwRGcWJefBBSmGftFv5XK/iVtDQpndv
 rlECQ4VbVpJqVeAHy/0Q7FfY3HHQnsD7pbx424y0wjosdZkeL1TIth4hrg6AJlWKoMwJ
 XWMyHtzKQa2cTXsN954ETfBLB3FhAmHI4D0n3DnPzfjFK+46koc999X6esMEAiNA/m/V
 55Dk6bwbqXCxBuQHOzHj8TAeiZknXr83uiBdkSI3Nk0rLW4nXHW3dXKxIbuw97yElfuX
 pBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=irep/+RfcBft4z9KkuKqHnhbPXbWLZRDw3qHnl922SQ=;
 b=IVjgqtuEXLb33yLB34W9qXs389fipEdFA/ws8ARNwUDTX8P+NEm8OvM1T92lT2QGUh
 bLbybmbKxMxRYQu8ZqKaACzaAByewwXhyMU+PfZlyjExGNB5uwUGg23TIGgFnrMPpNi7
 dGNlGotD7hDu7WFMXmwY7s24plRIOJPkVJeqEJNM8VTTOfCCfPwpUerqce8nrq5BmQtB
 7d/SEpAsepfleSOXf0YNKW4Ef3jTxyOt7OVwYmvpldyrkE3Nd3cQOH0fMGaPiWeHV52j
 jDeHs92CkxtzFeilUMEpTu0qR8DnUNGinfp5Mp0Twlq2iqJgAWmeGgqnTAYT3nS9EczN
 O01Q==
X-Gm-Message-State: APjAAAVx323NClJGjj3sT7iR0638/hk9ksJZIZAFNuFUM8We9g9k27xQ
 4sPkacQzVFrY9G1z1bWHvHE=
X-Received: by 2002:a65:6451:: with SMTP id s17mr6537898pgv.188.1578688785360; 
 Fri, 10 Jan 2020 12:39:45 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w6sm4321454pfq.99.2020.01.10.12.39.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Jan 2020 12:39:44 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [PATCH 0/6] Fix Exynos4210 DMA support
Date: Fri, 10 Jan 2020 12:39:36 -0800
Message-Id: <20200110203942.5745-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZPJyTSF3MslC

Commit 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
introduced DMA support for Exynos4210. Unfortunately, it never really
worked. DMA interrupt line and polarity was wrong, and the serial port
needs extra code to support DMA. This patch series fixes the problem.
