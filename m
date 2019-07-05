Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3629090wru;
        Fri, 5 Jul 2019 15:54:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoXBiqjUvIMc7UutDFA/QaovclW1fulX8dh0rQ/I9tuHUKyFEey9e7vKdMVJbt8wDrUg83
X-Received: by 2002:a50:ba57:: with SMTP id 23mr518579eds.196.1562367241811;
        Fri, 05 Jul 2019 15:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562367241; cv=none;
        d=google.com; s=arc-20160816;
        b=iQIxtmsRWkTGE276VkxTB6UTiI8ORnnZoZwaXcGzumXMTJLehlI4uJCuPvsyMCobNu
         3rupkRlldJ8mJawV56oV7No932DjXpg4BipFCSJd/ew7p79mfjJqgR2W6UumMoEQE8Ee
         Z6l4xoP1AkwMPIEU2sAwr0iL+JMrJPvOXy+p1jUyhXANLb8V0NhMnEkwpcMtqhXga7MU
         LVzkivsa1Es4L7ZCYu1HDHi8FW7z5+SvMK0Bvhe68bLc5nW+sqa8tocCk00BtetfT2hX
         glRUsxd/r4WR8FC1PHgaiKFBSGwdDVPFCxOAshIz8UB/0OFUY3Q7Nlj9fy/wLmQqxXjp
         USeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=EuO3SQ1JkM9Sd0A/U/2k2/nifapET8PHFaQtDL31u1I=;
        b=bdXmlHkSQWRE+1wSlsDBcp1Fb6S6ctAfQlMusmwo+C9Vr8QaCEfL2fyR90OY81Xs4o
         ll++1C8OVeN9eCF8o7wCaFi6NCNEqZx5kBZjcqT2aXANHwIW5vR+FgggP9l60xMdYKVb
         3fQCCpw2axM0Ixhiu524Q0PDbel3fECN+PvDFMZH8JbzI1xqQbyXpDytnCB06FG39O1A
         hwmUhC8uEjxFhobb41bVR5IR+w1puUVrYUeH3dmIpc7KlixVsego2TVtQftNSHaHcSkA
         SvYbxOyoJbfkuv4ybl6n7BQDOrvhrR+3bfB07mTFFSI4k3axWQQUmFOnA4e+Ue6FVX9x
         D3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ibIK3ttG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si2497497eda.197.2019.07.05.15.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 15:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ibIK3ttG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjX5c-00049H-UE
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 18:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57231)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjWg7-0002Pf-JC
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjWg6-0004FV-GS
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:27:39 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:32801)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hjWg6-0004Ek-86; Fri, 05 Jul 2019 18:27:38 -0400
Received: by mail-lj1-x241.google.com with SMTP id h10so10559645ljg.0;
 Fri, 05 Jul 2019 15:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EuO3SQ1JkM9Sd0A/U/2k2/nifapET8PHFaQtDL31u1I=;
 b=ibIK3ttGn3y6OwHghSKS4CWfwU2hlW5hCVVf1qlvKSggOTE6xh9i9ERDm6QmSVXNT3
 4oGf5fraHkS12ccn0dr5MBgNHe8srC5WadCTZsrqsc/3yZLxO20MqmKO+vN2Sy499Ik7
 jHjUPBiwToAmAS77npBS2rk63lYHKGGb81p7pBeNTcP6asMdqIsiaCC/WhD9r/9QdPTb
 8bAWpE6pDrO451+cp2feCGmo2teoC5GFWnPBjRSmidKJ+yZAeZc14Xavc+ORvDRF8E3T
 CjzkufJuj2P0tTxTUZam+3U5oRkaSxnulqQskbo6sRwl2sBXpiUMSWdXVfhfTg9zni8O
 NJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EuO3SQ1JkM9Sd0A/U/2k2/nifapET8PHFaQtDL31u1I=;
 b=RcE5M96lcpUrA0wBne+K1sBcmUjpPbF/NccmkPoVdrjyLy2DmSfJRj689UP6bkkLj1
 FXOlmxKONzkhB0+56w/q40dIyOtHneamDomNH6rfx6NSm1jLUU5D1pE0+GHZlPpzQhir
 F0V/51Hwupr7meePor/vILPo3uTNXXSln0piIBDaw5g6VgkooIx2aliIikJPcH2zq3BE
 T21F8KoFab+zJ1NskhOVSEuNtHOtQPJoPdBciuLn25BBoNa5fv2pjaPOwK2gyn5zhQ1q
 Rk2ky+tuyO+aZE7N5IdP09gBFdMSeJAd7bo1cQYYOn9KveC7Edu438H3FoCDc3uhsrXD
 2MHQ==
X-Gm-Message-State: APjAAAUCBnAPdiBNcY+g9QrXriysg5M87d7QqocftmBl78NfjreWpM/S
 Tya1OVWJoR2gyJSjf3sqp7E=
X-Received: by 2002:a2e:864d:: with SMTP id i13mr3297723ljj.92.1562365656593; 
 Fri, 05 Jul 2019 15:27:36 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 z17sm2027186ljc.37.2019.07.05.15.27.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 15:27:36 -0700 (PDT)
Date: Sat, 6 Jul 2019 00:27:34 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190705222733.csufstr4iua5wfle@fralle-msi>
References: <20190705202500.18853-1-philmd@redhat.com>
 <20190705202500.18853-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190705202500.18853-2-philmd@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH-for-4.1 v4 1/3] hw/ssi/xilinx_spips:
 Convert lqspi_read() to read_with_attrs
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
X-TUID: JVTKHCeUUrEZ

On [2019 Jul 05] Fri 22:24:58, Philippe Mathieu-Daudé wrote:
> In the next commit we will implement the write_with_attrs()
> handler. To avoid using different APIs, convert the read()
> handler first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
> v4: Do not ignore lqspi_read() return value (Francisco)
> ---
>  hw/ssi/xilinx_spips.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8115bb6d46..b7c7275dbe 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1202,27 +1202,26 @@ static void lqspi_load_cache(void *opaque, hwaddr addr)
>      }
>  }
>  
> -static uint64_t
> -lqspi_read(void *opaque, hwaddr addr, unsigned int size)
> +static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value,
> +                              unsigned size, MemTxAttrs attrs)
>  {
> -    XilinxQSPIPS *q = opaque;
> -    uint32_t ret;
> +    XilinxQSPIPS *q = XILINX_QSPIPS(opaque);
>  
>      if (addr >= q->lqspi_cached_addr &&
>              addr <= q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {
>          uint8_t *retp = &q->lqspi_buf[addr - q->lqspi_cached_addr];
> -        ret = cpu_to_le32(*(uint32_t *)retp);
> -        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
> -                   (unsigned)ret);
> -        return ret;
> -    } else {
> -        lqspi_load_cache(opaque, addr);
> -        return lqspi_read(opaque, addr, size);
> +        *value = cpu_to_le32(*(uint32_t *)retp);
> +        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
> +                   addr, *value);
> +        return MEMTX_OK;
>      }
> +
> +    lqspi_load_cache(opaque, addr);
> +    return lqspi_read(opaque, addr, value, size, attrs);
>  }
>  
>  static const MemoryRegionOps lqspi_ops = {
> -    .read = lqspi_read,
> +    .read_with_attrs = lqspi_read,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -- 
> 2.20.1
> 
