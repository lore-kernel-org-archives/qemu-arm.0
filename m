Received: by 10.25.0.6 with SMTP id 6csp1897200lfa;
        Tue, 30 May 2017 09:30:39 -0700 (PDT)
X-Received: by 10.237.53.23 with SMTP id a23mr23710410qte.171.1496161839768;
        Tue, 30 May 2017 09:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496161839; cv=none;
        d=google.com; s=arc-20160816;
        b=PWtnFcGTLlBINek4fiurDOOPuDrAqWu8Qd7xFfKBux81xGu/WOFPpbcPB8Qd6112qY
         F0+qR2V690ZOoP6uU6ZcxVKGRaUSdEfsxznlT1BxQLUP+QS/m1ayKFKLs0JdVhu8zYx5
         BT/uERdd/xa8rMnxK6gLaMXYWyOIzTDJebucODGRgLq3DU56196fpjTk+EBQdQdXawX4
         LJNd2FXAhzvqMDEm42b9pWC00SwGr+Pb9xVH25/483PJZnFOPizHRlpZBD4+4UP9kW4g
         823/vq08KR65HmCpE2o9luNekOGir4Op1PxrlyoCOJtlRRdZ+2atz/ttI6ZwKfcyinFI
         y7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=bmjeIP6rdl9qDfik5/P5nYSpgXQRTif/Hy4Kitax9aU=;
        b=OjdNMelJEk2WENIR/ddN49tVMfOqwwuMtPVJTdWHBCKOqhSnYJtAfx4OWBv/4+Z7fg
         OaEasxxFWTkDtoF/vte8nU/9V9kijHMpwqceEABdLqkVhgEBgAZbs0S/cG5w+h+NbqK2
         mLqZE7Akxgjt4XcQbUC0wJOytjWtKahZp6ozwX/TYCc4SrN3+dK0qvnDss2ofddF6e/x
         6sjB1UruaVjTEB8Glau1htzBhoB3i+EEL5v6ag5nYh8q/fPdp79EEO/narutnfRMp1XY
         h1HTDxBqO9N1EH7S7TJ8IMqw8+zOgM8GFzHqKFF0krUwT8nomiDpiVEmUeiXmtBCJkfy
         vsSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t186si5444420qke.128.2017.05.30.09.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFk2Z-0002wr-87
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:30:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dFk2S-0002vq-BA
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dFk2R-0007TA-FG
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:30:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dFk2R-0007Sd-5l; Tue, 30 May 2017 12:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F99F448D9B;
	Tue, 30 May 2017 16:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0F99F448D9B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0F99F448D9B
Received: from [10.10.120.133] (ovpn-120-133.rdu2.redhat.com [10.10.120.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C18DC453F;
	Tue, 30 May 2017 16:30:28 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-6-git-send-email-imammedo@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <554eca2d-3c94-c341-299f-d71bcb020edd@redhat.com>
Date: Tue, 30 May 2017 11:30:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496161442-96665-6-git-send-email-imammedo@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5XKsjjJH2eTvB5AmFE9sCb9a0qj2cIPiH"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 30 May 2017 16:30:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 5/7] numa: move numa_node
 from CPUState into target specific classes
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3qOe0HVhueNm

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5XKsjjJH2eTvB5AmFE9sCb9a0qj2cIPiH
Content-Type: multipart/mixed; boundary="GOv6O35PmkFRFeQMG8wVS1jSo8RqfF8gF";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Message-ID: <554eca2d-3c94-c341-299f-d71bcb020edd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 5/7] numa: move numa_node from CPUState
 into target specific classes
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
 <1496161442-96665-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1496161442-96665-6-git-send-email-imammedo@redhat.com>

--GOv6O35PmkFRFeQMG8wVS1jSo8RqfF8gF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/30/2017 11:24 AM, Igor Mammedov wrote:
> Move vcpu's assocciated numa_node field out of generic CPUState

s/assocciated/associated/

> into inherited classes that actually care about cpu<->numa mapping,
> i.e: ARMCPU, PowerPCCPU, X86CPU.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

> +++ b/target/arm/cpu.h
> @@ -703,6 +703,8 @@ struct ARMCPU {
> =20
>      ARMELChangeHook *el_change_hook;
>      void *el_change_hook_opaque;
> +
> +    int32_t node_id; /* NUMA node this CPU is belonging to */

s/is belonging/belongs/  (multiple places in the patch)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--GOv6O35PmkFRFeQMG8wVS1jSo8RqfF8gF--

--5XKsjjJH2eTvB5AmFE9sCb9a0qj2cIPiH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZLZ4kAAoJEKeha0olJ0NquP4IAJCIOJFqVyzigiV02y9vDoOv
aYjA73MiGNJBIvZfHclFtT0qIiwiYJM/CWvpIg25oZbzGbHpwp3rj+dY/cxIecjP
D3aQUj6zO1aUPE3ErX1v9got3LtywFb6wu9tJPEtT/1yx+BcawCwNhAOrciA/C2K
5E3F6wAhd2EEiHe1KBg7SyFaxipvuO4qBR6v0/3g3ttO+QeFZhwLU43WSyf3FmBv
5AP8E5fj7jJuUn86DRlpbpBbDYDWlZ6mzuFgGoJdEPnFtJGO6Yzuqe/c0K6qAit7
zRYqyb+W8QvNVym+yt9QPWlCjkPIdDLWasojYph6wrsTsUJCmA3FEmJo5flsx3M=
=AKeT
-----END PGP SIGNATURE-----

--5XKsjjJH2eTvB5AmFE9sCb9a0qj2cIPiH--
