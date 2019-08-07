Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6693194wrv;
        Wed, 7 Aug 2019 08:32:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycgtQd3FgUiTXfBdtmB1FTFbF8W7/1Im8fCKCAk8SqPQz0OcgwDuIOIef+1O9cHGQH86Oh
X-Received: by 2002:a05:620a:15ce:: with SMTP id o14mr8962655qkm.30.1565191919972;
        Wed, 07 Aug 2019 08:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565191919; cv=none;
        d=google.com; s=arc-20160816;
        b=yzXHtcbCSUt+zc1gsVyyGnmB4cLvISNkGI5vrwjOkuXtW2tGlWx350D28klKtYsXut
         AdWWi6jyHx8vTZRjpawe/maC+XKxla2qHhWn7ZlzKQZVQt2WWeRLRRmF/G0wc1uAc+Wm
         jNBWRDY8LfjiKc5suPzuc2Yw+xUIz6Ib2/UH2b+xYdkEGl6s8in3vsLGsGWw51fzMhIp
         Eh65/xsxWyjkH3wEkAIcD917mx6U300ynBlQTwsgdcA7Zu0qqlVVBZomDpbdfeeHUIKl
         +c7MweChPXZh466OTcfX5eaGs+LpLdOigXC6FNBm58+DLLFqsgAi+bYVifXNBduX4gHh
         bzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n5CUP9iKngGTYQ6rCMj6xqqpG2afIWfSpULWf3AWlxM=;
        b=g5Ghiih27aZ3volvACOf9gAqGcUTD+pby5JfOHlUjIg5UhUHFj2BCWrGFVDBG/vfYg
         Y4htVHZ5r0pd04t3btWheCluPbWxZhwYT+4tNC0EinuRmRIwCT4Mi9CottHbagBUobxO
         riV9HUusnR5SO4TtMbrnLgkPS3LPJoHdiYmY7QUA46Kxu/UEIG6+VXU3zktxNay4iOhI
         cBbaxIEvvX+lqx+dVjxAYTLUYXVtPMYPNxomA1CVLcc9CyU3QCZGi5aXAf8KcANQ1An9
         swiy8NZu7AuHq6p7T9rADicaVv8nsb1fu+8GeS10UMj926OkUqBkPfh9LrRqhb0K8Nuh
         dBWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMTd8i48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p55si42614418qte.120.2019.08.07.08.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CMTd8i48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNux-0005PB-Ep
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54889)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNuV-0004wO-08
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNuT-0005DT-Um
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:31:30 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNuT-0005A7-P1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:31:29 -0400
Received: by mail-ot1-x342.google.com with SMTP id o101so105936545ota.8
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n5CUP9iKngGTYQ6rCMj6xqqpG2afIWfSpULWf3AWlxM=;
 b=CMTd8i48PMxrLsjFr+fSpbmiVt37WYHsZccBV6owzAQntGFrj8EmkF6ecR0ADumr78
 aMt3GIj0WmwLtGilhfXia0GCKJo9mf8+liBY7xhXbq0C2KOJOWGlfNNIZ34IzgvFB3cr
 PKRebkbjuqanID3NgmtSc/DIWZhcK1XCt7tmYuFcpaaeZCk61Zrn583KvxUaZeXf26cc
 D3h/HdFKLujss/EQRA0Jdxp5UtxWmIoJSeKt9+fBi6T9uH9Xqd5HEd5rlLAkmydkj3/l
 eCtYwCAQbSECn9FqmdOi1iXADXCCPZiRmIz3ujjBZr1bKxC/Q13l79fpGnoXlTtq6jQ4
 gFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5CUP9iKngGTYQ6rCMj6xqqpG2afIWfSpULWf3AWlxM=;
 b=EtQoQ8gpGqWwGaWRiJZU0M7rTh+V2Cf/CJT+KCNU0mnFJz2k8ObjyqofPYJSn4xeC/
 4DvOBhs5RxRxbhvhbOepgOBzLW99FB95gA4BQYFmjM1WO1Fa24dQzirIMnCJh6mmz5oV
 hqX/wx/q9oa1rR/BNvZBxzHwncJ6QAJrfx/e0ynGepa51gfG7y5+4UwJp5mQiad3UPl6
 zoNbtZRiIoebMeK4n2Xqor+xkZMa9qqjQgO3ycDOQWTzf5VSRv2eH5cM1px+18P8bCuF
 jz4yYRgFA5AeVD9F8ZLsHw6mMoxE27A9ZNgo/QarIgS1MYkcnPkoVmI1t1XR+ynik9//
 rtRA==
X-Gm-Message-State: APjAAAUpUZu8x03yiV8Lx2+Bv4c4A+lfbRcz6xPlu2PeYxwNi2ZOLvgC
 nyUInnXtb5ahTTtQJzzqfC6rPTQqS4wE40DbI8QQWQ==
X-Received: by 2002:a5e:9319:: with SMTP id k25mr10482751iom.137.1565191882962; 
 Wed, 07 Aug 2019 08:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-13-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-13-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:31:12 +0100
Message-ID: <CAFEAcA95fPLh=KgYFgtCxrXR5Vm89-=2fPq-psYYiiJ84j4qvQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v3 12/33] hw/pci/: remove qdev/qbus_reset_all
 call
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tsgsVcnOIZPS

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Replace deprecated qdev/bus_reset_all by device/bus_reset_warm.
>
> This does not impact the behavior.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

I'll come back to patches 12-28 later. They're all ok
in principle, we just need to check that in each individual
case:
 * we've made the right choice of cold vs warm reset
 * we're ok to switch to 'reset including children' from
   the legacy 'reset not including children' semantics

thanks
-- PMM
