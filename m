Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1968363wru;
        Mon, 16 Jul 2018 15:03:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfxZn+xdZtZ0x94C1dcJcQcAfyKkxQcxB9iQwDOFIFqfW70vkTGUBgv2bPwuX+2jd9IWjmd
X-Received: by 2002:aed:2496:: with SMTP id t22-v6mr16696402qtc.44.1531778638391;
        Mon, 16 Jul 2018 15:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778638; cv=none;
        d=google.com; s=arc-20160816;
        b=d352s76VP2+QR8KCXka3FkLe46qb7DWZhAcQmHIx6uQ8Taf9qeVZoSX0TCAxu++vVJ
         eO5/k2cJzZiayfRu0ORfptY5LJ1XdJYQcmWZH3L9uDLsSrtFOjRVLP/C7mAsjRYkojFq
         ZfT/US91qa1ZDMrxEQ0E42gRxJBJdU+CIKwgt89cX3ia/MCX3qXrozbM5T88YxqGd/w3
         +5KXR+RajMGQ/OkAiMQ6Rm5M8BliA2gUMWgUq8+EFqQMGhp9ahP9quMGJUM64DaElkHl
         ngoB6n0nXSdYfbsHM34cjPbleVLVKwr18NpEkng23JplwESkpoxNX2OSHg9onaeOxFNs
         gDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4KX5kmvjfGs4uH67CAMomlX1Bj2H8ojwOQOFrdWuGa4=;
        b=jiBphniSqmiff8+1KTf4hCp0ywW0+LL37UQTsduF1PCYjDmQ5/q7p4glye2ivZwH+W
         mP0s/TjTh2cyQASFAuoydLIJC6xafu4KjpaduMcBXDC/8yxxpoY5v3+dbUwhvXx+kZ08
         iDNk+MIMQPMjGLXZ8EenMrfBHTV83W76qrJ8/+QfaDPfB63q63tJO4CnCsdu2v7YhCI/
         9RH10kwsKbY+kFJdek3zmHf4Td4RLAXWIVhP0AsV25OXmfbwAWsMQImg3bGXPLAoq19n
         Lgw6yEz9w4/IeDMJZv2q6CqL61B4RNChQfRywmbyeP7Ht5P+A/BRjjeCfu4OcSwCgrtt
         mNDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IJtMxNMg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22-v6si1684869qtc.111.2018.07.16.15.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 15:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IJtMxNMg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBb3-0004cf-W1
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 18:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBat-0004ac-AJ
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBas-0002xo-7Y
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 18:03:47 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:43679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBap-0002vv-Oa; Mon, 16 Jul 2018 18:03:43 -0400
Received: by mail-lf0-x241.google.com with SMTP id m12-v6so33327805lfc.10;
	Mon, 16 Jul 2018 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4KX5kmvjfGs4uH67CAMomlX1Bj2H8ojwOQOFrdWuGa4=;
	b=IJtMxNMgvJWObJHQBf1luuL2aI9RHuKLMXjOFh0kmIlh+l4Ijtk+ESQo59q3gfKzzU
	2A3UJ3m5GiL/aoVJ3O3426Wo2+zwZgXUNmGYlUsQntrcFkAb2Ub6mxbrdkan3/IPfn5c
	pdk7MpcwWWdEPXzXVzzHQ1BpMoEe3I3svm2KVm9sLsNOPe+VSXAijBE/IW99exPsvn/N
	KTN9XWKTiuObM1Nz3sTfSwGGE7MPbJAD36u80++Q/eJvhY2eEtJa6raEhl1HReb1bY5A
	HBSN+stTRRJ9U3VLV4s6okLV/OpLk058Gr6D5/DaDmaFKf7hZ+6FcRcwc1GZuafhnBHL
	/fRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4KX5kmvjfGs4uH67CAMomlX1Bj2H8ojwOQOFrdWuGa4=;
	b=ZRbMvH/FvR9tnsYbotS275gzeJTV/47ZqaACxrOZYWf0YJRkMRkQxbJYuqbkGlaXuf
	R1tB3jsXyZoGk6MlUBK/p5kdu3dtsW8fkLrMjy0R6fM2zHq9FL+DQkgB7i4QKjftyvIy
	E/he4o3UAVB12JBidjmm4tX4uAMNHOjAlWtxEGLWLdJRGBVRbGCs+pq1jTEwwxEYCtDX
	YNU0Jp3p12EQn56HWR5U+/SIEENUnP4bcoLGBCbvYXEck+wZrVkNBwJ1wrXD7Wv6cTk/
	xOLw9oAIRqpeZyRs6EQg+33MdJA7xVXzEEPyGNi3GCWINIStUR2OcnLH1ifVBg1FwDgO
	mg2g==
X-Gm-Message-State: AOUpUlFqLs7HJVJIcElJbENRJs2eaM+9tLLoVcRA2pJdXVxl/dkzp2H8
	qqNn7lH9GPZKk1JyNunLQzYuf+58VSGydyzuzNE=
X-Received: by 2002:a19:5c8c:: with SMTP id
	u12-v6mr13069511lfi.98.1531778622391; 
	Mon, 16 Jul 2018 15:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 15:03:11
	-0700 (PDT)
In-Reply-To: <1531745974-17187-8-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-8-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 15:03:11 -0700
Message-ID: <CAKmqyKMcjQdBAnfmKoOEXzNF66T1wHMWbjWwU+-Fw+Js5hF-Vg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/17] hw/cpu/a9mpcore: Fix
 introspection problems with the "a9mpcore_priv" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdi/zhV2ihaf

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> Running QEMU with valgrind indicates a problem here:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'a9mpcore_priv'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==30996== Invalid read of size 8
> ==30996==    at 0x6185DA: qdev_print (qdev-monitor.c:686)
> ==30996==    by 0x6185DA: qbus_print (qdev-monitor.c:719)
> ==30996==    by 0x452B38: handle_hmp_command (monitor.c:3446)
> [...]
>
> Use the new sysbus_init_child_obj() function to make sure that the objects
> are cleaned up correctly when the parent gets destroyed.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/cpu/a9mpcore.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> index f17f292..a5b8678 100644
> --- a/hw/cpu/a9mpcore.c
> +++ b/hw/cpu/a9mpcore.c
> @@ -27,20 +27,18 @@ static void a9mp_priv_initfn(Object *obj)
>      memory_region_init(&s->container, obj, "a9mp-priv-container", 0x2000);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
>
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_A9_SCU);
> -    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), TYPE_A9_SCU);
>
> -    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
> -    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
>
> -    object_initialize(&s->gtimer, sizeof(s->gtimer), TYPE_A9_GTIMER);
> -    qdev_set_parent_bus(DEVICE(&s->gtimer), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gtimer", &s->gtimer, sizeof(s->gtimer),
> +                          TYPE_A9_GTIMER);
>
> -    object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
> -    qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "mptimer", &s->mptimer, sizeof(s->mptimer),
> +                          TYPE_ARM_MPTIMER);
>
> -    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ARM_MPTIMER);
> -    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt),
> +                          TYPE_ARM_MPTIMER);
>  }
>
>  static void a9mp_priv_realize(DeviceState *dev, Error **errp)
> --
> 1.8.3.1
>
>
