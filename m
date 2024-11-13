Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp583949njc;
        Wed, 13 Nov 2024 10:36:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPER7zgtG/nb6NEIsEY3IKIGwwee9HGW1nuVj+YLgopY+GRysXeiz98SmZ86F9ceW58OEeIhrueGC8PA==@linaro.org
X-Google-Smtp-Source: AGHT+IHxcG+pliEvI5Z4TduPVMb0BiqJfvxV47JVQlZLjHTCEyC1r5Ia1S4Zny4cQtzEjV4LvdYs
X-Received: by 2002:a05:6102:2924:b0:4ad:4f8a:d4c8 with SMTP id ada2fe7eead31-4ad4f8ad4e9mr2424892137.6.1731522972331;
        Wed, 13 Nov 2024 10:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731522972; cv=none;
        d=google.com; s=arc-20240605;
        b=Weu8EdgVF4VhYz7E7G5zbY0CjmiCH+ZU06MPAoO7VwT4CdOihnlS5saW2Bf2rckTt8
         fOnNt8W6yfVjuHO7xPM9durbtwN5E0QV2ll7jjejoevEn6CwsTeqWdufvZGvaKEh4tBX
         eaLjoCm2eNbQ8e6XU7lgtGUsF2sOgWFZvSucWSV+gk4uMs6AsP4VI9g5HJ/+laC46kwb
         Hk+3WvHO7fEaXX6o7CRXIF9z74lNEBvfOSJ4SOV+3PPoItA+v08tiM783MCcIcgEvR03
         48pqL4L2RqUSPEcqc6Rwj5KHgNftjrxXeENNif99FTqKXiv1ry/pHMF9OHBvwdJF9VRn
         cE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/WgSuKX4v9WfD7FmJnCYXS9iXgeyMrCEHivEC2L2OK8=;
        fh=lMP1cai4BdRQWccoPZgZdAVGJ9SSTM5TrsWzLDf+uUE=;
        b=Q6njQ5d87mwn9DWU3LrhoZ+urKPGIs3B0FW/8aRsIDJZEVESMdAK9UbN6W+GjwpVeV
         1gt6zp3koEs6BAa0NZY45HlTc1uMRhtRsdMuboyP5o2zlRmFkj5NomY9o2mJM29MPspv
         rTnNiKXwMQtxDBiiL6hr7MQZjWVklSwYihjHwTLgL5G00id+74K6jCZEKP9bYhd7H84N
         vr4jrs9b4152BlTAM22YCJwmLjsExNPn+/gSURWVDbILJs5PjhDiQxnMi858swFuHDiP
         2yJThge86yyWHHdxd8BhHL99MAh80ijU1+U2Nfc7Jnic9kYQy75aeTzduOMuJGiHO7lg
         qkAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZAv+VKA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7ba77f1si3869974137.422.2024.11.13.10.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 10:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZAv+VKA0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBIDe-0000ia-0u; Wed, 13 Nov 2024 13:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBIDb-0000hq-EI
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 13:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBIDZ-0003x7-1v
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 13:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731522952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WgSuKX4v9WfD7FmJnCYXS9iXgeyMrCEHivEC2L2OK8=;
 b=ZAv+VKA07c+6S1F6M0dkctMGsTzNz8HivACigiE8AdDkl51yoX8k0G+yKdx4o6fg2rBQim
 YYBXKB6vVILQHurfcANkd7vzCrxpO2Hvl3kMblPd1T2uUhrqLjkg8yf7Nl8AYkeAZRRbeI
 u/buE/TOMtNOvWgXYPBTPBRuFc6c5Yk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-UHf4WoIrONKjT1hekOSDOg-1; Wed, 13 Nov 2024 13:35:48 -0500
X-MC-Unique: UHf4WoIrONKjT1hekOSDOg-1
X-Mimecast-MFC-AGG-ID: UHf4WoIrONKjT1hekOSDOg
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d5ca192b8so719416f8f.1
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 10:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731522947; x=1732127747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WgSuKX4v9WfD7FmJnCYXS9iXgeyMrCEHivEC2L2OK8=;
 b=kqcNbk36pTqFwqC79oEmuWfrbB0I1M2hV8oSCbIR4jWFdvUC3L7/y3OAXxpR26+Ya5
 QS9qV71aBChED1TAxWrelMkW2BKRiNtWuTeOnhsTwVmzItUuYW4IhmOoPB7Zte6uOjEr
 MX88FkkSUSVc21F46a3tH5IOINL8uE/LhUr+6+BWK1DlswezkV19uTu9Wu52ytDJ/oiQ
 qvJU5Jbpu3gAhALT5QB735KjhiUlEK6YfRdSuDy8UXKPqZOWIztD6xs/d9Vt0dsF5lk2
 XdbcdI7VWhiStUcs+qSnQ+ENLp/8WSxNt2EL5IZs5XWhqJh+ixGc59Y97oT6JBZoJBUd
 Z87w==
