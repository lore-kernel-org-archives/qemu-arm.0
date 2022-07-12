Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1398792lfp;
        Tue, 12 Jul 2022 04:21:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTprsCbJ2etymIO2EW/VgSYOOt0gATel5HNdvUU9NWAolS4q7ZrswTFSQcGcucez2kBV1A
X-Received: by 2002:a05:6214:2aaa:b0:473:650f:7c38 with SMTP id js10-20020a0562142aaa00b00473650f7c38mr8744966qvb.19.1657624884912;
        Tue, 12 Jul 2022 04:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657624884; cv=none;
        d=google.com; s=arc-20160816;
        b=h4CRTZYa9T39q7BgfGADTzZjcy8ZTDCqn8PoaTB0CVm/f4VacnnfC/rTFM/9D1bP+B
         JOktDz0TiRF+D4cDAxvct6vho911R+5WEYxjAAwl7/vVU7p2SR56F0Co9Q979Fhq25gE
         AzhWm0gmsAi30MriYd02V5dy7p4Lz33eFt53hY2lhZx3UvMnIna7QHg5rfbBaW53L6l6
         Qxjp0HXyGIdeo9BJvlP0hf9D6tQAfMOpxb8jAr7wR66twjvpWBlSNXFytflbvVjsqGWb
         dLqMYSyLjlQ9JdGR/fxx3GoFwHkvdUCrI6hM60uECc0l+5rY1fa8RxkE4RacByGO/UqY
         qiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=AfkHLRDntLmBPAwnu5NphzHYNmuNUCYNJnXC+8ofARk=;
        b=VTBZCQQLZ3kzkjrv2B9+DoTnROgdEK+ZCaBZIDgbXeGK0RC6ODE+64TBLhNIbmKAb5
         HKIGx7a7cEhUAi1q4qu2s9A+LBUSa/Am6GJdaJsTbh6GYt9hctXjTuCzQ3arQTNcBjC/
         yTQjP7PCbjwwPbvJNpWGh04cX9TDzV3kQxt7EWxHjGh36xJOvWUrdy6Yk7mN7zQ0OnFU
         iFTXl6zLWElkwWYAK8akWWyXoroZrpIKDNRng7gi4JaVScVX5qmzrAdzmbBL1cpZ/cZa
         c0yw52y949Ko2qlXxT+CdPBww6yzdach2jzERxrWpF2VgcW09Pl6T7mkUETuJ2//uGSo
         P/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ac84242000000b0031eb01ec736si4525814qtm.332.2022.07.12.04.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 04:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBDxE-0003MW-7l
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 07:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBDuT-0001tw-9L
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:18:33 -0400
Received: from [200.168.210.66] (port=2792 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1oBDuR-00022N-8i
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:18:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 08:17:21 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 08F33800146;
 Tue, 12 Jul 2022 08:17:21 -0300 (-03)
Message-ID: <4756bbc6-922c-70b7-5311-9e81dec117c5@eldorado.org.br>
Date: Tue, 12 Jul 2022 08:17:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RISU PATCH v4 22/29] ppc64: Use uint64_t to represent double
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-23-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220708154700.18682-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 12 Jul 2022 11:17:21.0274 (UTC)
 FILETIME=[F46285A0:01D895E0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDIxbUpb4T4g

On 08/07/2022 12:46, Richard Henderson wrote:
> We want to do exact bitwise comparisons of the data,
> not be held hostage to IEEE comparisons and NaNs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   risu_reginfo_ppc64.h |  3 ++-
>   risu_reginfo_ppc64.c | 29 +++++++++--------------------
>   2 files changed, 11 insertions(+), 21 deletions(-)
> 

Hi Richard,

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

It seems that the series is missing some r-b tags that Alex sent in v3 
(e.g. https://lore.kernel.org/qemu-devel/871rm590sg.fsf@linaro.org/).

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
