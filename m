Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3445084lfq;
        Mon, 28 Sep 2020 01:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu2lCJdkmX850cOYReDmls9YLWB2txat/uClr/2MhCBa4M69s20o2rJEBe+DWSfqMAIiRB
X-Received: by 2002:a25:254f:: with SMTP id l76mr592879ybl.366.1601282370290;
        Mon, 28 Sep 2020 01:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601282370; cv=none;
        d=google.com; s=arc-20160816;
        b=Vtof9zqxUQFT7roqxG79WdOSpm5tyxLdpHBrq9VV33Rsg0NE59CUnPESie9LIule7X
         cAkYDfzN6+9byxlbf8gSN6nF7mGQP8x6eblbeHVWw+w06e1j0frXNVzaTSG4vyQCkphS
         CiyXAFM57//oNu7xBXRQAgJL9QtGA1ODNaZf7Ic+L7mIn2fT6DXvCVHMyWwc6GBgVZYL
         gGkifSp22NHSkfDGFzYoPgoQdIQ+GLbBRw/YCW4Vbhq+COgu30Hd+0co9auRixUOsaDA
         6YjjgQv6chnCXSD/xKrxOLmvvPGpZdAVejKmKvI+45w5VxgbHGMMJSHEXTBUqpEEJ3aG
         GpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a8TjYQ8RvXA/fU4PxuKnBfQ6cVO7M17iJbn3diQ3Dow=;
        b=t+ES+yWL63c3a7aLDFLmhZFrkxxyWEJOdPMaDtBDRErIQ15iv/LkwdMOBO/YacywKH
         cF23svvOU6BJ084rcBd5F46bE1KGrUJSHQj/WfRMYahRSaaYq7bGTmEuF3himz49L9pI
         bjbuHISis2rnVsR1fa3gdEWgxl5ktlGHOeOaN97aojA74fMpnWVa/YCgacGbg3vX0a/M
         g9eSZvPXqT97reysADzs3zNvc0pq/3pPTMwBhJWeiMwXqMqLj90fuR8LeN/7B5WrI9Mz
         WBBr87PuXgGMAlxn57NUSyma68Nqs/cGtt3I4vjQxd8c4JBY8tOkrEg0dCvN4MTaMd7L
         1jMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ib9ssucU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t40si236321ybi.81.2020.09.28.01.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 01:39:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ib9ssucU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMogz-0008Gn-IS
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 04:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kMogN-0008Dl-6q; Mon, 28 Sep 2020 04:38:51 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kMogK-000679-J6; Mon, 28 Sep 2020 04:38:50 -0400
Received: from [172.16.11.103] (unknown [172.16.11.103])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4ECE321C3A;
 Mon, 28 Sep 2020 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1601282324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8TjYQ8RvXA/fU4PxuKnBfQ6cVO7M17iJbn3diQ3Dow=;
 b=ib9ssucUhkBOeEKx4RT/4tzBjIg+cGoDCyOHnPgqWHLeDy8WlPHEdbgxARRqQb6jqcB6kX
 mlBiFV6ddKAVwdsLMaP/Miwe+S8588GiolecsY8aRydpxgBwaQ3gXldrPodi8wLSrgY3pw
 bJub03jivghvQOkLYcaKssD3BLGlxOU=
Subject: Re: [PATCH 01/14] hw/core/clock: provide the VMSTATE_ARRAY_CLOCK macro
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20200925101731.2159827-1-luc@lmichel.fr>
 <20200925101731.2159827-2-luc@lmichel.fr>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <88f58796-e8e6-e913-dac7-4401d117789f@greensocs.com>
Date: Mon, 28 Sep 2020 10:38:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925101731.2159827-2-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 04:38:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.011,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJLCK8vY9/zS



On 9/25/20 12:17 PM, Luc Michel wrote:
> Signed-off-by: Luc Michel <luc@lmichel.fr>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

> ---
>  include/hw/clock.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index d357594df9..c93e6113cd 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -79,10 +79,15 @@ struct Clock {
>  extern const VMStateDescription vmstate_clock;
>  #define VMSTATE_CLOCK(field, state) \
>      VMSTATE_CLOCK_V(field, state, 0)
>  #define VMSTATE_CLOCK_V(field, state, version) \
>      VMSTATE_STRUCT_POINTER_V(field, state, version, vmstate_clock, Clock)
> +#define VMSTATE_ARRAY_CLOCK(field, state, num) \
> +    VMSTATE_ARRAY_CLOCK_V(field, state, num, 0)
> +#define VMSTATE_ARRAY_CLOCK_V(field, state, num, version)          \
> +    VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(field, state, num, version, \
> +                                       vmstate_clock, Clock)
>  
>  /**
>   * clock_setup_canonical_path:
>   * @clk: clock
>   *
> 
