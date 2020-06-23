Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3888220lfm;
        Tue, 23 Jun 2020 01:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe/kxieDK/u1MZxghtqVTcmschPTW7VBFLKQ3p/z0br+d8bFIZ/WUEE4/+Y700Q4xZSBVy
X-Received: by 2002:a25:9c88:: with SMTP id y8mr32784021ybo.317.1592899296596;
        Tue, 23 Jun 2020 01:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592899296; cv=none;
        d=google.com; s=arc-20160816;
        b=wtLa2NcLylnLA4AhZlEzJ1auHcxBWjb+o8zEGi+XtqJ+Drzj5bwr+t3FoWccrGrrjB
         vnm4T+TJtajJWrswGPYuP/AtBY3FdQxjoOS0UJEttY8WhCnrC+7izMHrKtNsyUKeURgZ
         oOjftGtk0JjSpmnVJ6YczDGezbyo2ZwBvl1iHxwWSNTXjw4cTsunEyWXjt1g+/vLfM34
         FIO5QoUP/70RQxhN0Nrldgmqdbc02bR+ZJW0vvglWz3yzuo+g/nkTUdMtuN1iioHWcYm
         6RTo0FYETWf7Y1zu4hVWqVnI0/RDYJ4R9B3Eb3FgB9Qjbj3W5REUG//7Bx84cWoghml4
         uUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=g9A41gXSHBekuAZBKlyRF1tjqiShsTmNHyInAZGqj70=;
        b=EUfC6okuLlAjieQpza3EBMTZgEQ8Drwm3mHHLcSxTkZNMKPdXv3iN6SOaruQYblZED
         pZgBX4LtH8ZVWeg4AWU/t4/ylZ1jW/5tIP3pqh/UkS0jp0pRzqUqYDsly3XRRCU5K0WE
         s0OMvZ0HxiCrRGSfDp6IzKHVDULUiuTRmAINM0eOk+WnFnhJQj5N7/q83RGqLcHKdcIN
         8F5HFqunp3YR20Pc9E3LSUggtztyrzX8R0DPRloOtbvDVYKOROOlwr8BgabjD0VumMCQ
         2vectut2ok/odrtcLfDVOcGnccBc4zubCOYmLWFpfqRIuOjLsxvDlo36/xKi5/g2Acki
         4LzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JyqtOn4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t106si14949975ybi.421.2020.06.23.01.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 01:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JyqtOn4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnds7-0007tC-Td
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 04:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jndrw-0007r8-DI
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:01:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38547
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jndru-0007hz-P8
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592899281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9A41gXSHBekuAZBKlyRF1tjqiShsTmNHyInAZGqj70=;
 b=JyqtOn4YcBBdiGYYUIuHr36hhM/h8N7skehda2r503T+0hXA/E8g5YfOgzWel9Kf3M7wd2
 qPguK+v0Aqan1FVxndR3KPpNQPDJSSiUMFDT0tGgG5kdGzO/BQplCbIzM0sPHMJJj7EwbT
 4tj4LIncuLGqmzHaBHW04IOk9W/6V38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-VWgkAppnNQib4u2upeGNOA-1; Tue, 23 Jun 2020 04:01:17 -0400
X-MC-Unique: VWgkAppnNQib4u2upeGNOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5B7A8031CB;
 Tue, 23 Jun 2020 08:01:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61CD67CAA3;
 Tue, 23 Jun 2020 08:01:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1A00113846D; Tue, 23 Jun 2020 10:01:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
References: <20200622183428.12255-1-f4bug@amsat.org>
 <20200622183428.12255-2-f4bug@amsat.org>
Date: Tue, 23 Jun 2020 10:01:13 +0200
In-Reply-To: <20200622183428.12255-2-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 22 Jun 2020 20:34:20
 +0200")
Message-ID: <875zbimcs6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:54:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9d?= =?utf-8?Q?ric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V9HAz4vYtpHL

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Extract i2c_try_create_slave() and i2c_realize_and_unref()
> from i2c_create_slave().
> We can now set properties on a I2CSlave before it is realized.
>
> This is in line with the recent qdev/QOM changes merged
> in commit 6675a653d2e.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  include/hw/i2c/i2c.h |  2 ++
>  hw/i2c/core.c        | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 4117211565..d6e3d85faf 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
> =20
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r);
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
> =20
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 1aac457a2a..acf34a12d6 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave =3D {
>      }
>  };
> =20
> -DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>  {
>      DeviceState *dev;
> =20
>      dev =3D qdev_new(name);
>      qdev_prop_set_uint8(dev, "address", addr);
> -    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
> +    return dev;
> +}
> +
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +}
> +
> +DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
> +{
> +    DeviceState *dev;
> +
> +    dev =3D i2c_try_create_slave(name, addr);
> +    i2c_realize_and_unref(dev, bus, &error_fatal);
> +
>      return dev;
>  }

We use "create_simple" names for functions that allocate, initialize,
configure and realize device objects: pci_create_simple(),
isa_create_simple(), usb_create_simple().  Calling this one
i2c_create_slave() is okay with me.  I'd prefer
i2c_slave_create_simple(), though.

We use "new" names for functions that allocate and initialize device
objects: pci_new(), isa_new(), usb_new().  Let's call this one
i2c_slave_new().

Your use of "realize_and_unref" matches existing names elsewhere:
pci_realize_and_unref(), isa_realize_and_unref(),
usb_realize_and_unref().  However, the other two i2c functions are
called i2c_slave_FOO(), not i2c_FOO().  You could name this one
i2c_slave_realize_and_unref().  Another path to consistency: drop the
slave_ from all three names.

Ideally with my naming suggestions considered:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

