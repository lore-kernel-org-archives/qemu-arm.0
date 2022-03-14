Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2248790lfo;
        Mon, 14 Mar 2022 09:08:27 -0700 (PDT)
X-Received: by 2002:a81:1202:0:b0:2dc:304d:11c1 with SMTP id 2-20020a811202000000b002dc304d11c1mr19120313yws.401.1647274106778;
        Mon, 14 Mar 2022 09:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647274106; cv=none;
        d=google.com; s=arc-20160816;
        b=qHfCWxc0k/EUmBxVvbTxZhRYbgafTTduLjvn361hwE+dCZVhNGR+OC8KYO9/iwE6qo
         F2MCFVh36aHatim3GQMXwYg2DdEFK2KrvnNvq1X3f2P6rq9dkKqY4vOeRQTUbrSExNHb
         SDmWtS+su3wM2bdgqLRqWmvQuFDOgvzDcMsY3RsF3Z3rxq1PmNyl/7zS+EcKBV1dPRfj
         pCdEqom+8OSJh+NKieHHsabEN7w6u5H+ncJUGrlZQ7/+tnlhqNntZeIPEzkVKTRJHFdl
         fySLZJ0L5e9F1X7rSCanTxJ1ddFOnuqjVxCaqPDMP46x7dHDfRocNsmipGIEssPKx5iz
         hLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
        b=w5+J+OX77aYdoWcBzdY4U1VCtLc8gFDrQ8ngX4uTguYrzoQ6BPKC3D7rGYJ0xNgMmb
         6hXea4h91aIuKRWm/RvshSZN4o3Vv+oP7Hze7WHbwEo9z5P9q0iIr7IX4oUuvFL7Px6O
         hzAgFnxEJUnFrAAcka5r8SYX5Hwjejz/ZZAyoo3mcbhVozVlUaH+0YWXt/ibZ7q043PE
         lJZnavTKZlJ+CmKmn6I2B+ZWFjl9ZoANN3S+qavtf3zHLP2zC50JB8JAENto54e+HXHZ
         J0SlX3bttdKjBAn3iPmodJEnbMD7qN1O4+oLcey2dKp1H6mjcNPOel6iJoFBxNEWCREQ
         YHjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SdKfd/jb";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n129-20020a257287000000b0062441fda5acsor4948096ybc.90.2022.03.14.09.08.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Mar 2022 09:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SdKfd/jb";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
        b=SdKfd/jbfGl52GQYetUtYUdEOsWHs/OwcXpH/I1S9dZeNmPMmDUjhk4fg2k0fckDY0
         t23UvUz0VX5KFhJVhe9QE4pxDN4WgSxdl2ub9UvFNGfWLksZPY3qve78zZUa/T+keflA
         4AqyVh/8j+AuQSOjaa97O9K94KoTPLgUsD1vsKJvk2RgSco0dDjxktClnkVR6rNfUD1j
         zklsyhplOXYFaLqTldx9pYgtu++atT9y1Dw4Ghx51Wl3kAxno8itR1Ko8ofxlm++dFis
         qihdx8K0f1b56+t1POBlkbGHXwMXu7ECfibDcuW0asoel4nuFfOu+/4Uh3pw02Ppe5lO
         w2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
        b=rrOwpEfhOv5EcWY9uJOUjGgRvp2Oep5wk6fpiENR2MmeIf2aSg5t4kGjrfVN7+lklh
         aj3ZtT8vPcWG/4TO2MIMplRzH9zzdB6k+ep+91m0QJgBPkqg0O2oyNsIGS7p+xjRxEqO
         9ND4SfYMPGRiD94RFvYSC545yIBT5QHuBHJs+iblP1JFu0cuUsRHpiaKT8i69xgNoheF
         smCvY/guNzYzXuJ0/dbdLiwC6CyTO9bm4i4A5+aJ6NWxC0NF3ba03fcZ5eiqIsf2Rvmh
         GWukhELMLuqn1595tWSel9PQcozBQTu09yBuEdY3i3dvWhoFa5WyX5G22yUaNg0ZX9XW
         z8hA==
X-Gm-Message-State: AOAM531yiFA7XH8InsjQazLuRPtpjNrpmzD81BXBmq+Iyu6yMA8JE3ly
	o0kFLxsCe5z8jZavlrkZbSkw0b5D31NEfQ77MDOyel/D
X-Google-Smtp-Source: ABdhPJyW6M/Aw8hf4XdJy6WjUtmqQsp6CbpUtiBE5nkkoLRyKFw/dasDSxXiwKCdKxH3YAqMGp/y61XBal4OddxiDeY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr18269446ybp.39.1647274106395; Mon, 14
 Mar 2022 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220314160108.1440470-1-armbru@redhat.com> <20220314160108.1440470-4-armbru@redhat.com>
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 16:08:15 +0000
Message-ID: <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>, 
	Patrick Venture <venture@google.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, 
	Klaus Jensen <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela <quintela@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>, 
	Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, 
	qemu-block@nongnu.org, haxm-team@intel.com, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: AkRPH8abo5ZR

On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
>
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>
> Patch created mechanically with:
>
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>              --macro-file scripts/cocci-macro-file.h FILES...
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

>  104 files changed, 197 insertions(+), 202 deletions(-)

I'm not going to say you must split this patch up. I'm just going to
say that I personally am not looking at it, because it's too big
for me to deal with.

-- PMM
