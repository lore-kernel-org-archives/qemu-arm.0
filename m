Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53402EE6B43
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 17:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voPhy-0003rG-Em; Fri, 06 Feb 2026 12:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voPhv-0003m9-Un
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:33:27 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1voPht-0002en-OL
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 12:33:27 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-66106a2f8d1so1355016eaf.1
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 09:33:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770399204; cv=none;
 d=google.com; s=arc-20240605;
 b=aSjT9y14iEMHqHGInVtIrT3qzr9rUtfZu3mNpOnqbWtLW11MQAkj4/w5yeFbMFiWKv
 YqZw2skWjeVngXeCWtsuAei7ghtxL2pHGbMK6l2gHNnZNt7Ch+V5uM+idcrAZ4TlvIte
 iP4/eYdES+dJSq047p5grZXh/LEr/xeW9vgIS2Ibef1d7vYStUZvT/a+H2Yhj26IhcVq
 2ebBsxwr7fOw46Mkn/sSsBtVK9SsRIVNwbtgx3unDmHT3F6NhrVh+cOmb/E+sHAzfo0x
 /oCTm3K+7odxT88XWs96CuNnwcA3XqFIxiCqJ5Xfa9XdfeiX16Y2LHrtLAbqnDLwRgMi
 qJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oF541vMwvBhLoCe+/4b8TNAhRgKvrUc2DWK4C90kY+Y=;
 fh=dJi0FSvo0px22KCS5FA1JONjkbHjmPSg+HEkUK1gmwk=;
 b=BH2x2krmGbsIB1BUbUEbdgNjUWRs+ToU2NxALn2ti11mnSmdL+jqk22KgJROeIxerM
 GMvgQtW3xN8XnXXjJLUVZLhAg89KnHVBK9mkfpQYDocQE0O0Qd/q8ljUXFTVg3EXMPye
 Ml6qc8CUIb0finAfYVWXcCCeUokV+a5f2/LOzcDisvK0yTWLV+3T065vDV+OWyZM0SHZ
 Q+15c53lMMjtbFL6ku/qTPGWDs1SfETTD/mcH/t0ejzEtnxMlFjaf2hY3X4u1kF3Z5TE
 QIXFwson6ttvRHImHLyVEIb59R6KZXn7UyYbXyoRlN4RSWZmrFAWCcD3cUdiuFLYm5Xv
 5eqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770399204; x=1771004004; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oF541vMwvBhLoCe+/4b8TNAhRgKvrUc2DWK4C90kY+Y=;
 b=ge5Wp7qWZBZK8ohJZGW8EcW/WNVB0udAUp16GaT8j8TU33T0KLnedUdZldzjYGyC2R
 CE5QLQYCqYdTvJp9Doe9ok1qhEOcj8bw6/SBqSaYeOtuhclwKmzIzvfYuTeDNiyTDgg0
 ffXN6t82GxjrgZYdRCDAkRkdaCjgOURLIWMDjwdDlR4uYbT6ZYQnttKtr6kF77gQbx+J
 ZI0F6IDGxnYwqZftwfHZhps6J0/broKjr9+YwC9jYI7mewKZ+fFp5LEj/YusB6PGqndi
 2ax6+dvEtTs/oiqn9S4n727JCa3B1o4QThJgOyZh/yGaRgJFdhcwD7Q4MBxvjJJjuMdH
 C4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770399204; x=1771004004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oF541vMwvBhLoCe+/4b8TNAhRgKvrUc2DWK4C90kY+Y=;
 b=mZvIA5ihBEqtx0qNNZDxByTOIz7EsTpNNGtWqRzbrHGHIC6f4ScdlXKwDZNDxzlRk4
 cI3pti8QKSnIHlPB9VI0Ui2OdV9ZqmVPIw+sto1/Kw0F4rG1at1+hbsI9fBgdXvWSYvs
 tNVOooDc9XxiE2V5pYHvC6euDD6R03h1filzHR6lk8oompIPgPLyRKk176mvUF3orqZ3
 lY661Xb4Tge04nvfgouMccUCmn2tOSQroK4rB9d3W7JdB1RwMHK4WDgYrho82GxINp6x
 InnRX/O/R20ED0Zm7ovvh0Y4x4aFd4eXFmDlm6JjODsK5WyykIlANoDiI42WoLIOJ3A0
 0gSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMUlII/8j/SGjMTbOrI53WMC6LMovUL67POQtgvjo0KAqp0guG5R2K+H3QOWdLe/XAmNHkUFDAVg==@nongnu.org
