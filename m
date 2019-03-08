Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8241864wrx;
        Fri, 8 Mar 2019 03:16:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzl5AacQibLwgL40uGDZhd1l8fYMLDnE9/Kl1J0AcQU6iGqQadPccS1CR3SMuwofsZb9iN
X-Received: by 2002:a0d:ca4c:: with SMTP id m73mr13924268ywd.377.1552043797003;
        Fri, 08 Mar 2019 03:16:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552043796; cv=none;
        d=google.com; s=arc-20160816;
        b=d2FXSF/MAzbq4BJUKRMh8zrUlF7diql6HRDZI6+wg2he/kuLTdkPSuGlYrIg+T2Faz
         hlU9teULGq4D1gPGry0qFrmlNM+utLzXC4ltBPlSYqg4oPNDk6u0s6whMWb+OUBadqOI
         jJivL7cqgQgqNW/rW6P/hnzo7IBsgN+xmIpOY86NjHspVWd8rTL07GnPjgIyFhjy608M
         LDe3D2HfoAery/M43V7+Zr1h2jDt8X7Oy1sgZp/hOuaywqK+6/fC782zgrVZEfkRn+yX
         w+qNr2ZwSSTFi9Bzjs5fqFeW5W9J4pcB5OWHwG5kB/BOlM043vC7LwLWYpjSF9hij5MK
         S7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Y1g+WjBcBXC9g6a6aF2OCPu5RZpUABUYm0WbAhrasKk=;
        b=itMC6qouKSYIULu1MG8IJm87t6QmFLIHGLv0as/FcZfICqKJe4EgGkgDRJeUS1/mwi
         leprfePj5URa9vyo/t6feg4/mzTMElRenEXBGEMa+0V2ioGCmpZKvQvfD3bvYuBp5sgP
         pqXgAsaH6kwMTUP8A+GssDw6uU6ZQiaTnNaDNlRK6qGpN7lYaB09P35Mvks2wj0JO+oh
         npYBWMZOmlM5i6ZgXbpJhPekCz3jm5SzakH9TwBjk32qiNyX/K1vQPN0YYtw0NoJx1Qk
         aqVi5qTNqM0j36lxJdgJ65X5uEBJUv7TTXrFyX6tVqD+sOLEjwT9trj97dmomsSNTMfp
         Fb0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n197si4275724yba.179.2019.03.08.03.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2DUR-0006IA-Ik
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:16:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2DUD-0006I4-JU
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:16:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2DUC-0000A5-Gx
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:16:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2DUC-00008T-7O; Fri, 08 Mar 2019 06:16:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 198E2300B916;
	Fri,  8 Mar 2019 11:16:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 104A15C1B4;
	Fri,  8 Mar 2019 11:16:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-13-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <639f6fd4-3155-0238-612b-e3ec6479340c@redhat.com>
