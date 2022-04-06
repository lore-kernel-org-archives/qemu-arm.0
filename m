Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp723469lfu;
        Wed, 6 Apr 2022 07:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEG1braUQzDS2uU8qihDyKbQ3P27BCUFwzDZT6yqOfL17OHbAj0v82/RaW6MdGLOJhugux
X-Received: by 2002:a81:5751:0:b0:2eb:645f:4d47 with SMTP id l78-20020a815751000000b002eb645f4d47mr7481463ywb.492.1649254024774;
        Wed, 06 Apr 2022 07:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649254024; cv=none;
        d=google.com; s=arc-20160816;
        b=HC5QAbxv7B8s8JibMvwaqXV+GD16InQxGUiHqutRzl/z4SSeuSzJrxeaAs6zL8tHEZ
         AcgBh22cHUbPvfgxhUuIGi9AbNGKEMGblyg8EA0wZAptbq8iygI5rIrVUWybApYKCrDr
         WliIl5XjCtysf1Fdmm0S1RvIlMTT/gjPfI7GdBNq7ro323NptCIwSZFktG6U55Z89Tet
         wb+5JLKFQhKhFtJamD5iHRXIj0VWBxU+K8h+KPm2V0agbT+zwYR/ZJ7zoLxL6dkQQ4Me
         QhgV0ZB2F6oHixBRluB0+fDqEeBNCJlm1MFwjCylx8ZRicUP6qdrxhBo5DjgCUUK9+lN
         AQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=J3uV/QbvectnmlG0Lw5iMlIIjPNUu+gU46IN+EVMLws=;
        b=i2ws8+sZtnemxjNMdeq11Oc0M1J+qaJ/D7ktOdlm9MuW/YLK0JvFnG40AtlcmnmC17
         UANNo7fSw0+7NDUBDCQ3lKhN9eMkkolTCq4FYSJYSUem7tjkZmGbYoA9hCc+tqsTjnRz
         ZQuhCYxxAqsakpo8JbOMdB2JFajZNEjdQ+6p9gAbu6Hm+NgchOxurod7mxQuXDD/FROf
         cSHqZwp2a/+8nOuLY+auqByNO0TJl3d0VN+q6f/QugiuEQ0mWEpfa+1lI7sD20bHxXAA
         uHUZdU4DJA2QUeuuSfyOxgBdsDm49vdpm/Ah7s9xJVQ+4dAiB3BOdPVHY9WlAoORiUxj
         8JeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fedx6F4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h62-20020a0dc541000000b002ea6d45a542si12090279ywd.339.2022.04.06.07.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 07:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fedx6F4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6JM-0007CU-65
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 10:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6IB-0004gb-5W
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:05:51 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:43707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6I9-0006xD-Jx
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:05:50 -0400
Received: by mail-qt1-x82d.google.com with SMTP id t7so4341813qta.10
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J3uV/QbvectnmlG0Lw5iMlIIjPNUu+gU46IN+EVMLws=;
 b=fedx6F4d6xB62ujw+U8xCdmmy5NYwFkNnYn6Ja928EIf1LEHNxo1w6jNxXzi+FhHby
 0mFHEw0jKEQSbC0CQBDvhMCsgAjyVcFCAENJ+SdH3har24nEqPflC1tXvtY8YauS+mHi
 Y9y2yedP0E3JQMyZvdWxRklVY9J+znXIlAigVqXirUGaxZSGI9X9IVrx6uuuaJH2RSjj
 vbISIt+McEw+pB3PJveF6FfLYQNqTpC57dxSYquyOkJb8T8lQypHSjQoAtBhEz27+0xt
 1eRCB/vRH6qlVgoCeWuWX0yOBJwkSXAMaCVS+4pQNM9rQpl772rOHGx5SeZwYyuFOCCn
 Hv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J3uV/QbvectnmlG0Lw5iMlIIjPNUu+gU46IN+EVMLws=;
 b=ywckuw5HXkBLRwA6lGn1tfnjlgRW/wbaQtA98jm/EzXApb/bChy7kJj4p7e8OIPKsN
 p1/Qpr5xEELEjUGy4jyITRdBHaTsaNBWCOFeocgMCpYaPPPahUBO4JQu7/akGFmTZ1PM
 loZPsE3XFWyyxO2ex5mz6wT5FFEjx+pUzwyIzwZguOJGdHm7GiVIqeVI8D7mswruptOF
 P6y/3QLVOpjOh9VqXFBS0Grs1CDCrQi5dVLsTXmh3FJ9QHEFJnw3hw60KbkySdqxBDat
 MsitzkzbH97ftRLFuetuXHk9EGkoIPSUQMf761mM8sKDmmhs8X5EV/biGlKsT8+PEKmv
 ptbw==
X-Gm-Message-State: AOAM532j5iQGkfabIxA6nPsAkYFJfoGQtzLRnMJvZ0Odv+7rFK4jnRFb
 fm6jrTh+mIe/a8Ku5aafXjhYFA==
X-Received: by 2002:a05:622a:513:b0:2eb:871f:cd66 with SMTP id
 l19-20020a05622a051300b002eb871fcd66mr7568216qtx.434.1649253948536; 
 Wed, 06 Apr 2022 07:05:48 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b0067afe7dd3ffsm10856036qki.49.2022.04.06.07.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:05:46 -0700 (PDT)
Message-ID: <24ff4e51-dcaa-37bb-dd33-04821bf48023@linaro.org>
Date: Wed, 6 Apr 2022 09:05:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 17/18] hw/arm/exynos4210: Put combiners into state
 struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6k6OTowsuH0T

On 4/4/22 10:46, Peter Maydell wrote:
> Switch the creation of the combiner devices to the new-style
> "embedded in state struct" approach, so we can easily refer
> to the object elsewhere during realize.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h           |  3 ++
>   include/hw/intc/exynos4210_combiner.h | 57 +++++++++++++++++++++++++++
>   hw/arm/exynos4210.c                   | 20 +++++-----
>   hw/intc/exynos4210_combiner.c         | 31 +--------------
>   4 files changed, 72 insertions(+), 39 deletions(-)
>   create mode 100644 include/hw/intc/exynos4210_combiner.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
