Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp561138lfb;
        Mon, 4 May 2020 08:35:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxMCVuOFuvB20ps8uUwm/swnZRV+UHudWgqe/mIW06kuCmTYz440QYpHmZ77WdYFypv6PI
X-Received: by 2002:aed:3bf2:: with SMTP id s47mr17431838qte.126.1588606506779;
        Mon, 04 May 2020 08:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588606506; cv=none;
        d=google.com; s=arc-20160816;
        b=I8kwuMM3ZvBHpCSyzwX1yCi2H6wCNP3CacNR86TXP+GNm2UBaaxn9ASxVjQzVyULsp
         C+fODqxxd+SsjURg3aoyDzW0R4rsR96969xco12f6b/mnrWYnvB2L42lRM/sU4hoC/sD
         jNnA1PP9f9+7JgwJekJVBXS/SK2aA9I3M2VWg3JpSMYTmj6eqvrJYeCURdP+wzBpsYp8
         cp3Q5HJnub4Nt24AzgmAMx331j1iVEDsYEGSZw2tmMDqeihSHcnr6V0QuzO8qHnYqctG
         57VAuKG4mKHH5Oye9MSEC3X+BCtJpb5R0H9oKHBD4m7s9wiyPz+/MXIFMF6BOys633Uu
         VWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=DAkGWiYCEBGONE/7ZtcTXQF56VZHlgRuV4N1X0KUVb0=;
        b=IT/xBJA7+1xa9QR/2sD7+w4OS/3M0pvflGXvD3Y1QUhGRQ8IC/1M2u6pEYTOxSQGwY
         eUc8zJJjMoT0TzHGXt4chbUmbttFonSJntf+g0byhTGX+ue3kIAwrOI4jV6aFTYpTeHW
         hPCb5Rtsay496RpFIkgOAZv8NI8tR+nd4mwwEI0RLwsL1QMkZaDPLq+upmdGhFb1OpeA
         +uMLXdNYSgxeGbDc5u2s3JIfmRLXEoHrxPe03s0rvOBMdURAI8pJA+xb54aec19he1Ew
         k0XD8Ryf7iXkH/ezfqRIpasNBSqbpAsUZoIu1OwGfaYvFXgPGiz92BLkl122HWtNMm6N
         q0Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JxpyphBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o21si6655295qtt.331.2020.05.04.08.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JxpyphBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVd7a-0004Bq-2E
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVd4Y-0007qx-5X; Mon, 04 May 2020 11:31:59 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVd4X-0007J1-9z; Mon, 04 May 2020 11:31:57 -0400
Received: by mail-lj1-x243.google.com with SMTP id j3so10081911ljg.8;
 Mon, 04 May 2020 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DAkGWiYCEBGONE/7ZtcTXQF56VZHlgRuV4N1X0KUVb0=;
 b=JxpyphBCvJkAZk4q20zhdvizJXoguO08FUgg52CgGNN82R9H97CW2ZQ8mBe9hp909N
 EIbtFCNFq2DWdW3ljcZpa20heXsw7Q31tV/nVA27wWo+8xY2roSz+No4mrG1mXIq9SDx
 GjpEwZpGODQ0Ufk7asu3W/k76kvwfnfzuNqyYplZZNykYdOrxwxtQ94DG6T6uG4XaiMv
 8en/0lCN2P5zKhpxz2U0A2TNP9X0N1z29BPIcn9IWn1oEt4wbwlgoTrOi1BGfsGEyXoD
 WBYsh5doUIp0PN7A7PsS6Z3jwb0VaL5KO8YtqhCfIMldurtDuFjwy2IXADPrlhoYUhrE
 C3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DAkGWiYCEBGONE/7ZtcTXQF56VZHlgRuV4N1X0KUVb0=;
 b=gu9i2NpZwG9cciKmXHVH7Xra3XCnu/etitYY6mKJCPchCDXAvkPeU8rV7zjJ/u8vJ1
 hGyS4h84c+Lq6jDTjTyCuCNgvjcW/R6Ekx3EKYykHrK4aWUy2wMVHCAqGlHAJN8uvPLQ
 8asCEw4KCN/f1EfCZu/R6twX7g8IhDzZ1j3lC43i+0GnEHcAYDEskNPmXgRIppIFWVa5
 IbYSsHTyQ7Lc6szieAERQRiFmCNMCpLUkzFEi6nW0Th8RGlNY1c/JfzDpTjL+MH3Aunn
 Br59gy9atv98/uR1tXznvUF8pv9KP24igsgHvhl974rQh7LU8w7SEdiQqiMB30FRpPTG
 Rcww==
X-Gm-Message-State: AGi0PuZbHutSkwS/XoNMXH8VMHAdKQ4M8PVu8aNzK4DohSU8hlMjHJcX
 K9c6kqptpOfLxxgNltYOC60=
X-Received: by 2002:a2e:9455:: with SMTP id o21mr10825454ljh.245.1588606315161; 
 Mon, 04 May 2020 08:31:55 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w29sm10045758lfq.35.2020.05.04.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:31:52 -0700 (PDT)
Date: Mon, 4 May 2020 17:31:51 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v2 09/10] net: cadence_gem: TX_LAST bit should be set by
 guest
Message-ID: <20200504153151.GI5519@toto>
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588601168-27576-10-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588601168-27576-10-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Tong Ho <tong.ho@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HTe238A94ejZ

On Mon, May 04, 2020 at 07:36:07PM +0530, Sai Pavan Boddu wrote:
> TX_LAST bit should not be set by hardware, its set by guest to inform
> the last bd of the frame.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index ac3a553..f0bf2e7 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -345,11 +345,6 @@ static inline unsigned tx_desc_get_last(uint32_t *desc)
>      return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
>  }
>  
> -static inline void tx_desc_set_last(uint32_t *desc)
> -{
> -    desc[1] |= DESC_1_TX_LAST;
> -}
> -
>  static inline unsigned tx_desc_get_length(uint32_t *desc)
>  {
>      return desc[1] & DESC_1_LENGTH;
> @@ -1270,7 +1265,6 @@ static void gem_transmit(CadenceGEMState *s)
>  
>              /* read next descriptor */
>              if (tx_desc_get_wrap(desc)) {
> -                tx_desc_set_last(desc);
>  
>                  if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
>                      packet_desc_addr = s->regs[GEM_TBQPH];
> -- 
> 2.7.4
> 
