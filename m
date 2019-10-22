Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5692405wrm;
        Tue, 22 Oct 2019 01:34:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4O9dbG4f2TmvhmHMohc2FY615to2tSC1gBf7niIofBr67mUQwiGNDjRBJetjCJUUdagVO
X-Received: by 2002:a25:c586:: with SMTP id v128mr1601322ybe.387.1571733254281;
        Tue, 22 Oct 2019 01:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571733254; cv=none;
        d=google.com; s=arc-20160816;
        b=pWmMoC3yiqgMy528LWjF3xlHPlX8DtpPZvdOkOIW95+X1oBmyo65DXQ15nx3G73OgY
         GF86z012DGXKzujXQrk6IeoYSr3YzisgpqL0+r1JXESTjcia4HGGAH5tEk7assWfvKUe
         QkwEDzIUJEBbo9rSJB1Su5ksglSYZGDIvIKTsSE4A+kqJQ41tresrejKdxwi2Y/tBqaD
         ZyD/8joj9qE+IOo8DEz1F/UQSJWaYLydLCGs5XcNpy/ELeSL/LOf5zRbrqISe3nC0HCy
         OEJUMi0nLjdvHSI/qiOc5XD5vv03oQvSCvrpt3OLFqupc9XU4fMCapls9wl+Njy4gsWp
         ss+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=EoYrb2qtL19XBGGIWYU+vJio620TxOIYm0uiqYTeKSc=;
        b=hPblXqIymKmXVSgVxXWy8lx73lOMSNuSZuiGdhOUryB7mjLKK9kY/jaUIU7il5lN7d
         htS3Imfou4YOD29P+u3r4Nta4kwXK7m6Oau6Gu+M6/sNBlNzF7yWcJPWOg2r6GZzOH4h
         MJYxogi4/kkX1s/AtQIs/Cp6U6tbj4CEC+PWq3V3gya8BCIQ5LiX1zrhY1YfdrwW9+Gn
         6ndOd3uVwrk5R85vSdggwFJeKj5oUZPlrgb9YJHK3Vp+7z146rQLZHZANCWJiKmVlwfV
         OgkYbymhec45cFzZaHJtGYWZWN0GCSO8HTzIHyRb5vrGLEHcp9PiWSgBMMFkKbeFi2/e
         zNAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GcXgWYAV;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e207si6414851ybh.114.2019.10.22.01.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 01:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GcXgWYAV;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571733253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=EoYrb2qtL19XBGGIWYU+vJio620TxOIYm0uiqYTeKSc=;
	b=GcXgWYAVhftyPQ7fCKpSKP9ZJFk0ltaGnS5IVIZl+Wqa222ddPtGCWdqBjCULqQ34IFMTN
	b4YspnxnAzbgwSDcTTU6v9jU+cOSXiWEoajZtJv6sc9HjH5i2iSXVmuahiG2nbKDVwfUsH
	33PDJjozbRiIZ+QDeHDjOVT8Lb1qJZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-Xin1PCgSOAePwp1CSNk9Sg-1; Tue, 22 Oct 2019 04:34:12 -0400
Received: by mail-wm1-f71.google.com with SMTP id v26so3811463wmh.2
        for <alex.bennee@linaro.org>; Tue, 22 Oct 2019 01:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6wbpy6sfnJTNjtUXNQcI+hAzgAqW8DDHA9ysT8boTQU=;
        b=GUXg98lT2KsfZ0hJ5SfepLrA+hktc1NG7Y2D84AhY6vQs/l+ma1J+VHaNLLpk/auqh
         c77sU5WKwWKcTplZegnpwOr2bJj0IZr8J3aPV8sX06Eiqmk08RA4Kq3IbAhKArKO8IFO
         wb01XmZjqrwVNZkgLDw+Erp8ehS6S6+XMvk8OZK4wPlvixdiOH/r2/n+tOm/Eo0cHPoi
         G6KkT0VJxJIDYqdHcg9MIB/96ZXJ3582B2/2H7lPlPFJZtfVh7IKl9K4D9WzZdX8sGqM
         afLIIcYo2wfCkMes8jLW7PJkpgw3MR9nTA3zid43SW72gNSO7Pw1CNEncKfTvqphYo60
         TVdQ==
X-Gm-Message-State: APjAAAUKi/46dJ0v8ZWeMA6AmceoZJlIoJGxlbNHshQT9/gY+MM+QoiY
	o2lleTmDjq/dHAOr1yUh7FWATVIWx01XD5p3fg1miZi7XL8c6+4sPdzyjaKEGMqa807EX/cxkeu
	mXKdPvtqR4+jO2Vfr
