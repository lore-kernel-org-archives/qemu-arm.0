Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1940302lfc;
        Mon, 22 Feb 2021 10:00:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykipvipqEAgdSS1nQSrpgKuOmoRl8N8rTCdWMtt9JlOSDt+iKWUNWUVSNIcaAjRwl+JZYp
X-Received: by 2002:a6b:b304:: with SMTP id c4mr7039727iof.139.1614016821881;
        Mon, 22 Feb 2021 10:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614016821; cv=none;
        d=google.com; s=arc-20160816;
        b=jCH5nFKIzGLY+J+ycHMFNy7umcbps9mQubWRPeL/IEozae2L7mZ93gek8SsSdwWoKl
         ywMPy/4OxuFJ091si1Tbi9TZEYK0vfAgaCLqYJ36Bpy7JZHDbRkNl+SPzVo4Glu/ciHc
         y1TdK3wk5OodXkba0DXyfiESOb9xzRxzSlU2qKIQcUYm6qxTNzsJqIujt8/hqGX3X12y
         i1qjkPa8huAp65PCxrfj9lK7uCKaLtvVqaI/YtBJ8jD03uWWzx5s2F2TBJ2XpPi36RuX
         dbJXhxltF2ZD5WOvLyf2XwLJiiIOc7KbRhB+KulRZpYIyYDsWjOogPZ4xN3pUVvWenbT
         ImTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=g0daaZIiL7zB1dNQnlGOdmrK5Ct4nJWAQKVeDV4S+9U=;
        b=b4sHB5bLnJiY/Qh6L2GIbqFnMPCyjX3emtNFEFFc6j9AGIhj+XBhYqg309PS+eIX39
         1XVxPiYaCsE4OrH7oq9hwEhFBhcowYYWsnuQwyGiaW8Dm2Pz9/a9qew/dMWNj1Gpr52f
         W4jeCzt7P40eB5AgHRDoX5FCaWZeMHQSAkDwuhTOJvLptLYgQNPqZksqTg2t6fhyribN
         5JgCdjaAY5WPUN3TgH8E05oomBsvG5SOX4ObZd8rFO1PnPKZ9w0YiXbXs0SOtlY/x2kf
         3xYtcmCtR7UUQ101mtREvVSzDGKjr5v/Au56WiGwNSooChE/2vQTpwcZ41qNF57+s6Y7
         VRvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SxAvLQEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si17234821jac.78.2021.02.22.10.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 10:00:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SxAvLQEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEFVN-0004hY-7n
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 13:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEFV9-0004en-9u
 for qemu-arm@nongnu.org; Mon, 22 Feb 2021 13:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEFV6-0003fH-Ub
 for qemu-arm@nongnu.org; Mon, 22 Feb 2021 13:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614016804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0daaZIiL7zB1dNQnlGOdmrK5Ct4nJWAQKVeDV4S+9U=;
 b=SxAvLQEgIQg4AF43XkIExc4cZPw1W0kFjn25idJ41GmCzCFGeNIKelKJtCCKHnHXT8l8fM
 raDcsdZXnT3ihpQ+y0m5xdVmdGqpQdxpf9vv8yJHoKnd52CjRlog/vOomjy6wOoOdpqTEZ
 C7C2mLthoiCOD1Ddm9yxOwe2VJTujzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-x6AyWPnMMK6ocNz1yohAhA-1; Mon, 22 Feb 2021 13:00:02 -0500
X-MC-Unique: x6AyWPnMMK6ocNz1yohAhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB31192CC57;
 Mon, 22 Feb 2021 17:59:56 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90F5F60DA0;
 Mon, 22 Feb 2021 17:59:33 +0000 (UTC)
Date: Mon, 22 Feb 2021 18:59:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
Message-ID: <20210222185930.4c08cb69.cohuck@redhat.com>
In-Reply-To: <6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-3-philmd@redhat.com>
 <20210222183400.0c151d46.cohuck@redhat.com>
 <6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMndsjnenlp1

On Mon, 22 Feb 2021 18:46:15 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/22/21 6:34 PM, Cornelia Huck wrote:
> > On Fri, 19 Feb 2021 18:38:38 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >  =20
> >> Introduce the valid_accelerators[] field to express the list
> >> of valid accelators a machine can use, and add the
> >> machine_class_valid_for_current_accelerator() and
> >> machine_class_valid_for_accelerator() methods.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/hw/boards.h | 24 ++++++++++++++++++++++++
> >>  hw/core/machine.c   | 26 ++++++++++++++++++++++++++
> >>  2 files changed, 50 insertions(+)
> >>
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index 68d3d10f6b0..4d08bc12093 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machin=
e,
> >>                                 const CpuInstanceProperties *props,
> >>                                 Error **errp);
> >> =20
> >> +/**
> >> + * machine_class_valid_for_accelerator:
> >> + * @mc: the machine class
> >> + * @acc_name: accelerator name
> >> + *
> >> + * Returns %true if the accelerator is valid for the machine, %false
> >> + * otherwise. See #MachineClass.valid_accelerators. =20
> >=20
> > Naming confusion: is the machine class valid for the accelerator, or
> > the accelerator valid for the machine class? Or either? :) =20
>=20
> "the accelerator valid for the machine class".
>=20
> Is this clearer?
>=20
> "Returns %true if the current accelerator is valid for the
>  selected machine, %false otherwise.
>=20
> Or...
>=20
> "Returns %true if the selected accelerator is valid for the
>  current machine, %false otherwise.

Maybe that one, given how it ends up being called? Or "specified
machine"?
>=20
> How would look "either"?
>=20
> The machine is already selected, and the accelerator too...

Yes, so this is basically testing the (machine,accelerator) tuple,
which is what I meant with 'either'.

>=20
> >  =20
> >> + */
> >> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char=
 *acc_name);
> >> +/**
> >> + * machine_class_valid_for_current_accelerator:
> >> + * @mc: the machine class
> >> + *
> >> + * Returns %true if the accelerator is valid for the current machine,
> >> + * %false otherwise. See #MachineClass.valid_accelerators. =20
> >=20
> > Same here: current accelerator vs. current machine.

So maybe

"Returns %true if the current accelerator is valid for the specified
machine class..." ?

> >  =20
> >> + */
> >> +bool machine_class_valid_for_current_accelerator(MachineClass *mc);

