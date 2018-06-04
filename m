Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp772832wrq;
        Mon, 4 Jun 2018 08:57:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLIUVrBFjirYRl9RLLiDUPkl67qFiNH+h/ML+Smw5sIBgd9siuIGuzj9I4HJRhlmt2sLOBd
X-Received: by 2002:a0c:becb:: with SMTP id f11-v6mr4145880qvj.18.1528127842378;
        Mon, 04 Jun 2018 08:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528127842; cv=none;
        d=google.com; s=arc-20160816;
        b=hnKTZNHeIca4RmnkNVhyexXzEXU9QcG2QNA8DgDxlOu5KyV/A9Ad/11IIwsmIR45Yf
         z4Z3MrHCJZB57zAhji89+7by5tZZovKn9KmFMUMo4bCiYmk0NrmaW4VBCwayJXXzZFB+
         EXEn1LRWGVDL+1Czfz9y+NdUZlCCsaP8vbCMXmzoDxGgCiJBrVCXpGLXCtLFsLzU6d82
         Cmci4wLwKBaB+qcnxogPqQxdxvicZf1SDahEBZ4pbu1XIvtZqFMvSdHf9VJzWozrQcTE
         5a/SWB4DNrfzT3STxDEp05+GDoTBXfcfg2ehct6GkKyiPm5vMgwsrfBaUi6XZ9O0CLXL
         4Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GTuxKjPdNDA1IJKjfBvs7ZvCxhpPkNvF7gXyLYk1738=;
        b=lyPKPmnXQv4L7IFc7TaQLy2Yw6zJjeNcyBhbbnHNTj1pDwewlVoB2fAoYa4MZRixBg
         NYRt44asZhYnRbTKIqwEh1/Nm18icST08WRT/Ea0j9TKPeh6sZcaCUX0AtyGdinpos3I
         pla/PmIc3q53Ua4qKUZAWfkFuyfTqo5FA13VYaxaVmsEXeUihHPWvQ7t5bjV9fPpeFZ5
         z9syGoaBZmk3G8apVsy8MfvERKwAh5gzy5v7LGmBZt6BXKh5SxAw/ZYYyhwM/EzYLdvm
         v8hLE3XGDIHDrm4KYS2Z8nJfchpwKzB2WeHaVBeoZfh4tZl4F2p9NjbHAqsfYytWVqaz
         gqRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqKohOiR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27-v6si3230922qtk.191.2018.06.04.08.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 08:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqKohOiR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPrrF-00083K-SL
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 11:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPrqc-0007db-MV
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 11:56:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPrqb-00006J-Q7
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 11:56:42 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:39863)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPrqb-00005I-GK
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 11:56:41 -0400
Received: by mail-ot0-x243.google.com with SMTP id l12-v6so38279295oth.6
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GTuxKjPdNDA1IJKjfBvs7ZvCxhpPkNvF7gXyLYk1738=;
	b=PqKohOiR/RHvUl+1QhYkTCKsy6E4ROLZh4w4hW/l4fl15CQRwEW7BCnRbBVgDZlICC
	OTzyI7HT1mL2VwyKy1eP7MUIJssRYCdpFAM0RId0yV3UsUpHeRuWFK4XJqWg3PAOlRg9
	6vDCR4XbZ4S3R7IB8ee0ZyOuwLpKfBVqwfKxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GTuxKjPdNDA1IJKjfBvs7ZvCxhpPkNvF7gXyLYk1738=;
	b=ms/wmAwcJSvI6L1hVujVvSoy2H5c7cLYTIG1IYGD8TTwd+xVW8WDNSk78/bPQrfys7
	4S/Pq462sCDQd0f5FcPU6mQNcEID1ihEkhID1InxPE/5dRQSmZDrKWKxHFdT3n4gn0Fz
	RnyuEBWhzrVv9A/6BgXu3YXd9CT4RLIjDJ2fNGEb4OFy57nyiIbQShUWeMruE0DGMNkF
	I8yPSGmZgStA5fOcg3qA5q/Kdwag1A1iBKInjM2AkKuREOG3CBGaz7r+M5F1xO6gxhuj
	74UOw/NU4f6VWXPLFKZz6njT1yx8RmnqcDFqEi4gAWipyir0slOZEMTGE2Px6gOo0iDc
	eC/g==
X-Gm-Message-State: APt69E2557UI4ZZPaWqZKpQSZ9sZVryUu7AcR++mmsetGTmIP0Dc5noo
	OUQ0cdo3wS/cn8l1BF6tN3ABmmp3fLI+jgZLt/RuTwHI
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr12485791otd.316.1528127800811; 
	Mon, 04 Jun 2018 08:56:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 08:56:20 -0700 (PDT)
In-Reply-To: <1527816987-16108-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527816987-16108-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 16:56:20 +0100
Message-ID: <CAFEAcA9xHSoRqWJMD-MkUugy0TxZgBa5euP0s=tPdf5wiD+U2g@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v6] arm_gicv3_kvm: kvm_dist_get/put: skip the
 registers banked by GICR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1UR4wFC5vpk

On 1 June 2018 at 02:36, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While we skip the GIC_INTERNAL irqs, we don't change the register offset
> accordingly. This will overlap the GICR registers value and leave the
> last GIC_INTERNAL irq's registers out of update.
>
> Fix this by skipping the registers banked by GICR.
>
> Also for migration compatibility if the migration source (old version
> qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
> we shift the data of PPI to get the right data for SPI.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
