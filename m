Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1245116njb;
        Wed, 27 Nov 2024 19:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyg6rqf+yf+bE//AG/mWPdsPcxHp/rNzaH8cgdmNj83jRQAzRQ+tDzq4pjOkMGgB69+mZgzxPd3Jd0xw==@linaro.org
X-Google-Smtp-Source: AGHT+IHbebWvOybYhlXxmdF59LcvvjqgoP0/9GIKWUirqb5ciz5AWsqJQbKtlIUAt+Q/h4G8YGOn
X-Received: by 2002:a05:620a:801b:b0:7b2:5e0:c439 with SMTP id af79cd13be357-7b67c2bf2c0mr828283985a.30.1732764357583;
        Wed, 27 Nov 2024 19:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732764357; cv=none;
        d=google.com; s=arc-20240605;
        b=W+5Vwd2HjJYsAwcowyx9k0wa2/mMNKOVFvnrbMEjH9rpHNaj3xw2AvZMNHme2yOqUC
         inUG3MedOzG7xw2Ji1r/MtH04iI94JKHr5lmO9heZnCmLGsypI8z54xufMRkyJqX7fpf
         EKrPifh8PFwfwQ1RxvpH3uuY4zmT3ql+H9sSCznNbR25qdnC9IldfEpTelBNS7lj7jXl
         lJfiioplCE8osmHuqvHs06x8LPg3wDohWSIDFZPdilDwjl7oSKZ/1ncB1/6J/S4p9XEK
         R8rHxJMf5aA0fapUMmhzrbC1Y3u3UmGzcEaTveKnY4aO6tOJAdrCVX21Z2dFash4XUk9
         mqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TPpM3+hhiQQO2fEwaDISyqX0W/di6qkTKJPXgsqgaCM=;
        fh=Sup3wUInVwvfHkdk8VbcZ+FK0VY9k4UtA1yU8SBxkkM=;
        b=M4FMTqoZrrGJlnSeJ3L3h/0LTbWb3wgf2r0fg5pJsIBbkzVDR9zPE0KGVfmYroL/bT
         9HJQ68eZPsYq7NCws7341BJsNcC8JdVz6ADKmVADb3kr+7DDgQPDyDEgpiGGhBrqzdfZ
         ZyMEjkP1DLKSgndcNdI7iJlTe8/SllzquN4Gaqns4J896FHhkTnpBI3jwgWWHlTLZ6cY
         9eI5h2PECutL+DTIo2A+tCqTvKI+duF8KybctgzPZXgVFlkqHcWIgIuZFTP51bZAJwdk
         j+DR5oIKiZeqJv7ldvjTf1Rhm7PyRsqDqCPOJykE+rcZMo8JG4Wsff+YJ+YyDxZDwgOq
         5Ehw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vkNwbS/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849dc137si72524485a.541.2024.11.27.19.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 19:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vkNwbS/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGV9z-0000R9-On; Wed, 27 Nov 2024 22:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1tGV9u-0000Qb-Mr
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 22:25:38 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1tGV9r-0002bE-N7
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 22:25:37 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53de101525eso1421524e87.0
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 19:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732764332; x=1733369132; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TPpM3+hhiQQO2fEwaDISyqX0W/di6qkTKJPXgsqgaCM=;
 b=vkNwbS/rOKo3gw+tymweFIG/EtnDxef7EitTJLhKKKUAKuRpKEx8i5aJ9sFV6HoX9X
 M2z25btdC9TnnF5JF0aJZhCOtW+IDlDYVm66ApY7NKJ1vXd7rQZEy8O5ExjPMsGGUjNM
 dWDN1vCc/mo+wb7DaFHFlrXTTclGVXs6Yz+RXjpYVjo+bo/qPkCoB8CJ//rExi4FidvF
 sxYFnbxzjqwhu6vk4sgldjzoehrqRAtywf309CD6pxhS7D0WSTdU/Tois0OfHmqksBH3
 VED/+s25NX8MbCu3zZHRsmaLaoYtahsfPACBqRdH2KX3UeDSmWj5lDNkWNqSAQgZz/hS
 WGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732764332; x=1733369132;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TPpM3+hhiQQO2fEwaDISyqX0W/di6qkTKJPXgsqgaCM=;
 b=tiApwGh9r6p1OMn5XZ4ILonnuxkkibR31Nm/oqzDq7QHXSgWsnXQTDSw3kFezWCf4z
 9smFE3XKrHmBOWxUnRtmSlmgLjNOmbMi2d0KIaQvEmC9i8hR5a98RzumjEEajeWUPvgK
 ZzT0Ewqb+44PMwd8imCzNsFVtf/xK7mejkObNLZjIfW3p+fXAbob4s5nAZTquAy8erHS
 W5/dLh2RPrO8QtCemyX8J1XW05MBYfB2flIMo6o0euZy3hx72Gl+FyMND6HjSzLvw3sP
 23kyM6JFNijDM009Ev5mMUMC+Op4nOFSNKkLjmT2JiaQCa1hfi8rm2DEuwofVFBYCNf5
 2bFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwlyo7cH9eOrMURpHRIZI/MIQce9e+lFus4ofq5eMQbXa7nluuWLZhUIs579AGsjaHXi87As5dKw==@nongnu.org
X-Gm-Message-State: AOJu0YwA9vrHOgZAYa5n3j01iLfQVqP893XiIMD/N0amYwo03v7dKACp
 HcQlvZ4kfNjdTEDLdVTPIIG5JBH+lrJa8tcTrzgSdsJYt+7u/Hv7Q+agWwwxOWpiBIG9KsizQML
 Mf/8S9zQTEsSrQMFnBFrbz6PmGRB3fBb/uxfddQ==
X-Gm-Gg: ASbGncvPDUpTmvN6PDaYi2e9LK5R2Elb6xCiuQzucPip05dcyAfDgHiwUCryQFUjemD
 +gTx55/7GLAeBfWGt0hkGTJq92oCN
X-Received: by 2002:a05:6512:2209:b0:53d:f198:a835 with SMTP id
 2adb3069b0e04-53df506e5e6mr444115e87.18.1732764332443; Wed, 27 Nov 2024
 19:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
 <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
In-Reply-To: <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Thu, 28 Nov 2024 11:25:21 +0800
Message-ID: <CABQgh9ErT6BmvbrUr_aNiLFws2Kx-=NzGJJCo+vV7AV_U6Pk9g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: eric.auger@redhat.com
Cc: Jason Gunthorpe <jgg@nvidia.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Donald Dutile <ddutile@redhat.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, 
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: juh+tnCztubZ

Hi, Eric

On Thu, 28 Nov 2024 at 00:06, Eric Auger <eric.auger@redhat.com> wrote:

> > Yeah, there is no live migration support yet in the SMMU qmeu driver,
> > AFAIK?
> the non accelerated SMMU QEMU device does support migration.

Could you clarify more about this?
The migration is not supported if using viommu (SMMU QEMU device), isn't it?

Thanks
