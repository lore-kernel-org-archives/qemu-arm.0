Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3398281wrg;
        Fri, 24 May 2019 12:10:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOrh/swWhS/ygQd5U07rjUgjtSBv8eL/SM3zyzyEo195F/nqNTxwLR/dS8tYyLWtE4tNfy
X-Received: by 2002:a67:3052:: with SMTP id w79mr35231824vsw.68.1558725058590;
        Fri, 24 May 2019 12:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558725058; cv=none;
        d=google.com; s=arc-20160816;
        b=lEn11Gk6O9+NasAoQr+yP+ZjJ0EpoUpnsasolOJ2jw+MmX4Zbauv3KLA/OaYVRNr2v
         MeuufQy9iHwFODgsbVsLr5Rp2oxbm1lHd/+0dbxvZMXIEP4kdOtlqY6e8lTJ+iiGoH9h
         3FqdpyyCT1Uzujb7yPuR1XJzQVN/FslqtCFnr0qnw+JU9VgRYEGA59BIt4cZXg6ZuF/F
         fmGJk5YfDiOjQDpaCZVsLUe4Be1dEMw9Lfo6MFrC0ZvbNYB8dC8+C20Z15JXC0andno8
         RZ/U+9PzU2UFjkdPhviE6phg8GFXfTW5fST15TBSUInvJiZjYi8wDO/ALb3Z20AsOm/O
         6vFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZxzxsghaF78ottCQkUiFFqNDZLndqdeoXesZmyCr4Zw=;
        b=RX0KAvp0ZZHkQtXkg4F9J6iOWyeYN4KqH5DZ4ViO6m2OHhCp0CiTta5nRBXTItKtn7
         erh6AnH2PvJ8dm5NCM3W+JkPEPqw+num3TNxJqA3RkyaaAFMGlmgtzJ1Ew+zf2X2lOde
         yPjykssmJJ63gsFXeTNjNbb/Ks/BlEH08frFEzFaC3Yoot14cru9/bZX0+a9u8qe1VKV
         2nioqaorE4CvF4iPUUyoM1IqTT+x0cDIKan7jfXQGXrQWZUNEmsZgmd/LUE7ezXf63Jj
         RPH96kXIhbqsyvkF/Ae5JrBR0K9NABqZcD5V1rg6TWB5R1P22YH8uNWU0hx877rUyEbZ
         MhRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si1166097ual.124.2019.05.24.12.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 12:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUFak-00088y-39
	for alex.bennee@linaro.org; Fri, 24 May 2019 15:10:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFZt-0007bs-SW
	for qemu-arm@nongnu.org; Fri, 24 May 2019 15:10:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hUFZt-0004iE-11
	for qemu-arm@nongnu.org; Fri, 24 May 2019 15:10:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hUFZs-0004i0-Q8; Fri, 24 May 2019 15:10:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0E4A4E92A;
	Fri, 24 May 2019 19:09:58 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8343736FB;
	Fri, 24 May 2019 19:09:54 +0000 (UTC)
Date: Fri, 24 May 2019 16:09:52 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20190524190952.GL10764@habkost.net>
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
	<270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
	<6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
	<98d1e57f-c033-fdb4-51bd-4a6fc2223d58@redhat.com>
	<CAFEAcA-eVECkPpxnvDtX3v6BFMSVCF4SU87r51PdG=E=hCYLfA@mail.gmail.com>
	<c2597233-e1e3-6bed-e992-ec8ea250cedd@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <c2597233-e1e3-6bed-e992-ec8ea250cedd@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 24 May 2019 19:10:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mYtwkg5thDk+

On Thu, May 23, 2019 at 03:03:11PM +0200, C=E9dric Le Goater wrote:
> On 5/23/19 2:52 PM, Peter Maydell wrote:
> > On Mon, 20 May 2019 at 17:32, Philippe Mathieu-Daud=E9 <philmd@redhat=
.com> wrote:
> >>
> >> On 5/20/19 3:32 PM, C=E9dric Le Goater wrote:
> >>>> Peter,
> >>>>
> >>>> do you want me to resend with only the two first patches and inclu=
de
> >>>> Joel's in the same series ? I would leave out the part Philippe is
> >>>> covering in his object_initialize_child() patchset.
> >>>
> >>> Nope, we can not do that, conflicts arise. I suppose the easier is =
wait
> >>> for Philippe's patchset to be merged and then rebase.
> >>
> >> Eduardo said he'll send a pull request during the week.
> >=20
> > I am now completely lost about the status of these patches,
> > so I'm just dropping this series from my to-review queue.
>=20
> yes. It's ok.
>=20
> > Please send a fresh patchset once any dependencies have
> > got into master.
>=20
> I plan to send a larger one once Eduardo's patchset is merged.

I've just submitted a pull request including the
object_initialize_child() patches from Philippe:
  [PULL 00/17] Machine Core queue, 2019-05-24

Sorry for the delay.

--=20
Eduardo
