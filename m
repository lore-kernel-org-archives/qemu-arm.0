Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2569548ejx;
        Mon, 21 Nov 2022 09:18:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5qlUZnYGJqlfzEE20y0UB8zt7i6kli8YmVjk7etunbB1D5o4egxCuMMG9s8jUfUh4pv1o4
X-Received: by 2002:ad4:408c:0:b0:4c6:8fa7:c94b with SMTP id l12-20020ad4408c000000b004c68fa7c94bmr154709qvp.43.1669051084198;
        Mon, 21 Nov 2022 09:18:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669051084; cv=none;
        d=google.com; s=arc-20160816;
        b=XQeN0tok7GDySwiVcp/0zZ+jsX5eOpK7jJY7vjynsD5qU7BEK9Llsj09APyk0vLg3M
         A6XHy+AP8OKh+MVG5jbZFemoDMn13yqqGGMS0t99uVvVwIP09GuGcIKJxAXjbwOM9FJN
         leJfmRoj1SejoaVQa3YDXR0sNNFLA8+fYMLOwvcCaG2ja91KIHBggavD+/HBeNLadCnl
         d42H6qP2AGgJZRG/HjJqdaPNzDgCP2+CCbX2xXdDT9lwHKBEQTqWmMqeU0AKTx9zi6MF
         CHOHMO6YTdMnfX5pIAg7TcpnFR3oaw5DvDsIBipLnrA3vrRmgz8CSBK7/kuPT2Kcgfyt
         XLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9trGTYQdEqf435WY8HaPZYeyH5W380OlK97rMJw3M1g=;
        b=W7QMAEQa9jxuZ3LDpFx8gzm80x4JRjfXaHJI4mtn4K+7wnn/aB36wx6K9OMy4K7tRw
         1zr/0LMV0wWM/Mm7uOuNsvtucXhlRVBpoqmUONRSZf5UPiaXCL3asAx6J/h5UqIUakJ6
         7Zd7dPF1mo+qjoGGannRCvxcwkB+8dhaAVDkX3ALADDRPqtZ4N8jsU7p6YlZrNa8zC57
         Qord8NAEdepYbYj9MANq2qn7iuqB06IODllQaTZ9DGj3IOkaJ4eWx0V1stYpOEfDE0Ee
         Xnb/clFM/uXA8oc2N7CcyHmCwrhJ/qg6GCtBu9dql7f+F0cI8OH7J+/mqmJPooiMr0vi
         9btg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnXPKiRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020a05620a249000b006fa82b94793si6816805qkn.252.2022.11.21.09.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 09:18:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QnXPKiRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxAPx-0005rw-Sy; Mon, 21 Nov 2022 12:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxAPw-0005rC-TQ
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 12:17:12 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxAPs-0002Qw-0x
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 12:17:12 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 y14-20020a17090a2b4e00b002189a1b84d4so5486299pjc.2
 for <qemu-arm@nongnu.org>; Mon, 21 Nov 2022 09:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9trGTYQdEqf435WY8HaPZYeyH5W380OlK97rMJw3M1g=;
 b=QnXPKiRKx2zZJC3Z6QMm0eZrbsfQJz0fsKgZwCbw6xipWrjTUVOg1V2iwQs8UuA7XJ
 Gga24a4FiPl5iK1M5bO+QRq9rCfCZIjfZIDCknvqSxV/XCE9foK8szqRC91dYl6mglj6
 C/6MTDGW0sdwMgYgQxHFeAQ5WD57b8q6B0Ge7dWkpGUNOhEkVszKBgNgzysKF7SZWY/O
 0sEQPpdVwgInfToROt8Nwpa6YbqibupGieM1sGRxEGKnfBq4VHTL5HOzHjga11PpCSX2
 7AyU+V91mFyt/cDegK3JrOSHEJFDsYG//mZ6Y5QTjn1FkuUD2UvZLXlqt/Us4Klm5wZx
 pzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9trGTYQdEqf435WY8HaPZYeyH5W380OlK97rMJw3M1g=;
 b=U+TCYnQt0+KcGHS9FuAeGJSnwdeKjIJQe34DrTJqaidTMhOg75+YjciX9qORlpJXj9
 nPiLgEvu84u3tGtret1cPJNzyJvX5XeApMG4nClb3LFyZ0WfvpsdhlbAKI61D2mDVb30
 /Oye+t/hkU7dR7U/+6i1ZrrHwNvrJD0dLOpm+2V8XPLwc6EV2dIGnIGulD119inAWn+t
 69iuxZjvUnU9Lh5oKM+rb92xrtqOswQmnCG1D90NoaRQV/jJZwqrrYRcezehRBSDcwgx
 1FjvKg/fC9xoMs5WZdhjNJhJ07rMFbela9f5J02rxHP0Czo2m3T5s5E05oCUn1HQCVwU
 ACtQ==
X-Gm-Message-State: ANoB5pk3HVJk0qmDzZM3IVfFKpIb8WH5YE42xl8E1RwvC16015wzKc00
 YUEytDgCiluCWdi7nMIilyc7M3laatQz0Vp3VqSBzw==
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr2698947plk.60.1669051017873; Mon, 21 Nov
 2022 09:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20221029224307.138822-1-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 17:16:46 +0000
Message-ID: <CAFEAcA9W35dF0L=r2qQppd1FVZ+Di6=3af4qb3T5h2vf8EMsfQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, maz@kernel.org, 
 eric.auger@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: kAqYYMgXta3I

On Sat, 29 Oct 2022 at 23:43, Gavin Shan <gshan@redhat.com> wrote:
>
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> The series intends to improve the address assignment for these
> high memory regions and introduces new properties for user to
> selectively disable those 3 high memory regions.

I've applied this patchset to a target-arm-for-8.0 branch
that will end up being the target-arm queue once 7.2 is out.

thanks
-- PMM
