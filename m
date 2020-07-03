Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2437742lfm;
        Fri, 3 Jul 2020 05:54:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO78meVKPy9BL6ZzmKrDDff4KWfsL7XIBKvbhvarNng3yual29BB2/9wmECgfApVBMdXku
X-Received: by 2002:a25:2e48:: with SMTP id b8mr55057166ybn.56.1593780850604;
        Fri, 03 Jul 2020 05:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593780850; cv=none;
        d=google.com; s=arc-20160816;
        b=UCO6ldZzFZFIy3JYuyZcemHmXDQ5Kq7IUOd9iBI5dvvjek1PYmlonAcAHd5CEM6plj
         vZI1WTpB/iDIrAx0bVJbyU/V9NxxOj2oYR4E+eQ95C8+bdibT6taMNqkjOVUP+4Obf85
         sSGnkYPgEkH7I05QdpQE5DGxXPNlZ7/YP3Eu8rMsBbAtnD3qdXad3WSQhBNvSfkRzz/W
         7NMpcGV2dvAZw4zQl48dSelvpqyw16pPMxld7cn8+N4guXEMekiuPCU5ln5fJbxKMliy
         okw9faAC+XQ4FNdN6lpr0hHULwUlj3bXwLV73ERXqS75wfdgSBomkx+R4a5LhnAViWTT
         BZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xoXAkHV9BNTNXR+n/Fpi0WsFKP+QXQPwqueqnn44d1E=;
        b=cuf87aIbjnk/8yVb6eS3REXGIGB4UlmMt/RkKGe0Zh+BtegXbY+4wLBPGfe/zoN/0E
         81YcZOIQYQ65ljYqjOPwJpSi3RTRhTIOijbpQwZ729MMN9VYvEAVlOmN1/m0ZOiebZlz
         ijaq3WzmOekAf23t1lAV4Z27u+jS7R8VTo7kwGNvcRTJcokxCFD+NiY3s2ZBXPzy0HZB
         F8ZUatzDiFuU3YtkTZsValY1G8cdPJoUh5MZZEIhhsJg331yZCS+AJynwO3es93ZVOO6
         qwdhDR/sBQW4GrXcpsINrJfc1qetCZAqd2yBDbjnBLe9vnWVImTxYJNICsn+CDe0OTib
         Ja4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="q8t8RC/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v61si11066943ybi.36.2020.07.03.05.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 05:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="q8t8RC/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrLCk-0008He-0C
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 08:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLCb-0008Gm-Jz
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 08:54:01 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLCY-0002as-Ll
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 08:54:01 -0400
Received: by mail-oi1-x242.google.com with SMTP id t198so13874347oie.7
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoXAkHV9BNTNXR+n/Fpi0WsFKP+QXQPwqueqnn44d1E=;
 b=q8t8RC/L4adX59xJs+kQpdCRunP7CqGk38KIbatQ68VOKC4LZOIBH3oF24nbennFVJ
 xFvEZUAUCkdzsg51FRYLVxpQRI1MyVuxipwaDnr6iPUdbY+daJHCTK5pSuMUhdISgJg9
 1yNcgoybVJwP1Bi1SlOApylUYNbW7CcI2CKkCvgXeERBUt1DUis1H5PnGe4elhLlej0g
 ia8idkqtl30wz/0myuZB2e9m+l5kn0WsXASRDIUU1PGon2Q2MkB3ADYXRkj7O+OdZXjR
 NTQatYxf9L5iM31uPr75fLkD9N6ofoC7ylYTNRSUx22PZqpFPRgdu1o658Izp6NOHrVK
 5C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoXAkHV9BNTNXR+n/Fpi0WsFKP+QXQPwqueqnn44d1E=;
 b=l0AFszFj1VtliGUZUsH+6qkjmzD9nm2lNePdh0vX5KSjheAEXGS8vIcIbqB/FDtK5C
 xfnQGd4lPKaLtsJHmfpPC+3FHmDR+z5ahHH6GPT7B2Q9dIAVqBHcY8YRwL0wl9hLr7wC
 N9ARL78PUb+WmP1U77DwXi7nj6zK8/DJzJ9E6NvDUAQJaqGB5Ee49HeVhLP9ri1bdDYe
 EhrI0xvUb8Z9JC7FLoMz+cj/0QZuS5EbdjlaBO7GRqyYgHdr5XXBtvYcQ+CqWRfq0tQc
 VIdkZT47MI+00n6pApIww2Ogj5TsrX6hCNuhmagMP86EBDlDmgRk7z4vH9X/wMpRNdkW
 Msdw==
X-Gm-Message-State: AOAM531rBH6ICI4Tc5onqgrAKvLoyPsygiB+qG2eQrw/bkMFn86R486Y
 Dy+Q6ScSUb8CtdqgaWmOqYNs6WXF23LvAInGaQvyRw==
X-Received: by 2002:aca:1706:: with SMTP id j6mr384027oii.146.1593780837178;
 Fri, 03 Jul 2020 05:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200629070404.10969-1-eric.auger@redhat.com>
In-Reply-To: <20200629070404.10969-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 13:53:46 +0100
Message-ID: <CAFEAcA-1qE2_6LwavqjGEVqmPfNUxCwPxgGr9KC+3MXWvfR0XQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 bbhushan2@marvell.com, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4BN4Hmbcxvl+

On Mon, 29 Jun 2020 at 08:04, Eric Auger <eric.auger@redhat.com> wrote:
>
> By default the virtio-iommu translates MSI transactions. This
> behavior is inherited from ARM SMMU. However the virt machine
> code knows where the MSI doorbells are, so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest iommu subsystem will not need to map MSIs.
> This setup will simplify the VFIO integration.
>
> In this series, the ITS or GICV2M doorbells are declared as
> HW MSI regions to be bypassed by the VIRTIO-IOMMU.
>
> This also paves the way to the x86 integration where the MSI
> region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
> machine.  However this will be handled in a separate series
> when not-DT support gets resolved.
>
> Best Regards
>
> Eric



Applied to target-arm.next, thanks.

-- PMM