X-Received: by 2002:adf:a157:: with SMTP id r23mr2244947wrr.51.1571733250726;
        Tue, 22 Oct 2019 01:34:10 -0700 (PDT)
X-Received: by 2002:adf:a157:: with SMTP id r23mr2244914wrr.51.1571733250340;
        Tue, 22 Oct 2019 01:34:10 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:566:fc24:94f2:2f13? ([2001:b07:6468:f312:566:fc24:94f2:2f13])
        by smtp.gmail.com with ESMTPSA id 37sm28128625wrc.96.2019.10.22.01.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 01:34:09 -0700 (PDT)
Subject: Re: [PATCH] Semihost SYS_READC implementation
To: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20191022031335.9880-1-keithp@keithp.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d7470bfa-ba4e-3287-326f-ee63c5d76407@redhat.com>
Date: Tue, 22 Oct 2019 10:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191022031335.9880-1-keithp@keithp.com>
Content-Language: en-US
X-MC-Unique: Xin1PCgSOAePwp1CSNk9Sg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rsN2kUvKVIlT

On 22/10/19 05:13, Keith Packard wrote:
> Provides a blocking call to read a character from the console by hooking
> into the console input chain. This happens *after* any uart has hooked in=
,
> so specifying -semihost overrides input to any emulated uarts.
>=20
> Signed-off-by: Keith Packard <keithp@keithp.com>

I'm a bit confused, why is it not using semihosting_get_chardev?  That
would be

=09-chardev stdio,id=3Dsemihost
=09-semihosting-config on,chardev=3Dsemihost

Paolo

