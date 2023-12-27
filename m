Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1228104ejc;
        Wed, 27 Dec 2023 15:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9WZXu8p7i8ymgKLbQLpEBVSpVbqMbwVwOOTcIWo9Fz+7+A4eIb8jYfWBczmJ6dihkmUgF
X-Received: by 2002:a05:622a:5cd:b0:427:f473:b116 with SMTP id d13-20020a05622a05cd00b00427f473b116mr640252qtb.51.1703721325998;
        Wed, 27 Dec 2023 15:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703721325; cv=none;
        d=google.com; s=arc-20160816;
        b=o2KFvo4Jtqul9vlA/KjyUnmXtN61jfi3UWdwQA3S6ulruA3EAvXw1ZK2c+7+Ycwl1w
         RMYobYfrDD1otZvSFa/wKv+IFHqnvlE7bdP7M/bK1ozG4yaMvYKyK6TNCon9buyCprhc
         iu1fyDRsHaEeGhL0GivgfEuMWD+qabIbDXwP/k3X1Mo1vWduBfIiSEP0WJKJIUyvDOyj
         AtdvPdSii5N1/oDldHTGLWD2rBKN3vdMotQuWEL5F0tfvaJ4WjFZru3q7l8ZBAcs2LXG
         LVSBbW09QAIvqqg+VQxxmdIYzrxssPg6UnT9lYYkHB7qTrqZAxMoNdLll1+rfjIkbWEQ
         3T+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vIry2953MMeVuYtJmrDWgg1RNwX+P2/WfKs15U/O6QA=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=eS1qxdSzEwLVMhDWlfqvAf5UkTDg6WPgrdDTrRRksjQl7ASgFqhb8XNWYpNRTP/30+
         TkkSJ5QOdddcR3b+0BStWKWVocRtNRmL3lzp5Nh5+gEjsC5BsBPoJmjPqZrjH0VJVKEW
         dxgQDU3anmzjW/Hb0rOmGmloqEYf1j1Q+dXtMRh75NmD45P/oKZ8VEZwn35vZPFzcXGi
         agrTyyOTZxG83h1AGOKDAuMmCalmbDTOyvcsg9C6YJuugXbCl57FJBB5DYysGD/ftvC4
         nMLEwtCe+54vDudH89CETyefinf3xBnzykvVNLZr8hiBM9JdM3MVWlm5d9kREHGa/iK2
         /pFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iHJi3ngE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05622a044d00b00425814dac1asi15460759qtx.246.2023.12.27.15.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 15:55:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iHJi3ngE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIdk6-00075g-Vq; Wed, 27 Dec 2023 18:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIdk4-00075P-5S
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:55:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIdk2-000748-Gw
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:55:15 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28be52a85b9so2814158a91.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 15:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703721312; x=1704326112; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vIry2953MMeVuYtJmrDWgg1RNwX+P2/WfKs15U/O6QA=;
 b=iHJi3ngEmKD3+WNkoBzNxKB+gcNc16LKi9mLU8T4Y3KanVeQF5X5fiDp3HftTiGrI6
 lA+GA0mCHvv2EzIH68WStu4sNORdHbV0zS7BDdvK9lVop/UY17ZLi+nZkUAbhFmkiNLa
 6/X/n5SznOskckCoAVMAlb8kSHGYwlgmphpQfEj/tpYrHJQdFzWBGlaZBebjTOiRs/bP
 U0vO2AP1gs8t0Yc84cGcn+x0jICt517Ah8bO7rtro3XudrtyfgechZhtsl4ogtHYY60C
 yThUUsKG/AMmf7cNLVrvuJCoF7h189Ufb68419owWQTKYS/SHRnJBdzQUpIDl9CqQfga
 zW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703721312; x=1704326112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vIry2953MMeVuYtJmrDWgg1RNwX+P2/WfKs15U/O6QA=;
 b=Ov1IuyRKzowgQgKdRaPwbU6WYbfl0E0IA7EJR2GkdEVLM0k1BfW4cgbpY0Igo3sU7V
 mrgS+4hFuCqgg92yymnU211G/taRg/EWrYUo1+wp4Y6Qto3rRykLEoWdVDGPEwlcn2fB
 olZ5HebkGehGmdPXPQjyJAHfPfuIT83EusWGto22bqDG0dtuLooExl0q3cmt87IW0jG0
 BoV7fV7GJ7fkqhEDkmxpYHhPM2CfP/i27ewSmKMOErNyxa2Z/uoCW+nzdH1yMxopmmpy
 nMJRzy25N8juh3INtbOet53ralE+GDGPqc2je5fUplkGum2UeyjjBTIazH9gY85khSWj
 ctMQ==
X-Gm-Message-State: AOJu0YzEpZtDcQyaONh8NdelQqJvPtqQkvRP8D3GtP/kKYVR4eP0poFX
 oZkw03oLlRzeD8g1TIZntZKGRfo1TkhuvA==
X-Received: by 2002:a17:90a:1f09:b0:28c:25db:2cd0 with SMTP id
 u9-20020a17090a1f0900b0028c25db2cd0mr1999317pja.53.1703721312393; 
 Wed, 27 Dec 2023 15:55:12 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 oe12-20020a17090b394c00b0028c94e8fecesm1707907pjb.31.2023.12.27.15.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 15:55:11 -0800 (PST)
Message-ID: <88dcdb40-2fa3-449e-a3f7-41d75269a968@linaro.org>
Date: Thu, 28 Dec 2023 10:55:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/35] target/arm: Implement FEAT_NV2 redirection of
 sysregs to RAM
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ahh5Cjqpc6yy

On 12/18/23 22:32, Peter Maydell wrote:
> +    if (s->nv && s->nv2 && ri->nv2_redirect_offset) {

Again, s->nv test is redundant.

> +        /*
> +         * Some registers always redirect to memory; some only do so if
> +         * HCR_EL2.NV1 is 0, and some only if NV1 is 1 (these come in
> +         * pairs which share an offset; see the table in R_CSRPQ).
> +         */
> +        if (ri->nv2_redirect_offset & NV2_REDIR_NV1) {
> +            nv2_mem_redirect = s->nv1;
> +        } else if (ri->nv2_redirect_offset & NV2_REDIR_NO_NV1) {
> +            nv2_mem_redirect = !s->nv1;
> +        } else {
> +            nv2_mem_redirect = true;
> +        }

I wondered if it would be clearer with the "both" case having both bits set.  While I see 
that the first defined offset is 0x20, offset 0x00 is still reserved and *could* be used. 
At which point ri->nv2_redirect_offset would need a non-zero value for a zero offset.

Maybe clearer as

     nv2_mem_redirect = (ri->nv2_redirect_offset &
                         (s->nv1 ? NV2_REDIR_NV1_1 : NV2_REDIR_NV1_0));

?

This is more verbose for the (common?) case of redirect regardless of nv1, so maybe not.

> +        if (s->nv2_mem_be) {
> +            mop |= MO_BE;
> +        }

MO_BSWAP is host dependent -- needs

     mop |= (s->nv2_mem_be ? MO_BE : MO_LE);


r~
