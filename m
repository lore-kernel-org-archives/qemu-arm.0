Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp37610ejc;
        Fri, 27 Oct 2023 01:45:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF52Cz1Ped7IVQYe9L0gKQe/9cU9yY6hIiWMruMapsYj8XFqFwvBRcREUSO406YGbYuxX9v
X-Received: by 2002:a81:c64c:0:b0:59c:aea:d877 with SMTP id q12-20020a81c64c000000b0059c0aead877mr1773591ywj.40.1698396345534;
        Fri, 27 Oct 2023 01:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698396345; cv=none;
        d=google.com; s=arc-20160816;
        b=jEIemhJAGXTPd5WsJcML+HF+Kgvdylua5PptuOXdjZf8ulRSQ3hY8f8btmgHd/QKpN
         r3tZ7Cc5h1CWkg9UFnGtc/9jCeXou5tjoWeGsDBujV7hGPyqJ2hXbMp5qtlZyEY09Axg
         weZ+HqcviylttJ7cBE8njiYRNBkmQQC0L3LzCh1keBM5JeJMTfDehANNoSsLqD1XymzZ
         LNpU6OfYj4pInXqYUQ3m7h1xNIBV1WrJO4Ao66Ku6o9EqJWhEkV16MNPTkt568EdEHFI
         /oTPVhHFVKO91x629KL1wKXv+L5PPVpUv6JZcbmarOJfjXZZJcxjpmZwqpm/4KqFM0ar
         xkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ItqT5r2iOVvGgoN0QA6Y9XgFg1+cfQVUsfc30W8vlNE=;
        fh=y8VaYMoIEziqVDlz6pfwdUhdUsRGKmKr3J42OQq4eOE=;
        b=VCTSj/SWleFXG7c/pPPhc19jQXJUiV6FSCIKkGKWjxoguGpwxnIqB4uEs+jBr9/7qN
         UlJudb7tmRGOfdxHHUhMyz8xt1A0sN7TAx9qFpBGDPRCwUAuLW+Uk7XTf/Z8X0ABFr80
         HJQwKH77m3ipnbqX1rW2Pp0njtrHmp3iAzmwnXlTl9V0dsXn0cDSmPj+sHrU5A/FqnsG
         XvhKa1bt6A5+2PjafgrZb/xRIH5GDHfFLjEJSLzfSAYqp2drzsWLY9MF+K2ll9dVzCG1
         6RO3ZsjmkYmqd3D4tuy41pUiDU5LK6SXZiRojz4vJjax37/nz4yucPuWUXILRbeeChIY
         ZRLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVBQ8x7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020a81e94c000000b00592462f74e0si1942974ywm.341.2023.10.27.01.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 01:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dVBQ8x7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwIT4-00072k-9M; Fri, 27 Oct 2023 04:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwISu-0006qz-1n
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 04:45:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwISr-00023E-Cm
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 04:45:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4084095722aso14098795e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698396306; x=1699001106; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ItqT5r2iOVvGgoN0QA6Y9XgFg1+cfQVUsfc30W8vlNE=;
 b=dVBQ8x7LyhZj0JOJcijPEZ604+A5qyR6HqDIyqJKkBz8zcDVEGbmtbhAPGWrrLrqZ7
 F12SzDIdnhTNkiQHKUDgz6ZCuPYEr9nllES1PxeVgaKCjoPBFniPdLeGvz1kgzDTdadu
 stNQ8pN4OMPUs/0V2zP5SoVq2ZTjTD8/WJZF0muMs7TqDoqsMQ0kJALUeMJebv+ifenS
 QL87noq1H2iaxSM14pLpsfxL0lciMipm6IigpnmNxTC0mhFsMt9nS/WmpLvHoPZRqOH9
 m110D/QC2BUHvQg7IdpcDbtrtNS/0DP6N4uMDXTG9sn2DAsW9hbSZlm3Ar4YeDC5ZT2E
 Tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698396306; x=1699001106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ItqT5r2iOVvGgoN0QA6Y9XgFg1+cfQVUsfc30W8vlNE=;
 b=sYT+tCT22rvVe++3tWqyg2NrISY3mMho2YSrxMIWVHZjB6YKQW8Pi7O7qN3HpoIhA4
 tR04IwiDIje883MrGqyq8KT+Zxwxbo9kGJ/IjVlnfECULtaZ8v4JceztD4Suy3rXfTa8
 uZB5HrPUCeVqA1G4cGC16wdw7p3CMdjOrvoD1YCXXYF18AEAheqRbgOg5KY2bPQSgPsF
 oxGU/qGs2fonD5IzWBn4X+ATd1wtyizA8XDB5mEr3U9I35ZlYas8CbP1cFIdEfieCcMm
 kr6wx43Kn/di6ey5XbTNeWjV+a0EcUpWFv18DdvQw2prXhdVw58RxP62+xwmBKVf0G95
 xwqA==
X-Gm-Message-State: AOJu0Yy0Rd0EB87svIaicypgdIwDsOTd+TFHNIAnbwKI7dsR2+z1IJgE
 D5cNQgREyaylvK9kWApmzBoW/A==
X-Received: by 2002:a05:600c:259:b0:407:5a7d:45a8 with SMTP id
 25-20020a05600c025900b004075a7d45a8mr1930581wmj.31.1698396305873; 
 Fri, 27 Oct 2023 01:45:05 -0700 (PDT)
Received: from [192.168.69.115] ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a05600c331a00b00406447b798bsm4498768wmp.37.2023.10.27.01.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:45:05 -0700 (PDT)
Message-ID: <a452a7d5-1d75-622f-bb32-df3ce1b10f5b@linaro.org>
Date: Fri, 27 Oct 2023 10:45:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Make sure that gicv3_internal.h is covered, 
 too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20231027060709.242388-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231027060709.242388-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pnMzFrT2flbZ

On 27/10/23 08:07, Thomas Huth wrote:
> gic_internal.h is already covered by the "ARM cores" section.
> Let's adapt the entry with a wildcard to cover gicv3_internal.h, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

