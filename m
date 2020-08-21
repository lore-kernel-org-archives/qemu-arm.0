Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp107155lfy;
        Fri, 21 Aug 2020 02:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVLRXdCgSO96f8brfyHbDI2o5izlT5jEWPpojyaJd3vd5cNlrPxbTudXsDbEYdAzSbcEDP
X-Received: by 2002:a25:7453:: with SMTP id p80mr2297531ybc.441.1598001659682;
        Fri, 21 Aug 2020 02:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598001659; cv=none;
        d=google.com; s=arc-20160816;
        b=I/pgOR/1JxjnDItzvRDdidrTUTRknsHiitP7062jjU+/omyNRwUAg3DkVI0igzMycF
         RIO4/KGzl36L+ZiiYLyE10TEdt6fLIOUFtVjEPgX5rJlibYl5DSjISj1xKPHT4ehDM1f
         hwYH0S6ziS1cPMbAmTDVDOWLa9QvwMrthMRprOrEYYBuF3LRBXsk/S4b7+pCH9gjOnjB
         9KKK7auNUJ31izkeuUy4cR/8B98l4VJYSLPD7I8Gz46e3AzFe+LRZvaJLKMZrlip5IPF
         R1wXDJkaF9qOCZioJbhcoxWh9E4sO6GWc5NNprqQrI70nSjHRIVv2xzzHqX6uBQDKfsk
         2HUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iZM0f53tTZvOsiU8zw9GifFti7zA/ofjtEtJ2j3dFJ0=;
        b=V/Umxj4wHhijoWcf4yrSn/ZAaasRUhIGtDEprS3JC3pUHaWQpAlU80Yu2dpoyDewLv
         viyiYH5CEstaL+ndkvtJtRwSCq6OQ4zXrTPnSJ1n9/9chftpkl62g1yr8agxux/cN6e2
         MS+K7FV+JJOgEAFGF42yEvXoQM+SnGtS7dVU5WpUlCCjqD/fevI9gvHYGWeGrIZllKVi
         5TG8SCCLylEZR17iOG7iMs+b3ziX4bRko9wR7aHF6LuM/qrAJ6YNFAxYx4bKa2UzGdxc
         wnmyp4pMTRig7dKGYEfZ1obf9qTS7jyVfNgd71Fe/FiHLYq5aZ0upOBtJiehqaZ2uFGX
         qI3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fD/BsSYB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e130si1720079ybh.245.2020.08.21.02.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 02:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="fD/BsSYB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k93EJ-0007jE-1G
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 05:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k93Dq-0007Kz-Lw
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 05:20:30 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k93Do-0002Jh-SD
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 05:20:30 -0400
Received: by mail-ej1-x643.google.com with SMTP id u21so827115ejz.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2020 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZM0f53tTZvOsiU8zw9GifFti7zA/ofjtEtJ2j3dFJ0=;
 b=fD/BsSYBstwKm7BTyDr6we6EdnEV1E47o4CMuIPK4HwshRnxBUGPkQqdQ19mPl+ffz
 Ut8uiYQHRozfeicJ3f8W6A/IJzP0X5nylaVbyX0RrKj+vNNk8xOFcJFk2QUJfCp44W7P
 ugZjyLiwD/wPBMjRU//P1mpIYfCJZf5NUc9H6hXhZvG6Frig5+d5Ug7mola+LfRcrGr3
 4NIY0AlwH+ZVT3PsHyQvUiGRRZ7bUNkeKyJowxUax2Ue02VKhlidX6eHqdHoL64wv6Zy
 JISu/EkNSh39lmtNheipoGh9aI+RNT+Mh07thdS+bZIaSkWFguqyaD7SDSWcBSCnH+9Q
 mXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZM0f53tTZvOsiU8zw9GifFti7zA/ofjtEtJ2j3dFJ0=;
 b=XJdZNx8FO1vDDmSojAuOgHuBu3DLYbKiGjdprp3gbIlHPBmeJqZseREagTyLTSMM4L
 QL7moL5Nfl41bz4NYIprMeJjCW87DEDY6GtJEh3eVVCqbOso5W4WuvWrIdZlGPJaWHxU
 A3u3Ox5FIHx86mkug+hr2jQzBrbOohArzi8iBYH9cMgemkVoAYESN2x4uwCHCJLxfPJ8
 v7bVPuZ30gDxniQTA/1hV0bczC+S7DC45yUldtCTdT5xJU0/tTIbAQxG7tvUIs19BSfc
 SV3I92FnNuXCy4yKO7Ch77n44H+/L9NoZCRX3VCiNMHs2cv8KSWz83bBNxGq3XD/wmhf
 DmQw==
X-Gm-Message-State: AOAM530RTsXlPdvOusiSMibacJOQs+T6VM1Z0HWEd9b6knv41T3GUpLJ
 nx3k6C3sEhfYrQ4W0HU7yvhGE6dy3DLMRDU1jtaJXQ==
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr2106121ejn.56.1598001625295; 
 Fri, 21 Aug 2020 02:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200820215529.GH642093@habkost.net>
In-Reply-To: <20200820215529.GH642093@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2020 10:20:14 +0100
Message-ID: <CAFEAcA-WvKaZWkEF1kP9ai2neic6FJVTvVe-p3RxwKU7OhBSNw@mail.gmail.com>
Subject: Re: Suspicious QOM types without instance/class size
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cfF9WO5ygIhk

On Thu, 20 Aug 2020 at 22:55, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> While trying to convert TypeInfo declarations to the new
> OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> where instance_size or class_size is not set, despite having type
> checker macros that use a specific type.
>
> The ones with "WARNING" are abstract types (maybe not serious if
> subclasses set the appropriate sizes).  The ones with "ERROR"
> don't seem to be abstract types.
>
> WARNING: hw/arm/armsse.c:1159:1: class_size should be set to sizeof(ARMSSEClass)?

Seems like a bug, yes. Here the subclasses are simple leaf classes
which (correctly) don't set class_size, so the abstract parent
class must set class_size.

> ERROR: hw/core/register.c:328:1: instance_size should be set to sizeof(RegisterInfo)?

Bug (we haven't noticed because the only thing that creates them
is register_info() and it does object_initialize() into an existing
struct rather than trying to object_new() it).

thanks
-- PMM
