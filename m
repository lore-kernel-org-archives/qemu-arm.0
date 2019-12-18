Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1235520lff;
        Wed, 18 Dec 2019 11:35:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXzucSG6ZhHaPoCeUhu/2Tnn/3OtLaKA0IaER/hcFB6Dyw8HNvf1YWT5Yhf6Qq0cGatn4y
X-Received: by 2002:a05:6830:4d9:: with SMTP id s25mr4352516otd.171.1576697756612;
        Wed, 18 Dec 2019 11:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697756; cv=none;
        d=google.com; s=arc-20160816;
        b=G5BXFUPb7dptZEx0GF01/kyCwSNxc6EahLHsBlGjyoRSBuFH8d1/4OGkFPxZmbMj2w
         ZLzB4h0jOVX8mvmp6crlFzB8gNqjcu5Xy9Cb8pq1gGeVxew8XjuKO0Mdx88UDgVhj310
         aCOEoU/adddScO/tmiWjzMjLMMyirGn0Z7iG/PtogRVS/5klrCSaMUpma69IA9hvyJM/
         wKLXyPO4OgXzIEAEKhNYLtSTm45YgCdoDFyUuUWc4hsUDyX1+zjTCUon3hnBfGLZVsB1
         YowGmC3xvOQqiJEs2w6kEYFe2awFqEAJqva+/VDVQJpyX+qWGutpvUpTXYoEz4Ll8Lbq
         cnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TmnglxQBI0Zh5IiPq1gi/yI35MDQ3krWMoDnxyu1Cho=;
        b=JE+BCn1Kr2fSwi6LJnnxE0s6Qsy6gq4x8HZ0umYW5rypIsbhMY5DrbzojIXjYf/l84
         C/gHcSh6/kWbRFG1kFt2wrWr/FH96dYoBRR9p7R3a/b85AtvAKEhwXWBfLblLFrY3YhC
         /YZyty70eVyYStEK9Y3Fi0YpqnDmvBZRpB+4kJldB7ZdG6qVnmt1VzmVidh40ws9u7c7
         f1KmPT+znkr69Ty5rTQ4DJ/a+vfIk2hiuyWzBgTr/CJ5tdCvIXuk8kb7U5rTZPPLAM/5
         4koiQVhEx+WSnqSMFHgXY+u7MqTRR8A3rak770tCfQrBjyhVRKCFuK5oPR18Hz1tA1d6
         0y9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AW/juRHH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 90si2094671oty.278.2019.12.18.11.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AW/juRHH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihf6x-00014g-KY
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihf6g-00011x-Fm
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ihf6e-0003Rd-SL
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:35:38 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ihf6b-0003CP-W4; Wed, 18 Dec 2019 14:35:34 -0500
Received: by mail-ot1-x343.google.com with SMTP id i15so3832751oto.7;
 Wed, 18 Dec 2019 11:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TmnglxQBI0Zh5IiPq1gi/yI35MDQ3krWMoDnxyu1Cho=;
 b=AW/juRHHuM14qB7AnOQ5IH40wCmnXzkDnQ4eb/kyMN2bHBZJSjC2KpaWKdbD6Joty7
 i4xcZLHZV+Jnm1aPK+NQ/9upi1u+O0DWDXg/JuR603I8hd1hobAWS2lib/WCRrjWRqLm
 vVH1ucfNJF+hVkFKKDZylI2YhUBcuIwRlyibhiyabJLX+O8JSBk1Gn30f/kaRS5z+UyH
 Xen05Lxh8wEbso9HhA0ATPePYQI/vVn/0Pke+ISfzRoTA8mo+OO7sI3qM7/nZxU+zI/c
 1OJjB5AWCZiJcVyjtvc/AGDbYUM5H0gJPGqLxaqhbPIE0C7knHQX9SL4dkk8Wp/SKNL7
 oKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TmnglxQBI0Zh5IiPq1gi/yI35MDQ3krWMoDnxyu1Cho=;
 b=s5lW3qNWk6Z5ng06nQnpLo5drWz1XlN/k4JYuCg+I8FVUAJzG7j68zRlh2VigigsGm
 wjgAsub7sziABKudQqGSyuMqQTONYFUiiy9vZ3hw2zC5adaf71f4UFhNPovUI5ExyWyJ
 hWjQFsrGyAWbEEfMqF77XpQW9LNf1FTjuQicqOrhiLSTOuAQqFRbVRcb11i2IAHTsny0
 Wl2/g0P29H7zr7zuwdIbfGQc4dMWJ1LQ7BWQHbmunfeZBxY2YX6Ei/0ARzV2zlvSYjFw
 ut6YYb+qnZi5devFHQUeK2y1D18CbPcN9FbE4QhrMmNzUWu2yxkwCehhjN1YXNnvJjxm
 +3xg==
X-Gm-Message-State: APjAAAU/a5aMXRdMxgTNcS5KgfCGXSEGEh/vfBVP6m6w/FjKG01CYZ3h
 /9bsyAXkqSTYKWYnQv+VN/1JB71spmS7BVQ5K4U=
X-Received: by 2002:a05:6830:1741:: with SMTP id
 1mr4536567otz.295.1576697732994; 
 Wed, 18 Dec 2019 11:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20191218192526.13845-1-philmd@redhat.com>
 <20191218192526.13845-7-philmd@redhat.com>
In-Reply-To: <20191218192526.13845-7-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 18 Dec 2019 20:35:21 +0100
Message-ID: <CAL1e-=jJFgah4Z4SC61dic7ax0dwc9stS2F3PqY+kchfUWOcwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/6] hw/pci-host/designware: Remove unuseful
 FALLTHROUGH comment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7BGlrdhFF2n6

On Wed, Dec 18, 2019 at 8:29 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> We don't need to explicit this obvious switch fall through.
> Stay consistent with the rest of the codebase.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/pci-host/designware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 71e9b0d9b5..dd245516dd 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -182,7 +182,7 @@ designware_pcie_root_config_read(PCIDevice *d, uint32=
_t address, int len)
>          break;
>
>      case DESIGNWARE_PCIE_ATU_CR1:
> -    case DESIGNWARE_PCIE_ATU_CR2:          /* FALLTHROUGH */
> +    case DESIGNWARE_PCIE_ATU_CR2:
>          val =3D viewport->cr[(address - DESIGNWARE_PCIE_ATU_CR1) /
>                             sizeof(uint32_t)];
>          break;
> --
> 2.21.0
>
>
