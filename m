Received: by 10.28.71.27 with SMTP id u27csp44520wma;
        Mon, 19 Feb 2018 07:20:48 -0800 (PST)
X-Google-Smtp-Source: AH8x227zEkhAjNkPXHRWCuUYRa/aXdRbIY2hzrDW1vrkgyNTgvZlxewiSnOaKNWxFWpeD55kAYKf
X-Received: by 10.129.74.2 with SMTP id x2mr11129173ywa.324.1519053648880;
        Mon, 19 Feb 2018 07:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053648; cv=none;
        d=google.com; s=arc-20160816;
        b=Heoho0T+fJ09R+TkhSuSDslrYxkgEP2lAOCzGTSPFhe5ER9tPFwsJeCmCRzgGVsaRx
         Cm8yDj2Nw+IuelBX4VETzDMs2yMDPIdIGPQAL3kTUUGtGTa9dRpvuieYcYXZMz6/wfly
         LtnMaxCrKKc49zIMYTYPytbBiCClx6JjFpuP9R06KC0+874xoa3sST2KmesYIjLMQqBb
         uCGD6T706V7a2wGeNS5osOjPczjHfhbQTocTO4iZwm3u/6mKan4zZK8Nd9AL2RwPI+z9
         4qIWqN6b4RU/v6pMfIuyDvUqnvoKnlR6J1QrP0YjtboZyHASLK0paHi102Q0bSjdhczi
         yyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=yYUKkyuhj8zFizSqFmG8c8pdPAhYO+CSFCFa8eBy6Gw=;
        b=xWMPZz62yABssXHh5NZNex7lXaIOsniU6LTKhkyZn26n0gNbk9Juq36ilCiFhchg/v
         lX+j90B0pzZBsvJ46+/b6A/AEOo0N2p5qt2U0NTw+V3fgwjshVtR5IlG0AMHsKdnUt1/
         SvbQCE5y/Yg0wMWi5mplNvSMUml9m/N+DesPxeNyhElTBGIYFimBve6WQEPMCzJbapYs
         Dq0Clh2gtCQb19sXUmo9C1AYo0jKMe24sDvPmo+lnQ0o+fLE20vfHdGCGO152TxxdrQ+
         4cL3JOuhj9Z0XWkW5QQckFkuI31f9+g2ZkBQ4iS+1pZXQiuGMAD2yJ9tKaL3cOVTT7Kk
         Uujw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=th2SGyWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1si4030111ywm.116.2018.02.19.07.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:20:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=th2SGyWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennFI-00039g-CK
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:20:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEp-00038m-8A
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ennEo-0008Uc-Ce
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:20:19 -0500
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:35021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ennEj-0008RM-1e; Mon, 19 Feb 2018 10:20:13 -0500
Received: by mail-ot0-x234.google.com with SMTP id p8so5907984otf.2;
	Mon, 19 Feb 2018 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yYUKkyuhj8zFizSqFmG8c8pdPAhYO+CSFCFa8eBy6Gw=;
	b=th2SGyWNehOiK591/xmH9fE7HewzDj1KhLEDTpjadcD8/K+VjaQ4LldCPtp/JFxtd7
	eSJ+PBGBYbslHvSPyS0azFmPWMLwJvwnbeJxNToAZ+oA5DZqgXoiLH9SwCUk6tVK1yp5
	ng8Ucc9KqZS4QOKjisYYVw9B9lqPtXjpi05IL+4B/vtHJD/K6pcntV+KWvVvNyYMVPTc
	uz/noCvDGnvR8pjsoqbigZUozGFy9NISgH2BNA2/an1RAi5JXXK1Mf8vcCSRTwyACmMB
	OEgs1Sqia3nTUIW36xE5Tw5IdtqdcQkP6dQ2iByRLjHA66/hYjZv/6+gyH34/xFE+AH7
	gRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=yYUKkyuhj8zFizSqFmG8c8pdPAhYO+CSFCFa8eBy6Gw=;
	b=R2Se/BQOs5VM7vlBc09+7E+cq0LdfTLpu+WbyMxdV2hyjjkHGSvm2jprC6oWM4s5Ny
	flALNRphdf+tO5nUtSLUmaFy8a79fYEGxX0eyA6DRPVL7TXD9PmIn8DDZ2L0UII3ljrf
	8kwYNe35xGCaTiGa3gf6dMSs1F08RtBomjP7EVxZRdAn4tKwPBFGepHHP0Bek8tuml1Y
	jwrNnL3Q7NiNHLSEK7TaQuMld5wYu0g1FWX8d2LBGF/bOeXRYVvVstt18rlJaP9tlUkD
	RJvFg2BpHBcrxl1kv/vtGbPTsJF5h0PHuXh95VrUOPOsuc8U1mM0DxQDXvI0/qOr4Iw0
	T/5Q==
X-Gm-Message-State: APf1xPCWgY/dYlHt6gJlQNJoBQtSCwG3GoGPnyfXH9EKDIeoec479vCd
	ukEHlBvVZcPBsHILrqJR3TOMgw8=
X-Received: by 10.157.17.110 with SMTP id p43mr3628352otp.191.1519053612143;
	Mon, 19 Feb 2018 07:20:12 -0800 (PST)
Received: from serve.minyard.net ([47.184.168.85])
	by smtp.gmail.com with ESMTPSA id
	96sm12804879otj.17.2018.02.19.07.20.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 07:20:11 -0800 (PST)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPA id 15351776;
	Mon, 19 Feb 2018 09:20:10 -0600 (CST)
Received: by t430.minyard.net (Postfix, from userid 1000)
	id C06F9300967; Mon, 19 Feb 2018 09:20:08 -0600 (CST)
From: minyard@acm.org
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 19 Feb 2018 09:20:04 -0600
Message-Id: <1519053606-9817-1-git-send-email-minyard@acm.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: [Qemu-devel] [PATCH 0/2] Move the bus class to i2c.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1eFiH9KSOLc

This is a couple of changes I have because I have a bus mux emulator
and a multi-master bus mux emulator.  Others need this change, too,
so get it out there.

-corey

