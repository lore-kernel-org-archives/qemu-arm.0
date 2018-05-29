Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3627190wre;
        Tue, 29 May 2018 07:21:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL48Dhg6qlcRTSbp9qE70ZcFVWJcwLCNSg1zBI6kWiGnFrQ87KuO3RRiZzzzrF0IwEfvzmc
X-Received: by 2002:a37:1904:: with SMTP id k4-v6mr14598950qkh.370.1527603715407;
        Tue, 29 May 2018 07:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527603715; cv=none;
        d=google.com; s=arc-20160816;
        b=tSl+p/rzmmtKnQp+Pcb8B3kEF0z2VKPbemEw1kD7R/YFo2q38O7vSZxHbKBG0Uo4Bq
         lit+JfAGdge5Ny4Cnvh+NNIX645PFdvZJg/ExQQLJ3VchAIlY89qxIsmhSkjpsi6QR6f
         o3hI+Wbod1cNqake+YyJyIbE61vw+mCLYkipSofok6FE2/CsNvnE1scZ31ta4PO+qrZs
         FVKSNxN7d7cU8NKUIJdBQMX+CIULFfL9VGc9fwXrlLasXTqw3QmUyUqPARFDXe6OdBBP
         ZNOQrcYBnzajBee/vAwlTMfDBNv9t3lhZoRAN/odZwK2X74E2jZ7ER6J8JoQuE891SWf
         KkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d0lj2brOLr+IQz4zoYkD7CfmmEgRGKFBJgAjhDz80gA=;
        b=hjbY/Dr6VPGz+6qXVFqEYXdQu5j80J4N/690ozTOCQR9YqQvVA/HkpS5nN28kyMfbA
         jrB6D1ZAtD8Ea8qyLBn55Qkmiva5ikQFOEBQ0vgJqxmgFAUw/SCN8cBW7o1gxNhaQl/j
         Gz4MKlxuI6g3sazFW11iG4yqoLhCW37xNkJTj+15UKlH4xqd+hygEIZLDuhxiMkvL0Yb
         pTmMsLyHqgi9JQ5tKOrGAh9ICkRb19kFeTIhs/aLEkfxHGRzsvlEQ8eGD7EHgEyaGdqs
         Mbs+bN9U8/OuiDepzpEJISP9A0Bbg5DpTn5jxkyjnyJXwXwvVGAhNtPh9lZBrPVEji98
         HvCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpFyk8yc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c50-v6si4133561qtk.359.2018.05.29.07.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 07:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RpFyk8yc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNfVb-0000ac-00
	for alex.bennee@linaro.org; Tue, 29 May 2018 10:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfUP-00004r-BO
	for qemu-devel@nongnu.org; Tue, 29 May 2018 10:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNfUO-0006y1-JW
	for qemu-devel@nongnu.org; Tue, 29 May 2018 10:20:41 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNfUO-0006xj-Ep
	for qemu-devel@nongnu.org; Tue, 29 May 2018 10:20:40 -0400
Received: by mail-oi0-x243.google.com with SMTP id d5-v6so10166522oib.5
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d0lj2brOLr+IQz4zoYkD7CfmmEgRGKFBJgAjhDz80gA=;
	b=RpFyk8ycsTm0yBGf6Aoe2xvnqgCFNL87nShsEHGBXzBiszMRl7hc9Yk7CRL3TwgG0T
	t/xUABSP1sgPS4v1QbEFsVx70BhSoM4mK3AgrQbY70lHgcBjSy8mRl/agrmbKc5TSCod
	6MeUqebvp06YdiFxd4YR0kULIF+tmM7hMSkkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d0lj2brOLr+IQz4zoYkD7CfmmEgRGKFBJgAjhDz80gA=;
	b=BToGKHytH/zfUXR1VnKUKi3e4sdC1jw/UaZ71VR64twUfjx0Vw80kaeqDrn5S1G6Fs
	6pGTSGY8dJlh87Q9ApaRR7S2+t+jeFTAMk1peqHDNlxFD3fvqZx7ZJmRsWXr8zPiwpYB
	uci1pEOISkmMTr3y0cvbirVHpHXC5LMEWcteiVgujDzW4oq+wlCeaZ8RcRlb4ANS74J2
	bGW/ZCTsL4cEHP7Sk17O1kjzZsyvbq9vHxR8K9mXeNwBBuFWDd3Epjhdm/vcHTM6byDb
	Zr8PPcQwQIX37S+JuF3b2SWpbFco0vMrK0/1HRFY2JbCWppldv/TInhNs1AdZ1oQ4FJY
	QvbQ==
X-Gm-Message-State: ALKqPwfzg3Lhd/rU0AMiiI2+3DwkeH0/BcA9kA9/1OqEJ25v4upPbzm8
	+lzc5uzM0Nz2GV341M8iv5PQIImgeo29r8dHc1ABxg==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr9146890oia.164.1527603639867; 
	Tue, 29 May 2018 07:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:20:19
	-0700 (PDT)
In-Reply-To: <1527247371-10592-2-git-send-email-zhaoshenglong@huawei.com>
References: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
	<1527247371-10592-2-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 15:20:19 +0100
Message-ID: <CAFEAcA-Um2dCAUJ2uxjZW6foBsrEYMnKNmFwex=kD63vLUJ2Ww@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v4 1/2] arm_gicv3_kvm:
 kvm_dist_get/put_priority: skip the registers banked by GICR_IPRIORITYR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pq0G4vLL9/Xr

On 25 May 2018 at 12:22, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> While for_each_dist_irq_reg loop starts from GIC_INTERNAL, it forgot to
> offset the date array and index. This will overlap the GICR registers
> value and leave the last GIC_INTERNAL irq's registers out of update.
>
> Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
