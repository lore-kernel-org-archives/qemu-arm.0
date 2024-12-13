Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp441786njb;
        Fri, 13 Dec 2024 05:33:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX52g4kWO9cnZgb4P5HCvN4H9f8bk9OvHzXdr8zxbP//4gQbp13hSCA3z1pU5aTQZKvRwQB7FYb8mnMeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHoLfZg2wbeYULPQ6qlwqwALSZNgcdEydPw0Zcsa4CvU6NNVEtQ4CGhrBoqaBDqtGZxPlsk
X-Received: by 2002:a05:6102:5086:b0:4b2:5d10:58f2 with SMTP id ada2fe7eead31-4b25d9dc06fmr2457594137.14.1734096821180;
        Fri, 13 Dec 2024 05:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096821; cv=none;
        d=google.com; s=arc-20240605;
        b=L1JIBpqPnRVDHTtGrcCIxbyy0AK9dvCDrMgqajv6CBBbJMhaYzIlmDcNnHex/D2gJU
         qCHeomvzRpmkbS1H7KHj0xyQFFrXdkvD4pvMvY6B5WyP+ZrWjmt95FHEVp4aijVKs6h7
         KkwrP+w5Atyj/7Wsc2yOS6wV70Kg6iPpTaK5ml/Ag11BRinxYGyu9eXNo12CXXxpoMic
         +kskw7/nj4Zh8JJBwlnhDo5W0bzUuEogM0Qyc8l06+UxIgXaSDXOynL6stFUDhIwnyy/
         UUQU7vBty4UgkyYEBiJ3niqCIiMM04WjMb4+57OaRm28kgZqT+pWoiEACstyykAy2jmY
         W29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=piXXDZNp+2KqmXj1aW1aqNKgH/s5yCr0icvW0IsA9Hg=;
        fh=gQbzx8oRAgfEx0WIAJhnlishM/YV3brO90RFPLGx4c0=;
        b=XMv9ZcrRJ8h3ZtpKmKtDfH8JooERHlVGJNqKMtC3HxOi47MIRm1kVCmUMUgcKk6Aqe
         cDpi/OsF1yCaQT1yv7Oc/uEObAwkijp2EaUVfEhQLDA+DH8gDMtKgjwL3+uL4KWvOEcu
         4dahRKgNvbFK5NUhLFie0LWxQ+MJtwF4fcKW9/GqUyJKTW+3AODoD7QBuC50gRhWuwGo
         oOz8zKzYtMnbcq+gnYqYDXU3y6Pvw9uZWXbbfelzNJMhjaDueQLi0+plzn6BcbeFwGwv
         hZiGlYBOalcOHYGIvI0Yx+h1EuYUXNoXrrVMBwwZqUGqDF2US912mi3ajR8TfwCEy8Ob
         AinQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwdxxTbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4affc654b76si3400109137.57.2024.12.13.05.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwdxxTbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5nI-00050j-Sq; Fri, 13 Dec 2024 08:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM5nF-000505-AE
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:33:21 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM5nC-00010i-LS
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:33:21 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6f145e5cd83so15334937b3.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096797; x=1734701597; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=piXXDZNp+2KqmXj1aW1aqNKgH/s5yCr0icvW0IsA9Hg=;
 b=OwdxxTbOHgrKiIJBpck0sDhESM61FtdD1fX3qdAnEQBCOEaeG1epY48f+htRVGBTkl
 qHCKGZhQYa3uUBbmA3YjYPUgHbg6qwbTgzGolkwAwNPZqw7RNfIlOfbv3y9jLU7fd4wv
 6g5wGtou4x0ZclN9VvXvKhuZgIfBrDQxCgLJ0pPhNk/i5dERTIAVXwrzCkQ7w3Sy+Ixu
 YnjRl/cWe+Q8jBejCYGSXk+5VehAo4YIxQ3ZGJeyjhIFgCL41UaxurGSePBUMQf74HYf
 riVOzWmsggYtBvdAJ7qluN/d5ZX8ZwHq7j5FM6IAkUifI6LEBFUOG3j1pWUAUKPHmghc
 5xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096797; x=1734701597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piXXDZNp+2KqmXj1aW1aqNKgH/s5yCr0icvW0IsA9Hg=;
 b=KLYsytSV5WFLxx7uA2EsPO/Ecdb0SavCU514z5FqBZ8jToakQPtKiZxKTgQz4LEowI
 qzdW+EsXmDZLrLZ+pBgBpucy7gpsL8lKW67KjHLHU8U48iw0Mfc8N0jpGXWq3is3jLtb
 pTLuZTPaDE2G2Lv2VELxeh5JX4H3EiCcQGKOMt8UJ5JNZ5CgBub7tb8gMquiw2cmcJJ5
 Jwd3y8TiK5JHbA3REMimVc35NHUUyxBFuVM4UrX+/ocGp1p5FRishqtB2OeclRxYJZQO
 fiJXreT3IXfF2Ykl58+auPhejcXLMaiFKLXEPjj6PjOGS02esZd6FjdFBVjinhKYam57
 8o3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4saOxpQmYL/3pfvgKNwsB0tN6soHEXNirdye3Sozp9Kczz/otSa3UpTnraPXRytMqoaMwcM+n8Q==@nongnu.org
X-Gm-Message-State: AOJu0YwTSR300aPxG8KiqIjmqurjPzAoE/57QkZAxgqWzLgC5IESUpHa
 PPfpl9TPxldvQs6jHQtrM4lg+NiG6B3vCAeOnP8hgSi98jFiZYVar8SDzfkDRtW+w4vlSTuQloN
 ICEUYGdOHYG/73SmXoyF8M2jQtioVOHGcZv1SDQ==
X-Gm-Gg: ASbGncvWQPPmnMa3thVyXUZLRt4PM6N8Tc037GHjEA4yT5oZ2FVPr3aa+l3hnMzksC3
 0Zg32vfUIuMDfFlOeziXmJeh/JXY7mRDvXMP+zo8=
X-Received: by 2002:a05:690c:748a:b0:6ef:5688:f966 with SMTP id
 00721157ae682-6f279b9bb53mr24243737b3.37.1734096796837; Fri, 13 Dec 2024
 05:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
In-Reply-To: <Z1wsslDnwlth3A8+@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Dec 2024 13:33:05 +0000
Message-ID: <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, eric.auger@redhat.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com, 
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HJ2cGD2JBgqx

On Fri, 13 Dec 2024 at 12:46, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Fri, Dec 13, 2024 at 12:00:43PM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> > > Hi,
> > >
> > > This series adds initial support for a user-creatable "arm-smmuv3-nes=
ted"
> > > device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machi=
ne
> > > and cannot support multiple SMMUv3s.
> > >
> > > In order to support vfio-pci dev assignment with vSMMUv3, the physica=
l
> > > SMMUv3 has to be configured in nested mode. Having a pluggable
> > > "arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Gu=
ests
> > > running on a host with multiple physical SMMUv3s. A few benefits of d=
oing
> > > this are,
> >
> > I'm not very familiar with arm, but from this description I'm not
> > really seeing how "nesting" is involved here. You're only talking
> > about the host and 1 L1 guest, no L2 guest.
>
> nesting is the term the iommu side is using to refer to the 2
> dimensional paging, ie a guest page table on top of a hypervisor page
> table.

Isn't that more usually called "two stage" paging? Calling
that "nesting" seems like it is going to be massively confusing...

Also, how does it relate to what this series seems to be
doing, where we provide the guest with two separate SMMUs?
(Are those two SMMUs "nested" in the sense that one is sitting
behind the other?)

thanks
-- PMM
