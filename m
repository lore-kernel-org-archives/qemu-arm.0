Received: by 10.223.172.38 with SMTP id v35csp3429574wrc;
        Sat, 9 Sep 2017 15:42:27 -0700 (PDT)
X-Received: by 10.237.63.15 with SMTP id p15mr9670991qtf.113.1504996946998;
        Sat, 09 Sep 2017 15:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504996946; cv=none;
        d=google.com; s=arc-20160816;
        b=qv868kansv/NNywtluTixv33M5+N5rSZ3jd+Lr/uVmPI/SY1Zt4cjTrrCNs3/bZASq
         nQsk1v9VdSMZiUIAOEtdmpWOnh69w+lyn6UnNy5GouM6YVq2aY7v2t1rn3e6uMIYJR5Y
         ioPL2W4YCy+Uaqu1Nn3usZRbkeojb+MAhjFYrkPT+DHwucrFa1EH/YnvBeDwLa0VR8Th
         P3ywTL+KIyNVWKGhAJJDKniskTUgCsS3pSiLtxuUqtLfENoOqMYUaUPF3W5Sf7nzpBji
         UuJ3QXVz7X95YJZcwc8Orbti+lJxyy0amZMsadN/7KGbLl0xyc7MLjEoriJXhLQz6+zO
         O6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Em10Am+QWQYxdO5XUy2UgvoUiH2226A4ZMrbX00AocE=;
        b=z5ZT4N77HaLlE/mOlzGFpWfR8FGQrzPSKpqLucLx/j6NravIDVQh9sRrH91ZMvZqoy
         S4y1edtPLuIaG0+tuf84cSWCVYSMs0f34rjGkI9s38pVC1b8E6TxDPlkFvLZvTzJPVM3
         DenV8oQJerxM/loN0td3CiBRH78xg91aSrsZm7RYOAh+gohFr+KOxuXnEZ4AyLLEKyVT
         QVYhTYWfgbTUUdUgcDSj0G8QPWkWFaUKR9sQQFm5edbeM6HHwaibJFq1jvIrjI5b16v3
         Fg1tZhGd7GZmbftpRsnTshBs0EJsHUkN3fbREjX0mntW7LSLmSZxecxrl4rR5OopnsCF
         g2OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AZJwNha/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n34si3879118qtb.277.2017.09.09.15.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Sep 2017 15:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AZJwNha/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqoSG-00025l-N2
	for alex.bennee@linaro.org; Sat, 09 Sep 2017 18:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dqoSA-00025W-Pd
	for qemu-arm@nongnu.org; Sat, 09 Sep 2017 18:42:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dqoS9-0008W2-Vi
	for qemu-arm@nongnu.org; Sat, 09 Sep 2017 18:42:18 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:44523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dqoS9-0008Vg-P4
	for qemu-arm@nongnu.org; Sat, 09 Sep 2017 18:42:17 -0400
Received: by mail-wm0-x22f.google.com with SMTP id 137so13487294wmj.1
	for <qemu-arm@nongnu.org>; Sat, 09 Sep 2017 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Em10Am+QWQYxdO5XUy2UgvoUiH2226A4ZMrbX00AocE=;
	b=AZJwNha/OXI2+DG59z4+R/61ecemL2ioCjqsHLqtq9U9OB2Nyr9DaWSkjCB8ZdB7a7
	EgpqTksoEZ5/BLaVQnrGYYVpBXst4RTaiXCNGeHPftat2oRIG/b6O8qe78Va+wygi2Ev
	IWcJiHsjn1V38ptPMhZB10ngqYIe+H7Kj7PGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Em10Am+QWQYxdO5XUy2UgvoUiH2226A4ZMrbX00AocE=;
	b=Owk+6ezGrML730sulPcFghoO7ykEW+uwCxS9LUyUmwEdI6gCqXXuJ6BFs9jzCuI9a8
	rOqcApZWLHUdaKKgiec/e3vHk4vOS7rFOInKbG0WKAqyNvcWZ9bvlVSiBvkECed3AeIy
	Z9D9+lbuu7PualWJGUkWdNhaNLsfm5bacUG0jm3I725dHfxEBZt+CYwLCwdcSKLtUgAP
	MTykLhfbd/4vFM35DDYn8kRZs41CD0lK1fksl7nAus5GYKBtiO74ukOoWKRfe/nlYSB2
	pxf5QirCBAygas0R2ksXsYZNRGqLDzymJ5Oy5UukI3wm7HXQPfwwHC7Dbrr2z3q+9XTb
	igDA==
X-Gm-Message-State: AHPjjUiR+Opi2R6fTLlxIASUBQnk4kTFIl0EC8wtDFQbHn1PlfudvLb4
	y7vdffyRxUpV3yq2GyBYf7srTYSBHrlpD03Imckatg==
X-Google-Smtp-Source: AOwi7QCiu0DUqHbcA0Rt6QaEl7/bXGmZHCMD9zT4QUOTNTcfokgjCbSUrlZ7GSw31OWWH+UZrlqmA5m4H2jUuXTOkl0=
X-Received: by 10.28.43.129 with SMTP id r123mr1428847wmr.101.1504996936609;
	Sat, 09 Sep 2017 15:42:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Sat, 9 Sep 2017 15:41:55 -0700 (PDT)
In-Reply-To: <20170909203014.GG7570@localhost.localdomain>
References: <1504533662-198084-1-git-send-email-imammedo@redhat.com>
	<1504533662-198084-7-git-send-email-imammedo@redhat.com>
	<20170905213152.GG17184@localhost.localdomain>
	<CAKmqyKPWDmVYJceYao7NkD5svWqN_fYbDoUJ4uLNFdAhv+kFwg@mail.gmail.com>
	<20170905221226.GZ7570@localhost.localdomain>
	<CAKmqyKO4yRz3R0BJ+gz=UfLc0d_AoNtEAHn-SNFMzg3xo12D=Q@mail.gmail.com>
	<20170909203014.GG7570@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Sep 2017 23:41:55 +0100
Message-ID: <CAFEAcA9iTepyGg17xPB_4XOnoOK6iAPsvOdJg_XLEbdk+dggGg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/6] arm: drop intermadiate
 cpu_model -> cpu type parsing and use cpu type directly
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
Cc: Rob Herring <robh@kernel.org>, Andrew Jones <drjones@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDhyaDieyXxk

On 9 September 2017 at 21:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
> However, I have a suggestion for Igor: making a separate patch
> that renames the existing property to "x-cpu-model", and using
> "x-cpu-type" in this series.  This way we will explicitly
> document the fact that the property is not a stable
> user/management interface.

We have lots and lots of properties on non-user-instantiated
devices that aren't intended as user level configurable
things...

thanks
-- PMM
