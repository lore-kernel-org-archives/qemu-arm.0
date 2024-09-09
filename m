Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1080944njb;
        Mon, 9 Sep 2024 15:23:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3Hy0b51VKT3+YL5M8AcyjXLT5cC+vVIFSF2ZnJH4DCv/3tPKBHudVfTV3T0+izGUQw6JyAU5sBn4byA==@linaro.org
X-Google-Smtp-Source: AGHT+IEcW8V/CuGJq6W6M40ORU7W+bPMUUG+vIwiOpwILbzEhBBlUMI+Bi6T4QAqG53xdbsZZPLa
X-Received: by 2002:a05:620a:24d6:b0:7a9:b914:27a4 with SMTP id af79cd13be357-7a9b9142c60mr659243985a.12.1725920623665;
        Mon, 09 Sep 2024 15:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725920623; cv=none;
        d=google.com; s=arc-20240605;
        b=bKzbE4KtEQY7hnV9Hayrjkxc7ZEiRVwySH9fwEEf2m7EMt/5zqWlGdtG7MGG9WqswQ
         7yF8MF3ZR9dFLjfwO48DPyMP9Xb3RHeUYaFUnY0E6RFISRli4gq+MmvfzAh3aWIdPben
         ZPfzNa3HtNGuHuIyWQZAkgJj1VVdBlil1YQp+YzB/Xi5ss9mCWzI3QUTVWb6tfZufVgj
         hYtYl5ZD6XaTx4HtPKQ8r1bMLxPZO7tdkeAXJiRm1krUB9stiPWgw46Qej5CmtQE/oY9
         1eBpVHcrlSgsItdw0fgp0JL66yde6qVI53j2neoVspSEf2NgoW611Iv2+OP0BSG5Yek0
         dDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pxk8r8VE6TsU4lhynGt6juAvn7u0BzinDNzJxKZ1O70=;
        fh=6kRp3K1jVRJe/0go9qIIcZsa+Wj5WXzmWLQ1QEnOntI=;
        b=Ii77aA5qG7Oy9na/f8+tDVE0aLPx/snwmQ6D70KpDGHc6laimzQ706o+Fahxg1Whyt
         mqs5Mz/0GzunkzDpP0iGMKuGWKhD1VGuhAn0Ce9UGEHRKe1HnPK/RtnorZU/4doVtaa0
         tZ0txXc+EHeIrFgsEZDt5ZfoYawNyMLfPUOUr/deC80Hbxc0aaeqlvJv6B3k7c7G9/kZ
         QOPLXKD4kSTkH8U8pn8OZycUdniIYdgwWkJOuW/OWNcauJEYyYhaag6u1GpXnOc+gqVb
         dlMgsjwLpAhgs0/j3Zhi/xT+WeG7BljuJC4hz8fe/rVRIaZm0iL0pI4fkiW4ghhXsilD
         i2Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThU39Wju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822e814f8si64766251cf.208.2024.09.09.15.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 15:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThU39Wju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snmnA-00011j-Bt; Mon, 09 Sep 2024 18:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmn8-0000ti-KC
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:23:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snmn7-0000c8-1a
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 18:23:26 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so6326737a12.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 15:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725920603; x=1726525403; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pxk8r8VE6TsU4lhynGt6juAvn7u0BzinDNzJxKZ1O70=;
 b=ThU39WjuJJ81s35J5BoK2pxLv5zkqk4tBnQoyKoeajfw+52ys+jxAyjYlwSJ3/wp+h
 PAp71z+fD9DSDyGIpB+LxLekDhjyqmKrRjLnKK07LMw7SsZn96Xo62OvqR1akF0u2vQI
 YcrzBd/2oxSJ8851pgf8WdjMmjH4vOAFjIoJhJXBmynjoXORR28gzW62dP+1akSMtiBw
 JJ55fLvB4xJ2zKozSJqvh6WKzlwx9aa9t1Gx8oMY74upKOT3hWc7P5XxhVK4KVu4+fek
 g36vtHHB/DWFxLcLq0B6a13eiMTbbQbcuik7uNpDihf0wMJiEEXATSH81PxOY2rcmFFb
 TJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920603; x=1726525403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pxk8r8VE6TsU4lhynGt6juAvn7u0BzinDNzJxKZ1O70=;
 b=t8M1BpwscJJblFAnReaKeC0rTx3Guawjkyz3HHg5p9x2+jRZtMDv/KTtZDTGfIMMYM
 kEzUhzOigDjY+bcDk4Rogt9sICES7E5cIK554nxJcpbv+9vouc5pJdB1x72DrdN8SOtA
 EGvEvxC6c71c/fJEz29O1bew1M+KtlC1h/Mwra6CnDyGejJOJmHfrdQPmEa7cLZDhVNQ
 zt+1JFhQ1zi6AQGspONmOw5pcTtN3fL43lN6+gr9OEESX8/7muWcBAPtxk+eAj4dv3fi
 mturHDLIOs+F644R2biq26OMi70Fq1jpPr/OzpvJYJdNbThl2duKpMBC1AgIqYEl+ecK
 Rb1g==
X-Gm-Message-State: AOJu0YyE5FQHjgkC5tNEGkINpV5Mn9sblihO0Z2z5UNrud+Jo3Nhdr4M
 vRxasjWNJpq/w43RcGPElubfohrvhi5AHm9Ej0DlfBQaHNaOWFASNDIiFf8X3RQeo/mENxQSm4V
 J
X-Received: by 2002:a05:6402:13d6:b0:5c3:f4ad:2304 with SMTP id
 4fb4d7f45d1cf-5c3f4ad2476mr5464187a12.10.1725920603412; 
 Mon, 09 Sep 2024 15:23:23 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468fesm3517783a12.39.2024.09.09.15.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 15:23:22 -0700 (PDT)
Message-ID: <5fa87f5c-6881-470f-b68a-a3cd97d23938@linaro.org>
Date: Tue, 10 Sep 2024 00:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/29] target/arm: Convert TBL, TBX to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-8-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: jJPZObbGpRwS

Reviewed:
https://lore.kernel.org/qemu-devel/37096dc8-7827-4a4c-a27b-4f8343aa9c6c@linaro.org/

On 9/9/24 18:22, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 47 ++++++++++------------------------
>   target/arm/tcg/a64.decode      |  4 +++
>   2 files changed, 18 insertions(+), 33 deletions(-)

