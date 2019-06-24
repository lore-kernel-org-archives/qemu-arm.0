Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3884196wrg;
        Mon, 24 Jun 2019 08:12:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvGiJQzsSk2VNwEi4TGVyZjvbPVGBVtSzX6XZHphpqmXUCX6XQron0VyrC7ErVt1mdl3MA
X-Received: by 2002:a50:ad01:: with SMTP id y1mr141389219edc.180.1561389177327;
        Mon, 24 Jun 2019 08:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561389177; cv=none;
        d=google.com; s=arc-20160816;
        b=yUBr7j4wjHEO82TqPQHmRdXd1V9Hv35SnJa/GoBiI0YYmbGcTSnI3eDk3XxnccWIUk
         GeBonEFnO4WxRbptsvw0e1pFH52FqrwrJC4sLAVY3/qKT9vi+rYf4TRB5QFI/xKnUCiy
         p1utFB9jSkLesBwD/K68aLwHwpbqlmrunM68LfPeXk4E7Ki6NLEk9RkDfo0m7826udhu
         +55ZuW6C9+pYL6IJEFPr2vLaER+1khQPr8U1QNgvVLm2Omt/d9op73Lukz1v24zyxj13
         jxthK4HaDXU1mumA0CWL0oyeeL5hevtNAYYxuSqueekbnKGuaYRt4SI2Iy/vtCdtYF+T
         kB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=dMtovvXz2Jy0PHi5fsAqN7zxodwmARics8yG70Dj9xI=;
        b=X6gaoNnOvXdxV//sILApICK2wLQeaSt4QDls/k8a4SjibjGdtKTshAopmpGVFXNCbt
         Vwfg6AZtccgGEo/4mbn1qie+FClNo7v6JweLxhTrNEycqYIV8d08udHoNTOa5bYgK2Vf
         SWcO4hiTKSMXfLKzuk0jt/cPw+6UhKY4xEiQLQF6dsAcu/QIaB86wliNeIEgfaWF4M1D
         zvfkqbztiE6xn+L929xW1LkSd1x+rhoW3dZWW+/O4C4f5bPN5Gmml3frCDfiz6BucLIO
         GkV5BKEVT3iX/iC0l5FTKsVoAKXtU1/YEGx8DCMBjLY5hzXnQmZrs1xTGZtYBcVZaEEM
         Ln1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si7028697ejf.196.2019.06.24.08.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 08:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfQeO-0000Cx-Ej
	for alex.bennee@linaro.org; Mon, 24 Jun 2019 11:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39139)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hfQdL-0007ER-Kh
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 11:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hfQdK-0006fU-9I
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 11:11:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1hfQdH-0006Vo-Ei; Mon, 24 Jun 2019 11:11:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1B4136EB97;
 Mon, 24 Jun 2019 15:11:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 779EC1001B04;
 Mon, 24 Jun 2019 15:11:40 +0000 (UTC)
Date: Mon, 24 Jun 2019 16:11:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190624151138.GJ17698@redhat.com>
References: <20190620122132.10075-1-philmd@redhat.com>
 <20190620122132.10075-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190620122132.10075-2-philmd@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 24 Jun 2019 15:11:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 1/3] hw/firmware: Add Edk2Crypto and
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WnCMOiD36zfJ

On Thu, Jun 20, 2019 at 02:21:30PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
>=20
> The edk2_add_host_crypto_policy() function loads crypto policies
> from the host, and register them as fw_cfg named file items.
> So far only the 'https' policy is supported.
>=20
> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
>=20
> Usage example:
>=20
> - via the command line:
>=20
>   $ qemu-system-x86_64 \
>       --object edk2_crypto,id=3Dhttps,\
>               ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
>               cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin
>=20
> - via QMP:
>=20
>   {
>     "execute": "object-add",
>     "arguments": {
>       "qom-type": "edk2_crypto",
>       "id": "https",
>       "props": {
>         "ciphers": "/etc/crypto-policies/back-ends/openssl.config",
>         "cacerts": "/etc/pki/ca-trust/extracted/edk2/cacerts.bin"
>       }
>     }
>   }

These commands / args create an object with ID "https" but you are
not telling anything to use this object, which makes me fear that
you have some code somewhere hardcoded to mandate an object with
an ID of "https".....


> +static void edk2_add_host_crypto_policy_https(FWCfgState *fw_cfg)
> +{
> +    Edk2Crypto *s;
> +
> +    s =3D edk2_crypto_by_policy_id("https", NULL);

....indeed you have hardcoded use of a particular object ID.

This is not good - choice of what strings to use for object IDs is someth=
ing
for the the management app - QEMU must not be dictating certain magic IDs=
.

There needs to be a command line arg somewhere to tell the firmware what
object ID provides the data.

Given that you're triggering load of this object from the machine type
initializer code, having an arg to the -machine option is a natural
choice.

ie something like this:

   $ qemu-system-x86_64 \
       --object edk2_crypto,id=3Dedkpolicy0,\
               ciphers=3D/etc/crypto-policies/back-ends/openssl.config,\
               cacerts=3D/etc/pki/ca-trust/extracted/edk2/cacerts.bin \
       --machine q35,edk2_crypto_policy=3Dedkpolicy0

I don't see a compelling reason to separate https policy out as an
explicit tunable, distinct from other, yet to be invented, needs for
crypto policy even if EDK2 itself is fine grained in this way.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
