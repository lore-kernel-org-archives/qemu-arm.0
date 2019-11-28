Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp8025733lfc;
        Thu, 28 Nov 2019 12:39:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwaS1utwqmOs/HBaCt8/+hZ9uySTubKqQBVvApFkZNuLek9Dv/jkIeC+QdBwsLSEaKXr6d
X-Received: by 2002:a50:fc18:: with SMTP id i24mr40433835edr.41.1574973574474;
        Thu, 28 Nov 2019 12:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574973574; cv=none;
        d=google.com; s=arc-20160816;
        b=0GXeCJLVMFVZ4ByHXt2B6Lt+UNqYV91ot5y7JqVRhC6QerE4uRDWu47z6/Vgbx04jX
         hmEync0sE6HPCkqbe/y+M1O+LA0aorJMeY2zx9EBRG/YJgcwm+vMMnSeiAtiIhJsBAt5
         kedvRrc0pCyNhrPfIcSZkuZ3ow0rqyX5JaohiXVtTMowRZ19p5bXhof2NPKI2S8leZfq
         N9mjm1HQVslkuEFYwuYDXbIxfiboSsltv26dMR+BRbrf3wTof9+MhYaZRMMQNzH2sA2K
         WQBSKCVmQ1k176emgcCycvAVDufHD40j3jPM35ySAMn+/Ux6Tqrc3N887TTnXuyghGpE
         T/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=w/WXqlSKhe1dlq4dboKqKSvWLUhdzXcF5VWE+Eh2jbI=;
        b=b7UVBS1A2pWocCSxBQv//bNv1LaOjpFtWebKHqsiRS8CN4I7mUnA//xLvDoLRMr6zm
         txU4471rfy17pruo45lQbTZ0C0dIEePDtm1kB3Zuasxkc7F7RlV5yl3sQvaYqa41NcbC
         evsAsY9SJmzxkUVJO+aoxnrDKRqdTHEWH4wwZAyAdk83bLuRDWlj28l0MgmeQAzN1TnP
         g8/eajNQVvGeUl7lHWaYbcmZDcqOQGbWUOWkzuaG/KkV8pAveVeyLXtC/mSag4IZwDj0
         uPl2JB0MGpw3kb1dKvh+RkhZyXTL+nPd0+G62m+FfQFxEF6wSg48+LOa0+uq1cMVYbUm
         +TjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RvfLpEdr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y26si3713244edt.22.2019.11.28.12.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 12:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RvfLpEdr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaQZX-0001a5-HW
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 15:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iaQYb-0001Q3-Rn
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 15:38:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iaQYV-0006uc-0J
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 15:38:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25093
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iaQYU-0006l4-2G
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 15:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574973502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w/WXqlSKhe1dlq4dboKqKSvWLUhdzXcF5VWE+Eh2jbI=;
 b=RvfLpEdrtC6f3BhkjL6BQlrV/Jq5S1uLOllCxc5ixHwDd3p06bhGF+UTG9PZackDC9c8Ct
 mO6feEK+3qMQ7qriDQkXQj5rlZJSF70ivro3LCe7fMRXBDuHySVkNU88VlviCAdi4GX4To
 UrN4FD5NTjkWK+wvyLe2D4rHwzki3y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-AtKd-sOGOBa5c19mp4i1DQ-1; Thu, 28 Nov 2019 15:38:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45D110054E3;
 Thu, 28 Nov 2019 20:38:16 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50822600C8;
 Thu, 28 Nov 2019 20:38:13 +0000 (UTC)
Date: Thu, 28 Nov 2019 17:38:11 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.0
Message-ID: <20191128203811.GD14595@habkost.net>
References: <20191112104811.30323-1-cohuck@redhat.com>
 <20191128183706.21b1fe0e.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191128183706.21b1fe0e.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: AtKd-sOGOBa5c19mp4i1DQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Qf4NiuO4y2i

On Thu, Nov 28, 2019 at 06:37:06PM +0100, Cornelia Huck wrote:
> On Tue, 12 Nov 2019 11:48:11 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
> >=20
> > For i440fx and q35, unversioned cpu models are still translated
> > to -v1; I'll leave changing this (if desired) to the respective
> > maintainers.
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >=20
> > also pushed out to https://github.com/cohuck/qemu machine-5.0
> >=20
> > x86 folks: if you want to change the cpu model versioning, I
> > can do it in this patch, or just do it on top yourselves
>=20
> So, do we have a final verdict yet (keep it at v1)?
>=20
> If yes, I'll queue this via the s390 tree, unless someone else beats me
> to it.

We won't change default_cpu_version in 5.0, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo

