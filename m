Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp14674njj;
        Mon, 28 Oct 2024 21:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuVf+i+17U6cSiN61e59roxt3/kn44ouLdtDsfK0f7b3F0YnNi+8vMHXI5/LrXf5dqhX9mG7D1KDcQMg==@linaro.org
X-Google-Smtp-Source: AGHT+IHcBwuqnwI2mjQ6tNxDTdritgiUvknAORm6Gf8OGo/GFq9KvzrnWL1vlpjKJw6mjhidwspW
X-Received: by 2002:a05:622a:2cc:b0:461:4a75:9679 with SMTP id d75a77b69052e-4614a759af8mr93107441cf.60.1730177967893;
        Mon, 28 Oct 2024 21:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730177967; cv=none;
        d=google.com; s=arc-20240605;
        b=VwTbRYu+yB2Hj2qeEqVmUuWNJSdx+g5DoNYZ2hWCI/tvL6PDbgh9reHyihfIwA5WE1
         gSf3LunHrc7a7nlKDVjpO6lviziYvn5137mHklPrzQV5raZ1gq4lyzrX8N3Pv5OkrUlF
         pE5ViQcscrt3N4dnAo4A5MbV80pDLUe+qOoxD3A6jScNXXCihzM/wHpzu0RNttQX1D+O
         LCG5ik2BOYjTBFVefE+AOT0TBpcL5m5y3PA8fBjv+S2T7eh5p1KHP/yaOXItmtWi1QsO
         Z2T+NBk73nYhQaPtMTkBOKTFWqSrPrp8ejVDQbzk/C6M4KUUKlJDX0lGjW0+gu/0vQN+
         XyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sYGwB7KjbyyWhMNOuKKcVBiqCuLAsdAcvRtaKrppj+I=;
        fh=8PQWZpD7CN66vMuQ3caA4qm2rr/qrFHb6ENw2mFPjEM=;
        b=PxfIDSJT4ILysioD58Vq1qBkX96iRdLqOvjvw5G91biecDFQkY5mBjmUzlBxxMTTqO
         Hk614NyhmQgrSAE7q6GMGWmNzWCsUaeFwizIiY9DfWPc+ye0n3Uen9fhqvwKX4oVAaR3
         XQoUDxyni9QrOFkYgho/9smUA9VcLg/0BQGgp3DSkAzfYs6NuUXzur27L6FyLwpL8N45
         XTDyb8RQAMh4ABygHy3iWOpVQVk0rpsVSBahaV1lPnnAyPuPZoLAm4zUf4bflOwouWFh
         b+v2I87eTXuJuSTLo3ZC6/LKeK1DER4uy/mrsx9s6TvIvpK90C15Mja+krHFueWugPBF
         h0SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOieteyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132392fe4si97596611cf.493.2024.10.28.21.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 21:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOieteyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5eJf-0002co-CM; Tue, 29 Oct 2024 00:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t5eJe-0002cU-2Q
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 00:58:50 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t5eJc-0008Hc-Fc
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 00:58:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7ed67cfc1fcso3117787a12.1
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 21:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730177926; x=1730782726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sYGwB7KjbyyWhMNOuKKcVBiqCuLAsdAcvRtaKrppj+I=;
 b=tOieteygZ++ECFOz5lU2VUsU80GHr+ujBk/gMyL3+6OXEYCiJME7H1uf/2ZD/NrSK7
 V8+WA+1Uae9BG6s6s0YU9d1h1ob1K/rWNZFQjt19hQAUxVxsbTf7RmUlCuyJgOJ7VZJW
 cKmTlLBOBvEDnYqF7poXOn+P8o4wiFq07viUpJdlvnvaYMyDXD1yhzyxmVdCZuLQSuQE
 RbsTKhyHZKRllvLVtMYZkMNpn0EDCf1UNPlLn9lxcs6pIbgDVeM51+Rm/Iql6ltmYGe7
 1dF3jF21lJSaHHHAtEHP3gv11rzVaF7Xo0G1MS9nCnjG7phCYODuFRinks6TlQ+RCJyL
 jauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730177926; x=1730782726;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYGwB7KjbyyWhMNOuKKcVBiqCuLAsdAcvRtaKrppj+I=;
 b=UfR+uy+0Ypn5KyZUW3jb5IMM4OcelWijgrZH52gYYSm1A3flB4ptDtHlWGv958HDtQ
 zwoqukiwk9CNaFVgCMk6fcKuJsQUdKZsmawlXTfHqpMGR/jjXXakVaMWq/smsK/HdTcq
 jVg6SySfhC5bdmJ/PQdwMFAl0/7o3xUas/ibQcv8ciiuirC0vSzOfFt/2fXym/ICVqt/
 x+OSmt5fX1SrHO1pTnpLJuJM5l2kDirqIJkbVYd0pZj2ZjW3LJDnP45zZGwhUzr+BnXj
 z/t8j+QOXV6pFZti8cYkbn3CHJNu11e6lsvsy7U0D1b3dFE9LcmJyJxHZ47xroy2qk6v
 Z53A==
X-Gm-Message-State: AOJu0YzkCmhggPPh7m1OWi4Gt8FxpT5eIv/JYA2j2wCk5/9ksupmJjwm
 uMHAmWxzKcSwsZIsL4QpubV2/8CrsiEprwUTkVWH7C5F7Ois2CJtT8JvubYxEUE=
X-Received: by 2002:a05:6a21:1807:b0:1d8:fc13:2399 with SMTP id
 adf61e73a8af0-1d9a842d27emr15500443637.16.1730177926387; 
 Mon, 28 Oct 2024 21:58:46 -0700 (PDT)
Received: from [192.168.100.49] ([45.176.88.169])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057a0d025sm6679634b3a.101.2024.10.28.21.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 21:58:45 -0700 (PDT)
Message-ID: <f58d7435-c329-4961-a461-9242a4e89366@linaro.org>
Date: Tue, 29 Oct 2024 01:58:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: enable at24c with aspeed
To: Patrick Leis <venture@google.com>, clg@kaod.org,
 peter.maydell@linaro.org, steven_lee@aspeedtech.com, leetroy@gmail.co,
 jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20241028181420.1438938-1-venture@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241028181420.1438938-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: u0lqku60y6+m

On 28/10/24 15:14, Patrick Leis wrote:
> Enable AT24C with ASPEED in the KConfig because the boards build this
> device.

Maybe explicit the at24c_eeprom_init_rom() call which instanciate
TYPE_AT24C_EE.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Patrick Leis <venture@google.com>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

