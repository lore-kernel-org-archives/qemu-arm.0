Received: by 10.223.197.9 with SMTP id q9csp10480386wrf;
        Mon, 23 Oct 2017 04:59:17 -0700 (PDT)
X-Received: by 10.200.49.21 with SMTP id g21mr19752660qtb.183.1508759957198;
        Mon, 23 Oct 2017 04:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508759957; cv=none;
        d=google.com; s=arc-20160816;
        b=ApXGzYFkZr0af8kfeeO0DW6hXAf6F9Q/KETAJAFw61aLXqDsVLGLhvKXlZw+Eh02VD
         5eHUQm9VStRX29388ZLW/vX0ep0jzAyMVL6WKBOvH/ZbmCrmhrM/wHD7ICFYFguL5fSN
         yqeQfTW4O1wIP41cJMpVsqg8gAwFvFjI+y0MMRr1FTiGdOkR/lK4ac5eexub+3bf88CN
         lOUL3KodZ2ByxpR/dkLdk67tJGiMheGMtJXyu6Av0099snSfny5wz610cyVgqc0X/MAF
         igWl33pgIQDlrfNFF8RPwkf7BYDx5xpSPOmiQw6+9CEy1ER/80FCXDV4/hHClZ/7fXzv
         MX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4L7GKylS58utLi4h0WrBWpyvoQMOYXbQEfQVYfYAqwk=;
        b=jzqxKnnewTlmy5nsbFtfFdz3i4p82NRzxva+LDc6RCneAl6cNmZ2CNFYcAMz8rcJzY
         G2M3ft/fsT6ZQ83Efra5l8gM2xUadEZ4Zdjpkv7UBwIVbS75hPyWTi0Mh4SB6DcBxCTs
         UJ7qys+Ru0AqQp8qCkRXR67QHPBkwAHicSY518U3Kp4HlcqCYr9X+ZtRooV2wCdm5xg1
         vgVplXDSFej+CVdxHigk/s+jV3na40ulavAh8Z2o7iVfI1cZW+/DZw9GlygDVovxNDRX
         zPVWwipCw+g/TguTRkyKOC2KgjYZtpwt9nqRXwsI0O2YK1MkZRUsucyLa0640veXqJ0A
         nb5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=jmUebRH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v57si2924308qtk.161.2017.10.23.04.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 04:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=jmUebRH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:38190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6bNz-0005Tp-13
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 07:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6bNs-0005TY-F0
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 07:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6bNp-0006d2-Et
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 07:59:08 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:52857)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>) id 1e6bNp-0006cd-9S
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 07:59:05 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5af439e7
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to
	:content-type; s=mail; bh=LxZZSPyDp06N61HUgbE4FVNCZ68=; b=jmUebR
	H6Cy3OTgebGTz2yWUFkRBgs/PaKM5GQHImh0MkUV4ky/gVB7bCswFfYWaXIZBLlu
	6FZ5fNKj3E971cv/8j9xQe8pq6MUp6dl/L1gNCkdACfCK7unDUkU5BODiqQHCVWU
	pa/kITq70xotCX0fXzuEafNH/dGlN0KmUEZTyXADwbdcEUdDq8Tr6iKp/agWe9PN
	AmOWm+TcSvto9GvO+bB3/U7808we3XkCmMC9Bmt/GfRGBydI/nw3W4ICbTz4R2w5
	qGg+2d3xH2YKLYCaATpYWWVQoH/RQVjMk8PX0IUEqobwWuM9G97hdunnWeXZmi+P
	RdeqbcX1VQKwtihw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 92e3b760
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 11:57:40 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w197so30155599oif.6
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 04:59:00 -0700 (PDT)
X-Gm-Message-State: AMCzsaXCBzYzJNmT11xG+mv5HsBOi6pbM1dDERgiDqkUty74HcEPD875
	Tra5Gs0kl36V5THCwlWhM+nqQ2Q1m6DBIYpqhaI=
X-Google-Smtp-Source: ABhQp+Ta0/m/Aqq69MfWRlU/104zJCs8Ci19BuH1X0/89rYICjsTb/9yDMb8gREH/sqI9dyTdenxynAWEE5Oo1vwXmA=
X-Received: by 10.157.3.102 with SMTP id 93mr8323339otv.165.1508759940111;
	Mon, 23 Oct 2017 04:59:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Mon, 23 Oct 2017 04:58:59 -0700 (PDT)
In-Reply-To: <CAHmME9ookp9nbyU-aaL-7F1y0unn7whfSfadj+oMfjLc=bwpOg@mail.gmail.com>
References: <CAHmME9ookp9nbyU-aaL-7F1y0unn7whfSfadj+oMfjLc=bwpOg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Oct 2017 13:58:59 +0200
X-Gmail-Original-Message-ID: <CAHmME9qyHQz2stgDsxHqMNEPnRhc6+26iXexxoyWkat7_T+7Rw@mail.gmail.com>
Message-ID: <CAHmME9qyHQz2stgDsxHqMNEPnRhc6+26iXexxoyWkat7_T+7Rw@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-arm] 2 pl011 on virt machine
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rly5GhL4kcm2

Actually, reading the man page, I'm pretty sure the virt machine goes
out of spec:

       -serial dev
          Redirect the virtual serial port to host character device dev. The
          default device is "vc" in graphical mode and "stdio" in non
          graphical mode.

          This option can be used several times to simulate up to 4 serial
          ports.

It really needs to be calling create_uart 4 times, not once, for the
normal uart. I'll submit a patch.
