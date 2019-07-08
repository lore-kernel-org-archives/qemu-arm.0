Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2511778wrb;
        Mon, 8 Jul 2019 07:26:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsMstwsdTtuJ54kVlevzsyRL3Qp4yFaj8nNR/XY7UfmV33ACcDnAjtIIAOwFzAHPJVDbPT
X-Received: by 2002:a17:906:45d7:: with SMTP id z23mr16754721ejq.54.1562596012925;
        Mon, 08 Jul 2019 07:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562596012; cv=none;
        d=google.com; s=arc-20160816;
        b=e/r0jpiz47yZCvV1t9Qyy1sW+xsoOlm0ivBwu3uls9HDP1VfNRz4AQ0FwMZJOs/2+2
         XBvSAta6cqUDxoon1Ks0DqNbjX9+oPidjkIFLCHeFCsk96WuJdVxht54vIzZKv4anDpk
         MdvHfo1GKiNcnCUd+AkUogej5KkVU0++Ps+hzR0wFKE/5p+kVSbSU4MvDMWyR3vn7ohl
         F5C1C2gtI8Q1+aPRKA191ZqtGCMTDtk6fIJxPAeGZiEdtPqrwNeTA5JQkCdoRARN8zs4
         ryirbXYAi8M3OU9VRYQr15lpLKAziemB2aKXItTcUIadtr0eJ7pKmtsn51oNi0UWEjaT
         r32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=ZUjIs7HyOXCHTzrNzHkS1o7+7iYW6+PyowkFVyfSvLU=;
        b=Veiwu6eQkgpPWt/GcbQCDu4Q7fq3uq6VWfFug7u9CLnpFwVsooUsPEAkkfK/d6bWoF
         FCZxOA4+SkLrup//wFnDtFNSov9KQ0mF+oNy6e14nE6knEA4UBHM0s4cHCD6UXBXxkLq
         6FWEBIElA4RqlvAUZ8sDY2Bj41p/O/G5pLPtPFVrptjWLtXdYNww6j/+nIS8gnYnzDMP
         28Uqe+Fl4zpEF3EM4gf6woKD1ivZ+tUOrHzrVMsgVEmFvqu7cp1x3glc5tt8h17NdG/L
         /SUw/QvTt7f9RodWMFwUe2bq9YiztwMtH3u9wjPzJrYVaHbSDJiuSET+JDHCRDYSpLXh
         P6GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDQNFrO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si7389818ejj.176.2019.07.08.07.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 07:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aDQNFrO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkUbU-0000p7-1a
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 10:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41997)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hkUbM-0000lo-4v
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 10:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hkUbK-0002ex-TF
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 10:26:44 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:41834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hkUbH-0001zF-H5; Mon, 08 Jul 2019 10:26:40 -0400
Received: by mail-lj1-x241.google.com with SMTP id d24so7023886ljg.8;
 Mon, 08 Jul 2019 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ZUjIs7HyOXCHTzrNzHkS1o7+7iYW6+PyowkFVyfSvLU=;
 b=aDQNFrO0AGR/wscuI6Ju3Wcc4KERqlUO2HvJGQFI1aSCrh0DAqGqpeKQmtH+UVLHrv
 TMMweWDqaQxcYh8B6h34PWwcs1nXss9K9sKjYHZqlIO14otUhjmxKdfaLIltDubjbfgl
 NcK3gTnKY0gjNidB5TqkO+lII2km3p+1xxsD4ixCpOO7QJb+lb95fSeOq3fgmNsANKlr
 BalxAl7bAMzdudYiOof7yQdVg8JgXqoe5AKWAfHGpaYqHI7t/t5L9CqrkecUP6sADu0s
 TJMR+J43tRwd1UJO3hFU7ubf74ohbD8+yrRhMbDSgKnG4SqUMSFMgHGPu5j7m5zNqGKf
 ivgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZUjIs7HyOXCHTzrNzHkS1o7+7iYW6+PyowkFVyfSvLU=;
 b=JdCNpQFGKzE1ytbgD5HHw0yNZbqQus8y57tn7uY5qkNUHcfXUEO2MVRH7zyi42viag
 iY8m997dmGh4jhq450TASFEwqHXy31DeaGt4AX/a7qWZ4XFdFp/7oyZw7CtsBSzXfJKA
 O/RcX+A9fk28hi2K/9DeaPgQqtdv1cTGXWoaSdCjZrNiFWuka8fzY681VMWAxtK9lJua
 E88viO3huHZTAUElWnissW/kcsmmEYb4DsQUWG8p8YIswngC8d9zfpNKqcQg0iCckV6I
 pQ30b4LTTshsjRgYAgH7EWnYoCyLSZBFea0hCUTUzDZyQRUGuYEbssFV7w5+lE/H+oPz
 ATiw==
X-Gm-Message-State: APjAAAUd2pQnBOPtpNrlSbu+9R24kwwJ81UOIB5BFjKtKG12hJGQ87Ye
 oVfqF164yIi1e3MsGTc95MQ=
X-Received: by 2002:a2e:8999:: with SMTP id c25mr10416692lji.169.1562595986160; 
 Mon, 08 Jul 2019 07:26:26 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 t1sm1870955lji.52.2019.07.08.07.26.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 07:26:25 -0700 (PDT)
Date: Mon, 8 Jul 2019 16:26:23 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190708142622.k4s5oknmzzj4brxd@fralle-msi>
References: <20190708104750.1071-1-philmd@redhat.com>
 <20190708104750.1071-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190708104750.1071-4-philmd@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [PATCH-for-4.1 v5 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVYk1G0CZn/+

Hi Philippe,

On [2019 Jul 08] Mon 12:47:50, Philippe Mathieu-Daudé wrote:
> Both lqspi_read() and lqspi_load_cache() expect a 32-bit
> aligned address.
> 
> From UG1085 datasheet [*] Chapter 22: Quad-SPI Controller:

s/22/24/

After above change:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com> 
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>

(I tested all three patches so the Tested-by tag can also be appended on the
other two)

Best regards,
Francisco Iglesias

> 
>   Transfer Size Limitations
> 
>     Because of the 32-bit wide TX, RX, and generic FIFO, all
>     APB/AXI transfers must be an integer multiple of 4-bytes.
>     Shorter transfers are not possible.
> 
> Set MemoryRegionOps.impl values to force 32-bit accesses,
> this way we are sure we do not access the lqspi_buf[] array
> out of bound.
> 
> [*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v5: add datasheet reference, drop RFC prefix, fix build (Francisco)
> ---
>  hw/ssi/xilinx_spips.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 3c4e8365ee..b29e0a4a89 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1239,6 +1239,10 @@ static const MemoryRegionOps lqspi_ops = {
>      .read_with_attrs = lqspi_read,
>      .write_with_attrs = lqspi_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
>      .valid = {
>          .min_access_size = 1,
>          .max_access_size = 4
> -- 
> 2.20.1
> 
