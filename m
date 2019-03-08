Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8229260wrx;
        Fri, 8 Mar 2019 03:04:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9b06tAT43GwpUs+J3m0prkvQWlcHp7HEHAqM0wgjAb+0sQ6pnTHj+zgDXaX3r2uzXIb6u
X-Received: by 2002:a5b:f4a:: with SMTP id y10mr15979784ybr.322.1552043075097;
        Fri, 08 Mar 2019 03:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552043075; cv=none;
        d=google.com; s=arc-20160816;
        b=yx+5kGVpG+463jwKVkSjN1dOdMQ9/c15TD5a43AL4GXJYMlrx0UH1dLapZi7fu8Wkz
         rmimX1nNPFpo6Um269xo3fxeURq1Bess6pSZiWO99kkPQW9mfdr1pFYIY2UkApzU9Gff
         5cu551ne/AsHLBpb64x7tpevvipkXDEALutU0o0Wg9Dfu9gJc90cYBGQpFz4st0LHqEM
         rueSMMrsuXa6H5P+lhK41MimIRfj6+HxniMX9YDoDSwynDuKXshcQk95CRXvEbUaB0/C
         gYbg2YSe7tm6Ciex41uowMOqmB50MRT5OGE77NhCcRDqeRGRsGxK6Ff5LgLJsQF05w4C
         TLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=8Pbps4VbDBhOyC3Kyk6tcblDhvMvkJIizJbNCwYn+IM=;
        b=KfFzLsf99q4zaEPdd749TuLT2D1Qaa+jV3D/SskhuyDEBqlLkwMmwqzclOZF05fP9W
         ocno7ho7cJ2mVI33SCD3XFHJHKgYT/HJRPZ3TPn88/ZV5boWw1oL1ggJ2V1kRkFKxhb6
         hEugSIrVZJ2NRX+4/oJgDVy5nemnJsxUwSnsKYpwxoYrZWuuS0QAATFQfzzMW7a/6lBY
         8gsbtCo1FwDhW42W0gCInNLmhHwzY8VrJym/eCAHRwsxg2GYnPQxkQMG4WG1cyHaraf4
         LUvHl45NszNofOWZqneUC3tWc/orkxvTh00U71CszMeOMp3lTDnxikpqxUQyFw6t8Dfo
         Bk1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v79si4502180ywa.260.2019.03.08.03.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2DIo-00030n-Lp
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2DIe-00030X-Uw
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:04:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2DIe-0002xZ-0W
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:04:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2DIc-0002uJ-Ng; Fri, 08 Mar 2019 06:04:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 523A43092656;
	Fri,  8 Mar 2019 11:04:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6306B19C70;
	Fri,  8 Mar 2019 11:04:10 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-11-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <40a49a86-3010-da90-41f3-0f4a1705bca0@redhat.com>
Date: Fri, 8 Mar 2019 12:04:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-11-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 08 Mar 2019 11:04:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 10/18] hw/nvram/fw_cfg: Add reboot_timeout
 to FWCfgState
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6MMPr1VHIhns

Hi Phil,

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> Due to the contract interface of fw_cfg_add_file(), the
> 'reboot_timeout' data has to be valid for the lifetime of the
> FwCfg object. For this reason it is copied on the heap with
> memdup().
>=20
> The object state, 'FWCfgState', is also meant to be valid during the
> lifetime of the object.
> Move the 'reboot_timeout' in FWCfgState to achieve the same purpose.
> Doing so we avoid a memory leak.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c         | 4 +++-
>  include/hw/nvram/fw_cfg.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Currently, there is no memory leak. Right now, the leak is theoretical,
and it would depend on the fw_cfg object being actually destroyed.

I think armoring the fw_cfg implementation for such lifetime actions is
valuable. But, that definitely belongs to its own series, in my opinion.

In the "hw/nvram/fw_cfg.c" file, I count:

(a) two "specific purpose" g_memdup() calls, namely in
fw_cfg_bootsplash() and in fw_cfg_reboot();

(b) one "generic purpose" g_memdup() call, namely in fw_cfg_add_string();

(c) two "generic purpose" g_malloc() calls, namely in fw_cfg_add_i16(),
fw_cfg_add_i32(), and fw_cfg_add_i64(). (The one in fw_cfg_modify_i16()
does not matter here because the previous blob is freed in that function.=
)

Your series deals with (a), namely with fw_cfg_reboot() in this patch,
and with fw_cfg_bootsplash() in the next one.

Your series deals with neither (b) nor (c). The
fw_cfg_add_(string|i16|i32|i64) functions are called from a bunch of
places however, so if we really intend *not* to leak those copies upon
fw_cfg destruction, then we'll have to track all of them dynamically, in
a list for example.

(And that necessitates a separate series for this topic even more.)

In turn, once we add dynamic tracking, for those blobs that the
fw_cfg_add_(string|i16|i32|i64) functions allocate internally -- as they
are advertized to do --, then we might as well use the same tracking
infrastructure for (a). In other words, it should not be necessary to
add the specific fields "reboot_timeout" and "boot_splash" to FWCfgState.

Thanks,
Laszlo

>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index b73a591eff..182d27f59a 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -250,7 +250,9 @@ static void fw_cfg_reboot(FWCfgState *s)
>          }
>      }
> =20
> -    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_val, 4), 4);
> +    s->reboot_timeout =3D rt_val;
> +    fw_cfg_add_file(s, "etc/boot-fail-wait",
> +                    &s->reboot_timeout, sizeof(s->reboot_timeout));
>  }
> =20
>  static void fw_cfg_write(FWCfgState *s, uint8_t value)
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index 828ad9dedc..99f6fafcaa 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -53,6 +53,8 @@ struct FWCfgState {
>      dma_addr_t dma_addr;
>      AddressSpace *dma_as;
>      MemoryRegion dma_iomem;
> +
> +    uint32_t reboot_timeout;
>  };
> =20
>  struct FWCfgIoState {
>=20

