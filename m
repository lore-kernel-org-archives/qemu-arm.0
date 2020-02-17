Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5339528lfp;
        Mon, 17 Feb 2020 10:56:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/K2s8uBgyqRmUXTN/VRBK3e8U+6BS16qoWjcB4gQLqOS99M+jrmJ6dK4V0ZMTJGJACgZU
X-Received: by 2002:a37:9245:: with SMTP id u66mr16098487qkd.102.1581965809315;
        Mon, 17 Feb 2020 10:56:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581965809; cv=none;
        d=google.com; s=arc-20160816;
        b=YviBAesg2LdQgb1gJGi5yYmJQ5P80fDxfhLzM3BfXgV145sJb9kjc15Y1iJ/U0Dg2S
         Ga3S0d+f0K+r25pJLDIVQ8I2MGvw6sw86gWZ8pyeSWS5erbtDmZDf8ktVPfVfIa+aqaS
         O8guqeqkcfTs0/yepXY2Fj8eHV3bxvq6aRZOWdiVWNPxmAgkJTGQ22uEmv6nTdOTqDIS
         izrwg7d7Ly4PtlGQlmDQGeGAUdB5zhG7kerZWcT6RdBBHCb6nnC9/My+fH953RgtXzQA
         e+6i3QEeAuR486p9mYx3DlbinnrWg8mIzG81eM2nKDE7Kt6/FetWyw7bIh3yfm11HQ5y
         rHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sQ2ZgNtBw9V43GtXo/sfTz7OE2ZgJFYbShsu0RSvMoU=;
        b=Rt2CAn9zmyDr7uWfTbhiUk32nQ7Nj6SBjuaojYAQTYyxcvP1TqRtZjHCze+9vFcf3j
         sw5Lzg7HsogDas/O5LP4xbOM79v+9+MR5DxI88PvOufkejHSh9KI89VraczgC59Nspxs
         QaeGMbdHVpjOWtV9SIutClD2d1ajCNC15+CHFKgL1p4hlR6xc/X//8G0U1tfI4pzWREA
         S5i+dRbaR+vB2SEJQinMgO558wdogzMeYjPCWwvbjpvIJ8AuPfyXIo3sQQi17K9S7l/j
         IbnEEwFje7GtiQ2gMRl1t66n7YSCwOqokgqfLaG628eF94M/k1MNjYFV4kUSbI96+e37
         AyFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S6jpJeBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si678737qti.2.2020.02.17.10.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 10:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S6jpJeBM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3lZY-0005TN-PF
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 13:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lZQ-0005Sq-Gi
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:56:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lZP-0007Us-IK
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:56:40 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38005)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lZP-0007UB-BI
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:56:39 -0500
Received: by mail-pf1-x444.google.com with SMTP id x185so9366887pfc.5
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 10:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQ2ZgNtBw9V43GtXo/sfTz7OE2ZgJFYbShsu0RSvMoU=;
 b=S6jpJeBM67IyRAXTM0Fg46AbLRjulpXvRdxj7MUPFAqmeNM0GvccQ5Lkm/zKoop0f9
 b2mkV5RpyEoqtMqVsdxc0QsN/fkbDWyvPScrAjf/OHh+fMJKpxsrlmFt2Engn8B5ovzj
 67POrqic1qB6eZb0tLn9IwUyxJkVOcboVveiLOCSMFWPhrdDzQ++OCAs51cyAI/sTxuY
 +e/aS0UEfduRHmZr9v9LhAX1T+caOnt7shoP+DvJymRn4cq/WZ5uebDSJzRm8SVXbFXB
 GZiMSvCb0QfLXxA6x0hi0dVMDcquYuYNdSXeFYvgL7h+64VbpFozgatEVc8EyWznK8gk
 PrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQ2ZgNtBw9V43GtXo/sfTz7OE2ZgJFYbShsu0RSvMoU=;
 b=eTPAIGV1SuxPkYVp4IswQqof/1A1Xr8Qsv1tFQYHUQJQ59tpRIJVcynPhghHBmdZvL
 LqvrTDXlcgFGOK1x67pFXG4wU4ua8IJdZWByZBvF8KiSOyXHqQRgCWNCOQyKBPe40Pfw
 CPdPfMM6X0dnzFxdQX7+rJDHQm+2Kx8aHw+SLnsucakeos59dOGVpPTDY3tq1DlSaYOm
 ZpQpjZzLPYdrky9qm8jfyjsxvpIzk7AK0WK13GgArTYJ0Ou5poYj6E1snqF4qv0mDqAc
 SuTraaaQU7nbFtafphYtf5jyjJATRiKtu4UFevtmgOjVuDS8w+Ar3A1cXXTyTE8MVYtX
 qtPg==
X-Gm-Message-State: APjAAAVIhvB31Mpei2ewpUIbgM7Uo/RvxiwsILfRTS2p90s7ApocpL4p
 hvweYxLp3ZrqOIo6HnR7apOvMg==
X-Received: by 2002:a63:f94b:: with SMTP id q11mr20039261pgk.161.1581965798204; 
 Mon, 17 Feb 2020 10:56:38 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z10sm2919pgj.73.2020.02.17.10.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:56:37 -0800 (PST)
Subject: Re: [PATCH v5 15/79] arm/imx25_pdk: drop RAM size fixup
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-16-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77939c6c-3781-a016-d023-a9aa0f580846@linaro.org>
Date: Mon, 17 Feb 2020 10:56:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-16-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 jcd@tribudubois.net, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n0Ndk1lQdEnw

On 2/17/20 9:33 AM, Igor Mammedov wrote:
>      /* We need to initialize our memory */
>      if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {
> -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
> +        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
>                      "reduced to %x", machine->ram_size,
>                      FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
> -        machine->ram_size = FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE;
> +        exit(EXIT_FAILURE);

The wording here doesn't make sense anymore.
I think it would be better to mirror that used elsewhere:

+        char *sz = size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be %s", sz);
+        g_free(sz);

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
