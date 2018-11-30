Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3791138wrt;
        Fri, 30 Nov 2018 08:52:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WBTCCdq99pBdRXsq8+/w5aGV6h4ajGHmtRYqObkvrXqSiAcaJku7bkw5uIS2Oaa1FL5qVC
X-Received: by 2002:a25:a4c6:: with SMTP id g64-v6mr6178162ybi.407.1543596773309;
        Fri, 30 Nov 2018 08:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543596773; cv=none;
        d=google.com; s=arc-20160816;
        b=BMt1HIGcN2UGfrEpdmk9bWlRry1bzuvmKMK1paqZ+TSaxWjsJP7J+uesBbK8M1pfRP
         nt6oPXZ5roDgZA7mHqwRtmQennMv3TqCm2nrpfFAuVgFAdzhKlUX6itOvACoIm6UQP3+
         Z/gLgiyxcL8GnTUOf/wR8n1PpTfZMc7e/Mhv0ETEGMKIiqmtriM5lFk2jQ2ShTt0Ekan
         ecyAL5sVGmIbNhXAIUpLuGx1phErEBSbd0Cn090v2KyekLjnB2r+ailWenTjSfUaqSKm
         /zSTwOtKl+9mzBvJyiyMX39YEf7Z6AJAriy1S/kmAWuKcIIRrcz3UU5HbsDqkpzWDJJP
         gMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=7ygm8O/xxLT2Yuc/eCIb7kc4AxkgLKjwjPvZ6ic43Rc=;
        b=BN6DeTtV+I23PvMjZqzeB8h6tVQZWFKsFGc/zEI4r93OonUHRO1B16wvtY3/z9I9mh
         r6aK1z7/UGRZXnNCDqbeh7c5FdsmCfXCTTexIOg8Q9j4Aoj64X7EoCqu98PWk3un2d2/
         pq1/FyuQxRV1WlqtuA0iQ6KAjkBs2e4JWCABWrkPrdZ1eRLMIuLUCZUXb5+VbIM/2/ix
         /IULR2XDZjP92iZEEG2XlYopERq092rCRaEiSHSV0t/6TXqG4bFXkpgS8++JU97VZMJc
         xgCZMsNEdjMWezHtW2jogtvG8zskjFpmJU1rGBBGQ3/dWyqBd53PFkZmeYoow6/95Mn3
         9DJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hFB0jXIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h124-v6si3346542yba.312.2018.11.30.08.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hFB0jXIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSm28-0006fo-Qz
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:52:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSm22-0006fc-H8
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:52:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSm21-00017q-Lr
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:52:46 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSm21-000170-Fy
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:52:45 -0500
Received: by mail-ot1-x32d.google.com with SMTP id f18so5660026otl.11
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 08:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7ygm8O/xxLT2Yuc/eCIb7kc4AxkgLKjwjPvZ6ic43Rc=;
	b=hFB0jXIuqk25hj2YX+AQk2t9Icz2hUmRCGpJTsurwlRIf8WRk4pcIDE4mL/8XF4MvF
	a9fgGmBFInSOHXLEFIbnhQinVIt+tt28QbjJOswIrFMH5zktUDrGrluKsA69ZBAYewsp
	Nk3lU5IeRNsnOAIZGmFjcORe1vkOT83mk4c0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7ygm8O/xxLT2Yuc/eCIb7kc4AxkgLKjwjPvZ6ic43Rc=;
	b=OoQCpR9Tf0K0fLLXLrOTgYGpVh5LHX8/UCisK8qsNzUFUXI9mGF3DP8Tuut8OhTjmp
	awPst0VNj36w5zZHdFFcjmSpZACUW2BrStGMK2b0ITk0e4tXYsBLNenrtdvyz76S4KiH
	28y7zYMymxIzU1kgg0JxHW/Md1QGFzrsL58r8A4uFqEPMtFkkNLbpnHl6YXrJMGDdNGU
	u0oTr6doii/ufh767XPm37OgTnZuOzrb+EYALnis2AvzJ1vPMebo6te5+pd2O5FOF+5P
	cKLh3vmcOJR+dywm0VXJk26LiWnbQ4mh+/MtBhqTMIHe5BDsFFVliFV/ja6P+udWric6
	9IBg==
X-Gm-Message-State: AA+aEWZP+367zYUGFq30IMjeTHFmkcvqsWzuPEruntLQGIrfkfQ3GCTR
	iazA+lvERb//Zk3bI+kvS3FGJxZPhFL6Ae/ezRE4PQ==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr3811524otu.352.1543596763213;
	Fri, 30 Nov 2018 08:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
In-Reply-To: <20181126132731.GJ18284@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 16:52:31 +0000
Message-ID: <CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uu+axNX5E4Ze

On Mon, 26 Nov 2018 at 13:27, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Sun, Nov 25, 2018 at 10:27:04PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Eduardo,
> >
> > On 23/11/18 19:10, Eduardo Habkost wrote:
> > > If you really want to do this and assign cluster_id
> > > automatically, please do it on realize, where it won't have
> > > unexpected side-effects after a simple `qom-list-properties` QMP
> > > command.
> >
> > This looks clean enough to me.
> > Do you prefer we don't use static auto_increment at all?
>
> I would prefer to avoid the static variable if possible, but I
> won't reject it if the alternatives make the API too complex to
> use.

I guess the alternative would be to require the cluster ID
to be a QOM property on the cluster object. Usage would then
be something like
    object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                            sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
                            &error_abort, NULL);
    object_property_set_int(OBJECT(s), 1, "cluster-id", &error_abort);
    qdev_init_nofail(DEVICE(&s->rpu_cluster));

(ie one extra line setting the cluster ID explicitly).

SoC objects can probably reasonably assume that they are
the only SoC in the system, ie that they can just assign
cluster IDs themselves). If that turns out not to be true
we can make the SoC take a property to specify a cluster ID
base or something.

I guess if we've been bitten by cpu-ID auto-assignment
in the past, starting out with "user picks the cluster ID"
would be safer, and it's not too much pain at the callsite.
Plus it avoids the gdbstub changing its mind about which
order the cluster "processes" appear in if we refactor the
board code.

> In either case, I'd like to ensure the caveats of the cluster_id
> field are clearly documented: no guarantees about ordering or
> predictability, making it not appropriate for external
> interfaces.

The gdb stub is sort of an external interface, of course...

Luc: what are the requirements on boards using CPU cluster
objects? I assume these are both OK:
 * does not use cluster objects at all
   (the gdbstub puts all the CPUs in one process?)
 * all CPUs created are in some CPU cluster
   (the gdbstub uses one process per CPU cluster)
but what about
 * some CPUs are created in a CPU cluster, but some
   are "loose", not in any cluster at all
?
Is that just invalid, or do the "loose" CPUs end up in
a default cluster (gdbstub process), or do they get
one cluster each?

If it's invalid (which doesn't seem like a bad idea),
is there an assert somewhere so that getting it wrong
results in the board failing to start (ie a "make check"
failure) ?

thanks
-- PMM