X-Forwarded-Encrypted: i=1;
 AJvYcCViOTZIHNdyfQ0CqtGENY6CMhO0wR50qi9nJsNbc2FWI45jfzyelN+6ADVpzGJZZ+j25WOjDJLWAA==@nongnu.org
X-Gm-Message-State: AOJu0YwZFqZtRozydFnSpoKfWjgVuDRZJUBl7OAfutDrsn33tSIq9THI
 LgAYPK5zQTP8Pe9pd/D7kfbmu71T7ol54eePs6Z2JzVhDSTZDQ5O2zFH3kbWjWPOs85d/uFHG9w
 mSE3jRNr/XQgAQWa3DAWZAIZITIpBXVy7KLKR9fhq/3RSPaZ9Rr9riccgb+GiwdTXV9nQZO0fE8
 0SWYdMTh7n+fjyFntk6U2Mc+fw
X-Received: by 2002:a5d:6c66:0:b0:37d:3baa:9f34 with SMTP id
 ffacd0b85a97d-38213ff9784mr326050f8f.1.1731522947172; 
 Wed, 13 Nov 2024 10:35:47 -0800 (PST)
X-Received: by 2002:a5d:6c66:0:b0:37d:3baa:9f34 with SMTP id
 ffacd0b85a97d-38213ff9784mr326028f8f.1.1731522946735; Wed, 13 Nov 2024
 10:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20241113142343.40832-1-phil@philjordan.eu>
 <20241113142343.40832-2-phil@philjordan.eu>
 <9dd5c736-e1b8-a025-745a-52e9aacb4b9b@eik.bme.hu>
In-Reply-To: <9dd5c736-e1b8-a025-745a-52e9aacb4b9b@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Nov 2024 19:35:35 +0100
Message-ID: <CABgObfbCF7q_ATWmWw2yCmYhTQK7tKmgGKR73s4u3W5Kvqj2Cw@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] ui & main loop: Redesign of system-specific
 main thread event handling
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org,
 agraf@csgraf.de, 
 peter.maydell@linaro.org, rad@semihalf.com, quic_llindhol@quicinc.com, 
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, chenhuacai@kernel.org, 
 kwolf@redhat.com, hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bmeng.cn@gmail.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com, 
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yXOsijtVUu66LKyBZV2OcTLs_nVqoZqR-Iy-M9pLWnA_1731522947
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.119,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.738,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2BOC/fLYxxRm

