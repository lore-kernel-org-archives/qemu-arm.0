Received: by 10.28.71.27 with SMTP id u27csp2346870wma;
        Thu, 8 Feb 2018 09:42:15 -0800 (PST)
X-Google-Smtp-Source: AH8x225xiz2SYbq6Jkhs/QgrU8b2jr+vdEVD6dIKtQO/DfsBS2XDSU3pqv9EShH793+DxpZEl0U3
X-Received: by 10.13.238.195 with SMTP id x186mr1190799ywe.1.1518111734977;
        Thu, 08 Feb 2018 09:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518111734; cv=none;
        d=google.com; s=arc-20160816;
        b=umsUxpCP3IQI69hlIos+Jrq9z7/DapMj4aV/eDYwCgKuDcfHloOeOJ35Q4/R8nYbSv
         dPgeeOBy3KCZl2j5x3bH+GXxSrXjuCjzz31pwFiqbKR3iYqQeRK81KtcCdZ7L0ZwlAvg
         grNCTuxpfTtpFC9XOycXG7tBymV/6MHQcSVdbAJ5r1xrPhxVXRVb+OXqC3y547eMG+TY
         PXUOhsNa/0RDOan+Puj/+nDuaQDDtiyjuTndbvwvLJtc2EpYeMe01tCzFx3Khkl6IO0G
         OOxmN+3RJRld/1GA4NyNFdatbhxvpHb2KGAcHyQm4Josv9DIAOWhUsOB1Zf+7sHR4xhh
         kcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=UmIqQ8DtesC2hbwGEzyPq1tQx5HffVM5uBp8g8eVdNA=;
        b=czi3TLxag9OBlqgu2eP2p0RAyJ1/VolImiUna+W3rktkFzInbw4lTcuJ8xAwBTtSIE
         mBnfYxnN3Pr7Qo5p3i9rAxL2VoRolYusninRIVe+2/izpt/DakZDocpalwqkcoeQ7Xrw
         XoYTDvyTWVMBmPtrA5lIu3qoE1+KRs1izCrk0BbvLz+l3ioTgxqfxD0PGln7rHicyVrl
         lMAnbS4+CfIikbDAYt+dj/+T8Slho/RZj1/qQULlGkEmlfO/XvTvKrrH3jOVCV6eZSJ3
         s8pVQleWdoXoBOBuxyPINVcDXCXaBZVKqiGCcUOFWPYVDulo4DFi1qCQUHvpQJjE6s5G
         Vxew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OpuAlpE7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si80582ywe.320.2018.02.08.09.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OpuAlpE7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqD8-00049Q-CD
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejpsq-00027V-5r
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ejpsp-00065e-5U
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:21:16 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:40191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ejpsp-00064L-0S
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:21:15 -0500
Received: by mail-oi0-x242.google.com with SMTP id 8so4031913oix.7
	for <qemu-devel@nongnu.org>; Thu, 08 Feb 2018 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UmIqQ8DtesC2hbwGEzyPq1tQx5HffVM5uBp8g8eVdNA=;
	b=OpuAlpE79RnkmpTMHJh4BzNDgpLABkpoLNfEfckVy/T/0NBdJaNkaDpyKNcCkggfu/
	jIL94kMIQ3kv1Fs04DRoCSBmMhG4x3/OI1B/TPgB0AdlaUxNk74lHA6Gtc+umiwooRYD
	FJV8PkiLGbb5RpDxfxf0PiCa8VbQ6WzJKDlUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UmIqQ8DtesC2hbwGEzyPq1tQx5HffVM5uBp8g8eVdNA=;
	b=soe5incFNtkndeUhmufCSKXdaYHihk13dzFXSon/sFTq4ZCz68tXzPop/XDn2EU9wQ
	/Z9xNj6V6rsoOTCwj5fBirn7hD5Rd1mwbaqe469tGrVkunXHElLtFqZLTV1st6jpzkm6
	/ybB1Xspyaz3R4oYj9r3lqCTBDY0bmWv62QCUBmuucEErjjLd9NUN3I7Vj5zQDYsIbRD
	KVM87L3DLL3k7NmUwEV/W84AjRMjoglHE5FwVMjnvf+GyXt8X2EwoTx8S8I6bBzFMoio
	Q63Nag2HyUCh00i8MvT09MIYSV/TnUqAHcvOx6I2hMsTUdxbtuPNQ2xfhmal12SCVvEU
	wWgA==
X-Gm-Message-State: APf1xPCdaD6+/Cl/2bIxAm9Dm+wcY7/ZXZLtvSLdBRVe9ZF7WRfIPFpf
	Sq3RGq9x8ASDtzM3iRDuYN/+lYL1CVPwRcTEh2L5NA==
X-Received: by 10.202.105.84 with SMTP id e81mr930504oic.305.1518110474315;
	Thu, 08 Feb 2018 09:21:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Thu, 8 Feb 2018 09:20:53 -0800 (PST)
In-Reply-To: <20180207042438.15422-10-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2018 17:20:53 +0000
Message-ID: <CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v5 09/14] pci: Use pci_config_size in
 pci_data_* accessors
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9ainoYGF3ZH

On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
> pci_data_read() and pci_data_write(), so this function would work for
> both classic PCI and PCIe use-cases.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/pci/pci_host.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 5eaa935cb5..ea52ea07cd 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_d=
ev, uint32_t addr,
>  void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int len)
>  {
>      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> +    uint32_t config_addr;
>
>      if (!pci_dev) {
>          return;
>      }
>
> +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> +
>      PCI_DPRINTF("%s: %s: addr=3D%02" PRIx32 " val=3D%08" PRIx32 " len=3D=
%d\n",
>                  __func__, pci_dev->name, config_addr, val, len);
> -    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SPACE_=
SIZE,
> +    pci_host_config_write_common(pci_dev, config_addr,
> +                                 pci_config_size(pci_dev),
>                                   val, len);
>  }
>
>  uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
>  {
>      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
> -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
> +    uint32_t config_addr;
>      uint32_t val;
>
>      if (!pci_dev) {
>          return ~0x0;
>      }
>
> +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
> +
>      val =3D pci_host_config_read_common(pci_dev, config_addr,
> -                                      PCI_CONFIG_SPACE_SIZE, len);
> +                                      pci_config_size(pci_dev), len);
>      PCI_DPRINTF("%s: %s: addr=3D%02"PRIx32" val=3D%08"PRIx32" len=3D%d\n=
",
>                  __func__, pci_dev->name, config_addr, val, len);
>

I've just discovered that this breaks the e1000e-test:

$ (cd build/clang; QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
./tests/e1000e-test)
/x86_64/e1000e/init: **
ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/e1000e-test.c:118:e=
1000e_device_find:
'e1000e_dev' should not be NULL

Any idea what's going on here?

thanks
-- PMM
