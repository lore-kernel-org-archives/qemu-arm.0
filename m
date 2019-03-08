Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8176980wrx;
        Fri, 8 Mar 2019 02:06:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzT3vMknVWM+0EIQOT1qqeTwrPPSpwy2jaGuzPU1KDcNyfJQ6cfVoiqrVMLoY/MgV8mCAwk
X-Received: by 2002:a81:3657:: with SMTP id d84mr13779759ywa.53.1552039570608;
        Fri, 08 Mar 2019 02:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552039570; cv=none;
        d=google.com; s=arc-20160816;
        b=loCkd65m1QknyYyXuLkyfA0ak1O3vZR4F8GTlYsJFxo44WKQpuphuz6RLvFwpWXPRr
         Py3SaOfZ9kPM6IXnDfLOVFQJ6Ijq/RNmu1xYhiwKsIEtN1DG4+u4I93Q7RiAZP6iJg7n
         Q51bIVbR7iWVQn/38fJPL/wWxpZ7Dhz3apLFwILzPPrla4CxY/KWca9uBLj+DxVm3cN8
         /I+neGi5lPjJIEAeejIXbD/Pl0eDCNnTUEDfKCR69cHy9xtjrPkiQPYTMODyGuuj/U65
         woPUAbLcEauEs5qkTj0Oslp7aRRTpRuOBfeBo3rKzf0BBUXCz9FYL4+o/ELARvKn5Px/
         ShZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=TYt7wk8o6Lhe9EVS8X7ZciCrYDsGtUqnBwiBKopGYBM=;
        b=M+adLl+zg4wTS+CfYt9v5KQcypntRer27WCq6w2ocvxGXjf10pMdBaX7M9MzShwF2p
         mG6sLa2u/qr7dslxQtSuDiVFtmwkhVLi/55UhR32mtudKZQiJ4Vjqz6scXZTh+pxnr/L
         i8OCochXU6IFxKFlKNwabo7SYKMFxcHpTxXPgybEuglsprHR2OFUemQrnCKeaTPJoqeN
         /72s61V3eWdpAZp2djTw/EwKDqnTuQNuwwsX1Ptu2IrqqFkFTYDvHfeM3EhN6MlD1qM4
         /o2StbF7S3lV9qfTBxKsIhkB+SSW9pxo6WS7jn5VA8P+8DpRn4Q0K7+TbP6OOkGLhzyd
         37gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si4335050ywh.146.2019.03.08.02.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 02:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2COH-0001hs-W4
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 05:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2CO2-0001gS-DC
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2CO1-0007Im-Jo
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:05:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2CO1-0007I2-BJ; Fri, 08 Mar 2019 05:05:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 756127E441;
	Fri,  8 Mar 2019 10:05:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD961001E77;
	Fri,  8 Mar 2019 10:05:37 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-7-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <eb5b1516-9dca-e9bc-4a2b-d5573c14146f@redhat.com>
Date: Fri, 8 Mar 2019 11:05:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 08 Mar 2019 10:05:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 06/18] hw/nvram/fw_cfg: Remove the
 unnecessary boot_splash_filedata_size
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
X-TUID: 6bAytkxdmCks

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> The 'boot_splash_filedata_size' was introduced as a global variable
> in 3d3b8303c6f. This variable is used as a 'size' argument to the
> fw_cfg_add_file(). This function has an interface contract with his

s/with his/on its/

With that update:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> 'data' argument, but there is no such contract for 'size' (this is
> not a referenced pointer).  We can simply remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c       | 5 ++---
>  include/sysemu/sysemu.h | 1 -
>  vl.c                    | 1 -
>  3 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 8eb76a382c..b2dc0a80cb 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -217,15 +217,14 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>          }
>          g_free(boot_splash_filedata);
>          boot_splash_filedata =3D (uint8_t *)file_data;
> -        boot_splash_filedata_size =3D file_size;
> =20
>          /* insert data */
>          if (file_type =3D=3D JPG_FILE) {
>              fw_cfg_add_file(s, "bootsplash.jpg",
> -                    boot_splash_filedata, boot_splash_filedata_size);
> +                            boot_splash_filedata, file_size);
>          } else {
>              fw_cfg_add_file(s, "bootsplash.bmp",
> -                    boot_splash_filedata, boot_splash_filedata_size);
> +                            boot_splash_filedata, file_size);
>          }
>          g_free(filename);
>      }
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 89604a8328..6065d9e420 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -110,7 +110,6 @@ extern int old_param;
>  extern int boot_menu;
>  extern bool boot_strict;
>  extern uint8_t *boot_splash_filedata;
> -extern size_t boot_splash_filedata_size;
>  extern bool enable_mlock;
>  extern bool enable_cpu_pm;
>  extern QEMUClockType rtc_clock;
> diff --git a/vl.c b/vl.c
> index 4c5cc0d8ad..fad6fec38c 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -188,7 +188,6 @@ const char *prom_envs[MAX_PROM_ENVS];
>  int boot_menu;
>  bool boot_strict;
>  uint8_t *boot_splash_filedata;
> -size_t boot_splash_filedata_size;
>  bool wakeup_suspend_enabled;
> =20
>  int icount_align_option;
>=20

