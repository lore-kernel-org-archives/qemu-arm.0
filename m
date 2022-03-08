Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2521414lfo;
        Tue, 8 Mar 2022 09:31:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygYZCVbSVwHl9BGXmcD24G4RbPHAu4v6A0S33LWabwxTtdTAMXuE1sQ9klT2TrnzyDR4x5
X-Received: by 2002:a0d:d706:0:b0:2dc:3b7d:92f5 with SMTP id z6-20020a0dd706000000b002dc3b7d92f5mr13958290ywd.328.1646760716223;
        Tue, 08 Mar 2022 09:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646760716; cv=none;
        d=google.com; s=arc-20160816;
        b=BvHnd5+NWLxFNECnx9fzqa4vjcZPTgR35Cwe+aBEH3c1MVBCEXmppd0OM3JvwEc7N+
         dSs8sdhWA0Bb1W8U4qZyo5WRyrS95QubTpfKqPXibtRnQ7zvO06OXFR/KQWPo0AwrF/k
         cS4GdH+5DukSa6IqLoRcXIAZvTwI7DsjxNpsTf1PsOe/0kNo/Bw58fbnxVlW9510vMgs
         5sOmRgkKQM3bZ4m9/HKMKBLvVZAraF5C05mErP5gaOZsRk6n0iuESpb1zyTw1AMDB9wA
         CcDpIJrVjPLhVyGrBE1BgZvCe7R5p3p4OE3R9gUA0bZk+9LxiOX644SYD2z+p0Iu3II1
         Q21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qxdFXVmVFLrUNzeiFEMfLxJLZee/tN10m8g+e68eLwc=;
        b=lW+0ZgwXA1zR6143YxDMXbyhjVYRGzDb3ZX5I3C0RHzlVb/ryDGHo5ZNEvAWq7yHtq
         kY3IF6+5huxWKzGtlehUo5cfX+TCZcdh1ySr2jJ+jh4xZwDPPoAYu73Wus+Vo1GsSBYM
         WvnBZUQe0g9NkEgN1P8aV0ykMKeqNeK7lkLeKxHydCIu2Y2Fk3YdCfGWtVr20QrjUC7e
         J0u1gYAPUDq04SjeOmMibfp7Y050vzzJaxErNF7lTJdrbYy5mNSIM6KMaZewDsk3ZSTl
         +kKcn+rTVBLY2ir2xgl1fqHQ7MNpUHSHhxABp12Uv1nlQpGwXPjYTr9mWARHd4Y4v/7r
         ur6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KN9IJNzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65-20020a254844000000b0061da917cd23si10335272yba.35.2022.03.08.09.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 09:31:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=KN9IJNzF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRdgh-0005uT-L1
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 12:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRddy-0003fl-HI; Tue, 08 Mar 2022 12:29:08 -0500
Received: from [2607:f8b0:4864:20::534] (port=41897
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRddw-0002LH-Ar; Tue, 08 Mar 2022 12:29:06 -0500
Received: by mail-pg1-x534.google.com with SMTP id o26so17053423pgb.8;
 Tue, 08 Mar 2022 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qxdFXVmVFLrUNzeiFEMfLxJLZee/tN10m8g+e68eLwc=;
 b=KN9IJNzFzDGO/tmSRPw/i1ORFTIYoTtDnUnKqUnFarqF+CNgKW2xUwQh7nXVxIymIr
 6kn1473+Of3njX0pR5aT8o668szL4CTf8W+A6SLsxOPPo1+aQGteXKSqmoBz97IWdZ3+
 PB9/sO5LdrHbvhSkooteERnMWBPTUVFLTZo25aixcZDBNvatBiIoWglZOCzLjq/md/g0
 xMcvF/Zxe1wB8tM8X1lH61KgpRT3s8qQTM45GDPonBZZqKg7uEbsb7JFeivsNriq21C+
 Xc6tGWvXt5vILXkDt6wjSGCcA76NLxah16pLoGoEKJnl26x7+fQq/cWpwawh/zRL054L
 6NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qxdFXVmVFLrUNzeiFEMfLxJLZee/tN10m8g+e68eLwc=;
 b=AJFCcGYDnHZoRfkWvFUpdqo7ClYyu0E+F2C0HPiY8MQhatfNfUWdmt83qx93N9evvo
 ew4riQw3rqU4/peMWpZX8Fji0sun+CcMZTZVtbyGOOmhYqIJ8dRSc9BvNLlvxbR+bvOu
 ytvlE2srgnLkODmIon9/s7U00Wvu4iTHjB7gStzzTGWeR3/nElemyvR46unIuEcmb8/u
 LHr8lSZ/BJBPJbATFmz8wsyzzRaB8OOQYQIc3p6efK9VE1vCQBxAdxSN2HQOxaO4x3Vs
 REJBoH53ZCY1TYC86D1iW/BQ8laHwOND774D0/JxkNtk7QcXcZpWrb5wnV/kvm6sPVIv
 gKgw==
X-Gm-Message-State: AOAM533T344Ax9loohir4IXm/+pRXnIhXQQfLhnH6eC6ZAwrNisZtusc
 GFi2YbspVYqdU0GCE24vVjU=
X-Received: by 2002:a63:5c5b:0:b0:380:d9f:df20 with SMTP id
 n27-20020a635c5b000000b003800d9fdf20mr13200220pgm.278.1646760541796; 
 Tue, 08 Mar 2022 09:29:01 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 p16-20020a056a000b5000b004f669806cd9sm21239499pfo.87.2022.03.08.09.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:29:01 -0800 (PST)
Message-ID: <1856bc98-73f8-82af-b8e7-cdc88161774b@gmail.com>
Date: Tue, 8 Mar 2022 18:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] hw/misc/npcm7xx_clk: Don't leak string in
 npcm7xx_clk_sel_init()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220308170302.2582820-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308170302.2582820-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +CAXxFImjmUP

On 8/3/22 18:03, Peter Maydell wrote:
> In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().
> Use g_autofree so we free it rather than leaking it.
> 
> (Detected with the clang leak sanitizer.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/npcm7xx_clk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
