Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4661144ejc;
        Mon, 6 Mar 2023 05:47:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+I9kzsyXAAO0IyySaWidA8Vqh/sioJP6CK0IWMgCtu+/AEKW61fVoIo+O1J1q+mzLotmnG
X-Received: by 2002:a05:6214:48e:b0:56c:2348:549c with SMTP id pt14-20020a056214048e00b0056c2348549cmr20423621qvb.29.1678110463639;
        Mon, 06 Mar 2023 05:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110463; cv=none;
        d=google.com; s=arc-20160816;
        b=05MLHJDT4m7VHbl2pay6ppHgTfCJY8owfz40NOvAO9MGCru9FBw6+DDHY35NjSKRyk
         TeDgiLXhHAOSXTiBKwh5fTAdjaB6BvbP5O/OsNxOsSyBJvSLBwhuHrvTEOOAvOQCMK7U
         32ITQPiI657YEMfpROleAVa6nwddCeSLCtZZbUcCI+rBBGjk2qCobV6Vt13HbhKou7zg
         hEKXpRPYUvQM98ZIVK8TrZPCf44tum3xNdxH+gkdIeh2cPg6SgWprlYFSpypSEtIqdtx
         K9b1/PIriVn3aJxbfG7G6riaEvmGAU0F3FIwfeaIW2EsIUFGeoQHNx0CQaev4lgZGja8
         suxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
        b=SYAdRT4n0hYpVHBWvivdWufkL6dxpnqcrXehLTCxoEqpPcN5usdy/AVQsQie43xmkV
         mVID1Fn/xINwZbAUvIwM8qwNv6SVJAzFXeYLFXlt/Qcgvf1q3oE4P5U9ji/EB6Fdwsuk
         NdYMWmgs6n0IlrU5feqLh8D0ogLTPC8wdrS+fMKZ484Zi6zksp+5Vzd8Eap0h8rw/VGz
         blmkAbucqK7+wnSWz18vE2dLqkOEosQxJ3ZrrvSrg17LeaqnhJZYUTXOv3H+XarmvyNg
         qDBeD5GEnnKKks6AGO2fgjB3hUgu067h7+xA/fnFn5K54mjDj7bJMbyRQOqs4bLophhb
         OTQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTkpyZfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a0ce28b000000b0056b64b4fd87si7232289qvl.44.2023.03.06.05.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:47:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kTkpyZfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBAy-0000wb-Md; Mon, 06 Mar 2023 08:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAs-0000v0-8w
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:46:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAp-0003Ox-Kv
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:46:45 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso8212351wmi.4
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=kTkpyZfHmLwD33iRcyFXfmwA8L8hVnd6JkVAZQSP/F1qoguqXPfZAuhP9rS2OfgXJc
 dfTQzZnG/TNNLVsc03zYPyyspe0jAFqwZuXhmQthsMu7h28frQGBRGkRzOkljsNLV8Ze
 k5LeBMiqkm02f90f1br416MRRpsAGQyde8PkUv6O6ScPFC//a0YkXWoEIy7Jo0HrINVU
 /CwoTW2+quwxK9IgHtQtWCSmT2mYUP6vR1xpgeiU+9i37cWOfYgf4huMF0eU6lSOIYPG
 +UXfJGwr8W5ilSp3oChj3rXqiPkIgScgzYvjFAyhh8ldZWjTuu11C+Wg92M5AI5IjZmq
 28OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=Q3oLgkBRHM5bE+JCQe0aYHTL0TqCOlkg3wFbtCYv4zdBxQByVmKjWDmxhqQJtASupZ
 kun4FoepuIFcxrr/jRj735PX1iHd22fwHzX4iu/MdnEP3jexf8/FeLychyDw/TrCnoWH
 v8W6bpXRn2coJUMZLk5MvxIm3/+YpZfMpgn7dv9mmJY+aCGjOHzgSdyMldjQWpubdxYq
 PNe6nbWnFzek02VBfE5W0htAdKEzeOZiqflUYuTnOUfJtI18uM+6X7mYJ+2+s238dsWo
 oIvaaSBxK2Fz4mIbjC/W/pQHgTMBdhqAeubP1fJo3HrB+Kh5o8TyI0AJ7gnMPRDjfk2M
 J61g==
X-Gm-Message-State: AO0yUKWWmGhq1P4QGXaIODWb2AdK5MxyZqEdgy9MsL3qKgaj8nHah29F
 MbXq1ILujKnToKH+X/n6teJ04w==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id
 o39-20020a05600c512700b003eaf01d2346mr9578742wms.15.1678110402130; 
 Mon, 06 Mar 2023 05:46:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b41-20020a05600c4aa900b003dc42d48defsm10447543wmp.6.2023.03.06.05.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:46:41 -0800 (PST)
Message-ID: <605a242e-f5d5-788f-fc78-e24abb186ee7@linaro.org>
Date: Mon, 6 Mar 2023 14:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 33/70] target/mips: Avoid tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: aR9RIIFBQov0

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/mxu_translate.c           |  4 +-
>   target/mips/tcg/translate.c               | 56 +++++++++++------------
>   target/mips/tcg/tx79_translate.c          |  4 +-
>   target/mips/tcg/micromips_translate.c.inc |  4 +-
>   target/mips/tcg/nanomips_translate.c.inc  | 16 ++++---
>   5 files changed, 43 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

