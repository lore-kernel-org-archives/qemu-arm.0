Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp11046wrt;
        Thu, 3 Jan 2019 14:57:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WbDCaNOVcKnRB5wX6z8IiyPMJwud6fco8sjBPwJgK7Gb3G531+qlLM5Q6OYOws4JtrYI7g
X-Received: by 2002:ac8:46c6:: with SMTP id h6mr48428389qto.315.1546556276612;
        Thu, 03 Jan 2019 14:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546556276; cv=none;
        d=google.com; s=arc-20160816;
        b=xE8gJG+kPMKapdKWC2AQGwwrvaRkueN8jOey6Sz6CDG3CmW7KpAq/o1aEcubzHeXQM
         U+Wvdb3vmdLNpMLtziiKANWsAusLg+h5TYjJ7fm+XsivHMNL4gqSrL/oPlX85Ct3DrLq
         +DurM/+JPQenWPziNru6NR4Z24p1xIZuiDOcOhEmTtPrKrQLiS5UFOYwKju3kspJzKVb
         oOFtRfXHZL8Th88Dhjm6dn8mNLxvkXOTV51NBwD39r8JMTqIPp6rrp8FiEK7LrBoaqba
         o2e9yWMQhOKCxkQkB4b7XqH/dxp+oN4GVuRFPYoBzQ9b9vU9ZNPXOu7Wche/+0VUB7ji
         P7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:to:from:date
         :dkim-signature;
        bh=VvJ7eIDxoqm3YCKTkqxhtpfFoCki1ASV8a3V2ySFx34=;
        b=JZqMxvFNS8P4QqkyLVkeX6eUxrKoUM1Sx9dOaPsg3tXRYR+Rsiryos4TYqdI4Wyqnp
         YRlT6jBszvsB6e4SucKMWckSUcHe4gN/LiYFTiJeTC5YtPz+05v85QREleE/NNMVCstb
         SRCcfk/IZt8vJwkEqyjLK7JobnxkLFymTi1OcbaiW/duCv7wAPtB/0T9XQv9w5lgrBGd
         Hkp1Io1q7c5tUVr1Gxf4EY9lm5bxtpfGNPpoOcQHqnJIgM2+ZUx1y4y4ijObmchZrBEO
         AfeXiJ0r8F05GQ95FzzA1SkodDl3LOLjyu3S6ZuRsnSz+QABmqXO8JOszQYThf4kNHwh
         USsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b36DSFL5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e29si1701583qtg.311.2019.01.03.14.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 14:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b36DSFL5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfBw4-0004n8-6S
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 17:57:56 -0500
Received: from eggs.gnu.org ([208.118.235.92]:54091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1gfBuy-0004Nv-Px
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 17:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1gfBuv-0008Pa-Lo
	for qemu-devel@nongnu.org; Thu, 03 Jan 2019 17:56:48 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:37187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <antonynpavlov@gmail.com>)
	id 1gfBuv-0008Ol-Ez; Thu, 03 Jan 2019 17:56:45 -0500
Received: by mail-lj1-x236.google.com with SMTP id t18-v6so31038462ljd.4;
	Thu, 03 Jan 2019 14:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version
	:content-transfer-encoding;
	bh=VvJ7eIDxoqm3YCKTkqxhtpfFoCki1ASV8a3V2ySFx34=;
	b=b36DSFL50vv5n5X3AFX5tgX/gkjsxSG65pUkWtgC80BjH+9myvScRGJ1jJIqxBTaDO
	gcfBv7Z/H+RgG5fzXwnPl2ms4xOkPcvaV+bRADNMtVSic2G3Uwwf0YKmMfB9mFOa2B8E
	f05l1l9Mb8En9cHG4Bf09WeME0/e7A8EqBMP/6/tUKvjNw4iWWVO+PBzdsz//EJ+Scfv
	9RpTdcTbNC0EY8e/HGopwNvYbuL4EGS+iIxKHpN22WPRuGbmMD07K0zb2gBeiNmwKKZ5
	51PIPsviSFgVHM4B2qvENqCMEfB2oJSAsavkmDyriP90tjpw2IRIeVEPHBN29KwfRRSj
	rXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-transfer-encoding;
	bh=VvJ7eIDxoqm3YCKTkqxhtpfFoCki1ASV8a3V2ySFx34=;
	b=U8CcMTKjomNkPjl81jDWr4WkD1W+rWBlJuBpB9AgjbNszSqCciu5lTSMOJvpg1WSdR
	WWK/zCkO0SyuaIBgiDjAQ4RsxkqqxlIVWLof1yacM33O6Zq62TRCMaisMNb8SOyh6fqz
	QO69l6ieNEVME1Ti/WY5Ewg4T2nEUG8OPp+4nZpzArNgd8Tm1h5kwpEotvPtq69walmL
	uCJ7zAL1/eWoWKtNpyfgDdL4FBVEGpDhcddVl2W0ZBG7w8iCnv7akp73WvGzWWX1d4PM
	FOWbFIHN/LYBPwc4cY8UmmnHX31VxzWmNHWerHxbsjelJoxD6u0BOoIT8W7EX9/ldKBS
	1ZNQ==
X-Gm-Message-State: AA+aEWaykGDlFq0UPiCcG/F0TFkdswkptrbmppO9xhWmwzolbfy6v9k1
	v8veNB+MQ2LSPnzewsqRvk4=
X-Received: by 2002:a2e:868c:: with SMTP id
	l12-v6mr30909396lji.90.1546556203835; 
	Thu, 03 Jan 2019 14:56:43 -0800 (PST)
Received: from flare (t35.niisi.ras.ru. [193.232.173.35])
	by smtp.gmail.com with ESMTPSA id
	y11-v6sm11944889ljc.85.2019.01.03.14.56.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 14:56:43 -0800 (PST)
Date: Fri, 4 Jan 2019 01:56:41 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Message-Id: <20190104015641.e6d525f098c5e272694faa62@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::236
Subject: [Qemu-devel] barebox on Canon A1100
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
Cc: Barebox List <barebox@lists.infradead.org>, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y1EE0x0Gbx1e

Hi Sascha!

I have some good news and some bad news.

First the good news.

Barebox was used for Day 18 of QEMU 2018 advent (https://www.qemu-advent-ca=
lendar.org/2018/).

Here is a quote:

  > This is an image for QEMU's emulated Canon A1100 Arm machine:
  > Play 2048 in the Barebox firmware environment.

The bad news.

Current master branch barebox for Canon A1100 does not work under qemu,
barebox v2017.02.0 was used for qemu advent.

Thomas Huth reported the problem in the qemu-devel mailing
list two months ago. Please see https://www.mail-archive.com/qemu-devel@non=
gnu.org/msg571887.html
for details.

The commit a43e2bbc468a71 breaks barebox for Canon A1100:

  > commit a43e2bbc468a71fb8825e8acafb7fac7ad7c6dad
  > Author: Sascha Hauer <s.hauer@pengutronix.de>
  > Date:   Wed Mar 7 10:04:07 2018 +0100
  >
  >    ARM: return positive offset in get_runtime_offset()

Any suggestion?

--=20
Best regards,
=A0 Antony Pavlov
