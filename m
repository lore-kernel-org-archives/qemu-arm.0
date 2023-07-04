Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2915155ejy;
        Tue, 4 Jul 2023 06:38:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0cbLaYyCyQAtm8gvue7x92lE99gN0zJrv1oJufKRiRSxLz5T2V8HSG86UrPifJu9bkTdT
X-Received: by 2002:a05:6214:2624:b0:634:3994:13e0 with SMTP id gv4-20020a056214262400b00634399413e0mr17929511qvb.18.1688477936772;
        Tue, 04 Jul 2023 06:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688477936; cv=none;
        d=google.com; s=arc-20160816;
        b=yfP8G1Me6JgQP3dr9UMriAVpD/GaeQWqxnWkucdZtjkP/fsbQrjRbLKd6L2TRi4Ivr
         IfaiKyzl1tX/LzPvWBSHZWvPXPJIJb4fLRO5OvCzu2hT35eTxWVvjmQPyERVikdFtOU7
         GPNIFIk++KSoCaX1hYiQ3PMNwIu3GKsS8drSHJiN9eznST59LvgXVK11BLPD41B0HScf
         zLYoIFEHL5JcPXDH2CsmQ1xSF8na3e5nCQ1Om2MI/GSWHpQ8GNdJM/Wp7g69Pp6UCOdW
         65I2KZ5s3eyfYeUQB+7MvxkZTSNrS+GnlvRX5Egusp1Mdf3uw2vrr4rc//lMY970qR4L
         eFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/auR+vBnOTSzMNHItZpcdNJ69aQsa2SyR4xnE05Mp44=;
        fh=NGQ/BpcDg/aS9EuOOFd6MNuqQ1KYGTKcEs00YeUOX9Q=;
        b=jDXS0jvqqtGdB9YUuTsayMAHuYjjmaOt1miQ+3FQkoNsDj+HprjRQ8NO8GwutIXL/l
         Q0QpAGjiTYM3atMgmInThRE8JehCEiBdFUY+YJWs44wjNJNXzv+xq0fjM9Os9lCKKdin
         mlySKcsHo17UMw9eRV0eKuafK90WQtHgg+HYkw4mMnw2UcSR/gOiK6k94lv8aMHA3kpz
         kY+Q2CyibUUG/WALRkiDfb63mtvRRLsa9CAGrFq5V9yoiPfy2WApqGuLdVeOls50iijo
         5WS2lL/nLHLqHQ4sBZqb6RCtgap+kxb3pD8dimBcnBeeWmhqc0DBKTq5nOmyMaaRHnWM
         28Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PKZZ3/db";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw15-20020a056214238f00b00621257f084csi13440403qvb.156.2023.07.04.06.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PKZZ3/db";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGgEp-0004ry-P0; Tue, 04 Jul 2023 09:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGgEl-0004pb-96
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:38:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGgEf-0003d7-Uj
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:38:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc656873eso68482515e9.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688477908; x=1691069908;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/auR+vBnOTSzMNHItZpcdNJ69aQsa2SyR4xnE05Mp44=;
 b=PKZZ3/dbjC6b3H4ESirmgvISkJ0QsQWG1HxK4cA8/gVr4rn59wEoGs/TwUgJQibyHt
 mP6JoqlQ3msBCwpm8VK88JXd8XgK/zAm2T5EXoEZCzFxsU/C20+ZFx0rXs01/upXhdib
 NXz3nX6vd/PqmKMDkQj9T68ARMWk8+3NHT2gRUrhdAknXbTlcOcWFUAjDSjE8thSJK15
 wGYNrAEm5uSvJ8ofm7lxvK36QcXmWZaIC7RilSGuKDkqY47kwNSZPPqPeWe1NagxV1SF
 UD+newWLcuC3Zk9S9+P7kZJBN65rImGBWYKcw2husQW9HSmBoPnDt1+cL37dabP/NgeJ
 dm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688477908; x=1691069908;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/auR+vBnOTSzMNHItZpcdNJ69aQsa2SyR4xnE05Mp44=;
 b=PKQ8kqKAruAhUQTLTHMy8A2JMRCvcnQda7JWVpXoYurFAuZTOzLhn20SAZuGmmf58Q
 IwodFdzWUtp0asU4gSbamfVfN5B91DgZ75UQFfwocG6VunGz9CSxh6gMd2+kbBgfK0an
 JagqYk4DKxMS4nga8Lja83FV8xe5liQDtR5gdo8UFkfbZhXBWHuXxGQLkvhkvmrfJMwq
 G+D0gNmjz1s5uMZQK5jmURspwBm54H+o5GBVD5kNYzxUlhL/B0NN2fc5HrGY77Jd+Y+H
 Q3Bhrvj/E+2XXlqrVe52bbl5Qs/ZPE4X+IJNe8MApsL6/fq32PBo+Unz7CBYShiTrLan
 0l0Q==
X-Gm-Message-State: AC+VfDxWOjzgldzbJIJyIHVfm6bggYK614zeyVbKT2ICf32qVXplRFow
 RJ2kCVFpKimedUNGJgRyqf+NVQ==
X-Received: by 2002:a05:600c:2145:b0:3fb:415f:a85b with SMTP id
 v5-20020a05600c214500b003fb415fa85bmr17645112wml.3.1688477908464; 
 Tue, 04 Jul 2023 06:38:28 -0700 (PDT)
Received: from [192.168.200.206] (83.21.151.197.ipv4.supernova.orange.pl.
 [83.21.151.197]) by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fbb618f7adsm16004962wml.15.2023.07.04.06.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 06:38:28 -0700 (PDT)
Message-ID: <84a1162b-84d4-6f9d-4594-5ae43fd3c7b8@linaro.org>
Date: Tue, 4 Jul 2023 15:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: add PCIe node into DT
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org
References: <20230626075207.623535-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-K_2SLxbq90TpUyzLpiC0U2WVJe7ffaC_TH66K-=GV4A@mail.gmail.com>
 <b26c98d3-3e9f-331e-acbd-ae0c451e0ed3@quicinc.com>
 <CAFEAcA_rg4CbE1Y9mTQmPs_KBqb-S=3Z5Hh78gbVUD6R7DR0hg@mail.gmail.com>
 <CAFEAcA8mk0upQUqXsdm3YXvRjAJc+6npkXAWWLtHS+3A8bMJKA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8mk0upQUqXsdm3YXvRjAJc+6npkXAWWLtHS+3A8bMJKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5vuC+GZ3qPDy

W dniu 4.07.2023 o 15:21, Peter Maydell pisze:

> Just to be clear about the status of this patch, I don't
> have a problem with the code changes, but it does definitely
> need a much clearer commit message to explain why we're changing
> the way we handle the PCI controller. So I'm dropping this from
> my to-review list on the assumption there will be a v2.

Sorry for delay. There will be v2 version of it. I am busy with sorting 
out EDK2 side of GIC ITS enablement.

> We could also do with expanding the commentary in the source
> file to clarify the design approach we're using w.r.t. what
> we do and don't want to put into the "dt" blob, but that would
> probably be best in a different patch.

Already on todo list.
