Received: by 10.223.197.9 with SMTP id q9csp976210wrf;
        Fri, 29 Sep 2017 12:47:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC4HfZ6csx7N/V4Nbwry7/nXrklmcFjOocfV7EQdVZ7n7gvJ/+n7+0/ZghQiJwTJ4HgU7U+
X-Received: by 10.55.5.65 with SMTP id 62mr4671843qkf.164.1506714466207;
        Fri, 29 Sep 2017 12:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506714466; cv=none;
        d=google.com; s=arc-20160816;
        b=zX077XNh9YBhoae0B2eRkUnEilPPG8bbb7Weny1Ep9MhQF/+Ij8ORefkPmRTJtv/wZ
         e4d6creaRkpOJYocO2BqiJnFIzssd9oh23+hDZWPiaBiBy3lPEkmhtfD+jxMdE/GHXbe
         MSj3THHN/nP7BaHMHANtowCxJgsR2o6Mgj864yWY/wwYt5y0pbmGPAUcFfo819ge2T07
         SQEi6JeYOrEc5ChORnuYQl/6Co6LTawDzbqD8kDNKaaDmHVLi+WA6jqK6N0ihyarZNbe
         PYkDbPlIkZOuvIHEYYvZiPeo7i/Ac6cF8mu6+PcEhn0PtqJzX6VQq1NY1q3EjMbxCZmH
         4AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=y/YTdmx4U1L/CgmwTzd2kof4mfdsNiXCYIWa+azp78Q=;
        b=dBEohl155ygqjWg8OzqOUaURcDyFoqPZE1BWnDj1W9ug4VO7MLSEj2MmD9/q700o3L
         ocwOA0t25N1IIBEf/qEgfzAASgObwPKuosNoljJoPYiZq+zl5SlYVXC8Kk5ANDoP3SEo
         pEn1V0oJRbA5fd9bvVKtuVRuhkivaY6gj3XCB8OfOtGwDTeIiqV4nS29SxoOg7OrINH0
         6xqz6ylO8X+52dUjhFoSEL4hIh/TJKuop+aqY6NfJYMNlMn9XXn3p99MWXshjPba6k3J
         POTTKlgtk3dNQtgYJS17sbOHjN/YdiTEVQEMT9fTP6e0anH48RZi0Bn060InUAc6dnsA
         6+ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si4463420qtb.246.2017.09.29.12.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 12:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy1GB-0008NF-W7
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 15:47:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dy1G1-0008Lf-OW
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 15:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dy1Fx-0006U0-RT
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 15:47:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dy1Fx-0006Ts-L9; Fri, 29 Sep 2017 15:47:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B73CCEA3A0;
	Fri, 29 Sep 2017 19:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B73CCEA3A0
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-86.gru2.redhat.com [10.97.116.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8FC817B8F;
	Fri, 29 Sep 2017 19:47:18 +0000 (UTC)
Date: Fri, 29 Sep 2017 16:47:14 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20170929194714.GP21016@localhost.localdomain>
References: <20170917232842.14544-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170917232842.14544-1-f4bug@amsat.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 29 Sep 2017 19:47:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom/cpu: move cpu_model null
 check to cpu_class_by_name()
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: CLnSB1LBy0G0

On Sun, Sep 17, 2017 at 08:28:42PM -0300, Philippe Mathieu-Daud=E9 wrote:
> and clean every implementation.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

I'm queueing on machine-next.  Thanks!

--=20
Eduardo
