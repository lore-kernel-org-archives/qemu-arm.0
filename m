Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp535642lfb;
        Wed, 11 Nov 2020 08:01:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzULpuu/RnUwNFW65RF9g8v0iRNl7X4mC2QWKOzQCjosxzHlBd2cYsUm5/G8I+UcuGNCMGH
X-Received: by 2002:a5b:74f:: with SMTP id s15mr9349891ybq.11.1605110469698;
        Wed, 11 Nov 2020 08:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605110469; cv=none;
        d=google.com; s=arc-20160816;
        b=o9yqx3buhlrglfyyjZhVS+bacigexqzSuiy9WS/vkQkUqA0X3U27mVRmK2ibrmBwEk
         minMx3hAi1KNcnqKyK/AdndlNamvAOUY6IKISpHCszyOsHxKs7l63Z9VVxDOYKakzoWz
         /5jF1+zRBy2c9KBle/8Y9FdVtc9R67owOC77en8y1wD3q1UikZ1si8thI5FX2TNZojMN
         KGMlacZZTrvgLnWuxCcYXQtbX7hCFW+zOZWjtvDbASMGlXsJTSdsR+GeHcdWpvZ3Houx
         hkXPnS4Jc/0x02FHmbe4eW8opp4h1oyZDSgknfN9PMu19soPayHmxgTf3BCpvWuTMLg/
         EBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSpQgY8RPpCUDE0FaB35TKt9/mG17cZNz3XZmf1OAmI=;
        b=RBy0yimxNi207vmJnB15Wvo5aStfTeJozUH4mvpHRnpXzxnboUGDChlW/f/2pMEvaa
         emVOHXhWT5V7audMBydcbaQrJZ3M2ayqB4XONX72CTUveNOQWvEHrSwkD5vFHUWbbH4N
         dwD3hI8yVioxXe6uO/QwLLNB/Y3BqQGx+dQ8u0Z1MPL6rnJK4ahdhlfCjr7xhrSuunZX
         ISMRKbb3VDYQ0Mst+PikdwvDaVeSnLvxjM7C60HPpJupLrc7JRTI3g5zRRJPlV8IR4Vt
         gPYuVBrqDnEZJxwWlm7Avyc+XAh5rNBT990VIedml1hgD/2p1GoiqoKEhcfdNrECb/dD
         AGTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=McrajkfR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e130si1241802ybf.312.2020.11.11.08.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 08:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=McrajkfR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcsYX-00059G-3F
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 11:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsY4-00055p-Ul
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:00:40 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcsY2-0001jP-Vj
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 11:00:40 -0500
Received: by mail-ej1-x642.google.com with SMTP id me8so3423705ejb.10
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2020 08:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSpQgY8RPpCUDE0FaB35TKt9/mG17cZNz3XZmf1OAmI=;
 b=McrajkfRsp2Q7X6qJqwxIg0MdvbqROIILOP9z5/3hRg9GRVzFCJVNovUar+gvutmLl
 Xdg6782Y6+dzmmKhv1wI73FPzSJyilaHI9IA7Jukp0BcsR0hOg/U8jScJJieaqc6GDzS
 2siXpEzkdKoXBg+16JJuII3Wia6sfImbFdc1seuAwd9ylQ5CupBz8FiFK51GBQxhieCg
 LPHIj7WNbR6fmwCqr4emQueMcutUW2py8J5Fh2qBXdjukq4DJhuEYV0SZsSRj9KmVrZK
 5GdPprU6sHPAW+nUhERswSz2XBreSDxFca2YcGTl6OB/g6hhngBFCJD140QYzQ2OxjYm
 6hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSpQgY8RPpCUDE0FaB35TKt9/mG17cZNz3XZmf1OAmI=;
 b=OGvAowgGet4SSkw6OcIaIzYA28Z5MZlo89BYE66FVfDwDYaGwgASpv6wiNwfrGGxAu
 aWKEMOuNiGqzh8RKoPkU6yeUY7xGoBpT5F6iu4+iimupqRi95huIGfh/2sMEoEcVSX+c
 63kj0ZJMz/4PSXQy7BRrgU/AacqAUGLkXhHn4sbTJMs/eVn0LaZrtV5/phh2tV/p9d+Z
 81IxUqD0GVvxUUTZEAIg+6xqNONemzyd3FV27p4tTmnr62L9KksK8B7OWCFOyoHy13iB
 DwPUCo83nLJl9gV+0l4gkypal5dKr7ocaK59vSWSdqGXeM3ms+W9IcnAYgp029yKm/+Z
 nunA==
X-Gm-Message-State: AOAM5334DRHSDCRvdx3143mGkODTBCKINzP+K70quMlO1bJa1idVvU+i
 8uocWf/7wmmBmXKg9Xxhdo0dYbhGY0V+ltNMpt5Pbw==
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr16146938ejq.407.1605110437117; 
 Wed, 11 Nov 2020 08:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20201111143440.112763-1-drjones@redhat.com>
 <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
In-Reply-To: <1888391810.22919498.1605107125694.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 16:00:25 +0000
Message-ID: <CAFEAcA9pYcXZ9LF=76N1OxF=UgYkiF+Z549vq9xWpS52qV7cLg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
To: Miroslav Rezanina <mrezanin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cnCWR2nMZCSU

On Wed, 11 Nov 2020 at 15:05, Miroslav Rezanina <mrezanin@redhat.com> wrote:
>
> ----- Original Message -----
> > From: "Andrew Jones" <drjones@redhat.com>
> > To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
> > Cc: "peter maydell" <peter.maydell@linaro.org>, philmd@redhat.com, "Miroslav Rezanina" <mrezanin@redhat.com>
> > Sent: Wednesday, November 11, 2020 3:34:40 PM
> > Subject: [PATCH] hw/arm/virt: ARM_VIRT must select ARM_GIC
> >
> > The removal of the selection of A15MPCORE from ARM_VIRT also
> > removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.

>
> Problems with missing dependencies solved by this patch.
>
> Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>

This is the second of this kind of "missing select" bug I've
seen recently. I don't suppose there's some kind of testing
we could add to 'make check' that automatically catches them?

thanks
-- PMM
