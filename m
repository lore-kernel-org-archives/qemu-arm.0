Received: by 10.25.221.202 with SMTP id w71csp130703lfi;
        Fri, 4 Aug 2017 18:00:14 -0700 (PDT)
X-Received: by 10.55.108.131 with SMTP id h125mr5194034qkc.285.1501894814430;
        Fri, 04 Aug 2017 18:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501894814; cv=none;
        d=google.com; s=arc-20160816;
        b=ZyePslJr7BYI4e7wgD6owycd2mfg1vDnSKE3OzHkfl45NGAIObsNFNrg90e88I5j/K
         ZFiwtUq6yLfCWHGonBnZvld5SGnaHa74IpjnRVsTAbY0yt3XF2L2tenGUo4lAeOhUXQ1
         S/JlAkEQrlFP5X3lgF3s12hquNIG0x9QtYixmFXH8GnONVu2UdY3fQ+w8mDKC7k8b10R
         9rHyUDn8VPxe+d+Qrh+JmQ6b88/XKWBMvLnzlUpqfO5bHcTlORYgnkOveHJcqqPQUrjP
         t9/YwS2trUDlNLiS8FFmmZEAWsg+jfUYt/Ptq2PSnrRC5CO/1oOO2scfXjAYub68a3Qs
         /8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=a4RooRKZtaeF8XrME918KGg1GUVvnZV/pJ168cpGpZ0=;
        b=VnIVUeicNljvvtNHGk0kdTLaqfhGZ+A3ccN1UBW3qK1LHEFD43Qe1KinmDSDautyT+
         6ZtaM3G7jJSngN9MJxVDI61xQmBlP4fAP+epAngSp/bW7/bpAyDe1kIVYFI493y/rRlR
         n8waODFqTn9uIbw81AZnk+uGiXyX3Yua4+/KPr64Wq4trh97sEQBIGp1MbzNv39sTs4y
         gvXf5nT+V9OCuDGKWROzAsYOmuHJL3lchOPedHqXAYN7nO9WM/jpSKxLb/6/tppCxsN3
         UGR6cweyS0Hk4PC5Ip0qOHG21GrhSkQOJJ5eRbgJRvFZp0UfhD6AIgxJsP24XZWdcpks
         Oc0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QjpdhzNC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f42si2899714qki.351.2017.08.04.18.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 18:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=QjpdhzNC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddnRr-0005Se-Ua
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 21:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnRh-00056Q-AW
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:00:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddnRb-0004AM-Jp
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 21:00:01 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddnRb-00049g-Aj; Fri, 04 Aug 2017 20:59:55 -0400
Received: by mail-lf0-x242.google.com with SMTP id 65so2016128lfa.0;
	Fri, 04 Aug 2017 17:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=a4RooRKZtaeF8XrME918KGg1GUVvnZV/pJ168cpGpZ0=;
	b=QjpdhzNChFIfwoaipifwqcmzaTgoLLnqSaVdCc5OjcVB5WeIKU4+ajTYMljDQh+dc5
	YIKkSkFyqr66h+XuckHT02nmFAnGk/k6Q6cJaXveGsSWorqA/8xue00Pv6qgWgw62JJH
	jlXUFF58Eo/AobqvjK7coko+3vE6R14RAXUyfTVQ1Cnbn7wsDg1gCtyTKwXO0USHCQx4
	FQvBiR4JHXCzxCoRYgd6v7NeOcHwSDHfZQI9L06QTZB5Ol0tq0V4xCus8oLRNRqSeKXt
	rGF5sOjEsGrp+UfDxqjTEo+1NAUGnfKiK5ZNQm4vcf0KKRULGkcTInIfX7ic2p0T7/hd
	f2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=a4RooRKZtaeF8XrME918KGg1GUVvnZV/pJ168cpGpZ0=;
	b=GgzW1/zJETDRsvlxFbXRzUX8WAn9RAzT9YJtgZ7AFmdBN3hlQyZAD/Uf805kgwlfUn
	wTLHvVa9xrsqUGbvYft5ESk4rxD2gTbB2grxelWw9B//wriJ4ztNfX708S81M3VpI7MR
	HJPtyMeAdBDkRo0qa6rvyORtrOItaObHQvj2eErvIXJGaY4ZZXO5ZfHRwByW9lJfQDZD
	DJSLoTdd7uJkqALdvj1vtVthwrtOmjelmrnQz1RrO3g3t7UueMbsX0VvLjWSPuaKzWsb
	aUuKz7p9ihByDwYC/MlIyOJt1VPV90I42Fgnw4KSmSg9bUOzpuDZzDpTz+HUWCn8oOqG
	P9Pg==
X-Gm-Message-State: AIVw112enqY948vPavYEb8f9G0h2nVvGa42mD+QrN2Anhuwtf0HAHyCD
	Cq337yjAV5QIyA==
X-Received: by 10.46.5.80 with SMTP id 77mr1454269ljf.91.1501894792210;
	Fri, 04 Aug 2017 17:59:52 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id p76sm812394lfe.2.2017.08.04.17.59.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 17:59:50 -0700 (PDT)
Date: Sat, 5 Aug 2017 02:59:49 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170805005949.GY4859@toto>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH 1/8] memory.h: Move MemTxResult type to
 memattrs.h
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pATLH61xeCED

On Fri, Aug 04, 2017 at 06:20:42PM +0100, Peter Maydell wrote:
> Move the MemTxResult type to memattrs.h. We're going to want to
> use it in cpu/qom.h, which doesn't want to include all of
> memory.h. In practice MemTxResult and MemTxAttrs are pretty
> closely linked since both are used for the new-style
> read_with_attrs and write_with_attrs callbacks, so memattrs.h
> is a reasonable home for this rather than creating a whole
> new header file for it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  include/exec/memattrs.h | 10 ++++++++++
>  include/exec/memory.h   | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index e601061..d4a1642 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -46,4 +46,14 @@ typedef struct MemTxAttrs {
>   */
>  #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
>  
> +/* New-style MMIO accessors can indicate that the transaction failed.
> + * A zero (MEMTX_OK) response means success; anything else is a failure
> + * of some kind. The memory subsystem will bitwise-OR together results
> + * if it is synthesizing an operation from multiple smaller accesses.
> + */
> +#define MEMTX_OK 0
> +#define MEMTX_ERROR             (1U << 0) /* device returned an error */
> +#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
> +typedef uint32_t MemTxResult;
> +
>  #endif
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 400dd44..1dcd312 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -112,16 +112,6 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>      n->end = end;
>  }
>  
> -/* New-style MMIO accessors can indicate that the transaction failed.
> - * A zero (MEMTX_OK) response means success; anything else is a failure
> - * of some kind. The memory subsystem will bitwise-OR together results
> - * if it is synthesizing an operation from multiple smaller accesses.
> - */
> -#define MEMTX_OK 0
> -#define MEMTX_ERROR             (1U << 0) /* device returned an error */
> -#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
> -typedef uint32_t MemTxResult;
> -
>  /*
>   * Memory region callbacks
>   */
> -- 
> 2.7.4
> 
> 
