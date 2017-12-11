Received: by 10.223.159.74 with SMTP id f10csp3058963wrg;
        Mon, 11 Dec 2017 13:38:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBouMpZiPJjpaQ2S3GJuuyrzy18Xx6hIhTJYMbTwrqO4bDvrnheh2+574aRB9k0K8BA4K9ZXg
X-Received: by 10.13.207.4 with SMTP id r4mr1346463ywd.493.1513028280671;
        Mon, 11 Dec 2017 13:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028280; cv=none;
        d=google.com; s=arc-20160816;
        b=lE05lXUcpcxc+koRfzO2nGPESWyrSislYBPvNXKaq8wRn5SOmAgO3Fr5sHYDGkpAkt
         gP83SpRDdSye6PuzwOX9CFqjULKa+0oO09j950RuZng1ZdE2jB5QSHYqEYhwQX1JkgzV
         9K91d1xXDMaqdLb6dUnRpaO4GrmTMwfAa/JNfttkoF/sJ6D54DhfTqFB39pItkulVGMc
         WizmYzmU1PVYFOYDgkumCvrVyX0Gjr85ytDOqVr+PeeidiRV7mS+zrTe4tjGOkqCRlF+
         z/ZrdmpqBzdcmo/L3hqBiD9InUtZ4aUEust01z6zG0mDg5/k6sfeBJpaJfQN7H8bx6PP
         lsxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8mhiqsddd4UsdvaCdG2Ds6Z728EUN/YHwzWh20Kvtzg=;
        b=GcyuNRTAmsVuR+avRPyhAksszlLt+1REN+zCUqfcn8al5V6T+d6YD5Bc2trROkX6ck
         V6+3lN03QPipziZxrfCa7Nb6jcyleZJnPnaPgCwgys3WJ/G3/5ab/DsSrKnOOpSidezq
         TXp7QBmaxQ40Bnm/sveXVp+43FK3ZPBQYND57D/GKyYF/arQGobfFi1vdIyERa+exd6p
         7y9mfughHDeN5Qbei/RD9zt9NaN15sc/L6qfFg+Xdzeppx//ly83uGtPOBQ5GcWb3cYX
         WctYjEheaydxFGxMNmnEWmL1B/L7gyvCkZdUBXISzjMuis3XXPWHGGjn1xA1e0RGQ1ww
         u5Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pm1WDWlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16si3128610ywg.107.2017.12.11.13.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pm1WDWlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVlw-0000BN-2C
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:38:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfE-0000sA-UI
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfA-0004OP-Js
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:04 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:39142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVfA-0004Me-ET; Mon, 11 Dec 2017 16:31:00 -0500
Received: by mail-pf0-x244.google.com with SMTP id l24so12535862pfj.6;
	Mon, 11 Dec 2017 13:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8mhiqsddd4UsdvaCdG2Ds6Z728EUN/YHwzWh20Kvtzg=;
	b=Pm1WDWlGQRA44Kd7uwHVnmytPra+7CF72LgkkHjnzyeRCeeA+cWfJSuSI+vRYee+BN
	EKYRCSjKME6pUVgHlLOyLzFqKb4az8NgYkosMU3XeJxkvvxbztEh2+UdpRGnbBRHTwHs
	7sjHMzSztDLMgB9+FJFzzfHCUQWx3+iI+11e9KStxPV7fMOjnjLGkBfttcrJqP+eUsb4
	yZ/iOMGoyN7BORA8ED8H+1sGSZUOrsxHC/kmTYfsW7joMrF/iB28Arb6Wp+Sc5qR3nHO
	bshID1VTD4lpKshCNIOkYJzrZY9geoBmSAaKIzouxdIV+Ki9IqkbApNcFEYsT6no0E0B
	Li8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8mhiqsddd4UsdvaCdG2Ds6Z728EUN/YHwzWh20Kvtzg=;
	b=NMn16ja/AJ5sIzkZpaK1rrIAf0frz5UYPxRMGJgvjRPzxg0WmexLBY6o83+mrJo0cG
	SAh7lMH5p4dECSWEuJj1vsk3qgnEp+VAkJTUcH5vwUeC82bsouFCDVrhwazZ6b1D+xyQ
	M90iQDaMe4l97Wnu/4SEeIfw+y4mRKsK72oKRbqRzutYXCGpRayQgJVEJXaqxuC3g1o7
	XuM+9aA6eaUrSrUzQyCEVmAa+Vo9nvrbTqLmz/Ao1OGRK/upy0OOm5WCnbUF/lzJT8fk
	GFlwIjvoU1T8A4FwVBv4ACea74Ypgkpn7lNw4zBYmgoCgiV1wwl+m8CowwjqzJHcIS9i
	DwOQ==
X-Gm-Message-State: AKGB3mKkZUpIw4468TsGoojJH6Aw6Rre4Mw2BlQHJexRWumJ/4BBhr/B
	8ywq1Hc/5eP90RgR//fCrCMgYa/w
X-Received: by 10.84.252.146 with SMTP id y18mr1662226pll.70.1513027859320;
	Mon, 11 Dec 2017 13:30:59 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:58 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:04 -0800
Message-Id: <20171211213007.7353-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 10/13] imx_fec: Fix a typo in imx_enet_receive()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtQV89rcmOkA

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 6cb9e2e20e..c1cf7f9c58 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1150,7 +1150,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         size += 2;
     }
 
-    /* Huge frames are truncted.  */
+    /* Huge frames are truncated. */
     if (size > s->regs[ENET_FTRL]) {
         size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
-- 
2.14.3

