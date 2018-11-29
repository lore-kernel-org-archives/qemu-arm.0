Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2519856wrt;
        Thu, 29 Nov 2018 08:09:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/US43ngZr+IBIifjIlRHx1laTbKiH6D2RWb2cEUwLgBucECp2sBhX4sRFVwaXH3S9zoeIeU
X-Received: by 2002:a5b:1c3:: with SMTP id f3-v6mr1903162ybp.267.1543507798424;
        Thu, 29 Nov 2018 08:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543507798; cv=none;
        d=google.com; s=arc-20160816;
        b=sTPczFnlPTI1bLyrynidH5hssZDr2Vy2H3Om77iBNVyqzWUvW+i6IHz1F7zlgU0UIN
         K4i4cn1oeUz3PGh5xmG+X+6RWkEuMVaDdyvIdrL4qIz6/VDPaZWX+tQmJSt0AcOJRYLy
         qlyBwYb3XYTafdx7kKJAfg7Ggk/rrf57gB+v9pL2+MUVCSQ/aaBiLLBzxGNY142CQtNw
         Qbx5xL6s5v1lP1ljfrm2iarrXEEt3Uj+RYWZqAVIZwPh7Ndd/h8LJXEnynaCUpx5mAZT
         dnoSeaLWYnVocztB1gJguOSVzbfd53Fzd6jcdrraWLquDsPzu94UPodyvjGyW2TN/lYU
         ADYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3OjSDZNb9bZloEVM8o2cl4go6CCm/A4Fk45ul2rHp6U=;
        b=K8LO3jGDHbj/Bz8Ty0eueu32id+YmF7kLLwUOMcORIcbTNQwCeKtxhyJLxiaojbMwV
         Yb2izmsWsMOad7BsdeUqi561LDSsL47shh42cGIJFTSuSA3emOotzbsU/OerKo1VKZIH
         C/b6ahjZHvRsepfOvwXa/XaOWlx6jCkOsJTL3Js+C7iDbSfKKskONsZVLwOx+UPZoCaL
         udkzavslbaaFMnn3ibh6uiqg80eb9fpqHfy8Q9X3QrPZ+G9ggZtVXHfpxMmDJiROxfcF
         +u9NFpMNy0/BcDZLeoHi2XghKzwUSMZ8UNTGYonEi8RPFaxLdaUwL6aWt4HHyAtIAy36
         j69w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13-v6si1362379ybq.295.2018.11.29.08.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSOt3-0005nJ-Tk
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:09:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSOsx-0005mJ-KC
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 11:09:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSOss-0007IW-6M
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 11:09:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gSOsr-0007Hf-W6; Thu, 29 Nov 2018 11:09:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21A8FC049586;
	Thu, 29 Nov 2018 16:09:45 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65EB4600C6;
	Thu, 29 Nov 2018 16:09:35 +0000 (UTC)
Date: Thu, 29 Nov 2018 14:09:34 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181129160934.GM18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181127092801.21777-17-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 29 Nov 2018 16:09:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v4 16/28] hw: apply machine compat
 properties without touching globals
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
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Virt" <qemu-arm@nongnu.org>,
	"open list:sPAPR" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: De9Cd2+eM2aq

On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lureau wrote:
> Similarly to accel properties, move compat properties out of globals
> registration, and apply the machine compat properties during
> device_post_init().
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> @@ -191,7 +190,7 @@ struct MachineClass {
>      const char *default_machine_opts;
>      const char *default_boot_order;
>      const char *default_display;
> -    GArray *compat_props;
> +    GPtrArray *compat_props;

What are the advantages/disadvantages of GArray vs GPtrArray vs
GList here?  Why did you decide to change this from GArray to
GPtrArray in v4?

--=20
Eduardo
