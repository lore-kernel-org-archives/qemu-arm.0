Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp66639lfb;
        Fri, 8 May 2020 04:44:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7GzXTh3gJ1PzquEcbkChqIvTvlZl6tcvF5aCg9xVfdYwVW2zeuYKUAQxSIbXdtTwrUSRv
X-Received: by 2002:ac8:6696:: with SMTP id d22mr2533604qtp.304.1588938256932;
        Fri, 08 May 2020 04:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588938256; cv=none;
        d=google.com; s=arc-20160816;
        b=YvL+KG0XIYr5RwMwPNsuGCjjNQvVb+4r04uvjbd/HZrvyYo8ckLobyKNYxVogkYe1j
         bj6ipjAKpUHgL73VRBvon0LKCuM4N4oLa2fLbdQvIsSDpGbgSTif3qbBjYlSKYcDNSE4
         RmcSjBI8AnvJ1L7cPn0ttCdGs+OrZjsEuAhaMhy8CxX1WrGLh+9aYhQ0YvGZC1amsDeQ
         9IBWC8J5xhwNuyAefeOB2wijs3TeBZUhGHnOpICc47DAed7oTnqJkqf7uhAu4/Cad2zC
         /D3HLwh1/tnLNf+Z+qK0aljgFEx7LKwKJxYW/2sZb2CN8tct105Yd3xojSdr0XNxb9RH
         M9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Yu8qZZaubaY7D2bQY/ue8Ys5ZBseoparpx54JaaxvcQ=;
        b=XqFMKfQcMSk/UJ7Nz2e8QtAOtW1ilF8bKxzGTuUHiavx1rKllb/QyoqnmKdTZ71fNg
         Wb18zpYXyFHUPJMQYUx/8PiG5vCYD5oRlfWShb4pRcH9iNumYWfmO9tWCjwQOLT5pjjw
         LdhX67HJgwilHjMaqwnO+QHSC7gkOKXx8rF4BVDxkDUtbz+jumzUZro3xh3HtGuDAuCD
         6Q05b+ybeK+gg6NtgiqKwQdeijYmscf4HOrkS0Qw7WJSuiSCDIlsxBXbIznoChYwmNVj
         RB2/A2YWZrPKzZrdmOiEhf6B5ArJq6/adHDc3wbJf5i5CcSpqX5sY4uA11XRpPHP/S+s
         GapA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5raGZJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b11si1093984qvp.122.2020.05.08.04.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 04:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5raGZJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX1QO-0002uw-Bn
	for alex.bennee@linaro.org; Fri, 08 May 2020 07:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jX1QF-0002sl-Ln; Fri, 08 May 2020 07:44:07 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jX1QE-0005bu-Jv; Fri, 08 May 2020 07:44:07 -0400
Received: by mail-lj1-x241.google.com with SMTP id a21so1310944ljj.11;
 Fri, 08 May 2020 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yu8qZZaubaY7D2bQY/ue8Ys5ZBseoparpx54JaaxvcQ=;
 b=t5raGZJELkmV6gnaRc6FvRTOQG9jnSEheYumkYOIeAMCDfLpwXUJuMgFCu+68BqRRN
 ytJ9mo2EExLeTlJjf+ykh15mLyNzn9wxSzZNy8ZrFLK6hbEoaqGaCJWeGGDh39tsSWAx
 xunjsAjiybLm5+8QHvuf/MtCFlh26HtqDWI/hQdhgT0RYorcl7MEAxLbSbzJbrhcVQJg
 /sJ48JoCzcjqFBh6GQCrlzsJZ+tpAODkj2jJRz+u0/Ix5wC7PRvH2R+5Bk+BtS7YXuNR
 zPOuZGC2dZejXFMgEOlyI9rEapisGqeK7nm9mV+QdYbsSA1tYAqhDLI9KpKnOquDBF9U
 oJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yu8qZZaubaY7D2bQY/ue8Ys5ZBseoparpx54JaaxvcQ=;
 b=ozShttUolMXvwy9C3/OCSQGu8IFcZNEJSq+hmEr2I+yuuBnMgKiuC7txSftrpNZdzh
 C/0K9Wi3/gNI6SgnUhp2sQGQ4uBVxFU67PxA8k0m0EgE647SyaPy7Ew6vdLJQU/koFlR
 jTyICfML+RGlTMG7gP7msVbCUKp0myrA7QM4dGwSG1MJwPNbgPZx0iGbEqFJoBV5XzXe
 Rbbna6ztbJwC7EtZlTSMjpvPF+zlnnt84W6zKaPW/y0WiT3jR+WBEkeaSTLwqLbaALOv
 yc+4o8GSRmPtmhGq4iqh/6XPzmtGZoXKgkN6BX6cXokFyc/wX7CRo7hDbLil4YC+ZjiX
 qFXA==
