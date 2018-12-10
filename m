Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3770302wrt;
        Mon, 10 Dec 2018 08:04:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XGncczfSwqDGUBZafsF07+1868st9IjZ3RB7ZfTBJI8gZe5PpLbhv/1JNSBgVCkyU4utsX
X-Received: by 2002:a37:4cd7:: with SMTP id z206mr11811714qka.233.1544457841902;
        Mon, 10 Dec 2018 08:04:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544457841; cv=none;
        d=google.com; s=arc-20160816;
        b=XNmuDt14b5mzLev2LBA29TWAYsJTh9w6Elj9BI2EImFMgrBMSBLEidrlu7qt0hD6iu
         wm/vngNHseq5QzOpxIF4ovS5UKxiGgKDT9xub9gGrqEWapxD3BSft2+c6/aYTlGvoz9h
         jEgVhdB3KgbZRioDJkVjhtoK3ZkeAHlXoDvcalKjPesvC6B5y/xpeg0LrYMA6c5MGWj8
         4Hzxl3jlRbVwJbyA1I3naNtAmaJlY6L90dbwJM3UbpBImrMLdB2wcr3a7a9pnG6kXzKx
         cUZHrDgYCZsepCX9RzmrvU7f+zPHytWQ1KcaK67tp4yu7D4FUkITSKUpjsU0XlU69KWQ
         8YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=IicPlNayjLJpvPZ/HNUVqU4mbFusmK3/9qsRGqP4md8=;
        b=q9BwvGpuzgyDxJnQzXr0K8S+nvq5x2Rfc4PlOXD/X048OtW3KcJ6dAnQY9m8z4997z
         C2LcKKrriRRNTIqGG8gfazpy+QKgTfgMRwulo3bs65lj2BDol4deFi25FDOM7FKEEm0P
         sIxvQm/HFUEfrCn0DGNB/ciLDeuDUPJgu40OVl8wSkU0AjHeRk7uohlYH2GAoKevMwYR
         GQMm8UnmBTq5E91i6RC3Cpf//qPNfcXu0PdOt2lB63MoeYQ+MMdx8STbzgniFle4R1Sy
         cyT2v3mw8EN/jkrQrksTIcF9NBtN4b0/veBVE5uGNRzSuYTVsYdfQMzqKUJq/q3Ny8kD
         943w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 49si3296991qts.164.2018.12.10.08.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 08:04:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWO2K-0000Qt-Ob
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 11:04:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gWO29-0000K5-Fo
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 11:03:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gWO0z-0002pe-Fc
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 11:02:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gWO0z-0002pB-7y; Mon, 10 Dec 2018 11:02:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EC26C014177;
	Mon, 10 Dec 2018 16:02:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-101.rdu2.redhat.com
	[10.10.124.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74B55608F7;
	Mon, 10 Dec 2018 16:02:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181207170400.5129-1-philmd@redhat.com>
	<20181207170400.5129-2-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b7a09e97-093e-6e27-4c7f-cc5244d63726@redhat.com>
Date: Mon, 10 Dec 2018 17:02:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181207170400.5129-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 10 Dec 2018 16:02:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
Cc: Drew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWLF8m/yOqCS

On 12/07/18 18:03, Philippe Mathieu-Daud=C3=A9 wrote:
> Since af1f60a4022, the fw_cfg field is always created in machvirt_init(=
).
> There is no need to null check it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/virt.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f69e7eb399..36303ed59c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1279,10 +1279,6 @@ static void virt_build_smbios(VirtMachineState *=
vms)
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product =3D "QEMU Virtual Machine";
> =20
> -    if (!vms->fw_cfg) {
> -        return;
> -    }
> -
>      if (kvm_enabled()) {
>          product =3D "KVM Virtual Machine";
>      }
>=20

This patch looks correct to me; however, the fact that fw_cfg is always
present on the virt board does not seem related to commit af1f60a4022
af1f60a40226 ("hw/arm/virt: remove VirtGuestInfo", 2017-01-09). Said
commit only flattened the contents of VirtGuestInfo into
VirtMachineState; the conditions under which fw_cfg would be created
were not changed.

As far as I can see (from a number of git-blame / git-show commands),
fw_cfg was added unconditionally to the virt board in commit
578f3c7b0835 ("arm: add fw_cfg to "virt" board", 2014-12-22). And the
check that you are now (correctly) removing has always been superfluous
-- it was superfluous already when it was first added in commit
c30e15658b1b ("smbios: implement smbios support for mach-virt", 2015-09-0=
7).

As far as I can tell, anyway.

If you agree, I suggest mentioning commit c30e15658b1b in the commit
message, rather than commit af1f60a4022.

With such an update:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo
