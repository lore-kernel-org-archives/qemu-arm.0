Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1449447lfc;
        Fri, 16 Jul 2021 09:28:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyi2ayxEWyxITUEAQrVcHHYSWZvQnOpiadLVFQ/FhywaKB/5Pg2h9ueBy+x9I2Dyjc6LBgQ
X-Received: by 2002:a67:688c:: with SMTP id d134mr13211996vsc.16.1626452890663;
        Fri, 16 Jul 2021 09:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626452890; cv=none;
        d=google.com; s=arc-20160816;
        b=cLjofcy+cG54eQy11DsAgduc3VExJMLd+/MDksrmD5uXPSya3PVziORKRTqF/o7a9A
         qVKBnun5qRlcZOqRYvK0K5HbPHhUyGpK9Bwmg2YIqLKRBZ70KXdsK+OzSjKcPIbr48gD
         iZtzjfhCtaDbYoLx/11piOxysH99dwT16gVm72D13FUmuBXZw5fHfL5EEUr/lXc0/wCf
         gU70qdAqF+BPp4sl0sW5UMepRFqYm46ZFslevEUHM2EMXOpOhvLz9aYTiqM30M6vvdFi
         peiRWif66C4ZFNR1Irc/fepStZwsYlDXA6ekhLCaD5/HmtP55RUI3R+wleMXmCufPiNS
         nqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rXPIG3xCGF57HocfI/Q62h95ASlLTxwHXrO4JHTtXhw=;
        b=jzzxRWKqLvGLOCth3rf2u723qMBdW1rAiLd/25je2LZEsXIPri5JjHncsjqaePBXkU
         6YVZ1ybEO+OD89CydqQmtQE9apASPqOt/E5eZkiq8PaYMTOpO2VdnYiXgU/7jySkrrXX
         nWAv2/B7dy25Jy9QArbsLf1gyVmPEWBtFpz9NTX5xC+boHLFohk9K/uX96SYMhhcfvp6
         puAu0DxoiitrpA2ukl7rfGg/jIkDjV8sT1SfONUTfwsmNHeFYKKzBZIa3Em6husY4DJo
         iTHABnGDQDfUJEviyc1pv582tJ3vwHL/5m+/a5l5Jt0GIQyu9gyn38UAPRlCPdiYBK4h
         umfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L3i4C4YG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si11685052vsh.360.2021.07.16.09.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L3i4C4YG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Qh7-0008Ce-Vx
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qgz-0008CP-Rw
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:28:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qgy-0003Qy-D2
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:28:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso7844991pjt.0
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rXPIG3xCGF57HocfI/Q62h95ASlLTxwHXrO4JHTtXhw=;
 b=L3i4C4YGvL5Mo1x5Dbu/rLdXV22IX9HUU+1ngb75VoYg+gXonQrwkkk+bEEzxDD57i
 mvb0hA0w6TNaHSeWhoWtPrRgGMmlo9BfaGqcpAAmVIFj2W/2CvLbcgjnwjsS/V/ctiXF
 optE4voDpVUbqIt/iVpdTUVEUZfXGSVP+qp7T6+z70+rTb03SskqPMXVAkdo/FG5PyqC
 5gLtESS3aqfrnuujV13hDZP6V2hKBANT9Hi0OxxgcwKEtFFfmpf65ZcCVKEBL7BqyXOh
 knv+iyLXgie+OkRni7bwAGwO2lvGxzxJxUtTFTtHlrccIY2Ti4wLMOBGzheHIyEpA7ki
 2cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXPIG3xCGF57HocfI/Q62h95ASlLTxwHXrO4JHTtXhw=;
 b=EOGEadjG4VJjwiiOo8+2AEBQf2jga6R3yqCv9Ha7qIlDAg9M9gafAsZer88pjvu7XE
 LThuuAgAIMIaX9Oql86EkSanL1HfNfnt1k8PSxZSDMTfob3tl2rCzJaXdb3eVRkfYVpU
 zp+//adpvKnq7gK6vmWK14VmC4YlukzsuPyTPE0HbmEIzZ6FGXmzV55GL+NF1ggVYIZn
 YpU8ItHhNChcfAMABzeR6vAW+saQnjNqeqtWcy+7Q6zzTigheLFLSE/a6W5PdOjnT6sT
 97eU7KOFoqBpsdLbIsr/kJePVsrfDujg1gHMT9ifzVsEHWv53VUx097mMsC7voMSdWEs
 RDKw==
X-Gm-Message-State: AOAM532PlY3G7rvPJK9Eo5PHqZqd+SVEfqepQ5ziSmuR4bzxN9juKo6a
 1AJjHJ6I4rJ1qpM92t/MEbaBFw==
X-Received: by 2002:a17:90a:5b07:: with SMTP id
 o7mr10825783pji.35.1626452878785; 
 Fri, 16 Jul 2021 09:27:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b10sm10506850pfi.122.2021.07.16.09.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:27:58 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/34] target/arm: Fix MVE VSLI by 0 and VSRI by
 <dt>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49e5cfc1-518e-78dc-f212-558b69a39451@linaro.org>
Date: Fri, 16 Jul 2021 09:27:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: abtNsh8PoF/T

On 7/13/21 6:36 AM, Peter Maydell wrote:
>           if (shift == 0 || shift == ESIZE * 8) {                         \
>               /*                                                          \
>                * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
>                * The generic logic would give the right answer for 0 but  \
> -             * fails for <dt>.                                          \
> +             * fails for <dt>. In both cases, we must not shift the     \
> +             * input but just copy it to the destination, honouring     \
> +             * the predicate mask.                                      \
>                */                                                         \
> +            for (e = 0; e < 16 / 8; e++, mask >>= 8) {                  \
> +                mergemask(&d[H8(e)], m[H8(e)], mask);                   \
> +            }                                                           \
>               goto done;                                                  \
>           }                                                               \

VSLI is d = op1 << shift | (d & ~(-1 << shift))

for shift = 0 does result in d = op1.

However,

VRSI is d = op1 >> shift | (d & ~(-1 >> shift))

for shift = 32 results in d = d.


r~
