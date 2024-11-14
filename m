Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp320228njc;
        Thu, 14 Nov 2024 05:27:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyBHAW/cf+zRMXj4fhVCehxocGqfwZJPxSWmc5F08SHrGiQckw3wefuSeXn+g6G8LSoapaZiTQM+fyTA==@linaro.org
X-Google-Smtp-Source: AGHT+IGcSVbmfTN/Jai7ac5KlUnUdaYUGgXT7cvuSTj3E8OKVGQrnTVUkuwLnDnCAlZvFVOgLAdy
X-Received: by 2002:a05:6358:4b02:b0:1c3:878d:286e with SMTP id e5c5f4694b2df-1c68bae131cmr94961655d.22.1731590856317;
        Thu, 14 Nov 2024 05:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731590856; cv=none;
        d=google.com; s=arc-20240605;
        b=kDdh9OHHiOGPjPAO3OmjBkkJpfYGDD0sThKLiGpL28R9ozdped+CHAtEhLC+a9mhTX
         36qYNWEI2Oo8gzuPRL8RIgJMZkNX3UFNI9pLyvtxXEcugo8jwzzUXIQFhCxTw2tCL3Av
         RRMmGHm2AI0V0XWRAnFm1DTLR45hdAzRXA6xwxA4hoax8jVMI27KVfOVWlcbKTnCCRD0
         330bqaskGM7sRsw68iq1hV3PuJwLUNY8UPiGERX0MEJTLC5/oKqbv/AhKeIxREWF7aAu
         Qx7r3dMIV4y3cm+KPQeHt5ZyNyIru4JcBoRMLxJaXgt/CsgzQivYemJKM4dkuX3GT+7Y
         ZAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vKmNwUQm6N8OZ4WFnBjPn/L9WzpJEfMJhrvQsiWkang=;
        fh=uU47f6w2DzbXO6blXifFZzAT0WW539MCQSlZMK80JJA=;
        b=fA+UyN2YLYfonFJCs1iqxsTJCGC+vc8MgV+wPL8VxUjSN1QdPbFi2kScvkyHTGFY3k
         aLDxFL3FTDRnyI4xwDTpyI9Ffph+Xy8luXij+R2zhJGYAnKx5kHTBc5U/bm6M62V58Ki
         IA6j8N4HGjz16fShrSDYoiTEN/4mtDHxbZPTTSsmih1H0SL4b8h+qeU0+8zOq7x/KOSG
         YatOZN9Dr2zLC6h0/Yu3YFwgqX06Xt/499elUZI8njSGvP1uIRHG62fRKFlPu8AOlsB3
         WyGDG2yYmEbmH7IyiSaelcnoI9VWZhDrkxZ9PwTm8+z49vsMM8RkDDXrYCgI5AGvHbpj
         H+Ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BWF4haW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aaec594si10982151cf.380.2024.11.14.05.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 05:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BWF4haW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBZsM-0001ky-Ve; Thu, 14 Nov 2024 08:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBZsL-0001kh-3g
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 08:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tBZsJ-0007P6-CX
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 08:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731590826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKmNwUQm6N8OZ4WFnBjPn/L9WzpJEfMJhrvQsiWkang=;
 b=BWF4haW94BRR/MLhPn6eRK2WCMN+ZEAZDD5Yto0G9m+Tj9EUxW7iaJd2QY5STqfOHVQX7L
 /CH1MmcY/9onMPZbq7PgxuqKyspfUavDUpGNOb1Ut5wRPHv5J2LXH5KPNeqIpilxEFxy2A
 eZgMYKuNhKF/HEzS+i70++DpVITuigE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-_kXudrFKO6eYG8qalivdqw-1; Thu, 14 Nov 2024 08:27:03 -0500
X-MC-Unique: _kXudrFKO6eYG8qalivdqw-1
X-Mimecast-MFC-AGG-ID: _kXudrFKO6eYG8qalivdqw
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d56061a4cso370893f8f.2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 05:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731590822; x=1732195622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKmNwUQm6N8OZ4WFnBjPn/L9WzpJEfMJhrvQsiWkang=;
 b=H91gr15U4Z0p995zcryg4NPDHyF3Lj8cmfMEjJhaiXSukAsUuwzesIzU8Omi3ZlFM0
 wlDFNwZwtCTnw27dn2uXZUV67tzPEH3exGJiQTFGwrx7DrtRCxMW2SWO8eKLFBMnkOkC
 LoWIxNjO12RT+nhvPZVHYQ+zq5lknmM8uUwd9Urw5rvYg7EXedJAX8x59KPwhfJBdpEH
 cMePLk+jP9uOdY4fFcF07QDw2VqC4a5vPUUntf8dPbnrggLA7nMmOSbwebzjKD4oxVez
 Xv3dKP3Co+NpVCqJc85qt5mOILoVHheGSKScMb2LaNO6qA2AOSjsTcMHfdOK4VNs9ykO
 6eiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHK38uewbRQi3Wr1AA0KIuCU2WTgJpjNVj7rutk6Nb87iHcfX2KSPKKG3S4XW+rOLca/5YMBLDIw==@nongnu.org
