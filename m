Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2882725njk;
        Mon, 2 Dec 2024 06:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUegCmU5Fz1VxVRHCaRChJQcJmrH+KSpRqc1raD37xpqzI+YiQ0pDFi5p7BiG15mWgKeuVGpicfnAZ8hg==@linaro.org
X-Google-Smtp-Source: AGHT+IFdQsU3fEOsE6aPzD9WrlddfabE47SIm0R+UH2kFeR46jF//5UJVI2u87L6flzeEldHhwx6
X-Received: by 2002:ac8:7e82:0:b0:458:2b4e:33d6 with SMTP id d75a77b69052e-466b36891b2mr421642971cf.55.1733150192954;
        Mon, 02 Dec 2024 06:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733150192; cv=none;
        d=google.com; s=arc-20240605;
        b=essM8RmlPDmHnjX5jcLpF5HcOd1hzQuEmLpb48AjwaYas4/qAE/sdfDOROBGISMnD0
         FuWN7c6+OmiOxvcqSU360XTf0sPHVOQjjA6Nx2hvlrnd94x/IX6Si2GA2RE7AiptIjA3
         OtC95NQquo0T0r4WgbEER6Y5ueT+/dSJxcI9/PNi2b4z1Eai5/Vo5UdXLXd9c83ivrP7
         scStxvvz33aLv1CG2ZrfeF2licf8YjJysdEneV/2ThSBPMAtGpvw7ngmAnhaiaU4cYeV
         MdE1a190RRSGV6RgJTrYp0lfLlI1eAWKiz3eELC4NLmNUJYOKO04T9ia4FtNT+IqldZ3
         yNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XFtWk4KD0sOMVkO5pzl4DFqsG4FSKqZhriCNkQGL6OA=;
        fh=/2hk5Nlv9y2csT9GY8JohBBRcfAb5IfRhg5rISKjhhg=;
        b=dRF54Z8VMabZ20cK2rMqbO17HFN/YCMMNTPA9obNNJZKWRdlskaxNL2hMEkq4kZUGG
         UmY3DrNWQnN8oH4yCVXnx5/mnm1Fb1meXKhyUtJdUUMuJi9pWShCjYjWwHEy6f9fV4TC
         qa9+FYioaWpNl6OQq4QH8Rhyf9skb8JDDJnARIbIe2lKEkif2q+osMvscvSXAUHilQ9h
         YmRd0XKf4VLwOdDGIHOhIhBlwGCsgsBs9QOv20HQmZtZoaZu3D8OqeYrd8+D5ZKovPvh
         C0JYFb1TzoT/zCdeiW//UAovN6nc6aOzfR/P+RQAtS4+ruvOKdMZCOsJ8H+wnUknVyBa
         aaGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+VhygtA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4225fadsi113154131cf.490.2024.12.02.06.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:36:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+VhygtA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tI7Wk-0006ot-Gv; Mon, 02 Dec 2024 09:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7Un-0004AZ-8X
 for qemu-devel@nongnu.org; Mon, 02 Dec 2024 09:33:56 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7Uj-0004qR-F8
 for qemu-devel@nongnu.org; Mon, 02 Dec 2024 09:33:50 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d0f6fa6f8bso931099a12.0
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2024 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733150028; x=1733754828; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XFtWk4KD0sOMVkO5pzl4DFqsG4FSKqZhriCNkQGL6OA=;
 b=a+VhygtAzsz8wgM8TJla1B+t+c9fl7lIPnpqYZexAmQci9ZpufzZKN1DuwqTRgNMsI
 sYhq9gHpywcRE1zg3G+ud+hZosVS8l19K1SW/A1z3zKIOYCUAtCOljd3CWAoowWlZivE
 gYnzx2Wug1Sc0iBaUbkX6fD5IJWNFsUdGLYTWQezUZmEERZSAuvQiDyAknazw6OxeXlq
 olhV4CLJivQ8tpbAmK3ZuzgkOJbk+E46bFDCyWawv5/raxiG/9mu+domJYY5XbAFDCSO
 pmGmV7i4airbWYOy1Ra9vr6LYw36Uqxbgane2sAarZaLHp4nNnFpVZH7DgN+Ix3OSv61
 RxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733150028; x=1733754828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XFtWk4KD0sOMVkO5pzl4DFqsG4FSKqZhriCNkQGL6OA=;
 b=lzdUSdaZVVdsuzmZwr1tMy4iG3brnDwC0NzEXxC0l5VeBTVapc6K9JX4Sfpiqka1r8
 BCWF5uMzL6ka7Oqu2Hz6kzr6hecj/RvFPjXq/ADHVD/lgogWILIyJx9EmkCCuuZ0mPhw
 G71D089FG4DFFWVHyjbBhzF8BAsxjnDORUpPMeM5aDt01f3RbtJ3MqCWeUvx+mNby0pC
 1KfLKvhaoJw3uMAXzV9g6x41hwGcjDTjHSHvjrkAZuGDxreHtormxpU00rbiskC+MIbb
 gUc3xoiPNDWOURkQpFo45gANxiJCIbjzxtpG73RLYCrR5Vkc7DZWgDR4reItSyBHR8nv
 JsdA==
X-Gm-Message-State: AOJu0YxBloptV7L+phr+gFIOQOUPKuLLAk35/qJcuy/GKgGri2AghZM1
 e1+nBL+4cuG5l8jNBS2fxM/mloi+RqoU1pFHc0AkaA6KZFG+lqCU1vswt+WAfXkGFnnQqvH/ivs
 unNMxuFfxuZpEwn9dcMI5xnrIldnVfhJ4Pyw6PbUO1bER3gS9
X-Gm-Gg: ASbGncuD33HAqT4e//cZwpCpyRlY6rV4wQvTKmHNPMTJx/xViVuADJqwiasgPfPrnz1
 MTCnJ23EfJcM0KOBuMyOxrMoOmoByURK0
X-Received: by 2002:a05:6402:2788:b0:5d0:d330:c965 with SMTP id
 4fb4d7f45d1cf-5d0d33227a1mr9237036a12.0.1733150027656; Mon, 02 Dec 2024
 06:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20241102125724.532843-1-shentey@gmail.com>
In-Reply-To: <20241102125724.532843-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 14:33:35 +0000
Message-ID: <CAFEAcA-scq8gt2Khuf_tM0oZmb-bhb0wBdToOdenidP-ynDT5g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Consolidate lan9118 phy implementations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eD1Zac1zIvis

On Sat, 2 Nov 2024 at 12:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> hw/net/imx_fec and hw/net/lan9118 implement the same Ethernet PHY with similar
> but not quite the same code. This series consolidates the implementations into
> one to fix code duplication. It then continues to make the code more readable by
> reusing some existing constants.
>
> Having a dedicated module for the PHY allows it to be reused in even further
> device models.
>
> Testing done:
> * Run my usual sabrelite load and verify that network works.
> * Build and run Buildroot's qemu_arm_vexpress_defconfig which includes lan9118
>   and check on serial console that IP address gets assigned.
>
> v3:
> * Don't add SOFT reset, use device-specific method instead (Peter)
> * Reuse MII constants for MII_ANLPAR register which was previously missed
> * Fix off-by-one error in MII_ANLPAR register which prevented MII constants to
>   be reused
>
> v2:
> * QOM'ify + mention boards whose migratability will be broken (Peter)

I've added this series to my list of patches to add to
target-arm.next once 9.2 is released and we reopen the
tree for 10.0.

thanks
-- PMM
