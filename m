Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1465165wro;
        Thu, 1 Nov 2018 17:20:28 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c/7rCbYm760Hs7LubtP7Yn8NjjTXtIcMDQQZxcXQmXFNG12gk9eSBlTMtMafAMLQx6a0y3
X-Received: by 2002:ac8:6b47:: with SMTP id x7-v6mr787834qts.64.1541118028110;
        Thu, 01 Nov 2018 17:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541118028; cv=none;
        d=google.com; s=arc-20160816;
        b=HEN7TGSxcx57id74n48WstrC27/tBApgxNYu9zm8W3bZShS8N+RafpsyEkrrRV9IHy
         BBDL40GY9l+vSwSX13jI0utazsgyk49P1OzVoInCqmYfoutukXbLotOcKN8+vg5yMO3g
         LbTTtV5/duyJKl5DRB3+9tR4u1uVYPcDXdM+IwWMD9GMY2UmXpMvEumEHnSj7vrqGdeV
         imx++Hm34pCftkYztUg8U2o94Aw7otcUEj88DEudRnLGstLK7YDkfBFtGxPERMQENwau
         McuTbwcjSZ0AJW+SFGZiUs882uZbAI1k0cEalHBX/2+kKELruEiOYoNw5ezQlh57l3iC
         zMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4mToe6WunLzN4SnPM1GpHTtK3OXQyOyVDa3v2mrF7nw=;
        b=zglTqT7hvpBPq2/IcubJ7vwvZWAkzLHN3IdFPgHRbDh9d0xwbKH+c01McbgvMYgYGg
         skKOYS+vNKWFH/3XCH4cbXdl4ICkdYRcZuK0FJFXLRVxNn1R8QiTAo/05GRROKtmNTtq
         MWrezhfNf1hI3wMMCMujqs+26tkoCwm7y3uhIpOtnpQ3xaf7xig3ngQHH6aMkgaVhEWv
         8I1jvoPwxzXtZCRHtSSouiT7Md7RCIUyJfyZLJbZvCMYWQnjDU8e5KgkdNGGGX/xLeJN
         fTCAMxPAXWn5rI0iEDItKkGpkqPJbQ+htO18ScNEOxxau4go2w17eYVKdNihXZ3jBAf6
         +ZZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aI0LW4JT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p13-v6si2351822qti.90.2018.11.01.17.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aI0LW4JT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gINCN-00087l-Gr
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:20:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5i-00015b-6f
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 20:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5h-0005B8-IY
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 20:13:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5d-000571-Ge; Thu, 01 Nov 2018 20:13:29 -0400
Received: by mail-wr1-x442.google.com with SMTP id d10-v6so235073wrs.5;
	Thu, 01 Nov 2018 17:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4mToe6WunLzN4SnPM1GpHTtK3OXQyOyVDa3v2mrF7nw=;
	b=aI0LW4JTcdveU7sugbebgTg2K7bttVee7SRMl561cSwnPLaCZ0ugo9WFmxbvZIgFQr
	AHV/jf1DIDQsSzVsDCdhaaJMfYJ2vmkom6uIWX0YHpFN2Bz/sOd/cbTlakOItH/JGsh7
	/rglkLK/S55KFV/JuY3p0oiOTb39k/EjncrUdmC/fsKbkKOP79dM097PsyaEf8tPrRXj
	lWhwa6C+Ql0JalRezz0wfjSBE7NvxJDPS4YvOxL9D4M5Rlszn+YtHSN4V1xSDaEVEIso
	j5fcaCI+Wg2ijDY5JL6assa+mXHerIwgzPMqoGkDKgtzP3yhWdozeYKoWZBT848++zGx
	z1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4mToe6WunLzN4SnPM1GpHTtK3OXQyOyVDa3v2mrF7nw=;
	b=i7p0/Jv08jP9PkdLWnuWjovv5FthHP3IbvbTYVDfx1uFnjAK5t47dGmVBrSWNKLQHc
	o09o7v9erVThLhiog/9PzmUMD2O0z47t0NLoAATN6gxhKho4QZ9cUvhaT8sJPWJc5g0Z
	SdIyyqOMpcvcWpzjH2ALxlHTCGH4ioSU4fyz/fkUYXSf+XWXjGefL4aTnbAyqj67bILd
	P+ndojRD9OoVa6jQLX2gJzV2GAnXLu+csrcV/GPmrmNH+n0+CW9LVM+J05hK3KDTjYJd
	Zy6bccyDWX3bc3s/HoY38rhBc4NKzHD+ZTKQBPpK7BR6/xsEj2Ib7DloNDGzdb264Lni
	DVWQ==
X-Gm-Message-State: AGRZ1gKWQ96w/AhZOb3xBOTSKytBbAv0q/dY0zz8MC8w6RmLzATI1AIu
	ua7P/z29m+Q3RQB8BIFYKXs=
X-Received: by 2002:adf:ba92:: with SMTP id
	p18-v6mr7679443wrg.295.1541117608514; 
	Thu, 01 Nov 2018 17:13:28 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:13:03 +0100
Message-Id: <20181102001303.32640-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH for 3.2 v2 7/7] MAINTAINERS: Volunteer to review
 Raspi patches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FeGISF9R300E

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c41ea5ed3f..a76d047659 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -684,6 +684,7 @@ F: hw/arm/microbit.c
 F: include/hw/arm/nrf51_soc.h
 
 Raspberry Pi
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/*/bcm283*
-- 
2.17.2

