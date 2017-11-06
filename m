Received: by 10.223.150.237 with SMTP id u100csp2783743wrb;
        Mon, 6 Nov 2017 07:49:09 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RiEd232nv8adDnP3Sbf0Q5VhGvx3i9v1HoW388MTNmlEO+KpRO4T7p0VoaqwfGCRRp1Fmw
X-Received: by 10.37.57.138 with SMTP id g132mr919641yba.438.1509983349850;
        Mon, 06 Nov 2017 07:49:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983349; cv=none;
        d=google.com; s=arc-20160816;
        b=SUuc8BWEBGs8ohI1U832IaedybN6krj/9dpBDeez/mYsNS17/Ud/t+g43o8wYCmwhW
         J0HGbqWLBrQG9naL+G3L/mUpXHWpfY9PcdkmyvscJHEIAhdTzi7r1m8BBmCGhtS5o6R3
         20/sO/KyqOCl6cfWScNwKcT3w2uXX82YET/KiurzlxcMWOKZBaoIKlksX9fEnzxZEW19
         sE8HX2TkdUtcWavUDFwQveE5ncPq6/q0uk/Hyc/jqNyVzFodTaQL+6QA8GAhT/XPqXiE
         0KvVrIFajioWWjnqErWDeZWpt3nepioGUWsQ/Z2hOwXZtRtRLC9C4mooNKQRZxN5xnEY
         KwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GXWoMvTsiaJTqHX4ULprtUDRnbXpQqmoLhRAiqv6NfQ=;
        b=aIIsOlI1OhtDA3wt+U2R7i0YrFiUObyM4+jOJmjv2gJ9e5G2FOfUrulcIpzsFmrLwu
         oMZB69Yt3sqS6503eWbaBgM8S5chvBUMT+jDb2KN26s5v0gjkKzbDGUvrY168o6v6/VE
         YYujmIcxFhiG5ZVcQOXzqS5rZz7RzjmcTkH72fALPweMqQpT8fil2zJcVfITdCxt686O
         KA9j/sJ8LZWpWy9ZWHmCevkSPif6jgo2w0ThHmCF0BrZUvKdqVODAMUwH5MmJ9sc2xTd
         ApNJE/nDKhfMaphyuPQhRgBTXxiLlxtasGGR9OkZidwaQKlg9gDWziUe6XokHNDYTucb
         io/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QwxWMsqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t76si2789479ywe.307.2017.11.06.07.49.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:49:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QwxWMsqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBje9-0007LF-7n
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:49:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdb-00071J-I9
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjda-0000OR-R6
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:35 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:44212)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjda-0000Nq-Le; Mon, 06 Nov 2017 10:48:34 -0500
Received: by mail-pg0-x242.google.com with SMTP id j3so8525048pga.1;
	Mon, 06 Nov 2017 07:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GXWoMvTsiaJTqHX4ULprtUDRnbXpQqmoLhRAiqv6NfQ=;
	b=QwxWMsqUH6XBm5mxjsIsttSk1krNDN+6qED70FsKsAERDGVFehiW1pH/3ch3sX8wEP
	7h0UR3MOJiQQLY6v1guOES2X3mYdlTHawnWQAibYfp6k/oAfcMzcdTPpNwDvime7OlKu
	1SsUAl4VxWAzSrp4F3YWpDleD34EGLdDfJK6+qPvEXrIsw+iASZmrTMmF6drZD4pgpT7
	/03r3I1q/gSiij3HZszxXF5mLHuRE3J8+s7q531QUppCRZmDqWuUCIaoszIW6mdIRBok
	B+uSK3Z+nuIDaG98Zzuuvgb4K+8YtjBi/n4XRh79sO3prJNMHbtst9csfsevyq8ttgO6
	1A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GXWoMvTsiaJTqHX4ULprtUDRnbXpQqmoLhRAiqv6NfQ=;
	b=RYnlzBeexKjUVgay5OJtEYlvjdWDJ5SwPReKba1TP32d7BHbCFA9yg19NiMwV3yl+x
	SQ7h8f0M9JymMM25T9Kle1mAkZaTvgXrsfdeZaHLGj5wwmLyvFDwhTvDY6Eh/LQhdqdS
	aM/jIQAwC04A03sykapSSuhO6uFgQNgA6WoPRnoD41t2VRj4+Fovc5y0ddgyiGAx0N54
	xyZLdg1ExHr2iHchrkLFqZtWdCu53jwGnR0Wpl8OGDKdxKLS8P/KwLNraEmRRd4PXlSy
	/4SUJQ3wNVZNCdIWKHXQuBZ2PpYytfSW/anXYmcTUg9QA+MxBhbV2FEFlaSd5m5lpqrQ
	+6iQ==
X-Gm-Message-State: AMCzsaVe9V0H4CZhfi4H39styuqt5w4kOW/pxx/clL7za/+Cxv9IOI21
	vvTpDf/ZsGx38UAPGrmT7+Gb3q2wMwE=
X-Received: by 10.99.160.86 with SMTP id u22mr15471908pgn.283.1509983313389;
	Mon, 06 Nov 2017 07:48:33 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:32 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:48 -0800
Message-Id: <20171106154813.19936-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v3 05/30] imx_fec: Use MIN instead of explicit
 ternary operator
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
X-TUID: /ZC7khPF4Zf0

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index dda0816fb3..18de508e8c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1076,7 +1076,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                           TYPE_IMX_FEC, __func__);
             break;
         }
-        buf_len = (size <= s->regs[ENET_MRBR]) ? size : s->regs[ENET_MRBR];
+        buf_len = MIN(size, s->regs[ENET_MRBR]);
         bd.length = buf_len;
         size -= buf_len;
 
-- 
2.13.6

