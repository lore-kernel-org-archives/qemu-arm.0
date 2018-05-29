Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3835086wre;
        Tue, 29 May 2018 10:50:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIbgsuuOQ+d12dNLtbJc0Zn2X6ofhdpmE/FXgGvIpL6xxlV4MtDO/EUFyE1WEaSwXdsAwuk
X-Received: by 2002:ac8:2b5c:: with SMTP id 28-v6mr17451165qtv.117.1527616248241;
        Tue, 29 May 2018 10:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527616248; cv=none;
        d=google.com; s=arc-20160816;
        b=m80Q1w4qwgt/Ony4gjfffxQlMWpLemZdOF+GSny6GgR2rbgpeMh6IyN4MFZ4ZWT6wh
         BWR0zF7BD2oZZ5VzKhcu+tZ/skHis3oVk9b4+XlSx1pfD2kjdS84mP8wvZMYljsaNA0c
         c6CmchfU6wTwHKIhNQe/fI6LcRcCUHHmlQjbOyBXM68g6HWVv0Mn74QMj74RNrd1kjwM
         dVn7FW+HeLmSXbl+ObLQHoTU+RGg7MWzJoZUE+q8wvjtyKhiUxU9wqb3ZJZtI6PJGUpI
         YVfnJ5lY0bIyobLt19JH7qiDYYTI5V6z8mJT5DCcPKEJGJqj5mfnwkjR7D1fc3VGeMYA
         FBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=PQP2J5H1byVn15zhYlrWEBPIIi4aeUQ+7v92hykcci0=;
        b=dyMr7Mxv4QJ1RitPtGXFwHoxjvcgNAdsxm0iivKVatZZ3CwIzjwJTsQfUS/ArDmEt9
         suvaTsOiPtVTZrKKWDuTse9zhRPYiMqCktJ3EqWmfQXQfZYRL/OFJce2512HXTvqgx+C
         IvDnTASY2Lq1ZmPqtHaMIRZ4/JUp7c9O0bjB/8q9RV7Iw1VehYbQ522XKqGvYpHkp3qU
         Hk7pQqXVUd6ibCFRJeT+z3oLuCa+7Cq2BKapQWaUBZgTrIlzisRH5QJXWMXkqtuD4GJ6
         /Z9EEoioOb/c3d70Bh2VSLVAjQor82IjqLIW4+A54Xb1lXJSPqeu8uIkgLHcmGjWY0E/
         vajg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R/dOXEer;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5-v6si2484920qvf.19.2018.05.29.10.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 10:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R/dOXEer;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNilj-0005Vw-Kt
	for alex.bennee@linaro.org; Tue, 29 May 2018 13:50:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijZ-0004Gg-DJ
	for qemu-devel@nongnu.org; Tue, 29 May 2018 13:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijW-00054r-By
	for qemu-devel@nongnu.org; Tue, 29 May 2018 13:48:33 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNijW-00054W-8B; Tue, 29 May 2018 13:48:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id d3-v6so19721921qtp.11;
	Tue, 29 May 2018 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PQP2J5H1byVn15zhYlrWEBPIIi4aeUQ+7v92hykcci0=;
	b=R/dOXEerii6GPSryBjjMZMNWcKpABl7nWCH0TCsHLP6azf4buQLN1TM/HA6cZ8DXpa
	04ckwM0ksvlE1BI+XIWQoFvKGnR5CN/fWRDYWiBlh3ojpoOS/0Yl7jVNEnd59PSnKm/O
	fkvha50CxqAZf5Q/5aN72eEwrcArXBSxjgB6A4EpE0pD+urfIk4+tR9jXF9Ki3S+bA41
	HxmfaPD9X/PbneLFytmais5jQ7tJ4zAh7mezIuEBi5u1XSSlc3kXybQz35//2wfKg0Gr
	ETiJ95v7Vra/P6Maen4N8Op+8eXwQ4bkEi3AWAt4l3bQ6/CZFXIBIUdSuhVgFXugmBW+
	9oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=PQP2J5H1byVn15zhYlrWEBPIIi4aeUQ+7v92hykcci0=;
	b=EcPP1KlZkKO5EVWN43kYkRPVz9dQn2yFoiHHDoHNWH8ERFTaQMw7afP06Yb6HUtRe0
	nse7YWKaUFf3ftfyXel48K3ludxojma+e/eofK6h4fIwc/3dB50+GeujtPSQYH9HAvJZ
	eL2TwKZtnPLT8c83xiaUg/Vz+xqcecA/IvXkPynL9CqVnkxu8FKEbLQXAZn2zV/0YGse
	XxqbdobGZdsIvAPYvNbCsc9bUO/P2QCDTdRooFZMpADefBK1PCcWtHenKYl+fUnVVpU9
	PcI2zJTm9dCqLVAwHCnw6w8P70IFuP2r/rqnCi+LHMRBfwYgVsnphlnHw2yc9TJgCoLe
	xB2w==
X-Gm-Message-State: ALKqPwdX4Ebjq2MO1erUlc00brYc9qJ10kuAg6+vGKP8AwGYqwPxKu/L
	5kA9xCUcwjOU+UdxmkAiqns=
X-Received: by 2002:a0c:b25b:: with SMTP id
	k27-v6mr11853381qve.231.1527616109635; 
	Tue, 29 May 2018 10:48:29 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	q8-v6sm25564308qtb.13.2018.05.29.10.48.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 10:48:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Tue, 29 May 2018 14:48:17 -0300
Message-Id: <20180529174821.19964-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH 0/4] qapi/error: converts
 error_setg(&error_fatal) to error_report() + exit()
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sbtmx61Visu3

Hi,

This series converts error_setg(&error_fatal) to error_report() + exit() as
suggested by the "qapi/error.h" documentation.

This reduce Coverity and Clang static analyzer positive falses.

See http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07585.html:

    On 07/24/2017 04:52 PM, Eric Blake wrote:
    That's a shame.  Rather, we should patch this file (and others) to avoid
    all the inconsistent uses of error_setg(&error_*), to comply with the
    error.h documentation.

Regards,

Phil.

Philippe Mathieu-Daudé (4):
  hw/block/fdc: Replace error_setg(&error_abort) by error_report() + abort()
  hw/ppc/spapr_drc: Replace error_setg(&error_abort) by error_report() +
    abort()
  hw/arm/sysbus-fdt: Replace error_setg(&error_fatal) by error_report()
    + exit()
  device_tree: Replace error_setg(&error_fatal) by error_report() + exit()

 device_tree.c       | 23 +++++++++++++----------
 hw/arm/sysbus-fdt.c | 45 ++++++++++++++++++++++++++-------------------
 hw/block/fdc.c      |  7 ++++---
 hw/ppc/spapr_drc.c  |  3 ++-
 4 files changed, 45 insertions(+), 33 deletions(-)

-- 
2.17.0

