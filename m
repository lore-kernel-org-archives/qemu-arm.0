Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1706231lfp;
        Tue, 21 Jan 2020 08:48:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjzvIKrAeWYHHS5VNdILTwJ0nzn7Db0Xvq4be2oog89ovYL6BiRGDIu9EBRIMF4rUKVGt2
X-Received: by 2002:ac8:709a:: with SMTP id y26mr5384115qto.304.1579625318728;
        Tue, 21 Jan 2020 08:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579625318; cv=none;
        d=google.com; s=arc-20160816;
        b=R6B6p/XS4SewTUFf5jEJQqJkh2Tc2nbWx7m9e4VvFDkO7vY75I5khsRb0ZXQ1IuFls
         ClNTCbXqA5JlnQg+pwKOS/w602upACXVisvVWh8xsOhZPk2yXAp8lla8N4Tscq9CD1hY
         rcck0O+oFVxIxHgWT0giyUMCC+Oa4OIruJs2TR4BRtXOrzHws8w+65kspkr4bptWImUh
         oVJ1lhU4vObqD1XKX947jWM6xJE/Ii6OE0cxejT3PkmZslAnjjRgdCZHZbdttcbKvPA9
         ieYY5SJ6tU2C8uLrMxbaaV8vw0Tk8MZyWMdZCg3TbGJL2sFPH8jKVjS6ymdzeObNQBQx
         6zpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=UhoYieZ1CB710QG4EYP4qL/+hrUgwv/TvGef9XhMmo8=;
        b=uRYSTKPLxjG9zQ+5mquHV9Q8Vqe2ypgJj4CDu5EkOdzZATA8dVVugKntSU2CUBOdjd
         z5Jbr2u4eW/sG1M5Em5pWyAJCM9MeUOrHUdxvA7tITVkrvCuaqNgEXflL9GBwz/pQhey
         vSzHvv7OSX0F4VGJ0nYWlpdwQK3TzuO4SgHMo5oUVHEqviKsXkjoBBCP5yQ5QoNmNEJQ
         AkvBcErM5CpfncFubgdElTAfO7PH/Mk55CWCV2YxCxLoVLa5rkikmgJ+89o7VVPt5Kmr
         Sw8x+mL3GD6ciOW4IshOBs/mwIa9xwM48ED/LMac3nYRlhWxzD/tvwnTDbEH0wvFAu4I
         /GsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IePxPLdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r186si22350821qkb.216.2020.01.21.08.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 08:48:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IePxPLdX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itwhh-0000Nu-MQ
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 11:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1itweY-0005Y8-Jq
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 11:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1itweU-0005OS-Vm
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 11:45:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22337
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1itweU-0005Nz-Rm
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 11:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579625118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhoYieZ1CB710QG4EYP4qL/+hrUgwv/TvGef9XhMmo8=;
 b=IePxPLdX8sx2Gx6/eElpIBCQ9eR86JmxPIXouZLMU+v9hYuTf8aIbvq/t+WcoqqZcPwYJW
 Bjnev9SNAkBPy8aPNHrN9oRtZh4IeK1tqQGev+S9fzQlgpW5nLLqSIQpwyigeY1AZbBCuq
 d4kgvYojMmVIWUDFyhnMLInkIUnuU0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-uGmz-fx1OUOjDm2QL80t4w-1; Tue, 21 Jan 2020 11:45:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56B8C107B27E;
 Tue, 21 Jan 2020 16:45:12 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48FC460FC5;
 Tue, 21 Jan 2020 16:45:03 +0000 (UTC)
Date: Tue, 21 Jan 2020 17:45:01 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 05/10] target/s390x: Remove duplicated ifdef macro
Message-ID: <20200121174501.7b7a5401.cohuck@redhat.com>
In-Reply-To: <20200121110349.25842-6-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-6-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uGmz-fx1OUOjDm2QL80t4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3qDMGB05NIF

On Tue, 21 Jan 2020 12:03:44 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Commit ae71ed8610 replaced the use of global max_cpus variable
> with a machine property, but introduced a unnecessary ifdef, as
> this block is already in the 'not CONFIG_USER_ONLY' branch part:
>=20
>    86 #if defined(CONFIG_USER_ONLY)
>    87
>   ...
>   106 #else /* !CONFIG_USER_ONLY */
>   107
>   ...
>   292 static void do_ext_interrupt(CPUS390XState *env)
>   293 {
>   ...
>   313 #ifndef CONFIG_USER_ONLY
>   314         MachineState *ms =3D MACHINE(qdev_get_machine());
>   315         unsigned int max_cpus =3D ms->smp.max_cpus;
>   316 #endif
>=20
> To ease code review, remove the duplicated preprocessor macro,
> and move the declarations at the beginning of the statement.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: New patch
> Cc: Like Xu <like.xu@linux.intel.com>
> ---
>  target/s390x/excp_helper.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I case this goes via the misc tree:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

