Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp744464wrd;
        Fri, 17 Aug 2018 16:52:15 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwKHXQaEWQaK2IrKD5BiWA8qe7ssnxem6w7WWwwznHn2ts9+F8RECY8eT9RkGOQUVAu8huP
X-Received: by 2002:ac8:1a46:: with SMTP id q6-v6mr37405883qtk.5.1534549935002;
        Fri, 17 Aug 2018 16:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534549934; cv=none;
        d=google.com; s=arc-20160816;
        b=stfVC1tSCZSp4Bt7tCF7M3QxNDv/KCQAgcF/UXmVWbtcCweuRNZGftVX+VyFxaSQwk
         wxNyKOmGsR3Y+BsQO9uXfEe0Op4IO4pElgWQ1v1k8aDRGcQd85eHuvIKFORbSOF43Bpf
         53yB4eJXyl3ud2c89WNFUohADhp2n65+uoCN4wwHZLlfvfYbBR5w1MtfrfacZKuWsJlK
         H5acPJEXo8HjW8N4dBTwbmPRdfUP97l80WbwBhNU6SVuDSq4UEPy8UsE/7aPh46/ywpU
         sqxzmHf41L0g+prGDVBJ4zb589rd8kljZbGWlCot0pxVCMTiVnKtH9HIHCWRwQwZKB2y
         kolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ivzfNAEfbmG6OppYMJV3zs5NTh0+UCICpthCqQVPDGk=;
        b=mwcJHBQ+SIPjMtmUzatAgciqVrwOuNFw5GBOO4Bn6+q8pmn2fOBaVRn7CrgseQSFjl
         D9knMw/PMtg5zqIaAc0ngpd2GM8Z7iql8fU0Q4qT+bYkeX1Deyxa//3RJDLmo/3E1J0S
         8Ew7PJWgyc3QbKQmhmE/TG5m/tZhMtO84W3MnGaGrg+XH3RM2eIqW0TCWUddaWNePL+B
         2tneYeHzkYQT3Qxj/MeiGdTHgCIyzlgFtl4aAEgdzCXyHKIGAywcDQCSHYw6So6AsKm4
         YoG/osi4/IhOQNofGEwG5YLf9VqgLptrVo+VyNxy9wzq5M6muiT8IgF+9y0hUtqrzKhY
         3e1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FEyVw1SZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si471751qva.64.2018.08.17.16.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 16:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FEyVw1SZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqoXO-0003EP-J8
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 19:52:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoV6-0001cy-6O
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 19:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoV1-0007MH-EE
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 19:49:52 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:39447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqoV1-0007M5-9d; Fri, 17 Aug 2018 19:49:47 -0400
Received: by mail-ua1-x941.google.com with SMTP id g18-v6so6698322uam.6;
	Fri, 17 Aug 2018 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ivzfNAEfbmG6OppYMJV3zs5NTh0+UCICpthCqQVPDGk=;
	b=FEyVw1SZSg9orzxSF0yvnebddhGBs5cjMitkoPNlXYT4uw75lo7SXj+kNUn2NQdPPA
	6gJMNdQuUVc+EvbsLN11gjzIjqUd/IWJJ0evStMBGsw+4gFfBK5OiZDI8Or/XampDt6h
	PIFU0SYnvfgSH746z4m1SVsYLp9FgBJqF6yJAi3IkY39lZCVz8bhc3QTqpdGv6EKUZLH
	UxLvIlOse+N4JfTqikKkBiz++dkFG3uqXHShyK9MCD0/IbpwCd/W4/v0r4SWheskQSSu
	DSIBfabg1duRfPUBBz8/I+bTc8yO4AYMOV3Y6UtyNageGEBO2FxNxyBfgasEL/h3XaUg
	IHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ivzfNAEfbmG6OppYMJV3zs5NTh0+UCICpthCqQVPDGk=;
	b=hlwlH+Z0V5BD+RE3iauTWBFRp3hJUMUHoxit46HD4YUlJaqXRr5kfRRWx2II0o2r1j
	MaqaKOZv8APrdAAm/XdRBgIu1aNZrf0FBIXA6d6SMkalIxa6fkBcqV7c/ahUOgw4DFNl
	cQv8SE63ioH518kX1o9E4lDu1+dyYuWzwtxA3Aj3LeldZUXOWpPr3egjCljPn4vIFGMp
	fjO2aEgJQGAAH/VJPqVTx0nnOk6SAkKMSxdfm9ME3jFsvsA2bxd57ZEwPUNdYxJDF44W
	+7DNn8nHNrauXYB8OaEno68RJQcWoA/iu89/WQHvqpy0RJqXtPB+sGbLXiw0qEGSTr/1
	rldA==
