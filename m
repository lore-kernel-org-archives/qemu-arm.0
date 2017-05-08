Received: by 10.25.0.198 with SMTP id 189csp1237090lfa;
        Mon, 8 May 2017 00:53:56 -0700 (PDT)
X-Received: by 10.200.56.56 with SMTP id q53mr21024883qtb.36.1494230035964;
        Mon, 08 May 2017 00:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494230035; cv=none;
        d=google.com; s=arc-20160816;
        b=uZ7/8ucdBi1vH/DuG9AI9A6QRTNVnmhoAYyNGXuJKPw5L7QH/lN1za74tYnrKIpK98
         /Ay018wYxJlE/1vpL0502i2zWJFm9SDjXy7AoP40RSfQJuHFMDZEuYulYGFpEKbpwam7
         TqtKgQlmKFZO18jdaB5pPCWuKNIlK82pJqZs/yHPA51a5iFfdOMRkPzFSIp+t8EkJUfZ
         mUwguQC6G/5xMnwUS4xl7pAD/XfqW+DGQDqsmhudYgUuA9NdrZvdPlxGsFYKCg2/sxUG
         MqlbsZqevtjFplOXUI/z+kCsvc8z0ckJBAc/e5NW1Cv7rTVIHvOJf6f/ZIf1J1A3bRcS
         jfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=HRKhLFBqQp5YhnuIygs6XKnK6+WjO/k88LilLiroG8k=;
        b=ZUg+BWRx2M5+eCIcFW2J3I2x6BclxS5L8vFc7ONjXBaVqz9OshIYl8HcZ9w6+Kzh0k
         tcjvaf1QZFB3D+rW+2LUAOAzoZEUHPZdhW8mduxZIAua/60v0Z8y13055KNCf26FZfyk
         2xOfiWOLsfSqrWZXCJXcb//SMFtzsMlbb3Rs+IN7MhnIY2W8wCZ6iLzUdmdYayo/Vb5b
         4JHc1UWegQuzBVTWS+e0S4uVhn1sgox/xnL/a4x/8ZlhLUIOPwwqtgvKzOVAipAdTV7v
         vVng24K/IDBDKgPESW+9WpOrHTKywnh5XUJUzu3pMtvhi+hcJkxA6RaJUBa6Jgimy/JA
         Twpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o40si11863869qto.310.2017.05.08.00.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 00:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7dUR-0007ix-Gf
	for alex.bennee@linaro.org; Mon, 08 May 2017 03:53:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d7dUM-0007iZ-ES
	for qemu-arm@nongnu.org; Mon, 08 May 2017 03:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d7dUJ-0001Nj-9m
	for qemu-arm@nongnu.org; Mon, 08 May 2017 03:53:50 -0400
Received: from ozlabs.org ([103.22.144.67]:48427)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d7dUI-0001ME-KZ; Mon, 08 May 2017 03:53:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wLvrk2fPzz9s7y; Mon,  8 May 2017 17:53:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1494230022;
	bh=Rc08Moo+ameNSmDiPQwQz5zZTxGaeCILTK/QHS7OQTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRfaGiJ/k129jwbj+fGzZNn8yisHxlz3IF9rd44dXPBMK1lidqlFvY8ixZiXMwrxt
	vijar7bwpCv3lmiiyvrsAUtS/sgzilsOUTb8TeDgXMdbkXorUIDpTSpURa2uG63FNQ
	sM3xuxFw13VYTCK3WZOCfRzdNEU5kAxtcu7/x/vQ=
Date: Mon, 8 May 2017 16:35:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170508063534.GI25748@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-25-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Content-Disposition: inline
In-Reply-To: <1493816238-33120-25-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v2 24/24] tests: check -numa node,
 cpu=props_list usecase
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
X-TUID: IIV/mrJi8HNE


