Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp751146wrx;
        Fri, 12 Apr 2019 09:22:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7bA1nvX8sgu25L8QBBZHdPyr4NnS4Fa76wdIIXnrWhhz8ajR8/62nsGSioypNoURwJGhe
X-Received: by 2002:a7b:c053:: with SMTP id u19mr8152877wmc.63.1555086120891;
        Fri, 12 Apr 2019 09:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555086120; cv=none;
        d=google.com; s=arc-20160816;
        b=w8qHPeDCrgSQg3oRXUGXaHhGnUgKrBeMbZl5EtZheszv7GVU7EP+lRHXx+6F+5SX07
         afDGW3Kj4Sqej1qIyMdFn5AyxFt0na1KI4XQ/00lzsw38LAM0rqayM64uoLXiJiqZTiB
         pIoj/sCi4iCnvnClWiVsITcXPjggrcosZj97yqeJny2qdBQMkIa/I2Mo2rKO+8jCy0M6
         n3Ferq7Kz76vUq5ukj9PN5aPhD3BANRBf0F36Az0PfYkvPYQI9hx3NZuoT+ci0bCUZKr
         Ku/D011JYeFAID82vPqkV3+iQg6IP05aN8u/6J81/xz+Lk7Qj80JpBvWDvGiD/nMx16t
         u9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=UCu8QWsD7L34HbO1/b+gpi3AWoEZGGUfVix5kEiHkwk=;
        b=yujoIyU7q9ie+e16KSVuSZqUUohthh4I6nVbHo+kypKbanp33qnHu5N693Ilblrajy
         YF1rTRKew7BNzu2CkWQ0LDOSSDiIjwe2g4zhMA4v4fYv0MgjvkR95F9fAFX5a0zwfhSb
         xDd5jSkHS8HtYqbBLmPkVqwtT0TzNkjygELwW9oCQ6qGvWlh74llft/JYKuaIUB3MgKI
         nE6tLYrZ4bePK5xVCKTyHTfgyyRNYsLnlnbFRLjGgl20myvABeoifFfq845g05G8roym
         zt6XndnL8SXIMdCXXjrRl+FYIfUfVDparla0LiBXRJpAvKKyKYatz6yHL89G5akgcxYy
         K+vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si27695067wrq.93.2019.04.12.09.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEywB-0003KM-VB
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:22:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEyw1-0003JX-JC
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:21:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEyvz-0002Av-Lc
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:21:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hEyvw-00028u-5l
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:21:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id k11so12717509wro.5
	for <qemu-arm@nongnu.org>; Fri, 12 Apr 2019 09:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UCu8QWsD7L34HbO1/b+gpi3AWoEZGGUfVix5kEiHkwk=;
	b=rZfDlbOUY6C5D/eUCJcClRrJiXA5rpFcV/W5EOuxIDvedcAULBxtUBqMhBOrVDHmvM
	45ov3+5zPAZAaZIGo0BXyyiHGIFofPjTfzoN80WAS2dIslSGLIvG2uXkg8od0Zu0L1i1
	dcrql7J6xXR8r5Xt/VQCwvc7PMszCDVVihASz2Xfll2iBRG4KCPSkuQKETIAl5D7nCR4
	La7Hge9RQJKJ5etEijzu1I8TMPeUc91MZ6ju9ZNf8QEaCapqGkNBBfYQJqBnF4a6D0/W
	DBkFx31zs9whV5V+02m6+5eD4CQuxiFyBw5w/hmUz5CnUaBfYoypiWwyzeCD+rE23ZqV
	AKqg==
X-Gm-Message-State: APjAAAU8uoqyOqReWNCfH9jb7wv94H0+k6r0UkhtJOSjKlaE0IU1labV
	dSvcAovCkmmjj5lGGvfMFnzBdg==
X-Received: by 2002:adf:ce8c:: with SMTP id r12mr17403032wrn.60.1555086103129; 
	Fri, 12 Apr 2019 09:21:43 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	n4sm42066694wrx.39.2019.04.12.09.21.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 09:21:42 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190412152619.23542-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2c7385cf-78ba-3331-53f0-1973408f0e4d@redhat.com>
Date: Fri, 12 Apr 2019 18:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412152619.23542-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/arm/nseries:
 Deprecate the n800 and n810 machines
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
Cc: libvir-list@redhat.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /utig2u1Ts1i

On 4/12/19 5:26 PM, Thomas Huth wrote:
> These machines depend on the deprecated bluetooth subsystem. In case we
> finally decide to remove the bluetooth subsystem, we likely need to
> remove the n800 and n810 machines, too, so mark them now as deprecated.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/nseries.c     | 3 +++
>  qemu-deprecated.texi | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 906b7ca22d..66e50b850c 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1309,6 +1309,9 @@ static void n8x0_init(MachineState *machine,
>      struct n800_s *s = (struct n800_s *) g_malloc0(sizeof(*s));
>      int sdram_size = binfo->ram_size;
>  
> +    warn_report("The n800 and n810 machines are deprecated. Please use a "
> +                "different Arm machine instead.");
> +

Unrelated to this patch, but can you add a similar warning in
uart_hci_init() to make obvious that the bluetooth subsystem is now
deprecated?

>      s->mpu = omap2420_mpu_init(sysmem, sdram_size, machine->cpu_type);
>  
>      /* Setup peripherals
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 2219386769..4de7452fac 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -145,6 +145,12 @@ This machine type uses an unmaintained firmware, broken in lots of ways,
>  and unable to start post-2004 operating systems. 40p machine type should be
>  used instead.
>  
> +@subsection n800 and n810 (Arm) (since 4.1)
> +
> +These machines depend on the deprecated bluetooth subsystem. When the
> +bluetooth subsystem will be removed, the n800 and n810 machines will be
> +deleted, too. If possible, use a different Arm board instead.
> +
>  @section Device options
>  
>  @subsection Block device options
> 