X-Gm-Message-State: AOJu0YxQSARIkwGjiXAYH6soINWXmcDzmsgZjHM+PwjbPEKyD55Emcqz
 imWEoHu3LJ8VD1Rk2VhQnTqcnlOkGxJPu+uAL/vcuM6VTbHc2k6JI6y7wxUhDhiL3pcprXh6Zv1
 4FcjLAm4iw8/vDmNjoNmQCinukgylgiY=
X-Gm-Gg: AZuq6aJVPAUBpJ/JdzCIgQt2YnXdKESeBeuN8OUPT7H4SzGkVMUitYv0SIHz9rP19d8
 eiHcfOFLkpR40pDyT71aSIqLunsq+9y3PHqDML0QUCmtOXyooZnDGygN3ORubdBwhAwlXH7JUee
 RPp5w9yDr99vPaRROteBnr2B1lORwRH6ECJMj50/8ObSozjP5Dsjq2GfV9HvM0ZDTv1zPO63Zy8
 RzaVvrcvuCXZnRKbGS9P7U38vO7kLAVp7js9t1SzqWfpQ7qI9zQ4Kbxsn7+PzZMfKLAUaV8ojFD
 ot3LAoJk
X-Received: by 2002:a05:6820:80c7:b0:659:9a49:9047 with SMTP id
 006d021491bc7-66d09f9c55amr1536898eaf.18.1770399204147; Fri, 06 Feb 2026
 09:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20260205195824.2610192-1-ruslichenko.r@gmail.com>
 <20260205195824.2610192-9-ruslichenko.r@gmail.com>
 <aYT9ZMNk7stEXhHB@redhat.com>
In-Reply-To: <aYT9ZMNk7stEXhHB@redhat.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Fri, 6 Feb 2026 18:33:12 +0100
X-Gm-Features: AZwV_QixEr-1wITKewZLIhta_YHs6U-GKreO8876u9JrYkBN-wJUPn04L1F4uNQ
Message-ID: <CAN-aV1FmTNqvqY4eMKg7+Op2eth5GjmLe_O+0Sh=ox_TLSsJzA@mail.gmail.com>
Subject: Re: [PATCH 08/29] hw/core: Setup Remote Port I/O channels
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com, 
 Ruslan_Ruslichenko@epam.com, "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hello Daniel,
Thank you for your review.

