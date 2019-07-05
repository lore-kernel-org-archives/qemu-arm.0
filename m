Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3221670wru;
        Fri, 5 Jul 2019 07:17:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgtUAGp6WwzUSm8LVQm5zwCNGEOJYvoP8hxMhA9e5Ven6g79aKO9qkN4uYGX9Xk58A6KYm
X-Received: by 2002:a17:906:3098:: with SMTP id 24mr3825980ejv.106.1562336223574;
        Fri, 05 Jul 2019 07:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562336223; cv=none;
        d=google.com; s=arc-20160816;
        b=CbvKE2mn0mTlvbShM4c1jWl6kbujtjtenkHXUOipfaL6OknDLSF5PwiaMSVy07tb1N
         kM4VhVjsUA0VfBM7vz2Al9Cw4XU25MZ3rklwb9YjYNmy+OKUmssIFWDc0SxxxkxU5KBl
         2QHWg3heq4YZHD5Bh75748jG8gsTBqPD2eDYTMi74REmNKy4/hx2a0AORFQY+pwtI/X4
         7gCJeT1rRtqB4Ui0+M9HixghAVwY0REA8d6M4mhUjBxLnrltMK2YEQlM+E0ORsVVJW4k
         RgtMVGZM35Qi116AYo2OTZKniCwfLNP9HLmgtXb0W55nAywyDmH2MW2QcxIaDpUGd4FD
         f3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=cTjQuAiD+25YZq/P1/SkkzETHTlAtPOe/XGlBxCRBX8=;
        b=vUYiZZ1vWyFaQ4lUY/t9b3x5YjuriXo32W2/KZgTUdj/7q3hGmt87+4p7AcdRDaCXj
         HuHuMVdIj6bQNsjC2OxbzLub2wbUJt1fkMzE47rlJbVD3R8qlmvcBeaVMXzNOJNKGlHZ
         MceeAVouO51ji6sQi2c2KuF7oM0VtNtCFS433yLN4+40oIqolQZxuQAdYXfSJ61kx59C
         lNGc3xrVy5h3GAdaRjKMaMOrt060mmTTG+Wgo3SWR0YpMEl/CYWAAv9QbT2I4BHdWYmC
         ZpiPpMpaTx800aMG9YD/hzwIs3LmCJHYCUap9q2KSTD5p29mSKNp5KQUOvqTb3UO04Si
         YmeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=brtCIiZ1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si5470305ejb.18.2019.07.05.07.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 07:17:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=brtCIiZ1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjP1I-0000SN-MK
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 10:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47759)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjOyd-0007Hl-2e
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:14:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjOyZ-0006ki-T6
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:14:14 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:47101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hjOyY-0006RP-KT; Fri, 05 Jul 2019 10:14:11 -0400
Received: by mail-lf1-x143.google.com with SMTP id z15so6406384lfh.13;
 Fri, 05 Jul 2019 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=cTjQuAiD+25YZq/P1/SkkzETHTlAtPOe/XGlBxCRBX8=;
 b=brtCIiZ1yevmiUisQmVYtqWA1QsMQb4353wAAmYMGnRPQ9svCzrMOAvpXo/nksgGWh
 ue6AVK2SBwFMqAI1ciEVqv0JAdOEMmsls2pTJ0sihhVfqPv0Yf200k9Ra/5jql4M96vh
 82Gpwyc8xidE5Lc/6dqWcTLZS1xgVIqT/dsBQmd0JNobBEPDozIHgT0JNZ0MOSjRLP7E
 1PQtHBv28BspFcLmkv4okH1bCzH3Mwcy4gBbhzj+PgSWDzLNzb38p8ghDRhk95JznoHh
 lgnsjLAycqRnW4mi/B7HlChXvAqHotMjzT8gDcTQ85HKEw2b6pqfDpAiB1nPY3fP4CL9
 jqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cTjQuAiD+25YZq/P1/SkkzETHTlAtPOe/XGlBxCRBX8=;
 b=JvooEFjI2kLmtptf5405HhNrGGkclKEctFcaq6xKe1JOuqWWmM8T6yKgW1ezK4wxTj
 EdMGTveXm4me+xxvtQY7vOVdO7TOP7WWmEdhQLehVWfTpYUQ74w0pn3dj+vdd1IVXnua
 L4GXmvzKvJrkzY965VSUp3OfrgNQQZnrFT+WufnZxAxNyWfc7+kJYsBwOPPPxyyC2D56
 i+GHv8SFGSaeNCdyJixvkmJ1KZlYz5DpSxKJbgtd4BCbgxTV1AJ0KxDMMVL+V6ziLFHQ
 Q4yGKnGJvne67OdAUd/XsLnTd7TyUG+D93X39oe0/MieDk578KXRnFMgbQvlgZo4lCPR
 eaOw==
X-Gm-Message-State: APjAAAVE4SNYD4zVpiQNzK5X2pJbipynaZI2zXZkS5XtXV1RsYsVLa/n
 UBis6cL2T/ZroVi8wvobX7M=
X-Received: by 2002:ac2:5a44:: with SMTP id r4mr2149766lfn.118.1562336047265; 
 Fri, 05 Jul 2019 07:14:07 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 u22sm1983515ljd.18.2019.07.05.07.14.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 07:14:06 -0700 (PDT)
Date: Fri, 5 Jul 2019 16:14:04 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190705141403.zdipi3ewigihm6tl@fralle-msi>
References: <20190705104255.24027-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190705104255.24027-1-philmd@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [PATCH-for-4.1 v2] hw/ssi/xilinx_spips: Avoid AXI
 writes to the LQSPI linear memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eDnYCT3UHLN6

Hi Philippe,

On [2019 Jul 05] Fri 12:42:55, Philippe Mathieu-Daudé wrote:
> Lei Sun found while auditing the code than a CPU write would
> trigger a NULL pointer deference.
> 
> From UG1085 datasheet [*] AXI writes in this region are ignored
> and generates an External Slave Error (SLVERR).
> 
> Fix by checking the access is a READ before calling the region
> callback.
> 
> [*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> 
> Reported-by: Lei Sun <slei.casper@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
> ---
>  hw/ssi/xilinx_spips.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8115bb6d46..0c9ccd12bf 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1202,6 +1202,18 @@ static void lqspi_load_cache(void *opaque, hwaddr addr)
>      }
>  }
>  
> +static bool lqspi_accepts(void *opaque, hwaddr addr,
> +                          unsigned size, bool is_write,
> +                          MemTxAttrs attrs)
> +{
> +    /*
> +     * From UG1085, Chapter 24 (Quad-SPI controllers):
> +     * - Writes are ignored
> +     * - AXI writes generate an external AXI slave error (SLVERR)
> +     */
> +    return !is_write;

What I can see above generates an AXI Decode error (MEMTX_DECODE_ERROR),
MEMTX_ERROR is the one that maps to AXI slave error. What about swapping to the
solution you proposed yesterday? (but changing return value of the write
function to be MEMTX_ERROR)

Best regards,
Francisco Iglesias

> +}
> +
>  static uint64_t
>  lqspi_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -1225,6 +1237,7 @@ static const MemoryRegionOps lqspi_ops = {
>      .read = lqspi_read,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
> +        .accepts = lqspi_accepts,
>          .min_access_size = 1,
>          .max_access_size = 4
>      }
> -- 
> 2.20.1
> 
