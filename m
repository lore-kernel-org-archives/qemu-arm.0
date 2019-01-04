Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp663612wrt;
        Fri, 4 Jan 2019 06:30:31 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U99kh/5moleDj7oEFe4hF1Ke3Gha7R48g/BZX6WnNuKI1jrbqQ1t35nmSRraz15eAUpQ3U
X-Received: by 2002:ac8:2dc3:: with SMTP id q3mr50825643qta.178.1546612231903;
        Fri, 04 Jan 2019 06:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546612231; cv=none;
        d=google.com; s=arc-20160816;
        b=lS25OtyMcl8NP9TTlkzqQtOQvV1I1+u8ggQqpr0oJCgcpom//jGMs7qGW8C3sGafhX
         1PHLwUtLWnCdEVfYsCPwHU5YD31Etyr5Y88RQr2b8J1qMrECZS4ADAlW5LZT9hKMJL38
         V0P8dAbx3Nr8Sc8A+JbT9xfuZxvWE1zr0woFvwYlanrMWoumkD7XFPuoOK/x4pAp3/bQ
         yXk+5iolssF6atK1bfwpyhc+wWqmjEfBpvrv2zhWoCYkM9nqtTHgQ+Jno7o38SFK831D
         U/rqK/3XL+g1cd1e1aAu5uwP0JctL18kZFIbA+wQSTbUtGnc7Pd62p4i39eAiXX6szX1
         CdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=0/rO4Bl2DybARrc+RSAdT3bqCOdWAeyJiUhraGlJLSE=;
        b=vT+p742FhfenqI4AI2sH94nVPCRrsI0xP2WFZ5vvrX+8qeha/OkIMuRHUuxNEAYB3P
         8V/YUX8QikzMxQCbMAnVAKcpFZvpnBMQU7eNp3GI9WXO2RVhhwmt0BPlO+v/j8GZxrqz
         t6HX5qGLFZ/8KEfTeSScvkLaniMWudxVE+mS3OQAbZsEnKcq6f5Q6LAyzfy5xvS2ER++
         t0GLXF8wvhpdSdhYNz/W3lfB2qTVBEUQLRv7TT8flblTfxXbXzWDC0KN2o8LhzoliIf0
         vy24CDxZlUwF1UFQvrL2OEgVmLx+ob/KK46zAXw2FUfswHRbZXrMgTru1X/RqEvgp4X8
         uvbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fd8czuUA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si1288784qth.232.2019.01.04.06.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fd8czuUA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:35891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQUZ-0001SK-EQ
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:30:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfQSa-0008W4-IK
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:28:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfQSV-0000hX-Jr
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 09:28:28 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:41023)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gfQSQ-0000e1-Cy; Fri, 04 Jan 2019 09:28:20 -0500
Received: by mail-lj1-x232.google.com with SMTP id k15-v6so32569312ljc.8;
	Fri, 04 Jan 2019 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0/rO4Bl2DybARrc+RSAdT3bqCOdWAeyJiUhraGlJLSE=;
	b=fd8czuUAnS8OVDt4PgvKRbrOI1uolaJFkeUz2Y++6Hk8gEfUzQ91zwqGYRAoB1UDjv
	t0rENdlGXOC3UQa528MyCb3mQ7HCHZnnFu+uJihi4G/F7BqQBc9YmOHUFB/ja0/Q7giW
	etnsDzmp7jQAHaGo0kxKAk1SuXRUXTHDz5UFdIVtOoRj6BSu0xdZc3AVIZ72iC14AIJ3
	9UwxnsA5YGxn3qmt7gM2S8iR/BXx18O+ML61bISldCMmD8bEYJr8+4N6KctDAAuzuzkg
	VQvEklxjijZm49hEasunsJoMsy9bg+eQwrQR50nYL/f2GxRTfLNd53qVPzHyetwAsGD1
	QJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0/rO4Bl2DybARrc+RSAdT3bqCOdWAeyJiUhraGlJLSE=;
	b=XOGkEs+/qpTlNs9/QiT7LuxXcwFBHAWBm9e/H4CY+qVcfntZJW1/UziDBd6uIiRK/A
	m7zjpMSJ6KHneT/pisEEWVa+bzRNDLz9XWl+oehTIC3AxbYI2bkVtJ0C8d7DkRv43Vmw
	dtQvKFloud4e9Y0EIgUq36mJPNcHbPVpov/zaL89XNaxMJQDxDLbMOsAmz7gNTTWMxuw
	jpSEws027W/Vs2at+85owi9pRsXh+L4nKlCNSXiy3cShSdg98Lr0E7mKRsypibqwdjQk
	/gWRBDLitKfOHQk/lXAGRXfGpwQ9zt4YVKhNhCidUbRsoWlRK1iogZvDYLE7zkbF0fRd
	EVTg==
X-Gm-Message-State: AJcUukdeZxX5fBy4VYzRkRc1qDxUIspSfl+Il0uLN6tgHSCwiAsTwKIO
	Wk/7P6axk6D0I/VmbIcx/rS9Jn2NPYo=
X-Received: by 2002:a2e:9c7:: with SMTP id
	190-v6mr22008208ljj.120.1546612094030; 
	Fri, 04 Jan 2019 06:28:14 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	f8sm12468887lfe.72.2019.01.04.06.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 Jan 2019 06:28:13 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  4 Jan 2019 15:28:10 +0100
Message-Id: <20190104142812.20444-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::232
Subject: [Qemu-devel] [PATCH v1 0/2] target/microblaze: Add properties to
 enable exceptions on failed bus accesses
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSQsT56pYsBN

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the necessary properties to MicroBlaze cores to enable exceptions
on failed bus accesses. There's no board that acutally uses this yet.

This also adds an unimplemented device to the s3adsp1800 board since I used
that board to test this feature. The s3adsp1800 does not enable the exceptions
by default though, so they remain off.

Cheers,
Edgar

Edgar E. Iglesias (2):
  hw/microblaze: s3adsp1800: Create an unimplemented GPIO area
  target/microblaze: Add props enabling exceptions on failed bus
    accesses

 hw/microblaze/petalogix_s3adsp1800_mmu.c |  4 ++++
 target/microblaze/cpu.c                  | 12 +++++++++++-
 target/microblaze/cpu.h                  |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.17.1

