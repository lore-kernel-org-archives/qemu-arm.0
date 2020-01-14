Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4904655lff;
        Mon, 13 Jan 2020 18:00:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxGrHMStpzYywfiLVqHlM6xrvOjNqNJTDErNHU6C0NIGIto7Fm2jXevNyfuPHA7otEpMrT
X-Received: by 2002:a9d:21f4:: with SMTP id s107mr16192606otb.102.1578967259583;
        Mon, 13 Jan 2020 18:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578967259; cv=none;
        d=google.com; s=arc-20160816;
        b=wCDO0QX0B6IOldtMEyD39LVjAeovaCgTQvF/HEE9aXvD77yPl4koM7ZnlL48cT0z24
         HlOeIZYOtaZMRalgJOJOrBh+wFH7l+ScgpAdQzhSqzWW1kkbwD+w7NzpgTI9DQik4ANP
         Zl2hhRQMbjxZmVkuog5qvcl5rDden6omPSb/TILSr0+E8yCsYs/Vyi2rYCNYmFyvVmg/
         7C0ZXzvDyuKFRVrXg0OHZVNg6ala7S9NdX3GrAg4XHcvkOK4sRihiJaCgLD2JrMyl11+
         reUzadS95UpaTfa9L/Qf5sn+6dbGMlOFmATT28AsyRU6OGIon2s2+DWuDnqkhgNSxqnU
         qqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jIOw/CbzXybkeMH1o84BTHPma96iahA5s5mXf7EbPk0=;
        b=hkFARasO+vpyQGa5A7K569aVfeKDV0KzjRNPycaM6nKaqwMa8VXZkcDTlJw/Tzpipp
         4VT/Qjkq18LzBd4K0q1yPkk/e5cpae+LW0YaB+7gS58L/hKqHp8s+RqO3IsuNu/or4On
         32G5C1FO7xmi9gz8AIIjk/LKFGnpgvpuUzDYxB8DWGHdFUj7cR0oe65yRSi61yTOD2KZ
         YRG6faCe/vAF/3lzLPv/59DpRc9NhHENCo1eJ6nlfoSADrUUHun6B0+Q/bhUzmYmtU54
         aY/KT0qJakR7VCOCzNTvUXKiipuErGf7ucuK/MVqDV8HqfGQEhjgbWv94pVkdh2gO7Zi
         xkeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="F/2EGDDC";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v21si9916393otf.87.2020.01.13.18.00.59;
        Mon, 13 Jan 2020 18:00:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="F/2EGDDC";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgANCA6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 21:00:58 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44273 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729427AbgANCA6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 21:00:58 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so8465738lfa.11
        for <kvm@vger.kernel.org>; Mon, 13 Jan 2020 18:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jIOw/CbzXybkeMH1o84BTHPma96iahA5s5mXf7EbPk0=;
        b=F/2EGDDC2WMeINqtbvPOP6hek9GQs8wGt5hGy2hjzrUb+9ElYoc0NdDXkcStJx3NUM
         dY+yg5+BJY9/galzSJ6/BnzwwDlHVHm7vY+3lCjUlap+A/NRZyB8XrhB2CbucKLr2ICo
         NXi6qbwodf9FCH/h1Rgs5hAULbEk5h+wWwdJXAffR9ukxUykbQ0ClU687A0xvKGB0dxM
         3GCEOgcMaPrcOjCyPGKR7kooF/lagCH882ycJtKvvAY2qhCQ1V9UdwNECGVZffPyZRqc
         XGxqgretv6V6c/cs1s/DYMUqTDmAyTXxO6CZvHp4yBtmdAThPBr7BjDDZBwAIrbjY8Ug
         XBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jIOw/CbzXybkeMH1o84BTHPma96iahA5s5mXf7EbPk0=;
        b=FBIzndNjcafHvOWCyQ2HelFxeK9l/6vFqUPlsBVZJOhlksgq2QnPva86/0llg+d7OW
         2YedV36LjAc8sOfbiTmUiuoXESGy5NpZeNm0pSXtte30v7kkbS6rlS87B1WeIlpABDvj
         mTB1xPLV0rTTgZJ9IQux0Dynw9HSuimKWfDQvM8frG/8J4xIXX46M+9awvVDP6EMjMRq
         kqXllQwxo5gdgxno2CVzSV9/BjQmxyU7KwRy3+M9W5v5VtCS119n5EY7vgvbNs+zeWxS
         dj+S36liJNsYueEi2oSxmLdHxkkR8pUpT5eIUh055oxu2CZdHrDXPvf0WZRwy6fwnVkv
         bQPA==
X-Gm-Message-State: APjAAAUKPm/KUyZydym7l1ejqNpa8EmbbVsovMozvNI0Texblo5BZVls
        bg6r9iAjpepSXu7XgT3G6jmsjwA+nEQIjgGkWHI=
X-Received: by 2002:a19:4ac2:: with SMTP id x185mr215459lfa.131.1578967256625;
 Mon, 13 Jan 2020 18:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-16-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-16-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 14 Jan 2020 12:00:30 +1000
Message-ID: <CAKmqyKPZ-=Njnv9KhS7yN_UE_Cij_eD=uUxdKhB5r8+dddiCyg@mail.gmail.com>
Subject: Re: [PATCH 15/15] vl: Make current_machine a local variable
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
X-TUID: xmGsRX5uFnZp

On Fri, Jan 10, 2020 at 1:34 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Since we now only use current_machine in vl.c, stop exporting
> it as a global variable in "hw/board.h", and make it static
> to vl.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/boards.h | 2 --
>  vl.c                | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 61f8bb8e5a..b0c0d4376d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -59,8 +59,6 @@ void memory_region_allocate_system_memory(MemoryRegion =
*mr, Object *owner,
>  #define MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(MachineClass, (klass), TYPE_MACHINE)
>
> -extern MachineState *current_machine;
> -
>  void machine_run_board_init(MachineState *machine);
>  bool machine_usb(MachineState *machine);
>  int machine_phandle_start(MachineState *machine);
> diff --git a/vl.c b/vl.c
> index 3ff3548183..7a69af4bef 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -214,6 +214,8 @@ static int default_sdcard =3D 1;
>  static int default_vga =3D 1;
>  static int default_net =3D 1;
>
> +static MachineState *current_machine;
> +
>  static struct {
>      const char *driver;
>      int *flag;
> @@ -1164,8 +1166,6 @@ static int usb_parse(const char *cmdline)
>  /***********************************************************/
>  /* machine registration */
>
> -MachineState *current_machine;
> -
>  static MachineClass *find_machine(const char *name, GSList *machines)
>  {
>      GSList *el;
> --
> 2.21.1
>
>
