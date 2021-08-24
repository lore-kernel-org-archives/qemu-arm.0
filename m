Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2849339lfg;
        Tue, 24 Aug 2021 07:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2uX16rNnW29dz+EXRbzfToYQRqRtED6XUVZSA9QR1bMhDJitptkCeMuA9mbYvpbmnYOtb
X-Received: by 2002:a05:6402:40ce:: with SMTP id z14mr19508397edb.283.1629814982872;
        Tue, 24 Aug 2021 07:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629814982; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsb366txvDNqzlSAEH5IiCtF+rUrLHzgi3764Jv/gk1nfirCQz2RQxehc7M0kExTRK
         1JFSSsrhyRa4qCCmbvqsuerG+MrETG37QjrucVVwY1PTg/2KNSK57gBy7IlqsxHcjuen
         QV/7rWFVrzphBNjO6huGvhvhD411ZoXwHop3ieT8Hhrb1JyeJKrEZ7Nv42QgLOzxW/NL
         gbo+dPUNibnAphYvQ2PV2vhVIJ+amDlEMR8KzSgjTCN16G3/uMRoi7E7YVchJgHqIPhf
         RGmmmQupOdrhnXeIrYrWWYnVsJ3E68N9tqwfSdBh7yrt4p1QBA3C2r0D2/S6UOgUnIP+
         Ltew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Tb65nKmIYz8COIR5xel1WaO1wpGGe0tNvCL3gI+CWLQ=;
        b=JCztMPu8j+P9rvvM8HWnt0E27/0SGmE5ChOZmY+9WGZi7mHj4yFcBHHFbIPTwMyILM
         bCMNA74Q4vXdjzYq31/as494jQoetPs1t0rTEmEBHsvGWz3G4N8XADbs1KrfgJeSq2QO
         FAUF1vAuDV6JCO1wRt0OFq3cH+MuEdMg07ltRxrP9ldiMN1LLpgUJGsr7PELdLyZDa5T
         DpXvBdxYuUXdC3ZvIYIHJCGa+6VHooaBd2lqXD59Ukoa0Q+MFsgjFXZzNLaZslBENi8Z
         4+g8rcsqVm4Zx4oBe9tZu9v9Mm098XsmfjCrqHxTY4iFOPogVEBualKxHEC1ROyRof8l
         67Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YhohDDVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb24si17635831ejb.612.2021.08.24.07.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 07:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YhohDDVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIXKP-0008Cv-RL
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 10:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXK1-00089D-MS
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 10:22:38 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXJz-000414-Qs
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 10:22:37 -0400
Received: by mail-ed1-x536.google.com with SMTP id d6so32047331edt.7
 for <qemu-arm@nongnu.org>; Tue, 24 Aug 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tb65nKmIYz8COIR5xel1WaO1wpGGe0tNvCL3gI+CWLQ=;
 b=YhohDDVkjad0vVuclNATWe2XD8yxRbM0J/xDZWahNj6ttNRHQ96BEGc1t4ui5HYFFI
 Km0LmdQy58oOBRG5aU/9dws6AhxBaUG3paBD0rA0KSIS0mxQ5TWpV861gwF1RwS4/7yw
 fx5FfkU/xrOEdcmMeUUaFQoVY2US9HK0EoP9rAQP6+kQHCvjzsiyXU4pzu3gBvkIEymo
 4TifM9IA5VZZqxjJSR7SbrJc/COC3VsQWf93sHml0RZRLL/j8Mj1ppTrFJYoxfmcuEH1
 8NMnsXbfzfn70JbyUEmo4qso/N22YFLrF8DEzCM/hFoLLZ2sfsVEXRnEPHF98kLuAP0C
 z8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tb65nKmIYz8COIR5xel1WaO1wpGGe0tNvCL3gI+CWLQ=;
 b=C22300W3qTxLW3xF/4TG7wvdAX1nU0O0ZfQm8zdA5T1lS4F0oaIQSvjaVqo4dx1voj
 a0AhpiDJA/X4kILObqpnjyFrs0tSrEyxUdjyVuuJWFxAk2m9VigQn/Qr+UO4BO2gxLjE
 ox0duP9mrmSgYPt6SCvq8vDLIXWTNRDc7FnAgTk8Ual3yXt/aoaF2pdHj02LEsXOIS09
 QpsV1IZvv3UzTmKQzJb4F+PsD+U26CNDtlw3Ij3OuQ8bzsxf9gBc1ilyatayo8hnVjBw
 pgGVPml0lH7GCGkdlGkaMNyxmUZpqIYvYj2TNbMORDPsmrQORxTpKr5erLjzb10kQh7M
 zHRg==
