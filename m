Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B332FC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PKM-0006UR-Mj; Tue, 01 Sep 2026 10:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PKL-0006UB-DS
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:19:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PKJ-0000pa-Im
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:19:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49ccf12bed0so44355e9.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788272341; x=1788877141; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LFQm9x3Io7LbTU4H+xdgCppdZHTWlDVq/Gw5YajH9iA=;
 b=BN6iq7XRxWlbbRQpIm2Jzsnoy9FOv7BAlKao79d/zv2tRYbbdQrQpgUbTBvbAe+5LP
 UCEkpdI3ZG9w2JfMk6SPQVKZvrEyPHBOxbn43jHvs1mW2KSAjJIvhoDd5klcMgpUVZYW
 cDzJMsbMCWC9aj5Dh5Gq6S5tMbmIVkuF007g5brBXmXCdxSf1r0Yjk7XqAaj8SIdVq0n
 DxZWIg68slIFOEPuSLWiR2hRcjFqYQU+u/aKNx6RhC9dwMHKVUfBC0xRuUm8WI1x1ltC
 7mb6cX36EZvdMmm5jGrd8Nw0c3qg+YnJj5l5BYd0YBmacKF4+48m6uK7ZBrarD4V7r2e
 AY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788272341; x=1788877141;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LFQm9x3Io7LbTU4H+xdgCppdZHTWlDVq/Gw5YajH9iA=;
 b=CmpeQgrziFljJh5wG/o8LVM0luweEO/WhGeWPSt3P4r4o4eYzpIw2rjKf6kFMSw3MG
 tMRedIIbnmfqOjeYFq529r4KbFxOS4mx7QA9Zz5LtdM7qK4Ts4XM3FWMRZi5HwdsAaNR
 gT+sEXSU3DvT9+g/7luxED+RLMDHjlRJYsoU/GsSWjyGPo7dP2pT9O4HGT/hQchXXLhd
 lAVUsMiWZFa5TIhwluSMRuoDvG3KvdAPVYXuDjE1teeW3N/k2eMi7VeI544Lm5cGEkji
 iOxI8e88YfKL5RBhC1t627oaJGecCjTa9qXgua/fM89UQV+a5uQaHS+0+HwBCOTmbbtq
 UmKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVpqlBNfQIhUNYqtDST8MllAaR296QpVJ0VzsxN9F2EllCOsH38tu1qVsX4EpsrSslsI6dZ2sznA==@nongnu.org
X-Gm-Message-State: AFuF++l0/Is14u6iJk2x00kzQ3XGWYfAhmbcHOL6lI8aq7egePDERaNh
 gvzU+Clb0fEONzBkdmYDWfsHDHM42qEtG82vIeP7NAYQWoKWeilTbOETdWTd/77zxQ==
X-Gm-Gg: AR+sD12ewo9sEqFR6Uimfi6uL8JO3Cw294hpzUy7V52VoSYaIF8mdkOflRzJGo3Nn/o
 MHS5m0taohkZQj4tkdDUJ6H9qP6K+z397GE4FsgyeebiUe00vZQIhUufF7JxXdXGzWWJALziN05
 G9e09WoSFYWvyqujJxz2ULskGFj3DH4JLLVg/TGR6zqNWQRQfBfHLqXX3t7NNv23e4I34Q02AaW
 MSGpQPE3Y9OiKiCmysGn52ZtntumBuSqlmBPdAjr2jxrps1pev8d+S5hjd5ECfbWi5EfmMfsrGC
 A6MBirIEjZ4XdIzPu7MWWPGiVM0ypMWucCVMaXkHkF/Ttu6f26n+Q4+4rC71nlI6sTi93E+iuXO
 4qNNSjgeOY9fI8Lp7HwnOK9eL8DMkICwXFWgsW016rKy4Dl8VNTnDeJs15OUIAzoSemrX2FXluB
 YzniH/D4z41vXqVjbCormdOYSOeL0v15Z+GAp2mNC13Y2qqjdMRH9opachUJ2re1zqEg5TKPiUp
 SghSxSRvGUEUdj3lw6syBJOZ8jVrg==
