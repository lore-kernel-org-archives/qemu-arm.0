Received: by 10.28.71.27 with SMTP id u27csp2367903wma;
        Thu, 8 Feb 2018 10:02:28 -0800 (PST)
X-Google-Smtp-Source: AH8x227O7ghCIpF9VihHt8+k5tLIXZ8jE71XEeszaA59+z/2gnqgy/cwi62DBZ16bmw5u+bJ6SYe
X-Received: by 10.129.43.86 with SMTP id r83mr13729ywr.309.1518112948473;
        Thu, 08 Feb 2018 10:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518112948; cv=none;
        d=google.com; s=arc-20160816;
        b=KU4bWZBLf8MVOCfvl5omz0LJni0rABLn5ZwLB2d7NcgYER4jlmjiEUbCh9ECjDuAXi
         7UM199CUWjGjJHmYwIjpgz/oANCORQz3/IO5b3AG0YYyFiBOmn5PhDhMrMqcbBJVqJBI
         GiKz/02PgykA2N48nUGd+uRrP9SY55L2XHV7ubDAEgetfHxM2sW7ncoMZoaq3Ylm7iqe
         OAQh22V7+QUKvz9nnoNjSsHacIWxsem/ULEApRoZXyfR7unwnJnHbG3W4rH12BIqdIUR
         K7a5zQfc4P3fSCztw5Luc6dqDCe/5vnuTJgBPgoryY8VKlgrt+PSAgHu5RwjvpJRH6RA
         kSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=bTFeYvAYRZpRVe1eXQVEhc7iFJU2ML66vWj1dpE6nHk=;
        b=czPmi4YpQ/1OSxZbsdKZsH8wSAsDm7LWNpsy2mdO/XKvJOHjZEZqd3GCH83j/QnTXF
         6BQdci0I6rpsQQXXDX1S+4KPlP8MkFiY5+FzHFShDHriiCws3y21gII9PKgLc7FTBjjn
         UgphaHZkYON0POg3j7YqxW/rVDegSlP8WqotvjSfchIYR2FIOyi18VWjO8HZn9/WYSx3
         qaM8sT7IgMZXdxPX3sWXoDTQV+eVrXOdv9rXo6dNPzlqXXTOvCH9nx5bWFuQ3Qp+k03n
         y7x8meZHPulHlI6q4xaNOS/t/xhmS61swPEn8BGoDdogvW4CIidpVXM3gIFplwHcYV2F
         weVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LhcOIBYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q127si86948ybc.160.2018.02.08.10.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 10:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LhcOIBYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqWh-0005ek-QX
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 13:02:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejqEp-00069I-4W
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:44:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejqEo-0002nB-3U
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:43:59 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44527)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejqEl-0002gz-7T; Thu, 08 Feb 2018 12:43:55 -0500
Received: by mail-qk0-x244.google.com with SMTP id n188so6665591qkn.11;
	Thu, 08 Feb 2018 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bTFeYvAYRZpRVe1eXQVEhc7iFJU2ML66vWj1dpE6nHk=;
	b=LhcOIBYT1rH0eUWtYD9pfmIAITZnEBnC/dn846uon6SYq/38qzT3KaWXtJx2+sVcOg
	0kwEMQfH1L6vBrxL+Yb7fg30SPgj6xpJNqyhSJUMYnzhryjSjNFtzOvAiTsEXzr/C0cN
	rehjSaSP3gba2oibFdOCX3SL/NHkO4zeuSB+fzXrM7NygL4xTlckZEVkHybMAy6R3sJd
	F2aQ//HVk7q7HBNHPvCvThJyJ0yMFBwabNqbx1VjT2r/dH0anGZ+u3LcaGyb5luYAJc9
	KKbFkTZvq8zt5qlsq4XEt/NH31idRP2nQcKZ96CiRo/U+7rUZ9krQ8xVHw5NRfgsS8UQ
	mPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bTFeYvAYRZpRVe1eXQVEhc7iFJU2ML66vWj1dpE6nHk=;
	b=X6L7rAs5z/mhR53oW44qJtdz491PeJ75m1b412Y7N6Eobie6h4mhjK17D60EyX2axu
	CtPZ6CZNCpz4073Pitee6b5Al7pQiEW9HXHbh86s+giyO0AgeLnVB0WMqAju8fSw1aAa
	FK92IU4k27sdRDsKduX/GtSPQToTvxVqkTpXMziWX6MmTlvRTq7fanr5UIkm8pA7gVd6
	JfTDRkLlqnaTaVB5FSXD4zpcxSFNiii7Vro8EXwMQO8TqdWXKWrgEeefzgBRh4wpnM8f
	DeoMxIGfWt387UqpQYDUUz6K9WfbGdbESDZURv02efNs7h8PNeMnjgUVOIWWB32C3Dh6
	IkxQ==
