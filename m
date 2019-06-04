Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1779452wrg;
        Tue, 4 Jun 2019 04:42:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7yuEdUSCYVt4NyV7TycveTxtF+QdapO16/OxqBZITRlmAYvTOIHRqqb8Uc0KX1O/hVoVu
X-Received: by 2002:a9d:620e:: with SMTP id g14mr4990149otj.317.1559648531434;
        Tue, 04 Jun 2019 04:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559648531; cv=none;
        d=google.com; s=arc-20160816;
        b=o3mF03ZUkOKeg0TvKDRPQ8oU5wwub01SlX5Kd3wp03Wd85U0UI65tG9Inbdk+vi04h
         jEEDXxJ1yRGdbzCEiKrpbaFr4VGX2dDdLxCCChn6bYCZGlGXtMm6OM9xWiRaYvCWeoL4
         Cmu1JSf7sXQ2UuUsx0RkAwl21FJGpH4DY1fUEcfA6T9ErkdVZjLEetqVZrAWZST7ceqA
         Bx/3p+/BdvkefzxgyEy+4vY27zVdNSxGE9D4UoSIjge8eo6dzJ1G6Vq3A3O5s8YU3uCL
         ZMXkRF3riKt5LGkmNZkM3biHrpWApy6Q132VFunue3Llb9YoC9MS1NxzkL7YUrr+z1JB
         mP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=NFYSF2eI3uW5703zLZtB4qdJdsfzrjvxZL05jJ6kHTQ=;
        b=xwcaLVuC6/k1C+SQuSnyM/Ze//ZMuDjUfS9Q0Le//ZuEzj2bT4UbTbWsZI1mhbs8sx
         CTFZYNyXGKNvImb3cLGRcypffkf4/BcY+CvLEhqKXelMw5tEmnypYCrwVNRbfW74XxjP
         dxK+rJf8VzqHXxgNDsFIDeOcHdl9iwTLrRRGbsjhwkhrRH8ducJx0FDMGjRGXVmawVW2
         /DKflXZdRS51KKzoneAl/dhmEok+Lo8lQGISHfC7NNPZuT0ZQuYvNiup29HUFxKUjD2V
         4ZL/ignHmjWG4hMYIROYW+v5TorMtS59cDC8bQWKPYNOCBmZ7tm2/TpqEtJQTmzucZho
         1cyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s206si8974208oib.116.2019.06.04.04.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 04:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0023F316290F;
	Tue,  4 Jun 2019 11:42:09 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71CC05D9CD;
	Tue,  4 Jun 2019 11:42:06 +0000 (UTC)
Date: Tue, 4 Jun 2019 13:42:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, 1830872@bugs.launchpad.net, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, randrianasulu@gmail.com, Richard
 Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [RFC PATCH] cputlb: use uint64_t for interim
 values for unaligned load
Message-ID: <20190604134205.757b217a@redhat.com>
In-Reply-To: <20190603150120.29255-1-alex.bennee@linaro.org>
References: <20190603150120.29255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 04 Jun 2019 11:42:09 +0000 (UTC)
X-TUID: lMcEQgFRH9rH

On Mon,  3 Jun 2019 16:01:20 +0100
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
>=20
> Hopefully fixes #1830872
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Fixes arm/virt bios-tables-test for me, so

Tested-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index cdcc3771020..b796ab1cbea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, T=
CGMemOpIdx oi,
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >=3D TARGET_PAGE_SIZE)) { =20
>          target_ulong addr1, addr2;
> -        tcg_target_ulong r1, r2;
> +        uint64_t r1, r2;
>          unsigned shift;
>      do_unaligned_access:
>          addr1 =3D addr & ~(size - 1);
