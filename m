Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1865615lfg;
        Fri, 21 Feb 2020 06:26:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFkEJmm1MbPzVK8IJH5aMpQjYppIDi1CsX+kt1HHlkQz0CnIU4dDKL1XxCjmLNP9qoQ9sR
X-Received: by 2002:ad4:554f:: with SMTP id v15mr14339304qvy.226.1582295219730;
        Fri, 21 Feb 2020 06:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582295219; cv=none;
        d=google.com; s=arc-20160816;
        b=c1P1h4YvvRM0OfRYW7SjyzRd+Os/k7LpxPeRbqJEDuFotiimzG0w/6Ma1hEcFPOfBX
         q7e19uZgPpsIDwQBpC1W2blnbqBuzjBrNIHyO6T3Ulv8vW8AA7xIXXocC7i6a9psdEVF
         3ZsAcW1eaMI4z3o2ABQme6d9Neq4lNdMKxQ6IztPGuTnMv0CYwl41eA7umCLRjLZ3i0W
         DJl3eZKg4wBt9XNIGAHRAu1c8th8E+d2WmoGIl00k6gK79rZs9FYLH0sYPZJCUp2n620
         GqA9mRalv5Nd72tj5uv/uPJXbZZU4lTGn/MIzUdIXjSBQI27bQ1XYJDljZ5Vk1Fq4n/3
         lMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2fCPIpVt94NvvPO4CigqPV2g3CIeYezuT4KDYa1ew4=;
        b=Ht74bOxLVBIo18LvvWytl2/UUtsOJ4B6Xj8Qtv1I3/7hllQ4mop+aWSeD/Il7guBgZ
         YVmSz0A37QlnQADrjCBeZ5HE9GsRipdCCRn6F9QOJr4RWfSlkH/Enfm1djLIeWFqdr5w
         6AU1THkiEWhDrbPzJT7dE4PJL0Hkv0lngPcpDZUtnkS6n9V8EYOgNqN5+WOmFBhLlYLJ
         6B0q/hhKnStcRr/B9XAe3mTR7c668dUcBdywpf+C1o0gi+DX3VUnsdf4UvCxjH5P8ogb
         jxWn3tdNO5e5q7A/dI7nQXGUHNi6Sf0ZmRJh0rhjRrd92MRdoQxsL+mVChKcFfMhcyv7
         y35w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nh33IvWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1357198qvo.123.2020.02.21.06.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 06:26:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nh33IvWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j59Gd-0008VB-3A
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 09:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j59GS-0008TV-FV
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j59GR-000661-Ie
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:26:48 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j59GR-00065Y-Dm
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 09:26:47 -0500
Received: by mail-ot1-x344.google.com with SMTP id z9so2138704oth.5
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2fCPIpVt94NvvPO4CigqPV2g3CIeYezuT4KDYa1ew4=;
 b=Nh33IvWzD1cGAius/dAaiBVbeejIvxJ9uS1+A1EdpV+fJZ38EO9k/WPySxsLIstvxO
 U4wgRIfFQSbF1ZA2Pf1zsNq9hNYFo3sJ3gdLKgKGUs99BBPgiG84BURx6junSNENq6lG
 g5LR7C12CWST+ipLJNQ0OqjRHym0JfH1JsQr+1ufCtgjZ2TVdhIdbhfP5IZssr2UYi8+
 11WwGEBSL9aLiSdlVSZIsDvxlPMyCaYdJXC1wM+a9GbaBwdL9kGSxcGiypFEinIg7ZHe
 1fNWZ9acj1sGqFf55EzsBCodGmK1BR52vJmhGV9ukkTKXAlogTV8NBJBEFhBantOlBaI
 XS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2fCPIpVt94NvvPO4CigqPV2g3CIeYezuT4KDYa1ew4=;
 b=hiv6xdW0zn7dpaEk8fxeUbMmJc1JNZaOxWW5uUs/DhuFjzrLs6O0VVfiP/n36xptuy
 jfSqcpSoFt896rofs6Mj6dGmFRtVYi/908VwpFPMxyimH5rRIlX4BGTOcrZiHOu2RjgX
 betvrv/eSAX12RRF+aiNwHJsD1KYbAQgydw8zO6VvFi78m3Dza+dGSOGrZaYb/zC8PCi
 aV9tgz1t8j2Hj2z1wqZei2Dz9EECAt33TFmPWuqcT9YbHIWuZZy2b9p1CWopN7oAHNuZ
 GwWsgrS3V+TO2DFWkvCMiqkFVSEJMIhtrB6LBisPteyxw6Iel9+uTDo9kZCYEAUIojy/
 ItVA==
X-Gm-Message-State: APjAAAXqm1IwelKO7oZlrRN+rwWVC19Ydp4GiUOwUih5o/Bu5ik1f9Y/
 iPQ7EPo2fy3zJtRYrRrNo+QJNbwFz2FWqfaYa4euug==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr16283516oto.135.1582295206690; 
 Fri, 21 Feb 2020 06:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200214132745.23392-11-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-11-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 14:26:35 +0000
Message-ID: <CAFEAcA9HFAV+gPOkNWaixNqEKmsWUAAYjNcet8-tNJXvUyOrOg@mail.gmail.com>
Subject: Re: [PATCH v16 10/10] MAINTAINERS: add virtio-iommu related files
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, tnowicki@marvell.com,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DGvG8/Oyc4kn

On Fri, 14 Feb 2020 at 13:29, Eric Auger <eric.auger@redhat.com> wrote:
>
> Add a new "virtio-iommu" section with the new files
> related to this device.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c7717df720..b7a7a18737 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1623,6 +1623,12 @@ F: hw/input/virtio-input*.c
>  F: include/hw/virtio/virtio-input.h
>  F: contrib/vhost-user-input/*
>
> +virtio-iommu
> +M: Eric Auger <eric.auger@redhat.com>
> +S: Maintained
> +F: hw/virtio/virtio-iommu*.c
> +F: include/hw/virtio/virtio-iommu.h
> +
>  virtio-serial
>  M: Laurent Vivier <lvivier@redhat.com>
>  R: Amit Shah <amit@kernel.org>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
