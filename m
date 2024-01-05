Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp762506ejo;
        Fri, 5 Jan 2024 06:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzM/TPsW4Q+6UGqK3o3dXY96HdLIk/PpHLPIhfE5ypSoJZP/vQikXKWtOVjW8/3HRa0JOH
X-Received: by 2002:ad4:5bac:0:b0:67f:39f9:32e9 with SMTP id 12-20020ad45bac000000b0067f39f932e9mr2279515qvq.82.1704466716313;
        Fri, 05 Jan 2024 06:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704466716; cv=none;
        d=google.com; s=arc-20160816;
        b=K6T0/AfILIuEbHXvXs0gF6rwzUv+xhu9lxa0Y5MVkcr2HvG7B4nsLQ9ejhR+xz3QWL
         koENpBTM5c6rz8xUP49GeHsWNQrW4Aasv6ETknhcj9MWfKpO76c11p4zuD4R1ok9rY6l
         mkDYjJfK084klK7PtsrOmWUcuP9ywU5l97cnk0xcf4PC6oUUHD/Iau493iccStS8An5L
         q5MhSBI/ckIXkFf9SJQb0RHxdwXtGlCJQsqXm4fDDa2z8nd0+cRggKkcmokb5Xm6KYqY
         RVsSWhqoTYtbvg+iye6QBDDPI1dCzp+wDKFoSaaA1hfmxuXwwRfwbGuVBEyCkIwR19ar
         O/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=itu+JwLJHwRCZPfVP49tBSwhZMj0Z3KwKhApjwEVvng=;
        fh=HH0wEvt0upJleKhGnsnu13PpP3dGDLA1Qg6X4FBsiB0=;
        b=IkWbDXqrh/QdE5+QZ/26FBqJIVCBY2EqkZeccXdBR6hFY+UX/00KijJIUoN5HcHFNH
         IOzbcD4ws+AgzvsW3ri2pdAik04lVhiUcasi4Nfwk5S4gIIgu4AyvPNZIlE5Iv5rgKCM
         FAkHZQa/qBEGFDv2iq0uzBjZm3M0mln3rpHHpGHr5AnlrdkriBIQSDv+uCpuhFOG0KLL
         jfrJry7x0RKAwbxS07KQTYa3C6yqjhoWe8lCBB7ORqTfEfgh0m+f6nZ6eV8kkntIOs4r
         2C2zfp2UwwdIuFmFcj6kEWS7xMKOJjhS7QD1nk0J9OIspmfBUdKzqO/ZwgF+LA4hnljZ
         iIPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcuvsORT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020a05622a110e00b004280329c06bsi1895046qty.118.2024.01.05.06.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 06:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rcuvsORT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLleU-00085c-9o; Fri, 05 Jan 2024 09:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLleH-000827-Sl
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 09:58:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLleF-0003KA-V6
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 09:58:13 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-555144cd330so2129608a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 06:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704466689; x=1705071489; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itu+JwLJHwRCZPfVP49tBSwhZMj0Z3KwKhApjwEVvng=;
 b=rcuvsORTH5DqJ5Ig/asI/1tUfyLu8v64OW15uJIep9mWhx/msPZCExr2pTjLtaEWak
 GxXoJZgvr3Fr6EjOPLWZZ34KelKyBu0LuxJqaMauX5UHh2688koR9FrHz0x/FceY9pdi
 NMtxT7xonKQLRkj5ZAA7ePImmPrzDf9xCBBLnhxiocfUWpUv2m6WSZS8V295KAooaBKD
 8rIi1SWOKWEXast48pwODjvxfXCjBM6377HlmGv63uzwZbR9bvy2uGMtl2IuswSK+WNQ
 HrgSyXaXcU9eipyEYG0nrnF9+B6/VwN7soXLnWuSkP3PqBJJeBD8vFhb19Jrg4RM7IbI
 mMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704466689; x=1705071489;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itu+JwLJHwRCZPfVP49tBSwhZMj0Z3KwKhApjwEVvng=;
 b=YsJuS0x5n8worCnDPL/N/dGqc/0cG+SQs6JKp9r4VDWoMZdVtqW1zPW8KpsYe577bZ
 d3+iZOUTP1aP7QtkQiUHdCK1qELRifOeweqY0/bZ5bdhvu7t5iTYibbqwBMhaknDdB8a
 NBLCE9W6991nBJAjENsVSrAjGc+T7VSuyeMOnbhTnxXBHGDVBxmPoujQNIBoTNmqC9So
 dqu6vEm0D7/hnS5uMZ0bEVh3N7T95wEIY6VyMcCv/4ptoOxNAAssV1F/P0SM/xshhWA6
 kWt2JuXtQ2UCx6DTrBmg2x/7LSWBk+mI7tMlgj+gi52NsGkrIg70SqqelBzZIGVFs3vA
 f48Q==
