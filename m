Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2861721lff;
        Sun, 12 Jan 2020 01:43:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzAWhTAkZsKD8TaUD3yTAaoCJquokSolSTkJSW3hMQ1rmvDDvBwJKYKBqmEfwBCFDEVFlJh
X-Received: by 2002:a05:6402:1d0d:: with SMTP id dg13mr11783967edb.104.1578822213813;
        Sun, 12 Jan 2020 01:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822213; cv=none;
        d=google.com; s=arc-20160816;
        b=vuQmhJaoWdyB3hzsFoXg23B9Q+blEGUUcg4Z22ODHkhNB8pOfBFhKdIGgfJ9XnyxHW
         7vsOfBnlLTg8de3fv0sGa79tSjjm1wIxsFSxECZcMhRMKCVrA8SZfH4CsWQ6U44PbE/5
         xZtxsnATtqlSnK0QMtmSlqdFLuz3InNOPc8/oy/UhZo1z5msLEfFE7a3ehwE6u3evhYJ
         LKHDsHULxcu7yCJf/RA5vDJxRSsEQrfQ1+EXV9x5Il3YwUUh87I/urSWAzR8vfRv+3S2
         QXcCKqhBmdjlU3iG+PEDXo51kQVvRcJ458ht9VqB250nIKWTiiWCZsn6y64xQZTzCgRJ
         vKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uQmpwxVEj1cR4VjtZn7xRR3NzxiwsRUjQ/Q0ih7Ijuw=;
        b=DvwjScBY9vndKFu3RCyv7oOFjyF4z4TBuh1jvDF5aBlF/i4njtX+upI6OPxtekZ5lE
         tjg4aveVSrIdjAx8AtXURoxAVnMxDmYwRcYY96tp0XLUaA4zVbRyeIpFWM0ThsbgspbD
         SisXsGrjFEVpYagSz+iZ9WgYKQpIFRYh11WaxIBVHqiVf4U35SIkOZVS6wrMretlOJ+p
         7GeDYUq0VROiWfzkxgMYjFTkNtmhj69AH1mcO9tTaaIZXV5nA5gWJCR9kLQUdgLXJXwq
         XwmVCgMb+RGyT7cuocG3GMFfvn+ilM2qoVJesflTsfi4WyRwSt9kQCz+0e9oisBfNtoi
         Rixg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lz/w3v3F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si5362340edq.161.2020.01.12.01.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2020 01:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="lz/w3v3F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqZmO-0000xM-Mm
	for alex.bennee@linaro.org; Sun, 12 Jan 2020 04:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iqZmC-0000tb-GO
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:43:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iqZmB-0005BW-HM
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:43:20 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34466)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iqZm7-0004bu-5T; Sun, 12 Jan 2020 04:43:15 -0500
Received: by mail-lj1-x241.google.com with SMTP id z22so6753275ljg.1;
 Sun, 12 Jan 2020 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uQmpwxVEj1cR4VjtZn7xRR3NzxiwsRUjQ/Q0ih7Ijuw=;
 b=lz/w3v3FvAImk7GIfeLMkjq7yFJEO27+zK0Trfs/b6YTLzlbx4zyrGmcYD5lup1nyi
 hdf54ZKtgUWMHwcA0ZCauN1r7BGXb6sRsJpw3sc2lLdV84h+oDivN4YzY2GdJWcD5NF9
 LCPlvrzEl/MnPz6qdIEt4MUWdwQLVWLs2e0+L+imOZHL1QBd9Q1RiURQ1Z7G3bVESAKX
 xvWR8jjK6XeaCb6+QObz4P49sgddj7H8lfmdPdysgvTLtuc0nfea0P9EaAptRhhP86KQ
 EwArp9tWLTwNvdSjCwwcbGNfG/uVQmNGZCefwAQFRAtttELBxu22e/W1/EXG2/jNkH9J
 kmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uQmpwxVEj1cR4VjtZn7xRR3NzxiwsRUjQ/Q0ih7Ijuw=;
 b=kFk2iaOApoDgJCY1yJT2+4vq90RUWwIPv7jiY70UKtgnrHI4oQq+HrZMa6oGcuFZvd
 vUD4RIG8+fIjuV6jgUNC9SyL0IHy1bYdXikb1MwEISwvSA3ZtL2lY1GnTuiF97QvJRaH
 /s7p5TH6QOGFy0KmVzie/faokEb+J3PHB30t7Gy7q8BbQoPnpFWig862sdExtH/AX3v4
 MC3Wr3zOZu+iBJmooRh3/zwwN5Q/NJzReHAGIwpL+vimmBD2jkPKjMPdQFVNg1Fu9HmU
 gd2YQdp5oX6pFdM91vlFZAvBXJ9HdYWX2grgrz2UBLxgG2KMrkg9who0OMzJYlDuI0Kd
 D/1Q==
X-Gm-Message-State: APjAAAW96GAcbFfNbDgwl9CHSMziSNmNwl6/CApM8O+jqwaWP3x+26vv
 xgx9cW8xqy2NJXebd/Sp0EzzjXBCyO/1HFOjDZE=
X-Received: by 2002:a2e:9b03:: with SMTP id u3mr7679182lji.87.1578822193085;
 Sun, 12 Jan 2020 01:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-6-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 12 Jan 2020 17:42:45 +0800
Message-ID: <CAKmqyKMOznT5OspQYB41+xYNWK6BnxYeYT7qUWk=KJLv7i6XmQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] device-hotplug: Replace current_machine by
 qdev_get_machine()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Overall" <kvm@vger.kernel.org>, Juan Quintela <quintela@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HN/7kIkdkKAv

On Thu, Jan 9, 2020 at 11:27 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> As we want to remove the global current_machine,
> replace MACHINE_GET_CLASS(current_machine) by
> MACHINE_GET_CLASS(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  device-hotplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/device-hotplug.c b/device-hotplug.c
> index f01d53774b..44d687f254 100644
> --- a/device-hotplug.c
> +++ b/device-hotplug.c
> @@ -45,7 +45,7 @@ static DriveInfo *add_init_drive(const char *optstr)
>      if (!opts)
>          return NULL;
>
> -    mc =3D MACHINE_GET_CLASS(current_machine);
> +    mc =3D MACHINE_GET_CLASS(qdev_get_machine());
>      dinfo =3D drive_new(opts, mc->block_default_type, &err);
>      if (err) {
>          error_report_err(err);
> --
> 2.21.1
>
>
