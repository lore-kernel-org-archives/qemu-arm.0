Received: by 10.25.0.6 with SMTP id 6csp1882074lfa;
        Tue, 30 May 2017 08:56:35 -0700 (PDT)
X-Received: by 10.55.33.163 with SMTP id f35mr21052986qki.51.1496159795473;
        Tue, 30 May 2017 08:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496159795; cv=none;
        d=google.com; s=arc-20160816;
        b=PxSE2ahQwhKq1i1zVv7ne3yLNKWVRIGUAZqv+nJ6/QSeaBNZRnhVSHHV2IUaiT+mmE
         g/nUl7ArZlw9Jrnzi9IRtUVutzFWBLUfsYywC3G6OKDDUCpdV2juLoO7lJRDf3Yjfr5L
         DPnKWaMuVePU5xZfw41MY90Q+rgvvbjX1yBa5uWeeHshE5+h/QqYpf2aVoX/+G6km0ad
         yLlJbW6uT8wyNdlGcAVETNvfD1rlbHk+fYWBlJDHJof3PtfCIEuwZNwJNlipEaGU+EsZ
         0MvGwUpsRh1BXsBzir1DXr+rMR0a4RcY5UViDYf2KAAkordHMfxyvZQS3vxBkfRr1SMe
         5c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tuXKp79pl9fLVxUYnQ+NV0QRhZKzGkuLkhOtk/NjBoI=;
        b=HNoJDqOPYw7nHkCp+DoXd4R+aNxDho3MKHANgJ/SQSUSntXS7lZQrmlKlvAAc9A/ro
         xC3HvUtdtzRQH4U38oQRx9vWLqrvIy2FxFstE4pRcqXWRJxIpUWqu/KHpZmyIhDOqftF
         jsuNbSrE0YDSarUHGOjYZb5j7Eu3jRlb9O8pu/0eYxIqKDHhgilgyljzfF5JlfwP+IlI
         o1HqRv13gHr9pu1sMCLcsc2lf+9dVTLDXuuqcVZ5U9/Uclm7rZxqdby4WCq5bjRxCM10
         oJnHDAh9HkuUUKFKQbrGSprSwAHTSKhyKNJNqJtMJ35Q8kqviqvqu/FAZ57XxCrhud+C
         G28g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j17si13314471qtc.142.2017.05.30.08.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 08:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjVa-0006KM-VF
	for alex.bennee@linaro.org; Tue, 30 May 2017 11:56:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjVX-0006KC-8Q
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjVW-0004QI-Bc
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:56:31 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFjVW-0004Q2-5p
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:56:30 -0400
Received: by mail-wm0-x232.google.com with SMTP id e127so104689264wmg.1
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tuXKp79pl9fLVxUYnQ+NV0QRhZKzGkuLkhOtk/NjBoI=;
	b=KIl1UBSBV7vO4Ed3egxKs714aJKHCzrwhPrw1Fmi3QlBPlOrjMLQOJrtGfLFwsTbky
	dc8izhgiQHWL053T/t6Sx02Qu8v8aSboQ0Tk4sdXIsUW/dvl+N5XF5MufytrAVE/GCOO
	YiPTXUxXhAwczBn+A06mgvzTM3BF5vv7FRlW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tuXKp79pl9fLVxUYnQ+NV0QRhZKzGkuLkhOtk/NjBoI=;
	b=GRrELoM6+X88c4xi0aGvy0J2cp1bFN06QoWDY35+BdteMUHvJCVrGcQ1N4gXcnOJDx
	7i0r0StJYkJWWvZMibnhTySqZqyoIb1emAitIMkUomu+AR5m15Hn9peTlST3/uwfgUZD
	jCXXaJCh0iV/tEtp7L1o80Dbz3D66ktlXo3ice6gn4lrBN+OueYAJ8gEYLljbz5FOLHU
	xpvBgXkCT9QRc31IKtRY+V64ZzGcmfqx0Azmxg/IWEDriWk3rCoMp9KrCZcWR76MVNhz
	UTPVT+vmEq0njTIMJMNqQli12lHzCw1jtJbbIqXZSqpdgiDyQJKTGvgRYINlpMBsbhgr
	V3Ng==
X-Gm-Message-State: AODbwcBXw9EtYdAjI5TaV8pkXX0plsVFcWwT8FsKCjx43Q1DlcSaEt10
	w7AJJYdwQ3AnmKaqbLT8HV04dI6bWjAb
X-Received: by 10.28.136.83 with SMTP id k80mr2142339wmd.38.1496159788993;
	Tue, 30 May 2017 08:56:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 08:56:08 -0700 (PDT)
In-Reply-To: <1494697399-352-2-git-send-email-eric.auger@redhat.com>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 16:56:08 +0100
Message-ID: <CAFEAcA8SHP+=+hXB2D3XsCdeFg5NMSqTxtjH9aEU0bE5bL-2Dw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [RFC v4 1/5] hw/arm/smmu-common: smmu base class
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bOroFzIfmgTk

On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
> Introduces the base device and class for the ARM smmu.
> Implements VMSAv8-64 table lookup and translation. VMSAv8-32
> is not yet implemented.
>
> For VFIO integration we will need to notify mapping changes
> of an input range and skipped unmapped regions. table walk
> helper allows.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> +/**
> + * smmu_page_walk_level_64 - Walk an IOVA range from a specific level
> + * @baseaddr: table base address corresponding to @level
> + * @level: level
> + * @cfg: translation config
> + * @start: end of the IOVA range
> + * @end: end of the IOVA range
> + * @hook_fn: the hook that to be called for each detected area
> + * @private: private data for the hook function
> + * @read: whether parent level has read permission
> + * @write: whether parent level has write permission
> + * @must_translate: indicates whether each iova of the range
> + *  must be translated or whether failure is allowed
> + * @notify_unmap: whether we should notify invalid entries
> + *
> + * Return 0 on success, < 0 on errors not related to translation
> + * process, > 1 on errors related to translation process (only
> + * if must_translate is set)
> + */
> +static int
> +smmu_page_walk_level_64(dma_addr_t baseaddr, int level,
> +                        SMMUTransCfg *cfg, uint64_t start, uint64_t end,
> +                        smmu_page_walk_hook hook_fn, void *private,
> +                        bool read, bool write, bool must_translate,
> +                        bool notify_unmap)
> +{

> +        /* table pte */
> +        next_table_baseaddr = get_table_pte_address(pte, granule_sz);
> +        trace_smmu_page_walk_level_table_pte(pte, next_table_baseaddr);
> +        ret = smmu_page_walk_level_64(next_table_baseaddr, level + 1, cfg,
> +                                      iova, MIN(iova_next, end),
> +                                      hook_fn, private, read_cur, write_cur,
> +                                      must_translate, notify_unmap);
> +        if (!ret) {
> +            return ret;
> +        }
> +
> +next:
> +        iova = iova_next;
> +    }
> +
> +    return SMMU_TRANS_ERR_NONE;
> +}

It seems a bit odd that this function is recursive -- I was
expecting it just to loop through for each successive level
until it hits a block/page entry, as the LPAE table walk
code in target/arm/helper.c does...

thanks
-- PMM
