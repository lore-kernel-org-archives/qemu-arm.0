Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3636418wrx;
        Mon, 4 Mar 2019 05:59:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGAjGMPpMsTZTn6ZAc1cLzXxtI41plLXU4Ib64Xsy+yRFuno7kH7Zq6pkOtZPoqEmQyvvo
X-Received: by 2002:a0d:d745:: with SMTP id z66mr14270945ywd.242.1551707972503;
        Mon, 04 Mar 2019 05:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551707972; cv=none;
        d=google.com; s=arc-20160816;
        b=HAcOqBuY85k37XNWO0xcsQaM5+habziop+yuLhg5hRkdhLVSIKYmw2igHGkOWT8W6S
         B1bUW5U3PIRBOAooKS3WgvMmdAl3iMK/GdC6RyVT3uMth3VRUYAPfiEOvh16UqYb3jmv
         /dmE50Pj98vqg8lbZcq4L3BYNeoLx5LEqDYc8iro2qjvB94mBdq8l4pzdkZJsfUNdITz
         XA6Hzta2qnGGCfK+a/VJxQkVx34g9uVvwGyxSJ2FsnBJ1tyAVLl+xObQUMPluUCCokAx
         m7zCyGOZQJBAQ/oMCfzyz5gvjYqxVU7WHwudIS/30/8vd1sCbkDRy4+FJF4D8x/SQg2+
         FHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=2Q+tPhMBWOiMLjpqPRANm4VpO3kY16OW861893DCRFI=;
        b=owOzVfLorTf7TerjSOfv6JUVG/hi1zBhcS5dBtmNVHVBTVAqxKfcWjZVi8aun9u9cf
         CkeDUqq97Tpi+/U6aSeaZS9S3Ad+xvBMQHAy5d9ZIWJ6zr+F4wPGu2cgv2+r6Cow6awJ
         v1vaeQHF2i0l1Lo9hysT9eLrGMlHBDJUhXEGtNHYusF7PmbWYvXiRO1PZ7J46m+B5uVJ
         Jq9XazeePpFaHG2dVW+neQg9lWuj5fwq72PgRAlvL6jR2GwHihZmL+3sQdUETeDJnY12
         UM0GpfbxBXf8Mc/LjH6azDbiPN/wRBUAcwSvMsa+PpflJv0mI7KPDr1EWIz02PFMdMzi
         /EtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si3471319ywa.231.2019.03.04.05.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 05:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0o7v-0001tc-UE
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 08:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0o7l-0001tA-IL
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0o7k-00007Z-Ba
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:59:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:19357)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0o7k-0008WC-52; Mon, 04 Mar 2019 08:59:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1ACC23082B41;
	Mon,  4 Mar 2019 13:59:19 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6240F2CFBA;
	Mon,  4 Mar 2019 13:59:12 +0000 (UTC)
Date: Mon, 4 Mar 2019 13:59:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190304135909.GL4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<15464582-e8a6-6654-7679-15d87c10af38@redhat.com>
	<20190304145510.57c73177@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190304145510.57c73177@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 04 Mar 2019 13:59:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel] [libvirt] [PATCH 1/2] numa:
 deprecate 'mem' parameter of '-numa node' option
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jllp18U8kIVv

On Mon, Mar 04, 2019 at 02:55:10PM +0100, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 09:11:19 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
> > On 01/03/2019 18.48, Daniel P. Berrang=C3=A9 wrote:
> > [...]
> > > So I think this patch has to be dropped & replaced with one that
> > > simply documents that memdev syntax is preferred. =20
> >=20
> > That's definitely not enough. I've had a couple of cases already wher=
e
> > we documented that certain options should not be used anymore, and
> > people simply ignored it (aka. if it ain't broken, don't do any chang=
e).
> > Then they just started to complain when I really tried to remove the
> > option after the deprecation period.
>=20
> > So Igor, if you can not officially deprecate these things here yet, y=
ou
> > should at least make sure that they can not be used with new machine
> > types anymore. Then, after a couple of years, when we feel sure that
> > there are only some few or no people left who still use it with the o=
ld
> > machine types, we can start to discuss the deprecation process again,=
 I
> > think.
> Is it acceptable to silently disable CLI options (even if they are brok=
en
> like in this case) for new machine types?
> I was under impression that it should go through deprecation first.

Yes, it must go through deprecation. I was saying we can't disable
the CLI options at all, until there is a way for libvirt to correctly
use the new options.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
