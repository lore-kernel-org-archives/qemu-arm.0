Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp183019lfq;
        Fri, 8 Apr 2022 17:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+PlccoGSKtZl+DrPGId8heJI4x+mWDIZvMSyYAdmFZ4/ZFiJ4YOPHyPtOVeQR9KTzKd0+
X-Received: by 2002:a05:622a:510:b0:2e1:ecc0:30f7 with SMTP id l16-20020a05622a051000b002e1ecc030f7mr18022794qtx.394.1649464794702;
        Fri, 08 Apr 2022 17:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649464794; cv=none;
        d=google.com; s=arc-20160816;
        b=BH9owDDKW97WRM+kUV2Y0Mfq2ybUzMVM7EyxIEjOhoQDt0TEPgCWmpl2b0i9FOQzAv
         Zxc5rSXND/MHYRschCeDYS7PN0JFdWCP/bYQeMkCZ7weWlE6hD/Gf2KOJrQjWPtQWj4C
         I3sfpjaDMuHRK2LDGamjXu6Sstr2pvf4AEt+OgjaupEIIHSjl+ghMvi3UzkaleHohDjL
         HjbJFFl6p4YM6/NT+KVlTfCaINiWXnlJLBUFxAWYMwdUZ3Cyh6bI4QpR4ZKi/S0ZowSj
         O90ivq+B0UiQNfCy9XmbUeLE0B/snqdea+GK98M5SgrTHyaMq1s2InuKZShckpYpMsRd
         +36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6uuk4ZMdbNl+jGuP3mXy9SHZYb5KjXaItznZ0/tF2yM=;
        b=dJHldQ8rHdJ/wl7KgGhWFcr3aoERCcL6s+YrbOjZI7ZIUZJUcnQzsl1VgGnkyAcpxu
         ejWMTHh71PdEtOCHYDJY31jY0G0DD0sfVverpxssTaOzX4EY/w+teEhZFg5DArDXfXq/
         xp4H5Fo75L2+R3GR5/OYbmnTqUioSa6lOhZtVBd+oDIeS1k8oDHy/dF48xlbv/SeA40S
         u9NNWoWxISEgWPRB/xPn3msjhNtRunpoBEqUETpSD8q4UBAoDqkZJEusjQgZBfvc4QG8
         MXkO/T6F7OY0E4cCweGgKzAy6u22YWInxR3flTkcunSndeol6Tc9h9ujlQw4TGE8Vdva
         u5wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qarpTo0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ac87c8d000000b002e1fbf3bebasi1247729qtv.171.2022.04.08.17.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qarpTo0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncz8s-0007ti-85
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncz8e-0007tN-UJ
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:39:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncz8c-0008KL-QH
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:39:40 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so1050694pjb.4
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6uuk4ZMdbNl+jGuP3mXy9SHZYb5KjXaItznZ0/tF2yM=;
 b=qarpTo0igbqJFH7IyL1wmKe7U6IOVLqz75+grOC0Z3uztcS+tfQwWVVQQ5XeH6Okdk
 PpH/LUKYnf1d5mjBSCQ+ikZgAJr+mv5nUbyhYKpCE8EKhpvx6BiidBcoqo7M2wEPM9dI
 9/S3iuZX0uarj52KXSVpuEfqgifUAIhbwfXHUiXX+EZC0hio0VeuHLXTAfgE39ot9VA1
 8hoQMQdWstKb24ZpV0pLxdfDCpO5E45MMPbXd2S+QsoSsDoA5YhedEPYNBooWZUPYWKL
 eDlT+lvlVf74LTks0GfpMYXWJGREkhmHQF9bNoNKShyHHPO8Hgm2W2weSQa8O4Fk4O0h
 QGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6uuk4ZMdbNl+jGuP3mXy9SHZYb5KjXaItznZ0/tF2yM=;
 b=uLZRfOBKF5/+jrtNr2JhEyPgFFVw/81b5t4mDkFydyqwu1Eil/4+qlqfResxnGYBmp
 OyM1j0ilORap3UvunKUE5s2WgYKLngIkyN35K3eOO4ww4RiY02PSOjdi8Hvz0DfXXzFr
 BuWu3hRfINW9WQy0EzDbHJ2JUPY3+uY081AVbOWbaYjvrLkRfXoteN3Umpe5wJMkGLDU
 SIOnXcbkLdYaMY3MF3Qhpti8jbi0jedgeU4yky0DFgZWTS7xjimXEqXLzR6p+SrY0Ds7
 wWfKaTdWd62eR0BJFCB4j4a5MevO/luWsKxsYYBVUy1nTeSRcoFKYB0UlmF3xFNJSiCN
 wwBg==
X-Gm-Message-State: AOAM531n0t8CYeIhojbxNQR1m+Ojj9vxF63B29Zcqdmf4XgSjtXK47IJ
 CVSrsBILlkodCWhCskuzU4eLsw==
X-Received: by 2002:a17:90a:db50:b0:1ca:9af1:f54f with SMTP id
 u16-20020a17090adb5000b001ca9af1f54fmr25506017pjx.32.1649464777409; 
 Fri, 08 Apr 2022 17:39:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a056a00138a00b004fa9c9fda44sm26959144pfg.89.2022.04.08.17.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:39:37 -0700 (PDT)
Message-ID: <394e03c6-e443-e752-745d-4960ffae951e@linaro.org>
Date: Fri, 8 Apr 2022 17:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/41] hw/intc/arm_gicv3_its: Factor out "find ITE given
 devid, eventid"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-12-peter.maydell@linaro.org>
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
X-TUID: jIPg1a+hJqrC

On 4/8/22 07:15, Peter Maydell wrote:
> The operation of finding an interrupt table entry given a (DeviceID,
> EventID) pair is necessary in multiple different ITS commands.  The
> process requires first using the DeviceID as an index into the device
> table to find the DTE, and then useng the EventID as an index into
> the interrupt table specified by that DTE to find the ITE.  We also
> need to handle all the possible error cases: indexes out of range,
> table memory not readable, table entries not valid.
> 
> Factor this out into a separate lookup_ite() function which we
> can then call from the places where we were previously open-coding
> this sequence. We'll also need this for some of the new GICv4.0
> commands.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 124 +++++++++++++++++++++-------------------
>   1 file changed, 64 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
