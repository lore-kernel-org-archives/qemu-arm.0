Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1023583lfo;
        Thu, 10 Mar 2022 03:21:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvsI/Kp7si8roWRHnwXijq2+q28VPQa6ymWruvC+bjExhLHiNA6GbnFCyEB5fH20sGkOWB
X-Received: by 2002:a25:7803:0:b0:628:a8bc:785f with SMTP id t3-20020a257803000000b00628a8bc785fmr3360372ybc.126.1646911311331;
        Thu, 10 Mar 2022 03:21:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646911311; cv=none;
        d=google.com; s=arc-20160816;
        b=GRIyqLk+a0JG2bWJZGBTbJwRabRqrQJNmxmeUG4IGRoMAuUSOdnI4bVhTOQ+m5e5h8
         9TIdiOtCXlCa8zPQ5iqYlZCKBUbKDubEIXsJvt5Omrf0YdHgRN2rVMWaOPW1ENBRJ9gi
         c0ZUg6zFmxbvSnsJzwgMcyVWaAmPdsxgKgkShS4Gcd9keXDoTwubL2dcl9gq3Q6gvphK
         gWB7lD9lMfYn9eXZ2YrkTl7XqOgiLRht7q7Guf/gX601pBtZPT5vQP8zpPbaepgv0gvu
         Iu/DVPArSh101Z/AdiEe+H/NoINKmkqQ2QafKIh/B8+QFQWAJWe4DNvi8b330TPbpdsp
         fZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AkDUsd9f2jJKyhhLCYmTpPnLxE8wygUV2dtn2KQglew=;
        b=THR1l/STOUUdmE4mlZU/rQVRSClbTD+DaiGJNemBzk4UDNGHw9CunPFNbPCCGJ3ICw
         oVAr5pDHQqEp0Dq/LHcEzJizUdQ19CpkPg1/bw4Hgykt9YcSHlIxNwj3egk2Uf06jyiq
         lTZA1cyjDgoVaIv/an8fQktr0zXL6FJJHlnag+2kljVsEvxXw6FJebIDpVeCo4Keze+4
         JdKieK3YT8LGfqzm9kUuxQgLnZgvvuOOUXoIX4K2SAvbfQPDnqWzs8j7BcLbxLlAeHp3
         jrryhTnaDd/JCWLw+I5fccFQDuoZ5lq3AJ2GgLBFc5NLReUUodN/0oEtsMqMunSd5Hr0
         hbZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bSTw1Usp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a250206000000b006288f1238d4si2641204ybc.89.2022.03.10.03.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Mar 2022 03:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bSTw1Usp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nSGre-0005gY-P7
	for alex.bennee@linaro.org; Thu, 10 Mar 2022 06:21:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSGrE-0005dQ-7B; Thu, 10 Mar 2022 06:21:24 -0500
Received: from [2a00:1450:4864:20::432] (port=45640
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSGrC-0006f7-JT; Thu, 10 Mar 2022 06:21:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id p9so7381462wra.12;
 Thu, 10 Mar 2022 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AkDUsd9f2jJKyhhLCYmTpPnLxE8wygUV2dtn2KQglew=;
 b=bSTw1UsppGF7Mg29j/XtJekdRN7e2PVKfWfv3KJ608DriS2nksCu4ECMkbbdcRWlMu
 GdjlPKBL7vQ3Pac5P07XvNIqdszW31y+jD7bZLp21ENh4QTap5ccTv85dQyJoP4eAbl5
 Fjp91TpTkRI2k0yd54kmF/gex8bBDziWJDlMinKhIVUfarDRQP3W/Qwx2wntxFEU0Nar
 s2TRjUYT7pZozK6+W+WkCPuQ89bD9OAEBS/vV64g8AgqP96P+PW/Q4Oi1wvnaHsvFjCR
 FTU5JrRxPImUHqSnn833DJ3hJEslkrVXoX0qpNUl1WhaS/CMax4kyk4TJBTy5rlN0EMY
 D6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AkDUsd9f2jJKyhhLCYmTpPnLxE8wygUV2dtn2KQglew=;
 b=HdsZJ6X2oWlVQ1+PnirKLRC0J1YxrfAykx8IHVWPrE/HUHoCECfwGe9tfSPhZuimvQ
 wI1rI1LztJ5DA4HBgh7XSQbpmDAg0NQlE/rlV9hB4I+5FhTR0SXoTs/16ri7vbXzz/br
 s0mQaR5ReG/ZAkvJMB/n/AUY1rdu26nTFwIWlBUDAQo2sXKsaBumpVtTGDjkNdanRUEC
 4wzGTNBH2kyff/oiMSEy3lTOaJVRJd1EhoyKTJa1tpkGQo0z+3L0aLYW0VYviF5qvecC
 iWaKZIC7ZzaZGWHCZL+ty6/qQ/AS+kOCP79ln2n/nj2Or+2SJ/Ec8A9q5FrgSMdeAB69
 Youw==
X-Gm-Message-State: AOAM531qoqC96NVX/erjGsTQkBRa7gaaMTbBLWib+YjdVlaW1uw9OLh6
 ESX4qlpkbZe4lCmZVhYwRSE=
X-Received: by 2002:adf:f1cb:0:b0:1f0:62ff:bd0 with SMTP id
 z11-20020adff1cb000000b001f062ff0bd0mr3186672wro.53.1646911279847; 
 Thu, 10 Mar 2022 03:21:19 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm4320982wmc.25.2022.03.10.03.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 03:21:19 -0800 (PST)
Message-ID: <b479ce08-dede-9cdb-ebb5-21454f6e35d4@gmail.com>
Date: Thu, 10 Mar 2022 12:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0] aspeed: sbc: Correct default reset values
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20220310052159.183975-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220310052159.183975-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w9PSw4R7tTTw

On 10/3/22 06:21, Joel Stanley wrote:
> In order to correctly report secure boot running firmware, these values
> must be set. They are taken from a running machine when secure boot is
> enabled.
> 
> We don't yet have documentation from ASPEED on what they mean. Set the
> raw values for now, and in the future improve the model with properties
> to set these on a per-machine basis.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/misc/aspeed_sbc.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
