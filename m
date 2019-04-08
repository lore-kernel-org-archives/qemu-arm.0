Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3594049wrx;
        Mon, 8 Apr 2019 07:42:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLNw+wFtfqPBcMUpWNE6jiyS8yXpZoO/XmhnIMdnLS26zOR/SOrds/tyESm3GZNY6zuU6+
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr17403926wmk.9.1554734559101;
        Mon, 08 Apr 2019 07:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554734559; cv=none;
        d=google.com; s=arc-20160816;
        b=FKcP5WKFUi2WG3Q50PRW5cj8Lc9GhGLh49KYeXu/rkRStgfmcwqXepsm0UfytuQ4aH
         NLXTpWhFyARwtTxr33oxWtkHvTVskWdXDWQotA0kzDw2w6Kcb0c2Dpo1ZTn4q9Ke5xtf
         hHjX/JkG9WNS5gEi5gD02xiWYbQWssHBkXYxsI2wd44yd3phLSGxfR0Q+S0ftXA7OFNY
         ylW4cnSq7rdtyyfBqMu1CT61GFNNmXyI1blqPuVH/W/VFwXsdTjXnOLjfB45sRCGNuXI
         OjvklZZfokk7UdIokJ2CKK7NFvMDloDKP0x/+ulRzrilJurL/dvx+nbAmMs2OXIj9tx5
         fVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=vL/Nski8Z2QYlGBAETkNDiyDxBRoFMDyKBm5wV6e+n0=;
        b=zYv4EUeeKKkKXz5b+jsZvoiFUxuqNhIOPvkBriFQhf1c/5BxmdUDDGgFqJuWmAy3vU
         jA9Vx0QL0naYkaG9LPt/720g2IJN4yfOr+WJDkv61cCKHbFan7K5gLRSyJCwmV6RVpDt
         TSGvBqctgH7tCOhjx+PUFB4Kaur0Gb96AUszsCalFDJnyAXZ9OgUnjWObV6sa/BB8rEE
         +knZfB8e593W3w3lGjlIVIuYIwLG7EV9r32kRlR/sdKbuJ8M3o+bKY6sLJETbtDzqOe/
         OeH5oPVWyD0aGdCqZpp2Ma9bwtohsSV6d07dOdW3PDYTjRQsx+KnpeuNj4RnATlcwS8+
         Eflw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s184si6442840wmf.150.2019.04.08.07.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 07:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDVTq-0002hJ-61
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 10:42:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVTf-0002fw-N9
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDVTb-0003sy-Ax
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 10:42:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDVTa-0003rg-Qg; Mon, 08 Apr 2019 10:42:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17FA230198BD;
	Mon,  8 Apr 2019 14:42:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 029DE63F65;
	Mon,  8 Apr 2019 14:42:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8DFE71138648; Mon,  8 Apr 2019 16:42:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
	<20190204231815.29661-3-philmd@redhat.com>
Date: Mon, 08 Apr 2019 16:42:12 +0200
In-Reply-To: <20190204231815.29661-3-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 5 Feb 2019 00:18:06
	+0100")
Message-ID: <87k1g4o8xn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 08 Apr 2019 14:42:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 02/11] hw: Remove unused
 'hw/devices.h' include
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Rob Herring <robh@kernel.org>, qemu-trivial@nongnu.org,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TOc0+UduxwVg

Suggest to say "hw: Remove unused 'hw/devices.h' inclusions" or 'hw:
Remove unused #include "hw/devices.h"'.