X-Received: by 2002:a05:600c:5791:b0:49c:df56:d3ed with SMTP id
 5b1f17b1804b1-49cdf56d436mr549275e9.14.1788272340735; 
 Tue, 01 Sep 2026 07:19:00 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9266be71sm773824135e9.2.2026.09.01.07.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:18:59 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:18:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 16/28] hw/arm/smmuv3: Add access checks for
 GERROR_IRQ_CFG registers
Message-ID: <apbezrSgVeJy5w96@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162558.2808607-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Aug 14, 2026 at 12:25:54AM +0800, Tao Tang wrote:
> Add helpers that separate IRQ_CFG register presence from the runtime
> IRQ enable guard. The Non-secure and Secure GERROR_IRQ_CFG register sets
> both use SMMU_IDR0.MSI for presence, while writability additionally
> requires GERROR_IRQEN to be clear. IRQ_CTRL and IRQ_CTRLACK share one
> synchronous backing field in the current model.
> 
> Reads return RES0 when the register set is absent. Writes are ignored
> when it is absent or GERROR_IRQEN is set. Apply the same checks to all
> three GERROR_IRQ_CFG registers and mask reserved bits in CFG0 and CFG2.
> 
> Fixes: fae4be38b35d ("hw/arm/smmuv3: Implement MMIO write operations")
> Fixes: 10a83cb9887e ("hw/arm/smmuv3: Skeleton")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 47f0d575817..628911d3f21 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1428,6 +1428,62 @@ smmu_cmdq_stage2_supported(SMMUv3State *s, SMMUSecSID sec_sid)
>      return true;
>  }
>  
> +/* Check whether the selected IRQ_CFG register set is present. */
> +static bool smmu_irq_cfg_present(SMMUv3State *s, SMMUSecSID sec_sid,
> +                                 SMMUIrq irq)
> +{
> +    SMMUv3RegBank *bank = smmuv3_bank(s, SMMU_SEC_SID_NS);
> +
> +    switch (irq) {
> +    case SMMU_IRQ_GERROR:
> +        switch (sec_sid) {
> +        case SMMU_SEC_SID_NS:
> +        case SMMU_SEC_SID_S:
> +            return FIELD_EX32(bank->idr[0], IDR0, MSI);

I am a bit confused about this, there is no configuration where this
is true?

Thanks,
Mostafa


> +        case SMMU_SEC_SID_NUM:
> +            g_assert_not_reached();
> +        }
> +        break;
> +    case SMMU_IRQ_EVTQ:
> +    case SMMU_IRQ_PRIQ:
> +    case SMMU_IRQ_CMD_SYNC:
> +        g_assert_not_reached();
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +/* Check whether the selected IRQ_CFG register set is writable. */
> +static bool smmu_irq_cfg_writable(SMMUv3State *s, SMMUSecSID sec_sid,
> +                                  SMMUIrq irq)
> +{
> +    SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
> +    uint32_t irqen;
> +
> +    if (!smmu_irq_cfg_present(s, sec_sid, irq)) {
> +        return false;
> +    }
> +
> +    switch (irq) {
> +    case SMMU_IRQ_GERROR:
> +        irqen = FIELD_EX32(bank->irq_ctrl, IRQ_CTRL, GERROR_IRQEN);
> +        break;
> +    case SMMU_IRQ_EVTQ:
> +    case SMMU_IRQ_PRIQ:
> +    case SMMU_IRQ_CMD_SYNC:
> +        g_assert_not_reached();
> +    }
> +
> +    /* IRQ_CTRL and IRQ_CTRLACK share one synchronous backing field. */
> +    return irqen == 0;
> +}
> +
> +static bool
> +smmu_gerror_irq_cfg_writable(SMMUv3State *s, SMMUSecSID sec_sid)
> +{
> +    return smmu_irq_cfg_writable(s, sec_sid, SMMU_IRQ_GERROR);
> +}
> +
>  static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -1735,7 +1791,14 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>  
>      switch (offset) {
>      case A_GERROR_IRQ_CFG0:
> -        bank->gerror_irq_cfg0 = data;
> +        if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
> +            /* SMMU_(*_)_IRQ_CTRL.GERROR_IRQEN == 1: IGNORED this write */
> +            qemu_log_mask(LOG_GUEST_ERROR, "GERROR_IRQ_CFG0 write ignored: "
> +                         "register is RO when IRQ enabled\n");
> +            return MEMTX_OK;
> +        }
> +
> +        bank->gerror_irq_cfg0 = data & SMMU_GERROR_IRQ_CFG0_RESERVED;
>          return MEMTX_OK;
>      case A_STRTAB_BASE:
>          bank->strtab_base = data;
> @@ -1803,16 +1866,42 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          smmuv3_cmdq_consume(s, &local_err, reg_sec_sid);
>          break;
>      case A_GERROR_IRQ_CFG0: /* 64b */
> +        if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "GERROR_IRQ_CFG0 write ignored: "
> +                          "register is RO when IRQ enabled\n");
> +            return MEMTX_OK;
> +        }
> +
> +        data &= SMMU_GERROR_IRQ_CFG0_RESERVED;
>          bank->gerror_irq_cfg0 = deposit64(bank->gerror_irq_cfg0, 0, 32, data);
>          break;
>      case A_GERROR_IRQ_CFG0 + 4:
> +        if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "GERROR_IRQ_CFG0 + 4 write ignored: "
> +                          "register is RO when IRQ enabled\n");
> +            return MEMTX_OK;
> +        }
> +
> +        data &= SMMU_GERROR_IRQ_CFG0_RESERVED >> 32;
>          bank->gerror_irq_cfg0 = deposit64(bank->gerror_irq_cfg0, 32, 32, data);
>          break;
>      case A_GERROR_IRQ_CFG1:
> +        if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "GERROR_IRQ_CFG1 write ignored: "
> +                          "register is RO when IRQ enabled\n");
> +            return MEMTX_OK;
> +        }
> +
>          bank->gerror_irq_cfg1 = data;
>          break;
>      case A_GERROR_IRQ_CFG2:
> -        bank->gerror_irq_cfg2 = data;
> +        if (!smmu_gerror_irq_cfg_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "GERROR_IRQ_CFG2 write ignored: "
> +                          "register is RO when IRQ enabled\n");
> +            return MEMTX_OK;
> +        }
> +
> +        bank->gerror_irq_cfg2 = data & SMMU_GERROR_IRQ_CFG2_RESERVED;
>          break;
>      case A_GBPA:
>          /*
> @@ -1938,6 +2027,11 @@ static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
>  
>      switch (offset) {
>      case A_GERROR_IRQ_CFG0:
> +        if (!smmu_irq_cfg_present(s, reg_sec_sid, SMMU_IRQ_GERROR)) {
> +            *data = 0; /* RES0 */
> +            return MEMTX_OK;
> +        }
> +
>          *data = bank->gerror_irq_cfg0;
>          return MEMTX_OK;
>      case A_STRTAB_BASE:
> @@ -2006,15 +2100,35 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>          *data = bank->gerrorn;
>          return MEMTX_OK;
>      case A_GERROR_IRQ_CFG0: /* 64b */
> +        if (!smmu_irq_cfg_present(s, reg_sec_sid, SMMU_IRQ_GERROR)) {
> +            *data = 0; /* RES0 */
> +            return MEMTX_OK;
> +        }
> +
>          *data = extract64(bank->gerror_irq_cfg0, 0, 32);
>          return MEMTX_OK;
>      case A_GERROR_IRQ_CFG0 + 4:
> +        if (!smmu_irq_cfg_present(s, reg_sec_sid, SMMU_IRQ_GERROR)) {
> +            *data = 0; /* RES0 */
> +            return MEMTX_OK;
> +        }
> +
>          *data = extract64(bank->gerror_irq_cfg0, 32, 32);
>          return MEMTX_OK;
>      case A_GERROR_IRQ_CFG1:
> +        if (!smmu_irq_cfg_present(s, reg_sec_sid, SMMU_IRQ_GERROR)) {
> +            *data = 0; /* RES0 */
> +            return MEMTX_OK;
> +        }
> +
>          *data = bank->gerror_irq_cfg1;
>          return MEMTX_OK;
>      case A_GERROR_IRQ_CFG2:
> +        if (!smmu_irq_cfg_present(s, reg_sec_sid, SMMU_IRQ_GERROR)) {
> +            *data = 0; /* RES0 */
> +            return MEMTX_OK;
> +        }
> +
>          *data = bank->gerror_irq_cfg2;
>          return MEMTX_OK;
>      case A_STRTAB_BASE: /* 64b */
> -- 
> 2.34.1
> 

