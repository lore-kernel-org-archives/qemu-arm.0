Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4904101lff;
        Mon, 13 Jan 2020 18:00:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6lp4L42dNhAEHiOk4GqvtBBCbrs7uhw+8jCv/nNx51bVFGSXvrjV+kGcpahruCRoUKivK
X-Received: by 2002:a9d:53cb:: with SMTP id i11mr15564555oth.158.1578967225285;
        Mon, 13 Jan 2020 18:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578967225; cv=none;
        d=google.com; s=arc-20160816;
        b=YFGNnCcWGQE+vIZxqb9f6WibC5GNEVJVVqrbUoJRWP3H1MBlSFI1EhEpmhmL56WQXE
         YsdGKng46HCRYKWzleDnn/Kd4yJlt1wFjEtmv7UsHY50ZYTCIcRuIvzbQJfRnaXjN2hG
         V90xHWybcjai+CrjUVVLeJuPYPlt94wsf7N75F0BTqAbBXFlVCQwk7tOH7vOygh2MaAE
         E1yZQ6MGzI2ulo4N0h4MQah9D0hIKCBckXLe3Wv2QX763p8xtcq7Pl/t0aXQhrk/zc1f
         x+fLW9GZ5PLWZuLdlAuQ0g8Byr8BhvsLDpJbElgoV5yYuE1e6wfh4h/VDBzRJ5EOBSK+
         I7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8TABIaesLWHDdS8DK0RdBcbOgWuOS8JDBz9kVGBhjg8=;
        b=yXqAIGZhZAdqdIorpw4ENlElj9O2ZUnTRq6bJuXVEZoqhZvYg6KrmQ/8jnmh/fpkyj
         oU9E7CHZdVyYrHPs5DrAu8eHnmtl2jK+fAK/b9BYbz3j+jzXd2PP80qL+Cd+OdBlX5+7
         AOnm03zfEYpbZB/lEKjO5QheuxJibIMwoEQPKykI6chc9p2+tf8WIafrE3YOBMDBqnP2
         0i1d+FIYayOI3JBaO+aUWIj6TNprq2w7Ihebd9pUpsNhVIMhczWG9jPfGgHHiRrK2R25
         8dnHHaUAB8BU9b7o1aLKgoQCmd7ZLO1rY1gwW7TmCBsuYTV7aK6ZOt1kGjIdSnzxA4pE
         raWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uRmU8IrV;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v21si9916393otf.87.2020.01.13.18.00.25;
        Mon, 13 Jan 2020 18:00:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uRmU8IrV;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgANCAY (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 21:00:24 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36709 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729427AbgANCAY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 21:00:24 -0500
Received: by mail-lf1-f68.google.com with SMTP id n12so8481925lfe.3
        for <kvm@vger.kernel.org>; Mon, 13 Jan 2020 18:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8TABIaesLWHDdS8DK0RdBcbOgWuOS8JDBz9kVGBhjg8=;
        b=uRmU8IrV2Kwgz/8qAURHetLcRDt3Xpz+7Q+UEKS2zWcNKTiiWfpPHx5mdVxEnoixfX
         36yfOm0yDR879p/RKRBHVx8EtNtQJ5qBPMyzweYPSU2w+444J8Jt9SRsRZG0wvAu9hQu
         TauGzJurlrQNCk4DOMnvefBI8pHg2UTDjnnbZcoTeTZtYnTGE6HYxiAN5+0wQmhB3I+n
         o4c7A5cNIUw0C+gAcNQHLOeJ9jUE9sSW0fPJgXejwbEVaD6zo5fCH+HvVYL1Jf6Of71+
         Rjmp2ryhqLzn2vcPE2we56FnkGK8xyLaeHLN5XaF7oeaqGv5nHLLzbbx3EBoF93P34/N
         bkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8TABIaesLWHDdS8DK0RdBcbOgWuOS8JDBz9kVGBhjg8=;
        b=sm8SxzbIeb82HWHMSUYrc5tcYHJT3EEpFmQ2j7QdNZ6FG5NktugybDiFn6oMqjmVxB
         tfix7SA82KaPKXGu8wPAoFJpkI0Hl08LhGzhG81yK7+ETWDICrntHS7K/u6FNAusIvqS
         t95QA2EIfEWNqLIa/EJRjaek/ATFCC4QyDUXmEu947cgUkJar9DFBZ9w+60KFVfO3Ny9
         xXtU5JrzNWzrFuK3fey3mWlL0XcQ0tlIEPQUP+y53xbM0g/SJZdaiMz5haUkTP6ukk2v
         gU8UuogHZ9Cy1ULCoAOyK0LG82xLnop7IKtOVOf1zH4Gu/WeuH8EGQVTUaZRqB2+ZnLo
         hA1g==
X-Gm-Message-State: APjAAAXi7Ld0XxSc4L8WK4RtKDhO0cggXO8FSFXKvHBUqZDjOlU7n6s2
        P1cSNk/LzmWQaOOMBOJfR74l1YA1e0GU4OQgUhU=
X-Received: by 2002:ac2:5498:: with SMTP id t24mr250782lfk.84.1578967222098;
 Mon, 13 Jan 2020 18:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com> <20200109152133.23649-15-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-15-philmd@redhat.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 14 Jan 2020 11:59:55 +1000
Message-ID: <CAKmqyKPa0F6B1PR3O4-Tsz64guywyLxHO5FSQVZAw4D3KNrGZA@mail.gmail.com>
Subject: Re: [PATCH 14/15] accel/accel: Replace current_machine by qdev_get_machine()
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
X-TUID: ihmJyby6fORr

On Fri, Jan 10, 2020 at 1:40 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace 'current_machine' by MACHINE(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I feel like this could be squashed with the one that adds this
function, but either way:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/accel.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/accel/accel.c b/accel/accel.c
> index cb555e3b06..777d6ba119 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -65,7 +65,9 @@ int accel_init_machine(AccelState *accel, MachineState =
*ms)
>
>  AccelState *current_accel(void)
>  {
> -    return current_machine->accelerator;
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +
> +    return ms->accelerator;
>  }
>
>  void accel_setup_post(MachineState *ms)
> --
> 2.21.1
>
>
