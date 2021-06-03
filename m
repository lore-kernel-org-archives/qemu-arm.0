Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp250935lfa;
        Thu, 3 Jun 2021 06:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1ZWOavADJrsuNSPJQKPAqfz4K6DFMj8D3q5sseuEtq2/lDtkU/geEcKo+gvS/aYDjv7gd
X-Received: by 2002:ab0:7c5b:: with SMTP id d27mr16052815uaw.15.1622728401758;
        Thu, 03 Jun 2021 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622728401; cv=none;
        d=google.com; s=arc-20160816;
        b=aw9xuENvYCMxWJ8MjFI3Unx+fAACtSdjRlytAiZOSWbLm4D6Hd8cu6m36h8CriqJKx
         hzjHljlmWaMlgTmDcqgyqYpXDCY3E2bResNUc/XD55OU7wwToGzvRMAjlMj9HFXGzrYv
         2AdizvxcxMIccAb1R5mx2ytKRariOsykK5L/SQ8oBzbM777gb2creMmLHPNsgI4BOWQs
         vat2dYDlIcXdke1BmHI7d7zNoJ1L9qGRgMi1Ta1LBQOO3WztgY/7lY0yBzw4kctIiOJH
         Z/J6xmAIn609JmdBv0DLhTpoqkuGsiCcD52YmhsfwaUNLt54tEXSc/0p1QYPqqUoKAlQ
         n5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:in-reply-to:references
         :message-id:date:subject:mime-version:from:content-transfer-encoding;
        bh=idmciLv1H7thYZaau9DEXmP9Fhl2IwtSXTATFxON2lU=;
        b=deWDXttUcd8zlcfswRlhsciGNXtOSy92tbMOLYHadacBp3gmGRAOd4+hZ74YRi72JK
         /2j7u2hX27rjmRrxhGEYyaxc7QMJ1PUaXYLbNJaqT7b/+ZtxM9DAhbklf4WJQIIPdCx+
         qYzWb72HT2JKKaODGz9raxXuyFm1OgJ/vCFgYdflr3lk8F+lo9FpVNqXYaHRhuG1y94q
         o2q5rOb9Az/34ZQUW9pxcAPXIAcBY6AQCT1BSREljVpxttaLV5GKvVrG6gfRLWWa2dps
         AGrzi9RsLNLAJQaKlKCVuiLhhQoJC/u0fHuKy5raKYaMzbM9LqbOVZzsfp8/jt+xNASg
         yzuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si1421731vsp.25.2021.06.03.06.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 06:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lonmj-0007Lt-3Y
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 09:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lonma-0007L1-M9; Thu, 03 Jun 2021 09:53:12 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58802 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lonmY-0002HB-Hz; Thu, 03 Jun 2021 09:53:12 -0400
Received: from smtpclient.apple
 (dynamic-077-004-113-104.77.4.pool.telefonica.de [77.4.113.104])
 by csgraf.de (Postfix) with ESMTPSA id 99FBF6080292;
 Thu,  3 Jun 2021 15:53:06 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
Date: Thu, 3 Jun 2021 15:53:05 +0200
Message-Id: <69E1BF99-9687-4915-B9DF-E2DAF8157289@csgraf.de>
References: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (18E212)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xHKamYixkna0



> Am 03.06.2021 um 15:44 schrieb Peter Maydell <peter.maydell@linaro.org>:
>=20
> =EF=BB=BFOn Wed, 19 May 2021 at 21:22, Alexander Graf <agraf@csgraf.de> wr=
ote:
>>=20
>> Now that Apple Silicon is widely available, people are obviously excited
>> to try and run virtualized workloads on them, such as Linux and Windows.
>>=20
>> This patch set implements a fully functional version to get the ball
>> going on that. With this applied, I can successfully run both Linux and
>> Windows as guests. I am not aware of any limitations specific to
>> Hypervisor.framework apart from:
>>=20
>>  - Live migration / savevm
>>  - gdbstub debugging (SP register)
>>  - missing GICv3 support
>=20
>> Alexander Graf (18):
>>  hvf: Move assert_hvf_ok() into common directory
>>  hvf: Move vcpu thread functions into common directory
>>  hvf: Move cpu functions into common directory
>>  hvf: Move hvf internal definitions into common header
>>  hvf: Make hvf_set_phys_mem() static
>>  hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
>>  hvf: Split out common code on vcpu init and destroy
>>  hvf: Use cpu_synchronize_state()
>>  hvf: Make synchronize functions static
>>  hvf: Remove hvf-accel-ops.h
>>  hvf: Introduce hvf vcpu struct
>>  hvf: Simplify post reset/init/loadvm hooks
>=20
> I haven't had time to review the tail-end of this series yet,
> I'm afraid, but these first 12 patches are clearly all OK, so
> I'm going to put them into target-arm.next so that at least
> that refactoring part is in master and won't go stale.
>=20
> The last 7 patches are still on my todo list to review.

Thank you ;)

Alex

>=20
> thanks
> -- PMM
