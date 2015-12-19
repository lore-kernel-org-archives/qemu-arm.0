Received: by 10.182.158.201 with SMTP id ww9csp1899726obb;
        Sat, 19 Dec 2015 13:30:42 -0800 (PST)
X-Received: by 10.140.93.77 with SMTP id c71mr15257653qge.46.1450560642244;
        Sat, 19 Dec 2015 13:30:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 185si22789783qht.76.2015.12.19.13.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAP5N-0004yL-VH
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:30:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAP2p-0001MM-BL
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:28:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAP2m-00077G-05
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 16:28:03 -0500
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:34694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAP2l-00077B-Ob; Sat, 19 Dec 2015 16:27:59 -0500
Received: by mail-pa0-x22d.google.com with SMTP id wq6so78444592pac.1;
	Sat, 19 Dec 2015 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UZY+QFDAEJ8xS9rhykB/68hJBhpLoTWtlF8B0jPrQK8=;
	b=r2FFM1yUxD6J4RO9T/iABTJBbqzzyUVoLtyezwE7tdhOG3T557u/sDZg4iDKJeJ7db
	rz+sZEEO7bH/ZJLQqMIcombcRSHGS2WMAJvQG5ATJPYS9uUHuPiZNL0TqiWqceutjjqm
	9Y1eCnU+owWs3NSy4ySHYRHfgcQ7PA9Ey65q7L7WMu2uu4f/Sn1n9y83gyBM10nkDYO1
	H0fZSG5pD9K4sO3DNBRWIDfEpLzfJnfxVQcvxKZa45RRpcEEr7Mz19GHDdh+5b9w6eE6
	F907A392QwTqkM4cHJH1PbAIWPF843jrVrD25qZPEaZLtGP8PAhUGyBhMb2VKRlgfkg6
	E2yQ==
X-Received: by 10.66.185.225 with SMTP id ff1mr5473624pac.97.1450560478976;
	Sat, 19 Dec 2015 13:27:58 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	by2sm30089468pab.20.2015.12.19.13.27.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:27:57 -0800 (PST)
From: pcrost <crosthwaitepeter@gmail.com>
X-Google-Original-From: pcrost <pcrost@pcrost-box>
Date: Sat, 19 Dec 2015 13:27:51 -0800
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Message-ID: <20151219212751.GA4135@pcrost-box>
References: <cover.1449528242.git.jcd@tribudubois.net>
	<a38b80a60545b98302dccb09d8be01a9ae2aa828.1449528242.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a38b80a60545b98302dccb09d8be01a9ae2aa828.1449528242.git.jcd@tribudubois.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	crosthwaite.peter@gmail.com
Subject: Re: [Qemu-devel] [PATCH v6 5/5] i.MX: move i.MX31 CCM object to
	register array.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DvAM8VZVJq0L

On Mon, Dec 07, 2015 at 11:53:42PM +0100, Jean-Christophe Dubois wrote:
> With this i.MX25 and i.MX31 to have close implementation.
> 

"will have closer implementations".

Otherwise,

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Peter, do you want to just amend the grammar in the queue?

Regards,
Peter

