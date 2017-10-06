Received: by 10.223.197.9 with SMTP id q9csp220317wrf;
        Fri, 6 Oct 2017 17:25:13 -0700 (PDT)
X-Received: by 10.237.54.163 with SMTP id f32mr5718161qtb.170.1507335913897;
        Fri, 06 Oct 2017 17:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507335913; cv=none;
        d=google.com; s=arc-20160816;
        b=AkYIRMaZVyKlbn7yTlPV1/paumUpId8D1/iUdRzs8gWR5E6Ib6aL5rYNTeBhh2Fvpr
         z8PqvD+K1zyQ8A85yjgGEzRm1a9zz2Nm7owaJIcrKwn29bzbHvoKwKq5jRNZOe3INK+d
         HQqInBOIoKOVv9sxQjUdCbst+zztdew00y9mJaxUDHLg9DEMwZEqRP78DAEOjoAbEFmT
         9+Bi/san0CiaHq3PpvOuYIkk4uTyHXKtEeM7cnol/s2CQ/49wQpFX9NIlVwQQ3vB+/wx
         YhDttvGYXAwBjBnytGbOqG5Pz3CJF2u0IWp9Sy9VeTLcE9qF9lL4+rpr9SCxHwYY495+
         0JXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=K11BF4s8VQOqU6nEorWyCTrelnBi8QPU65wJU5KBOvQ=;
        b=J6IW0bgQSj/8cnsBFnAUTT9akpSNvLJaLI65H+kd6CVcgn0s75QxOIiVnAPLpuLFqG
         wmsoj1z8q6GXsEIRlC79F+VkXPlKQf0R/ysMGgMiVZHUGqEmSSSqxd0LspHlESQtkH04
         kMGZbMO+ghLrAPNAVNB6iyOsPJ82E/Fgm1Be4cIjlhMq7oPr1N3q86U/XG9PRaZwAE7N
         z6aAyfud43QACQpH0ufLN5AXXKY7xWUPYKioy52+DNr4ONTrJERiCnb6v6ueMTH5xykv
         EjY4ADhLDLaLjQQkgubJ4j0jqeLwqrWMBUcA7twDzWDJnPNNpKAgAVYQt7OlnLyUoqdS
         hDvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iaqz5SlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a102si2346599qka.352.2017.10.06.17.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 17:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iaqz5SlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0cvZ-0003Io-AO
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 20:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR2-0000us-Qt
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cR2-0006ks-5Z
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:53:40 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQv-0006fD-W9; Fri, 06 Oct 2017 19:53:34 -0400
Received: by mail-qk0-x244.google.com with SMTP id z12so9700654qkb.0;
	Fri, 06 Oct 2017 16:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K11BF4s8VQOqU6nEorWyCTrelnBi8QPU65wJU5KBOvQ=;
	b=iaqz5SlRs2WeBmN3/1CEh38Cll16nB1xATBjYxS/1uKy+OiTMFIuM2WJkNIQxXKLJR
	ZIN4j5E2bNZCHiTn6bSTdLtuCJ5Y71LKwdhMErVEOTiLnn1IwrWZXDSEnJWRF+SyUFz0
	en6/LCQvt08ML+ce1qbEn+4DTi5hw4zt+RsqeDs0MZWLGSNEGWUTGM3jZOKHIMXK+3+8
	tT/3FEL1dJixGgjOoVDLZ906gS0u2SPcYCETyhsGwIl7B7e7gUjwG+wObBaCd7bYbnd0
	NC40TXs4ApTsWA+RPXo+pYw+e2yFNF/qKyYEPoSpoYtmUo5qGQgTXYkX1puPsC42Gajf
	pdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=K11BF4s8VQOqU6nEorWyCTrelnBi8QPU65wJU5KBOvQ=;
	b=Ch/jlhXD8F22dd3hQP+RneVxRQ/7RodELMSPxTDCOmII1VQeyIjGAoS7Lq+le6YOyw
	s0g0uu8DZKX4mygxPrPHV5x5BIn2FTg1SiyCPDqBNXP8dhuIDy6KXwV2d520Nw4BpUMJ
	ngTrGmxAHcVh+wi+YOHdgxIU9ggDhuibe8G0jOXDV8E2B2pSj+n8zKS1UC3KlrRS3kE3
	JH2qFw6HDpfk/PTGlV5bw4rwKB0ZmIVYtIQdxKypxIfh9WqFcwlka5uHrTSGgrjoCer9
	0sb971LLiNB+/xcf8bs/eT+09mxjOD3wa9MjVZOxRXmKmuToZYILAWaRQfIAJOlLmt6m
	lsLQ==
X-Gm-Message-State: AMCzsaUe4FplMtOIHiam4Utdc/KAbUmivvBMsWH0weQ5vkBQAJKpbS24
	3xHpuq1xjOYOJHhEDz2AAyU=
X-Google-Smtp-Source: AOwi7QCVN20tIASnmxLG1u0cgLNgyEj8L9oOsss9VN33Wu+viT4+9h780aY53U6Wq1YTm9Wp6u08VA==
X-Received: by 10.55.25.85 with SMTP id k82mr624058qkh.223.1507334013457;
	Fri, 06 Oct 2017 16:53:33 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>
Date: Fri,  6 Oct 2017 20:49:47 -0300
Message-Id: <20171006235023.11952-53-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH 52/88] i.MX31: use g_new() family of functions
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e2iAGUojP4CH

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/imx6_src.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index cfb08710fb..9342bce6de 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -149,7 +149,7 @@ static void imx6_defer_clear_reset_bit(int cpuid,
         return;
     }
 
-    ri = g_malloc(sizeof(struct SRCSCRResetInfo));
+    ri = g_new(struct SRCSCRResetInfo, 1);
     ri->s = s;
     ri->reset_bit = reset_shift;
 
-- 
2.14.2

