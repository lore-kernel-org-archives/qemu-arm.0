Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4903383lff;
        Mon, 13 Jan 2020 17:59:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwY219Sw6Rs8NLckEmkpPTLR0eohy+Xfsxo2hbOtD9TliPaqVLgQoMykODCbjENkhOP5YqV
X-Received: by 2002:a54:4085:: with SMTP id i5mr15212283oii.17.1578967177370;
        Mon, 13 Jan 2020 17:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578967177; cv=none;
        d=google.com; s=arc-20160816;
        b=lRcwOYlzE8cxmcaU8E03ljlFvU6edLOvy+erJlmfCLbDMFvhKZkBgMGjBkIAt5Hny5
         CDlUI7622KGRy6M2gZ3ePjzhbFaQb6I3LnMQBngKrLIFskhzGFxDzvPemkVjZmx3HPjr
         wr3GSBH2nnhx9Y0abnDm6YG4bkEs8Ulz2cmb7jWJinQ/hQcgJJWPC/qg63MWbPpc/BzH
         7A6yZxnpVIIt+szT7E5kws3bkOoUdOLfXNv3YDBzqea/rtPUPaqcGC1k0+1h0pEsupsI
         bao969TesekTaeDzjcrFEL6dET+ZV7B9NmaEN1fkgk2HBF5FjjGr8u6YblrmwrDYSl6q
         wiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5OXR1lgWAptLKU3W0CQIZNE+hOvlwc8nHcCeOKgikCc=;
        b=VfS1gxzWg2jxyJFFqvhrpdYaAmTbzr7QL6hVHPZnBQnhnCcXD5hfyT8MX346zDkhr3
         zMuCUSQQ0ciKMWXGZpKBRBHbXHdqYy8vnWItKjmG5m9jPULRMpNecPeAZn1z7xjWu+rV
         l1IEt3UoBl+HEAlYbMYsEvdpIL/jYN0T3oeDHMRsljNXKcaSCZ2xWwyifABYDHg7+ynm
         rsnoXLnS6tMyjtGEckfocUHlypTK8LclBNcdUgth5yhtUKdcvjsTS/6JNrWrv+ATiZdE
         n111E+JOUy3CBaJEMgBqW7yC3ZBHSqiWa+corXnnnEnhVoG4NpWp2N+Yigg85hlQiW8v
         j8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ldG5Kb8X;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v21si9916393otf.87.2020.01.13.17.59.37;
        Mon, 13 Jan 2020 17:59:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ldG5Kb8X;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbgANB7g (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 20:59:36 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41984 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbgANB7g (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 20:59:36 -0500
Received: by mail-lf1-f65.google.com with SMTP id y19so8473095lfl.9
        for <kvm@vger.kernel.org>; Mon, 13 Jan 2020 17:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5OXR1lgWAptLKU3W0CQIZNE+hOvlwc8nHcCeOKgikCc=;
        b=ldG5Kb8Xh6+ISy/6M54NdrAwwDLsh66IGzfYLcVVU4QSsBHgAHo3KU4OxzOD/8Ic68
         plq1yDtgwqyTzATD/ld0jlxwDkm3v2+KbGdHf4Rn1TTntg2f3e+dJ+A4cQKDUOUqj/K2
         T806kS52ldq6cOCKN0qXiNVZlgN/pBHxiUl4S5P9mnt5JJcg/pXSCUUxzqOTGqbZMuXo
         WTPo8k2HjXHyWns5E4e8rN64JFSPmYm87BxhTbq0cCuUX6EJt1aCp7GyAlQ80J9O29dd
         KRtoMDGxeDhgZqImrxAZAvW8Px3NHISp3unhudz/I1Iyn+tp16qmBO9+FA9NUBIGKkkf
         U9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5OXR1lgWAptLKU3W0CQIZNE+hOvlwc8nHcCeOKgikCc=;
        b=AcgnLZTLVSe1UTztWScgKrB+9DFPZjuiFO5+jbyQcPyOv1TTY3slCVZCktYE/GI66D
         k72Vw3OpDTCfqcrgXW1nGeYIBdOkb7YzaUv7HilaqF+5aPzxZh7HIzSso4HtRp4C4Kwl
         gIlFmByRQitSUQCA1JQ8rCgFgZzZwmEDGRZZ+VwantJxzUemHC1YtiMdogt8S+RxPtMZ
         fuD4ceyzprawRX3CDPLPxrp32rfWeMSGKMJylSXDxJVdKNwLqTgIZYhXaUOqpVfAzKj1
         GOOboCtoh33rasDXU1sVcWAVH/lVOwlOuf8WKoSd3KaQFiHRJ1H/KKsiqAL0ZPxY01Du
         UBXw==
X-Gm-Message-State: APjAAAVHcAINJ2vb4iDH8bqqyQJlg43ycMelZ3CmscWxVNnDEHKgGMcG
        /wbsG82TK75gsHfZEgd/FdMSl4wuo7VGQzG1Kxc=
X-Received: by 2002:ac2:46dc:: with SMTP id p28mr235710lfo.23.1578967174451;
 Mon, 13 Jan 2020 17:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-13-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-13-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 14 Jan 2020 11:59:07 +1000
Message-ID: <CAKmqyKNrNKGiwVzubZjJtBj+=7vCs6tMN+7jGx6Zme=8sgLPZg@mail.gmail.com>
Subject: Re: [PATCH 12/15] accel: Introduce the current_accel() method
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
X-TUID: sCxLSgmxRqKs

On Fri, Jan 10, 2020 at 1:27 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We want to remove the global current_machine. The accel/
> code access few times current_machine->accelerator. Introduce
> the current_accel() method first, it will then be easier to
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sysemu/accel.h | 2 ++
>  accel/accel.c          | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index d4c1429711..47e5788530 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -70,4 +70,6 @@ int accel_init_machine(AccelState *accel, MachineState =
*ms);
>  /* Called just before os_setup_post (ie just before drop OS privs) */
>  void accel_setup_post(MachineState *ms);
>
> +AccelState *current_accel(void);
> +
>  #endif
> diff --git a/accel/accel.c b/accel/accel.c
> index 1c5c3a6abb..cb555e3b06 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -63,6 +63,11 @@ int accel_init_machine(AccelState *accel, MachineState=
 *ms)
>      return ret;
>  }
>
> +AccelState *current_accel(void)
> +{
> +    return current_machine->accelerator;
> +}
> +
>  void accel_setup_post(MachineState *ms)
>  {
>      AccelState *accel =3D ms->accelerator;
> --
> 2.21.1
>
>
