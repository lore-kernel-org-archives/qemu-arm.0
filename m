Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp999706njb;
        Fri, 9 May 2025 03:38:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdENV/PubPUoC6IJvMhj5Tnbb6H24E1e+WdOR57J5JR+1QDq5lFno9r2279GLBDa21XDLxj6d6HGmhIg==@linaro.org
X-Google-Smtp-Source: AGHT+IESuSGCJisY2TwGsERP6yEr5y5XQRq2MJegXosYylkmWAzM+KrUHtWIf2BK+prDWd9mdkaR
X-Received: by 2002:a05:6214:5197:b0:6f2:aefb:948d with SMTP id 6a1803df08f44-6f6e47b7e05mr42555796d6.15.1746787074637;
        Fri, 09 May 2025 03:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746787074; cv=none;
        d=google.com; s=arc-20240605;
        b=C16jWdd8WfJomdSTC97eVYySALyvEPP3U1/Yku2vHkg+E9beoVR5hdTCGfrXvV8E+2
         KaFFDEI6ZjmxvO+w/+6/gA59Fpb1vF6TzPSo2baJhGtfhei5fYkPza2BRvHMdWrJ1nPx
         iH7yfUo9T8d+7Pr37t4LQwQ001FHGBpm8tTJftwhlikAqDV9ZV0qbRcpVAdvknegmCGl
         xvHftNc5BVd5Xzl4SRCt0jjAJlS1/N7Waas6ZBrv1t1pfmQ1sWfE6+2vucm894+BIjaF
         kaxGw+IXBYYpuvqYggqEFo0vK1d+eUiWSw2a0N4qIa/CPwRvJY4H76z0cN5qYe7JpQr8
         9bPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JxAwE6Zpu+FnMllfRayjT6qRpfVU3GOS2YP4U1s7qTc=;
        fh=tmWof05b7ItbCdSyBMjFfj9JibpymDGgl8N/i1hSWG4=;
        b=FVXpSnrPvqb+E33+1J49NYBdeoaKUOSbxYM0kvP72LCFd7jMCI5W6bjhCRjm/YECG3
         BTjlOsLszN1ndrcWx6ohWN9u6ft8xkf6LzQ7kNvYKXxxgmQiqkVe0VcBdBJr/iR99CEN
         tQcD0hfBin7P6kbnL96xbiCBiE7D0IHauNp7SZb0TwGx9AGpAgyGmgQ+gePvOOnQndGz
         JNxneKHPbmEeVliXKhEZ4srsjbqdOWYt1kRGHAKxj40pTDEDDHbatETM0mQThSUWyq7q
         Pc9nGiO5kHod3GVSDxRI6F5OBFxtSTPaUH8foXHbG0pTmXLxRO2QZNXffqDwKvPSqVge
         dI6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUTiEEY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a58bddsi20605006d6.390.2025.05.09.03.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 03:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oUTiEEY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDL6l-0004GY-Al; Fri, 09 May 2025 06:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDL6f-0004FW-9F
 for qemu-arm@nongnu.org; Fri, 09 May 2025 06:37:29 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDL6d-0005NX-98
 for qemu-arm@nongnu.org; Fri, 09 May 2025 06:37:28 -0400
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e78fc91f2dfso940142276.2
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746787045; x=1747391845; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxAwE6Zpu+FnMllfRayjT6qRpfVU3GOS2YP4U1s7qTc=;
 b=oUTiEEY6zzuLom5eS+gZZvk2wWCnOwUszPfmUB8QpxH1Yu2cKs3omTnoaHqXnJJb04
 LBMrm+/oE2nLbV09vjDzfSB1RMZSxZhezLgyfycwy+FxyQkIn4+BA+0FAAqkCkOzPWhy
 5TyWCHQs/LtBqfuRP8P6NQTZPsPZBZfqd/BIBDRiORFy25lxY1oBxWjLa2PFq0xYejSR
 UDcDymxk9/pgWFX7g/LmyDB2d6+FxmjWPfqnlHWYD7mVwYOQtho0X/bAKQA/b3si4BPT
 DjDH8Nbf+8F3lR6nb9prKXX4oH2tnD4ikCIq1P5LBNjUnlDNNRFy39PuzRY8UKs7Lwwb
 Ynzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746787045; x=1747391845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxAwE6Zpu+FnMllfRayjT6qRpfVU3GOS2YP4U1s7qTc=;
 b=wGvx9XTEIUu4+vN0sZ4Y3xkFwkvby8Z5Miclu55+M0bx5rdhzfS6DWS+vdJ9CMhINo
 l44yjcfxiQMqA4dZ1c4EAbWtC1UNSCCDGX1lqKowX6c/CB3CXXq0fMGClWqTxuWgIuw0
 VZl60+u9o5pz4ps592aHtAk6ZBcMmt/9Z6Zdx0MagNl5zCGPAF3B6bVFmJm796LDkjtF
 g/jTkk/l1E0LIgZQsK2SgptLDY5b/NBwNKfOGqdtoH83WqteAYe2fct1YRwIDAXHoexu
 AG5KN8AmtKuvJcTdi0jEQs9EFB1kaoJBiO1cLy+H8FYc59QGKhJ8mAaQhwvywnevOLAl
 euNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxaH+MT+J2Hzutec3ugyqKhUWrceNXdyorR3qhAdSTretVEnBfb3mTKdycAxjHlfbn015TQAmiA==@nongnu.org