On Thu, Feb 5, 2026 at 9:28=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Thu, Feb 05, 2026 at 08:58:03PM +0100, Ruslan Ruslichenko wrote:
> > From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> >
> > Add initialization of communication channels with
> > remote peer.
> >
> > This includes character device backend, which can be
> > configured based on QOM properties or automatic socket
> > creation based on the machine path. The patch also
> > initializes the signaling event pipes.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
> > Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> > ---
> >  hw/core/remote-port.c         | 187 ++++++++++++++++++++++++++++++++++
> >  include/hw/core/remote-port.h |  16 +++
> >  2 files changed, 203 insertions(+)
> >
> > diff --git a/hw/core/remote-port.c b/hw/core/remote-port.c
> > index c909a825f3..5154c1bc2a 100644
> > --- a/hw/core/remote-port.c
> > +++ b/hw/core/remote-port.c
> > @@ -52,6 +52,58 @@
> >  #define REMOTE_PORT_CLASS(klass)    \
> >       OBJECT_CLASS_CHECK(RemotePortClass, (klass), TYPE_REMOTE_PORT)
> >
> > +static char *rp_sanitize_prefix(RemotePort *s)
> > +{
> > +    char *sanitized_name;
> > +    char *c;
> > +
> > +    sanitized_name =3D g_strdup(s->prefix);
> > +    for (c =3D sanitized_name; *c !=3D '\0'; c++) {
> > +        if (*c =3D=3D '/') {
> > +            *c =3D '_';
> > +        }
> > +    }
> > +    return sanitized_name;
> > +}
> > +
> > +static char *rp_autocreate_chardesc(RemotePort *s, bool server)
> > +{
> > +    char *prefix;
> > +    char *chardesc;
> > +    int r;
> > +
> > +    prefix =3D rp_sanitize_prefix(s);
> > +    r =3D asprintf(&chardesc, "unix:%s/qemu-rport-%s%s",
> > +                 machine_path, prefix, server ? ",wait,server" : "");
> > +    assert(r > 0);
> > +    free(prefix);
> > +    return chardesc;
> > +}
> > +
> > +static Chardev *rp_autocreate_chardev(RemotePort *s, char *name)
> > +{
> > +    Chardev *chr =3D NULL;
> > +    char *chardesc;
> > +    char *s_path;
> > +    int r;
> > +
> > +    r =3D asprintf(&s_path, "%s/qemu-rport-%s", machine_path,
> > +                 rp_sanitize_prefix(s));
> > +    assert(r > 0);
> > +    if (g_file_test(s_path, G_FILE_TEST_EXISTS)) {
> > +        chardesc =3D rp_autocreate_chardesc(s, false);
> > +        chr =3D qemu_chr_new_noreplay(name, chardesc, false, NULL);
> > +        free(chardesc);
> > +    }
> > +    free(s_path);
> > +
> > +    if (!chr) {
> > +        chardesc =3D rp_autocreate_chardesc(s, true);
> > +        chr =3D qemu_chr_new_noreplay(name, chardesc, false, NULL);
> > +        free(chardesc);
> > +    }
> > +    return chr;
> > +}
> >
> >  static void rp_reset(DeviceState *dev)
> >  {
> > @@ -66,6 +118,127 @@ static void rp_reset(DeviceState *dev)
> >
> >  static void rp_realize(DeviceState *dev, Error **errp)
> >  {
> > +    RemotePort *s =3D REMOTE_PORT(dev);
> > +    int r;
> > +    Error *err =3D NULL;
> > +
> > +    s->prefix =3D object_get_canonical_path(OBJECT(dev));
> > +
> > +    if (!qemu_chr_fe_get_driver(&s->chr)) {
> > +        char *name;
> > +        Chardev *chr =3D NULL;
> > +        static int nr;
> > +
> > +        r =3D asprintf(&name, "rport%d", nr);
> > +        nr++;
> > +        assert(r > 0);
> > +
> > +        if (s->chrdev_id) {
> > +            chr =3D qemu_chr_find(s->chrdev_id);
> > +        }
> > +
> > +        if (chr) {
> > +            /* Found the chardev via commandline */
> > +        } else if (s->chardesc) {
> > +            chr =3D qemu_chr_new(name, s->chardesc, NULL);
> > +        } else {
> > +            if (!machine_path) {
> > +                error_report("%s: Missing chardesc prop."
> > +                             " Forgot -machine-path?",
> > +                             s->prefix);
> > +                exit(EXIT_FAILURE);
> > +            }
> > +            chr =3D rp_autocreate_chardev(s, name);
> > +        }
>
> Having three different ways to configure the chardev rather
> feels like overkill. IMHO it should be sufficient to just
> accept thue chardev ID as a mandatory argument, and not
> attempt to create chardevs from this code. That would
> in turn seem to avoid the need for the -machine-path arg
> to exist ?
>

I think we can consider using only chrdev_id, for now. This loses some
flexibility, but definitely simplifies things a lot.

>
> > +#ifdef _WIN32
> > +    /*
> > +     * Create a socket connection between two sockets. We auto-bind
> > +     * and read out the port selected by the kernel.
> > +     */
> > +    {
> > +        char *name;
> > +        SocketAddress *sock;
> > +        int port;
> > +        int listen_sk;
> > +
> > +        sock =3D socket_parse("127.0.0.1:0", &error_abort);
> > +        listen_sk =3D socket_listen(sock, 1, &error_abort);
>
> Please avoid introducing new usage of low level sockets APIs. The higher
> level QIOChannelSocket APIs is preferred, that said.....
>
> > +
> > +        if (s->event.pipe.read < 0) {
> > +            perror("socket read");
> > +            exit(EXIT_FAILURE);
> > +        }
> > +
> > +        {
> > +            struct sockaddr_in saddr;
> > +            socklen_t slen =3D sizeof saddr;
> > +            int r;
> > +
> > +            r =3D getsockname(listen_sk, (struct sockaddr *) &saddr, &=
slen);
> > +            if (r < 0) {
> > +                perror("getsockname");
> > +                exit(EXIT_FAILURE);
> > +            }
> > +            port =3D htons(saddr.sin_port);
> > +        }
> > +
> > +        name =3D g_strdup_printf("127.0.0.1:%d", port);
> > +        s->event.pipe.write =3D inet_connect(name, &error_abort);
> > +        g_free(name);
> > +        if (s->event.pipe.write < 0) {
> > +            perror("socket write");
> > +            exit(EXIT_FAILURE);
> > +        }
> > +
> > +        for (;;) {
> > +            struct sockaddr_in saddr;
> > +            socklen_t slen =3D sizeof saddr;
> > +            int fd;
> > +
> > +            slen =3D sizeof(saddr);
> > +            fd =3D qemu_accept(listen_sk, (struct sockaddr *)&saddr, &=
slen);
> > +            if (fd < 0 && errno !=3D EINTR) {
> > +                close(listen_sk);
> > +                return;
> > +            } else if (fd >=3D 0) {
> > +                close(listen_sk);
> > +                s->event.pipe.read =3D fd;
> > +                break;
> > +            }
> > +        }
> > +
> > +        if (!qemu_set_blocking(s->event.pipe.read, false, &err)) {
> > +            error_report("%s: Unable to set non-block for internal pip=
es",
> > +                        s->prefix);
> > +            exit(EXIT_FAILURE);
> > +        }
> > +    }
> > +#else
> > +    if (!g_unix_open_pipe(s->event.pipes, FD_CLOEXEC, NULL)) {
> > +        error_report("%s: Unable to create remort-port internal pipes"=
,
> > +                    s->prefix);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> > +    if (!qemu_set_blocking(s->event.pipe.read, false, &err)) {
> > +        error_report("%s: Unable to set non-block for internal pipes",
> > +                    s->prefix);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> > +#endif
>
> ... I can't help thinking we have this code "self event pipe" design
> somewhere else in QEMU. Ideally we would have a helper API for this
> task and avoid OS conditional code in this device impl.
>
>
Thanks! Looks like EventNotifier may work here and it supports both platfor=
ms.
I'll try to use it instead then.

> >  }
> >
> >  static void rp_unrealize(DeviceState *dev)
> > @@ -73,6 +246,13 @@ static void rp_unrealize(DeviceState *dev)
> >      RemotePort *s =3D REMOTE_PORT(dev);
> >
> >      s->finalizing =3D true;
> > +
> > +    info_report("%s: Wait for remote-port to disconnect", s->prefix);
> > +    qemu_chr_fe_disconnect(&s->chr);
> > +
> > +    close(s->event.pipe.read);
> > +    close(s->event.pipe.write);
> > +    object_unparent(OBJECT(s->chrdev));
> >  }
> >
> >  static const VMStateDescription vmstate_rp =3D {
> > @@ -84,6 +264,12 @@ static const VMStateDescription vmstate_rp =3D {
> >      }
> >  };
> >
> > +static Property rp_properties[] =3D {
> > +    DEFINE_PROP_CHR("chardev", RemotePort, chr),
> > +    DEFINE_PROP_STRING("chardesc", RemotePort, chardesc),
> > +    DEFINE_PROP_STRING("chrdev-id", RemotePort, chrdev_id),
> > +};
>
> This really feels lik
>
> > +
> >  static void rp_prop_allow_set_link(const Object *obj, const char *name=
,
> >                                     Object *val, Error **errp)
> >  {
> > @@ -112,6 +298,7 @@ static void rp_class_init(ObjectClass *klass, const=
 void *data)
> >      dc->realize =3D rp_realize;
> >      dc->unrealize =3D rp_unrealize;
> >      dc->vmsd =3D &vmstate_rp;
> > +    device_class_set_props_n(dc, rp_properties, ARRAY_SIZE(rp_properti=
es));
> >  }
> >
> >  static const TypeInfo rp_info =3D {
> > diff --git a/include/hw/core/remote-port.h b/include/hw/core/remote-por=
t.h
> > index db71071c8e..0f40018cdb 100644
> > --- a/include/hw/core/remote-port.h
> > +++ b/include/hw/core/remote-port.h
> > @@ -56,8 +56,24 @@ typedef struct RemotePortDeviceClass {
> >  struct RemotePort {
> >      DeviceState parent;
> >
> > +    union {
> > +       int pipes[2];
> > +       struct {
> > +           int read;
> > +           int write;
> > +       } pipe;
> > +    } event;
> > +    Chardev *chrdev;
> > +    CharFrontend chr;
> >      bool finalizing;
> >
> > +    char *chardesc;
> > +    char *chrdev_id;
> > +
> > +    const char *prefix;
> > +    const char *remote_prefix;
> > +
> > +    uint32_t current_id;
> >      bool reset_done;
> >
> >  #define REMOTE_PORT_MAX_DEVS 1024
> > --
> > 2.43.0
> >
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

--
BR,
Ruslan

