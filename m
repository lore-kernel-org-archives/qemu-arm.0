Received: by 2002:a17:906:b80d:b0:9ae:5796:d6c1 with SMTP id dv13csp798179ejb;
        Sun, 24 Sep 2023 07:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcBYkE+NiqGcatrqEPS60deO+UMUOj1zPgS0I6ZMxxUXSuZiDwQuBUdODot1Dyn0hTlAxQ
X-Received: by 2002:a05:622a:3d4:b0:403:b4da:6e53 with SMTP id k20-20020a05622a03d400b00403b4da6e53mr5931806qtx.44.1695567477780;
        Sun, 24 Sep 2023 07:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695567477; cv=none;
        d=google.com; s=arc-20160816;
        b=0dBUv9rYCSFLlxM5BZcyw4LLkqZBV1YJGEfY06gepKBnC/uzvTDtcTZYHYV4/qWgGN
         p1S26jazseGZuqsq0ZVxqwFKY6xvmr5RLb9J0RL2+iLzI8pVwqg6D9XAgpt+Q3xvwjLP
         nzzC+hdFhxyyNzFBdJ+O3lw5K1UEEOeAvAVhILzKyrXo7poVZez5v8q3lqkijFhVgvMA
         HXYaMYvhmk7m/pW/u47u9BLn/bf7BSbJD2PuPBTPIaQK3rEe6Lr8giC/X7o3U/OGxSev
         3icmFzIvz6g0C9+ln0u7yNfONqev+0cyCT29dSindt2dQfjLTTpC4yd19N1t3ngdKuiN
         /QPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UcZcMfrbmOHyaV1oGmDgeTnYK9FIoyarn8ThHTcWbo0=;
        fh=MKvEl5Dqf0X3NpnYvSQYgJcpLJkVvhv54SSWkojjKxU=;
        b=CDTR4Okfk3HgOBrtoVtbFlmRnugFXPoopRU12SOwzxkCmKnbIooj3igAI6PRx0EKO8
         58v4EsvnatL71/oa04iVHeBzFv1UYymxDF63HgK9aqoR2JXVFpn9ewcc4LvZfA7QxJyS
         k04aw8ON822NdW/sqCiIl9cbnnsalSzvenMD3CsgSNnpIDOAHjRCSY9Itbqajj+UQZOU
         //AGSWJwZ0ItC3m1X4wTugJT+iQwOeYyy2mVyXmFQx67sPClYJDdTaDU8LM1Ah6iu07L
         izH+1MTuzpg9TNTUxM7n5pCGcns11rVqFUWd9aEC8n0mb5QUxjxcjBPlp4hUPWlHuYVF
         YfOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5wmqHTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020ac87f87000000b00417cb594116si4816279qtj.784.2023.09.24.07.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Sep 2023 07:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R5wmqHTu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkQYD-0004ML-2n; Sun, 24 Sep 2023 10:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qkQYB-0004Lx-BL
 for qemu-arm@nongnu.org; Sun, 24 Sep 2023 10:57:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qkQY6-0006Ce-3d
 for qemu-arm@nongnu.org; Sun, 24 Sep 2023 10:57:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-404fbfac998so54908045e9.3
 for <qemu-arm@nongnu.org>; Sun, 24 Sep 2023 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695567448; x=1696172248; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcZcMfrbmOHyaV1oGmDgeTnYK9FIoyarn8ThHTcWbo0=;
 b=R5wmqHTu3hiODGv5rV4DDtvN8a9BYpnEwpQXY3/GkMrINUgN/1bXmYvMyH2LcnluFB
 JHklpe9ZCkgD9cPA478nwzdD8x48YjJdfU2IHrZ1cz3/CmrG3lyXcd9lNn16lJu5EXUU
 w3muBV865iWvm8YdVb/3T7kKyFXbRoNa04l8mVgi0ndTpPvxX9PLxqRJhTGjSZyXe5jF
 BJdlMCesBft1eE5I/L/mfX0NjBfq96vHX9dQtXh/GneD/TuNANHFHRvx4Xk+KL+aBk58
 zW39Y2CXLYoU0V3+B4Ume3m1ftppimtAKx6COkAga/lg7fD4ZXFj2OEX3MgIxCAg0UYs
 DKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695567448; x=1696172248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcZcMfrbmOHyaV1oGmDgeTnYK9FIoyarn8ThHTcWbo0=;
 b=swvPQhVBA+xniXeJFb78OOvQkktIc9VERrgmd6MBhn0RZ4/7au1K/UtVhLLbCBvXMq
 uMr/CCEu4nwJv8SwdECU4WueA82QTVglbCqJn1yp4u/bZUb1S98kfh5cx4vWdSbue5Ji
 ayrENJVlJxI5L5N68x46gRolytTKLkz/tB2TQqxYb26AOmBE9iLHxKfEfLo/UQVBzkY0
 REBYgT1krk6wm/n9E7tHNR2i63Ay/n4R4hG7wrT16pzVc7AUzdzuH24+zIuXK1Bdn/Pq
 qT/98zkLFrbcZ6VsCnAtw2CV2fETQEV4FTbKnzf7+HL2m95W5PXAks+Y8PwscysCKGe0
 dQRw==
