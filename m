Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3140213ejb;
        Tue, 30 Apr 2024 10:31:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWEbye5zLeGEOcz9Qb32vwZbLnqvrGJELU/QlunsuZ+BYmYbZw6FWOyMQw5H3uaIx1oZLrexDczB5/ENE39/uXmP8M+lif
X-Google-Smtp-Source: AGHT+IFG3RcifK1wHZsjEN912Ar9/kjsef7oQ08oNgT/yzwFa//GUZj9GysZRSQOgNjIbt124Q+P
X-Received: by 2002:a05:622a:4cc8:b0:437:9c7e:ab1f with SMTP id fa8-20020a05622a4cc800b004379c7eab1fmr4852099qtb.33.1714498309804;
        Tue, 30 Apr 2024 10:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714498309; cv=none;
        d=google.com; s=arc-20160816;
        b=eMGsLBARPRgP5WUe2hlLaoiZd2Eiu8/XyFVmP3XD/+IqRJYJZ5C+QtsWnInryQiYHa
         17F+GVb4XU6hx55PMK+q6deaT1ggMCbomq5ZA1kH2aLSatuQqp4JSpkRtNMY20pAEA56
         45HFnCdi2JQleHpq0a0dXof4VSIM6HkKXvNNsaBPBzLCDSIoPBcgo2OQP8zLxts1NWb6
         tPoac6n48KnB5P8IawIfCvgvgmlRJKg0k2A5Hqw47PN7Ynpe16xnggRCD0lmaFLwo7Qr
         DYZG+Zv/YVhNuoFBdJZ9GDCXxqP6bppdyJDy7AiywDgU16Y+81jmTOGrnrXpT6LjLU5A
         lhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=X/0BQ0Zo0xdN//RoQCbUKq7i7MvhbnttPfBvLSp3mMs=;
        fh=8uFrfs6IBE73PPBENQncjXphEOJprtPrssSsJp9NBR8=;
        b=Hf67SL9jmylStV6SEPwp+8b1mlIueYPksOr1cZx6BKYtCv14VGw2lBK+SVjBAYKjp9
         sdJkx52QokmZ0tbP7C+fhf5E/GjSikgMCA7w8srmVG9cIrw73pLukeX112Ao2KHLWlMB
         SqmzpqcpUMW6y/LKp7e+FzBq3QsVNVi6+DplOtCdiQQsnSYOINovCIjdVQ96y8tUVVxf
         D57VccCod4zc19vccJ1CMvdfDktGsGNeNuyd6Wojty53XcYFQhF++nkunD28LNHdasXZ
         ro2vDxXRuBJAqkLp/wCTUHHOH6fYP6onoQ+imesFRs/exOIobBMUsZ8LbHoY4BJZ2EMA
         ErPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onM5SP6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a02d200b0043ad4f5c3c3si5969786qtx.156.2024.04.30.10.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 10:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onM5SP6R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1rKH-0001MP-Fn; Tue, 30 Apr 2024 13:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1rKE-0001KS-J4
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 13:31:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s1rK2-0007SI-Np
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 13:31:30 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ee12766586so50938b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714498276; x=1715103076; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X/0BQ0Zo0xdN//RoQCbUKq7i7MvhbnttPfBvLSp3mMs=;
 b=onM5SP6RxVVPXzJCzzWKwRS+PNJxjuh6eFkJ45q0XQ08sysGmv67qfVZVF6bZ2kenx
 ObHoPB2vUtpxOu353KPRK8GfD8eRzvH4N3ZKA5N9gACXVt/8mvz31jnh1oO3P+1RbuCv
 6qLhHrY+bF7v6pY2C+fVZ6zuXlnN1aM12+iLuHNXyt5L2ekZfw1YOO1t3v9irgEsbSys
 l53saiWOXV474lRFNhnFBrkKlRQokgGgxCoRstgjOMZvNy5jywQ4yPmrIzS+0aXN40vy
 SYapQrOf55qGYqtD3zSQlTsVca2AZw4noJyw+P01qOInopbJCzqPJXzOPqGOkWtQt5TG
 mJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714498276; x=1715103076;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/0BQ0Zo0xdN//RoQCbUKq7i7MvhbnttPfBvLSp3mMs=;
 b=b8rVJ7OVgyqnUHBZ4VuIHNJTIIkuCS8MXnhN1r40XfSRUiHoPHyLyOR3GIAtwx5t7V
 M7ipHXSScN+wO7wJGBa0wBW8zIufVgCm9q7Wo6B38kQ1J1gG+840BwkF5M8/1CmZMSdY
 46hGXlmkERhyz7g7Mcvo9IPCkD+EKjE2mpdij3wBckGEGspA/7EPzfBrZEIZwKdXcyLP
 DDpd9FNxrasGeXlANxGUThLDI8KjxN75d2rogypJC0Dh+JIG8WJzRjet0qy0nuZMe01o
 v3/PUdcM9f9uNjEosF+TBIM75pusS18e7snRJDJX8Ixsw93SpExgHWAKGkwPe3JQuT7y
 uoOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfWOu91Q+YvBpj3iPPDaTv/u0FiEAovKPERzEGc9e+D8dgSvhYmXOUoh63okTH97OGuj/8zxpHZUoydKTOn58Ybr6d
X-Gm-Message-State: AOJu0Yx+Y4T1NmtH4RQMIExQd625qkFbVekya8aM0RNNAs6rbaMNHSPw
 KbPBbZKY6w03LmE6dzmYbS7J/6XEChUTI+X4ORyru3HV4I3z2Yphb2WUyII9+Xc=
X-Received: by 2002:a05:6a00:2450:b0:6ea:c7bd:90e3 with SMTP id
 d16-20020a056a00245000b006eac7bd90e3mr706698pfj.14.1714498275955; 
 Tue, 30 Apr 2024 10:31:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 b186-20020a62cfc3000000b006ecf56cb55fsm22839331pfg.96.2024.04.30.10.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 10:31:15 -0700 (PDT)
Message-ID: <8004c7bf-3185-4eba-8e1b-4a913bc1143f@linaro.org>
Date: Tue, 30 Apr 2024 10:31:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Implement FEAT WFxT and enable for '-cpu
 max'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240430140035.3889879-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 6IAHPbeW3H/9

On 4/30/24 07:00, Peter Maydell wrote:
> +    if (uadd64_overflow(timeout, offset, &nexttick)) {
> +        nexttick = UINT64_MAX;
> +    }
> +    if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> +        /*
> +         * If the timeout is too long for the signed 64-bit range
> +         * of a QEMUTimer, let it expire early.
> +         */
> +        timer_mod_ns(cpu->wfxt_timer, INT64_MAX);
> +    } else {
> +        timer_mod(cpu->wfxt_timer, nexttick);
> +    }

The use of both UINT64_MAX and INT64_MAX is confusing.  Perhaps

     if (uadd64_overflow(timeout, offset, &nexttick) ||
         nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
         nexttick = INT64_MAX;
     }
     timer_mod(cpu->wfxt_timer, nexttick);


Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
