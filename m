Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2865720lff;
        Sun, 12 Jan 2020 01:49:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzn88mqR0CdN3aEDgx60Mdz1dFxFFM+4q9xdEufJJMeuMDxzqdTE75TGk0+J4PrDyXilzjx
X-Received: by 2002:a05:6830:1c81:: with SMTP id v1mr9633762otf.83.1578822570633;
        Sun, 12 Jan 2020 01:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822570; cv=none;
        d=google.com; s=arc-20160816;
        b=PT36xFRhoAMcJUG9zanfZeBaIk4n/MbYgk4s3kWqij9bf3K1aLXwxtXjDb/Sr9XrA1
         2coGcfpeZIKliOj/DLbAZ24UlHle38SqKyBzNvCkHnd2f9VodBBM5TdeC9QxAWsZAFSJ
         +kuJcliPfbq/aMVgr3QpsqduZcPdTpfIAc1Q/AgV8VQ56ZSEai4h8X8c3yRdTRapxjR7
         tO9TquwP/fWahgrSa3r9wUKDWEitiul+lDPyRayndhtOSym3yrDKQV02stw8vgad8Eq5
         uelYR8OSaB9zKT50KiXAH+wG7fYhPJT3HLhh5Q3dnQsdOWjcYyUZxf6PXmlcHNBayNPJ
         MljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gFJu0ECQYPDpnOY6gf8MGQ1UvMvuAoTJib9HaOc9GXQ=;
        b=OVWF5IUOQUb2ZTb19fjPJxFhjKN9o/TSyWOCxfeY25K/+Rb3b23dLqYIACBi24s0G2
         DLqzMz9DJQ+XPse8GV6g8a2NSIuy21yAu+TCzVCE/nG4T8eXzYC/pjv+vR07LhG5V4JO
         VH5MLz4W6qYRaQ7JzA127dF4RishipogwoQlKyRJQ4DGSA+z+4RCoH/kGGP9coGBT0oe
         5rq9cRmWFf1mICMpkmQiBpKzNVTFjmYryf5CMvYJeR05GSiC481E1HgpBag8yCzTQHdR
         61YyQS06cyu3h7CzabgblV3TG5BuSPRHvYnn+THR0RBw8b/EXTHsIej87JIUPyfRqteb
         hP9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cpWz+GXZ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z12si5486474otm.189.2020.01.12.01.49.30;
        Sun, 12 Jan 2020 01:49:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cpWz+GXZ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732533AbgALJt3 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 12 Jan 2020 04:49:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45650 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732381AbgALJt3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 12 Jan 2020 04:49:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id 203so4692055lfa.12
        for <kvm@vger.kernel.org>; Sun, 12 Jan 2020 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gFJu0ECQYPDpnOY6gf8MGQ1UvMvuAoTJib9HaOc9GXQ=;
        b=cpWz+GXZHIjC9AHIUR8spRUWa7LF2oEfJYja5QUKfDA21ScagU0gJWDXznfVZiwP6Z
         i6d7yYztKEm5VOY1zAobQ2PJP4wiIWY1CEej3HOp4jix6w1pSFWEGv0BuKmh4r2NssGI
         PtDNX3+KJ4aEG90UZ69Hnzs4K0UCR8MfW1mdhTYX1zYEJxcK6q/xcbAwWtd/zP4Q0yIq
         cv6Pxh1fbV6rOykH8J9ojGIERfWXdSBdwL32gKpqz5as5oBdrkTeGwwaIjinXMp4bPPC
         sdjqrdakNAec54187FCuKHuAOlQeghe2sbhPFS0d/7U717ljqVO9coZMakqNPQlycQ2f
         IEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gFJu0ECQYPDpnOY6gf8MGQ1UvMvuAoTJib9HaOc9GXQ=;
        b=FgHYvKqYX51eLXY4cRcTtniAk4K/96sCMsWlzcN8hS0zL4Y6+F6cK0E+TDI6drBp5f
         ACSs9foxUJI+Mc6Ng75w+/TnZjQJodgogwkTrlDbJGM4SSsRg3nsljUgLwUnE9KT/qyK
         DQTrD1YPoPErPycSx8kOjDIOuiPvryro1egYM9A+Stc2KwIj6W41ERQIKVMaLJbh0ASM
         /zrCACCmzIosj9cFTuEBKeFPwkZson+VzQ28RGQY+FhJAp+xpepmyYlMNiDwSOt8PC9L
         9FnsRIVymHMhGpLjikK71s64YxU3wvhN56IUzRJtHOqj/KZvdM+iL7kKpjeRXtBF42My
         oLXA==
X-Gm-Message-State: APjAAAV4XUivR931eq9ZfBCusA7RpoxRFdqRDaM31waj0ZjGce79i1CB
        HD2ZMlAEjjeFg5Sd6lBfxaYPXkyxAhdiJ/Pix0w=
X-Received: by 2002:ac2:4834:: with SMTP id 20mr6382556lft.166.1578822566702;
 Sun, 12 Jan 2020 01:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-11-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-11-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Sun, 12 Jan 2020 17:48:58 +0800
Message-ID: <CAKmqyKNrgTbiipNK1wrwCMqk_=7cJmc4rBwO1zxjFiVV+TRSgQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] memory: Replace current_machine by qdev_get_machine()
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
X-TUID: akaDGWh8c8oK

On Thu, Jan 9, 2020 at 11:29 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  memory.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/memory.c b/memory.c
> index d7b9bb6951..57e38b1f50 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -3004,6 +3004,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
>      int n =3D view->nr;
>      int i;
>      AddressSpace *as;
> +    MachineState *ms;
>
>      qemu_printf("FlatView #%d\n", fvi->counter);
>      ++fvi->counter;
> @@ -3026,6 +3027,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
>          return;
>      }
>
> +    ms =3D MACHINE(qdev_get_machine());

Why not set this at the top?

Alistair

>      while (n--) {
>          mr =3D range->mr;
>          if (range->offset_in_region) {
> @@ -3057,7 +3059,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
>          if (fvi->ac) {
>              for (i =3D 0; i < fv_address_spaces->len; ++i) {
>                  as =3D g_array_index(fv_address_spaces, AddressSpace*, i=
);
> -                if (fvi->ac->has_memory(current_machine, as,
> +                if (fvi->ac->has_memory(ms, as,
>                                          int128_get64(range->addr.start),
>                                          MR_SIZE(range->addr.size) + 1)) =
{
>                      qemu_printf(" %s", fvi->ac->name);
> --
> 2.21.1
>
>