> ---
>  hw/semihosting/console.c          | 92 +++++++++++++++++++++++++++++++
>  include/hw/semihosting/console.h  | 12 ++++
>  include/hw/semihosting/semihost.h |  1 +
>  stubs/semihost.c                  |  4 ++
>  target/arm/arm-semi.c             |  3 +-
>  vl.c                              |  3 +
>  6 files changed, 113 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
> index b4b17c8afb..7345e2cce0 100644
> --- a/hw/semihosting/console.c
> +++ b/hw/semihosting/console.c
> @@ -98,3 +98,95 @@ void qemu_semihosting_console_outc(CPUArchState *env, =
target_ulong addr)
>                        __func__, addr);
>      }
>  }
> +
> +#include <pthread.h>
> +#include "chardev/char-fe.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/main-loop.h"
> +#include "qapi/error.h"
> +
> +#define FIFO_SIZE   1024
> +
> +typedef struct SemihostingFifo {
> +    unsigned int     insert, remove;
> +
> +    uint8_t fifo[FIFO_SIZE];
> +} SemihostingFifo;
> +
> +#define fifo_insert(f, c) do { \
> +    (f)->fifo[(f)->insert] =3D (c); \
> +    (f)->insert =3D ((f)->insert + 1) & (FIFO_SIZE - 1); \
> +} while (0)
> +
> +#define fifo_remove(f, c) do {\
> +    c =3D (f)->fifo[(f)->remove]; \
> +    (f)->remove =3D ((f)->remove + 1) & (FIFO_SIZE - 1); \
> +} while (0)
> +
> +#define fifo_full(f)        ((((f)->insert + 1) & (FIFO_SIZE - 1)) =3D=
=3D \
> +                             (f)->remove)
> +#define fifo_empty(f)       ((f)->insert =3D=3D (f)->remove)
> +#define fifo_space(f)       (((f)->remove - ((f)->insert + 1)) & \
> +                             (FIFO_SIZE - 1))
> +
> +typedef struct SemihostingConsole {
> +    CharBackend         backend;
> +    pthread_mutex_t     mutex;
> +    pthread_cond_t      cond;
> +    bool                got;
> +    SemihostingFifo     fifo;
> +} SemihostingConsole;
> +
> +static SemihostingConsole console =3D {
> +    .mutex =3D PTHREAD_MUTEX_INITIALIZER,
> +    .cond =3D PTHREAD_COND_INITIALIZER
> +};
> +
> +static int console_can_read(void *opaque)
> +{
> +    SemihostingConsole *c =3D opaque;
> +    int ret;
> +    pthread_mutex_lock(&c->mutex);
> +    ret =3D fifo_space(&c->fifo);
> +    pthread_mutex_unlock(&c->mutex);
> +    return ret;
> +}
> +
> +static void console_read(void *opaque, const uint8_t *buf, int size)
> +{
> +    SemihostingConsole *c =3D opaque;
> +    pthread_mutex_lock(&c->mutex);
> +    while (size-- && !fifo_full(&c->fifo)) {
> +        fifo_insert(&c->fifo, *buf++);
> +    }
> +    pthread_cond_broadcast(&c->cond);
> +    pthread_mutex_unlock(&c->mutex);
> +}
> +
> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    (void) env;
> +    SemihostingConsole *c =3D &console;
> +    qemu_mutex_unlock_iothread();
> +    pthread_mutex_lock(&c->mutex);
> +    while (fifo_empty(&c->fifo)) {
> +        pthread_cond_wait(&c->cond, &c->mutex);
> +    }
> +    uint8_t ch;
> +    fifo_remove(&c->fifo, ch);
> +    pthread_mutex_unlock(&c->mutex);
> +    qemu_mutex_lock_iothread();
> +    return (target_ulong) ch;
> +}
> +
> +void qemu_semihosting_console_init(void)
> +{
> +    if (semihosting_enabled()) {
> +        qemu_chr_fe_init(&console.backend, serial_hd(0), &error_abort);
> +        qemu_chr_fe_set_handlers(&console.backend,
> +                                 console_can_read,
> +                                 console_read,
> +                                 NULL, NULL, &console,
> +                                 NULL, true);
> +    }
> +}
> diff --git a/include/hw/semihosting/console.h b/include/hw/semihosting/co=
nsole.h
> index 9be9754bcd..56f3606a2a 100644
> --- a/include/hw/semihosting/console.h
> +++ b/include/hw/semihosting/console.h
> @@ -37,6 +37,18 @@ int qemu_semihosting_console_outs(CPUArchState *env, t=
arget_ulong s);
>   */
>  void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
> =20
> +/**
> + * qemu_semihosting_console_outc:
> + * @env: CPUArchState
> + *
> + * Receive single character from debug console. This
> + * may be the remote gdb session if a softmmu guest is currently being
> + * debugged.
> + *
> + * Returns: character read or -1 on error
> + */
> +target_ulong qemu_semihosting_console_inc(CPUArchState *env);
> +
>  /**
>   * qemu_semihosting_log_out:
>   * @s: pointer to string
> diff --git a/include/hw/semihosting/semihost.h b/include/hw/semihosting/s=
emihost.h
> index 60fc42d851..a13d17c087 100644
> --- a/include/hw/semihosting/semihost.h
> +++ b/include/hw/semihosting/semihost.h
> @@ -68,6 +68,7 @@ Chardev *semihosting_get_chardev(void);
>  void qemu_semihosting_enable(void);
>  int qemu_semihosting_config_options(const char *opt);
>  void qemu_semihosting_connect_chardevs(void);
> +void qemu_semihosting_console_init(void);
>  #endif /* CONFIG_USER_ONLY */
> =20
>  #endif /* SEMIHOST_H */
> diff --git a/stubs/semihost.c b/stubs/semihost.c
> index f90589259c..1d8b37f7b2 100644
> --- a/stubs/semihost.c
> +++ b/stubs/semihost.c
> @@ -69,3 +69,7 @@ void semihosting_arg_fallback(const char *file, const c=
har *cmd)
>  void qemu_semihosting_connect_chardevs(void)
>  {
>  }
> +
> +void qemu_semihosting_console_init(void)
> +{
> +}
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 6f7b6d801b..47d61f6fe1 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -802,8 +802,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
> =20
>          return guestfd_fns[gf->type].readfn(cpu, gf, arg1, len);
>      case TARGET_SYS_READC:
> -        qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func=
__);
> -        return 0;
> +        return qemu_semihosting_console_inc(env);
>      case TARGET_SYS_ISTTY:
>          GET_ARG(0);
> =20
> diff --git a/vl.c b/vl.c
> index 4489cfb2bb..ac584d97ea 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4381,6 +4381,9 @@ int main(int argc, char **argv, char **envp)
>      ds =3D init_displaystate();
>      qemu_display_init(ds, &dpy);
> =20
> +    /* connect semihosting console input if requested */
> +    qemu_semihosting_console_init();
> +
>      /* must be after terminal init, SDL library changes signal handlers =
*/
>      os_setup_signal_handling();
> =20
>=20
