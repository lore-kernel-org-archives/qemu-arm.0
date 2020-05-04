Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp565624lfb;
        Mon, 4 May 2020 08:40:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypL5U5V4CkAkwjQepAJaldl26qEpM7ugH4OUU+gN9+2I2D2jwrBnvms0N5fTiKMpanfoDwZN
X-Received: by 2002:a37:a186:: with SMTP id k128mr17094868qke.149.1588606818023;
        Mon, 04 May 2020 08:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588606818; cv=none;
        d=google.com; s=arc-20160816;
        b=gkjOb+k6iZhlr90Lz4FWVsXmSmcW4lmJstHDRK4T9ISIJY04LRIDws7PPnFqXFaSee
         j4te8BTucljVpoa17QDIWOUGE2clwmWYp4Jm7SIdIMvznB3e0aGwLWzy7AOSRdIx03kM
         GlTv9PPeSsxaoOWffD5Gyxr+bowm5Dk782q9+n83GY1dkYlmV2GmkcayfAXGgEOd7rxo
         vpJj3SmwVI/zAFkcB5kyb9RMZx/BN5dLaj68SUseTm+vVaswI9bobGfqxeZX6bvd0WeB
         D5c+xtiioMxOjZJd/lTMiJ77LznKxTy4xZ9jHfoGNwW08ovtMk1i2Dv7PfGR37mCI7Xy
         Ls2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=6PZIFsge5wwg13tfAZH+RE+7GMgniH7oKbx9miwxAIY=;
        b=RlMsa4GPQW+LuGMnmQjrd8iyyMXYKQ2IkGXciQDKIhg9gvG8HERnvmieTN4bbAWr9+
         5TQD232E0wDexYz3FvZ3eV8dpigTnQ7fucwyYABBPtMGJIS5JsHTgVrrWMxMQQmfsHz3
         dSnL2p9w/RDION3CdgV2hRxkBnoJcCfiNNoAS26+G3qGj0nFA/hqxVReyySAHdq7PuuD
         5TMkZ923Uf1rvksj7LK26NaN6oX7wcc4O4JE+ludgHzlp7gylUE9njWLYCiKDXR81pGj
         lM8YLcDm/NVMiE6vCIBLerZat8fmPZ4/d47zVa/8smGACa9E4aaKcITh2ZHWRmhl8Hfs
         z7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dMju+477;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c19si6646243qvl.151.2020.05.04.08.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dMju+477;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVdCb-000451-EZ
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2l-0004sf-D7; Mon, 04 May 2020 11:30:07 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jVd2k-00044Y-Cv; Mon, 04 May 2020 11:30:06 -0400
Received: by mail-lj1-x241.google.com with SMTP id a21so10060526ljb.9;
 Mon, 04 May 2020 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6PZIFsge5wwg13tfAZH+RE+7GMgniH7oKbx9miwxAIY=;
 b=dMju+477ywu+nvoqwEHBBwHGIH+EAq6Xzkga5CVx6TndFoOwJySmkuTdCxhvb/4BFn
 PmbMeUiYrw7U1FJcU5b6Ei+3aK8Wa+1jmDGEZuGLc/7G/ydS1DfDZa+zamzr0OXrOG1X
 1+DsRBPmzrp4DmH9JYn90sjp0gV8AVz6nBrb5KmL0CZbW4ZE7sX/S2tOZBatzBXKGy0I
 txp7j5uamCuWyB/TH0nvtZibr6hrwJRVdZTk+gAOLDRl3Bd5w8bBql5ZU16zkxTVRigT
 D2RZ8AR63XbXMqRI/t8ayBeJSIG02LxoTgBUTmbciM/gJbn8eldXfcsFOBDOyCbKICLD
 SOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6PZIFsge5wwg13tfAZH+RE+7GMgniH7oKbx9miwxAIY=;
 b=j8zkdlq6gMoc2PChjBE32DxIDIdg0Zi66X+b3VPlunOCq9q0cHIfJvA2oJMlYaw+cL
 M8KmkEdy3m3oeNXwDn//+AWwuj/0GxfwsbWvTYyccwFOWtQQnmcoCPHb8+OwMiHjhlLE
 uJST50+JJWyhm8GJQ6/lJwc3GNSWu0k92ntb5a/82z3L+jdc4xpwBQotp9mT3HWWTC9U
 yYr78/AiyLXrarwisIIV2k7mmhFT0bWeEXBluySCRf8fh1SaKSaHqvqlB90mNnDMvKGi
 CfK+yMnJhT9JkLFyjpx9rlkhZw3Yu0UvvnujBf2xM2wUHnm+ITXsEyd5Zvne8JIHGRdp
 j56A==
X-Gm-Message-State: AGi0PubatC+l/9ZwMD8d890eGHx+sCXzNQh1bPT23enpGd3g0WXlCf69
 5S4PX6F0VhdBYaMkL4dunog=
X-Received: by 2002:a05:651c:32a:: with SMTP id
 b10mr11146766ljp.111.1588606204165; 
 Mon, 04 May 2020 08:30:04 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 n23sm8462302ljj.48.2020.05.04.08.30.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 08:30:03 -0700 (PDT)
Date: Mon, 4 May 2020 17:30:01 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 3/9] hw/net/xilinx_axienet: Remove unncessary cast
Message-ID: <20200504153000.eenrgpbywluzgo7a@fralle-msi>
References: <20200430162439.2659-1-edgar.iglesias@gmail.com>
 <20200430162439.2659-4-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430162439.2659-4-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_WHITELIST=-100 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 jasowang@redhat.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com, figlesia@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBuP8ulUFm9H

On [2020 Apr 30] Thu 18:24:33, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Remove unncessary cast, buf is already uint8_t *.
> No functional change.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/net/xilinx_axienet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 84073753d7..c8dfcda3ee 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -918,7 +918,7 @@ xilinx_axienet_data_stream_push(StreamSlave *obj, uint8_t *buf, size_t size)
>          uint16_t csum;
>  
>          tmp_csum = net_checksum_add(size - start_off,
> -                                    (uint8_t *)buf + start_off);
> +                                    buf + start_off);
>          /* Accumulate the seed.  */
>          tmp_csum += s->hdr[2] & 0xffff;
>  
> -- 
> 2.20.1
> 
