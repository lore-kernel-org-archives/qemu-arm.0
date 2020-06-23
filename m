Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3828914lfm;
        Mon, 22 Jun 2020 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm3seA1PHX0nsoG4sEgzzXeAW4zuAlBG6L9X7++AQgKpYdwHYhjfGbjh2TwtWWTAX9LNs7
X-Received: by 2002:a5b:548:: with SMTP id r8mr33516506ybp.322.1592892426379;
        Mon, 22 Jun 2020 23:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592892426; cv=none;
        d=google.com; s=arc-20160816;
        b=V/eKHLf0EHzxxUc/10SyP5mbgtDNnH4bzOUkEY/X1uvLluXaPC+VbukYj/laS9hIVe
         GTojJk/8uVpIoTEc9UYHqiUWDbhWrHUaCsvaqnhJV3nw8iQBWnYFIykKQN7OMRHw0sI7
         soZv6UvTTk0o9ePwKbT2sfnJ3X+qePXukkNXbWD758lrNu8WpVpmNUGwoCHp3h8iLhEA
         5lRF1fGEsAn6f9SiJp+TyGTTK2cwBUBTbwkdH5RGSlsoxv9S2Uj6gmnDQntX2VDGS/pv
         NtRD6X2mc6EbEKB7Fe2c8kEH5B54ll2NVjMt570qq4MzjJU7kDeMOSqDsasfITudqIH+
         xhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=1vKdovAFeteYGq2no3qdu8jMjMmJKmVKMZL4v6KxN7A=;
        b=fBTiQVnIed6oilvh7Vrj7yDyPrreeNsb+ueit9cmaO0fmQkpk6esPQanAqE/KrV5Lb
         +Ae+mbAvNoIvGNjyze2XWMVJK16kXzYxnPGGQzj+83orLG0b3RN+ikDBDhWlWs5S4YPH
         udTZQPgAHNdJ0g1SYGk81v7do4AzYLHt6POdKa55KhoPyB6UZtrGIKSYLegD/V6u83TU
         /RU94f+/NC70Vh/FNNO5yAUWa+mJ/lRAJuYGTl7cmyP8ESU3qskU+HahgqsRwu4upWYk
         Y/KEfV8GdvZmLh3XiSn3elgSxUsNFYW33cLWrRm+80/rZ5FXIPUuuz6WT6PxVz1Va8+y
         sZaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b68si2582098ybh.348.2020.06.22.23.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 23:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnc5J-0003mo-Pm
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 02:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnc5C-0003mh-SW
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 02:06:58 -0400
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:54755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnc5B-0004ZK-1N
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 02:06:58 -0400
Received: from player799.ha.ovh.net (unknown [10.108.35.124])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id EEB6217070A
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 08:06:54 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id B5AE813A4521A;
 Tue, 23 Jun 2020 06:06:44 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c96d258d-1271-4948-ac6e-3e4227c233fc,EED1DA90FC9B795DFFB5AB62ED4F19E3D36D96F8)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v5 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200622183428.12255-1-f4bug@amsat.org>
 <20200622183428.12255-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9ad7d9a8-9fef-8068-346d-aa91465095de@kaod.org>
Date: Tue, 23 Jun 2020 08:06:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622183428.12255-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11240421723129154446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekfedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekiedrvddutddrudehvddrvdegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.74.219; envelope-from=clg@kaod.org;
 helo=8.mo68.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:06:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFAEGLdkgO6w

On 6/22/20 8:34 PM, Philippe Mathieu-Daudé wrote:
> Extract i2c_try_create_slave() and i2c_realize_and_unref()
> from i2c_create_slave().
> We can now set properties on a I2CSlave before it is realized.
> 
> This is in line with the recent qdev/QOM changes merged
> in commit 6675a653d2e.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  include/hw/i2c/i2c.h |  2 ++
>  hw/i2c/core.c        | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 4117211565..d6e3d85faf 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>  
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
>  
>  /* lm832x.c */
>  void lm832x_key_event(DeviceState *dev, int key, int state);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 1aac457a2a..acf34a12d6 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave = {
>      }
>  };
>  
> -DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>  {
>      DeviceState *dev;
>  
>      dev = qdev_new(name);
>      qdev_prop_set_uint8(dev, "address", addr);
> -    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
> +    return dev;
> +}
> +
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +}
> +
> +DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
> +{
> +    DeviceState *dev;
> +
> +    dev = i2c_try_create_slave(name, addr);
> +    i2c_realize_and_unref(dev, bus, &error_fatal);
> +
>      return dev;
>  }
>  
> 

