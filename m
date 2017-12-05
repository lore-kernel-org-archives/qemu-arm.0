Received: by 10.223.159.74 with SMTP id f10csp2355962wrg;
        Mon, 4 Dec 2017 19:55:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZH23u2hWqFaEuMyr2P6FdLIZ21Rlp6b5uDIElJttBpWgwTKiEJ/4zNCAlZtEwIcWGo33Ym
X-Received: by 10.37.185.193 with SMTP id y1mr11025945ybj.371.1512446159637;
        Mon, 04 Dec 2017 19:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512446159; cv=none;
        d=google.com; s=arc-20160816;
        b=ulwL6ImLw2GSQE81IkoSHB4D4ugaP+bh64+dI07nlvkm76GEv8STMtslkFnbaVqQTY
         jRspTlF0CLOPVFi5x57gRUte6VFvrEk78xnhARVTAsSpkyQt12QdZ5jK2Z18CvoSX5gQ
         CyylS6FMnGzMACAwzyjJfhAQNCRvjaZaNL+2UmwKyc9BJabwEaObv2A5HTk9zbJVX1cG
         LtCj/rlrfDmPQqi12cuohh3JrBCOhFJkQZ4NftqsbK7ID00S3NmdgZ6Kp0upPrNkBznV
         oKbJmRGzWKjtn4ROt+SAtsGBG8ys90pi3p3hBo7MrJcy4QDDeTgCtU87g0ErFq0XA2E1
         uyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=EvcuyqRIwXmiMoHmEnW7uhVA9/n9YV9wlX7wjL0QJd0=;
        b=vgXZYZ2GsTGkQoN3q3aRH5+J/jyNvKqVF67bDJr5k13/Yu92+8fWIYUZYfrgYFL80m
         IVOu0b7DCOhrYQPbzr38CeLOCnpbPume5sDB7Hdat9Nb3lCd+Wk6kQ0cISO5bTPnIUJc
         xekJ/lg8agPjTwWuc0tAQT2bKLAD3k9JDOVGtBcWp/SHw8NOAOWEVsFFN6sszGrl6tzd
         Q0U89lIVgz20dJVR7wKTsa91vE9akcB803p0cHc9CyUuQ/CDEgpFLLivj0WMk6v0V9+2
         va/EbKJUcleAkQUOZ+pghCHdkS6WSmtRRkXFicrm6UHzBkClV1tdNaZBySik/9QqeBV7
         sCNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CrGn8dkI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o140si2871359ywo.545.2017.12.04.19.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Dec 2017 19:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CrGn8dkI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eM4Kt-0007J6-4I
	for alex.bennee@linaro.org; Mon, 04 Dec 2017 22:55:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4HY-0004s0-LI
	for qemu-devel@nongnu.org; Mon, 04 Dec 2017 22:52:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4HU-0000fp-M5
	for qemu-devel@nongnu.org; Mon, 04 Dec 2017 22:52:32 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38283)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4HU-0000fU-Gs; Mon, 04 Dec 2017 22:52:28 -0500
Received: by mail-qt0-x242.google.com with SMTP id d4so26162849qtj.5;
	Mon, 04 Dec 2017 19:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EvcuyqRIwXmiMoHmEnW7uhVA9/n9YV9wlX7wjL0QJd0=;
	b=CrGn8dkICs3AHGO1uI0lMW8+/dX31M/3AE/DB1W/LEQmhdXXNlzvJ8sddLKP9fV1qL
	BCS6GuLRz8jxicqCehwGCyI8HUEAilW2gm/ENc4KGXwviatscsxmld9Z4/tBBHKTWPyS
	pjltm1dFV0PHdvuN6FIYsh5kWpynbkE1uc8FEDNbztMHenYbtOKqszp4srOvJ/FU71lG
	6pLi6TSo3p7OOWxX2H6FFMEpNC2Uvv6CnOJwxAdLqaJg0THl3gR//1OrSTKxDSypOr/n
	8Wim81tr8JUqyHHqDgiaxVfdeI7zsBUUeXkLTQ36lrPyPw7XmO/HGzgMeBTm1ZGEjouF
	tO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=EvcuyqRIwXmiMoHmEnW7uhVA9/n9YV9wlX7wjL0QJd0=;
	b=ajJCOmSkY/nHIjxmAytStkOK2kNTjjY9W7glC/YVGj4ipF9OP9xXB5bSFBHmCDy2JR
	op516igO/SE0zWGtjPXbRcLUsumAG47ero4yxtROPXw9A0fBjjRdtoa4CyRX7m8hdTMl
	9adEGJYm56FtpnjqISWL1ZNFDn06ERYpzfbjNbck3q4oZuo054tpGZ/ShRgQXHJMBZw7
	ru5G+PO0Qk3zg6GWz+ETVkKOWFd9OtkqNO/W/KGRQimW3JCoLVOQpa8q4nnDnHHH6Guk
	RLCYkJ5XjF13OyD/f2T94lL259v/34HtqEaU+O6oPpc+UINzY+nCwv/XqkxjxtXxNDmA
	KkaQ==
X-Gm-Message-State: AKGB3mLcdxEWVQ2xG8yqu8pr/agNtAsAKjfrRyQbV2kvnA5GMLcaDEZs
	grGRsLhwIBDq/HN0R9KbE54=
X-Received: by 10.55.42.129 with SMTP id q1mr21788132qkq.3.1512445947502;
	Mon, 04 Dec 2017 19:52:27 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d6sm10205750qte.4.2017.12.04.19.52.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Dec 2017 19:52:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
	<1512154296-5652-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <eee95b3d-8d94-c9d7-4fc2-e9ecbcb8e89d@amsat.org>
Date: Tue, 5 Dec 2017 00:52:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512154296-5652-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/2] nvic: Make
 nvic_sysreg_ns_ops work with any MemoryRegion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RpNZsyLCkbvv

On 12/01/2017 03:51 PM, Peter Maydell wrote:
> Generalize nvic_sysreg_ns_ops so that we can pass it an
> arbitrary MemoryRegion which it will use as the underlying
> register implementation to apply the NS-alias behaviour
> to. We'll want this so we can do the same with systick.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 5d9c883..63f2743 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1786,10 +1786,12 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
>                                          uint64_t value, unsigned size,
>                                          MemTxAttrs attrs)
>  {
> +    MemoryRegion *mr = opaque;
> +
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return nvic_sysreg_write(opaque, addr, value, size, attrs);
> +        return memory_region_dispatch_write(mr, addr, value, size, attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -1803,10 +1805,12 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
>                                         uint64_t *data, unsigned size,
>                                         MemTxAttrs attrs)
>  {
> +    MemoryRegion *mr = opaque;
> +
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return nvic_sysreg_read(opaque, addr, data, size, attrs);
> +        return memory_region_dispatch_read(mr, addr, data, size, attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2075,7 +2079,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>  
>      if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
>          memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
> -                              &nvic_sysreg_ns_ops, s,
> +                              &nvic_sysreg_ns_ops, &s->sysregmem,
>                                "nvic_sysregs_ns", 0x1000);
>          memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
>      }
> 
