Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3133226lfj;
        Thu, 13 Jan 2022 04:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv4e0ddcd7hX9LFzRz6HQUFbhiyH8GS7aCLRrWOcexq7x7ZR5u655ku2cAFMt9nT5pRJoe
X-Received: by 2002:a5b:312:: with SMTP id j18mr1845919ybp.640.1642075558038;
        Thu, 13 Jan 2022 04:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642075558; cv=none;
        d=google.com; s=arc-20160816;
        b=cMxe0vxFt4frjXSHTpiPWtG/uydm+LL660CDAErL7KY5SqDB79w8nlw1Rbjpd9SElf
         RhyoVmLtV7FJzhUN3zjlbt+/LZ+Gl7SXyHhgWIHHes9BYU55G4gA9MpvtPDPtDBN4Vvw
         7gFj9Lt1/UT+lhWI+EsfPtXQPL4KZQCkQ8jXer4KvbNDzKrG6ul/LKZTMNa9Ft3rS2CW
         zwJLywWw62EmTv3fMim9O9CJne5P/Ql5FuwYvIKyngjAGdIht1iQeTxTHitThaAh/lMp
         10wsDQ+d+fBtyBKeiE3SVvIO18lZnUW9ClwWe7RFYV25uBYc9Whvbj6XpopoC/a4wP8I
         wImg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TfqO9cjuotnFcqmtgeGH//y4zStEcC8K0Ga9gnZxwf0=;
        b=FJ19m0jNOkXRMcYW0IQ7dZxzh3Y385G5reVUdSAg3aDeWe97FPCbtV62/3ZfR2jRyg
         1QQ3yRPfC+1zjaJhm4qjGawUDPDDf9FRD9BSuc7rDCeKRqFj0nDxcGDRS/UNQcGIAuFC
         3/UQenZIxD627RYszoHT+vHUL2I05OTIpcXV9/+u5VdauYdQemUbfc/NPF5FEZ5xAWvB
         X3jG7HGBRewyZJMM46F7endSImSSH0ERbeaMh4D787zXiNSKLHBl1Y8QwfMnnBAGLNEB
         YrxK6SR5X2luv8Wf/vGbF5uA8/PlYsEB9qzAUCf3cZM8MxNiAsI4ySxJFSXx88gY5II/
         BQcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wz38MtlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si2062586ybl.118.2022.01.13.04.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 04:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wz38MtlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7yrd-0000ej-FJ
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 07:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yiL-0007hZ-GY
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:56:21 -0500
Received: from [2a00:1450:4864:20::333] (port=55903
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yiJ-0005Ei-Uy
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:56:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id c66so3653260wma.5
 for <qemu-arm@nongnu.org>; Thu, 13 Jan 2022 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TfqO9cjuotnFcqmtgeGH//y4zStEcC8K0Ga9gnZxwf0=;
 b=wz38MtlDg7KAx8ntTsKuykFiDUHY2NB0Ko97+x5L5QmVO2fYt4loTE8OyNNC1Ryqdj
 4znvGhU4R6GMgJ+xFcYcB0pbfZuBR4MQ2y6jz7HuktqsSXmUEsfYUvbN6birKPzF8wOn
 UD8JahjuYtiwU9g9QLMynpj0EdKMU0/zwDPlLcVT3zG2b4l9EWCZCKnQOiPJcoG56kcZ
 bU/wXzXPgarOcU61uI2NPYG4QPcS6jud52A/34Zd5w45QB+zimyn2RVFRN2f7GZ9m5Gn
 7PUOefrRigu4KtDdP4R5HT3SI/lsEBFpQd+exo6XKaPwAioy910HxAbFMIMWd9qbi+Cd
 2TPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TfqO9cjuotnFcqmtgeGH//y4zStEcC8K0Ga9gnZxwf0=;
 b=619k4+tJJlBLdD4hrJJZJzhSIzH8T05ADI+RX2FeTIxbkl+9NNjwhw+oyZdqcHwfgY
 C3aGs0j0o++/GqX4LDCifR4vpS8nXzi81iQkCJDuNMzptBFq4QUKKUaTtc5/il36OuOg
 5fRtpoHe76xXujkTK4Ixl2t5IBDP8f4TJNPf5q+LKkX8mBD3ZXC8/bbOjeQ51yov79vd
 0UblWh7sOiHpw/moq4wRB0MYYZKDLWEA4olmKGIGDg93yb2YQyiSlA37JCPIv4LegtvH
 UUvVHcydyDCFkdWHjHmor826gfgNNzaMCrapRpU7HRj7Gqb3/TJ6vD4HFxM8pqvNaomq
 c/FA==
X-Gm-Message-State: AOAM53343MhX75gmboWP9beyfxu9kJp3Qe14T89mcyDoEqsmTCnep36N
 eSH1+WkAEjF+unb9FnXunOvVDao6qggLewbTB+6UXA==
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr6900889wmg.126.1642074973990; 
 Thu, 13 Jan 2022 03:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20220111063329.74447-1-gshan@redhat.com>
In-Reply-To: <20220111063329.74447-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:56:03 +0000
Message-ID: <CAFEAcA962m6idGjaVf9+c2QHAK0zrqRFBoPXTdGJhD9qxKPY_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1F1SHhcJk9fJ

On Tue, 11 Jan 2022 at 06:34, Gavin Shan <gshan@redhat.com> wrote:
>
> This series supports virtio-mem-pci device, by simply following the
> implementation on x86. The exception is the block size is 512MB on
> ARM64 instead of 128MB on x86, compatible with the memory section
> size in linux guest.
>
> The work was done by David Hildenbrand and then Jonathan Cameron. I'm
> taking the patch and putting more efforts, which is all about testing
> to me at current stage.



Applied to target-arm.next, thanks.

-- PMM
