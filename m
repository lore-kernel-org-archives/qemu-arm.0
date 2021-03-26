Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1217168lfg;
        Fri, 26 Mar 2021 03:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxumFvEVBxNXkRRggcHVu9w+Elc4Q70N/Bjf05WNweEH+usihB7peUimsvmPOHzRvoI4OVX
X-Received: by 2002:a25:c105:: with SMTP id r5mr18284276ybf.413.1616754082642;
        Fri, 26 Mar 2021 03:21:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616754082; cv=none;
        d=google.com; s=arc-20160816;
        b=PFfR/SqElKjVJPUmMutqGyG7fYLUpFLpj1nSJa0rKiq68076alqbokqW1zeX4SNsmP
         ellLUBDOLTnNSzQf0EfVoIzD5bvMnxS1XnBj+v7wvLRykbZvC9UbUh8I5ec9ncTSnyEC
         V1tt+yQDxAvqMozVG8H6OFOoD7YFlx/aB7MaeVpSBj79QZkB17BW+KYzpo3R+GXWqbi+
         SYhOWmCWOdUkTGFmHu38jJcLjjCYBa1JBGfr5MBRZOAXkYhJx9R92WQI4GWdhxQUWjI9
         ynVpcaBguVlypLBeslhV1Hq87EgdeV04URKtXF2PNXwSQaNPXx0dl3iTnBW1bt/2dOPm
         xlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5WJN03Ew2msb1e6JG5mzDx9NLkxyPo7Y/N/B9i/feOk=;
        b=tWYo6oiWxGx+3/gtoq+nzdN5ovEoUOGHAr04jhSMDEP2UDMvrRTJifk+RDEb2KjB6n
         mMcj0v/X7+r4/PBRpTN+rbOiI8WiCM/UCdSWROUsw+ZgcABJ1luFa/92CM/DOAF1j5lZ
         bDgI4OQvXlJgIFW/Ruaq8fzt3vUwV7ij7hhwYIwlj3wNd+b/t5iYVJO4ErKoGxFl+ieO
         F8MnWNttGQ8l4fiXqDHrd0fiiSSH5JX6k8FLMUFY2iXXG1/4qAlDr/nuK9Yxxk0Zr1kg
         i7IYFTjiaYIs8IPOXV+QfmnQPDHG4kYkpLG/gFkazx11y+vrTgtkUBc+8wLEWmn+UXJ/
         Em1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VusCNDBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e61si5558344ybi.155.2021.03.26.03.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 03:21:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VusCNDBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPjaj-0001L7-VN
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 06:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjaM-0001HA-65
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 06:20:58 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjaK-0000Yw-9h
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 06:20:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id l4so7560690ejc.10
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WJN03Ew2msb1e6JG5mzDx9NLkxyPo7Y/N/B9i/feOk=;
 b=VusCNDBKNMaFze7Lnutcw2psNPQnQi4TZB1Q06POW0V6gExS8mxK/491KtuIwefCyy
 H7hChsrh9Lh+xuP6VCDwoQr9mOniRYRHd+Ln9GycpZB9xvH5dP0XDT1AtKt4/YI4JZzs
 cS3QbfCVlySh4a+2o1vKwd0Vl8/d+yJF3YRsP0kRRoxUFz5qnFRBxzmFMcmwixjol+V7
 wDIAlCELkWXvcALQhoTjmTjwv+eNWdCklJS8J9ZIWAd1KsBMXkIzWeEqZ/t2Kk+ulFlG
 G30asZ/ND8nT3ft+k1ChFq4MuZ2KcYEWe+1ewJ77t34xcA4BWyTycvKzqD4bL53VP1lG
 srCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WJN03Ew2msb1e6JG5mzDx9NLkxyPo7Y/N/B9i/feOk=;
 b=bYiZVHXAjEgZ47mMo1B3/Nhx/R64rsx7oexZ+R7Xv1VPxxlepzHqe8UE8oLfkoUVfL
 rpYA5hkzgTHxs7RpTZRqiXVruqJiGA5h4evQfYvGeE82jXjY7/f9F0RIkC0T7qsipIvZ
 6xR8PGwQmFbTRqCqyDaKQreRA+ndQ+0Uc6Xt9E+BSMh7K8qJEzPTXWi0wiOT7AbDBkZS
 6kha9tYxWovBm9XXpqUr/V1MX+tSQAzZb4LNIK3QwJ663ViPtM9CpLXd2+2CcLyMy1Wg
 VNKqJcRisxj9QX1wEKdGDKVr8mkvY8psDjCvM+sBOaGPKuJIsI5YCsi+3cdgMAF2ACFV
 A/jA==
X-Gm-Message-State: AOAM530jpECT/sdLPpz0mn+qMHdPBd3I1GbyK/J3G/LcZ71Fq6noYzoV
 1DdNfjkArCCFyygiLf/DIPWsVA1a7r8bsxylfg9VAA==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr14768445ejc.250.1616754054595; 
 Fri, 26 Mar 2021 03:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-2-peter.maydell@linaro.org>
 <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
In-Reply-To: <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 10:20:22 +0000
Message-ID: <CAFEAcA9WqyauWsF-5FbJMt=0NcRoZZfJmunDhvqyaSBUV1xm8w@mail.gmail.com>
Subject: Re: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ReHnsGoC1Cu

On Fri, 26 Mar 2021 at 09:27, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/25/21 4:33 PM, Peter Maydell wrote:
> > The function machine_class_allow_dynamic_sysbus_dev() is currently
> > undocumented; add a doc comment.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/hw/boards.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 4a90549ad85..27106abc11d 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >                                 const CpuInstanceProperties *props,
> >                                 Error **errp);
> >
> > +/**
> > + * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> nit: s/of valid devices/of dynamically instantiable sysbus devices ?

I was trying to keep the summary line to be one line, which
doesn't give much space for nuance with a function name this long...


-- PMM