X-Gm-Message-State: AOJu0YySNP8ktck35buC0Fx5xSJi3zle/Xr5koBVOW6TDtnUzGMuVMMt
 dtQZa/HSiHVb+IFNtmoxqgywoQ7ZRjZFxFuAJvdEhqQO8uIN+g==
X-Received: by 2002:a50:9354:0:b0:557:1af5:d4e0 with SMTP id
 n20-20020a509354000000b005571af5d4e0mr806678eda.63.1704466689281; Fri, 05 Jan
 2024 06:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-4-philmd@linaro.org>
 <4h38a.h95poe276hnn@linaro.org>
 <af352e7d-3346-4705-be77-6eed86858d18@linaro.org>
In-Reply-To: <af352e7d-3346-4705-be77-6eed86858d18@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jan 2024 14:57:57 +0000
Message-ID: <CAFEAcA_yKxnTMnfWVdXWixPq27=OVQCZ0BjRdiPfSKKhqh=gVw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 03/25] memory: Have
 memory_region_init_rom_nomigrate() handler return a boolean
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?C_=C3=A9_dric_Le_Goater?= <clg@kaod.org>, 
 Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u+emWAXsms/m

On Fri, 5 Jan 2024 at 14:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 21/11/23 13:10, Manos Pitsidianakis wrote:
> > On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
> > wrote:
> >> Following the example documented since commit e3fe3988d7 ("error:
> >> Document Error API usage rules"), have cpu_exec_realizefn()
> >> return a boolean indicating whether an error is set or not.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >> include/exec/memory.h | 4 +++-
> >> system/memory.c       | 8 ++++++--
> >> 2 files changed, 9 insertions(+), 3 deletions(-)
>
>
> >> diff --git a/system/memory.c b/system/memory.c
> >> index 337b12a674..bfe0b62d59 100644
> >> --- a/system/memory.c
> >> +++ b/system/memory.c
> >> @@ -1729,14 +1729,18 @@ void memory_region_init_alias(MemoryRegion *mr=
,
> >>     mr->alias_offset =3D offset;
> >> }
> >>
> >> -void memory_region_init_rom_nomigrate(MemoryRegion *mr,
> >> +bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
> >>                                       Object *owner,
> >>                                       const char *name,
> >>                                       uint64_t size,
> >>                                       Error **errp)
> >> {
> >> -    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0,
> >> errp);
> >> +    bool rv;
> >> +
> >> +    rv =3D memory_region_init_ram_flags_nomigrate(mr, owner, name,
> >> size, 0, errp);
> >>     mr->readonly =3D true;
> >> +
> >
> > By the way, do we want to set mr->readonly on failure? Should there be
> > modifications if an error is propagated upwards?
>
> Good point

I don't think it matters much. If the init function fails,
then the MemoryRegion is not initialized, and there's
nothing you can do with the struct except free it (if it
was in allocated memory). Whether the readonly field is
true or false doesn't matter, because conceptually it's
all undefined-values. And memory_region_init_ram_flags_nomigrate()
has already written to some fields, so avoiding changing
mr->readonly specifically doesn't seem worthwhile.

-- PMM
