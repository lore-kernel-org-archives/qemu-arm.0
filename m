Received: by 10.28.71.27 with SMTP id u27csp497311wma;
        Fri, 26 Jan 2018 01:42:57 -0800 (PST)
X-Google-Smtp-Source: AH8x224pwVabgsi2UI5O0kYR6RqdwJxMFgMgOSs0Wjp3uD5+7tegH+h0R9smDes9ITJ8R5UaLRei
X-Received: by 10.37.132.17 with SMTP id u17mr10961957ybk.273.1516959777274;
        Fri, 26 Jan 2018 01:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516959777; cv=none;
        d=google.com; s=arc-20160816;
        b=D1/AfFi++8B7hqzrZUkHbHEfrtq0bY60EW5jzWH3Znya755UZHtRblzin7Y0II1QXI
         TytLYqsYgIICV10zQSj5SMVT5t1sYsB9eawwDXjTheEPjHeF4bOA9JyPD9fGeI8EZgzL
         9ynsQ2Yl9SFdesgi/UrLOcVZgmh+JCBgjvA4JCrnA1XDdZvG7meHqMwRCRwy9SkTFkXK
         bQNpKkUVxLzlOZIMnEQRYqqQH5glP4KwdXwpi44ZHruTkit7vHXtVTsk9q6M/kFvkrem
         dTSMUYEGBDjf4zKVAbM1mLt9supaGE1gYZA76ASUm3meUeNYjf5yjQqRnUXYKvu8MZYu
         CbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=AAo9CzudMsL21LdMs+x32r8DLn4E8SROvoB2p28gjEs=;
        b=jVysenIt8ZZJn7krc5Ud4BBtgfuSMVqE85MMlWwNwsu/k/3qdACDEi+dJk0pK3ur+1
         irK+wA9Hyfu3uLBgl3tYF9c2FRTJRCdRD7Fjxv1bWpEMZH5DZmkjbROKloC2XgFD23gv
         NQ6PHn7vt28yI+BVpRjmInI9gcHnW+9np8oKQZEJ8WVfBtIXdzr1YWa39/lcHpZhxXtn
         Kp3GOrbIpaNw1hQcAS3V7dnKTRwOIqOBa8ET6I8CvgiVapZtUL9IHhJdVPpi4NXp5Nah
         7b8Z4Eosl1D+CU65TMmsQwy1aTIjU89QVYMCJuyVl9CJrqJW8eijGsHGpGFPJoXy5sss
         1qBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si852237ywd.307.2018.01.26.01.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 01:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef0XA-00083g-LE
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 04:42:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ef0X0-0007z3-9P
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 04:42:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ef0Wx-0004i4-6g
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 04:42:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1ef0Ww-0004hj-Vx; Fri, 26 Jan 2018 04:42:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F52626C3F;
	Fri, 26 Jan 2018 09:36:50 +0000 (UTC)
