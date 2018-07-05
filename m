Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1349266wrq;
        Thu, 5 Jul 2018 01:33:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcPgw4XuVsZOL3+fZaPftteRfcU8K474x8cGGYdLnoc95ssX6R6teGmC/sZ1NpWU13qYbxo
X-Received: by 2002:ac8:299c:: with SMTP id 28-v6mr4333879qts.37.1530779620050;
        Thu, 05 Jul 2018 01:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530779620; cv=none;
        d=google.com; s=arc-20160816;
        b=dUrcr45Xs4EQfsXQ05Ssf48zjoyrAoGPiRJJ8wGkuv4HHD4wVoeQzDdTkRDK/cqEKp
         mSUTS05hv+c+Xvse7YX9zl7qcofrZ7ttVAt4HGcJMVtnL2eDmT6/wrm4DJP7Rm6E24pd
         ogZsat5WIbipzhO2R3cH5fkIGeJJ8iLZZ9/HOOU2gzdf0veNb/DlWFStXGQb6u538zQF
         BiStmmBvAqnXVTnn/ndKaCUlAQpTKclexQl4zCRHVn52D489q2Wh51tXnsPFA3mEm3iy
         JpXhWK0l6Y9fzUFG+am1Yfx+iT7vgNULQ6u+6xrVaUI6K1VAfBuxvqkTOIy3EGYH/Cnh
         3GaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from:arc-authentication-results;
        bh=K7Bdc4zIWjMWWN7iPiE9YYCSs8qzCZGrbZJ2V2HR/2g=;
        b=S3nDKuNMK45DT8hFJs2Nx5CrD3n+Tr9g1BCfK70N5HKdv3uTqJZKOW8nNTpYg3Bijv
         2GVQwvcVKLebDT8ljiFax7jlRJqpwOm9B+532hu3RCfkIFHAvL5764sfVblU3WcstfUV
         sQl4ZhyB+qvLAB9U+mCxnYfBMN5FKiDCDQaJg/Sh0ERSIF+I3p7BRwevDKDhjj5DeKUp
         FO2zsQl3nrsmpJVyhV0mEVCEAEgdhEOHFK1OaQfAlUkHojkbqQ945xRUlaPfa3hc+B6P
         cBC9zSWFr/9qGAqP6/vb0XBhQ12Oqj9rbBN/3ntPXA+vctT7e6/EO1KFSip5qvH5bHEJ
         k4HA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g24-v6si1640054qtp.109.2018.07.05.01.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 01:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fazhr-0005q1-Iq
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 04:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fazhg-0005ph-I4
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 04:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fazhd-0005h1-Dx
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 04:33:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fazhd-0005dP-9d; Thu, 05 Jul 2018 04:33:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0537381A4EAA;
	Thu,  5 Jul 2018 08:33:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-19.ams2.redhat.com
	[10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F56F2156880;
	Thu,  5 Jul 2018 08:33:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6478A11385D6; Thu,  5 Jul 2018 10:33:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
Date: Thu, 05 Jul 2018 10:33:21 +0200
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Jul 2018 12:39:11
	-0300")
Message-ID: <87a7r6axpq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 05 Jul 2018 08:33:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 05 Jul 2018 08:33:24 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/8] Coccinelle cleanups
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org, "Michael S .
	Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjJ7C4RrW5Lm

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Nothing exciting here, patches created mechanically
> (common after soft freeze).

Cc: qemu-trivial
