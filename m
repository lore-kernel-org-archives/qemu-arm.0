Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1961468wru;
        Mon, 16 Jul 2018 14:56:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd01XhsxsaXRVTwZh/nPvwelX7U4DiAybY93xA+K626vZte1MYsXGY0vuD+sR999t4Cq/zB
X-Received: by 2002:a0c:99ec:: with SMTP id y44-v6mr20103739qve.226.1531778170433;
        Mon, 16 Jul 2018 14:56:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778170; cv=none;
        d=google.com; s=arc-20160816;
        b=ySeu2JpqpQoNKpyZJ9vxpoE5xEeGYmVascKg7JcbMZxWzcTPEM2Q65fSBg8p7/PmH0
         /hKRQQqBmBcXG3cqE4ebsddYHg6LdZOzZjgeb92LOniK2sE57k0i8dW5pnMsdxp1lIHr
         U1ZilbZwqx2tBtq1+UMg6M0xzsvSigx4ScPxNRQNYjvHi4pyCY7Hx9K2oW8oLeItwCii
         L8pOYDJ7I7cQd2FI7yApAabXDyv3JAhRddGz52PoCDgY8Me7hsxx8XGP+8ixqwGNDZFA
         lmH9G5UdRxiVHpWi6s/qieAcPM1/Hd/UGTUNcNr3ZnlihgE7gDyetGLpHu0Ay2scB0np
         fPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=b5n05L5v1eTA9ZjoyqblIQb6yAHQBikU1APAEGyT1SU=;
        b=L2sq4m6vCun2GydOkTPslMiOQ4TIsuYypbLiADBwXS5ZioWA/kJUBt4KBU19/cdq8b
         yP6YsZx9v9o8cQ1UTdttAWuHAjYRHaXFCTuKPCPs/rlFMjvUqdkEDceJvwaZferU2Jr6
         aMe6FVEt8TwpyUQSbSszXuylToVrr+Bj56+CPbu5eXtTS/OQICHG7lXCeT4vU7C+8+oK
         JLQgTvYn68mNol+YRF2+Zuk4V3mLvd9SMtJQGROPpCa9YhLdpQXxskJxqu4gZk7itH/g
         iFcwZtJx6UxDlUbXNcTV6NJlPwNtEWkXyweV3wscz11IRNx06RKFexEvv5Kb0kDizRFm
         gXQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jqr7VRa9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c56-v6si8834292qtc.342.2018.07.16.14.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:56:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Jqr7VRa9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBTV-0000vj-Tc
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:56:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBT7-0000tw-OM
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 17:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBT6-0007yG-Rw
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 17:55:45 -0400
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:33222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBT6-0007xm-Ii; Mon, 16 Jul 2018 17:55:44 -0400
Received: by mail-lf0-x22c.google.com with SMTP id u14-v6so33342472lfu.0;
	Mon, 16 Jul 2018 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b5n05L5v1eTA9ZjoyqblIQb6yAHQBikU1APAEGyT1SU=;
	b=Jqr7VRa9QjyQu55d+CLI3fhfd+EdjWLflQZymXrD8bLCYDjPKgK4E3HH15idskdm6J
	9AXJd76YEdm9/mWJLKxVFBviBywXwiBOF7AwjhS+gmrTcjTP/9IlZAHYbzJVah0Sb+BR
	HeLB8xutsg5vVw4ST2PK7dA23/hgUWVB2ci3GpSLNbi9qhyoCzj6q66k4NW+ar1Dh1jH
	FSM6urmso+/+uxLEMEF7wj9eXdG6pAhfhJdjZtmexEh39SbXRtDPFzugs5OEGBzGknqO
	Dfq5U2bX24W0VWNlx9SEq1Ga76waP7jhd1lteQeRLS82bUtLXCl+LEI5iSVFCtNrDC5M
	9oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b5n05L5v1eTA9ZjoyqblIQb6yAHQBikU1APAEGyT1SU=;
	b=eGz1v9mGcjlL7oIRMYnkSzpMzcAPYFZ6VYEmapZN4dsnxritgu5OjKy9JTamodld9G
	sghPRKJ6MMkK6XgQHWsMrkHcReoL2TyTyvkmOttOu9OxY8cd5K2ZIGHsYd4NiNxizsCQ
	/G5Ob9o1ylQoz9Pr4Er6L5X6jpzVVFWsRHNU9fIg+rgV7yc1Fks3bzLQ5E03UTHhLNZF
	mD56tywK6proIeEsSs/+PT7tqEfa3FAJKojrz6fuZgzY3Qpajg6irSkezMGfXTsyAhiA
	vYArGfkhJnw+dIoSANgsyxQ8MHQYyJ+8yzzTxB39DpOiByqzpwnOKInUcMLuj+f9z8uJ
	fXFw==
X-Gm-Message-State: AOUpUlEGZku8JEJRHhjTqtswa84M+/jwDo/qLFXnXUh3gZ0fqpxnruZ3
	CaxplCgPOt0CO0ybnCNjsnIAT7yeIZ4Gvxr5Q/k=
X-Received: by 2002:a19:de4e:: with SMTP id
	v75-v6mr11853037lfg.14.1531778143258; 
	Mon, 16 Jul 2018 14:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 14:55:12
	-0700 (PDT)
In-Reply-To: <1531745974-17187-6-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-6-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 14:55:12 -0700
Message-ID: <CAKmqyKP8PbUzt9+MUCPvnum0=HatEiMd-6fwtXLv23M99G4KmA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22c
Subject: Re: [Qemu-devel] [PATCH v3 05/17] hw/cpu/a15mpcore: Fix
 introspection problem with the a15mpcore_priv device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOASPOgm0FaC

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> There is a memory management problem when introspecting the a15mpcore_priv
> device. It can be seen with valgrind when running QEMU like this:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'a15mpcore_priv'}}"\
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}"  | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> {"return": [{"name": "num-cpu", "type": "uint32"}, {"name": "num-irq",
>  "type": "uint32"}, {"name": "a15mp-priv-container[0]", "type":
>   "child<qemu:memory-region>"}]}
> ==24978== Invalid read of size 8
> ==24978==    at 0x618EBA: qdev_print (qdev-monitor.c:686)
> ==24978==    by 0x618EBA: qbus_print (qdev-monitor.c:719)
> [...]
>
> Use the new sysbus_init_child_obj() function to make sure that we get
> the reference counting of the child objects right.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/cpu/a15mpcore.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index bc05152..43c1079 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -35,15 +35,13 @@ static void a15mp_priv_initfn(Object *obj)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      A15MPPrivState *s = A15MPCORE_PRIV(obj);
> -    DeviceState *gicdev;
>
>      memory_region_init(&s->container, obj, "a15mp-priv-container", 0x8000);
>      sysbus_init_mmio(sbd, &s->container);
>
> -    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
> -    gicdev = DEVICE(&s->gic);
> -    qdev_set_parent_bus(gicdev, sysbus_get_default());
> -    qdev_prop_set_uint32(gicdev, "revision", 2);
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> +                          gic_class_name());
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
>  }
>
>  static void a15mp_priv_realize(DeviceState *dev, Error **errp)
> --
> 1.8.3.1
>
>
