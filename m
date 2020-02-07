Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp445408lfp;
        Fri, 7 Feb 2020 03:09:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDIRHQqQbCRyUv6yMm7ZqznPi4W9crstwJVoIH64H5fvQnl/J8xnvKAL2G4c4boJTuwi1y
X-Received: by 2002:ae9:f302:: with SMTP id p2mr6583386qkg.382.1581073769722;
        Fri, 07 Feb 2020 03:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581073769; cv=none;
        d=google.com; s=arc-20160816;
        b=yTXWskVqOfQxNMM34ks+3ZTtTyo2hYryFVgRv+GjUDBe+h1KFRLSE1VtoZpN5zxI+E
         gNgt5j2R1SE1w0xdz6QLKJASua7uUXSIE3POJACXwCLdz1GJlgSQ7rILrD83mk9bW8kL
         pIpb/dbfMYnECdW+tYKaG5jfcIVZVyydxQH3A/fgik97ZyCLDaRt3XdAXGh19IohgvhU
         HW3OSIEGJbTkVnPyoxSeVlxUzr9Mgicve518tHBvqSPj0Ep+RYjzPMLVB1Z5A0YD1k/w
         yKsG2A/n5g8Xo69sGCNP40PYvKlT1ub1Qsa8RY8blkcd+kmKK6tDFKPjnRLNkkcK/Ryo
         I28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzD7UNYViBOh2QgvbS95ozxi1ekGwD7XsVKYAodmaLk=;
        b=bZE+H7fJxvT0hlFxo8jYZTsKmvBgNZI2QYumrFuDE6UwN+hvQk8fcG3/4Q9jA3y00f
         iwxtCYV69Ysd4EIRf59T7gOb7vtxVoiO927lMpXsCpz1rnjadmRwM/kpxsyKNvpMZuSn
         2iswHlrh9kl9ftmc6GJaEV/DHubZGHCFVSp/DZ+01h/1wMGEz+PCMaNLAzFiaL8mthUn
         NByqwM1ivnM05dvZLPXK2vX8FOLl5V+mRuTkGs4lwH+4UbAsGW4xQNYp18jqMVHhfp0Q
         9n0mlqyDi2Rp8De4yPNcqcdPRPUVtUuJBaB1rBpLaoYnh8Tl9XAY3ecG57G9QZYv8q+Z
         7mpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W7hhfeBO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si1173170qtj.342.2020.02.07.03.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 03:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W7hhfeBO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j01Vp-0002p0-3n
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 06:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j01VK-0002jX-L9
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:08:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j01VJ-00075n-Lz
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:08:58 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j01VJ-00075L-H1
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:08:57 -0500
Received: by mail-ot1-x341.google.com with SMTP id j20so1805466otq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 03:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzD7UNYViBOh2QgvbS95ozxi1ekGwD7XsVKYAodmaLk=;
 b=W7hhfeBOSwuc2xMK488XdY+o37BmFjflccEvAHNU6gyGpGo6nb149JjrWNqBSsNGnn
 cfxNHLUHP93DCmgo+JUWZQj9NyvCkRyUdtAOArjaCx8kxC99jiVcWpwvb9luSKzO/LDQ
 8REfSk40fG4zrI9aHiY02oqFjVlStURXb8KW01wTZPyB9k3e7AhJL/DOr4bmfzn7kzW7
 jCo36+EGwYlLtdF8oplkYkbSG4rTY9vFWXQJ9OrT1N7r/UugY+qGPRBG5eKKyrar881/
 3KLFHnRBq98vxTJ24uLMKm2GXZg9c/6h4fGHVycLvYRPBz5tBZuK5iDBIhdJjz4WpmEl
 zFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzD7UNYViBOh2QgvbS95ozxi1ekGwD7XsVKYAodmaLk=;
 b=RLpUyaYK3E+tz+EfqEC7fF65QNGDUhZ4YfI5Ujqm5wwRqLykZ6m0JSI660tMxynKYK
 u9x8tZ9VISlGXNxkUJmjN42dQBTVf0Rb5s3U1f2uD2TWbTxL8f+96t1QwNE8uNhpuB4B
 uk9pHfXhuE4R9X8nqNwN9rp9A/FZRnulSATj362NBZWFwmLUkUpYTXpjbjhRfhm7VrPV
 HLZrTGB3yuKtxODq2UBoMtUVSOlEzx2rwHo1rAk9J9vOJOoxjGoYlvNi04gvlwHMvkwV
 zQ5gzzk0aHN5L9ynSZyvL7+3VkIXUJ9igWhgpf4UK+gBaZB6GVgVxZd5/6uDEOM81TbW
 I22Q==
X-Gm-Message-State: APjAAAVJ9LwBLTo3Q7pc79K1k43Rih9wivQOQCWGMkYXJHd7GicMfCUb
 0dRiGAATdVPM06qiJ81Y67Mie8+atCbZ7e/rWvUjAw==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr2117981otq.97.1581073736613; 
 Fri, 07 Feb 2020 03:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
 <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
 <f8394aafb2adb513186cd2784a1cb077@kernel.org>
 <58519c6b-5c0e-b557-ac91-2024c594b28c@arm.com>
In-Reply-To: <58519c6b-5c0e-b557-ac91-2024c594b28c@arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 11:08:45 +0000
Message-ID: <CAFEAcA-rdWsf-pOYs9GfMQgeYZRM1TFAfpUA38RdFiNRFCF0Xw@mail.gmail.com>
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: James Morse <james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwQ6nlxTOaRZ

On Fri, 7 Feb 2020 at 10:52, James Morse <james.morse@arm.com> wrote:
> Is there an established pattern for how Qemu 'gets' things that are done in secure-world?
> For PSCI the kernel does it, but this obviously doesn't scale to something like OP-TEE.

The answer broadly is "it doesn't get them", the same way
that a real hardware implementation that provides only EL1
and EL0 has no way to get them. Ideally there would be an
architecturally provided way to run a virtualized EL3 in the
guest so it could run (a QEMU-aware flavour of) firmware...

thanks
-- PMM
