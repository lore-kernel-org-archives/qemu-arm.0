Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3349536wrt;
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV615lqdZCVaCmRYcKs0Y1uXgNUGb/tqK11GMMGzL5YYpg6aZpbhVj9egxi9jk0ss13fggqB3
X-Received: by 2002:a0c:bd15:: with SMTP id m21mr46734614qvg.77.1540229786217;
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540229786; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0ERZVt9oTB2nz3aH3UxdrEaTcFj3abjHr5ZLuojuU/NT81/Cgy6v6MNDXA+HpJHTC
         QGXGtFNrEZljvrEpHXflV/N+xUeGfGTU3RB2SKg1nQpxiQSqN/qY1Z9+GMc9rcSARBV5
         E3JYDk+wQAIxBWmfNM3PPKzFHxAA59+MRGW0x8gFbHXrM9iDBSqUAH+bKenS/OD5smeA
         2WBVpVih7BjEifq7bFlkPifV7gWj6LQn3H8qwGSXlV5ie1bH0AIXurDk38J07AC1+z78
         3cHuM1JBOJfxDhL0cNVe3FqYCgdvVLjAw1v39T4TA9gaTCDCmfxVbYZfON3D/otl9bDl
         TXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
        b=kbXgz7vFt/H5OsrN8ON6pP8VXoYNPXhNwRfTPNOp1N/JU9Jau6g8CSbZ6L4NqqMh6R
         v+ArhkkBXnI/qejklz8pUdAKqIt45SsfjFGbGf0qIDgCZgvvxZ17MvszsdbEKyt8WhYE
         6py6gDlBh7ZFJaJ6D4FVzC+K1fLkviQakYAQc8M8I4Ed9kmwXPXvCWIN44CGZwGUv/xv
         EMKGW1AJjatX00K6nAUb3GcLMzCQZKWopp/e8UTAT5uCjCwIhHhyDXCUqW6U7zOTSg7i
         kWK2cGld5j2vDzlLWOUhNlNjNSw1gnOhQ9DzngUiGLwzgMbAy+/sMNfgEB65cxPzQi0k
         ilYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWhULy2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u29si3980300qvf.2.2018.10.22.10.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HWhULy2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEe7t-0005uc-M6
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 13:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7d-0005tA-60
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7c-0002XT-Fo
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:09 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gEe7Z-0002Tq-CC; Mon, 22 Oct 2018 13:36:05 -0400
Received: by mail-lf1-x141.google.com with SMTP id p11-v6so4640022lfc.6;
	Mon, 22 Oct 2018 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
	b=HWhULy2PratHC5JPDBsZugtjc4w21cuktGA1+LeMTojLqTjGqyk9a5QUhY7Mo+1ynh
	Gqz4f2r+ZNSxBUZka+0yhAthvPpjoOeCYJgkI2YRJdhk6yFIIlFbGF3HHEO+8xzJIiLA
	GhncqrsudI9VVFBIHFdC4IU8RJech+ys3CH3IM29KEeHis2MpZr7Ln0dEQLTWrp+IumQ
	iUFh74vm45O+Snb6y98i/K6wuKrd8BBZOZdPZY1xHsRFrAgWU0TeInahEHCa5CrPvHA9
	HKc4pLIq6TGZBtjYalfMkvF46EHln3SDujyNmbMKA/aJj3lTRmGEyCfeZQLMtuZjKcHn
	Gsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79QZA3/OtgWAsXd13kSpsXnd0tZupP5LpmVb185dkXc=;
	b=CcJXos48gTTmc8pemQxvDr5OmfreKqwv3+dCyzqQ8fMGkRZUFfCa2TceIeDf92nelV
	MpsmUP1ICMIw9MFgGKBOf7SwDKrXJuT9yLjHaAhkaYYgWKtnnq3IPBRHBbTBDLPD5ZU7
	fwTLPp6gis8fiQVTGroLkwz2LJBf6cORqvR1B7+mGtKGYKXAf4UqkZPE0inmB1nl5TY9
	A8LCwZupqHyJQCM3H04vvoiAsgv4DmlVboysSSajIG+HpVxa2sd0pU0yCgjBRuW2fB9Z
	1UduN1js8aL+8Fb9VI1mBOiDCVrhNKIBxSUWV6M7A01zDTo92f7bZACvoZJdVcOyvBcT
	fOkg==
X-Gm-Message-State: ABuFfojSpqe+Ufu7gP2PaFcTGPnUaH01kQx8g8SFrypZdQrmkk0wtixC
	90WcA17zL9EjoCJ2bfg7NHPwSVLV
X-Received: by 2002:a19:c650:: with SMTP id w77mr4947811lff.56.1540229763836; 
	Mon, 22 Oct 2018 10:36:03 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	x25-v6sm7051195ljb.78.2018.10.22.10.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 10:36:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 22 Oct 2018 19:35:56 +0200
Message-Id: <20181022173559.17111-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022173559.17111-1-edgar.iglesias@gmail.com>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: [Qemu-arm] [PATCH v4 1/4] net: cadence_gem: Announce availability
 of priority queues
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IJt2WttM5ujW

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce the availability of the various priority queues.
This fixes an issue where guest kernels would miss to
configure secondary queues due to inproper feature bits.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 1795998928..16a8455128 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1283,6 +1283,7 @@ static void gem_reset(DeviceState *d)
     int i;
     CadenceGEMState *s = CADENCE_GEM(d);
     const uint8_t *a;
+    uint32_t queues_mask = 0;
 
     DB_PRINT("\n");
 
@@ -1299,7 +1300,12 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x00000200;
+    s->regs[GEM_DESCONF6] = 0x0;
+
+    if (s->num_priority_queues > 1) {
+        queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
+        s->regs[GEM_DESCONF6] |= queues_mask;
+    }
 
     /* Set MAC address */
     a = &s->conf.macaddr.a[0];
-- 
2.17.1

