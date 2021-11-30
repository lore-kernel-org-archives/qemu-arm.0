Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5066196lfk;
        Tue, 30 Nov 2021 09:44:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWFlYPQjnWo+oIv84jSYT1U+5zjGeFN9aDV39irlwkd+s9pLLBOpwxf8H+0O+kdkzf+m4d
X-Received: by 2002:ab0:7784:: with SMTP id x4mr988083uar.143.1638294266661;
        Tue, 30 Nov 2021 09:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638294266; cv=none;
        d=google.com; s=arc-20160816;
        b=xDdn+0zihgCABGS7YE/wHUQVvRWFmMTBQY54At5nuFuXUAjME5TMLPU2IhTb9XzOmk
         n2NIvxDIY6jCb7xQequWehjrmIvH6pnBsvN/Uo3gJYG4RfA/54hCg5uT+rw4M42KfnMK
         LbWYJiQXnoSLvVAzp9gs3rXmZKlFVtkS8Kn/wOXauyu6Yb5VtVXGwGRMGNCK+PdghY+n
         gLUqaH0kJ1AbBMEbAwONi+TNcfw0VhzhnCfisCA8r/fnkjb8vSXPR/2aBWQI4apFAzHy
         QYsudWJySpO3sFMm0q6BJd5l/Az+WvpAKaNsAt1HAM974Wff5XyZlSx6c89pIxJ4CJzV
         nv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jLjkq309a4RQ6LVBNbmNUfy+IvIk2YTkS5p6OfsTzlc=;
        b=aSUmsYmKCb2HCny1IWspYb4fGOU6rnRQvm/EFqcrwc4zNvXtLBb20DHuyEa8uDFvdh
         XIpJRjbp1P7RLkEhdzMcJsAWJt1FpdC9ia4zR5F4SyYYWuQxmWE70nnXBquNOgTQHTtl
         U2YVwsuUNEzmElUXOuRRAFpqXuKdAAIxqZDqkXnQGqVrGb0rfuKlzQ5knE+Dd9dDb5+k
         82MHY8a5IU/TghWVkq7t+OH35IYhkg8hV2WGMaEOf3jna2TLYEpKlsQTM2V7vlSowFO/
         mW/4G8+UrQqae7zzFeNlyysiwhRUWXp+O1MShRwB8fj5Fw5eGbsHLnHGdMmFickriSDp
         uLjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MEI/28Uv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m58si10110153vkf.79.2021.11.30.09.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 09:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MEI/28Uv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ms7B4-0003nV-3E
	for alex.bennee@linaro.org; Tue, 30 Nov 2021 12:44:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms7Au-0003lV-Vy
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 12:44:17 -0500
Received: from [2a00:1450:4864:20::335] (port=51083
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms7At-0008HI-Fx
 for qemu-arm@nongnu.org; Tue, 30 Nov 2021 12:44:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id 133so18225183wme.0
 for <qemu-arm@nongnu.org>; Tue, 30 Nov 2021 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jLjkq309a4RQ6LVBNbmNUfy+IvIk2YTkS5p6OfsTzlc=;
 b=MEI/28UvuCIAVbYTv3k2Yg69sL2dzjipaFN1Z8bfE4ohoypfp2VFgFJoM+nDc+GTNy
 99Y+MeNElFkEYZ95ngrfhbXfzUd3wvPwiq2gREupAKU+eSn3L170lpzYsoT+rubQXKYP
 cNplcM38ow1dTcOYaU+ukVaEbl2HQlTqZE3TcLknM0+1D4l1cqVhT5hGqU4C94HK3LpF
 2uAqgD3HgmUHxgiIZvxA6hIm27vBv3hzB/m2BT6Fjm4E1W8Fk+EU0HpsMfXaL7Jg0Rnr
 H3bz8Ijls4xrb+FDTbq0oGIpmNQ9gUOoBl03P7TrmzJgZC23ccLnNL/8M+5k7hGIplM5
 XhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jLjkq309a4RQ6LVBNbmNUfy+IvIk2YTkS5p6OfsTzlc=;
 b=rj6YkjUHvxH+HaCbRvcxodPnHDbaRenvqV7AFQJbvJRCLsOOS55j0NyWs/AEKOR/mU
 YLvNC3RTm73SzpMtWItsXobtH1Nf0h7SSDQ4W92BKELyLzg2gsSu/H/AXNV1yjIe69WB
 HoFUw/nGj6VMru9Y2/oy/bHYeJQS8bNFyQ9gai1A65xLqq2yqETm/nKJtfZXjcn+v3LA
 DiaNrywldRacCyn+gj01v81sYT2l70SoNe5EL7zC2pL3YqAVPt78kS0eJb4047UhkVYK
 uiMF6oFv4tL89mYmfaNMTgq+HwNu6tIviNTf0adArHEya5lI+dZZ56M8tbWkkdUq7IVH
 Ac0A==
X-Gm-Message-State: AOAM530dxLyqUzC+bYPV9ZyzyEZWSNPzGcqRTr/ik6YtulMWQbE2D/wo
 ZxmM3aEzd0KhsD/50fWg8xNIHA==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr93119wmd.103.1638294253845;
 Tue, 30 Nov 2021 09:44:13 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id g5sm22563642wri.45.2021.11.30.09.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 09:44:13 -0800 (PST)
Subject: Re: [PATCH] target/arm: Correct calculation of tlb range invalidate
 length
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211130173257.1274194-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57c19405-15c9-fb06-1e9f-6377e46e2d4e@linaro.org>
Date: Tue, 30 Nov 2021 18:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130173257.1274194-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zw2ZxtZH0uO7

On 11/30/21 6:32 PM, Peter Maydell wrote:
> The calculation of the length of TLB range invalidate operations
> in tlbi_aa64_range_get_length() is incorrect in two ways:
>   * the NUM field is 5 bits, but we read only 4 bits
>   * we miscalculate the page_shift value, because of an
>     off-by-one error:
>      TG 0b00 is invalid
>      TG 0b01 is 4K granule size == 4096 == 2^12
>      TG 0b10 is 16K granule size == 16384 == 2^14
>      TG 0b11 is 64K granule size == 65536 == 2^16
>     so page_shift should be (TG - 1) * 2 + 12
> 
> Thanks to the bug report submitter Cha HyunSoo for identifying
> both these errors.
> 
> Fixes: 84940ed82552d3c
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not marked for-6.2 because this isn't a regression: we
> shipped the TLBI range invalidate support in 6.1.
> I have no repro case for this issue, but this doesn't break
> booting an aarch64 kernel, at least.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
