Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2854237lfg;
        Tue, 9 Mar 2021 06:25:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl5cjJ0YwomkRZxFC6wh0xdzDrOM+XNel4Q3ITgD+Qo0Kh4Y3HtLZStP4fC8OnNQPQwCjb
X-Received: by 2002:a1f:edc2:: with SMTP id l185mr16523423vkh.8.1615299919081;
        Tue, 09 Mar 2021 06:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615299919; cv=none;
        d=google.com; s=arc-20160816;
        b=ACawdGWHIsrRB5z79rsfj5ZhgcAswJjosNMbMX3qMlWKeiZYbK0cq/O/FaSdhM4qzO
         CGRUSaJMwBxCqUoiS850xc0qG0Y89zW+1ku7JxkkAsq2zg9N9ETw4mz7ne4pX1s21xiu
         Oqs3jjC2v5vxfiIPoW2PdwrVwr3H45zUOPsOyXLEThbQ8x7sFIRLkkOTy85im/cjQzLG
         KcTjEdeiEIjNk2pt8yhfvGDffR7iG5iSrkUEQmM2iZCU5tGaPw4HwNfLqO5jQLrtiEPi
         Ckv+ujarShrMb++TemDTKqGN22S1bZbjqh2mBNNJhGiVdpBscphMJVGZmXxTjqY/Vdhf
         uA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pNnlj4yhpAVqphn1RS9uyMihORIIyJWABgL5zTOZsNk=;
        b=rorEWj+H8Tb8pVRCsy0cUxAvhIb27PvDBLfQNBaw0fNHrbUSxX1/LkY9oKlPBb5CHq
         M6B2UXC/aA6kx1tbKriK33WxUkc2UTBpltq/2Ok8gstiqGG93yte9qkyKMerN+VAaGHM
         KwQYeStPjMdxLF9UvFhn3u0se1ZcF/a+fOzAl+88pV3TZZ+ajClQTznFc0MKr3m2wIrF
         J2NOREu1eEt4mPjoB/lSq2I+E8+gCGu+XfWowvrJNJRZ3kOdQvZhzCYVqLBGBu5CTD7n
         ZCoBQ+cA77NG7RRc+hdaFnNP5kPr3l4nZHiPEeiwMZZ8NGWtrV3cfekbc91Q3CvRsJj5
         rSNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SCtZHgd9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s191si2317468vks.59.2021.03.09.06.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 06:25:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SCtZHgd9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJdIU-0000ts-7J
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 09:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdEO-00050X-4y; Tue, 09 Mar 2021 09:21:07 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJdEK-0003BC-HQ; Tue, 09 Mar 2021 09:21:03 -0500
Received: by mail-io1-xd2b.google.com with SMTP id n14so14091789iog.3;
 Tue, 09 Mar 2021 06:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pNnlj4yhpAVqphn1RS9uyMihORIIyJWABgL5zTOZsNk=;
 b=SCtZHgd94WrigxaC9z6b0hAeYD7PK5c91VIwN5KkdlRM91tKJ28Fg6+jLDfzTfbL1t
 akCI5uFLQWWeUXvfIuAcPKqgEWEP3LDStOe1v2CXqluMenJsWmuYglwud6cMBqmXEnw7
 zcr0uZhpGi7h4tRRBjf7RyapSMSPg8ljSrr6W6gYFHMfxcIaPkazEktLsHlvYOoup6CF
 A334xkjNcab8B1rRrcUGMPUzs3diTjKJ7TFLYSI8eReqkbViCn9HN8oN0PpgK5fl7Njl
 PNgz0RkAhqFIlqPQlbxK2cue6iiW97gDI4oHquXK4+zxejUB97/T4fDr2oLL/Zo1vBp8
 JkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pNnlj4yhpAVqphn1RS9uyMihORIIyJWABgL5zTOZsNk=;
 b=KaLVsLmHRZzmLVodCoem46m6VFWfgpNzNPHfQkpn+L2AjLIFSVrleDJ19dvV+G3iPs
 FFn/7OZuyJKx0uhPVZEq0zBU5C/idjr+8fdDfRlq7V452Xw8rbuyYYEfgEnFEsJ8X+hV
 ZOQHt0lf5V+TpGGzXAOHrrxf5oJ3vX+ekIYFXsGJdcvDlXlPGb9mm0wltAG/z+SbsAzg
 gek0AiZ5aLHEWHrdq0lBbsiIZmDqlwR/REX/yy8SOFG5P9dsrYQYg0aIGGn9J3exeGRI
 +WiCs71ViOHldxNC40EcgfJiVJ+3MvaxCbRq5pT+c8DEp7hqxWhOlLFqR27ndrzGcIFN
 T4zw==
X-Gm-Message-State: AOAM532LZi9TJI6oApabyS1LnP7tMJg66UMY78LzSO35vzyudot1Dsoc
 STOEZlVfRj5bI1yWgGLa7SN6FENPMr5BZ8nE+KQ=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr29418497jah.8.1615299658778; 
 Tue, 09 Mar 2021 06:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
In-Reply-To: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:19:38 -0500
Message-ID: <CAKmqyKP=XGPYFag1kkGhXcmpM0JTuyOHrMRCfyVQVB1RuSewrg@mail.gmail.com>
Subject: Re: Malfunctionning qemu-system-arm ?
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHXt+cwBz1BQ

On Mon, Feb 15, 2021 at 11:37 AM vincent Dupaquis
<v.dupaquis@trusted-objects.com> wrote:
>
>     Hello,
>
>     I am using qemu-system-arm with a netduino2 target, supposingly
> integrating a STM32F2xx chip.
>
>     I tested using the STM HAL in order to make a simple program run,
> and I just failed to have it running correctly, it satyed stuck on the
> starting HAL_init() call.
>
>     Debugging the code, it appeared that stepping-in was making the code
> work while when running it it failed (stayed stuck in an infinite loop,
> but no obvious arm violations).
>
>     Has anyone any idea of what could be the cause for this ? I am using
> the latest STM32 HAL, with a qemu version 5.1.0 on a Ubuntu 20.04
> machine. What is the level of support this type of target is supposed to
> have, and posibly which limitations should I take into account ?

Hey Vincent,

The model was never tested with the HAL. HALs commonly have infinite
loops inside them and it seems like you have hit one of them where the
HAL is waiting on some bit to change. I'm surprised that single
stepping fixes the problem though.

You will probably need to figure out where the loop is occuring
(either through GDB or prints/assembly/execution output), after which
it should be possible to fix the hang.

Alistair

>
>     Best regards,
>         Vincent.
>
>
> --
>
> *Vincent Dupaquis*
> Software security & Cryptography expert
> 06 24 58 17 05
> /Europarc de Pichaury B=C3=A2timent B8 1330 rue Guillibert Gautier de la
> Lauzi=C3=A8re 13290 Aix-en-Provence/
>
> www.trusted-objects.com <http://www.trusted-objects.com>
>
