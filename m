Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4849878ejc;
        Mon, 6 Mar 2023 08:27:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8YaMyLL+OY36Gv7uyLHLohF/AlqM5P1nO9Du+OsrbmYkOwHCcFv/A68ErtdwYIPbGYsX3b
X-Received: by 2002:ac8:570e:0:b0:3bf:d6da:e58d with SMTP id 14-20020ac8570e000000b003bfd6dae58dmr18620376qtw.54.1678120030666;
        Mon, 06 Mar 2023 08:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678120030; cv=none;
        d=google.com; s=arc-20160816;
        b=N1f0UgeIFbfvPej/vDZCCfqccJ+GDHUbIURiXwwa8STy7XtIr6OtRcXjmcWwGP1ua5
         nmBgp/J+q7c//HWf23Wdi/f/csgRjYsQmTMYPgbftTNNQj5Lvvb0GHVdikTs3R/J+/mM
         bdE9iiV0Em0SSvw+ohtWVs+z47z5ZwRZ0TVRrMDOGyk8z+nJScsFysrZzonk6uvvPAGF
         ZSKBEp59m1FPQ49zpxXuGm+vLN2cMn9GMsM1tYwGRfEaamkaK/AhW0ORa6E91WeaSlzf
         x/MYUAhE5lChFzL6EC3bk02xYc9RIgU0L9ACcAvjlTJWfcXr1xsVuRGigtQSLA5Z3UNX
         LatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mchCrK2cxJeE1WoyED0JTKD2bax1zh0H5EZHRUKvisE=;
        b=u7M04wB8UnutuZ4EiGzoVjJKRZBpqxiAuLKx0FGaGtDU/qrJMpZyWNvZBMKN/TcfZ7
         +FqscoXrBv04IZFx/F5LrzwiMD7FHGJ6DMel9p4VKevST0fDfL7o1KwHy/Fnbg6J9ODv
         1MqGLXmkeWk6R5ovVkgNnVgMW29nQB5yMJUghS9bwz8te8MAqt8wNLcL4FzVfT1GLl/U
         0SzTlz6UqP8AlDvCC36ku1P9N1d8m0Z9exGzyOtZviMw/ykEFUcReLycJcDZqpUvk4IM
         xZaDibc3EsrnkhpzCHqTX6zczUiYqYhLznupYCrG51VyOdhSMH8i7J5PwqDu1+HrJvmX
         EZ6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ojv3ZLEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020ac85c87000000b003b86cef433esi7788517qta.544.2023.03.06.08.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 08:27:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ojv3ZLEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCvO-0000iX-K7; Mon, 06 Mar 2023 10:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvM-0000Rg-Hh
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:38:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvK-00034E-TK
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:38:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so5459809wmq.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mchCrK2cxJeE1WoyED0JTKD2bax1zh0H5EZHRUKvisE=;
 b=Ojv3ZLEb48W4RRvXubgF47Eam3WFv1Eq+vvoebokuD275FU5dxebCNhdMn0IgeA/Q+
 D4gJmv53gShL8DFl0Vx8cNXd+W9V+U+M0QXGI0r9OjQTZ3rp/X0zswcYzqNMDB3Rgew/
 Vq8IvoVDsBK9NRI3FKpVTokvRyPlKUgLTUvSQgOEi6KLPU+JPPdtRkGDZ1OoDW3VAJWm
 nrwj0YaW3kX5pbSKlVinIbSy2HX9TKlcGq0dSVYdos99zhou3OJrD9pkiOpUB6XK7VE1
 oAmc8gZwy/cN1JWWYBmbu4NjWweaH20bN4yj+83B8JcEp6vv/OR5jL3BSKHBIaWtHB2T
 ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mchCrK2cxJeE1WoyED0JTKD2bax1zh0H5EZHRUKvisE=;
 b=S5JkruKeC6oNCEj4pkq+63YsHEyMvcQzihYxVyA9cW3JzD0V8k/oTCxaUMHzGCL7R8
 mUn9aeUW5VG0EP8sN6y4dCeowjOQ+kP1lSS8zp/vWXr26VzAjWvKwwraikQu5LyASPOG
 UhaNaLOTM6WQdyp/peL7jg2ceCNvPadxWPPTNiTwZxdAQsM/CclxEQdjz6nm695ueTGL
 oPLSvKNaNUyyZXJg8sl0D+m26ighbpPcFfTUkzmz9X8XNVoG1nK2TRjeN4URWqReGLGm
 nhYF4JwY3JLifjr17JKeCL8UB5qi8h7EFo7MU5/9NACLSDMryNjWc2MQHqleztUDa9Tp
 388g==
X-Gm-Message-State: AO0yUKWBgLLHj8LlBQ/74tzy8xctJbtS94g3XMFqUV1ajaJlk94Sdg9G
 vfp9kTMygvvd7LQ9MJ1HKVLsTA==
X-Received: by 2002:a05:600c:3505:b0:3ea:f883:53ea with SMTP id
 h5-20020a05600c350500b003eaf88353eamr9053672wmq.7.1678117129625; 
 Mon, 06 Mar 2023 07:38:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm10367575wrw.116.2023.03.06.07.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:38:49 -0800 (PST)
Message-ID: <4ab2e07e-1add-d521-eba5-b81292912b4c@linaro.org>
Date: Mon, 6 Mar 2023 16:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 57/70] target/tricore: Rename t_off10 and use
 tcg_constant_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-58-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-58-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: yg7DnPOof1c8

On 27/2/23 06:42, Richard Henderson wrote:
> While temp3 could simply be initialized with tcg_constant_i32,
> the renaming makes the purpose clearer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 56 ++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

