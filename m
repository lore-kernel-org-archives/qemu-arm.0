Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp462101wrt;
        Wed, 16 Jan 2019 03:35:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN68sMxduOS2oUnR+6Crex8GO+YqnFn8nlkL3XQN343EqwU6tqggB7ilekC18CYaV8+Qy9Op
X-Received: by 2002:a1c:48d:: with SMTP id 135mr7057953wme.1.1547638520012;
        Wed, 16 Jan 2019 03:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547638520; cv=none;
        d=google.com; s=arc-20160816;
        b=HhTALB9f4XsQrp3wM93XyAY/I8/R5hmL9uNXTfqDNSfsWDo9op7cT0FSSw+iMI62L+
         OOaKAn5ueiJ8MiILXS5pOoLh21h9bkL7f0myvdcGG1ZNX+yFAWHtVJ6I31JhAwviwqYt
         Dl55BvrYDF7A4VYLAjvyt4sqlIC9h6k2VDz7l2cIBbJ3mX+uFtkBiMRfOlQQr1SnHfgR
         vuUDagxEt8IkK3AGZ+68ME+V5b8tZRw+g8yqN5512jA10uBb97v7zkW/q7LLhySWyO4v
         LMG7Hf+ErETsxnRKGw0p2oLRk6ihaoolpripdUtMLbf0/GK5zicEqbCO3i2RnmkaVZrS
         aeSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=kmOsqmJ4ZsC1UN7QxzuL+OPOc797pfqYlwaXSiNscXM=;
        b=JgjPM7uS/TqG2hkmOGXyNl20GZ37i9O8WoQNcQ2z7DQDIXp5XmWMP32Sn5vo/eF/87
         Wqes3v3aGndCsBD+DP4AzoSuXzsvJOcVGVg65ulukHdKAsMkk3xnW9UB2xtIvlfS49Bf
         pe9pn1QlzaqvGeBkGJ52G2jdPHyMVBhcvtYBJZKM+SLdRDkz4egBgTKKSfzcYK+37n/o
         ggaMRsxK/P5MEWeg2z1Aa++Dv4mQ/NumBy1/CnKu/C1CqlfInONHhlhwSWU5KO57BoeV
         5ARxrSnjmukjEM9AXnTtcfAaoypUyIb9xShg+7UzEKLReXxacItpl9pOb9vnVSXbe26c
         033Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f196si23673388wme.198.2019.01.16.03.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 03:35:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjjTW-0004Yv-AE
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 06:35:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gjjTO-0004YX-H6
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 06:35:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gjjTN-0003Fd-DD
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 06:35:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gjjTN-0002y1-4K; Wed, 16 Jan 2019 06:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 121F8C057E00;
	Wed, 16 Jan 2019 11:35:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
	[10.36.117.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CCAF5D978;
	Wed, 16 Jan 2019 11:34:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2940416E03; Wed, 16 Jan 2019 12:34:55 +0100 (CET)
Date: Wed, 16 Jan 2019 12:34:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190116113455.dyl6uctl4dpaqh6v@sirius.home.kraxel.org>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
	<87sgxtatod.fsf@dusky.pond.sub.org>
	<4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 16 Jan 2019 11:35:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pFwj2lhXZUxo

  Hi,

> typedefs.h is useful to avoid rebuilding the world too often if a type
> is used many times as a pointer, but rarely as a struct and rarely has
> functions called on its instances.

Related:  Can also be used to keep struct content private.  struct
QemuConsole for example is private to ui/console.c, but pointers to
QemuConsole are passed around alot in ui/* and hw/display/* code.

cheers,
  Gerd

