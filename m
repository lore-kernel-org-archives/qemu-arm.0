Received: by 10.25.0.6 with SMTP id 6csp608647lfa;
        Wed, 10 May 2017 21:54:31 -0700 (PDT)
X-Received: by 10.200.46.239 with SMTP id i44mr1903528qta.89.1494478471466;
        Wed, 10 May 2017 21:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494478471; cv=none;
        d=google.com; s=arc-20160816;
        b=D4FPmiAOKn2+sY9s6j3eI/O2eAHTzCXJLp2gCFMl/QjM+r/hrjYZ+t5SPwbBWE2Jhm
         HDiscFXBgiArCwh6VTtT3JuIr1El5jRI9h5ODxBglJc7q0pWExowIdpglt087pqRpwZp
         Bdse48Xu8u1EvZ9NWPuvv1Ap1bP5xm3+PvVTeEJ3RrK5h1ziKGNu/F28zVRtcC/7Q1Tk
         dZWGtd9GbTAENzBAxZ+21T18Go40OhV+GA9n3C1/DGO1Rg3mX3Oo4ZRZpnsMulzOD3IU
         Afq4TNxq1AQgkC+4TgtPf7IT4NP0r80NwoLzdz8ffyIErvc0pe6VC3f7H1N2UI67Oy0C
         uOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=lGVHmyrFrCWvafasw5Hee2yHUnz1K0bB993KlLfsqQ8=;
        b=EgHd0v6laTgFi1ropsjzMpAIRF7jkq+/R7AEp6wubulvKmX3LdUvnFIioKH8bmNhL5
         BtIBtlThFLEluv/KPoxuQB+wGPO/qsZnTOVJ82Mq/ZUi5djsTfnpzAH0bfgyqqHOeeMa
         5UjRrTXyajMZHQqfLPq6jPfj0LPlXw7VHp20Ed+yIkX8RNgMEsW1AQx/qzmzihyYxziF
         tdQ62JGEdTjHqf/ftMvcCYNge+nYH8lSxsJakweOTRVwciUUIZ+YbJ0XCNT+4U8ykOMR
         RDx2pPxMUdJl+ImPI8avh4dWwpMWp3uAUTvjjOdrRleEGmfksBs6NKLCr1+GzxAhfVLt
         0KIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l187si796504qkc.143.2017.05.10.21.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 21:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8g7S-0006zO-Ux
	for alex.bennee@linaro.org; Thu, 11 May 2017 00:54:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d8g7N-0006zC-BL
	for qemu-arm@nongnu.org; Thu, 11 May 2017 00:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d8g7K-0006ll-9A
	for qemu-arm@nongnu.org; Thu, 11 May 2017 00:54:25 -0400
Received: from ozlabs.org ([103.22.144.67]:45365)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d8g7J-0006i0-FW; Thu, 11 May 2017 00:54:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wNgkK2t7gz9s7q; Thu, 11 May 2017 14:54:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1494478457;
	bh=/Fs+LGNXw3IVMfp/mKjjYbGJCIsfXhFxmiYsZpgaPPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnkFfzbkSQJTFEXrzuzy8ibeh2dmowQIgarJYCjZoOzn3qTGXBuQjrmEIwm6jtsxY
	DiqpH7eNxRDXuZmvd+tVnrPbveskXp7cK1pYzeTdszPhjWat6gBz/UTqiZ8YwkPe57
	3/8Dy+gWcVHlDQAxWK9cufax4W9ntrISe5qJ6qsE=
Date: Thu, 11 May 2017 14:36:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170511043625.GG14408@umbus.fritz.box>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tvOENZuN7d6HfOWU"
Content-Disposition: inline
In-Reply-To: <1494415802-227633-2-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 01/18] numa: move source of default CPUs
 to NUMA node mapping into boards
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TrARe7Dr/M2W


--tvOENZuN7d6HfOWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2017 at 01:29:45PM +0200, Igor Mammedov wrote:
> Originally CPU threads were by default assigned in
> round-robin fashion. However it was causing issues in
> guest since CPU threads from the same socket/core could
> be placed on different NUMA nodes.
> Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
> fixed it by grouping threads within a socket on the same node
> introducing cpu_index_to_socket_id() callback and commit
> 20bb648d (spapr: Fix default NUMA node allocation for threads)
> reused callback to fix similar issues for SPAPR machine
> even though socket doesn't make much sense there.
>=20
> As result QEMU ended up having 3 default distribution rules
> used by 3 targets /virt-arm, spapr, pc/.
>=20
> In effort of moving NUMA mapping for CPUs into possible_cpus,
> generalize default mapping in numa.c by making boards decide
> on default mapping and let them explicitly tell generic
> numa code to which node a CPU thread belongs to by replacing
> cpu_index_to_socket_id() with @cpu_index_to_instance_props()
> which provides default node_id assigned by board to specified
> cpu_index.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

[snip]
> +static CpuInstanceProperties
> +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> +{
> +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(ms);
> +
> +    assert(cpu_index < possible_cpus->len);
> +    return possible_cpus->cpus[cpu_index].props;
> +}

Suggested follow up patch: Since this function is identical for x86
and ARM, we could have a "thread_granularity_cpu_index_to_props"
helper they could both reference.  M

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tvOENZuN7d6HfOWU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZE+pHAAoJEGw4ysog2bOSLPgQAIyJGzDhAyIkImQZUy98cPyI
V5qGylXIdfWRodb+qXDUpf0N9/pjGiU5W7EmURVEQSXOV4wbyZlxf5zR1wANx0Ik
GCJNh9VXE+pnEyv1cxj6aq4QT5xc/fM52AXe5Hu6yadsAmHrZ6mV/VuZa5eD8nXh
JJtnZWOFe1pRywdMmSYGXDR+Iom9u2MD16+qjo1o6RbdbBetW9A2ku4j7VpIYIuK
KJek1bKvOJQoMnCuasP9dtqxE4CZ6jf6/YZK3DVDYxOVJDe2JvLQAHYhKhaCV3LD
IxHrkIsEbH0FLfi9iEqbBJchu9QimZIQmXwGfYtU/JhhqcUNH9hKfSw09yYymi0G
wq7R1lhIqPQAT3bv8E4hBes8cnghRGchv8IHOpegxANT52ZWcZzWweyKHUT02MY8
y0zjR/u0WHIu/9IcR6vM+ONnFITICp0GlERAmijnku07OrHABvXF+E9tSUYxPuAT
x6Hc7pt892dU4ynACR/EuIzN8QDvvMJR3vxLx+ggkCz1O9b3j//9EAcm0+0M3iJC
ODV/MiXZDBJHEjCt1oHhhySaoPkJFKMEXs9jiw3d0+6+bgqsJVNgSNaqt7rLfoPm
qwNc9yQgYrjY/8iXWI0waplW0CrtfZmM2SVI19E2eG6ABgG/GJh0dyww/ZhZyIPK
8XWp/Ul6LL2k/YglM3rJ
=EJL6
-----END PGP SIGNATURE-----

--tvOENZuN7d6HfOWU--
