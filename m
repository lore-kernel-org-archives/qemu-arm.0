Received: by 2002:a05:7023:c086:b0:69:9a19:fb41 with SMTP id ip6csp2739336dlc;
        Tue, 22 Aug 2023 08:12:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVG4lHH4djhw1+0hKqjlXBaU3JONQ2rLqd2mYFcGh+zOFM1beMTdJ4OCIJkB2+5v9jjFqR
X-Received: by 2002:a05:622a:6695:b0:40f:de47:9b6c with SMTP id hx21-20020a05622a669500b0040fde479b6cmr7648186qtb.30.1692717141686;
        Tue, 22 Aug 2023 08:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692717141; cv=none;
        d=google.com; s=arc-20160816;
        b=YDMGlOi6RgXHwrR6imbVcxbkvyHTp341kpJSGNmh1hh2XjiOY1HJdFr8qI0sAjp7p5
         Lgjsu80DFEGQ8KtEWZohG0rCEyjdFgNrWXt4+SzxOy3rbIousY98Z3LnlXg2WLXcvJff
         +LB95W+tmB4gPwFQbNjzEYg/K/R73Amq1BcYja9Zb2A/d7Kv9+Bs4tAkfHvc8yXGfFEn
         4bNxXeahincrGvOyAPnUi9l7wNvrjZRODDek7XmSmZGf6qVIFTgzDYGSm1MxcujFyU7T
         wxCXy1Jw0FePtkbwCrAtwovDWF2iWCDXI9KUFOg9azVB9NVcdwy4u+ZH+A/Z6L6eIc1T
         rX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1xii/lB8E9xyRJssEMiiQEzD981/lW0wSZRI3rNo2JI=;
        fh=IzkshJUGWO2UnAxhT0rhoUSUmHocHU9nyHGLKQhM9qc=;
        b=XGxhPCIBS+BOw0tb0RmXvMO42gDSbNu9tKXUpSF2ge5J2VOX+4fOr+UxlPWIurDVDD
         ahaAQsiZeV9YwrwlH+fJs98vFXPIfeWGQhY358acrVZse6MUqqFbICUjaQCH8LlBPdQt
         tTJEr3rxIT1mOWC+wzJqdHl2JyZKmJPX0Wl6vgcuy0VWMZJ+W+l+e+PbMz9OqBGApXII
         MSFGzkWtFri7B0VG12lQJQ/p4fjY5neZs3kAxkNpfP6uZ9KmCO5j/+2twjZ61MF4Xkzg
         gWorPER0uSs/tb1CUtun+k/f8Z/rVrUAw/dqc1RlCFTgpt1PtjhRuoRErcn+X4jItpPH
         5N7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bpddwhnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41-20020a05622a1aa900b003fff01022f8si6356976qtc.520.2023.08.22.08.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 08:12:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bpddwhnv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYT39-0007px-Jc; Tue, 22 Aug 2023 11:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYT2y-0007nK-Kh
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:11:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYT2w-0001lm-1K
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 11:11:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so31100395ad.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692717112; x=1693321912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1xii/lB8E9xyRJssEMiiQEzD981/lW0wSZRI3rNo2JI=;
 b=BpddwhnvVS2WnGcdm06QrUhpcVAvRTf57NN1ThZZEYYg4JFBFU5gzmcCcIqble+RTo
 QXrsOWXeQb/zwC0T8pW8C7fHhOnxpk52CPGzRo/NaZgczJa6fuVvHzF2TO2ppilzB6e9
 Y0KsQUj20xAsjgLQ/GtlOplplxIh+0BRf3Lko6HyOLxNvoKnUEu27bvICNP8QrWN6x/T
 +x/g1mYKQyhGrqkxUK3gpMIozJZ+D6Pmlis+JMwbFHD60HMKceKB7nI8BPiNuEnwE8Wg
 /Fprm/suGYjM50p02POFjnbaJXK4bXRp+mY4TBqHuIZRaylFOMNR4MxEDOX7vzMN9PWg
 PEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692717112; x=1693321912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1xii/lB8E9xyRJssEMiiQEzD981/lW0wSZRI3rNo2JI=;
 b=OPSWPD4m24KJd+UoC7CdeXvcNhGv4IswyOAykKOGfw6WIdWlOUxaE73Rlg88jh1j1u
 EHI0jDzYHDj53sQEkBShIym244cNVXC97y98nOrN9tsKvl4neH1AzwoBC6fEk1IYRq1u
 9AIVujlOCJ91R3ng+X5mN4g3gENxrVmNeqZDqQaSjkSBIb9LXYuDuQf4c5Re4lSt2rxU
 ixNY2JDoU+/xyufhXesZHQiW4k3s5PRpRdFapYC0iMjtGDViPgh6s/sKfNDK2CXx8aTu
 xqYbjmdLIyn/W3RWdCg37s29UkBI3769v5OaI3/vbWrAe+Kgbc70IvBqQ37e+GNs+1IL
 Oujg==
X-Gm-Message-State: AOJu0YximQh0UcAlraFGX6twKnqO4cQsq+Pyws3pvKTmpjc+RtUU4w+j
 CEc5zwcRunewU812ajwfWs8buQ==
X-Received: by 2002:a17:902:c1cd:b0:1c0:91f9:aca4 with SMTP id
 c13-20020a170902c1cd00b001c091f9aca4mr2471055plc.22.1692717111987; 
 Tue, 22 Aug 2023 08:11:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:4e3c:f4a4:b92a:b5ab?
 ([2602:47:d483:7301:4e3c:f4a4:b92a:b5ab])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b001a5fccab02dsm9173848plx.177.2023.08.22.08.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 08:11:51 -0700 (PDT)
Message-ID: <ff04a8bb-375f-bbdf-f9af-af4a03aefdaf@linaro.org>
Date: Tue, 22 Aug 2023 08:11:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/6] target/loongarch: Use hswap_i64() in REVH.D opcode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230822110129.41022-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: qxzAhL6efQ0o

On 8/22/23 04:01, Philippe Mathieu-Daudé wrote:
> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> introduced the generic hswap_i32(). Use it instead of open-coding
> it as gen_revh_d().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/insn_trans/trans_bit.c.inc | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
