Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2872415wri;
        Mon, 28 Oct 2019 04:10:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2HCGak68IaBasB9LaeVAOUVkMv20g4UQT+D+gkvF0RIfoyATqoFTdlWDs3v5l0vimlSES
X-Received: by 2002:ae9:c20d:: with SMTP id j13mr14432740qkg.461.1572261031175;
        Mon, 28 Oct 2019 04:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572261031; cv=none;
        d=google.com; s=arc-20160816;
        b=r6AS/kbFLpeZyvjv6z1+r+beijV+mmixe9L7wi9XWeRnrwQ5Vf0jTPd+pHBF7aAQ+V
         /jOW9NvR3JhucUvr7ytrOMLEZRvSIhPurVndOa5uLHuJVE6a83prCkymn0ADto74lvmC
         UtIEbuyJ6IJoVnkyb43bLJLcflSWkhEXjqIjrcb57esf6AG/IOJGM1/EQhOHtLVXE6pg
         oKd65j3EpC6XmV0XTRvRfcDxYdioAOdHvLkTlWDT/3rGgfjbkLAdGTa1tkHWr6cV9Yv/
         t8Vz+CK73Xq9JF6fs4tkZ7FLPa8Av4nlT/iVQFGVhdpqypqoydexx/KMQFxNws6FZPRm
         b4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:thread-index:thread-topic:mime-version
         :subject:references:in-reply-to:message-id:cc:to:from:date
         :dkim-signature;
        bh=zohqijfxF5D9YM71qCzB9euIglsluQox3t0/XjbXgTE=;
        b=fQ7fF9P+vJx0AQ3ZG3u3lObRwV6VYJnmQtJwFQm+yCdoJvIxYlvBggmJRqmgqRsNiX
         mqgl9BDUlwfF+QLLI0YSIXNRXC96p8Ta4B+p7rBO1NrzNG26DGSu32Fdn828/BWVIMQc
         YlylChAXYqF4nfpHAf3/yGMDLkmaZhbFy/q28KjyzeTxIHkevkz8ibXms60vJLrI2fsO
         HJJ8XtxCYbzRBmQHdOOCDgi2SnNsurzoV7d6U5yZM0CkC4gJ+YgmeUcSWkqPYZMRFALS
         7pDrhk5cuQX+qd718ZzvY6hmG+pe41NDV4ZiQTOo0NHovpmsrd5EcaTYAywqKsEFa4Ry
         Ka3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fDe/AnFp";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id i7si2700388qtm.394.2019.10.28.04.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 04:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fDe/AnFp";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572261030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zohqijfxF5D9YM71qCzB9euIglsluQox3t0/XjbXgTE=;
	b=fDe/AnFp3yp1FUYOO77yf4QVD18w5N9cZBqq5r2vlkyk0IRcVj1/ljV76CTwGCQXIq7JPT
	5AHnlnvtfMhuYzGEBfISQ78+Xqd3HSYmaUic/aGTI20MS3Pl5nX9Q5ZPNmSgL4QRyV7K5y
	9pNM2uuRbmOLlDg1fNnTf/LjDkZMJxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-L_tPP8M3NpqZxkRUTSAoGg-1; Mon, 28 Oct 2019 07:10:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC76A107AD28;
	Mon, 28 Oct 2019 11:10:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFF4C5DA5B;
	Mon, 28 Oct 2019 11:10:27 +0000 (UTC)
Received: from zmail22.collab.prod.int.phx2.redhat.com (zmail22.collab.prod.int.phx2.redhat.com [10.5.83.26])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C8DE18089DC;
	Mon, 28 Oct 2019 11:10:27 +0000 (UTC)
