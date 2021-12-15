Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp75494lfj;
        Wed, 15 Dec 2021 10:52:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDiMlFzgRX88Beo/Cf8Z8WC3OSXTWAPMnxR/jiNQDJGw7Hdf64tsxzUn/kf1F4TIN1ub7U
X-Received: by 2002:a05:6214:20e4:: with SMTP id 4mr12919617qvk.95.1639594330650;
        Wed, 15 Dec 2021 10:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639594330; cv=none;
        d=google.com; s=arc-20160816;
        b=U+HtUnSkfE/V0kvESrmARquzv3pgs1sPDp4b33T7DGWjFuo/zHd5JnfR/2sjpcNwYr
         OI4yZiJ+0dior3/cgsWgU9MJUhaDIc4f6OdrLRqoDbXIEjODoImgZFQ722pQs1a/MIZn
         LhA4qMw1vOyF2zoG4MPY6XsWpXtq3i64W8ZoOR4tv/vag4xC4MQVlXTBQcw7qbwFEotX
         FP0FeTpwlTZ2yZqwf4BtTsS8G+IcNJ3LXg2zcenArWSJWjmqlGvj9bPKwVBkNYjZj3CA
         ki2f1C6zlVk4Wpj9bgrUH+zoShlZ0gUT8uqITHT5livqYJR5xKqO4SDwxdgj7VTQjoKs
         vhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MbZ995HH6h+XNE8SuFHfoy0WgztGZQ4Rc3McDP1f+fA=;
        b=aX/bgDg8VWr+Lolk1orglr5fEobIERtKF599q3dtj/rIPtyBcrq0b5va7ht9pkSaYF
         YZwwG5hUsCmk16O3iESIQSL/WPkWPPmuNYafTrIDUp+dhI3FzMdEdQiOFy+WtNYF2SXa
         khLUgvt7GynFNy+EixkbmGKXw4zMYB+lHnosvUhkpZ6l/F/ZNvEkMl5xl9x857BjSasg
         K1HKbjtw++F0YlnXg+rDmRfZGKDEYMyuLfFdZhy+9YntmM8FzHqP3xZkDdRHd6eC63JH
         AMQnHnQ9WdlOt+VQwXRntUcTwXuCsNG/u9qXBvsFxOc7uuWtt0TgRBwRdmahxxUB7Pj0
         frRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M1lcfZdZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp11si1548232qvb.369.2021.12.15.10.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 10:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M1lcfZdZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZNo-0006wQ-AW
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 13:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxXmF-0004ft-TO
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:09:15 -0500
Received: from [2a00:1450:4864:20::32f] (port=56107
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxXmE-0005lm-7R
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 12:09:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p18so17071914wmq.5
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbZ995HH6h+XNE8SuFHfoy0WgztGZQ4Rc3McDP1f+fA=;
 b=M1lcfZdZ4qBu5clYaaPQkmbYMldU3t8cj1bond67Kx5aOVFj1H6V7WKonkoQjz4hPO
 KTwxRLHBRx0rdip1yiBzVbP3CZPrgV8vB9FYC4/DNeeX7mQ/8HG5I8SDpReBd3Ng02VY
 vW8w9knoorU/lPeJLl2hI7UWfzlRdOI49ojH90b1hPqyI9XndOV0vpaR++2zQ2XnzcHw
 zLxlBGxggEZlNfO4aMmv6v9pLA6bQ7TV1s/n6RQ2Uwc9dB4h+kC6e2zFwA3isTf3RV6k
 CtgrAndTEimF0qMMRxxgDIwU/voJ4VJuF/D5fkEhbWIgkzOqoMZ9/AYeJCe78BcSDlVG
 s4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbZ995HH6h+XNE8SuFHfoy0WgztGZQ4Rc3McDP1f+fA=;
 b=ZiQwD3ii2eZve1O4K1CeVwBS407YGUU6OhwZHXKFu1ZJ3jgcjXZEbytzKjwNpSg2Bx
 jGyV4mWrxIDB5hzIHjP1v39dQTQVESZlnFOseVp7m8iUlUU/r8cg6HBqkJ9X9gcuKAOj
 YdK4XAaGFwi1plKaAb35B1mFVT+ZZ1R/6j6nArmtnSx43EDUWwn2fs6vgJqf4OwVU2Ld
 wSQ7y5sJliBnP3OEzklnArL7EoSVzpl6ZGcvTXe+protjk61mpA3JW8/Ysjmesyz4Mb8
 4cGP3c8BIbl4Q3m2kPHl4q+pn2bqChAKpK/ZUb4MiKYxobXw28S6l4iAZs2yldevQpZw
 BJcw==
X-Gm-Message-State: AOAM531k7ofQCGDXClZoGuqJQGXYN+41ppoULlBKtMstB41QC25eUUS6
 jGhPNe/9j4iNuYb3KzUOiMC8PbcnSIku02fMhZCs4g==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr833545wmc.133.1639588152298; 
 Wed, 15 Dec 2021 09:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20211215170548.20776-1-quintela@redhat.com>
In-Reply-To: <20211215170548.20776-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Dec 2021 17:09:01 +0000
Message-ID: <CAFEAcA-94WxKObDZQn_XRaJ7SDBKvqgvqwPb3v3Uyg73rZepgQ@mail.gmail.com>
Subject: Re: [PATCH] hw: Add compat machines for 6.3
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ohI9sBcuDIQ

On Wed, 15 Dec 2021 at 17:06, Juan Quintela <quintela@redhat.com> wrote:
>
> Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.
>
> Shameless copy of commit
>         52e64f5b1f2c81472b57dbad255ab9b00302f10d
> from
>         Yanan Wang <wangyanan55@huawei.com>

> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 3)

There is no 6.3 -- the next release (being next year) will be 7.0.
Cornelia's posted an update-machine-types patch:
https://patchew.org/QEMU/20211208170241.110551-1-cohuck@redhat.com/

-- PMM
