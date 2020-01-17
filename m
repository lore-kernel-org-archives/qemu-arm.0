Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9652711lff;
        Fri, 17 Jan 2020 03:08:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBAS1ZJKpi+Kcx3oZGe1KJs17oH7pMhM1nY4R/Li5zMVC4BKk3lA07JnWjZkhGhmm1xBN/
X-Received: by 2002:a17:906:a859:: with SMTP id dx25mr7402350ejb.226.1579259280591;
        Fri, 17 Jan 2020 03:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579259280; cv=none;
        d=google.com; s=arc-20160816;
        b=CX808h4AfW7Ris/zyPgkJD5h/h4fNm4cfCVNncNbIfWS/OsKRLLw9JPw9PHZOALN8w
         wTt3DSkRstSXtdi9P7gls2Wj49ZlhHgliUpSnWB1juxFaoAtc2ie3ItHh0Nla6oBg9wQ
         OipS71cAla4HfxSrZlLwnsF9bkQKkyIoZfQiVUxnHWAiXJwS8p4Dz1vMD2ZRPK0eg2xX
         AwDezC/m9ss+3mbNUCVyrf6/2OXxHeewWsBxJesJl05P2hlwThzRSLSFPr2q/CmfNkgv
         x/KTx4rVNgvBLGdh4u7Rbxe/DLQkZWiZwG+wQA2LiyxPY3FTnc+bizfhNxSyHyBpCyQa
         74Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zH/wNJ76wLw/+0fquGdJeT6sWMpTUa+KgeuMJcheKcE=;
        b=NYzVFMDl7AcFfOUyQfjPFJl+dOKCsDJOV+Kj/iZTLDnaO/pRpys30qxS2UFGPH2m1n
         Shi8B7Y/Tavrx8sqLlPVdJLFG5gJtdZnt2Ea+qQWBgWJPYvWjIH5UaFuJXxJ34vHwUSB
         mVKe3iIL/NlWcIXMhHDfEMSSqcRn0lwMu1yy5Rnnap/QPC4D+iQM6/p46Y2hYEdKIazS
         ogl2IhC3Ppm1+32mIXQcklhyVqD4KUtXyWi3Z0w4QZONOT/7KVRlpjVED1vaw5MotgHP
         9dhOK4/9Uk/UbG/6dOkIEO2fNHCJTChvetPj0T5tzGtJ10ThYnuTpp3WhHaJWDQ27R/B
         NklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HkeJRwQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si2361010edj.583.2020.01.17.03.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 03:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HkeJRwQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isPTr-0006I3-Jk
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 06:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isPTj-0006Gp-7J
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 06:07:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isPTh-0003VW-Re
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 06:07:51 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34052)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isPTh-0003Us-Ka
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 06:07:49 -0500
Received: by mail-ot1-x341.google.com with SMTP id a15so22226324otf.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 03:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zH/wNJ76wLw/+0fquGdJeT6sWMpTUa+KgeuMJcheKcE=;
 b=HkeJRwQ/uade9ZX3c12JDT4Sm0+bs+Eg0Y9f6vkedd7QIm7J2SP6RYZYwYr7pDfSx+
 ExjMpLbfE7/owQDNxPfl3j9Crhp31N/cL3JwUidh03Cub8kAhsEfxgjXTZ9/csdnhO18
 idLfStA7WuWQGmyvsJnWo4Z6kDcl1ZMeph8o7tbCdQdobTMuKL72qXH/iPX8HbjMJooM
 cjx0Af++DicAdgCAiF8UR46AJE/W8tO8GB8CmqXb3BoQvNsjnncYUc4LbkNNairLw+Ug
 OV8lR8BtGKDCgyTXVYdLi1nKNLuTak2LNCY79/mgVGzPrjbr2+x+eyaa+orN2lRll6Vt
 GhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zH/wNJ76wLw/+0fquGdJeT6sWMpTUa+KgeuMJcheKcE=;
 b=LoXLzZEWzCTY1MDu80ogIeg51uiqhk+PQNElUUmMha4mdtlPJOBSiFH3JxK1tvrDEe
 VMcwjFrsxIw4z1k9OFYEfX8sLKoECkshpjrsT4YEQJf56FJgdV+N7Jn/DsiD4G/YS4mN
 jpRNp23oluq92Il3vhzHl3ZuIc1GAfjCL5eHs6qBbqKazlsSF5WVuxTqi6Rjj6HQSTjD
 K/n7Y11eCbkfmMXQnpZlE6FuL7pYBGGEsqWAOO1JJJMMqFi4+PkZZdaqmqBNwyAM7aEX
 GYWOmx3YOyXtxLOzBzt1usehd4ySxcQHrCx9+6TCH2LCkRBHfpj4BCl302WYwfLv2Ray
 w6Ng==
X-Gm-Message-State: APjAAAWbltQP+UA/wVYMjU6K1yV/0e5D6CQYHyeenRpo4PHOlibfaCkC
 AtO9aEMaUcemPUySf9r+agagiOdLth4NVKFyian6uA==
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr5402453otr.221.1579259268244; 
 Fri, 17 Jan 2020 03:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20200117063822.57918-1-zhukeqian1@huawei.com>
In-Reply-To: <20200117063822.57918-1-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 11:07:37 +0000
Message-ID: <CAFEAcA_Cji9poXhv1=cje3r2uwz+X_iYo8TmTxP_wP1CRV-b9g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Adjust some coding styles about memory hotplug
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, wanghaibin.wang@huawei.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aq07xeVm7WfI

On Fri, 17 Jan 2020 at 06:41, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> From: zhukeqian <zhukeqian1@huawei.com>
>
> There is extra indent in ACPI GED plug cb. And we can use
> existing helper function to trigger hotplug handler plug.
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>
> v1->v2:
>  - Add Igor's R-b
>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/acpi/generic_event_device.c | 2 +-
>  hw/arm/virt.c                  | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 9cee90cc70..55eb29d80a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -175,7 +175,7 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>      AcpiGedState *s = ACPI_GED(hotplug_dev);
>
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 39ab5f47e0..656b0081c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
> -    HotplugHandlerClass *hhc;
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>      Error *local_err = NULL;
>
> @@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>          goto out;
>      }
>
> -    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> -    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
> +    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
> +                         dev, &error_abort);
> +
>  out:
>      error_propagate(errp, local_err);
>  }

These two changes are unrelated (one is just a whitespace
fixup, and it's in an entirely different file to the other
one, which is making an actual code change). I think they
should not be in the same patch.

thanks
-- PMM
