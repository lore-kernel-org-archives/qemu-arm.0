Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5765448ejc;
        Tue, 7 Mar 2023 02:20:55 -0800 (PST)
X-Google-Smtp-Source: AK7set86ju71NsV3LxHrCdXdDQraTcCS8JK5Nl3/jhBPJFlqrHEc0yG5U+WEy2qTEcKXsO6fpFdX
X-Received: by 2002:a05:622a:14e:b0:3b9:e0b2:9a49 with SMTP id v14-20020a05622a014e00b003b9e0b29a49mr22970758qtw.60.1678184455708;
        Tue, 07 Mar 2023 02:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678184455; cv=none;
        d=google.com; s=arc-20160816;
        b=QfFolG5wEJkdt7/X+9aDISYcfy+dl9WZHDt7QJAP2sAlUwAl61VX2sPvX2oSUWjFV1
         FSz6gab2/4atLVob4vmROX9fQcI8hiNKuajCr9LCaOppVbQqfqw0qm4xmEZkg7M9CyHd
         JoN3p1RLBh6Ra0ois5gD/Zwxa727s/qCEDUVq309jCLIyGufYzlaSaY+YdpHAdesXXov
         C6mM1lcrVd7RRoumqKnSbiurawG9lezBFcRXGpBE6wndJOR2gAlxiw7NDkDGdKs82VDK
         4M76e56Wo1F2fCm0R9XqfNU58c8xTx3gOnIio7aB0WTZCJvqiItyO6j7eORLroSKL0Tp
         G0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
        b=VWnz7MH2vOtsOSsFFBQpxr5FprwiL4ovbKYMzslXwbDOSnLOPQOtW9DVoWz5RPhj1M
         uVYgppBJ2MwCHAbSzsu4oodSx9Rp7jBMlXY0xBO/JgJeFKd55I+IguVI2XPtQAYFjMda
         R6YsHZi7ARGZ4tJexuSWk3HM7LUgsBNL4Jby7IcHnMKl4aD56Y2L463ATGsLBSffqQ8X
         7UcRYP1bNkEUvl6QWIhu7IKEYykWmhgkshKGqd3vvsDwhRFb6VZiZy3Q1je951KF0oR+
         Zell1eJ2zfJFz5L1b7ZqE1rZm6DDOXz9I439M0tKQYUyMoVFUDJ3PbG3kUbPsgDmx/2f
         SRsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S353QH+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020ac87fcb000000b003ba31a4972bsi9468070qtk.532.2023.03.07.02.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 02:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S353QH+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZUR1-0005SI-Ga; Tue, 07 Mar 2023 05:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUQz-0005QL-60
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 05:20:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUQw-000342-HO
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 05:20:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so10038369wmb.5
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=S353QH+KJ7rJoyMNiMkT3JIQSA2sSPJXFpRZ8B/7xjBAlg8ytrmH56AdLtnlXGOlOK
 Cu7p3DjNzsDHPthTy1mXNa/GJMkt1Zr1Dbb2bwQvKuYfSgivsSe1LpratZBKndaUrFnC
 0KvwNR+sPU6r6Te7yiDy57kJ7nXM04XnxtqjeP2CB9veBXLYWZ/p7ogd1hmNk6A96buc
 yPcE6Am+6UFbDzhiwdgyXiBFNBrvcUFkex2ksXa4uH7PVcbNA68gySyh7Sp1pHLFQFmp
 n+Mk5k+Q/PuhXXGjq9y4Qe2u6rAO7MAwHLgDKqJ+kqhunIGigQB7+0Lw6iRzbnuRP4+p
 faRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=vMqbLohA7g82GyCX8Bjp+YB7vIMz4DPmFYJ0xaZ0tCqh8wpMBGud3fein7Uk99IG+l
 3nAE81K3B/MQUYGfaXh9016MOwIbmUNOaOeB3sCxaiMup6ASUgjnjL4j7vhyAPgT48jS
 REuWUdo7AxRyLcYfrUwuE6lxc2Fd8SdonXhJ3cFM9CWpgcmNF1gS871YsDnEBFVLlBH5
 jv9FtlsCLWJ6u1O7MLgUoFxLAGM8MmoeUGiHV4zd6e/ZQ9Rmr+Egxp3oJ2UrL1RFntGS
 2vqXYawLI0Tbg1rnSygd2PVI+MHsmuV0tZfm28cWZafAofzlGP8x3sC/4wXkT39K+XN+
 GMdg==
X-Gm-Message-State: AO0yUKWb9VbVhynu83qkjRoRPrLXp5PA9+8LS+bgliNFdnxZc0BVg1v6
 dETHgL+2rtZ5ZP9nVZLxLwUzOA==
X-Received: by 2002:a05:600c:1c12:b0:3eb:389d:156c with SMTP id
 j18-20020a05600c1c1200b003eb389d156cmr12138843wms.37.1678184437232; 
 Tue, 07 Mar 2023 02:20:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm12199678wru.75.2023.03.07.02.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:20:36 -0800 (PST)
Message-ID: <47807f32-72e5-0b57-ebf5-620149a0895a@linaro.org>
Date: Tue, 7 Mar 2023 11:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
 <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
 <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: k8QFA1wWgdaa

On 7/3/23 03:24, Richard Henderson wrote:
> On 3/6/23 16:19, Philippe Mathieu-Daudé wrote:
>> On 27/2/23 06:42, Richard Henderson wrote:
>>> As required, allocate temp separately.
>>
>> Hmm not quite accurate; this patch contains functions
>> which don't require separate temp and belong to the
>> next "All remaining uses are strictly read-only."
>> patch.
> 
> But they're all renaming, in the similar contexts.
> That's what I meant by "As required...".

Ah, I guess I get it now, it makes more sense when following the
subject with this sentence. Patch content is fine.
