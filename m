Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4902277lff;
        Mon, 13 Jan 2020 17:58:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwT+JuX3M2igC/T5rAjTRL5gX6b+q6+k0eX7KLwgmg9c/LGVqkUgoHnWaWooDYBfogxk3g5
X-Received: by 2002:a05:6830:44e:: with SMTP id d14mr915488otc.228.1578967083688;
        Mon, 13 Jan 2020 17:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578967083; cv=none;
        d=google.com; s=arc-20160816;
        b=y4xN6tmW8Rej+Y4aMY3bnZZwBh8vU63yb8L6Kbm9nm4GOph/qpMncMHoehHH2VIP33
         hRS8veEFkoW9dISizIKvfVjxNnB6957Nx/OiwiTBf7a8uaVvmQ92sk+eBMuD/FTwfiR6
         nkGlZoIJCf1F/wxzk0WLa5M8J8IJh8nt+Kzaq6bBp3fiuwty18lQjebcEC2T0V+SwhZq
         6OIjkQKUbdEe8TADoYjVBZDL28gUM9NkPGGXqVswD4IA8c2ObGhMBZ4yYO+RxrFB0UP6
         iD8AhOUr9CycNSLRYKdCxTGLj48AcPwreAEuoUNQIh5b6klZbXxiyiL939To57NZS961
         gx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+BvT8R5z7QIhrFmhGPb8TBCNGrSfs2ldB6iaTKYVjHc=;
        b=1F85/4ZwHqTck4gquZodNtSXQMhTuEuoaA2F8igDt9nP8WW33Ywa/5i6lq19Q+AAN4
         OVe5/gKY+bFcM9xNqi5/cbLMAkud/PFfMbzfaVwmgetYgHRMUQLmWgJOPpFQPMr+zi1Q
         GBhRG+RFVBZmFXtK/jUe0umDnyk+rdqOo9HvofzjJ2XRc+2c5eBdHYB6aALVV9Wxw0sB
         v7emBuzbKCnuiW6Za3QCdkR8aOosvXLCiMHLTe9nolPZq3+JxVmRHuW2fuiz0AvtI93w
         oCBmBRBwRGO2OEtoDu4tSqEUEOVPzvONYpM5k04h59m9ebxT1y9OTBo4GXn0VGxtv4dX
         TNqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EBP5+WN8;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v21si9916393otf.87.2020.01.13.17.58.03;
        Mon, 13 Jan 2020 17:58:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EBP5+WN8;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgANB6C (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 20:58:02 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33256 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbgANB6C (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 20:58:02 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so8495530lfl.0
        for <kvm@vger.kernel.org>; Mon, 13 Jan 2020 17:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+BvT8R5z7QIhrFmhGPb8TBCNGrSfs2ldB6iaTKYVjHc=;
        b=EBP5+WN8/2VsJ10DZxxFxknAhWyLbx3HEMx49tfS6QX8qty8R7NI/Yj5q6He498vMn
         T2ttZiy10+007RwIm16xxI5Xn67nx2VvyTExubCbPG0fQ0lSZPO4bLJW+EGY6QIvtSxG
         aUevSfGOsvm4wqI/QcARFnNkzJzDXJSFsisWoC2JmLj1yJGpdnonOVusuqG7u/JxUIFu
         UV2xdml55hlUAjG5ZUybQvVKGpnczZEj55+nwgTSJpUqlUu0q76sasimU7IW1cnt8qX3
         im+x0PIrhhzeIi3mgvaWmsoJc8pRu6JSJiUADU9LO7HCVpYCEHE5otRSrr487EdHJ91l
         xoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+BvT8R5z7QIhrFmhGPb8TBCNGrSfs2ldB6iaTKYVjHc=;
        b=DWiXSSBVFhQR6ok9HcABEeMCfY6iUFn1WcL15tcTA1jhCY6dKOSF+zsGLS5KeB/hVX
         rEt3jq9ts9IbbSsn4XJJTHgmm6Hsdhuvl2A09feHA0x6Lg5XIPXTOgC/eyREo35ieQ9g
         qBkNfd+kYImUwZ76EVyngQ/65dqN77sPyqAWxRLo5RIBwccanQakTTY85boG3VD2t1qT
         0HB1HJ0gvtxGLcXISKrqZjbOg6tFtQBD5rqRI6UkgYSicvPXLnE4vTs6T3gCjPsJoMjT
         nLENQPivoBmN3Y8dx7XlPBGyD0320Ww9+pto3eJOhIGc5tF1/4CDWypGZLyIs3t3Y4Q6
         d1kA==
X-Gm-Message-State: APjAAAVU/x2nsyvU15Y7aEpb2DvidxzwtLI7OZJf5wlAFan3mYihok97
        aCcRUe/E1PwH4F4QTBEVkUPYF3H57tjWnCvkn6oyNzx5FcY=
X-Received: by 2002:a19:4ac2:: with SMTP id x185mr210632lfa.131.1578967080317;
 Mon, 13 Jan 2020 17:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-12-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-12-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 14 Jan 2020 11:57:33 +1000
Message-ID: <CAKmqyKO8mKt=ZDVNO6bEfGi5QTCeLbYZum_-6V4yPpmf-XH1DA@mail.gmail.com>
Subject: Re: [PATCH 11/15] exec: Replace current_machine by qdev_get_machine()
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
X-TUID: ni/FPF78QuAL

On Fri, Jan 10, 2020 at 1:37 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  exec.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index d4b769d0d4..98f5b049ca 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1984,11 +1984,11 @@ static unsigned long last_ram_page(void)
>
>  static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
>  {
> -    int ret;
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
>
>      /* Use MADV_DONTDUMP, if user doesn't want the guest memory in the c=
ore */
> -    if (!machine_dump_guest_core(current_machine)) {
> -        ret =3D qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
> +    if (!machine_dump_guest_core(ms)) {
> +        int ret =3D qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
>          if (ret) {
>              perror("qemu_madvise");
>              fprintf(stderr, "madvise doesn't support MADV_DONTDUMP, "
> @@ -2108,7 +2108,9 @@ size_t qemu_ram_pagesize_largest(void)
>
>  static int memory_try_enable_merging(void *addr, size_t len)
>  {
> -    if (!machine_mem_merge(current_machine)) {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +
> +    if (!machine_mem_merge(ms)) {
>          /* disabled by the user */
>          return 0;
>      }
> --
> 2.21.1
>
>
