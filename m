Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8019302wrx;
        Thu, 7 Mar 2019 22:50:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqytnMbRJ8a5KF07oFtgKSpFGAbpPHgK+kOshMZAyxodCspqYkaUY65Ugl/tPwtHOTw0Smk4
X-Received: by 2002:a81:6f8a:: with SMTP id k132mr13238208ywc.469.1552027816986;
        Thu, 07 Mar 2019 22:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552027816; cv=none;
        d=google.com; s=arc-20160816;
        b=yB3RKmxTvt8+5hHuTTXtEyTiYJwBWQS58wzeWPS8EDAxwV5yRggJTuM8CZJCI9h4qd
         cr2HNW6TlX7ygbqV1mUwi/8CVRSRqQdWvyTCGEtp03qEzCrBgJVVDNTF1pa36WH03nKr
         SR2qu/ZtYc/u6CApGT5qWDalSUBV5SD80XYYPiZYoHiBLpSjDqVvGop7FEys6x21otZg
         O0lCYe6UEPC02d1OdD6jZZQo1la3aFyV8FRvpcVDmsD5Tna35Wbk+RJBlbXGSPQqjrQn
         tY9jzZgt0X71biat36eWH8vnYqtU+Wk8//CXhffO43nQJC9UoE6+wVdF98eO5ORW7/nw
         jh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=ydj5kT5E3s+VhdE/fbjCbLgjh9pS9qq2Xg6P3TsbB/8=;
        b=fe3CBqdy0zw2o43XJRurxOOcU8L3ITF6SrEbvHCbtO/nmqKyaFNWRQe4KYzaBhA5nB
         UhWlCdzV2bxG0bZx/z4QOAQXhpmQuuV+8eS5EkpTAQgkMj5ly/nJkyjN+2peT0KoAK/j
         O9DklOff+VBmT3TLj6SZs2RGz6W7ueizP3Q6cLT4UW/jU+SEvLgPyYL19wUokpV5NVug
         AXaMFSiOBw2u1wdcZyopPxzAshGroPbzW4/bpM7ttx5MrN57a8W2QSmYl+728LVBXPU0
         Lwp9OT3mddhEGZOPe7HHhhT4aS8xsvbtUNJV0lKSVJ6HMr7ZQrXmZTyPQQkK7MHlIpm2
         vr/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j195si4140498ybj.369.2019.03.07.22.50.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 22:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h29Ki-0006V3-DL
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 01:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h29KV-0006Rd-CR
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 01:50:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h29KU-00008m-Ko
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 01:50:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h29KU-00007a-CM; Fri, 08 Mar 2019 01:50:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B912B3082134;
	Fri,  8 Mar 2019 06:50:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-147.ams2.redhat.com [10.36.116.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE6845C1B5;
	Fri,  8 Mar 2019 06:49:49 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-7-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <37ef3c6b-e99e-859e-2324-9c59ff6bc1f8@redhat.com>
Date: Fri, 8 Mar 2019 07:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 08 Mar 2019 06:50:01 +0000 (UTC)
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vekgPfgOUgE6

On 08/03/2019 02.32, Philippe Mathieu-Daud=C3=A9 wrote:
> The 'boot_splash_filedata_size' was introduced as a global variable
> in 3d3b8303c6f. This variable is used as a 'size' argument to the
> fw_cfg_add_file(). This function has an interface contract with his
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

Nice, one global variable less!

Reviewed-by: Thomas Huth <thuth@redhat.com>