X-Gm-Message-State: AOUpUlHNcgorw+wtzrlRK/cen50Xoc6DhtiXX88uAPVNE92eTtZM5+Ik
	Nb9QkRPhX2IgDiSYEgGkV8s=
X-Received: by 2002:ab0:19c2:: with SMTP id
	r2-v6mr24098660uai.75.1534549786789; 
	Fri, 17 Aug 2018 16:49:46 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	9-v6sm1991022uau.47.2018.08.17.16.49.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 16:49:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <9189f510-869e-c3d6-f925-24092c0f2c57@amsat.org>
Date: Fri, 17 Aug 2018 20:49:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 04/16] hw/arm/iotkit: Wire up
 the S32KTIMER
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JpZOqjq1GB8x

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The IoTKit has a CMSDK timer device that runs on the S32KCLK.
> Create this and wire it up.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/iotkit.h | 2 +-
>  hw/arm/iotkit.c         | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
> index 776d0497087..0f5c5101708 100644
> --- a/include/hw/arm/iotkit.h
> +++ b/include/hw/arm/iotkit.h
> @@ -83,6 +83,7 @@ typedef struct IoTKit {
>      TZMPC mpc;
>      CMSDKAPBTIMER timer0;
>      CMSDKAPBTIMER timer1;
> +    CMSDKAPBTIMER s32ktimer;
>      qemu_or_irq ppc_irq_orgate;
>      SplitIRQ sec_resp_splitter;
>      SplitIRQ ppc_irq_splitter[NUM_PPCS];
> @@ -91,7 +92,6 @@ typedef struct IoTKit {
>      qemu_or_irq nmi_orgate;
>  
>      CMSDKAPBDualTimer dualtimer;
> -    UnimplementedDeviceState s32ktimer;
>  
>      CMSDKAPBWatchdog s32kwatchdog;
>      CMSDKAPBWatchdog nswatchdog;
> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
> index 5cedfa03570..cb0ec456f39 100644
> --- a/hw/arm/iotkit.c
> +++ b/hw/arm/iotkit.c
> @@ -141,6 +141,8 @@ static void iotkit_init(Object *obj)
>                            TYPE_CMSDK_APB_TIMER);
>      sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
>                            TYPE_CMSDK_APB_TIMER);
> +    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
> +                          TYPE_CMSDK_APB_TIMER);
>      sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
>                            TYPE_CMSDK_APB_DUALTIMER);
>      sysbus_init_child_obj(obj, "s32kwatchdog", &s->s32kwatchdog,
> @@ -166,8 +168,6 @@ static void iotkit_init(Object *obj)
>                                  TYPE_SPLIT_IRQ, &error_abort, NULL);
>          g_free(name);
>      }
> -    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
> -                          TYPE_UNIMPLEMENTED_DEVICE);
>  }
>  
>  static void iotkit_exp_irq(void *opaque, int n, int level)
> @@ -476,13 +476,14 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>      /* Devices behind APB PPC1:
>       *   0x4002f000: S32K timer
>       */
> -    qdev_prop_set_string(DEVICE(&s->s32ktimer), "name", "S32KTIMER");
> -    qdev_prop_set_uint64(DEVICE(&s->s32ktimer), "size", 0x1000);
> +    qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
>      object_property_set_bool(OBJECT(&s->s32ktimer), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->armv7m), 2));
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
>      object_property_set_link(OBJECT(&s->apb_ppc1), OBJECT(mr), "port[0]", &err);
>      if (err) {
> 
