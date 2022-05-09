Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp3925467lfj;
        Mon, 9 May 2022 14:27:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaZP2sKqim0BvibzTTU3T7BQLw2BJ773NMri/0pTiu5ay4LcaJQhBIszgXaMzjyiwmtcrj
X-Received: by 2002:a05:622a:1452:b0:2f3:e070:e0bc with SMTP id v18-20020a05622a145200b002f3e070e0bcmr3430380qtx.574.1652131624925;
        Mon, 09 May 2022 14:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652131624; cv=none;
        d=google.com; s=arc-20160816;
        b=URtzOWiQn/6xEADTatrJbl+qt2UrrLGWXO1f9WkXcWa5T/Som38PUUedQe9vDCsmmU
         jwbxeE/KJByF/+nszPyA4FmHH5aHHBRBHsJxWQHMWh3IEYBy5Ymqz1v96aZnoQBhEIZY
         bCG9r3tE0aYi9t+JFyQv8MYoZ5bR1gpLFUNopIs1a0DHnKNTi2ZBWv1NI5+2yn/JtgK0
         EYc4HV9+TVJANheHgxyEx5LDQwv5pYgG2URclJZghYAjxWmQD04FvJEmUqEMnAIlBfvb
         Jhu8q4JY487NRbv91+6FYg7NTfX9fPIeZ6siTxgk93qRj4TU9jPc1ZaBlmiY4QDYaRpC
         wLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qLah0BhidgIR8KplR7yEqeBZqE7UFVE503Vq78a3ej4=;
        b=Qls3cFNguIHeIEtcsBFlwzZgsA1Msbdoianvi2Es5bOF68zNg6s5P+sh8mVassBEca
         h8BgZhC0dCHJa1MyfNvetvbvEw2l4H33mjwHEk1IXhNOsCFKJdq2LliIgfKamX4AKb7Q
         WhV5eQDfrtl3SrClAr8imBhwZmZ032lzj6Vrf2e1tAQ6+Mo+ogGgvYg4qrcWLHwGEZVi
         tG9GRtgfajbyrjzcogfSyJMBduHVXMcas8AvW7NyIJZQiWINHk18yZ+hj9TToBQqRPn6
         SgDK0+iRqEHBvIWfCxuZgOIOaMCiay1POIZJIxrfn6cK+LQ9UFCHt0daFJ1XlgAIn6iW
         aDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSnjZT0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a05622a058e00b002f3a7199623si8829888qtb.545.2022.05.09.14.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 May 2022 14:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zSnjZT0c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noAuG-0005yh-E5
	for alex.bennee@linaro.org; Mon, 09 May 2022 17:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noAsD-0002w3-V8
 for qemu-arm@nongnu.org; Mon, 09 May 2022 17:24:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noAsC-0000Uq-GE
 for qemu-arm@nongnu.org; Mon, 09 May 2022 17:24:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id o69so14217005pjo.3
 for <qemu-arm@nongnu.org>; Mon, 09 May 2022 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qLah0BhidgIR8KplR7yEqeBZqE7UFVE503Vq78a3ej4=;
 b=zSnjZT0cLUQqQAaxieS2UcqWfeCNEedNDE3UGQadk6MY04bROrpH7Qu1vUYxW4gKeG
 pdOfPz6kUdGg2/Wb/Dqz6cm8LCfWcjfmpgY1xofFgZqOlILBvjUV0d4EM2TgbBWO5wqH
 cs/FaSt5nKgSnN9QUV5ehXvjnr/RkcBzHcpJZsZ61HG0OCd3sQjnJIsRPwbTI9vZxg33
 nlx+Ft45p0o7O++X1JA/4enYsyx9PBG+gY4LY8wz7VM2xd+JXhdXNytqO37AhJ8Li+yr
 DEIwuPGwVaAQsedOevcdYVoVYCiyfnpFdPkK9R8Duv7Zkdg6nKengazGlQnLsD1AIFbP
 bZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qLah0BhidgIR8KplR7yEqeBZqE7UFVE503Vq78a3ej4=;
 b=OrbnCnGJVh9VFW3BHpRHGdHN85FdfgAyln/NNlsB9x44d5ajmqkgpRNCp149mr8N5d
 CPH3RiogzWf1sdkbbF0E8JsWhTsnpJaUnVjYoNzvTon12hTOOUoFpRflaMZaQDlIn0Jb
 dT9erywzD1PEbKYB6ElzwFsTM+qhHlEgRLPYULRpa3EZ1inyscvNzE/6U9u6jcjnNYQ4
 pWkF/pFHi0BzXDgh3OCgZkKfK3mEEPk6qnSeMZktBo1XYfV1VlZntdoJ5g8v/4kJeEWu
 b3MK8cYG0RlgnQiY2T83jWrhUAAJl0Iy4cI9pP6ciTQM+mBNC7YREbjHq+sS75QLYK4n
 ayGg==
X-Gm-Message-State: AOAM533XqRIEMuAqXYEp/MkjaWmKNP8yTqsgkZM8cl7RG6UEAahz0FNX
 Bzl+53dUtVC/X3Apx/niwXRshQ==
X-Received: by 2002:a17:90b:1b03:b0:1dc:a80b:8004 with SMTP id
 nu3-20020a17090b1b0300b001dca80b8004mr27872193pjb.182.1652131494885; 
 Mon, 09 May 2022 14:24:54 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b0015e8d4eb285sm312119plg.207.2022.05.09.14.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:24:54 -0700 (PDT)
Message-ID: <995ec3be-1a3f-4f51-35ac-bad866d75e51@linaro.org>
Date: Mon, 9 May 2022 14:24:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Implement FEAT_IDST
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220509155457.3560724-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509155457.3560724-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i5VDWWiTj1j3

On 5/9/22 10:54, Peter Maydell wrote:
> @@ -841,6 +841,7 @@ static void aarch64_max_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
>       t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
>       t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
> +    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1); /* FEAT_IDST */

Ideally this should be sorted before TTL, by bit order.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
