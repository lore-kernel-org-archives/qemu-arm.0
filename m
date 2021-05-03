Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2739279lfg;
        Mon, 3 May 2021 08:22:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztnjuUfil/qYPuktOf1ZCpnpM6JfrVRKcUzj09bjerXCdOrL/jWEIrHbXaTF+qBxCmT6Rs
X-Received: by 2002:ac2:5fcb:: with SMTP id q11mr13403497lfg.248.1620055354061;
        Mon, 03 May 2021 08:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620055354; cv=none;
        d=google.com; s=arc-20160816;
        b=gkC4ywo1H3yYibWKtel/00tURR2D2C1hYoDBxJjUkxSdC852mcBaowcYSouWcj2LkQ
         k/zr2/WAhIPI7/9MUb22OYG10JHcvmxz8aVAYXpll5nZKtHj+eN07Z/jkRi8RIv75yyd
         gO9SUZWcoAg2ME/CVRYeSDcIrwvE3Un4K90tL5CMQ/mWC04qH+5Xx10/PQDBNaauUGQh
         qtT3LlKXUQmWWNPCCUMVoMepAvWAuQLpZWcy9q9uax9a/D2iSwpiANiqAstWHPEwAg4q
         qaB9Ms2iiNT8cdSHaHSPxQ7C3J9NsCJLVDCTgLOtJUDPTJ6RseQsEzgoQ8YsgLYiKqTW
         xNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=jLyL7H298fLye3WbeIMg/UO49SFJQKPHFm+1eFyJzUA=;
        b=YMPA0ZanB7LeNjF8eOgirIxIKn6TN2qmBMi7UnAm3JfKQHNQSbW1p3bICVRmCHtvy3
         1zANpoFsAbCHTAmtv5axRcYwJVLP6Lw50FvSsF59OSQXGZcmWxtyjcS5CW7UL4SDz8iO
         TuJQgBhUbdkRoM64yxklWxNoZrmUprSRiwS7m9vw2GLqJOK8je3Djwi/cipYPTIHTHqx
         52bIPypD/ghsJ2k0hf1+BasiZQX1x3fvXDMrqU0/ti8qX0+7dTwKtfwqm8KZNS08CSc4
         FnzhCJf4zCc6RQTU4EBDQBbd0fDgzTm/7zLFDjHInj4khooSj0gG9aDJVYFE1iHR34Hn
         BSeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DQuOBoNk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si121500lfb.365.2021.05.03.08.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 08:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DQuOBoNk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldaP2-0007nQ-Nm
	for alex.bennee@linaro.org; Mon, 03 May 2021 11:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldaNX-0006Kv-44
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldaNU-0001rb-4h
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620055254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLyL7H298fLye3WbeIMg/UO49SFJQKPHFm+1eFyJzUA=;
 b=DQuOBoNk5cCmGnE+UPOo58fdPVJI7B591R2uUs9giyhP+q4IIS0KoVfF7VpJVm0KKGFwUw
 9pL/GHDTaHa8ndy+sUtzud/esXVZ+F/R7x7puXz22RvIbSrTP5+jt1EdxXZygvJreDZNwJ
 UJq5otKJjVE4S7ZF7LXpVufMLmb1MPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-n7gAbJyFMjuDwRQfzXQ1YQ-1; Mon, 03 May 2021 11:20:51 -0400
X-MC-Unique: n7gAbJyFMjuDwRQfzXQ1YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C2FD1A8A61;
 Mon,  3 May 2021 15:20:50 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98D8D5D747;
 Mon,  3 May 2021 15:20:47 +0000 (UTC)
Date: Mon, 3 May 2021 17:20:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
Message-ID: <20210503172045.177af899@redhat.com>
In-Reply-To: <20210413194319.u3dli2gbvwf6sx5r@habkost.net>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
 <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
 <20210413194319.u3dli2gbvwf6sx5r@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VuIe2+pEpXld

On Tue, 13 Apr 2021 15:43:19 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Mon, Apr 12, 2021 at 11:44:29AM +0100, Peter Maydell wrote:
> > On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote: =20
> > > TIL MachineClass::reset().
> > >
> > > - hw/hppa/machine.c
> > > - hw/i386/pc.c
> > >
> > >   Used to reset CPUs manually because CPUs aren't sysbus-reset. =20
> >=20
> > pc_machine_reset() is not resetting the CPUs -- it is
> > re-resetting the APIC devices, which looks like it is a
> > workaround for a reset-ordering or other problem. I'm not
> > sure where the CPUs are being reset... =20
>=20
> CPU reset code was moved from pc.c:pc_cpu_reset() to
> cpu.c:x86_cpu_machine_reset_cb() in commit 65dee3805259
> ("target-i386: move cpu_reset and reset callback to cpu.c").
> It's not clear to me why.

it was for cpu hotplug support, so that is we would have
CPU in well know initial state after realize is complete.

