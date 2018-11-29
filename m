Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2840841wrt;
        Thu, 29 Nov 2018 13:33:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UpwPIyL/EAjtTwHBYPj+amj1fqBilCZ4kbzMYYUn6rEDUHvWcXs0L0J0JE+0lPTZ2VuD9V
X-Received: by 2002:a25:7c41:: with SMTP id x62-v6mr3165349ybc.72.1543527187653;
        Thu, 29 Nov 2018 13:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543527187; cv=none;
        d=google.com; s=arc-20160816;
        b=pBwOsdFxgqjnPlOAs30zQ2VZRi1dcvFDd9MoZL3DQOzYCpmPM9LjGkEBu71o6/ftZ4
         2QxHRTbFYauvXl+HCOQ2xZ6M0bDd3zVZOASTBKAnE9xIVObcsMhmyHJmd2Z/cPCRKOFn
         vF8ytDAqpyqbfzjYert+LIkgUP7H4l8eNgNin+/T0VxnBjYOnlKbqgCeqJwCFKIzHjnP
         OwC2rgNFqFFRDfvQxnahclVfgcuHCi7xPga9G+ERGs+njc/SIvqzj7VnxyYInjkuhlrj
         pgQVdslQtuFL3XaWNQFsLspCsdDaktPx4toYuhXcnoYpA2eO9Ipkv6myQUw3pJNvtTBX
         itbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=7kbI34/pm06gIbVCTUH4yWcRzjYv3+V7rbx6lMZ6URk=;
        b=q024ThWQKn/vYQYlTEjW/dL/PStzGQqRxR+CKz3JEe8yrOvxtm3D8cjXjNWk1eEdUY
         XYj5sJgS1cni/AhbxO6h8fWKkYuGO2QN6ZWDGJbnFoQLpkV5hQY+3zyH43TGZiME6JmA
         XrpOb7DyWqLtWrtFNqB7MIRiYBikR7HaneHi7X4W4YmLoWEaql3gnvy3uJ9MT8JVfcBE
         7KaaE5esYqBDP5t77CZPy98gKaEcaODXS0ByyZYxBIs3hbAEMLHIgdqrBo9jr3MBSn3Z
         JzbmVqnLYUZsv3919JohbECp2HGwWlf4NsjO7ynaGmvv4oG/iYni/3v4or4Eb7h57Oi7
         bEtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u5paK5gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x190-v6si1995615ybg.252.2018.11.29.13.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 13:33:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u5paK5gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSTvm-00021I-V0
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 16:33:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSTvY-0001zI-UA
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 16:32:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSTvX-0006vL-Hg
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 16:32:52 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36804)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gSTvT-0006rp-TO; Thu, 29 Nov 2018 16:32:48 -0500
Received: by mail-wm1-x343.google.com with SMTP id a18so3739412wmj.1;
	Thu, 29 Nov 2018 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7kbI34/pm06gIbVCTUH4yWcRzjYv3+V7rbx6lMZ6URk=;
	b=u5paK5gnMQaoeoFvB/A+/r/ZcNzaASt8GJK/yQvuNoLcC5bJbDOZtXC+dHYgzDF6Qo
	sFweJgxDe3XRkEmlyooadD5gY2J300dNKv9sd2m3lqXBEK/USVhpdQcpc9gBUHp958xt
	CHBITBpz99qqrcEuC5No/wHbm+dpR4RmgTTk/BX6DtiJtIoisQJBkz99aQFxdcA+vKeH
	Hl/quH4LsUAlYRvZRH6wuOlKYbeJPHeWVuDFwR3AdO/jxQLhcjwIFDmYo1ubTvRalpdX
	fR1f0AQYL1QRFaZEASdxdu4bDou9zyn48e5/iOiEq751I6QNy+7kiybYgiWUsrLswpkO
	KuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7kbI34/pm06gIbVCTUH4yWcRzjYv3+V7rbx6lMZ6URk=;
	b=h4ZgH890Og4F4dKWk+2KWOwkOrg7z+qM4D0Rdw4FRTAzMjQ4hBDMVfOQeiY3skUtRi
	kSvbPUibhEQZdx9D2kyejgB5Ta+JRjOkzFVBniyEhMQrncznHfXgzy+dHbfNPd5xvJ+Z
	LlbChP2eZeAZgoM+7pO9OuS06NxDKlY5XBB0qglFSg+khsTAOrF7I0x22MLgdeZB65r8
	wqFl+VrHVUqbraVBmkMGnIbnbxPpB8KqC77PUAKpcmGmQPUwm3nG9w5CT1l1qsDF0kL/
	PPiJb2ley4eEwecWQyQ+UrU4NjOTUUbWA36Hd8orOqBdyT3akrZmQEkbSHQbnDddu9CN
	Jogw==
X-Gm-Message-State: AA+aEWas7G1zvq89e9121L09Fixf65uW+27aB3QF2oqV7/kSUWrIciOY
	UvoUOZlMqYPb1f6mSYzG/pqQoL1HqXw9qoYqHEA=
X-Received: by 2002:a1c:c008:: with SMTP id q8mr2865269wmf.99.1543527166508;
	Thu, 29 Nov 2018 13:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181129160934.GM18284@habkost.net>
In-Reply-To: <20181129160934.GM18284@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Nov 2018 01:32:34 +0400
Message-ID: <CAJ+F1CKGsgxEbKS+FSgv0VNO2OqiG9cv8hpDfNV8_raZ=LP37A@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v4 16/28] hw: apply
 machine compat properties without touching globals
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
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQPS9DsGDpLm

Hi

On Thu, Nov 29, 2018 at 8:11 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Similarly to accel properties, move compat properties out of globals
> > registration, and apply the machine compat properties during
> > device_post_init().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> [...]
> > @@ -191,7 +190,7 @@ struct MachineClass {
> >      const char *default_machine_opts;
> >      const char *default_boot_order;
> >      const char *default_display;
> > -    GArray *compat_props;
> > +    GPtrArray *compat_props;
>
> What are the advantages/disadvantages of GArray vs GPtrArray vs
> GList here?  Why did you decide to change this from GArray to
> GPtrArray in v4?

GList would be less efficient than an array (extra pointer, memory
allocations/fragmentation/cache etc).

GPtrArray is similar to GArray, it is just specialized for storing void*.



--=20
Marc-Andr=C3=A9 Lureau
