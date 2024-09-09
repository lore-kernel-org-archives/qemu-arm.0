Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1010208njb;
        Mon, 9 Sep 2024 10:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSXEelsPVbpXI8UtAu3IsncKqlT8j2yAd4HAe6vlmRSLegv2sI4Hz2idmpC5WD9pSv/KtzVZwyx9qfGg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYJ9qBCkArdodMS/jL+O66yU+v5KtLb/PjiLJyOxVwUYvf0HwQ9d+kgqzdJBPo/HBMn1ph
X-Received: by 2002:a05:6902:1892:b0:e1a:8e05:4a73 with SMTP id 3f1490d57ef6-e1d34a2769bmr14052330276.47.1725903880136;
        Mon, 09 Sep 2024 10:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725903880; cv=none;
        d=google.com; s=arc-20240605;
        b=cHBeBKv1ubdC17gvZHeDBMfx3nQaZ3zwKd8uOdGiFFpjNd+Q6lvUaknKxlg//AFbLN
         0qnPs67qikeOn1BBGvc0NuAUNxZuWa75AJ+QN/VcbNs/RMzzenDtaWWz81N+EtXdcmSY
         OI74mepGQNS0sYgfgVQcclR5z06Hu+G1ES1Ezq4jW/Nluhrr1lEsi+J+BiNyUejxV8T7
         gRhLTTqX2a5+qFf2vH9MxhJ6WNiRVWGgy6bir7RxC8UZGk5Q48LrziFnDEKXHHW4B5no
         aQLUfiDUUYthLbvISL+NRau8LpTXJvPkLOiL1QD1UPVCFpyJiz6Gev5v8+kLyz/lq094
         vU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WhADs7iqvEaAUaomqK5YQAls8lc0vQdbI/JzKzXPc4Y=;
        fh=XK7Cym0znRVyyljHeLl+/4Q9YGnr+D50+5QkqxYtFec=;
        b=JRyhLCH4NBn6bhAYqOEqCnSNi5MhFigljBe5jXLhRvU+ZGiUbDkofMpCG782fYkxVv
         yyme+WpjulVnfoih76cA0d1WisjazHIK107UEVwVC36wPcFtc7skFMM7k99K6drLWwlA
         e5urMMXdYcWtKpTz6EDdBeHisEt/joFvlvE35Fg6PJcD/ifZgc5/STK2g2dqvTOdhkLr
         7nmzC7Z4n28sAAKVtpP/hvYIHPferEjvpt4ctYBOjB62HAuhsEOAGTOeJQ+RBA40Q6z4
         u/UKmZ5yPSa31DdM5QjdrSirdMcgvhzGNknPciGAde30YijtSFkCRAfknVnKApyguzxw
         8aWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOOgB1rE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e6159bsi60586891cf.12.2024.09.09.10.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOOgB1rE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniR8-0006YS-Eg; Mon, 09 Sep 2024 13:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniR7-0006SE-2s
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:44:25 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniR5-0007XT-LU
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:44:24 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso753647266b.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725903862; x=1726508662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WhADs7iqvEaAUaomqK5YQAls8lc0vQdbI/JzKzXPc4Y=;
 b=NOOgB1rEZ2HnjqtbF5Cmur8ShSLlb6CNkcNAJUhlda2qfihxFkdmsT9UWZDG7QTjAU
 DyR+sWpusYUWSAs/zAYThOy5nkf7CEsouYWjHZZuV8CaKBnGcU2N6usfgT1ZsSow9Nrm
 0rLPOLpGMIZq35k5yi8bldytYcg1QP1QO+rdSvRWDKcu7k8LP5qF2s6po6LkmeRcuOuO
 c7y7oG4wgHAdaA8p/m/sl3aKtxWPVA+Ck7wqQIpLXp6M0w3eqm1gSsgpWokAAZ5CnYC7
 oNkFLb4E9rI7Y70tOsoJmnf0IjsEzQUMroiQhKepiW3YqauXvU7P0i3ItL/BIMPOAx2c
 wwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725903862; x=1726508662;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WhADs7iqvEaAUaomqK5YQAls8lc0vQdbI/JzKzXPc4Y=;
 b=ijbCVKFEoGI9QGQMwrzKWruF4DBUAbnNnvDSZEB42/OuHNW1QSq5Mi11+NT8MxzQqM
 z5SS8Vni+lLN/V0qTSmN7Y5gEm6eP0rIY2yZvX9NvCXFldP92DmZ6EPFO958kLJM7IS0
 vr37Xwdbu3d3DccAUgWkOtYAHTQEaJ6pfaozrP+EF+4BAcGb6kokvDY0TtuIYV7SKmXK
 W/d3Sng3yQ0S4cdXuEUcUq2PRGFzELhRfdTEINqsI9oFSl8cBwYCFNj/detaifBpr5vr
 I0+hHcibZ9TnMiuKjsDmlHZSk72ksu8kcnjIzWg2oPSI7OiwiInAadkpTaEgpxjZ9+Rb
 /a4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4q2gCXFqShY9/DZpqGb+JtH6IxqIR1lvoCYZ83/p2w/wULZJHC+qKnDisEMolpkM6gMMjl5EvLA==@nongnu.org
X-Gm-Message-State: AOJu0YxcQIC8MjYo3NHfc348/LSZNDBHEoyATCHw+4HjGJRL+DaK57WC
 /OcYVO/BMSmC7I+GqBVEsy4D9qmWn81h+KNLv1nrU5HycG7ce0r13zUJzAj9hxE=
X-Received: by 2002:a17:907:7f86:b0:a8d:4cec:fcec with SMTP id
 a640c23a62f3a-a8d731a734bmr53428766b.26.1725903862039; 
 Mon, 09 Sep 2024 10:44:22 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25952c01sm370880566b.64.2024.09.09.10.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:44:21 -0700 (PDT)
Message-ID: <5546695f-a746-41aa-aea0-a39a61a27936@linaro.org>
Date: Mon, 9 Sep 2024 19:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 14/53] hw/timer/pxa2xx_timer: Remove use of pxa.h
 header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-15-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9hrUvteS/Esr

On 3/9/24 18:07, Peter Maydell wrote:
> pxa2xx_timer includes pxa.h, but it doesn't actually make
> use of any of the #defines, function prototypes or structs
> defined there. Remove the unnecessary include (we will
> shortly be removing the whole header file).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/timer/pxa2xx_timer.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