X-Gm-Message-State: AOAM53318yLpKLGEzR0nilOyPmADemQ9CNF0ART7M6fsyG7LONneG0Iu
 RQ7NBzVuOxSAYkg1M0w1XzSARB6UHJNXH7HsqBVKcA==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr43007324edb.36.1629814953870; 
 Tue, 24 Aug 2021 07:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
 <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
 <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
In-Reply-To: <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 15:21:46 +0100
Message-ID: <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmByKhtos4lY

On Tue, 24 Aug 2021 at 14:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/24/21 3:15 PM, Stefan Hajnoczi wrote:
> > On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Check bus permission in flatview_access_allowed() before
> >> running any bus transaction.
> >>
> >> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
> >>
> >> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
> >> using it won't be checked by flatview_access_allowed().
> >>
> >> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
> >> using this flag will reject transactions and set the optional
> >> MemTxResult to MEMTX_BUS_ERROR.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  softmmu/physmem.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 0d31a2f4199..329542dba75 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(Memo=
ryRegion *mr, MemTxAttrs attrs,
> >>                                             hwaddr addr, hwaddr len,
> >>                                             MemTxResult *result)
> >>  {
> >> -    return true;
> >> +    if (unlikely(attrs.bus_perm =3D=3D MEMTXPERM_RAM_DEVICE)) {
> >> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(m=
r)) {
> >> +            return true;
> >> +        }
> >> +        qemu_log_mask(LOG_GUEST_ERROR,
> >> +                      "Invalid access to non-RAM device at "
> >> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu "=
, "
> >> +                      "region '%s'\n", addr, len, memory_region_name(=
mr));
> >> +        if (result) {
> >> +            *result |=3D MEMTX_BUS_ERROR;
> >
> > Why bitwise OR?
>
> MemTxResult is not an enum but used as a bitfield.
>
> See access_with_adjusted_size():
>
>     MemTxResult r =3D MEMTX_OK;
>     ...
>     if (memory_region_big_endian(mr)) {
>         for (i =3D 0; i < size; i +=3D access_size) {
>             r |=3D access_fn(mr, addr + i, value, access_size,
>                         (size - access_size - i) * 8,
>                         access_mask, attrs);
>         }
>     } else {
>         for (i =3D 0; i < size; i +=3D access_size) {
>             r |=3D access_fn(mr, addr + i, value, access_size, i * 8,
>                         access_mask, attrs);
>         }
>     }
>     return r;
> }
>
> and flatview_read_continue() / flatview_write_continue():
>
>     for (;;) {
>         if (!memory_access_is_direct(mr, true)) {
>             release_lock |=3D prepare_mmio_access(mr);
>             l =3D memory_access_size(mr, l, addr1);
>             val =3D ldn_he_p(buf, l);
>             result |=3D memory_region_dispatch_write(mr, addr1, val,
>                                                    size_memop(l),
>                                                    attrs);
>     ...
>     return result;
> }

In these two examples we OR together the MemTxResults because
we are looping over multiple accesses and combining all the
results together; we want to return a "not OK" result if any
of the individual results failed. Is that the case for
flatview_access_allowed() ?

-- PMM
