Received: by 10.25.208.211 with SMTP id h202csp1629610lfg;
        Tue, 23 Feb 2016 01:51:57 -0800 (PST)
X-Received: by 10.140.105.198 with SMTP id c64mr40445536qgf.94.1456221117388;
        Tue, 23 Feb 2016 01:51:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si33216760qka.41.2016.02.23.01.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9dM-0004bK-UE
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:51:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9dJ-0004XQ-Td
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9dF-0000xk-NY
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:51:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aY9dF-0000xg-C9; Tue, 23 Feb 2016 04:51:49 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id DD9405A5D;
	Tue, 23 Feb 2016 09:51:48 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N9pi2E024504; Tue, 23 Feb 2016 04:51:44 -0500
Date: Tue, 23 Feb 2016 11:51:43 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Message-ID: <20160223115137-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<1455906029-25565-6-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1455906029-25565-6-git-send-email-somlo@cmu.edu>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH v9 5/5] fw_cfg: document ACPI device node
	information
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ng3W3C64FfdT

On Fri, Feb 19, 2016 at 01:20:29PM -0500, Gabriel L. Somlo wrote:
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Marc Mar=ED <markmb@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  docs/specs/fw_cfg.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/docs/specs/fw_cfg.txt b/docs/specs/fw_cfg.txt
> index 2099ad9..5414140 100644
> --- a/docs/specs/fw_cfg.txt
> +++ b/docs/specs/fw_cfg.txt
> @@ -84,6 +84,15 @@ Selector Register address: Base + 8 (2 bytes)
>  Data Register address:     Base + 0 (8 bytes)
>  DMA Address address:       Base + 16 (8 bytes)
> =20
> +=3D=3D ACPI Interface =3D=3D
> +
> +The fw_cfg device is defined with ACPI ID "QEMU0002". Since we expect
> +ACPI tables to be passed into the guest through the fw_cfg device itse=
lf,
> +the guest-side firmware can not use ACPI to find fw_cfg. However, once=
 the
> +firmware is finished setting up ACPI tables and hands control over to =
the
> +guest kernel, the latter can use the fw_cfg ACPI node for a more accur=
ate
> +inventory of in-use IOport or MMIO regions.
> +
>  =3D=3D Firmware Configuration Items =3D=3D
> =20
>  =3D=3D=3D Signature (Key 0x0000, FW_CFG_SIGNATURE) =3D=3D=3D
> --=20
> 2.4.3
