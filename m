Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2864917lff;
        Sun, 12 Jan 2020 01:48:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyTteH8Z4VyffvoQOWu4tipTRghNh162TVlW56blTrvv0oi/UlHzR4lKP4knAbr8YcxNkt
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr8674759otk.201.1578822503608;
        Sun, 12 Jan 2020 01:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822503; cv=none;
        d=google.com; s=arc-20160816;
        b=GzV/lr+xMhf+WnI7vQocyai8owZ5iW/GEquewQ6lUuEDPji7Tjyr7F3InJOBHB5fZl
         zMcXQci85CsPR7AM/U/TZPfXFidsjjYfkv7vomMo/h5Y8wIDdGeexW0jEE1LMhq7gC+V
         Wghn2r1+fyqwfCOA5AmzY9AouI++ApZ4XhjAk9hp4ZaOQEdcai/FyNwVtZt6QrwJZbhQ
         w3NZYSi//13DT/B7X4ED6GGy+F366oQdyDZnlU+jwxRsJZC8LRmj7GZmuO0+2WIgfmOt
         mJ5A0YtGcLoilHf6auQhxJnWeTvVMM3gHCglm08JxHRr8Nfi7CyzoJLkboCRYhUthoi0
         lYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6A7m8uUuskjk4YfDXph5Jgqp4FV13cMYZFjnVcCuU7M=;
        b=jOUrEWMksHsinhhvRU2Qd9HpZI6IYOBCOHKTzS5nrikRGD9tI9kELRdEZc+Pe9cZ1M
         qJN2DYyvg6ysfcbnYoym48opaHraEHujKWLh/lGajSXtDT9pd74QQ4/R/u+54z5WW6D4
         3j+zxZujLTj5Leo9F7Xi0/ahPV8bqKg1lQJnlrkqp9KqUw3U8VZKq3hP47BxyfvgFKJL
         LFTCpTXR0batBlTcr7km6kS0ZCA5qVbws52Qj385jw+Au6p2OpkvismtaUOl7iRafFiF
         TZDS6LW/AHm5whDUqndkyA5tQoylUWsHbddp2mrO56mtAcMYrIvS1DwkKwyxvSh7Q7FU
         GNhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iKOX3vVx;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f187si4401607oia.218.2020.01.12.01.48.23;
        Sun, 12 Jan 2020 01:48:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iKOX3vVx;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732531AbgALJsW (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 12 Jan 2020 04:48:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35087 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgALJsW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 12 Jan 2020 04:48:22 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so6738660lja.2
        for <kvm@vger.kernel.org>; Sun, 12 Jan 2020 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6A7m8uUuskjk4YfDXph5Jgqp4FV13cMYZFjnVcCuU7M=;
        b=iKOX3vVx4v0vqY89u18l3f/O8aaFVZACifdHS0HkCeg9jvY4igvjG7zFHsUAU4UqZs
         5+DQZU+AN9vrz4MLav+6hZNq/8tt9s/yhSFeLcJn9CyLDQGKK1th4oIy8xHl0ryMXH4y
         /mbAu7hW2dNI4XR5FJANO4R7ig+0CebYjweHVUsEe/vmLpQT4HCBMRtpwy2RG9lWXgmM
         2OWt032JzrBBcWnR4YbQsa8VwXrv+TpCBJjNiMC9ngYd3PNXADpNeqI3XNTNuuAgtVwt
         csECqcs0NY3wylQiIbc1XdM20B3x30XfLJcL6TIkj/a1cVQtTgUaf9XkaOicGbpub3vQ
         Efpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6A7m8uUuskjk4YfDXph5Jgqp4FV13cMYZFjnVcCuU7M=;
        b=j41qzy8C7S4HI5QI8x35W8QU4SgAgl/jS+l9kx1MSOrEmNmG2/FxSPkEh2i03LIrq/
         88TX5giNbmcK2O0ua8J+xmQgK1/zFT2ahCvqDbRb8j2y4LmcEBi0giM2BovwwD+M6NwX
         DT1qPDoAaZ/P5h6tPEauLntiKDLRDaqmo0mCLuqD2cjFbAiIahO4KJLrWWsEfS2ck4UB
         UrvhREXY3AMhCkG7fOIFKBYjXU4SvBUjm9vqUiSASkCDPSrqZcipYOIdfTq0F9GZAurL
         DUGSg/nLPwZVa7wSRfEUOWmaRGP7znTTt/B/AVVlKOYrW3vWDkhiDGuVD/vkjZ7wettK
         OGZg==
X-Gm-Message-State: APjAAAXvMeedZ9lJKBkKBm3GApjvvLyhh1JvkFKaZ7iXbOlK5MnAqSiS
        k63oqiXfxtB4Sz4n77wqg+Zku53jDIIPwdukhLa/d7bN
X-Received: by 2002:a2e:8755:: with SMTP id q21mr7697606ljj.156.1578822500350;
 Sun, 12 Jan 2020 01:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-10-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-10-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Sun, 12 Jan 2020 17:47:52 +0800
Message-ID: <CAKmqyKPyBp84HN2ARaVKZH7a1ebho9LnK=D9Bj=cpiajx6Lx0w@mail.gmail.com>
Subject: Re: [PATCH 09/15] device_tree: Replace current_machine by qdev_get_machine()
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "open list:Overall" <kvm@vger.kernel.org>,
        Juan Quintela <quintela@redhat.com>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: XcqrEUosLiUj

On Thu, Jan 9, 2020 at 11:34 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  device_tree.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index f8b46b3c73..665ea2f586 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -466,7 +466,9 @@ uint32_t qemu_fdt_alloc_phandle(void *fdt)
>       * which phandle id to start allocating phandles.
>       */
>      if (!phandle) {
> -        phandle =3D machine_phandle_start(current_machine);
> +        MachineState *ms =3D MACHINE(qdev_get_machine());
> +
> +        phandle =3D machine_phandle_start(ms);
>      }
>
>      if (!phandle) {
> --
> 2.21.1
>
>