Date: Mon, 28 Oct 2019 07:10:27 -0400 (EDT)
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: m mizuma <m.mizuma@jp.fujitsu.com>, 
	Beata Michalska <beata.michalska@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, 
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Igor Mammedov <imammedo@redhat.com>, 
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Message-ID: <557725864.14167224.1572261027082.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA9ZdrAgMhdfUxz0OJnM-dF9XGwR-+FeqnyJAsrntGgL_A@mail.gmail.com>
References: <20191024121808.9612-1-drjones@redhat.com> <CAFEAcA9ehcuktCTGR0xpTvZegUkr99H62F_fiT7RY_L_dqgN4g@mail.gmail.com> <CAFEAcA981jAU6F9RRWBuzg+_5JDrd-ip-L_awtzdZFqKmewMvA@mail.gmail.com> <20191025135159.44siz7g3szpz23og@kamzik.brq.redhat.com> <CAFEAcA9ZdrAgMhdfUxz0OJnM-dF9XGwR-+FeqnyJAsrntGgL_A@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] target/arm/kvm: enable SVE in guests
MIME-Version: 1.0
X-Originating-IP: [10.33.36.124, 10.4.196.23, 10.5.101.130, 10.4.195.29]
Thread-Topic: target/arm/kvm: enable SVE in guests
Thread-Index: 6FyxgKxkmPsj++mnzc7OD2PU83owkg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: L_tPP8M3NpqZxkRUTSAoGg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: achFPVv0DBwU


Apologies if this mail is messed up. I'm having trouble with a hotel's netw=
ork and am forced to use a webui.

----- Original Message -----
> On Fri, 25 Oct 2019 at 14:52, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Fri, Oct 25, 2019 at 01:06:26PM +0100, Peter Maydell wrote:
> > > Fails 'make check' on my aarch32-compile-in-chroot-on-aarch64
> > > machine:
> >
> > Are there easy-to-follow instructions for setting this environment up
> > somewhere?
>=20
> It's an ancient setup, so not really. But it's just an
> Ubuntu 32-bit chroot inside an Ubuntu 64-bit host. I use
> schroot to manage it.
>=20
>=20
>=20
> > I guess the problem is how we're determining if KVM is available, which
> > is like this
> >
> > int main(int argc, char **argv)
> > {
> >     bool kvm_available =3D false;
> >
> >     if (!access("/dev/kvm",  R_OK | W_OK)) {
> > #if defined(HOST_AARCH64)
> >         kvm_available =3D g_str_equal(qtest_get_arch(), "aarch64");
> > #elif defined(HOST_ARM)
> >         kvm_available =3D g_str_equal(qtest_get_arch(), "arm");
> > #endif
> >     }
>=20
> > So we need /dev/kvm and the QEMU binary arch type (qemu-system-arm in
> > this case) needs to match the host arch type. The problem is that
> > HOST_<type> doesn't imply anything about the actual host arch type.
> > <type> comes from the configure $ARCH variable, which for 'arm'
> > comes from the $cpu variable, which for 'arm' comes from whether or
> > not the compiler defines __arm__, and cross compilers certainly do.
> > I guess we'd have the same problem in an aarch32-compile-in-chroot-on-
> > <any-other-type> environment, if a cross compiler is used for the
> > compiling. I should change the KVM available check to something that
> > uses the actual host arch type. I assume the following works, but
> > I don't know if I'm allowed to use uname() in these tests, and, if
> > not, then I don't know what the right way to get the actual host
> > type is.
>=20
> This all feels like it's trying to do the wrong thing, ie
> replicate the logic within QEMU that decides whether to use
> KVM or not. Some possible other approaches:
>=20
>  * If you want to know whether you can run the qemu binary
>    with -accel kvm, then just try that and see if it succeeds.

That's what's happening here, but the failure happens in qtest_init(), so
there's no way to avoid the assert.

>  * Or use '-accel kvm:tcg' and make the test work so that it
>    will pass for both KVM and TCG

For the KVM tests, I'd prefer we specifically test the 'host' cpu type,
which requires we specifically test with KVM. That said, we can use
the fallback along with an additional query to make sure 'host' is
ok to use.

>  * Or use QMP to query what accelerators are available, assuming
>    there's a QMP command for that

Looks like we can check for kvm with query-kvm.=20

I'll rework patch 2/9 using the fallback and kvm query to ensure
kvm can be used. I can even add a test or two that ensure 'host'
is ok to use.

Thanks,
drew