> Moreover all i.MX31 CCM registers are now present
> 
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
> 
> Changes since v1:
>  * Not present
> 
> Changes since v2:
>  * Not present
> 
> Changes since v3:
>  * Not present
> 
> Changes since v4:
>  * Not present
> 
> Changes since v5:
>  * Not present
> 
>  hw/misc/imx31_ccm.c         | 188 ++++++++++++++++++++------------------------
>  include/hw/misc/imx31_ccm.h |  38 +++++++--
>  2 files changed, 115 insertions(+), 111 deletions(-)
> 
> diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
> index b92d2e0..47d6ead 100644
> --- a/hw/misc/imx31_ccm.c
> +++ b/hw/misc/imx31_ccm.c
> @@ -29,77 +29,73 @@
>  
>  static char const *imx31_ccm_reg_name(uint32_t reg)
>  {
> +    static char unknown[20];
> +
>      switch (reg) {
> -    case 0:
> +    case IMX31_CCM_CCMR_REG:
>          return "CCMR";
> -    case 1:
> +    case IMX31_CCM_PDR0_REG:
>          return "PDR0";
> -    case 2:
> +    case IMX31_CCM_PDR1_REG:
>          return "PDR1";
> -    case 3:
> +    case IMX31_CCM_RCSR_REG:
>          return "RCSR";
> -    case 4:
> +    case IMX31_CCM_MPCTL_REG:
>          return "MPCTL";
> -    case 5:
> +    case IMX31_CCM_UPCTL_REG:
>          return "UPCTL";
> -    case 6:
> +    case IMX31_CCM_SPCTL_REG:
>          return "SPCTL";
> -    case 7:
> +    case IMX31_CCM_COSR_REG:
>          return "COSR";
> -    case 8:
> +    case IMX31_CCM_CGR0_REG:
>          return "CGR0";
> -    case 9:
> +    case IMX31_CCM_CGR1_REG:
>          return "CGR1";
> -    case 10:
> +    case IMX31_CCM_CGR2_REG:
>          return "CGR2";
> -    case 11:
> +    case IMX31_CCM_WIMR_REG:
>          return "WIMR";
> -    case 12:
> +    case IMX31_CCM_LDC_REG:
>          return "LDC";
> -    case 13:
> +    case IMX31_CCM_DCVR0_REG:
>          return "DCVR0";
> -    case 14:
> +    case IMX31_CCM_DCVR1_REG:
>          return "DCVR1";
> -    case 15:
> +    case IMX31_CCM_DCVR2_REG:
>          return "DCVR2";
> -    case 16:
> +    case IMX31_CCM_DCVR3_REG:
>          return "DCVR3";
> -    case 17:
> +    case IMX31_CCM_LTR0_REG:
>          return "LTR0";
> -    case 18:
> +    case IMX31_CCM_LTR1_REG:
>          return "LTR1";
> -    case 19:
> +    case IMX31_CCM_LTR2_REG:
>          return "LTR2";
> -    case 20:
> +    case IMX31_CCM_LTR3_REG:
>          return "LTR3";
> -    case 21:
> +    case IMX31_CCM_LTBR0_REG:
>          return "LTBR0";
> -    case 22:
> +    case IMX31_CCM_LTBR1_REG:
>          return "LTBR1";
> -    case 23:
> +    case IMX31_CCM_PMCR0_REG:
>          return "PMCR0";
> -    case 24:
> +    case IMX31_CCM_PMCR1_REG:
>          return "PMCR1";
> -    case 25:
> +    case IMX31_CCM_PDR2_REG:
>          return "PDR2";
>      default:
> -        return "???";
> +        sprintf(unknown, "[%d ?]", reg);
> +        return unknown;
>      }
>  }
>  
>  static const VMStateDescription vmstate_imx31_ccm = {
>      .name = TYPE_IMX31_CCM,
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(ccmr, IMX31CCMState),
> -        VMSTATE_UINT32(pdr0, IMX31CCMState),
> -        VMSTATE_UINT32(pdr1, IMX31CCMState),
> -        VMSTATE_UINT32(mpctl, IMX31CCMState),
> -        VMSTATE_UINT32(spctl, IMX31CCMState),
> -        VMSTATE_UINT32_ARRAY(cgr, IMX31CCMState, 3),
> -        VMSTATE_UINT32(pmcr0, IMX31CCMState),
> -        VMSTATE_UINT32(pmcr1, IMX31CCMState),
> +        VMSTATE_UINT32_ARRAY(reg, IMX31CCMState, IMX31_CCM_MAX_REG),
>          VMSTATE_END_OF_LIST()
>      },
>  };
> @@ -109,10 +105,10 @@ static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
>      uint32_t freq = 0;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    if ((s->ccmr & CCMR_PRCS) == 2) {
> -        if (s->ccmr & CCMR_FPME) {
> +    if ((s->reg[IMX31_CCM_CCMR_REG] & CCMR_PRCS) == 2) {
> +        if (s->reg[IMX31_CCM_CCMR_REG] & CCMR_FPME) {
>              freq = CKIL_FREQ;
> -            if (s->ccmr & CCMR_FPMF) {
> +            if (s->reg[IMX31_CCM_CCMR_REG] & CCMR_FPMF) {
>                  freq *= 1024;
>              }
>          } 
> @@ -130,7 +126,8 @@ static uint32_t imx31_ccm_get_mpll_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    freq = imx_ccm_calc_pll(s->mpctl, imx31_ccm_get_pll_ref_clk(dev));
> +    freq = imx_ccm_calc_pll(s->reg[IMX31_CCM_MPCTL_REG],
> +                            imx31_ccm_get_pll_ref_clk(dev));
>  
>      DPRINTF("freq = %d\n", freq);
>  
> @@ -142,7 +139,8 @@ static uint32_t imx31_ccm_get_mcu_main_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    if ((s->ccmr & CCMR_MDS) || !(s->ccmr & CCMR_MPE)) {
> +    if ((s->reg[IMX31_CCM_CCMR_REG] & CCMR_MDS) ||
> +        !(s->reg[IMX31_CCM_CCMR_REG] & CCMR_MPE)) {
>          freq = imx31_ccm_get_pll_ref_clk(dev);
>      } else {
>          freq = imx31_ccm_get_mpll_clk(dev);
> @@ -158,7 +156,8 @@ static uint32_t imx31_ccm_get_mcu_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, MCU));
> +    freq = imx31_ccm_get_mcu_main_clk(dev)
> +           / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], MCU));
>  
>      DPRINTF("freq = %d\n", freq);
>  
> @@ -170,7 +169,8 @@ static uint32_t imx31_ccm_get_hsp_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, HSP));
> +    freq = imx31_ccm_get_mcu_main_clk(dev)
> +           / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], HSP));
>  
>      DPRINTF("freq = %d\n", freq);
>  
> @@ -182,7 +182,8 @@ static uint32_t imx31_ccm_get_hclk_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, MAX));
> +    freq = imx31_ccm_get_mcu_main_clk(dev)
> +           / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], MAX));
>  
>      DPRINTF("freq = %d\n", freq);
>  
> @@ -194,7 +195,8 @@ static uint32_t imx31_ccm_get_ipg_clk(IMXCCMState *dev)
>      uint32_t freq;
>      IMX31CCMState *s = IMX31_CCM(dev);
>  
> -    freq = imx31_ccm_get_hclk_clk(dev) / (1 + EXTRACT(s->pdr0, IPG));
> +    freq = imx31_ccm_get_hclk_clk(dev)
> +           / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], IPG));
>  
>      DPRINTF("freq = %d\n", freq);
>  
> @@ -237,14 +239,24 @@ static void imx31_ccm_reset(DeviceState *dev)
>  
>      DPRINTF("()\n");
>  
> -    s->ccmr   = 0x074b0b7d;
> -    s->pdr0   = 0xff870b48;
> -    s->pdr1   = 0x49fcfe7f;
> -    s->mpctl  = 0x04001800;
> -    s->cgr[0] = s->cgr[1] = s->cgr[2] = 0xffffffff;
> -    s->spctl  = 0x04043001;
> -    s->pmcr0  = 0x80209828;
> -    s->pmcr1  = 0x00aa0000;
> +    memset(s->reg, 0, sizeof(uint32_t) * IMX31_CCM_MAX_REG);
> +
> +    s->reg[IMX31_CCM_CCMR_REG]   = 0x074b0b7d;
> +    s->reg[IMX31_CCM_PDR0_REG]   = 0xff870b48;
> +    s->reg[IMX31_CCM_PDR1_REG]   = 0x49fcfe7f;
> +    s->reg[IMX31_CCM_RCSR_REG]   = 0x007f0000;
> +    s->reg[IMX31_CCM_MPCTL_REG]  = 0x04001800;
> +    s->reg[IMX31_CCM_UPCTL_REG]  = 0x04051c03;
> +    s->reg[IMX31_CCM_SPCTL_REG]  = 0x04043001;
> +    s->reg[IMX31_CCM_COSR_REG]   = 0x00000280;
> +    s->reg[IMX31_CCM_CGR0_REG]   = 0xffffffff;
> +    s->reg[IMX31_CCM_CGR1_REG]   = 0xffffffff;
> +    s->reg[IMX31_CCM_CGR2_REG]   = 0xffffffff;
> +    s->reg[IMX31_CCM_WIMR_REG]   = 0xffffffff;
> +    s->reg[IMX31_CCM_LTR1_REG]   = 0x00004040;
> +    s->reg[IMX31_CCM_PMCR0_REG]  = 0x80209828;
> +    s->reg[IMX31_CCM_PMCR1_REG]  = 0x00aa0000;
> +    s->reg[IMX31_CCM_PDR2_REG]   = 0x00000285;
>  }
>  
>  static uint64_t imx31_ccm_read(void *opaque, hwaddr offset, unsigned size)
> @@ -252,41 +264,11 @@ static uint64_t imx31_ccm_read(void *opaque, hwaddr offset, unsigned size)
>      uint32 value = 0;
>      IMX31CCMState *s = (IMX31CCMState *)opaque;
>  
> -    switch (offset >> 2) {
> -    case 0: /* CCMR */
> -        value = s->ccmr;
> -        break;
> -    case 1:
> -        value = s->pdr0;
> -        break;
> -    case 2:
> -        value = s->pdr1;
> -        break;
> -    case 4:
> -        value = s->mpctl;
> -        break;
> -    case 6:
> -        value = s->spctl;
> -        break;
> -    case 8:
> -        value = s->cgr[0];
> -        break;
> -    case 9:
> -        value = s->cgr[1];
> -        break;
> -    case 10:
> -        value = s->cgr[2];
> -        break;
> -    case 18: /* LTR1 */
> -        value = 0x00004040;
> -        break;
> -    case 23:
> -        value = s->pmcr0;
> -        break;
> -    default:
> +    if ((offset >> 2) < IMX31_CCM_MAX_REG) {
> +        value = s->reg[offset >> 2];
> +    } else {
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
>                        HWADDR_PRIx "\n", TYPE_IMX31_CCM, __func__, offset);
> -        break;
>      }
>  
>      DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx31_ccm_reg_name(offset >> 2),
> @@ -304,29 +286,29 @@ static void imx31_ccm_write(void *opaque, hwaddr offset, uint64_t value,
>              (uint32_t)value);
>  
>      switch (offset >> 2) {
> -    case 0:
> -        s->ccmr = CCMR_FPMF | (value & 0x3b6fdfff);
> +    case IMX31_CCM_CCMR_REG:
> +        s->reg[IMX31_CCM_CCMR_REG] = CCMR_FPMF | (value & 0x3b6fdfff);
>          break;
> -    case 1:
> -        s->pdr0 = value & 0xff9f3fff;
> +    case IMX31_CCM_PDR0_REG:
> +        s->reg[IMX31_CCM_PDR0_REG] = value & 0xff9f3fff;
>          break;
> -    case 2:
> -        s->pdr1 = value;
> +    case IMX31_CCM_PDR1_REG:
> +        s->reg[IMX31_CCM_PDR1_REG] = value;
>          break;
> -    case 4:
> -        s->mpctl = value & 0xbfff3fff;
> +    case IMX31_CCM_MPCTL_REG:
> +        s->reg[IMX31_CCM_MPCTL_REG] = value & 0xbfff3fff;
>          break;
> -    case 6:
> -        s->spctl = value & 0xbfff3fff;
> +    case IMX31_CCM_SPCTL_REG:
> +        s->reg[IMX31_CCM_SPCTL_REG] = value & 0xbfff3fff;
>          break;
> -    case 8:
> -        s->cgr[0] = value;
> +    case IMX31_CCM_CGR0_REG:
> +        s->reg[IMX31_CCM_CGR0_REG] = value;
>          break;
> -    case 9:
> -        s->cgr[1] = value;
> +    case IMX31_CCM_CGR1_REG:
> +        s->reg[IMX31_CCM_CGR1_REG] = value;
>          break;
> -    case 10:
> -        s->cgr[2] = value;
> +    case IMX31_CCM_CGR2_REG:
> +        s->reg[IMX31_CCM_CGR2_REG] = value;
>          break;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
> diff --git a/include/hw/misc/imx31_ccm.h b/include/hw/misc/imx31_ccm.h
> index fcae36d..c376fad 100644
> --- a/include/hw/misc/imx31_ccm.h
> +++ b/include/hw/misc/imx31_ccm.h
> @@ -13,6 +13,34 @@
>  
>  #include "hw/misc/imx_ccm.h"
>  
> +#define IMX31_CCM_CCMR_REG  0
> +#define IMX31_CCM_PDR0_REG  1
> +#define IMX31_CCM_PDR1_REG  2
> +#define IMX31_CCM_RCSR_REG  3
> +#define IMX31_CCM_MPCTL_REG 4
> +#define IMX31_CCM_UPCTL_REG 5
> +#define IMX31_CCM_SPCTL_REG 6
> +#define IMX31_CCM_COSR_REG  7
> +#define IMX31_CCM_CGR0_REG  8
> +#define IMX31_CCM_CGR1_REG  9
> +#define IMX31_CCM_CGR2_REG  10
> +#define IMX31_CCM_WIMR_REG  11
> +#define IMX31_CCM_LDC_REG   12
> +#define IMX31_CCM_DCVR0_REG 13
> +#define IMX31_CCM_DCVR1_REG 14
> +#define IMX31_CCM_DCVR2_REG 15
> +#define IMX31_CCM_DCVR3_REG 16
> +#define IMX31_CCM_LTR0_REG  17
> +#define IMX31_CCM_LTR1_REG  18
> +#define IMX31_CCM_LTR2_REG  19
> +#define IMX31_CCM_LTR3_REG  20
> +#define IMX31_CCM_LTBR0_REG 21
> +#define IMX31_CCM_LTBR1_REG 22
> +#define IMX31_CCM_PMCR0_REG 23
> +#define IMX31_CCM_PMCR1_REG 24
> +#define IMX31_CCM_PDR2_REG  25
> +#define IMX31_CCM_MAX_REG   26
> +
>  /* CCMR */
>  #define CCMR_FPME    (1<<0)
>  #define CCMR_MPE     (1<<3)
> @@ -53,14 +81,8 @@ typedef struct IMX31CCMState {
>      /* <public> */
>      MemoryRegion iomem;
>  
> -    uint32_t ccmr;
> -    uint32_t pdr0;
> -    uint32_t pdr1;
> -    uint32_t mpctl;
> -    uint32_t spctl;
> -    uint32_t cgr[3];
> -    uint32_t pmcr0;
> -    uint32_t pmcr1;
> +    uint32_t reg[IMX31_CCM_MAX_REG];
> +
>  } IMX31CCMState;
>  
>  #endif /* IMX31_CCM_H */
> -- 
> 2.5.0
> 
