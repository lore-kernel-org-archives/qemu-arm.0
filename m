Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2862473lff;
        Sun, 12 Jan 2020 01:44:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1sSO5Sho3OIoiXCmB0eJi8vSQf8szWqd3RvLMhttcaCHBXbNu1cQRpK4cbRSMxyZ2N0G5
X-Received: by 2002:a17:906:bcf5:: with SMTP id op21mr11521837ejb.160.1578822276847;
        Sun, 12 Jan 2020 01:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578822276; cv=none;
        d=google.com; s=arc-20160816;
        b=EfgJtluYaZx8VfdVPqJjXtiYrYQb2PR4LBIRwDBMiBNAuk3jykrKSdw+JABGHzQOIa
         AorZ8vOvzMysNkj69WsItDU8BXs8yM+ObWdRu5XLfwESFI2pbwgY4dWzq1U82ysoJxLk
         Gwc2JHEmu5T20fjEHVHsqPDmEiOtIv7ZDzOUm+vsVDqLnvrOBorRc2lPSbd9TLwRnnwS
         FN7Jt0oF6tXEAuJ/upTOrZGOsSWEPQD+o4wC7PBv6pTS5A60A3hW2gQMRU/FB//8r2zo
         AwNIdLMAfZjsQDRbmjtFyc4EGbwAS07PLzs4vA5hbjq1UbHSf5OQI/VM8lXYYzK4WjBh
         hRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=A5r5kQmyydbNcxW0sdL6UsroI3lvbIoMVRcAXoxkjxE=;
        b=DzQUxsTjsqsdZztSVZLPE9obt2+MXxYfVrNkNQnG4tikf0gE9ZsS41EOW3MDuqXzpq
         9Xb35ugA6RH68DCpfyfTRdZQZXfAlil/ybMQ8CbBWTwnXHoKQOdM4vNsOxdLRP9Qh7O6
         Y9NRNtrn4ukDhXQv/WxShF81HioJi3YYISaFfweExEjbxXaC6CO26BncNAS9u8BgWvEP
         NQ71W1Xj6qKe0I9F9qdh7uPpzUv4X1nqd/gqHhHb54/EV059tCLS5h8T4pQU1VGGOIbf
         Z26jiSM2zMUpuEGyuwOv11hzVp8+itgrFF6fz3z+71RmYCeO/ePps5KUI+A1sDnw+473
         SBHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W2uztqtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf24si5042645ejb.286.2020.01.12.01.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2020 01:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W2uztqtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqZnP-0001yw-Dq
	for alex.bennee@linaro.org; Sun, 12 Jan 2020 04:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iqZn1-0001gu-C3
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iqZmz-0000ck-DI
 for qemu-arm@nongnu.org; Sun, 12 Jan 2020 04:44:11 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iqZms-0000K0-MA; Sun, 12 Jan 2020 04:44:02 -0500
Received: by mail-lf1-x142.google.com with SMTP id y1so4706294lfb.6;
 Sun, 12 Jan 2020 01:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=A5r5kQmyydbNcxW0sdL6UsroI3lvbIoMVRcAXoxkjxE=;
 b=W2uztqtCCOsZvughBCHSR7Y+yQr1mxzDn1SFDI/rWwPWFtLXZFMbLggsMh8BhdNUGK
 3DKBY7SeDxtbN6j4hgyKCM5XORMj8s7TsXhBBN7Oe1YdVna7cpkmv1eUw7WtE1slV4rM
 YXDYcoU8dmMIfv6qoDuY1y77XNYwXYBIh5L2OhvmIz21gFsKI5l73QU7NRXlAMW1avSS
 cwECYjHgLZE7j6QRDqSOobx6NFJBLSTC6L2l4xU23ru4U4UVFnryMejhwtLsIw8KGd8T
 aP1rcE1AsHitYur54ayIPaxs6vpXkYRMYfwbXl3YuCMRpqqZlSN3dMyI2s09n+imtO8K
 ivcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A5r5kQmyydbNcxW0sdL6UsroI3lvbIoMVRcAXoxkjxE=;
 b=Rp87kQ8svPUnQywqnRbvnceuqJeYvnuiSuBhhv6STlxOf+cVhyWcZOEz6cN994clC6
 CzbtWP/1Z5zi1TyDA/+eVA8ErKNKpLKjzJlP572JPFPfktDCMrqtFYBfyhXbXjCE/W4y
 bVgl48sOSuSjQDOQNKK0gOHKA0LpdaC+Vhnb9ruZy+EgS+obUjNWQKzNo/BGoKzZyWmE
 AyHUJ/0v3JD/aVZmgR1E5zEQOx+hzRc1+c46q3G7u3FSvtZjkXaOjIpnNZ9bUJJKPEkc
 r9HmCbYmDpo4gfdecsGNhYIpILckJW+dT/QPrkIwZaYZcDGcMt9mHmkR2GZVyT9YHoIj
 yMBg==
X-Gm-Message-State: APjAAAVcidQ1mNRSIVVpyou9wbMb8678Te7121W5tI1LCV0kwLNq4G2g
 8gGa69SZoda3gh9EBvUzzRcINUk8E9HyA+FyEko=
X-Received: by 2002:ac2:5f68:: with SMTP id c8mr4913919lfc.196.1578822241492; 
 Sun, 12 Jan 2020 01:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-7-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 12 Jan 2020 17:43:33 +0800
Message-ID: <CAKmqyKN9nEEJW3Jvw6b-4nT=oqHF3DkkReEZa2GGfjFu=7qWaw@mail.gmail.com>
Subject: Re: [PATCH 06/15] migration/savevm: Replace current_machine by
 qdev_get_machine()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
X-TUID: uAYVs7WDSr9G

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
>  migration/savevm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 59efc1981d..0e8b6a4715 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -292,7 +292,8 @@ static uint32_t get_validatable_capabilities_count(vo=
id)
>  static int configuration_pre_save(void *opaque)
>  {
>      SaveState *state =3D opaque;
> -    const char *current_name =3D MACHINE_GET_CLASS(current_machine)->nam=
e;
> +    MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
> +    const char *current_name =3D mc->name;
>      MigrationState *s =3D migrate_get_current();
>      int i, j;
>
> @@ -362,7 +363,8 @@ static bool configuration_validate_capabilities(SaveS=
tate *state)
>  static int configuration_post_load(void *opaque, int version_id)
>  {
>      SaveState *state =3D opaque;
> -    const char *current_name =3D MACHINE_GET_CLASS(current_machine)->nam=
e;
> +    MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
> +    const char *current_name =3D mc->name;
>
>      if (strncmp(state->name, current_name, state->len) !=3D 0) {
>          error_report("Machine type received is '%.*s' and local is '%s'"=
,
> @@ -615,9 +617,7 @@ static void dump_vmstate_vmsd(FILE *out_file,
>
>  static void dump_machine_type(FILE *out_file)
>  {
> -    MachineClass *mc;
> -
> -    mc =3D MACHINE_GET_CLASS(current_machine);
> +    MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
>
>      fprintf(out_file, "  \"vmschkmachine\": {\n");
>      fprintf(out_file, "    \"Name\": \"%s\"\n", mc->name);
> --
> 2.21.1
>
>
