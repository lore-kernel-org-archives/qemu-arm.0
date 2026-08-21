Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D338C5DF94
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 17:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxSsa-0000Om-BU; Fri, 21 Aug 2026 13:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSsR-0000NK-In
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 13:17:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSsP-0008Qo-TQ
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 13:17:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so1174210a91.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787332676; x=1787937476; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UYI4F1cApmfOtb7XzffJo6/yvlOr9M0glusv6ZmqiFQ=;
 b=HZv/k2Q6PcMd3DSgxpNYAbA7Q4ngD1cu1OLUHEfe59ryTx7ormJwvbrALkVzoKNimv
 zjYDR+qdgFRIrNKJ4XFweLmsUSxExLNi4ze0aD8ByOW+N7/xLWc3FqI1n8B5vglqTxLv
 yUU2L5YKVqJN2CWcnTUHLx/tJqYbhPCXbyJ2KdnJYLdcc8wlcumDw43N5wZi7TP8NgEO
 T10aL0XZEI5KbzNeTqqgOmD+Bk3uADW3BSwKvuz8sUZh4sB98aiCRrEovfgkkArr8gN0
 P07pzH8VGfDd+3VCD01DNw9BpiIJqrj+D4rckRMUzYKhpaH3t/vb96E87/z/7h7H7ewv
 yQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787332676; x=1787937476;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UYI4F1cApmfOtb7XzffJo6/yvlOr9M0glusv6ZmqiFQ=;
 b=rvQrXlaTNoocnjNfTa3jNotbSvCOQEERhrn71CCA5wz+CoQ7dUmO8maTAb1/u2I7GY
 NBHadd3wbowTx/3pFj1+9oLALtX8DntmEWhBkp8KwL0SbZc/4cy4v+dfJl9zI//OMFBk
 /gOBHYEHEF6qOaeCKOfz7RGDho4sZViVKrNdlSARaMftzuCVRZdCFSL4OXYJ8pt5pwNl
 Swmq/o112ca4C5FgIh8e/lUdd3OAVd74dTQnH9ylBpOFISEBE0lDmcF61qf/6atREzEh
 ryOW0EjG/iUmMymFiLU0yJSJQZ7+MTUs0MeuUYxCKQ+34ALVRa+cyb7jNi1VOFk7m1oZ
 Orkg==
X-Gm-Message-State: AFuF++nSDK4xZVyppkkwMd0bxENcsRjTPOUqwxDYgrVeUfnpz9DAeEpB
 ju8agYlL1KlhbW9ooD1V+JK0pC1yoGtkBGzK1Hz7VUwH/DXp3Gm7yuhGeup+Kw37YzQ=
X-Gm-Gg: AR+sD13E7ioF3KKKV1NmxtVOZ8VzutwTttkbaOSFrTheZZvwZX/8PhsBfpiTwLcdDJW
 57s80jbcT8C43p6ZMgN8U5RjyP1Y+vcKQxsjvn2lIl+z+4dVEiJ0AKhdeO3EjIEn/lYNPXxucM0
 NVTcD7NLpHdCQVn2tRhBILwVzahX6JrMHG2YLAvbfrUo+rDaFw6+/HDY6KHOavB2SkLtOQTlug3
 EMxFBY+ow7Rm2O4Dda8INpBCKVvmgPBcD4osel38ZyiwY3YmHOk6a0qB6v6GfTyL74NcUSbZG+f
 fvr9YnT6L65i4BWvxGh02sdiEtnRw6dOxDmazCaxhsPYVFIh+WurkAXcuiwlo667AWZdyBW5l3L
 199jP68fX+Yah3Pcwt+kJOISz2VIgxjQidgqKH1nYX4oKqu0pDlaaRRhFDS6ul0DO9mYMoXSTKG
 MsVIraj8tvGTCQMt3hi2ob/LYER/7qNwJMXhPpFeIOmYvL3bjEBZpeuAaPV1aw29LnqDPScv9aT
 OLW
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id
 98e67ed59e1d1-395deeae6e3mr256963a91.6.1787332676018; 
 Fri, 21 Aug 2026 10:17:56 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4697358sm3930350a91.8.2026.08.21.10.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 10:17:55 -0700 (PDT)
Message-ID: <c3e339b2-f315-4be6-b5d2-28de79a1d505@linaro.org>
Date: Fri, 21 Aug 2026 10:17:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/arm: Make IT insn undef when not present
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260821132550.168896-1-peter.maydell@linaro.org>
 <20260821132550.168896-3-peter.maydell@linaro.org>
 <0a7ca30b-e623-48dd-8db9-c53c76f9407e@linaro.org>
 <CAFEAcA_UKRZQFiuJV0bq9BhLCPXbVVsKEmCiO1egdmrRgBe9mg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_UKRZQFiuJV0bq9BhLCPXbVVsKEmCiO1egdmrRgBe9mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/21/26 07:58, Peter Maydell wrote:
>> In practice this is going to be the same as just thumb2, because v7M has v7 which implies
>> thumb2, and all v7M have m_main.
> 
> v8M without the main extension exists, though we don't model any
> of those CPUs at the moment. That will have ARM_FEATURE_THUMB2
> (because FEATURE_V8 implies FEATURE_V7 and FEATURE_V7 implies
> FEATURE_THUMB2).

Right-o.

>> Is it clearer as
>>
>>          !(arm_dc_feature(s, ARM_FEATURE_M)
>>             ? arm_dc_feature(s, ARM_FEATURE_M_MAIN)
>>             : arm_dc_feature(s, ARM_FEATURE_THUMB2))
>>
>> ?
> 
> Yeah, I think so. (I actually wrote it first with nested if()s
> roughly like that.)
Excellent.  With that

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