--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 02:57:18PM +0200, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  tests/numa-test.c | 151 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 151 insertions(+)
>=20
> diff --git a/tests/numa-test.c b/tests/numa-test.c
> index 2722687..c3475d6 100644
> --- a/tests/numa-test.c
> +++ b/tests/numa-test.c
> @@ -131,6 +131,144 @@ static void test_query_cpus(const void *data)
>      g_free(cli);
>  }
> =20
> +static void pc_numa_cpu(const void *data)
> +{
> +    char *cli;
> +    QDict *resp;
> +    QList *cpus;
> +    const QObject *e;
> +
> +    cli =3D make_cli(data, "-cpu pentium -smp 8,sockets=3D2,cores=3D2,th=
reads=3D2 "
> +        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
> +        "-numa cpu,node-id=3D1,socket-id=3D0 "
> +        "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D0 "
> +        "-numa cpu,node-id=3D0,socket-id=3D1,core-id=3D1,thread-id=3D0 "
> +        "-numa cpu,node-id=3D1,socket-id=3D1,core-id=3D1,thread-id=3D1");
> +    qtest_start(cli);
> +    cpus =3D get_cpus(&resp);
> +    g_assert(cpus);
> +
> +    while ((e =3D qlist_pop(cpus))) {
> +        QDict *cpu, *props;
> +        int64_t socket, core, thread, node;
> +
> +        cpu =3D qobject_to_qdict(e);
> +        g_assert(qdict_haskey(cpu, "props"));
> +        props =3D qdict_get_qdict(cpu, "props");
> +
> +        g_assert(qdict_haskey(props, "node-id"));
> +        node =3D qdict_get_int(props, "node-id");
> +        g_assert(qdict_haskey(props, "socket-id"));
> +        socket =3D qdict_get_int(props, "socket-id");
> +        g_assert(qdict_haskey(props, "core-id"));
> +        core =3D qdict_get_int(props, "core-id");
> +        g_assert(qdict_haskey(props, "thread-id"));
> +        thread =3D qdict_get_int(props, "thread-id");
> +
> +        if (socket =3D=3D 0) {
> +            g_assert_cmpint(node, =3D=3D, 1);
> +        } else if (socket =3D=3D 1 && core =3D=3D 0) {
> +            g_assert_cmpint(node, =3D=3D, 0);
> +        } else if (socket =3D=3D 1 && core =3D=3D 1 && thread =3D=3D 0) {
> +            g_assert_cmpint(node, =3D=3D, 0);
> +        } else if (socket =3D=3D 1 && core =3D=3D 1 && thread =3D=3D 1) {
> +            g_assert_cmpint(node, =3D=3D, 1);
> +        } else {
> +            g_assert(false);
> +        }
> +    }
> +
> +    QDECREF(resp);
> +    qtest_end();
> +    g_free(cli);
> +}
> +
> +static void spapr_numa_cpu(const void *data)
> +{
> +    char *cli;
> +    QDict *resp;
> +    QList *cpus;
> +    const QObject *e;
> +
> +    cli =3D make_cli(data, "-smp 4,cores=3D4 "
> +        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
> +        "-numa cpu,node-id=3D0,core-id=3D0 "
> +        "-numa cpu,node-id=3D0,core-id=3D1 "
> +        "-numa cpu,node-id=3D0,core-id=3D2 "
> +        "-numa cpu,node-id=3D1,core-id=3D3");
> +    qtest_start(cli);
> +    cpus =3D get_cpus(&resp);
> +    g_assert(cpus);
> +
> +    while ((e =3D qlist_pop(cpus))) {
> +        QDict *cpu, *props;
> +        int64_t core, node;
> +
> +        cpu =3D qobject_to_qdict(e);
> +        g_assert(qdict_haskey(cpu, "props"));
> +        props =3D qdict_get_qdict(cpu, "props");
> +
> +        g_assert(qdict_haskey(props, "node-id"));
> +        node =3D qdict_get_int(props, "node-id");
> +        g_assert(qdict_haskey(props, "core-id"));
> +        core =3D qdict_get_int(props, "core-id");
> +
> +        if (core >=3D 0 && core < 3) {
> +            g_assert_cmpint(node, =3D=3D, 0);
> +        } else if (core =3D=3D 3) {
> +            g_assert_cmpint(node, =3D=3D, 1);
> +        } else {
> +            g_assert(false);
> +        }
> +    }
> +
> +    QDECREF(resp);
> +    qtest_end();
> +    g_free(cli);
> +}
> +
> +static void aarch64_numa_cpu(const void *data)
> +{
> +    char *cli;
> +    QDict *resp;
> +    QList *cpus;
> +    const QObject *e;
> +
> +    cli =3D make_cli(data, "-smp 2 "
> +        "-numa node,nodeid=3D0 -numa node,nodeid=3D1 "
> +        "-numa cpu,node-id=3D1,thread-id=3D0 "
> +        "-numa cpu,node-id=3D0,thread-id=3D1");
> +    qtest_start(cli);
> +    cpus =3D get_cpus(&resp);
> +    g_assert(cpus);
> +
> +    while ((e =3D qlist_pop(cpus))) {
> +        QDict *cpu, *props;
> +        int64_t thread, node;
> +
> +        cpu =3D qobject_to_qdict(e);
> +        g_assert(qdict_haskey(cpu, "props"));
> +        props =3D qdict_get_qdict(cpu, "props");
> +
> +        g_assert(qdict_haskey(props, "node-id"));
> +        node =3D qdict_get_int(props, "node-id");
> +        g_assert(qdict_haskey(props, "thread-id"));
> +        thread =3D qdict_get_int(props, "thread-id");
> +
> +        if (thread =3D=3D 0) {
> +            g_assert_cmpint(node, =3D=3D, 1);
> +        } else if (thread =3D=3D 1) {
> +            g_assert_cmpint(node, =3D=3D, 0);
> +        } else {
> +            g_assert(false);
> +        }
> +    }
> +
> +    QDECREF(resp);
> +    qtest_end();
> +    g_free(cli);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      const char *args =3D NULL;
> @@ -147,5 +285,18 @@ int main(int argc, char **argv)
>      qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial=
);
>      qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cp=
us);
> =20
> +    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
> +        qtest_add_data_func("/numa/pc/cpu/explicit", args, pc_numa_cpu);
> +    }
> +
> +    if (!strcmp(arch, "ppc64")) {
> +        qtest_add_data_func("/numa/spapr/cpu/explicit", args, spapr_numa=
_cpu);
> +    }
> +
> +    if (!strcmp(arch, "aarch64")) {
> +        qtest_add_data_func("/numa/aarch64/cpu/explicit", args,
> +                            aarch64_numa_cpu);
> +    }
> +
>      return g_test_run();
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEBGxAAoJEGw4ysog2bOSIxcP/09U0v1NWjzEt1AODrLPRwWd
9C8ka/45dKeWDWf8+kaI/0LGIZc8nnvUFEjKWvHxLZgy6xDMrgY2cJZSbiscgq3F
5jpa4SPAUkT8c1EgTlZkR1/RrkHLIWLQyjdjlWZJzkeYVQRVYvJgzqZhKEM93Gcp
zFe5Qczhwz6IsHGPErFWCf9/iDGEYkLqiYdD50hcX+XXjHsVENbSoSHQf+5H5AP2
xEcQ/3CHoqrW0JnRpCWZ/uEfK9wJh37/tAxIRfNZw/7BIZ6WJmyEnjk5OVq9xccF
sic9v4YS3meXnlUeFvbr8CeqHooi1XI7absH8h/qeumdNlNJtCOrt6fwT/F533SK
Oph8PG47ExD4IKINxyHA/0dgsLZOd+SfRAHsvcSzrrELtMeM+IksGolPeneCJdne
cnlzd5Q7thOz2KF6+ISi3EOx+m7FCJ/YSPUGHKN7Sc7GCefQMIf0F92utGKSreTF
tKkp5iSFoToQKrvayEEhLG3XX19rXVR4gOPKzkfa5Yhoih3VlkVhBtsDfE2ssA5k
8ejkhSYyrw1Fp2PO/Bvy2xvliRMgW9pySCLHz3+qswDwuxED6tpR1Bfpxu39xaCL
zdGEaCepI9cJDziDCzuBqwBoDtME4p5pJbJpjReO/GOLlOycyJmsimvi4+vG/YNR
XpwpTeIs1UZlYKqGa+jV
=OIt+
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--
