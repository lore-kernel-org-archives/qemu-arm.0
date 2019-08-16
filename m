Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp770536wrs;
        Fri, 16 Aug 2019 05:59:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPmJ/wjb6vMZmTpo3xp8NLF6uGwFok6132gob0/ANze46t5SENjVrTx/u1SDPqsm9bUTJu
X-Received: by 2002:a50:d1c6:: with SMTP id i6mr10582920edg.110.1565960382936;
        Fri, 16 Aug 2019 05:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565960382; cv=none;
        d=google.com; s=arc-20160816;
        b=puNxlaEBBzbV+Saejm5w989bdd4qOZ9i2Vf+ehpUdFqQKNwfbewTuwpM5M43RD6UVq
         gk5uX8rPbwUtXK7VNUY4OfSUhYoAKZwRxhA4VzDooMnAu8gk0q9RXhxYJv/Op/6xD6Vk
         Exjy4t/GV/B93widEi6V4S5bEebKfTu+tWMARyeY+4IfER+4GO2zu9D2c9qmPhGNd6xd
         B4dbmyy5eofsMeb+2J+D6xEYbqRn+FrQ5pq8IaVvmbTrG5wCfbtNtO0pBaHY6KzNaDkr
         +QiTVEKo5OqOhEvbx1GAHx73SUVv3tFAsYhOsWNFBmwErsNou4ePz3qCj2wmRZZnF7+V
         DV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=pOya4liDh1r6J7HSlUAwikfeRcHXp1iQdgIp6a1XrCk=;
        b=k8HyLSEvntdv4KxWO/MTpuBB0nQ4HfxaDxas4tlrvGlUR+guGPfWnEfHJIHE+wRe/b
         WyN2vRVoJANZsStJbH45UAznw8sns+vA9G+PnAQuADWyDyDaGNILXUkid6+uct2GZdg6
         +kytV6LtzP5KLxdj/lI/Vj1XaMPiuRqGZB5oYV5IDFIU7jiHsmKtOC6pPgJZGyHt9Oyw
         +2/BcazUluiREHzyr5UuMQbSI2Hyit9RZIYzM7UTTaTYcO19pwDDMxVd4lDE2mw0MtJZ
         DGxeaNkCiQZlkBMWVV/2gGeYunRo/iTGmZkbjjWrA6zd244g2/i/XWnGZiuijAcyOq1t
         snaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gXdpeHi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si3313255edx.194.2019.08.16.05.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 05:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gXdpeHi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hybpV-0007gC-AL
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 08:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hybp4-0007bo-Q1
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:59:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hybp3-00014J-K2
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:59:14 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hybp3-00013g-EY
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:59:13 -0400
Received: by mail-ot1-x343.google.com with SMTP id q20so8723255otl.0
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pOya4liDh1r6J7HSlUAwikfeRcHXp1iQdgIp6a1XrCk=;
 b=gXdpeHi16DPJgoVxuEhW8f9igI29vNzMsSXbJVfKK3/F4Vi5zTAX/rS6LG77RA6hru
 TeMbhQgOrQMsWOoZKzCBN9RbMlTgGpXlrK2dbN5XGs5R/SqpMfvxUqRJZzatahVymQaV
 +DD5Rl90AYmTb77WcZINwRBy1/smH5/IbvMBGC13SVBy4avMXpaAD8KunnEgEFyY7H5T
 JMnN6Q/siQrVtp/rWuQ+xjEGLpLtrQbGCefh2T+WtKFc3xHYrGu+sA/yt97d8mjotowE
 0mUvxwI1EZqL1xoOZFqSdVt8LX4EQ4OXSOP8SQ+YRYYi7v/pXKjjPbIzh0YB1iYIMs/t
 vjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pOya4liDh1r6J7HSlUAwikfeRcHXp1iQdgIp6a1XrCk=;
 b=lWo5mKN1q7AFNVqWsoRQLdZhG5mtknp06d7bnYbK7ClEwM/5RyQIEoxfHMZcYswM3c
 OFT5olfaH1zRAydAea4WL8rRkqhsBaqknugJxTARo9mscQpNj5EkxpwLCrYBX4sYfV+s
 fXn0/c3qZf1mU4I8qAJgYkzIS7YD5fM+l5Oe+ujE7ax773Kwzyu7Bqhsl2GCiP/kgtN0
 fsNbwF/8mJrg6p8vDPwreHNISJTt7it1A2BUH6E/7prKemHyDG4y4Kw8ewy0igHI+/1d
 Lp94srNF5Uc45NWdhmJytS5lOszE0dWMOnn5+QsacqE8OE6XAnUNqWf/Er5fDpQrsa8D
 qI6w==
X-Gm-Message-State: APjAAAVsfuW38sU62da1lvPwEOf/sam6YPmGG1pfdjoeg2NP79owZJ3J
 LQD+nMdCDqt15E119CI6sfPYIFIgnS1p3s8L0wD9/A==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr6749248otf.97.1565960352702; 
 Fri, 16 Aug 2019 05:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 13:59:02 +0100
Message-ID: <CAFEAcA8cLy+QfswCD6iGHcQywDA6hHYaBdxT9Zfa2zAzSotm_w@mail.gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [RFC PATCH 0/7] qemu: CCIX pcie config space
 emulation
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
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jon Masters <jcm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fm4/aj/KxcYb

On Tue, 25 Jun 2019 at 12:28, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> CCIX topologies are 'layered' on top of PCIe tree topologies.
> This is done primarily by allowing a single CCIX device to appear as
> multiple disjoint nodes in the PCIe tree.

> This patch is being distributed by the CCIX Consortium, Inc. (CCIX) to
> you and other parties that are paticipating (the "participants") in
> qemu with the understanding that the participants will use CCIX's
> name and trademark only when this patch is used in association with
> qemu.
>
> CCIX is also distributing this patch to these participants with the
> understanding that if any portion of the CCIX specification will be
> used or referenced in qemu, the participants will not modify the cited
> portion of the CCIX specification and will give CCIX propery copyright
> attribution by including the following copyright notice with
> the cited part of the CCIX specification:
> "=C2=A9 2019 CCIX CONSORTIUM, INC. ALL RIGHTS RESERVED."

(Apologies for replying to this now quite old email, but your
more recent followup email drew it to my attention.)

I think that as a project, QEMU can't take patches which come
with this kind of additional constraint on top of the GPL. Could
you drop these extra legal clauses, please?

thanks
-- PMM