On Wed, Nov 13, 2024 at 7:16=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:
> > int main(int argc, char **argv)
> > {
> > +    QemuThread main_loop_thread;
> > +
> >     qemu_init(argc, argv);
> > -    return qemu_main();
> > +    if (qemu_main) {
> > +        qemu_thread_create(&main_loop_thread, "qemu_main",
> > +                           call_qemu_default_main, NULL, QEMU_THREAD_D=
ETACHED);
> > +        bql_unlock();
> > +        return qemu_main();
> > +    } else {
> > +        qemu_default_main();
>
> I think you need 'return qemu_default_main()' here but I'm a bit confused
> by all this wrapping of qemu_default_main in call_qemu_default_main. I se=
e
> that may be needed because qemu_thread_create takes a different function
> but now that qemu_default main is static and not replaced externally coul=
d
> that be changed to the right type and avoid this confusion and simplify
> this a bit?

Note that qemu_default_main() expects the BQL to be locked, whereas
qemu_main() and call_qemu_default_main() do not (because they run in a
separate thread).

But you're right, we could push bql_lock()/bql_unlock() into
qemu_default_main(), and do

     bql_unlock();
     if (qemu_main) {
        qemu_thread_create(&main_loop_thread, "qemu_main",
                           call_qemu_default_main, NULL, QEMU_THREAD_DETACH=
ED);
        return qemu_main();
    } else {
        return qemu_default_main();
    }

Paolo

> Regards,
> BALATON Zoltan
>
> > +    }
> > }
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index 4c2dd335323..30b8920d929 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -73,6 +73,8 @@
> >     int height;
> > } QEMUScreen;
> >
> > +@class QemuCocoaPasteboardTypeOwner;
> > +
> > static void cocoa_update(DisplayChangeListener *dcl,
> >                          int x, int y, int w, int h);
> >
> > @@ -107,6 +109,7 @@ static void cocoa_switch(DisplayChangeListener *dcl=
,
> > static NSInteger cbchangecount =3D -1;
> > static QemuClipboardInfo *cbinfo;
> > static QemuEvent cbevent;
> > +static QemuCocoaPasteboardTypeOwner *cbowner;
> >
> > // Utility functions to run specified code block with the BQL held
> > typedef void (^CodeBlock)(void);
> > @@ -1321,8 +1324,10 @@ - (void) dealloc
> > {
> >     COCOA_DEBUG("QemuCocoaAppController: dealloc\n");
> >
> > -    if (cocoaView)
> > -        [cocoaView release];
> > +    [cocoaView release];
> > +    [cbowner release];
> > +    cbowner =3D nil;
> > +
> >     [super dealloc];
> > }
> >
> > @@ -1938,8 +1943,6 @@ - (void)pasteboard:(NSPasteboard *)sender provide=
DataForType:(NSPasteboardType)t
> >
> > @end
> >
> > -static QemuCocoaPasteboardTypeOwner *cbowner;
> > -
> > static void cocoa_clipboard_notify(Notifier *notifier, void *data);
> > static void cocoa_clipboard_request(QemuClipboardInfo *info,
> >                                     QemuClipboardType type);
> > @@ -2002,43 +2005,8 @@ static void cocoa_clipboard_request(QemuClipboar=
dInfo *info,
> >     }
> > }
> >
> > -/*
> > - * The startup process for the OSX/Cocoa UI is complicated, because
> > - * OSX insists that the UI runs on the initial main thread, and so we
> > - * need to start a second thread which runs the qemu_default_main():
> > - * in main():
> > - *  in cocoa_display_init():
> > - *   assign cocoa_main to qemu_main
> > - *   create application, menus, etc
> > - *  in cocoa_main():
> > - *   create qemu-main thread
> > - *   enter OSX run loop
> > - */
> > -
> > -static void *call_qemu_main(void *opaque)
> > -{
> > -    int status;
> > -
> > -    COCOA_DEBUG("Second thread: calling qemu_default_main()\n");
> > -    bql_lock();
> > -    status =3D qemu_default_main();
> > -    bql_unlock();
> > -    COCOA_DEBUG("Second thread: qemu_default_main() returned, exiting\=
n");
> > -    [cbowner release];
> > -    exit(status);
> > -}
> > -
> > static int cocoa_main(void)
> > {
> > -    QemuThread thread;
> > -
> > -    COCOA_DEBUG("Entered %s()\n", __func__);
> > -
> > -    bql_unlock();
> > -    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
> > -                       NULL, QEMU_THREAD_DETACHED);
> > -
> > -    // Start the main event loop
> >     COCOA_DEBUG("Main thread: entering OSX run loop\n");
> >     [NSApp run];
> >     COCOA_DEBUG("Main thread: left OSX run loop, which should never hap=
pen\n");
> > @@ -2120,8 +2088,6 @@ static void cocoa_display_init(DisplayState *ds, =
DisplayOptions *opts)
> >
> >     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
> >
> > -    qemu_main =3D cocoa_main;
> > -
> >     // Pull this console process up to being a fully-fledged graphical
> >     // app with a menubar and Dock icon
> >     ProcessSerialNumber psn =3D { 0, kCurrentProcess };
> > @@ -2185,6 +2151,12 @@ static void cocoa_display_init(DisplayState *ds,=
 DisplayOptions *opts)
> >     qemu_clipboard_peer_register(&cbpeer);
> >
> >     [pool release];
> > +
> > +    /*
> > +     * The Cocoa UI will run the NSApplication runloop on the main thr=
ead
> > +     * rather than the default Core Foundation one.
> > +     */
> > +    qemu_main =3D cocoa_main;
> > }
> >
> > static QemuDisplay qemu_display_cocoa =3D {
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index bf9d3dd679a..fbf20161f36 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -38,6 +38,7 @@
> > #include "qemu/cutils.h"
> > #include "qemu/error-report.h"
> > #include "qemu/main-loop.h"
> > +#include "qemu-main.h"
> >
> > #include "ui/console.h"
> > #include "ui/gtk.h"
> > @@ -2485,6 +2486,13 @@ static void gtk_display_init(DisplayState *ds, D=
isplayOptions *opts)
> > #ifdef CONFIG_GTK_CLIPBOARD
> >     gd_clipboard_init(s);
> > #endif /* CONFIG_GTK_CLIPBOARD */
> > +
> > +    /*
> > +     * GTK+ calls must happen on the main thread at least on some plat=
forms,
> > +     * and on macOS the main runloop is polled via GTK+'s event handli=
ng.
> > +     * Don't allow QEMU's event loop to be moved off the main thread.
> > +     */
> > +    qemu_main =3D NULL;
> > }
> >
> > static void early_gtk_display_init(DisplayOptions *opts)
> > diff --git a/ui/sdl2.c b/ui/sdl2.c
> > index bd4f5a9da14..44ab2762262 100644
> > --- a/ui/sdl2.c
> > +++ b/ui/sdl2.c
> > @@ -34,6 +34,7 @@
> > #include "sysemu/sysemu.h"
> > #include "ui/win32-kbd-hook.h"
> > #include "qemu/log.h"
> > +#include "qemu-main.h"
> >
> > static int sdl2_num_outputs;
> > static struct sdl2_console *sdl2_console;
> > @@ -965,6 +966,9 @@ static void sdl2_display_init(DisplayState *ds, Dis=
playOptions *o)
> >     }
> >
> >     atexit(sdl_cleanup);
> > +
> > +    /* SDL's event polling (in dpy_refresh) must happen on the main th=
read. */
> > +    qemu_main =3D NULL;
> > }
> >
> > static QemuDisplay qemu_display_sdl2 =3D {
> >
>

