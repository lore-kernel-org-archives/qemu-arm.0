Received: by 10.182.158.201 with SMTP id ww9csp991939obb;
        Thu, 26 Nov 2015 18:40:54 -0800 (PST)
X-Received: by 10.140.109.136 with SMTP id l8mr51613521qgf.26.1448592054117;
        Thu, 26 Nov 2015 18:40:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j64si29303209qgj.115.2015.11.26.18.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 18:40:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a28xx-0004R1-PD
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 21:40:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28xS-00046m-Cd
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 21:40:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28xR-0003DH-6P
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 21:40:22 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a28xQ-0003DD-Tw; Thu, 26 Nov 2015 21:40:21 -0500
Received: by wmuu63 with SMTP id u63so39562810wmu.0;
	Thu, 26 Nov 2015 18:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fnWTcOd+fiVoyvgs8VZdg4mT91/LTrmZck+DHUiPBk8=;
	b=OUWiVBSc9dOWPGWE+NaxRWxvp8XsitBecO2N09ddGg9mYiueNziRPObvfES9gNN0Sk
	T18x+ysvviQnySeq9cJOH6gKYfLaFn/SVbUwNCO1QUAvc13AMAq4UrxyC7E94Bu/6B2y
	5PdxD+Hp600CqOWiiyDZO1l5dyGnhPoJsBe9+/g3tRvEJ26VQGm0eSKouRPgSbY877x9
	gUHjcEHZXZ88ycV/iR4Jk7VHdvDwO9foLM7QQO1SJcX6Hqv4ob4RW2+TrbPN6DfNaEYc
	PXwnu93RKw+cfDZwfna3Cl5m0znebjPX3298G0KdsUuCzNYygsJhszUJYTNlGdu5F7np
	hf6g==
MIME-Version: 1.0
X-Received: by 10.194.62.74 with SMTP id w10mr27219452wjr.174.1448592020449;
	Thu, 26 Nov 2015 18:40:20 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 26 Nov 2015 18:40:20 -0800 (PST)
In-Reply-To: <fffc09c03a0806c4bd9a7899487abd4177df6fa3.1448521065.git.jcd@tribudubois.net>
References: <cover.1448521064.git.jcd@tribudubois.net>
	<fffc09c03a0806c4bd9a7899487abd4177df6fa3.1448521065.git.jcd@tribudubois.net>
Date: Thu, 26 Nov 2015 18:40:20 -0800
Message-ID: <CAPokK=pKoZEVMBHtrGuhadKBuvRPpsOcS8Wknun4vSorWZwhRg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::235
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4 1/3] i.MX: rename i.MX CCM get_clock()
 function and CLK ID enum names
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
X-TUID: EIOC55J2AurB

On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
> This is to prepare for CCM code refactoring.
>
> This is just a bit of function and enum values renaming.
>
> We also remove some useless intermediate variables.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