Date: Fri, 8 Mar 2019 12:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 08 Mar 2019 11:16:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 12/18] hw/nvram/fw_cfg: Keep reference of
 file_data in FWCfgState
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
X-TUID: 8/jAm1jQydFm

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> The 'file_data' is allocated by read_splashfile() (introduced in
> commit 3d3b8303c6f8).  It is then used by fw_cfg_add_file(). Due
> to the contract interface of fw_cfg_add_file(), it has to be valid
> for the lifetime of the FwCfg object.
>=20
> Keep a reference of 'file_data' in FWCfgState to be able to
> free this memory in fw_cfg_common_unrealize().
> We can now remove the res_free() from the main() loop.
> The global boot_splash_filedata is now unused, remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c         | 10 ++++++----
>  include/hw/nvram/fw_cfg.h |  1 +
>  include/sysemu/sysemu.h   |  1 -
>  vl.c                      |  9 ---------
>  4 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 3ac6687a04..fc392cb7e0 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -215,16 +215,16 @@ static void fw_cfg_bootsplash(FWCfgState *s)
>              g_free(filename);
>              return;
>          }
> -        g_free(boot_splash_filedata);
> -        boot_splash_filedata =3D (uint8_t *)file_data;
> +        g_free(s->boot_splash.file_data);
> +        s->boot_splash.file_data =3D file_data;
> =20
>          /* insert data */
>          if (file_type =3D=3D JPG_FILE) {
>              fw_cfg_add_file(s, "bootsplash.jpg",
> -                            boot_splash_filedata, file_size);
> +                            s->boot_splash.file_data, file_size);
>          } else {
>              fw_cfg_add_file(s, "bootsplash.bmp",
> -                            boot_splash_filedata, file_size);
> +                            s->boot_splash.file_data, file_size);
>          }
>          g_free(filename);
>      }
> @@ -974,6 +974,8 @@ static void fw_cfg_common_unrealize(DeviceState *de=
v, Error **errp)
> =20
>      g_free(s->files);
> =20
> +    g_free(s->boot_splash.file_data);
> +
>      g_free(s->entries[0]);
>      g_free(s->entries[1]);
>      g_free(s->entry_order);
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index fcb771186c..83a0540b6c 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -56,6 +56,7 @@ struct FWCfgState {
> =20
>      uint32_t reboot_timeout;
>      struct {
> +        char *file_data;
>          uint16_t time_le16;
>      } boot_splash;
>  };
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 6065d9e420..3cd856b015 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -109,7 +109,6 @@ extern int no_shutdown;
>  extern int old_param;
>  extern int boot_menu;
>  extern bool boot_strict;
> -extern uint8_t *boot_splash_filedata;
>  extern bool enable_mlock;
>  extern bool enable_cpu_pm;
>  extern QEMUClockType rtc_clock;
> diff --git a/vl.c b/vl.c
> index fad6fec38c..47dd63a309 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -187,7 +187,6 @@ unsigned int nb_prom_envs =3D 0;
>  const char *prom_envs[MAX_PROM_ENVS];
>  int boot_menu;
>  bool boot_strict;
> -uint8_t *boot_splash_filedata;
>  bool wakeup_suspend_enabled;
> =20
>  int icount_align_option;
> @@ -558,12 +557,6 @@ const char *qemu_get_vm_name(void)
>      return qemu_name;
>  }
> =20
> -static void res_free(void)
> -{
> -    g_free(boot_splash_filedata);
> -    boot_splash_filedata =3D NULL;
> -}
> -
>  static int default_driver_check(void *opaque, QemuOpts *opts, Error **=
errp)
>  {
>      const char *driver =3D qemu_opt_get(opts, "driver");
> @@ -4591,8 +4584,6 @@ int main(int argc, char **argv, char **envp)
>      job_cancel_sync_all();
>      bdrv_close_all();
> =20
> -    res_free();
> -
>      /* vhost-user must be cleaned up before chardevs.  */
>      tpm_cleanup();
>      net_cleanup();
>=20

Referring to the earlier thread

  [Qemu-devel] [PATCH] hw/nvram/fw_cfg: Move boot_splash_filedata
                       variables into fw_cfg.c
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg599282.html

my opinion is that *all* of the g_free() calls touched in this patch are
presently -- that is, pre-patch -- bogus:

- As I wrote earlier, res_free() may be reached, but the freeing it does
is useless.

- Furthermore, the g_free() call in fw_cfg_bootsplash() never frees
anything in reality. It is only called from fw_cfg_common_realize(), and
we only have one fw_cfg object (which is never destructed, for now).

So, first I would kill these bogus g_free()s altogether, in a separate
patch (in the separate series that I've recommended elsewhere). Then, in
a second patch (in the separate series), I would include the boot splash
image among the dynamically tracked allocations. Just add it to a linked
list, and when the fw_cfg object is destroyed, release it with the rest.

(Another note (and I should have made it earlier): fw_cfg_modify_i16()
will face a challenge; it will have to update the tracker data structure
too.)

Thanks
Laszlo