Received: from [10.36.117.138] (ovpn-117-138.ams2.redhat.com [10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5343262672;
	Fri, 26 Jan 2018 09:36:47 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1516634853-15883-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b75b7114-ed48-e9bb-d767-359c2ae44d53@redhat.com>
Date: Fri, 26 Jan 2018 10:36:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516634853-15883-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 26 Jan 2018 09:36:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] i2c: Add a CONFIG_I2C master switch to the
 configuration files
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8CWuNHySZp14

On 22/01/2018 16:27, Thomas Huth wrote:
> The i2c core and the at24c EEPROM should only be compiled and linked
> on the machines that support i2c. Otherwise it's quite strange to see
> the at24c-eeprom to be "available" on qemu-system-s390x for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak         | 1 +
>  default-configs/i386-softmmu.mak        | 1 +
>  default-configs/mips-softmmu-common.mak | 1 +
>  default-configs/ppc-softmmu.mak         | 1 +
>  default-configs/ppcemb-softmmu.mak      | 1 +
>  default-configs/x86_64-softmmu.mak      | 1 +
>  hw/i2c/Makefile.objs                    | 2 +-
>  hw/nvram/Makefile.objs                  | 2 +-
>  8 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index b0d6e65..ca34cf4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -67,6 +67,7 @@ CONFIG_CADENCE=y
>  CONFIG_XGMAC=y
>  CONFIG_EXYNOS4=y
>  CONFIG_PXA2XX=y
> +CONFIG_I2C=y
>  CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
>  CONFIG_XILINX_SPIPS=y
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
> index 95ac4b4..4bc8f25 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -61,3 +61,4 @@ CONFIG_HYPERV_TESTDEV=$(CONFIG_KVM)
>  CONFIG_PXB=y
>  CONFIG_ACPI_VMGENID=y
>  CONFIG_FW_CFG_DMA=y
> +CONFIG_I2C=y
> diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
> index 7d8f5db..e31f046 100644
> --- a/default-configs/mips-softmmu-common.mak
> +++ b/default-configs/mips-softmmu-common.mak
> @@ -34,3 +34,4 @@ CONFIG_ISA_TESTDEV=y
>  CONFIG_EMPTY_SLOT=y
>  CONFIG_MIPS_CPS=y
>  CONFIG_MIPS_ITU=y
> +CONFIG_I2C=y
> diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
> index 3baed6a..65680d8 100644
> --- a/default-configs/ppc-softmmu.mak
> +++ b/default-configs/ppc-softmmu.mak
> @@ -23,6 +23,7 @@ CONFIG_PLATFORM_BUS=y
>  CONFIG_ETSEC=y
>  CONFIG_SM501=y
>  CONFIG_IDE_SII3112=y
> +CONFIG_I2C=y
>  
>  # For Macs
>  CONFIG_MAC=y
> diff --git a/default-configs/ppcemb-softmmu.mak b/default-configs/ppcemb-softmmu.mak
> index 5db4618..bc5e1b3 100644
> --- a/default-configs/ppcemb-softmmu.mak
> +++ b/default-configs/ppcemb-softmmu.mak
> @@ -17,3 +17,4 @@ CONFIG_XILINX=y
>  CONFIG_XILINX_ETHLITE=y
>  CONFIG_SM501=y
>  CONFIG_IDE_SII3112=y
> +CONFIG_I2C=y
> diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_64-softmmu.mak
> index 0221236..f0b7bcd 100644
> --- a/default-configs/x86_64-softmmu.mak
> +++ b/default-configs/x86_64-softmmu.mak
> @@ -61,3 +61,4 @@ CONFIG_HYPERV_TESTDEV=$(CONFIG_KVM)
>  CONFIG_PXB=y
>  CONFIG_ACPI_VMGENID=y
>  CONFIG_FW_CFG_DMA=y
> +CONFIG_I2C=y
> diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
> index 0594dea..37cacde 100644
> --- a/hw/i2c/Makefile.objs
> +++ b/hw/i2c/Makefile.objs
> @@ -1,4 +1,4 @@
> -common-obj-y += core.o smbus.o smbus_eeprom.o
> +common-obj-$(CONFIG_I2C) += core.o smbus.o smbus_eeprom.o
>  common-obj-$(CONFIG_DDC) += i2c-ddc.o
>  common-obj-$(CONFIG_VERSATILE_I2C) += versatile_i2c.o
>  common-obj-$(CONFIG_ACPI_X86) += smbus_ich9.o
> diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
> index 0f4ee71..a912d25 100644
> --- a/hw/nvram/Makefile.objs
> +++ b/hw/nvram/Makefile.objs
> @@ -1,6 +1,6 @@
>  common-obj-$(CONFIG_DS1225Y) += ds1225y.o
>  common-obj-y += eeprom93xx.o
> -common-obj-y += eeprom_at24c.o
> +common-obj-$(CONFIG_I2C) += eeprom_at24c.o
>  common-obj-y += fw_cfg.o
>  common-obj-y += chrp_nvram.o
>  common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
> 

Queued, thanks.

Paolo
