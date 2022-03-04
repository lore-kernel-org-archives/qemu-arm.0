Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp127562lfo;
        Fri, 4 Mar 2022 16:00:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLqlyiJM2/dMAfL1K9HJIxfOwgUsX5IMKChdTZmtMz7sD9sQKRpR7Bea9Bt41f6YahZ3KR
X-Received: by 2002:a81:728a:0:b0:2db:fc30:8622 with SMTP id n132-20020a81728a000000b002dbfc308622mr1020402ywc.146.1646438408000;
        Fri, 04 Mar 2022 16:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646438407; cv=none;
        d=google.com; s=arc-20160816;
        b=01nIaia6Xb/5O3YvlzP8WXdOikwfkuGt24NNYCtKfY7Lob1jhaUbNMDyiV4MMjHg06
         xQ//sUMUg/iPZBU9NETu01Ull8H+aIFHla9Bg+afCjvG8DKUAoRxQAbhMgNg+zoUxJZW
         9xXCy/zxmWUqqSbcx7oOkmSYllsvN0sblDe2Rvp+Vun4KuqXqfNfUfZ0QpK8hOTVyUgo
         ioZfDce3ylEThUeO309o3nnZ54Qf/KwR68dV0UvN3DEWLG1XdBpwTGKFibQ1SfUK4Him
         VUOxXswDcUwZRSqighQIcTL0Cbj7FWNfc/+HQns88JCdHHiPYiTNCrcC7ljOCcBRDwyk
         dbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Jg8HUgsHmnspjlisO/PLGzqG19Q4VuT4nfNJsfczpUo=;
        b=EdGWIRXjUGa1yFPbBSGeHxPT40YFcPot5yGVUST+h6rG+DjbZ/QiP4ERS3DABibuDU
         RvLhHFgYB2b4+SB4/9hVoKVTS4pCYazzQUO7G6eznHk52tyDYCshrByY2V2MN5xGMDy2
         NlN4pv22AEFLUtYgY1oIOMrB6cFzXKlVADBb6a1zCELyERPNStcgsKpTrls2GEYhRR8p
         C8zgNh574tB0GbggpLufXimXai/JZTZIGz4hCz0JrZ5R/S+3KIqKXF0SNAQi1jwDTUy8
         H5oPp1fc8k7BJVG5KkNPLeA0zoLbxGNeA78g3HBT8m831yarWTx42AuZQrgRVADJecR4
         gqFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=jyIBwsGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a25bbcd000000b00628b4ce29f1si4920729ybk.517.2022.03.04.16.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 16:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=jyIBwsGj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHqB-0006O6-DJ
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 19:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHpg-0006M0-OE; Fri, 04 Mar 2022 18:59:36 -0500
Received: from [2607:f8b0:4864:20::42e] (port=34698
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHpf-0003SK-CX; Fri, 04 Mar 2022 18:59:36 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g1so8925369pfv.1;
 Fri, 04 Mar 2022 15:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jg8HUgsHmnspjlisO/PLGzqG19Q4VuT4nfNJsfczpUo=;
 b=jyIBwsGjRsIXg1VobTjkMISx6fQUTKP6D4nOeFeTtaHOWAriVHqVYr2ItQHcUG6MCF
 iR/Bn8PqpQ27Mg/b4fsLZbxd7eqNlmVYi4w5b+RLPO6PNXKacJyvmXvA1VVR/qgHEMLV
 0cevT2Jovyk7IOFMOerAeUN5wh6lo90B2vXhQqEdVAa6VjyguSmxhNWSVGavMd4/oBTg
 Q6ZYG9LsG8Ane7wg6Aehk5aaePQoUg0WqqBdCGwUK8sFZL6jViVcW9q8MdfPUw8r4QKO
 sMfT9usNSjUPltOFY067Jt6ex1XpCwQXHI4BDGdame9BaK23eLI1CUswhaV0B2KmhfyJ
 n4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jg8HUgsHmnspjlisO/PLGzqG19Q4VuT4nfNJsfczpUo=;
 b=6aPKgureyaoJkJpJ7vaTOA23JioukTDORHE6nRZDN5BonTgvY9+P6p3+5ca1KTwVgx
 Blyb3d/Sa/ZSGqExpqRQ6SCDSUUJq6yxUZnwizf6Sgx3FDHqp7bjInc7WzqEQnTH+Q43
 BjEt22yPpF4RyZEe6kM3NEzqNMFCXrr318wU9VenkgcN/lWm1zK/FwvyVRagrMXLNYGT
 qCaPSbP6PcB56DQ1dH3/ExY5B9KgqrgvzUBuZgyNrBvJN9UdWgT5oNUB84TIcohOB8xy
 TmA48Af/L9iqKM/JGnwih3NJFXruf3cQVooy9i6iq8QILrjegbLnMfDuzlqyZNqVrwBq
 QU9w==
X-Gm-Message-State: AOAM530YOgY4SQqnbX0PMGpInCjHSWxyTlRbz8QIn5tqRsg+QEDBx5nP
 +hpXSpplQUA61pMMxk4UGe0=
X-Received: by 2002:a63:7d04:0:b0:378:fb34:5162 with SMTP id
 y4-20020a637d04000000b00378fb345162mr669751pgc.487.1646438373700; 
 Fri, 04 Mar 2022 15:59:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a056a000b4d00b004e1bb6ea975sm6814106pfo.214.2022.03.04.15.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:59:33 -0800 (PST)
Message-ID: <fc68d57c-e373-14f7-a24b-47f1af0e43c4@gmail.com>
Date: Sat, 5 Mar 2022 00:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 4/9] hw/i2c: pmbus: refactor uint handling
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iojAHdNMQ9e7

On 2/3/22 02:50, Titus Rwantare wrote:
> This change cleans up the inputs to pmbus_receive uint, the length of
> received data is contained in PMBusDevice state and doesn't need to be
> passed around.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
