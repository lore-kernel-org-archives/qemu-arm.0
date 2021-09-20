Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1896935lfp;
        Mon, 20 Sep 2021 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh+OLaiCkXxa22EPWWnUxfUp81JUP5cUuB35HxAFyxraVU+XAVX4LEm3QC+znM6+ASGJ9D
X-Received: by 2002:a25:b74b:: with SMTP id e11mr28015562ybm.483.1632129686974;
        Mon, 20 Sep 2021 02:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632129686; cv=none;
        d=google.com; s=arc-20160816;
        b=IOaJfLxZqXugh6GJgC6fGxaFMD6qUR6N4Ikq1GKZN8o8XBvugp2TR68vfL9rxfJBCW
         aK1c8zqipWdWz8jksR2WMoGuvZ5b+oE05O4uPPVFxC+Sl6XmtvARwPsYvn1NwXn7p2S4
         3ncO6DSo9G6ZDcfcqQJ5uVoiBhmp3FrjsYhbxvlSe9WnEnl3FczIApOWO8pLCdi45zmj
         UEfvASl4DtKlLPr8EQSOmAIUnY616khMZGRJpZlwOFupxOfgRDkUQ4l6QT3Ay09fgHY2
         99XoMxzACErzSuVwQEz0Yrk7wQ2DmTKzObZeRqDYqMJYWc3h5drUUpIi78Tj1hokL7KI
         Tz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pIdRHTf/pSGwMu9aLUIdrE/3oBw2NfRPP2QAhyceEjA=;
        b=PMGSS20AVL2KYOhlMFfnAGWNKqcLm8HkFVmT0lEmSLx3mvR5CVZcgrZSowCYnrwfOZ
         0gNwFKujHisodWXUorxDgA1aFf9Yonu2VOH3pcdsfRazUH8Wp6J9IFXi4i0eQ88RLmPK
         NAJdgeJOWM+zy1jeDfoiuCmADpCS5o1pnd2oCzXKzEMnJ+IJ7X+tnXKDUz4c1GvC1uk/
         rr5K0QA/PMJaiUvB1SmAZcxNyIoaiqNYQsODq/qDMW0cNQRGCRg9WF5m4nvpR/ElAHrz
         ckKuCq1vV13KmMYbxZny3BH2glbSQpKxTGvsSxngBZoxF0Uh3Z432sRp8fM2rrfAWFRN
         GCpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAQsJ3EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u206si13869169yba.456.2021.09.20.02.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 02:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAQsJ3EM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSFUM-00076v-CL
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 05:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFTp-00076V-WB
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 05:20:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSFTo-00052s-8g
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 05:20:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u15so27647753wru.6
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pIdRHTf/pSGwMu9aLUIdrE/3oBw2NfRPP2QAhyceEjA=;
 b=kAQsJ3EM18KWrs8d50yee4TJc/aFRA+BALda2/wkTcf0+08iL8zI1kln8T11CXEDJa
 /+xl/RsSQzuFN5mR4Ds5y7CVm1btngFkRM7oTmntsCcHMd+Qqew1DJw9xnPM8rHPcFmH
 Hgm/ZdurmMUxUqjGUythpoNo12W/rcAxEtAQvI0Cew4gqwT9LSSSOoT+nXdcpOAAFI31
 nFIqpgu21Nn5OWfErtnk0HUZ3o2JiaEIzZp7QwpOpHBLpUgJNRaHPSsLDZrmKBDZk7/H
 NE0X6Pkd12CtD+tkHp+TT59gTl5InESly9XRopRtYB6pBKE/ITI7nJdh3jO7Z78rNYe2
 RoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pIdRHTf/pSGwMu9aLUIdrE/3oBw2NfRPP2QAhyceEjA=;
 b=c6kT6cZcB6ZovmAvau7QwVNQL8UcCrCoEEUYHRCKFCmzSOt1gto99Ie4ZhqV3+AuWe
 evevLXiQWdIdqsGPSQ5A2Dwkl/fbgJySOG2toqVWj77oI2lxixOXc41EbnsKcOGjCuOg
 rewzzGDkwbW3pb3zfnDL9s0BkItroUdzU1IATDyE4kKXYMJJxdpf2fH4GwAK06eyNlQO
 lSF8I8tvFCv6jIhpKEpsh5jt/7utwYEtGAKqXGz2jpX0v6klTkIqBXJnfmA9JZpPWAS0
 crGixji56CcrtGZKdJND+xR/XQkYETrXTTVrassA+Hb7K/tW+arZkPlloo0PK/fKWEoM
 IWNw==
X-Gm-Message-State: AOAM532tQ837l0ilrG41ozzq6oTOFq/XpFIsiXVkvMvnf6jmV1GReCrQ
 +9hdGttxpCuusA/YIY29pkdyLlzxoJWMZBriKUu/Sg==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr26747724wrq.263.1632129649764; 
 Mon, 20 Sep 2021 02:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-7-agraf@csgraf.de>
 <7e962ac1-57d3-7329-108e-99b06b46d4a1@amsat.org>
In-Reply-To: <7e962ac1-57d3-7329-108e-99b06b46d4a1@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 10:19:57 +0100
Message-ID: <CAFEAcA_vC0+BSGXYkzc69hx9f5A4xO133vv=ts+kNKyr0+KOQQ@mail.gmail.com>
Subject: Re: [PATCH v12 06/10] hvf: arm: Implement -cpu host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pwOo7PCuezh5

On Thu, 16 Sept 2021 at 17:08, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/16/21 5:54 PM, Alexander Graf wrote:
> > Now that we have working system register sync, we push more target CPU
> > properties into the virtual machine. That might be useful in some
> > situations, but is not the typical case that users want.
> >
> > So let's add a -cpu host option that allows them to explicitly pass all
> > CPU capabilities of their host CPU into the guest.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > Reviewed-by: Sergio Lopez <slp@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > ---
>
> > diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
> > new file mode 100644
> > index 0000000000..603074a331
> > --- /dev/null
> > +++ b/target/arm/hvf_arm.h
> > @@ -0,0 +1,19 @@
> > +/*
> > + * QEMU Hypervisor.framework (HVF) support -- ARM specifics
> > + *
> > + * Copyright (c) 2021 Alexander Graf
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef QEMU_HVF_ARM_H
> > +#define QEMU_HVF_ARM_H
> > +
> > +#include "qemu/accel.h"
>
> This include shouldn't be necessary.

Yep, and we don't need to add it to any .c files, they all seem to
compile OK (on osx and Linux) without explicitly including this
anywhere. Since this is the only change needed to an otherwise
fully-reviewed patchset I'll just fold this change in locally.

-- PMM
