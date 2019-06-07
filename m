Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp203362wrg;
        Fri, 7 Jun 2019 06:36:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOfRUkjNkgxuhGIGGkQLfqHyoKGout7/S8K6Iv2/u8zrAbDTEFf9z5NhBCptG62kzGvegL
X-Received: by 2002:ac8:3932:: with SMTP id s47mr46690720qtb.264.1559914607425;
        Fri, 07 Jun 2019 06:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559914607; cv=none;
        d=google.com; s=arc-20160816;
        b=lF3oUV1MG9zToV6PW2U09HWNFB88AC6T9ONgHPdD+R4vWTuHnNCrHNVnE5Ck8RtMW0
         roPm/kbui5iSnuP63d2Eiycnn0stEwX9gjEojrCOlqohsWzpy5in8JEGNCZgQdEuxeCk
         ooiEZi55pANtR1QyJHish2hsAonBaqR+Wp30rjCY3UnBotV7uk+hLFNJLfa5E29HKPPZ
         c7lXnrnOrWyUPLr2XE+Rqus1n384CTDUBVMFhkpDgetXfzIZ9se+l239OdjbGE7Sm2Ty
         mdl3nB0XZ1QCepHDiNRWpoK8VYue2C9X9rTsLIIYlnktfGPNfFQcOb0k7p+EPnqJP0hV
         kebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=1Q666j7humCTdTOdaQNFaKglmH5x/Xog3PLma8yHMP8=;
        b=YdjjnmWlMjRtiFIRdhQolnOgemCleifacct7o499BI2r9uMdr14jWdtg0cK0ow+8RJ
         494vJwWXf2MjPlMVUSQeq7IcA/jJy1jUJ7cHlSUlzHoFxliqdk7IQE+qpJj9IGcKkcAx
         M5MMAT9eTBSldDyVugPXmR6idwLeCcqRRfka0se6cBKp6LIbK0l0zyncbj367OOi4XpO
         kzdEzEIisJFH2tpggFYUN6LyXayfPlktoxQGtKJsou0NGtj7R8+nKxvZ+bsXohYS+PDy
         Qi0EnkrfOm0Ff4494kBNrC6ukJ2+lx4xI9V7xkLeDOrMoAf1cqAAWaUbUokNgSukJ1Zr
         TrzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id k3si1195914qkd.44.2019.06.07.06.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 06:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZF30-0002xp-V2
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 09:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZEz6-0008Ek-Gv
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZEz5-0004RG-BT
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:32:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45600)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZEz3-0004GB-Bm
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 09:32:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so2173331wre.12
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 06:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Q666j7humCTdTOdaQNFaKglmH5x/Xog3PLma8yHMP8=;
 b=bw6TcXFoAuE5xMqc0lfyUUywIvYbE2fwd3BtbEzuJS9H41LG9f0Qq8MKDHnA6+mEK3
 ZEVrosPbsxw3HbyLKhgCDslC33vcwqI+Ieh3n37KeA1vpCOBNtG9LPdL4ZHxcTxSSXO2
 vw2FGTm+cGE3Qj4I4xyG0SGcm1zEmMHdofPSK0kK3N9eU3nAfgUBJ7U4WbJfkkIVuge0
 +iiazEqDqnC9t3BVBwabZ1cMnf8X6v/mvNMDn7J/bkF84qHoYkq0z5Am40lbds2OsgRs
 a2K55VjYEDGXEBb09q28xr6TZ7Q/vewtCwEmVmSI8BvawDtwf2M4YkESZFdxSk5tpMxM
 zsMw==
X-Gm-Message-State: APjAAAXxq6k2TYZ7/mQwlRtUDYZp3BQFdilK0bTMBDX+xBJ/DcCmxQv5
 UbGsPBbphjCucNH7OOOgnz1Q3w==
X-Received: by 2002:a5d:6243:: with SMTP id m3mr3114762wrv.41.1559914358688;
 Fri, 07 Jun 2019 06:32:38 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id y2sm2073873wra.58.2019.06.07.06.32.38
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 06:32:38 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190517174046.11146-1-peter.maydell@linaro.org>
 <20190517174046.11146-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f210a5de-c3ff-59ea-f2f0-9a6bb1793374@redhat.com>
Date: Fri, 7 Jun 2019 15:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517174046.11146-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] hw/arm/armv7m: Forward
 "vfp" and "dsp" properties to CPU
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VJsE7petpCQj

On 5/17/19 7:40 PM, Peter Maydell wrote:
> Create "vfp" and "dsp" properties on the armv7m container object
> which will be forwarded to its CPU object, so that SoCs can
> configure whether the CPU has these features.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h |  4 ++++
>  hw/arm/armv7m.c         | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index e96a98f8093..d2c74d3872a 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -43,6 +43,8 @@ typedef struct {
>   *   devices will be automatically layered on top of this view.)
>   * + Property "idau": IDAU interface (forwarded to CPU object)
>   * + Property "init-svtor": secure VTOR reset value (forwarded to CPU object)
> + * + Property "vfp": enable VFP (forwarded to CPU object)
> + * + Property "dsp": enable DSP (forwarded to CPU object)
>   * + Property "enable-bitband": expose bitbanded IO
>   */
>  typedef struct ARMv7MState {
> @@ -66,6 +68,8 @@ typedef struct ARMv7MState {
>      uint32_t init_svtor;
>      bool enable_bitband;
>      bool start_powered_off;
> +    bool vfp;
> +    bool dsp;
>  } ARMv7MState;
>  
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index c4b2a9a1f5c..7caf9bd3364 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -190,6 +190,22 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>      }
> +    if (object_property_find(OBJECT(s->cpu), "vfp", NULL)) {

And TIL object_property_find :)
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        object_property_set_bool(OBJECT(s->cpu), s->vfp,
> +                                 "vfp", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +    if (object_property_find(OBJECT(s->cpu), "dsp", NULL)) {
> +        object_property_set_bool(OBJECT(s->cpu), s->dsp,
> +                                 "dsp", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
>  
>      /*
>       * Tell the CPU where the NVIC is; it will fail realize if it doesn't
> @@ -260,6 +276,8 @@ static Property armv7m_properties[] = {
>      DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
>      DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
>                       false),
> +    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
> +    DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> 