X-Gm-Message-State: AOJu0Yz/T2MJIKPopZeAnvqqKfPAwaDzAq/2CRkvCwgRlQoZgqRmZSFj
 3rwelNDaGQ7Fhx2GPhFmxg+eMQ==
X-Received: by 2002:a1c:f70c:0:b0:405:1c19:476d with SMTP id
 v12-20020a1cf70c000000b004051c19476dmr3656299wmh.39.1695567447657; 
 Sun, 24 Sep 2023 07:57:27 -0700 (PDT)
Received: from [192.168.69.115] (and27-h01-176-172-57-73.dsl.sta.abo.bbox.fr.
 [176.172.57.73]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d6b51000000b0031980294e9fsm9445720wrw.116.2023.09.24.07.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 07:57:27 -0700 (PDT)
Message-ID: <1a6c49b1-5e5e-481d-96d8-8c08d5aefcdc@linaro.org>
Date: Fri, 22 Sep 2023 20:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] aspeed/i3c: Rename variable shadowing a local
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <20230922155924.1172019-1-clg@kaod.org>
 <20230922155924.1172019-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230922155924.1172019-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CpxGmBs+8mRH

On 22/9/23 17:59, Cédric Le Goater wrote:
> to fix warning :
> 
>    ../hw/i3c/aspeed_i3c.c: In function ‘aspeed_i3c_realize’:
>    ../hw/i3c/aspeed_i3c.c:1959:17: warning: declaration of ‘dev’ shadows a parameter [-Wshadow=local]
>     1959 |         Object *dev = OBJECT(&s->devices[i]);
>          |                 ^~~
>    ../hw/i3c/aspeed_i3c.c:1942:45: note: shadowed declaration is here
>     1942 | static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
>          |                                ~~~~~~~~~~~~~^~~
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/aspeed_i3c.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
> index f54f5da522b3..d1ff61767167 100644
> --- a/hw/misc/aspeed_i3c.c
> +++ b/hw/misc/aspeed_i3c.c
> @@ -296,13 +296,13 @@ static void aspeed_i3c_realize(DeviceState *dev, Error **errp)

Alternatively:

-- >8 --

-static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
+static void aspeed_i3c_realize(DeviceState *ctrl, Error **errp)
  {
      int i;
-    AspeedI3CState *s = ASPEED_I3C(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedI3CState *s = ASPEED_I3C(ctrl);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(ctrl);

---

>       memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
>   
>       for (i = 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
> -        Object *dev = OBJECT(&s->devices[i]);
> +        Object *i3c_dev = OBJECT(&s->devices[i]);
>   
> -        if (!object_property_set_uint(dev, "device-id", i, errp)) {
> +        if (!object_property_set_uint(i3c_dev, "device-id", i, errp)) {
>               return;
>           }
>   
> -        if (!sysbus_realize(SYS_BUS_DEVICE(dev), errp)) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(i3c_dev), errp)) {
>               return;
>           }
>   

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