X-Gm-Message-State: AOJu0Yz6dGBkGbZsnEIMNaSCZ2uGIYIJ9cwcaBweA5JLTeb6YmvPwQ4W
 BQ1Hgt82LOvbmm++kKDNz/bomK6ee1rWQYyxumK0tJlDde1at80QeXvsZJVfDll29vHlMd1Wdoe
 Zj3MtQq2RnE2Ba6YB0o6Q29VBNskPIDQNmtm+yXice2pHvnKQVJ3JifNsKl8G+6D0hcEkclzSV5
 huZ+hWfUS52yupZBF7yJrOgmYC
X-Received: by 2002:a05:6000:1567:b0:374:c17a:55b5 with SMTP id
 ffacd0b85a97d-3820810fdb5mr9327362f8f.14.1731590822135; 
 Thu, 14 Nov 2024 05:27:02 -0800 (PST)
X-Received: by 2002:a05:6000:1567:b0:374:c17a:55b5 with SMTP id
 ffacd0b85a97d-3820810fdb5mr9327293f8f.14.1731590821354; Thu, 14 Nov 2024
 05:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20241113142343.40832-1-phil@philjordan.eu>
 <20241113142343.40832-2-phil@philjordan.eu>
 <c0983059-ab11-4bc5-ab60-c5b23d1c290e@redhat.com>
 <CAGCz3vv+5y=YGqZaXnGkVj0zA9fX-n3BOZyuPQC+dRMKN8VJZw@mail.gmail.com>
In-Reply-To: <CAGCz3vv+5y=YGqZaXnGkVj0zA9fX-n3BOZyuPQC+dRMKN8VJZw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 14 Nov 2024 14:26:48 +0100
Message-ID: <CABgObfat1JwiBFNKHK6wwMkW5kgaqZfKJa=rW_9VvEdMWJR75A@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] ui & main loop: Redesign of system-specific
 main thread event handling
To: Phil Dennis-Jordan <lists@philjordan.eu>
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
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FT09sJ7M-EMR9D9xvPJz1jsuYd7JpbqgypxXrQsQcZ0_1731590822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.69,
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
X-TUID: ljgm6neJDnrF

On Thu, Nov 14, 2024 at 11:32=E2=80=AFAM Phil Dennis-Jordan <lists@philjord=
an.eu> wrote:
>> I checked what GTK+ does and, either way, you have to create another
>> thread: timers are handled with a CFRunLoopTimer, but file descriptors
>> are polled in a separate thread and sent to the main thread with a
>> single CFRunLoopSource.  It's a bit nicer that the main thread is in
>> charge, but it's more complex and probably slower too.
>
>
> Just to clarify: is this supposed to be happening inside the GTK+ library=
 itself? i.e. GTK should spawn its own thread to poll file descriptors that=
 are owned by GTK? (As opposed to the file descriptors used by QEMU's own e=
vent loop - what on Linux are eventfds, but on macOS I think are just pipes=
*.)

It's what I saw in the GTK+ source code.

https://gitlab.gnome.org/GNOME/gtk/-/blob/main/gdk/macos/gdkmacoseventsourc=
e.c?ref_type=3Dheads

> This doesn't describe what I'm seeing when I run with -display gtk on mac=
OS. There's no extra thread created. There's a dock icon, but it's non-inte=
ractive ("Application not responding"), there aren't any menus, and there's=
 no window. QEMU's own simulation is running in the background - I can reac=
h a guest via the network. So I guess there's some function in GTK we're su=
pposed to be calling that will make it crank the native event loop on macOS=
, but this isn't being done?

In theory it should work, with the event source added as soon as GTK+
is started... aha!

We do not use the GMainContext's poll_func, we use qemu_poll_ns.
That's the missing part: GDK replaces the poll_func with one that
calls nextEventMatchingMask:

https://gitlab.gnome.org/GNOME/gtk/-/blame/main/gdk/macos/gdkmacoseventsour=
ce.c?ref_type=3Dheads#L767

There could be more issues, but I think for now it's better to block
the GTK+ UI under macOS.

[...]

>> As long as it's clear that any handlers that go through the CFRunLoop
>> run outside the BQL, as is already the case for the Cocoa UI, I see no
>> problem with this approach.
>
> I'm not entirely sure what you're getting at here, to be honest. The UI t=
hread can definitely not assume to be holding the BQL all the time; we'd ha=
ve to treat it more like an AIOContext. It could pave the way towards putti=
ng the display and UI subsystems on their own AIOContext or AIOContext-like=
-thing, rather than hogging the BQL for expensive image operations.

Don't worry, I was mostly talking to myself... The UI thread, and more
specifically any handlers that are called from CFRunLoop instead of
QEMU's main loop, will have to use mutexes or bql_lock()/bql_unlock(),
like ui/cocoa.m already does.

In other words, code that interacts with Apple's paravirtualized
graphics needs to know if it runs from the CFRunLoop or from
qemu_main().

> (*By the sound of it, Win32 has an all-UI-calls-on-one-thread requirement=
 as well which we may be violating to some degree via the GTK and/or SDL ba=
ckends as well; my adventures with Win32 are almost 20 years back now so I'=
m a bit out of the loop there.)

Hmm, no I don't remember anything like that for Windows but it's also
been many years for me.

Paolo

