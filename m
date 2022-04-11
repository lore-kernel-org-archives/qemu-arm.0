Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1985989lfq;
        Mon, 11 Apr 2022 16:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIQmzrsrVDwQNedNiF46lQrXp8nDg3AmP+A+JA+X91hNJuD6ST7qK0oFrz1pANBwJDddN2
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id r19-20020a0de813000000b002ec1e83e5f0mr7277575ywe.151.1649721430911;
        Mon, 11 Apr 2022 16:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649721430; cv=none;
        d=google.com; s=arc-20160816;
        b=lkrxBPjSH8ZlrvTNb5q7uxfV1bEUTx/aYr/IMC6EeoApSHoOyU2DLa1ti2sygYD0ju
         treJND5MJ/EpFvIo6zbpGNUl+wTP3mo7HIgHLtoo34G/aT8QKNM3riWdprc7sEzDrBmR
         CBXnkBfRmlGx37bKvMAwC5jTC5IDi399IoZXzcWLneHq8tfIIcMveEwKGmQMvLFNYmag
         +EoBCveHJN6/vIoyhFQ1fuRrRffza9COpCWSwk6RlUJJaPt4dhVFOjwPsJxQtNn3Xiv3
         n+EskRzGZrQRd1s/3Mp8//H5Yz4R3dOxqikAK9f151kxclWHHDKtq/UtUn3d9bXWb06C
         Lb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ISrYRqi5+w3aeq7oc2sJ/eee118BEF7YlYSYWqp1CI4=;
        b=y1Ff3VyjL0QRyRYyUQy+Y5GEKK03L+yuv2UJir+QAE0GoATuZihQ7FQh+obTuU2aTk
         S1H7XcaUl6C9b8YN+/An5umUGG6k+xYY8RwaMO6FCvB03oiOIdZ0TooY0cmuFMFUvVyd
         cPvKCGwNRNEU+06v/J/A18TU5GHDo20O5RzztKmHQmx8fjpn2OzP2OtgVNSXJq851bid
         r/vJiLbAbgh/6KMKOJo6KnEqbOIoj3JUvPpyr1mdwp8R3U7Y+2MAmp5cPx1uN/psoGlW
         YCB3M3yG3c5JNjSm7rrjkrR8zaMnU+okyg2w07A+KQ3e78aNsCt8Brw7i4XS81G2LbJX
         1tig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8M6IbOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j132-20020a25558a000000b0063db685d0besi4759738ybb.236.2022.04.11.16.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 16:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8M6IbOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne3uA-0003Rn-AS
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 19:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne3ti-0003RB-18
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 19:56:42 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne3tg-0004iA-IK
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 19:56:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bg24so4289305pjb.1
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ISrYRqi5+w3aeq7oc2sJ/eee118BEF7YlYSYWqp1CI4=;
 b=Q8M6IbOA95iU19gJhT4I7n1wJe11lhYH+IB3ofiBTh3IwT9OgxjsbpnBuxjYidvPoS
 ZDJF1DKEmC/0HLP/tQeFKmtvSWr8TyRJQh/7F9U077PzDXEvA7lW4aAtqz0YWRKzkOyV
 lC6MDc0hldNl47WBKEc1cWxhBi+kN2UksXuYnwkOdlKYk9oisGsM7ajWRg8kOiyrReDf
 7HLmvZY7Lvzg9kNjhYivIeBOvRcHgZSbdD08jmfjo7Mnw2J8JakNAN/ji+9iI3a/QwS+
 7kaRX+loxPr6ZhrlAY+u1+alNq5fKar7/y91MUbaiHDDks3AGiIlWZmEevFW2KekwK12
 mqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ISrYRqi5+w3aeq7oc2sJ/eee118BEF7YlYSYWqp1CI4=;
 b=qcSKWPS3KccCA8ry6ZtauU70Og0QHdY/GZkmkHvrWmqs66UCJJEU8anrMmsB/D70qk
 4kEeMt2zn/aIQFMWkkstU3T6WV8t3FT02nyYmPJnWkLAW42GsDHdd6t1jQozP+OTuRiB
 U8YFQijrY40lMu8GL0X/n2CJB8ciGDsUrjr4YZvWUwPr++7SfYCEQtxaUfMtoUatJGFW
 dzaJtd4z6CX3IVfpKBlItVRloXtO2SByvjfbuNXxfL8pU0u7XPi0pBCYz1gDK4Lb3INS
 zTSjJXQY4dTSyXNQ2W5lf/H7HcQ1E2StgE5QRm1MfBHuRxjv+HElX4WLR+Lwz8KIDL50
 jEDg==
X-Gm-Message-State: AOAM532hlM9aqb0wcm5oNMaTjm3O/jEa3YVOZZB8FrcWt64r70NjcXV0
 D0SYMeimjzqDbr5bdiWrivXI9Q==
X-Received: by 2002:a17:902:70cb:b0:158:424e:a657 with SMTP id
 l11-20020a17090270cb00b00158424ea657mr11984788plt.6.1649721398876; 
 Mon, 11 Apr 2022 16:56:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a63ac0a000000b0039901c45810sm778369pge.47.2022.04.11.16.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 16:56:38 -0700 (PDT)
Message-ID: <604c2f8d-95b9-cef9-21e6-a6fe569e4805@linaro.org>
Date: Mon, 11 Apr 2022 16:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] target/arm: Define cortex-a76
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-7-richard.henderson@linaro.org>
 <CAFEAcA_2sWO0LtKk+10Ktyhrn5WGV=9eqA+yWd5Mt=nUiJpAYg@mail.gmail.com>
 <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
In-Reply-To: <925dd928-47e2-2bec-f97a-7041b6b6e649@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xic7gw4Om0oU

On 4/11/22 11:30, Richard Henderson wrote:
>>    cpu->isar.dbgdidr
> 
> "If EL1 cannot use AArch32 then the implementation of this register is OPTIONAL and 
> deprecated."

Which we already handle in define_debug_regs by not defining DBGDIDR if this value is 0.


r~