Tested-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
> Changes since v1:
>  * Not present
>
> Changes since v2:
>  * Not present
>
> Changes since v3:
>  * None
>
>  hw/misc/imx_ccm.c         |  8 ++++----
>  hw/timer/imx_epit.c       | 20 +++++++++-----------
>  hw/timer/imx_gpt.c        | 16 ++++++++--------
>  include/hw/misc/imx_ccm.h |  8 ++++----
>  4 files changed, 25 insertions(+), 27 deletions(-)
>
> diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
> index 4cc2bbc..415937f 100644
> --- a/hw/misc/imx_ccm.c
> +++ b/hw/misc/imx_ccm.c
> @@ -49,18 +49,18 @@ static const VMStateDescription vmstate_imx_ccm = {
>      .post_load = imx_ccm_post_load,
>  };
>
> -uint32_t imx_clock_frequency(DeviceState *dev, IMXClk clock)
> +uint32_t imx_ccm_get_clock_frequency(DeviceState *dev, IMXClk clock)
>  {
>      IMXCCMState *s = IMX_CCM(dev);
>
>      switch (clock) {
>      case NOCLK:
>          return 0;
> -    case MCU:
> +    case CLK_MCU:
>          return s->mcu_clk_freq;
> -    case HSP:
> +    case CLK_HSP:
>          return s->hsp_clk_freq;
> -    case IPG:
> +    case CLK_IPG:
>          return s->ipg_clk_freq;
>      case CLK_32k:
>          return CKIL_FREQ;
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 967be4a..50bf83c 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -51,9 +51,9 @@ static char const *imx_epit_reg_name(uint32_t reg)
>   * These are typical.
>   */
>  static const IMXClk imx_epit_clocks[] =  {
> -    0,        /* 00 disabled */
> -    IPG,      /* 01 ipg_clk, ~532MHz */
> -    IPG,      /* 10 ipg_clk_highfreq */
> +    NOCLK,    /* 00 disabled */
> +    CLK_IPG,  /* 01 ipg_clk, ~532MHz */
> +    CLK_IPG,  /* 10 ipg_clk_highfreq */
>      CLK_32k,  /* 11 ipg_clk_32k -- ~32kHz */
>  };
>
> @@ -73,20 +73,18 @@ static void imx_epit_set_freq(IMXEPITState *s)
>  {
>      uint32_t clksrc;
>      uint32_t prescaler;
> -    uint32_t freq;
>
>      clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, 2);
>      prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, 12);
>
> -    freq = imx_clock_frequency(s->ccm, imx_epit_clocks[clksrc]) / prescaler;
> +    s->freq = imx_ccm_get_clock_frequency(s->ccm,
> +                                imx_epit_clocks[clksrc]) / prescaler;
>
> -    s->freq = freq;
> +    DPRINTF("Setting ptimer frequency to %u\n", s->freq);
>
> -    DPRINTF("Setting ptimer frequency to %u\n", freq);
> -
> -    if (freq) {
> -        ptimer_set_freq(s->timer_reload, freq);
> -        ptimer_set_freq(s->timer_cmp, freq);
> +    if (s->freq) {
> +        ptimer_set_freq(s->timer_reload, s->freq);
> +        ptimer_set_freq(s->timer_cmp, s->freq);
>      }
>  }
>
> diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
> index 7257f42..b1893b8 100644
> --- a/hw/timer/imx_gpt.c
> +++ b/hw/timer/imx_gpt.c
> @@ -81,8 +81,8 @@ static const VMStateDescription vmstate_imx_timer_gpt = {
>
>  static const IMXClk imx_gpt_clocks[] = {
>      NOCLK,    /* 000 No clock source */
> -    IPG,      /* 001 ipg_clk, 532MHz*/
> -    IPG,      /* 010 ipg_clk_highfreq */
> +    CLK_IPG,  /* 001 ipg_clk, 532MHz*/
> +    CLK_IPG,  /* 010 ipg_clk_highfreq */
>      NOCLK,    /* 011 not defined */
>      CLK_32k,  /* 100 ipg_clk_32k */
>      NOCLK,    /* 101 not defined */
> @@ -93,14 +93,14 @@ static const IMXClk imx_gpt_clocks[] = {
>  static void imx_gpt_set_freq(IMXGPTState *s)
>  {
>      uint32_t clksrc = extract32(s->cr, GPT_CR_CLKSRC_SHIFT, 3);
> -    uint32_t freq = imx_clock_frequency(s->ccm, imx_gpt_clocks[clksrc])
> -                    / (1 + s->pr);
> -    s->freq = freq;
>
> -    DPRINTF("Setting clksrc %d to frequency %d\n", clksrc, freq);
> +    s->freq = imx_ccm_get_clock_frequency(s->ccm,
> +                                imx_gpt_clocks[clksrc]) / (1 + s->pr);
>
> -    if (freq) {
> -        ptimer_set_freq(s->timer, freq);
> +    DPRINTF("Setting clksrc %d to frequency %d\n", clksrc, s->freq);
> +
> +    if (s->freq) {
> +        ptimer_set_freq(s->timer, s->freq);
>      }
>  }
>
> diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
> index 0f2e469..09f6248 100644
> --- a/include/hw/misc/imx_ccm.h
> +++ b/include/hw/misc/imx_ccm.h
> @@ -80,12 +80,12 @@ typedef struct IMXCCMState {
>
>  typedef enum  {
>      NOCLK,
> -    MCU,
> -    HSP,
> -    IPG,
> +    CLK_MCU,
> +    CLK_HSP,
> +    CLK_IPG,
>      CLK_32k
>  } IMXClk;
>
> -uint32_t imx_clock_frequency(DeviceState *s, IMXClk clock);
> +uint32_t imx_ccm_get_clock_frequency(DeviceState *s, IMXClk clock);
>
>  #endif /* IMX_CCM_H */
> --
> 2.5.0
>
