Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4079566lfm;
        Tue, 30 Jun 2020 08:50:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/S8OUeDEtxoYipy/eZGIhpP0IeHXbfwJkN6ADe9PdtAjuL9qGpYTORbbki5yeERMz79yz
X-Received: by 2002:a25:84cf:: with SMTP id x15mr31057024ybm.2.1593532244565;
        Tue, 30 Jun 2020 08:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593532244; cv=none;
        d=google.com; s=arc-20160816;
        b=uCmPrrCZsOwBEBT/TYDYwPVD3od5zd83ckT0CTYyr8BVPJPzUvrfnyh9LD35ioznUG
         1NfZcJc6Q12XoH2T9oUfqqE9Fc3lvbpjsWXfdvRj9KKqMjE6FdGXZvUHf9QHjR7i/mzU
         c6mvaVJs+pLmsg7pXxifGoh79kNbH6ISbC9KdwgS8tX0YxoYE3A8j5NV3SGQsmcXqo+H
         NctdF9cPU50lkZBo6OzbCH3aA2kKXQSuNaB+yGg1jttNcQ82f1vglmubbtrviZj++3aH
         DFUAR7L6Qc0RIZCy1D4aZnixCcPnKzx27orFsbT8PvVfbU63ABgdTIy6YChw6Xab9Vcs
         N3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lB44BMNpK9yW8Es4rQx+p4Y7as+yKp6SJ+BkG8X7iY=;
        b=VLwVml3yFJdI9J3yG7WuuvKWM8EU7pwE4wcm1P2BeqTb/uuV/4h66p1ndu93EwaKRM
         YQaeJN0OCss02bgfHUXmiTDpASVAiFeOxv6IhToLTeVzvTjp9jXPYT0+MBKlGXjAkz7g
         iOAA/jl/HhhyV1iAf8R5cOV7EG7+q2MSZcv45FbI6+o+x55hgWmAMMw1N9K3vAmc+5jK
         DHrWM0ywHFjcLjG9/cB5uU1sv9UeitxQp9VZpUPhfv/wRH/5+cZAYDyr+vx5Fu82Twyt
         QaRdFVxoURr+pnDR6FpmmdIromeJEN20Z6HOkdIrrM+d69is6ZmlIZiwVaq1WyBQgoT0
         /i9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RX3WaqbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si3175918ybk.43.2020.06.30.08.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 08:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RX3WaqbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqIWx-0000rt-Rr
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 11:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqIWn-0000qN-Sz
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:50:33 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqIWl-0005cC-EI
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 11:50:33 -0400
Received: by mail-oi1-x243.google.com with SMTP id x83so10309555oif.10
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2020 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6lB44BMNpK9yW8Es4rQx+p4Y7as+yKp6SJ+BkG8X7iY=;
 b=RX3WaqbWydL5FNPuV7InT6pPVgLKx/65Vl/Oe0ds712OVeK1RjoLqonmZbbavMFpv8
 N8LTsIcF0LVa6aefTDnldn6NWo9mvnZm0gN3o4opmO6DhEiQSyddHokgxYYAmtlIUG9Z
 d1JZb0hB7RIqns4Ep+MvKw7y1AbRyn7xnlT75UX807MRgEvI+m2NDLjluAsP0LVMPj1+
 V//nq33X/Yadnp0A+EiJYj5/Y9/w30iL/rVr9/tZUfdJ8+Rg655yVi0Z9hgD9fln8+5t
 xsQjpTsibP8Lo+jcuwX+dZWxyKpSDIBE/DBZNzBNxkKWr1sy83UmfEmhaQIbJPYrG+56
 fD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6lB44BMNpK9yW8Es4rQx+p4Y7as+yKp6SJ+BkG8X7iY=;
 b=KdR3M+lLKbyj+cY57ORF7pqjUDX/2W9Y5orVadUegZI8o7rkdBNDJz3kwSlBuqfuHy
 zqANfw9zJWaq2xrfb70fGsFJvcrMcjR/KOZ8SCPyEo6RjT/ZeiE1q4xLlCIv2BdlMEVt
 0eV/QeHQewGOUoS9I3TY4MrgAQM7bjnlZm+ykX2Ubns1O5dCHS5hg9K4am7WNeXuMlj4
 k2/Jx8YIb1y1B1jfV3Y5zUaRoJPXGzdyEMuxp31yfvGwbHTCPP4ReIt092NX3ZEFcA6M
 ZmHT+SVBjaYtlrIHSPvgZP6lHmBGbB40hJFWgPHmPIqfmKTe8chdnDM1Ah9/rpCMqa2/
 KNEw==
X-Gm-Message-State: AOAM531xd/y98QNpF7Mu88EfJQexB2LnjnWcJt/ohe0xXMolxSyCoDZ/
 4tdk+42ppvOQ11jlCDEZeiEW1XGdg11oeuBguZ9zsw==
X-Received: by 2002:aca:54c9:: with SMTP id
 i192mr10062926oib.163.1593532230034; 
 Tue, 30 Jun 2020 08:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-7-eric.auger@redhat.com>
 <CAFEAcA9FZV=jSk_9aJ_tHy=KLy+YrTFNoiqvCv7BMs0dWrHWFA@mail.gmail.com>
 <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
In-Reply-To: <db6d92ba-2716-40df-54d3-84fb51ab3ad3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jun 2020 16:50:18 +0100
Message-ID: <CAFEAcA8ez0ycijFSZrVA3haaoKGho2Q2gQR=cDiiAm7S=-t6OQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 6/9] hw/arm/smmu-common: Manage IOTLB block entries
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avAZUWYxCPEe

On Fri, 26 Jun 2020 at 14:53, Auger Eric <eric.auger@redhat.com> wrote:
> On 6/25/20 5:30 PM, Peter Maydell wrote:
> > Rather than looping around doing multiple hash table lookups like
> > this, why not just avoid including the tg and level in the
> > key equality test?
> >
> > If I understand the range-based-invalidation feature correctly,
> > the only time we care about the TG/LVL is if we're processing
> > an invalidate-range command that specifies them. But in that
> > case there should never be multiple entries in the bs->iotlb
> > with the same iova, so we can just check whether the entry
> > matches the requested TG/LVL once we've pulled it out of the
> > hash table. (Or we could architecturally validly just blow
> > it away regardless of requested TG/LVL -- they are only hints,
> > not required-to-match.)
>
> This change could have been done independently on the RIL feature. As we
> now put block entries in the IOTLB , when we look for an iova
> translation, the IOVA can be mapped using different block sizes or using
> page entries. So we start looking at blocks of the bigger size (entry
> level) downto the page, for instance 4TB/512MB/64KB. We cannot know
> which block and size the address belongs to.

Yes, but we wouldn't need to care which TG and LVL the
address belongs to if we didn't put them into
the key, would we? I'm probably missing something here, but
just because the hardware might want to use the hints in
the invalidation-command about TG and LVL doesn't inherently
mean QEMU is most efficient if it cares about the hints.

thanks
-- PMM
