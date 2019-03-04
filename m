Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3692573wrx;
        Mon, 4 Mar 2019 06:55:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJHj4V25OK9tjrhpwIrui/D8gryFZxlSUoVE3ONt8o3Xf/rCC8cKJHpwENdlugPr9IFXtM
X-Received: by 2002:a81:3742:: with SMTP id e63mr14544034ywa.416.1551711312411;
        Mon, 04 Mar 2019 06:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551711312; cv=none;
        d=google.com; s=arc-20160816;
        b=vY4JbR+mYge9VoCcFCYq0gHex/asOC+2sTFqkiwyntT88fJTyqBS/P8rPiavIv/7hh
         9yRC79j9AEYgTQxGTVrtv3fcAHpwszRywAzOqD8JouGZR0wrtIsFtL6cknnTSLh+kz2Q
         cNYI6RYaMSTvp5VTf+JKn18ryvvAibreyPHfO7pUq/aenaDg0fPgb3i+NAgqnRN0Bz43
         tceLVOuyVxOVAnRzDVGYL7dgHrdjqm/fQg4djzyHI7/Nx64EVtB25z82fQpxGpyiMIfB
         BtrI/JMwnSjqNsqb+7lbKzdUDaqn5bi2NDoHx9vGg0gjhG1LOiApB54CMk5EIXtkf9b1
         Onog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zkKEQPGBuWWpdBGjD8adi7tocrBrwwEJSJ2lLz6SaWk=;
        b=KrTOqfaMEHe2kqnNwGEWqMtcm/+/6mZCYRz7IXTy7u+05rEmIw2O2V6gWDC3EcYyx3
         YHjnbUqzLzTo05IWSIDuCdLKOas6xKtF70RjtnzUAykReJtmq+WvR9dfrv8dU6ERv84Q
         kEPncY5yWNJQYuwSITrN50rC71v+k1dOKiYLpQfn8K1G6cShPaBdJorl/m+ZmphPQCEU
         EWgj91Ci1T6sMcyE32dOJb/XjWYSnslzW0QK83x+ww2jzYEf+gLmNEyNIJogb2Pjn/D3
         u4f3NCb/GAhfpwDeOGdYLfrjzT7FDhVSsP8p5uRr9dak64z3SK+SKbK+u6lHzdu10B6e
         aXxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tcBY20CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si3336394ywr.321.2019.03.04.06.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tcBY20CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0ozn-0004Ws-TU
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:55:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0oza-0004VU-LY
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h0ozY-0008Qa-7A
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:54:58 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:38816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h0ozW-0008D4-96
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:54:54 -0500
Received: by mail-ot1-x32d.google.com with SMTP id m1so4419260otf.5
	for <qemu-arm@nongnu.org>; Mon, 04 Mar 2019 06:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zkKEQPGBuWWpdBGjD8adi7tocrBrwwEJSJ2lLz6SaWk=;
	b=tcBY20CVtajseZOJk7gg3OaPTkL2X9+CW53E+OqtRvB5ncHZKeVwWE6xcCAsk4cmTT
	S6mvBCqBafETGoqONnLYmIU8OZVexi4GuTmqu4S8uqnITXC2US2K8Oytx4YuvN9sHZIc
	JRV7MoEEqiTsq27cJKIOTXDPXlJWISxL+WoVqO6olvkuxE3Zc/1hYECmwvquTS6EbYnn
	zMuwTucVgzuRvAsUCnCaCoe9D90whXGO7BWAQbZskMH3Xh2ikbjfU1rp+TIy3EwSZF+9
	Wekut7bP4nkmnFVuUtemnV/fLPcsUiM2u2vpuR3MyTywcsNZMOsv/G5H4b4fyRqr/cIC
	004w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zkKEQPGBuWWpdBGjD8adi7tocrBrwwEJSJ2lLz6SaWk=;
	b=ZeHMgIFz8iUnwTTiXWZJAiMo9vIXzktJ1qP0TitE2ViDokrOHm7YWasKOxcl19KSOB
	rWXkuoVvgKz/XUpNsrmX09R6WSoiq8fl9MQc9O31i8ihqc0zgnHzoKZt3PFujbol39Ii
	9GPInuFpL9hrf9UkCDQPTl8hhEvAQzj7wE1OFnjGIkRm+9qCrtPV6l0zQaJTn9N4WWJ9
	7CN8YZRMpyzAHP+2q3a4EapdoWhkvEZ2zAcQofl20LLD+5MsTQeS7+rL5Lg4B35C7WA5
	vITEE5z4qO8gaHraVuNOOUTAdpjtvDY/GQbvuDvIjZOatQ8oz70ZRu5A43Ia+rlsflCN
	/DpQ==
X-Gm-Message-State: APjAAAV5mzfROAGB1cbQvZHruHlr7Zz7SuUzkgPAwQ6btec50e6TAy9p
	gPhozEMVanWzFyvUXh+5IDsiPo4ifpqB4TdC2ibYiQ==
X-Received: by 2002:a05:6830:d8:: with SMTP id
	x24mr12261346oto.352.1551711292310; 
	Mon, 04 Mar 2019 06:54:52 -0800 (PST)
MIME-Version: 1.0
References: <1551564698-9922-1-git-send-email-michelheily@gmail.com>
In-Reply-To: <1551564698-9922-1-git-send-email-michelheily@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2019 14:54:40 +0000
Message-ID: <CAFEAcA9Y_ZM0tDuvK+bOO+4+hT8ApLYR9EsKPojL9zGG=LJ-Rw@mail.gmail.com>
To: Michel Heily <michelheily@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/stellaris: Implement watchdog timer
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
Cc: "open list:Stellaris" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hKBx8seGx6hG

