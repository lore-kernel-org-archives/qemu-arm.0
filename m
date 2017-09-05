Received: by 10.223.172.38 with SMTP id v35csp1323556wrc;
        Tue, 5 Sep 2017 04:59:24 -0700 (PDT)
X-Received: by 10.200.57.161 with SMTP id v30mr4852153qte.168.1504612764882;
        Tue, 05 Sep 2017 04:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504612764; cv=none;
        d=google.com; s=arc-20160816;
        b=WKiPMdjSL5wjng8tNaBY6wENxDIe/cFD75YKv6tY6Q4rpfpjx7qoJQtNsDH+nLddPw
         j6hltYmK8JL1KdpK3JhQiDy6BF95+3k8vpeWXESl9lWgLIaY4JCfK8S8G2LK5XX9/awB
         SV8ET/mox4p2e7GXi+dK4F3+9W/NseucYXoYySWXHixeB/T9mO5EYsWbs6tAsitCog/x
         jyMq/0EfXLGmzwiWJc5zMyyjte5uE5FwVTXiSHQgCjYE4/GUIMvT1OFN3BRDL068j3pS
         pLKZ53iH4Td8u7zvIyfiiprbaAZ68DX1ajd+1kYuRE82+KI1yoUETBBCq8U7jHV+SNNH
         EKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LiJ9HGNKlkmjxTQEAWilh6v/vGzj+1t8UKjpgHm50uM=;
        b=XXYo3k2rJ+j9gcN3cl5z8PeMK4aRmREf585hLT5/2XVGpfxljqjUaBgvm7Q3bHpFk7
         EKhpW49yL5ojdU1UYYL+B1OM9aifs/VN8udBvEVzts+pUcRcoc/1NiCF7RMsujvV3NUZ
         UoN0xkrRU1au/hdecL7j4pBsDEtf7tdlcyrv03z5dNOe40+X19jk7ZJZ7kOjloErHCSx
         Aw0fGMmvTv/6iKtjE2KMgOHjV6peb6UTjKBELmkjOoKEtmsBxKpT7thfkcEmdd0rraWL
         xJpuWqPYHqsA+dkDWueZM8v2lvYd9brTdwWJL23/d1JyuT24VVfBNBwOm90y12DjSiQ2
         IimQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=goR7e2PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si252158qkl.317.2017.09.05.04.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 04:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=goR7e2PZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpCVm-00030x-JP
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 07:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpCVe-00030P-OU
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 07:59:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpCVa-0003lk-30
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 07:59:14 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:38563)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpCVZ-0003lE-Sg
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 07:59:10 -0400
Received: by mail-wm0-x22f.google.com with SMTP id 187so18028440wmn.1
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LiJ9HGNKlkmjxTQEAWilh6v/vGzj+1t8UKjpgHm50uM=;
	b=goR7e2PZS0Xx4zZKPvEtWXCzyF8Mv5FGybYVxTHNhLTrB+cvAlW6OvlGI4V1qYeBji
	U13+bM3/XdhLv+lH0qh41eMMpiPkZmEEafDQrYTLQ7daxdD3yFl9gzDsGQWFj4LXsPDd
	6boqz9wS/EXJBRSE0BRzO39MwDPFcSBD6t3A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LiJ9HGNKlkmjxTQEAWilh6v/vGzj+1t8UKjpgHm50uM=;
	b=D8NajZdY+UY2bL/moTxWrsf1onlcNo5lstpIVL9JWvc3DZXYxDjtN5YkewIrk5EjJE
	80iqJFmyPP8xyDiEguOcB83HYBH2Jx4hk5HN1dEQe3yb8+5m2KIlJZ6CJaihmx5qF2hc
	u6i+Fe3oe5WCpeM716Jd9mB3jQxlAwCLch6SefAbhn+utwroCgVJXmg5Uo5Wr3WvntkM
	vV/5hYUb2V0jwz+J5sj5jMoOpt/ukOp1hU+EVJoiOaxjUKwSL8VdjGCeJwq5/IALFq3K
	nGZr6PO3Nqc9Ym6ybqBm+RhqnpuaEIOgn3h0RN30CytIy37ubsWJjc/UD74MesqgICtd
	vd8Q==
X-Gm-Message-State: AHPjjUi+lBjpPkcn/uCI/SbiC3W3VbmdPdqS7yJ94HjXX8k2p2u+ORea
	ygq//BdRjESEr5ByjszAP8xpVqzMVI8e
X-Google-Smtp-Source: ADKCNb4NuV482ksVAKM8Y1xWhMTDIQVh6mt7XOqIOR2VLbX8n6srwGGOCEbHA8xOUGF/JhyV3Wluq3DXq/YeR4Niy6E=
X-Received: by 10.28.34.198 with SMTP id i189mr2768477wmi.165.1504612748548;
	Tue, 05 Sep 2017 04:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 04:58:47 -0700 (PDT)
In-Reply-To: <20170905112152.8851-1-ppandit@redhat.com>
References: <20170905112152.8851-1-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 12:58:47 +0100
Message-ID: <CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH] intc: arm_gicv3: limit GICR ipriority index
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guoxiang Niu <niuguoxiang@huawei.com>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1IWdMpUur5Tk

On 5 September 2017 at 12:21, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> When reading or writing to GICR ipriority array, index 'irq'
> could go beyond its bounds; Restrict it within array limits.
>
> Reported-by: Guoxiang Niu <niuguoxiang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 77e5cfa327..7683c4cc7f 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -187,7 +187,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>      case GICR_ICACTIVER0:
>          *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
>          return MEMTX_OK;
> -    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
>      {
>          int i, irq = offset - GICR_IPRIORITYR;
>          uint32_t value = 0;
> @@ -310,7 +310,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>      case GICR_ICACTIVER0:
>          gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
>          return MEMTX_OK;
> -    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
>      {
>          int i, irq = offset - GICR_IPRIORITYR;

Why do you think the buffer can be overrun? These functions
are the word (4 byte) access functions, and they cannot
be called with a non-4-aligned offset (see the asserts in
gicv3_redist_read() and gicv3_redist_write()).

thanks
-- PMM
