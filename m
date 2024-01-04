Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp196030ejo;
        Thu, 4 Jan 2024 08:36:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRLDyy0V5BU9MVWhsQ868ZQYdaRyUPF1SKvlCoTax7TCP90951gktb/tty52jqTa7DyAc7
X-Received: by 2002:a9d:6284:0:b0:6dc:35b:b434 with SMTP id x4-20020a9d6284000000b006dc035bb434mr843672otk.51.1704386212112;
        Thu, 04 Jan 2024 08:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704386212; cv=none;
        d=google.com; s=arc-20160816;
        b=NjOxHC2zYm3eXC45QCS15VjoWPW59F7KyVYlqC6lM1DtuEyHZUTIphXC50E4otZlPz
         Om1OIxPsyxExN1bUMHBNcizPHpHbwm3i8tyad8iC5G2CCnPjjCQnHJFzgFLx76knFF94
         KXHi0sMAsTluKIODuLqm26hOoDW4c8rhNimGlAIE6lJdNQFTFNPT2OiXwBfSNwV0Gon1
         8epncHsKXBHt9RKoUntAFZuAyUTcx4G25b0H14sUxpaJDELSsH8f/RO8yhH3KOcpRr+c
         jxhhihK9ubK2apxxAuDLeW7G3njqofuI3SGfu5k/NHn2IEkrfsDm+m032vViqhqr7/tz
         W+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fCEdlFQgTfhi304D/CI1xIMqPWs524/Tf2DNOWvo43g=;
        fh=RGFwmqFYEsE8YnnaO2R5bl/LmBV+/naqIxNdUH6kSHw=;
        b=hRfzm/JX7TC7Mg6LKA9VxLXPByqJiYzTHATCA0W3EU100A2NmXrN4nEHRzxMF71ZIW
         o4LGv/7HbeGNh+s+9XJQy11Q40HLLjYWuBPia4vVWtcs/QhfOTQijwxmgWG5azbeVnHI
         9T8BBD4fDbVf1UN2f4TbrtGG757wtzH0zs6Uf+xTHi1mYg4BOV0TRqdtDWVOSdakyiw3
         Tf6MzfirSZHWKUobezuuubKtOyuppi2voTKyYLRd57fZwT8DlvKfK05oqkO5SMUZw/on
         mELHHo7QoRepa/uLhzxpanpaatdoNzjNhsk8rFQZK9MGKNwuUhZ8bN6VJ58r9mSTJJfq
         8zow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPdwLWeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj8-20020a05620a190800b007811da98aa3si32804835qkb.661.2024.01.04.08.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 08:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPdwLWeJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLQhb-0004Jl-DW; Thu, 04 Jan 2024 11:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLQhX-0004Ip-71
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:36:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLQhV-0005jG-DQ
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:36:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d5f402571so7405195e9.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 08:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704386167; x=1704990967; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fCEdlFQgTfhi304D/CI1xIMqPWs524/Tf2DNOWvo43g=;
 b=xPdwLWeJ77ndTnWgBwEkEULvlspXyJQTjsOrsN8QX6Nk85YvS2uOpQuD/IG+f6NReQ
 FYUyoJW3fZRaorlKaRZf8dGvwmXNpes5a/cyflpmnjb2uGXTTVo4iE/F3zAToaEIEBFy
 qWvAFRtBoDMs5h3UcegVaNOkd72K/+gPo+U6aXtgrRJRe0L2xEP4V/qmiQnps9vYJcw2
 663SialaIa1gWeZ/y7M8dYhk5oPKosWjomQeZxEYkbrQe2tYfUqOoknxcZCSeaAUFOkZ
 gtN/M799sFDPeUpo122K9Rq9elmssyoDqmqKdKxmqYAE8atlA8SKdREc0bnIUTiQQgCc
 /8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704386167; x=1704990967;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fCEdlFQgTfhi304D/CI1xIMqPWs524/Tf2DNOWvo43g=;
 b=w/mg3P+VthvrBi0l7f3pVTR0zVr2E2FwdkkWACtfrkak3ezRCJmTW6s2/ApELOw8wn
 H+ghfDH3ntr2PKJGFd10mJtbZ1qqnwtZTPOYMiwj4LwQgcbe6G+glwJ0/LA+d5tZ+AE8
 43UcSpTzpfP+7120FV6pkc34Kd9X8AiVxmXtqPp0SH+QpOEwuznaJAOgBlO7H8jn3SbU
 768QWhddJncTDGClLnXNEB8BUO7JSpRJCjIvNMWJ0haqpF1LVnC72j3kKx9k4vkXkd5C
 B4+j4GLLnG9bkD0wJxKmQmLkAz8pxEKAnxFu8O3Rfs2X8pXbG8Hq4R0SnAuorTK2rgih
 Sobw==
X-Gm-Message-State: AOJu0YwarXI6g0H/RLIRlawu40SCCry3O2OlfAVljVRXYg+UD/dkLwpN
 SQuHBZP5xO8UhCLgDzDWtiLplxQKaY1ypQ==
X-Received: by 2002:a05:600c:539b:b0:40d:3d92:a01e with SMTP id
 hg27-20020a05600c539b00b0040d3d92a01emr402131wmb.230.1704386167484; 
 Thu, 04 Jan 2024 08:36:07 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.232])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b0040d8810efc9sm6222191wmq.17.2024.01.04.08.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 08:36:07 -0800 (PST)
Message-ID: <2a2e84ce-c8a2-4d4b-bd09-01fe50b3e310@linaro.org>
Date: Thu, 4 Jan 2024 17:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: add cache controller for Freescale i.MX6
Content-Language: en-US
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
References: <20231219105510.4907-1-n.ostrenkov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231219105510.4907-1-n.ostrenkov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: k4/NOwhVhm1T

On 19/12/23 11:55, Nikita Ostrenkov wrote:

Per "i.MX 6Dual/6Quad Applications Processor Reference Manual, Rev. 4, 
09/2017", Chapter 2 "Memory Maps", 2.2 ARM Platform Memory Map,
Table 2-1. System memory map.

> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>   hw/arm/Kconfig    | 1 +
>   hw/arm/fsl-imx6.c | 3 +++
>   2 files changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