X-Gm-Message-State: AOJu0Yyg71fEs46wPeaoN7Uejmqi94gIW/5IE5jZLcFG/qG3MPMgbYSA
 1FIlLAQBp3kVw0/n2dvANE2rasHMuqdRF0LgnUvOhsdmmO60stkcJBeyh/UqX6fJ8KgrwWvzuRq
 A1CYOqo7nww9bRz2WBnAr9d3uiBr2CEdioubZsA==
X-Gm-Gg: ASbGncunAHY4JyMoHGr5SMOy11qMoB3Iik3wkTdwAWCCAjgz0l4P6cbBYX3RWPbNOfj
 LzQttbKgbaJsHOI9VXA1AzFg6jUV05E99Wd0+lq2K448b+8q3zHZrbS4YwHNnlwrSYnwWkS1xhu
 M0wGqhAfnlxGQ+u35fumMPkog=
X-Received: by 2002:a05:6902:2193:b0:e60:a068:a14b with SMTP id
 3f1490d57ef6-e78fdb83501mr3680493276.4.1746787045288; Fri, 09 May 2025
 03:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
 <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
 <87frhglwjl.fsf@pond.sub.org> <72f9043a73294bfc9b539ae9b94836d3@huawei.com>
 <d21e0c57-b89a-4c79-958e-e633de039e4c@redhat.com>
 <CAFEAcA9bZ6Rd4PSMG61mJ5Ja07j3--DQE7KqA8RZwxGH3N51sA@mail.gmail.com>
 <3d7824d9fcf04e2e961d30a5f3404b52@huawei.com>
In-Reply-To: <3d7824d9fcf04e2e961d30a5f3404b52@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 May 2025 11:37:14 +0100
X-Gm-Features: ATxdqUG98-vokAPvGSpkWdZWQSd74NMv-QDWvbmtFS1TvyvJXi67CObm4wCuCjI
Message-ID: <CAFEAcA-HWuAUVhqsE7p2BMo6wg+7F273Q_J2LVLrHzFagTjxgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Donald Dutile <ddutile@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Shameer Kolothum via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, 
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "berrange@redhat.com" <berrange@redhat.com>, 
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, 
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, 
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3NOpu/RKpryR

On Fri, 9 May 2025 at 09:00, Shameerali Kolothum Thodi
<shameerali.kolothum.thodi@huawei.com> wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> > The problem here seems to me to be that in the hardware we're
> > modelling the SMMU always exists, because it's in the SoC,
> > but you're trying to arrange for it to be created on the
> > command line, via -device.
> >
> > We don't have any of these problems with the current 'virt'
> > board code, because we have the board code create the iommu
> > (if the user asks for it via the iommu machine property),
> > and it can wire it up to the PCI root complex as needed.
>
> Yes, currently virt creates a SMMUv3 instance and associates it with
> pcie.0 by default. However, this setup isn't ideal once we introduce
> support for accelerated SMMUv3, where we need to configure the
> host SMMUv3 for nested stage translation. This is essential for VFIO-PCI
> passthrough scenarios, where the guest manages the stage-1 page tables
> and the host manages stage-2.
>
> In such cases, devices may be associated with different host SMMUv3s,
> and having a single vSMMUv3 in the guest isn't ideal as-
>
> -We would need to broadcast TLBIs or perform lookups to identify the
>  corresponding host SMMUv3.
> -The physical SMMUv3s might differ in functionality.
> -Some SMMUv3 implementations offer additional virtualization features (e.=
g., vCMDQ),
>   where the CMDQ is is directly gets mapped to the Guest and invalidation=
s
>   aren't  even trapped.
>
> Please refer to the earlier RFC [1], which proposed a new arm-smmuv3-acce=
l
> device. The main feedback on that RFC was to instead convert the existing
> arm-smmuv3 into a user-creatable device, and introduce acceleration suppo=
rt
> via an optional property:
>
> -device arm-smmuv3,accel=3Don,..
>
> This series is the first step toward that goal=E2=80=94making the current=
 arm-smmuv3 device
> user-creatable.

(I want to start here by saying that I appreciate that I'm
coming in without having read the previous discussion, so
this is kind of going back over ground you've already
been through.)

I agree that rather than having an entirely separate "SMMU with
acceleration" it would be better to have it be a property on
the SMMU device. But why do we need it to be user created?
Making it user-created leads into all kinds of tricky areas
mostly surrounding the fact that QEMU right now simply doesn't
support having user-created sysbus devices and other kinds
of device with complex wiring-up. -device is really intended
for "this is a model of a device that in real hardware is
pluggable and has basically one connection, like a PCI card
has a PCI-slot".

-- PMM
