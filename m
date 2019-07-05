Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3332164wru;
        Fri, 5 Jul 2019 09:17:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVcRG31iJ4lWdGO/OAOfdrW/iuujiTZPHZxb/pyhlT4PGHtbLCLIHy09D89T9KQAsliy4S
X-Received: by 2002:a50:97ad:: with SMTP id e42mr5552009edb.243.1562343452278;
        Fri, 05 Jul 2019 09:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562343452; cv=none;
        d=google.com; s=arc-20160816;
        b=sVN9cGjRbg/LM7z7lK8gkA4FaO+tM03p9EG+vYr5cvop1x6oUmxV73C9yFP2hsqM39
         Jur1yW27O5xvFZcpu4wuwiY65/biyuNhMMVUjYC1LJ+gxcwyl0x29dR2ctB9cJ4gcbKI
         2zLwUfBw8kpDsuKjD0IrzLPJZulVOIEjuwQqhv2797B8UioIvLEYLLhSDIYfH4piAKEb
         rgYivyCnxAwNw1KI5fKeiiLciDueTxrmuql2+qAPnNV6UzJybL51RFId/Rw4cQ2L2U68
         MD7YrH06Mprb56oPOlgOs7FnaWQ1OPBIDfMvZeaZO2goQifKy84ewVDz3W9XxzEhSHZW
         ZWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=awTb69l5hLwdxql4WcINY2RSzlnobwbnmh6DKscJkCs=;
        b=ukwQ9ZbczaeTV7cc+sfq5EdNkNG1uQeSyEGIFRh1i1nIAdLEfN2MsZW/HO2gOzN43a
         xyw4JWaHUKUnzDE08I2vSEnKS3lonTWTtWI/wfnoyA2p/Bkaup/23UZxcVwNeENE0X8U
         7ew89A1GYSvL1BdRrdced4b1d9/litOivSz1ESh62If4hhyUySENsNoCIYXi95B/i/OT
         SBswwwFtzeqcX4Ls/Is5pI5lSIglcLjTVR1hCd4ll1oDfyYOEhM9vqzNHQNR/AL9hIuq
         R2+uSb6IruQ/HxOexi1tJNmqr3613ReNwMt2VRmoPRZEmedMiQy3n4646FFMLjGlag3q
         rbOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+uCwv11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g41si7372971edc.339.2019.07.05.09.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 09:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d+uCwv11;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjQtv-00080R-DG
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 12:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41935)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjQnW-0001hN-R0
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 12:11:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjQnU-000598-GW
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 12:10:54 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:34239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hjQnQ-0004vB-LO; Fri, 05 Jul 2019 12:10:48 -0400
Received: by mail-lf1-x142.google.com with SMTP id b29so6699497lfq.1;
 Fri, 05 Jul 2019 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=awTb69l5hLwdxql4WcINY2RSzlnobwbnmh6DKscJkCs=;
 b=d+uCwv11FOleIZ1FDQN4UBLkz7KfUeu7ZadYGhd1UBl8s6G+pS6muGOobED/NAViia
 8a9SmQrGK35Yug2tAR4dz7OaW3eOEYVl6OmdL4mAJXDj4Jh0HDktML7cLnK8s4WZmiu5
 onyspJ9Eeji+5vsCAVaCpGbGVoNc90SniwfICpS5LumhcnQ70t53kPC5GTFRd//KCsEN
 wiDzzyMG6AUUbkLB2PqvvhaSTKKJxPFrkHxBiFyrVxMDUluu88JPEyxpgbRFA+bSV1zd
 1XcOY59GWxMBJn+rReemJ7LXju4Zgo6R8XITrTjESWugceM/9YY0ZsMOoEaneiQdbaW5
 C6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=awTb69l5hLwdxql4WcINY2RSzlnobwbnmh6DKscJkCs=;
 b=I/qof5VBKVVzgj20NBNqw3xe3D8vxYuKaflZ56b4wWb0BfhAUHVzhrkBQoiMTNi0pZ
 iePaxYoyLaWvjJUbdVjquX2SXMfTfscrXoyVNpdeRc/zZiXeV3j1hfmU9WgSHvlHn4qn
 xxx6+pd0EYypFJCb0VjhLqP1CWPNlb8HJzjuhvXQ5PY3r37HfwP6UlDtAbQqP+apVBFr
 pIjhse/xKyzmrXhQ8lcdfk/UJdqsgHnPmMH8IlaqKM9l0EdKfz2Tn2kHUHXrzmX0TsVI
 dxBojaZqmKj35Mh9b4iSzCJlAi2CZVc7jJo9IV7oocoeT/mt3u+eJrjsRvXQzh1AMaF/
 PVUQ==
X-Gm-Message-State: APjAAAURkvrZtnv8g7mGcGyOKa7LzoFO4BxQPXCcaVdrH1kksBcLWuqE
 E/a9tgRRjFhUoOTq//c6fw4=
X-Received: by 2002:ac2:44b1:: with SMTP id c17mr2348205lfm.87.1562343046995; 
 Fri, 05 Jul 2019 09:10:46 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 137sm1845140ljj.46.2019.07.05.09.10.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 09:10:46 -0700 (PDT)
Date: Fri, 5 Jul 2019 18:10:44 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190705161044.pyfkofyz6llg4ztn@fralle-msi>
References: <20190705150850.4967-1-philmd@redhat.com>
 <20190705150850.4967-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190705150850.4967-3-philmd@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [PATCH v3 2/2] hw/ssi/xilinx_spips: Avoid AXI writes
 to the LQSPI linear memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zp8S7WWCX1eT

Hi Philippe,

On [2019 Jul 05] Fri 17:08:50, Philippe Mathieu-Daudé wrote:
> Lei Sun found while auditing the code than a CPU write would

s/than/that/

> trigger a NULL pointer deference.

s/deference/dereference/

> 
> From UG1085 datasheet [*] AXI writes in this region are ignored
> and generates an External Slave Error (SLVERR).

s/External/AXI/

> 
> Fix by implementing the write_with_attrs() handler.
> Return MEMTX_ERROR  when the region is accessed  (this error maps

There is an extra whitespace after 'MEMTX_ERROR' and also after
'accessed'.

Sorry for not mentioning above before, after correcting this cosmetica:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

Best regards,
Francisco Iglesias

> to an AXI slave error).
> 
> [*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> 
> Reported-by: Lei Sun <slei.casper@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ssi/xilinx_spips.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index e80619aece..4c0b0aa3c9 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1221,8 +1221,24 @@ static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value,
>      return MEMTX_OK;
>  }
>  
> +static MemTxResult lqspi_write(void *opaque, hwaddr offset, uint64_t value,
> +                               unsigned size, MemTxAttrs attrs)
> +{
> +    /*
> +     * From UG1085, Chapter 24 (Quad-SPI controllers):
> +     * - Writes are ignored
> +     * - AXI writes generate an external AXI slave error (SLVERR)
> +     */
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s Unexpected %u-bit access to 0x%" PRIx64
> +                                   " (value: 0x%" PRIx64 "\n",
> +                  __func__, size << 3, offset, value);
> +
> +    return MEMTX_ERROR;
> +}
> +
>  static const MemoryRegionOps lqspi_ops = {
>      .read_with_attrs = lqspi_read,
> +    .write_with_attrs = lqspi_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -- 
> 2.20.1
> 
