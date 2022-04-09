Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp589119lfq;
        Sat, 9 Apr 2022 11:07:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOj9Fd+aqBG+cJe2UxweeQvEPpP0/wbYM26xfdwnAb2EcKTx6g7eOJnfVsm7YqwvdGddAH
X-Received: by 2002:a05:622a:5081:b0:2eb:d9c6:d1a9 with SMTP id fp1-20020a05622a508100b002ebd9c6d1a9mr10239093qtb.490.1649527623471;
        Sat, 09 Apr 2022 11:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649527623; cv=none;
        d=google.com; s=arc-20160816;
        b=ikvZXoejaB52IU2esxPGXIsbP3lIdpKk5zZAiIINI1laYZtf6i52CDcv5+p64LlJ2L
         jFj9Y4Lk69SdL9PrfoBSofqktIpPJ8jOcq7WgbJ8Pj9tXjI01GJP0OQ3hYG7YE7u2xTn
         M+OALWzxBRvebjEUBY1/Rual2gfSyFjSWiJwN29X1/Ubya+iXUgfhr3WJybiFcBM6v/U
         id89ApZ7O89/JGzzfBn+f5+e7pvRUATdsFtnF2ONycNl+6ANvaejJOn/MDWtrzoJ+LcP
         jYWS45npLbAl6JIWUiJCGpOEG0b01i+cTFHg84bch6RC225sjCPkztNERgdivN3mQtch
         5erQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3qL844qTtxNLuWMQYo5SDrmCk+nBXcSPp7dyz62u8sM=;
        b=MubG1RyRbQDGZjpc/Sb5g5UeTFRprs+OK2A354KdxpNFqTqGXOQwyHmOTJgbJXc+Zq
         Hng4RzhshKk6DJgLRO/XQldb2COU+BDlGFaW3AJydnHMUY1ItggC6G1hk1HDklSSpgx3
         ApZOsnrK0hrWPjAY7E2ufEH4WiSnuSHu3caABO8y3X5KPp5mzvw6bSOlCzcFN1zIC8Vj
         vKcIjbQAMvKwv7YmMv2VjeK47vMpTDRfsTQroYxs76TIqVY2vKnwLfQrGoqPWGEq+er9
         xINgX0qmjF2rRq0VP1PnACu9yNmfz4FU0UnHEauu+Kfwr/qA9NnYM8wLrUj+1BZdfVmP
         IVAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKTYL8WV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if13-20020a0562141c4d00b004442ba10f03si1930515qvb.478.2022.04.09.11.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKTYL8WV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFUE-0003KU-Ui
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFU3-0003Ir-RV
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:06:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFU2-0007Nu-CA
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:06:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so8191290pja.0
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3qL844qTtxNLuWMQYo5SDrmCk+nBXcSPp7dyz62u8sM=;
 b=HKTYL8WVcpyqlevAGVZIOl3mDa7Qov3JuTUkHHChhrQDwmMfyOZZiBa2fsNFviaeZD
 gnUeV/4pXwZ/TRjw1pFjlaP0myAE2Za/JKtFKTEWAlj7NA/QTvpYY09grkCz3L9eEXhX
 9TFaE4ReW7OYZRinqx38YN4WAX9uPnMpm1jJLisWPJU/Cd8g611B+74MqrrLaVTHP78b
 Ogra2VwEC8AkSNxzhy/abwO73W4kGwly1rGnG+psL16IKnL5jJtvewNj+gnPvozYR4Sq
 0ZN/DOwt/29++Fkb5BYYTxGlbhp0vBuHPjOLoyOpD0wXOek5PldsQfE1b5Fh2b8coGJd
 J9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3qL844qTtxNLuWMQYo5SDrmCk+nBXcSPp7dyz62u8sM=;
 b=mwWwzz3FbXbnDeXbWxlPXf7WrQB21KeaMhp4AAbNQQxFFFWJXbGoGrx5x6bQDJt7Ie
 SYMIPqCRM4Pw0OoUkSrIlryhxnMNmkJuYJVRzunsaJmelp+JJqqGl/BWcG7aCriO8Xbq
 vKVyWVMMZ78WsqYOIHWrIlxjDBSjR3qMYdGSXQNx/c1tjNQN/XJ0kOZr7KNULF6usnlX
 cTp5B0rMapTjNgLlZK0T0BPSh99RhyHOsqITNlWIsq/Im0LN67qwwy5HPPJ1CfxqK5Wl
 rryBYdMdTKMezlHS+pvcCZcEdgN5uT5SGYMRCz0Y6QucqVoqM45ELWUofHbd1HXKJ/Wo
 TFPg==
X-Gm-Message-State: AOAM5317t4TP1prfxqGh1hUwmICmeYcw9gOUmMq+/CaFdrtsWjW4h54L
 ZsNKOYA7EFpWevrp3BfymKwwQg==
X-Received: by 2002:a17:90a:15d0:b0:1cb:8135:99bb with SMTP id
 w16-20020a17090a15d000b001cb813599bbmr25929pjd.227.1649527608885; 
 Sat, 09 Apr 2022 11:06:48 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a056a00168300b004f7e60da26csm30398820pfc.182.2022.04.09.11.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:06:48 -0700 (PDT)
Message-ID: <e216c25f-b342-b89b-45e9-a7dbb914d871@linaro.org>
Date: Sat, 9 Apr 2022 11:06:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 15/41] hw/intc/arm_gicv3: Keep pointers to every connected
 ITS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /DwQkCGlXLng

On 4/8/22 07:15, Peter Maydell wrote:
> The GICv4 ITS VMOVP command's semantics require it to perform the
> operation on every ITS connected to the same GIC that the ITS that
> received the command is attached to.  This means that the GIC object
> needs to keep a pointer to every ITS that is connected to it
> (previously it was sufficient for the ITS to have a pointer to its
> GIC).
> 
> Add a glib ptrarray to the GICv3 object which holds pointers to every
> connected ITS, and make the ITS add itself to the array for the GIC
> it is connected to when it is realized.
> 
> Note that currently all QEMU machine types with an ITS have exactly
> one ITS in the system, so typically the length of this ptrarray will
> be 1.  Multiple ITSes are typically used to improve performance on
> real hardware, so we wouldn't need to have more than one unless we
> were modelling a real machine type that had multile ITSes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h           | 9 +++++++++
>   include/hw/intc/arm_gicv3_common.h | 2 ++
>   hw/intc/arm_gicv3_common.c         | 2 ++
>   hw/intc/arm_gicv3_its.c            | 2 ++
>   hw/intc/arm_gicv3_its_kvm.c        | 2 ++
>   5 files changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