X-Gm-Message-State: AOAM530sQ4eNV+YSUEyaO7F4qohJcmuMuNDEoYXr5XdmV3oSoKG/C+GW
 4HNglYzm1nmev64W+stHj2I=
X-Received: by 2002:a05:651c:54f:: with SMTP id
 q15mr1482286ljp.145.1588938244496; 
 Fri, 08 May 2020 04:44:04 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u4sm1134907lfu.81.2020.05.08.04.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 04:44:03 -0700 (PDT)
Date: Fri, 8 May 2020 13:43:47 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v3 07/11] net: cadence_gem: Add support for jumbo frames
Message-ID: <20200508114347.GO5519@toto>
References: <1588935645-20351-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588935645-20351-8-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588935645-20351-8-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::241;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x241.google.com
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
X-TUID: Dq3TQkLjZ1mk

On Fri, May 08, 2020 at 04:30:41PM +0530, Sai Pavan Boddu wrote:
> Add a property "jumbo-max-len", which can be configured for jumbo frame size
> up to 16,383 bytes, and also introduce new register GEM_JUMBO_MAX_LEN.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/net/cadence_gem.c         | 21 +++++++++++++++++++--
>  include/hw/net/cadence_gem.h |  1 +
>  2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 5ccec1a..45c50ab 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -61,6 +61,7 @@
>  #define GEM_TXPAUSE       (0x0000003C/4) /* TX Pause Time reg */
>  #define GEM_TXPARTIALSF   (0x00000040/4) /* TX Partial Store and Forward */
>  #define GEM_RXPARTIALSF   (0x00000044/4) /* RX Partial Store and Forward */
> +#define GEM_JUMBO_MAX_LEN (0x00000048 / 4) /* Max Jumbo Frame Size */

Would be nice to align this in the same way as all the others...



>  #define GEM_HASHLO        (0x00000080/4) /* Hash Low address reg */
>  #define GEM_HASHHI        (0x00000084/4) /* Hash High address reg */
>  #define GEM_SPADDR1LO     (0x00000088/4) /* Specific addr 1 low reg */
> @@ -314,7 +315,8 @@
>  
>  #define GEM_MODID_VALUE 0x00020118
>  
> -#define MAX_FRAME_SIZE 2048
> +#define MAX_JUMBO_FRAME_SIZE_MASK 0x3FFF
> +#define MAX_FRAME_SIZE MAX_JUMBO_FRAME_SIZE_MASK
>  
>  static inline uint64_t tx_desc_get_buffer(CadenceGEMState *s, uint32_t *desc)
>  {
> @@ -1343,9 +1345,10 @@ static void gem_reset(DeviceState *d)
>      s->regs[GEM_RXPARTIALSF] = 0x000003ff;
>      s->regs[GEM_MODID] = s->revision;
>      s->regs[GEM_DESCONF] = 0x02500111;
> -    s->regs[GEM_DESCONF2] = 0x2ab13fff;
> +    s->regs[GEM_DESCONF2] = 0x2ab10000 | s->jumbo_max_len;
>      s->regs[GEM_DESCONF5] = 0x002f2045;
>      s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
> +    s->regs[GEM_JUMBO_MAX_LEN] = s->jumbo_max_len;
>  
>      if (s->num_priority_queues > 1) {
>          queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
> @@ -1420,6 +1423,9 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>          DB_PRINT("lowering irqs on ISR read\n");
>          /* The interrupts get updated at the end of the function. */
>          break;
> +    case GEM_JUMBO_MAX_LEN:
> +        retval = s->jumbo_max_len;
> +        break;
>      case GEM_PHYMNTNC:
>          if (retval & GEM_PHYMNTNC_OP_R) {
>              uint32_t phy_addr, reg_num;
> @@ -1516,6 +1522,9 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>          s->regs[GEM_IMR] &= ~val;
>          gem_update_int_status(s);
>          break;
> +    case GEM_JUMBO_MAX_LEN:
> +        s->jumbo_max_len = val & MAX_JUMBO_FRAME_SIZE_MASK;

I don't think writing to this register may increase the max len
beyond the max-len selected at design time (the property).
TBH I'm surprised this register is RW in the spec.

We may need two variables here, one for the design-time configured
max and another for the runtime configurable max.


> +        break;
>      case GEM_INT_Q1_ENABLE ... GEM_INT_Q7_ENABLE:
>          s->regs[GEM_INT_Q1_MASK + offset - GEM_INT_Q1_ENABLE] &= ~val;
>          gem_update_int_status(s);
> @@ -1611,6 +1620,12 @@ static void gem_realize(DeviceState *dev, Error **errp)
>      s->nic = qemu_new_nic(&net_gem_info, &s->conf,
>                            object_get_typename(OBJECT(dev)), dev->id, s);
>  
> +    if (s->jumbo_max_len > MAX_FRAME_SIZE) {
> +        g_warning("jumbo-max-len is grater than %d",


You've got a typo here "grater".

I also think we could error out here if wrong values are chosen.

Best regards,
Edgar
