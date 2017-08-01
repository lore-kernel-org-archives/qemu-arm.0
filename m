Received: by 10.25.44.15 with SMTP id s15csp4551037lfs;
        Tue, 1 Aug 2017 00:21:37 -0700 (PDT)
X-Received: by 10.237.33.204 with SMTP id m12mr26017034qtc.249.1501572097879;
        Tue, 01 Aug 2017 00:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501572097; cv=none;
        d=google.com; s=arc-20160816;
        b=TIiHw/w7WcN3Rku1lKf32lFOzuKes3RORBH4q9g3ZIuQM9ogUd9aIH0mZZ9aiKo1e8
         XL7llPUxqizZPYKaFYeHHCAfRbZpD72+mPeptHQz0e5HY1kpfh5y7rr5oLcCiFkrE4EI
         t/a+kOFRoDnemNt7QRwXsPwj+ebx2BHA/7evNE1ap/j97gTP7IfNUgPuUPW48/yr974j
         B9yrLLCg6rCMLFRt+HJZuG7IYn95Bcb+8T8M1alrB2F/+Ox5r9aGNvzrhE1oFu1Ic2Ol
         Zc/pDIXhSV2wkY3aQQG/7o5G3bj9f+z2fuKSxEgigDB9d7z/4eHM9U3ACgeAGOdBynPl
         UKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=++QJroHR9U9xojUIrZlwgORgyc1Rv7IiY4pTya3Rvuo=;
        b=LtY572RvJGdIuwQVx3DMuX+k4qmNKtRuKhlk+mrHCE3Sce4TK2lnPzqaPwQ6AGFTYo
         JCpr1yEYKGWdUI7VRVmuNrR654ySQ8ElfVzbKPRg4mu3U43UMOHIJD2R3iCHjUGUqkLK
         WIVtoQaesdWH9VQaaseUKABtjWlkCC/8Y48+AhSvfSiN9k/YwzlOt2jVHUdDTK9h1TOY
         d5ku5jdU/j+hQobVXtwdHow1RLmB+hqmCXOhPrf0vA8VcxRS8+7UXep1NKLVOwuHeU+u
         Ta8COblvEBJzEmsTH1B7njfj7l9bDhfcF8tSxyJOLKpGrK471JKwpa4kc4fNCUu6N36t
         04mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w202si19149424qkb.196.2017.08.01.00.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 00:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcRUl-0003YV-BY
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 03:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dcRUe-0003Y5-2L
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 03:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dcRUa-0000QK-QJ
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 03:21:28 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:38786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dcRUa-0000Mz-Fr
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 03:21:24 -0400
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id CD2674AFDA
	for <qemu-arm@nongnu.org>; Tue,  1 Aug 2017 09:21:14 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
	by player715.ha.ovh.net (Postfix) with ESMTPSA id 5FC581C008F;
	Tue,  1 Aug 2017 09:21:07 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20170801010425.25778-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <855a154a-4cdf-b29a-6440-5deadbeed12e@kaod.org>
Date: Tue, 1 Aug 2017 09:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170801010425.25778-1-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3164341688418077442
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrieekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.76.150
Subject: Re: [Qemu-arm] [PATCH] watchdog: wdt_aspeed: Add support for the
 reset width register
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
	joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ac6kvAQu0jzC

On 08/01/2017 03:04 AM, Andrew Jeffery wrote:
> The reset width register controls how the pulse on the SoC's WDTRST{1,2}
> pins behaves. A pulse is emitted if the external reset bit is set in
> WDT_CTRL. WDT_RESET_WIDTH requires magic bit patterns to configure both
> push-pull/open-drain and active-high/active-low behaviours and thus
> needs some special handling in the write path.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> I understand that we're in stabilisation mode, but I thought I'd send this out
> to provoke any feedback. Happy to resend after the 2.10 release if required.
> 
>  hw/watchdog/wdt_aspeed.c | 47 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 8bbe579b6b66..4ef1412e99fc 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -14,10 +14,10 @@
>  #include "qemu/timer.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  
> -#define WDT_STATUS              (0x00 / 4)
> -#define WDT_RELOAD_VALUE        (0x04 / 4)
> -#define WDT_RESTART             (0x08 / 4)
> -#define WDT_CTRL                (0x0C / 4)
> +#define WDT_STATUS                      (0x00 / 4)
> +#define WDT_RELOAD_VALUE                (0x04 / 4)
> +#define WDT_RESTART                     (0x08 / 4)
> +#define WDT_CTRL                        (0x0C / 4)
>  #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
>  #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
>  #define   WDT_CTRL_1MHZ_CLK             BIT(4)
> @@ -25,12 +25,21 @@
>  #define   WDT_CTRL_WDT_INTR             BIT(2)
>  #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
>  #define   WDT_CTRL_ENABLE               BIT(0)
> +#define WDT_RESET_WIDTH                 (0x18 / 4)
> +#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
> +#define     WDT_POLARITY_MASK           (0xFF << 24)
> +#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
> +#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
> +#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
> +#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
> +#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
> +#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
> +#define   WDT_RESET_WIDTH_DURATION      0xFFF;

I would call this define WDT_RESET_WIDTH_DEFAULT (0xFF) and 
use it also in the aspeed_wdt_reset()

I have checked the specs and the bits definitions are correct.
What else could we model ? Would the pulse be interesting ? 

C.


>  
> -#define WDT_TIMEOUT_STATUS      (0x10 / 4)
> -#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
> -#define WDT_RESET_WDITH         (0x18 / 4)
> +#define WDT_TIMEOUT_STATUS              (0x10 / 4)
> +#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
>  
> -#define WDT_RESTART_MAGIC       0x4755
> +#define WDT_RESTART_MAGIC               0x4755
>  
>  static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
>  {
> @@ -55,9 +64,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      case WDT_CTRL:
>          return s->regs[WDT_CTRL];
> +    case WDT_RESET_WIDTH:
> +        return s->regs[WDT_RESET_WIDTH];
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> @@ -119,9 +129,25 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>              timer_del(s->timer);
>          }
>          break;
> +    case WDT_RESET_WIDTH:
> +    {
> +        uint32_t property = data & WDT_POLARITY_MASK;
> +
> +        if (property == WDT_ACTIVE_HIGH_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
> +        } else if (property == WDT_ACTIVE_LOW_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
> +        } else if (property == WDT_PUSH_PULL_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
> +        } else if (property == WDT_OPEN_DRAIN_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
> +        }
> +        s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_DURATION;
> +        s->regs[WDT_RESET_WIDTH] |= data & WDT_RESET_WIDTH_DURATION;
> +        break;
> +    }
>      case WDT_TIMEOUT_STATUS:
>      case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                        __func__, offset);
> @@ -167,6 +193,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
>      s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
>      s->regs[WDT_RESTART] = 0;
>      s->regs[WDT_CTRL] = 0;
> +    s->regs[WDT_RESET_WIDTH] = 0XFF;
>  
>      timer_del(s->timer);
>  }
> 

