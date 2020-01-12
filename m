Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2863119lff;
        Sun, 12 Jan 2020 01:45:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzAnpZcaq/BgGcqKO7r7jEIxzHSjk2aEZWrlwPhn0KUYCHEedebj0u23JbVLmiODqFn7sqM
X-Received: by 2002:a50:9ee8:: with SMTP id a95mr11997437edf.86.1578822329866;
        Sun, 12 Jan 2020 01:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822329; cv=none;
        d=google.com; s=arc-20160816;
        b=kynT7bUyKXbwZjPAe5adLNLx1hoJBi/KPViwztxVEu+cw00/P0Nm6QKrgmdqE4vhdv
         WIua5wlaps3P/kdK50CfB7ikh7gJkuIFoT/f6yhK2IFkJFb6Yck0hJQ3bAuFSP/vgdZt
         46MPereX5HqiRg274H9So9MfLjcWHMNk0t5g4Y7+0fGGo6cs3r4vBFOqjx/sRadlp87H
         nEUD59kusDxTZ4BJs/fgv6M8pt/1RF3nSrgKebO31X7bO28ua8Zl5BA5i82tSFrYKOhx
         1knY7cjHyW3SVH7q/q+a/9ktw/S84Nph4SzYFM9Wvn9cKEl/wa8aPbPX43zjy0zKHGKh
         DN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mvEyv8WsHK+y4lyiLI8T8Cwz0UxNsAP1n8oZu5GDpas=;
        b=rF8nNNTkOr1syaAqBnj4cRNkmhf+TQBYsAWURqQVTE7CnshpkX1ElJjg3xaaiLWzZQ
         Trd1DiYUUnCsRk513SJNHLOq8RQhHHb4AdhfjGZwWtt/lYgx6JOZGbIOUGkCdCrq+9yt
         HT1WjnF3D8sMupcSbfDOeVwxb/64iZj8zKzeZP7caeMb8FIP3IdOBgp49QRNSdlHFo3p
         7WmsNvRW7GtjgyXmcbmSLIfoYCcQ21G1cKjxoSwla47fme/cxhGMDoRlOOyVdXYL9glU
         Fvkh5TVeZP5YJToIwdGbuA+y8ApMLayNBlf2Cn4RS6AnItYIv1vfJYFcJZmNZl1jQG3m
         t1ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EsExOqT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si5060511ejb.29.2020.01.12.01.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2020 01:45:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EsExOqT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqZoG-0002yT-HD
	for alex.bennee@linaro.org; Sun, 12 Jan 2020 04:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iqZo2-0002uL-QA
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:45:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iqZo1-0005dn-M5
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:45:14 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iqZnx-0005A1-4b; Sun, 12 Jan 2020 04:45:09 -0500
Received: by mail-lf1-x143.google.com with SMTP id 15so4727461lfr.2;
 Sun, 12 Jan 2020 01:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mvEyv8WsHK+y4lyiLI8T8Cwz0UxNsAP1n8oZu5GDpas=;
 b=EsExOqT+WaKoepgqT7oBU0FbwwVcObGIbJj0xCQa354MC9I0rlak12h/IOaCdVNjOM
 TS9B4peK4Wy1n3LNE7VUeZeAiNxuJMTDtOlZkmLlTMxebjdYlkuArnnwDHlyNP/IgbIY
 NE+3m9HIEl6y3exSWSEKN+obmsDn4n6eauER6SWszp2tmiqxez40m7fCaai4EScYBfzI
 CzshAOOXWob9ahNuiw+zOgiUw5FULJnXuY+LvF6XF9nIkmJCenbXBL9D1p8t4YMmXDdC
 hm93ccuX8jC1DQoRT3nOGwRFAxnKTMb6OsT7WPYMCJ9Rrtsmll0xv1zh+fKXXf/vNghk
 2iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mvEyv8WsHK+y4lyiLI8T8Cwz0UxNsAP1n8oZu5GDpas=;
 b=Xj/UNwCgAHzkf3UdHgMML2oSS18SHzMc/kPYuqQzUnB4kZebR9WXboCfpeQTaPTi70
 rgdelGppT/+xU7fpQhGuNOGq1j4pabmtW0vSBpIK4cDrJr0WwZAdNM9+eIwBBpHebeoL
 zXIfWNnTj8bNmTsXX2Fq8pv62P+JLp22MOuBehAE0vs14tgdVXHpi7XeSgCtUwG7XQrH
 jIz9SfnYfUMV/8WOIXijl1jpg/D9Kj4Iedgb0MdZEKsCxUKRyZCpRTsvTRCe4VThg38k
 Rzh2ph4Nmx2hMZ39mMf3IxgEmsbKwu8G6IM0r3XoeflUVpEF6P6zyFD+v7JwTIoSjqQF
 tMMQ==
X-Gm-Message-State: APjAAAVSBr/jl0nrP4MCFHZwMzVjrvyL5tOj0cqR/ClRVetKd+2F43dh
 oHGcPgnQril0kh3vOREwTCi1VvJCufUTHILJmh4iJho6
X-Received: by 2002:ac2:5498:: with SMTP id t24mr7132155lfk.84.1578822307837; 
 Sun, 12 Jan 2020 01:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-8-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 12 Jan 2020 17:44:40 +0800
Message-ID: <CAKmqyKNbbkBeoVTfvyLt_krei-nCP_sGY_70GSiLFrQVOdd1Ag@mail.gmail.com>
Subject: Re: [PATCH 07/15] hw/core/machine-qmp-cmds: Replace current_machine
 by qdev_get_machine()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-TUID: gZGwv1Tms2sO

On Thu, Jan 9, 2020 at 11:30 PM Philippe Mathieu-Daud=C3=A9
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
>  hw/core/machine-qmp-cmds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index eed5aeb2f7..5a04d00e4f 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -280,9 +280,9 @@ void qmp_cpu_add(int64_t id, Error **errp)
>  {
>      MachineClass *mc;
>
> -    mc =3D MACHINE_GET_CLASS(current_machine);
> +    mc =3D MACHINE_GET_CLASS(qdev_get_machine());
>      if (mc->hot_add_cpu) {
> -        mc->hot_add_cpu(current_machine, id, errp);
> +        mc->hot_add_cpu(MACHINE(qdev_get_machine()), id, errp);
>      } else {
>          error_setg(errp, "Not supported");
>      }
> --
> 2.21.1
>
>