X-Gm-Message-State: APf1xPDABsRT8mP+01CLVCwKjCRPag/YxmAY7wYGrofUZ8xlVawLsdX8
	pOrVgPaiLQJTBV1my1zcU4wASFqAVe19vvfxyuU=
X-Received: by 10.55.169.68 with SMTP id s65mr2222578qke.57.1518111834418;
	Thu, 08 Feb 2018 09:43:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Thu, 8 Feb 2018 09:43:53 -0800 (PST)
In-Reply-To: <20180208193033-mutt-send-email-mst@kernel.org>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-10-andrew.smirnov@gmail.com>
	<CAFEAcA-=-+1A6toXM-ddP+iKBgHKh28Xq3VeGXfSLJ08xMRijA@mail.gmail.com>
	<20180208193033-mutt-send-email-mst@kernel.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 8 Feb 2018 09:43:53 -0800
Message-ID: <CAHQ1cqGr2e8vjQUUypkoyUc=QGQDNVkjydmOadfsSCzm78nkJQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zIHoIc4EOPGx

On Thu, Feb 8, 2018 at 9:34 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Thu, Feb 08, 2018 at 05:20:53PM +0000, Peter Maydell wrote:
>> On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
>> > Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
>> > pci_data_read() and pci_data_write(), so this function would work for
>> > both classic PCI and PCIe use-cases.
>> >
>> > Cc: Peter Maydell <peter.maydell@linaro.org>
>> > Cc: Jason Wang <jasowang@redhat.com>
>> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> > Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
>> > Cc: Michael S. Tsirkin <mst@redhat.com>
>> > Cc: qemu-devel@nongnu.org
>> > Cc: qemu-arm@nongnu.org
>> > Cc: yurovsky@gmail.com
>> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> > ---
>> >  hw/pci/pci_host.c | 13 +++++++++----
>> >  1 file changed, 9 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
>> > index 5eaa935cb5..ea52ea07cd 100644
>> > --- a/hw/pci/pci_host.c
>> > +++ b/hw/pci/pci_host.c
>> > @@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice *pc=
i_dev, uint32_t addr,
>> >  void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int len)
>> >  {
>> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
>> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
>> > +    uint32_t config_addr;
>> >
>> >      if (!pci_dev) {
>> >          return;
>> >      }
>> >
>> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
>> > +
>> >      PCI_DPRINTF("%s: %s: addr=3D%02" PRIx32 " val=3D%08" PRIx32 " len=
=3D%d\n",
>> >                  __func__, pci_dev->name, config_addr, val, len);
>> > -    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SPA=
CE_SIZE,
>> > +    pci_host_config_write_common(pci_dev, config_addr,
>> > +                                 pci_config_size(pci_dev),
>> >                                   val, len);
>> >  }
>> >
>> >  uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
>> >  {
>> >      PCIDevice *pci_dev =3D pci_dev_find_by_addr(s, addr);
>> > -    uint32_t config_addr =3D addr & (PCI_CONFIG_SPACE_SIZE - 1);
>> > +    uint32_t config_addr;
>> >      uint32_t val;
>> >
>> >      if (!pci_dev) {
>> >          return ~0x0;
>> >      }
>> >
>> > +    config_addr =3D addr & (pci_config_size(pci_dev) - 1);
>> > +
>> >      val =3D pci_host_config_read_common(pci_dev, config_addr,
>> > -                                      PCI_CONFIG_SPACE_SIZE, len);
>> > +                                      pci_config_size(pci_dev), len);
>> >      PCI_DPRINTF("%s: %s: addr=3D%02"PRIx32" val=3D%08"PRIx32" len=3D%=
d\n",
>> >                  __func__, pci_dev->name, config_addr, val, len);
>> >
>>
>> I've just discovered that this breaks the e1000e-test:
>>
>> $ (cd build/clang; QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
>> ./tests/e1000e-test)
>> /x86_64/e1000e/init: **
>> ERROR:/home/petmay01/linaro/qemu-from-laptop/qemu/tests/e1000e-test.c:11=
8:e1000e_device_find:
>> 'e1000e_dev' should not be NULL
>>
>> Any idea what's going on here?
>>

Peter:

Don't really have a good idea what's going on, but I am guessing this
change broke affected pci_host_data_* methods in negative way.

>> thanks
>> -- PMM
>
> I'm yet to review these patches, but IIRC pci_data_read and friends
> aren't designed with pcie in mind - they implement the classic pci
> config space.
>
> I'd like to see more justification about how these are now going
> to be used.
>

Michael:

My only justification for this change was suggestion from Marcel to
use pci_data_* functions, instead of calling pci_host_config_*_common
explicitly in designware.c introduced in next patch in the series. My
v4 patches incorrectly limited config space size to 256, so such
replacement didn't require this patch, but switching pci_data_* to use
pci_config_size() seemed harmless enough. I am more than happy to got
back to using pci_host_config_*_common in designware.c and dropping
this patch.

Thanks,
Andrey Smirnov
