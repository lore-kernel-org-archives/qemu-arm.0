Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9520218wrx;
        Sat, 9 Mar 2019 06:11:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0UHpa+Utk26un5DCCEmh5J0qzP4pa1wrow8r263A2h4WEmHIkqenfpxU8PQe9c+Yw+ch3
X-Received: by 2002:a25:4b83:: with SMTP id y125mr10324202yba.503.1552140677821;
        Sat, 09 Mar 2019 06:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552140677; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0hJ/w8L1KDO+wPbfusP+JazvWIZbOIGw2WFVlsUeoCy+1llpqO1prrjtAR3dWlS56
         5RZepxuD9mUKoFguURnb+PyL2R8rzXJ/sdNRLZ6CapmuqB0Fvt4Pm48EKK3lwj6/ZmO8
         ceJ+0/RwrRjKGqh1DWy98Pl+10bVY2qRQ9WICN7622LYOcP3t4PvG5fZQMxG+ENDxa9u
         4aT9uK5TUZqtEMEH/qPksozevzjDISZh7jmh5EcpzUE2fdt+7mGT4ark2V4MPLmkW++Y
         xS0b+zo18Ntn/96or2di1cFwmu6jI/msH5rFA3Vf4PzjTIcIO9T17i+h4RF7gXotfCuF
         sEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=YavVNwyPJRa16Wd8iW3fWb7prIEQacY5Q4LlCjUSRkE=;
        b=F8Ia4lvJHQv/gQj7ylEafQpw9Hnm+kDqYRzgRv2X7CCJ2diE1UyZWGFaJ5m3QWplvN
         Tb4lGpk8zyLVhJNVY9GorGiX6Sj5K0W4yShgFnOot4M6ErUU/VSV3hVLoLP9PvrM9YmU
         xmJqREIwF35+0PMNRNYk6QYtxnHn2hMM8Ou4X9I3eRJUP4NRV04aOK5CZema4HEPFgnN
         gdV5L21obxHWL+aXYdmV5RG4C06zrscQ95ndI8d5zqqA0+2P3J1kuGG+aN3pqkmss98/
         O1653+enNJNXe3ZlQ5cM0BfBSqtq8P2Q0ztdkqGWjr5J86PZEKdbPu5Xg3Hux9LquuC9
         3JRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si264744ywb.40.2019.03.09.06.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 06:11:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2ch3-0005uE-9H
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 09:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2cfR-0005CI-Tw
	for qemu-devel@nongnu.org; Sat, 09 Mar 2019 09:09:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h2cfR-0003jh-7Y
	for qemu-devel@nongnu.org; Sat, 09 Mar 2019 09:09:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h2cfR-0003hP-1I; Sat, 09 Mar 2019 09:09:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2E1FC05D275;
	Sat,  9 Mar 2019 14:09:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0C41001DCB;
	Sat,  9 Mar 2019 14:09:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 294891138660; Sat,  9 Mar 2019 15:09:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-2-philmd@redhat.com>
Date: Sat, 09 Mar 2019 15:09:27 +0100
In-Reply-To: <20190308013222.12524-2-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 8 Mar 2019 02:32:05
	+0100")
Message-ID: <87d0n05eco.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 09 Mar 2019 14:09:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 01/18] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fpRRF/DSE0CQ

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since commit 578f3c7b0835 ("arm: add fw_cfg to "virt" board",
> 2014-12-22), the machvirt_init() unconditionally creates the
> fw_cfg object.  Later, commit c30e15658b1b ("smbios: implement
> smbios support for mach-virt", 2015-09-07) added a superfluous
> null-check on it.
> Remove this superfluous check.
>
> Fixes: c30e15658b1b

I'd use 'Fixes:' only for bug fixes.  This is a cleanup

> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>