On Sat, 2 Mar 2019 at 22:11, <michelheily@gmail.com> wrote:
>
> From: Michel Heily <michelheily@gmail.com>
>
> I've added the stellaris watchdog functionality because I needed it for a home project.
> Documentation for the hardware can be found at http://www.ti.com/lit/ds/symlink/lm3s6965.pdf.
>
> Signed-off-by: Michel Heily <michelheily@gmail.com>

Thanks; this is looking pretty good. I have some minor
comments below. We're getting quite close to softfreeze now,
but if you can manage to get a v3 to the list some time this
week I should be able to squeeze it into the next release.

> @@ -1338,6 +1339,24 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>      stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
>                         board, nd_table[0].macaddr.a);
>
> +
> +    if (board->dc1 & (1  << 3)) { /* watchdog present */

Stray extra space before "<<"

> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index eb79a73..5029838 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -37,6 +37,7 @@ REG32(WDOGINTCLR, 0xc)
>  REG32(WDOGRIS, 0x10)
>      FIELD(WDOGRIS, INT, 0, 1)
>  REG32(WDOGMIS, 0x14)
> +REG32(WDOTEST, 0x418)

Typo. This should either be "WDOGTEST" to follow the naming convention
of the other registers, or "WDTTEST" to follow the Stellaris datasheet's
name. I'd go with "WDOGTEST" but it doesn't much matter which.

Also worth a comment
/* only in the Stellaris/Luminary version of the device */

>  REG32(WDOGLOCK, 0xc00)
>  #define WDOG_UNLOCK_VALUE 0x1ACCE551
>  REG32(WDOGITCR, 0xf00)
> @@ -61,12 +62,18 @@ REG32(CID2, 0xff8)
>  REG32(CID3, 0xffc)
>
>  /* PID/CID values */
> -static const int watchdog_id[] = {
> +static const uint32_t cmsdk_apb_watchdog_id[] = {
>      0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
>      0x24, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
>      0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
>  };
>
> +static const uint32_t luminary_watchdog_id[] = {
> +    0x00, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x05, 0x18, 0x18, 0x01, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
>  static bool cmsdk_apb_watchdog_intstatus(CMSDKAPBWatchdog *s)
>  {
>      /* Return masked interrupt status */
> @@ -102,6 +109,7 @@ static uint64_t cmsdk_apb_watchdog_read(void *opaque, hwaddr offset,
>                                          unsigned size)
>  {
>      CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +    bool _default = false;

Don't name variables with leading underscores.
In any case you don't need this one...

>      uint64_t r;
>
>      switch (offset) {
> @@ -124,24 +132,46 @@ static uint64_t cmsdk_apb_watchdog_read(void *opaque, hwaddr offset,
>          r = s->lock;
>          break;
>      case A_WDOGITCR:
> +        if (s->is_luminary) {
> +            _default = true;
> +            break;
> +        }

Just use
 if (s->is_luminary) {
     goto bad_offset;
 }

and then add the bad_offset: label after default:.
This is clearer than having a flag that modifies the program flow.


> @@ -150,6 +180,7 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
>                                       uint64_t value, unsigned size)
>  {
>      CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +    bool _default = false;

Similarly here.

> @@ -197,11 +240,23 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
>                        "CMSDK APB watchdog write: write to RO offset 0x%x\n",
>                        (int)offset);
>          break;
> +    case A_WDOTEST:
> +        if (s->is_luminary) {
> +            qemu_log_mask(LOG_UNIMP,
> +                      "Luminary watchdog write: stall not implemented\n");
> +            break;
> +        }
> +        _default = true;
> +        break;
>      default:
> +        _default = true;
> +        break;
> +    }
> +
> +    if (_default) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "CMSDK APB watchdog write: bad offset 0x%x\n",
>                        (int)offset);
> -        break;
>      }
>  }
>
> @@ -256,6 +311,9 @@ static void cmsdk_apb_watchdog_init(Object *obj)
>                            s, "cmsdk-apb-watchdog", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>      sysbus_init_irq(sbd, &s->wdogint);
> +
> +    s->is_luminary = false;
> +    memcpy(s->id, cmsdk_apb_watchdog_id, sizeof(s->id));

You don't need a memcpy here -- just make s->id a const uint32_t*,
and then you can do "s->id = cmsdk_apb_watchdog_id;"

>  }
>
>  static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
> @@ -291,6 +349,7 @@ static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
>          VMSTATE_UINT32(itcr, CMSDKAPBWatchdog),
>          VMSTATE_UINT32(itop, CMSDKAPBWatchdog),
>          VMSTATE_UINT32(resetstatus, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32_ARRAY(id, CMSDKAPBWatchdog, 12),

The ID registers are constant so they don't need to be transferred
as part of the VM migration state, so you don't need to change
anything here.

>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -318,9 +377,24 @@ static const TypeInfo cmsdk_apb_watchdog_info = {
>      .class_init = cmsdk_apb_watchdog_class_init,
>  };
>
> +static void luminary_watchdog_init(Object *obj)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(obj);
> +
> +    s->is_luminary = true;
> +    memcpy(s->id, luminary_watchdog_id, sizeof(s->id));

Similarly this memcpy isn't needed.

thanks
-- PMM
