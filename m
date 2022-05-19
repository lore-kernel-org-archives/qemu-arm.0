Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1208443lfh;
        Thu, 19 May 2022 08:14:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Whho8O+MQHC+LVa0BUBCrW6jeW55kR17+FLohhNWLy36PRpXQiFOtNftKqT+SPHC4p2w
X-Received: by 2002:a05:620a:22c1:b0:69f:9c48:11bc with SMTP id o1-20020a05620a22c100b0069f9c4811bcmr3360870qki.155.1652973262500;
        Thu, 19 May 2022 08:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652973262; cv=none;
        d=google.com; s=arc-20160816;
        b=CMtxvj2obj2/TE7djqnGYE1iEiWLRaf65tY+saUQZAdXNtTP1UnIDQYqXb42/mNO8X
         rC0ohF6pC/cirTYSPTfQdzpIwDK0V9yZ5mmnG1GmgkBdoKiNm9Nrmm2TzisvlS3oHjbq
         Ug0ZSi9kGe8GDkptQrniyu7EeKqJwr9tC4Yu9V9wjaUKufZ/RqorSoU7Is7UWrsb6ZWh
         z3eKwk0d/cBFMmzM50o9CBMH6B9do5wn7HxVjSIkWuHiU8ckB720xKK/3laCzr9U5qPv
         jSL5H7AHZdSOv6o5N4uoh/shuT0wsBgH51ml/0ZqtIWB3stnAa3Qo90l16z92kJN5k/X
         ixaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TWWP0Ec8+JAHhg+W0DujJOolNBmHzV28ZMbXwRVPEws=;
        b=jCUUkMDhR58/tJ36pv5Hc+nuuq8QTpFxzpjG1VC71NxiZIJq5FbDefiegQG8lu4vHy
         QO1OqsuHWlnpWONEO5U6VUEUdCQBcaLKneeWvnBHkNKhSG6yO059MlZo2RF+1kEpSVm6
         IbyHpcC5AX6cE/9kBGPLt4yS+/nR2vRQozSaVxYEOY2X5c2pNHIBlWJTAU/g0I42P+/T
         RQQOx2DQuuTZg2NYsQ6KmGEhseIq/UgxoMep8IlVoE4lk5DueaqVxNGnA1vlCOLhKb3g
         +fMTJDDZk3nTZSYBubiq9gSe2spbQ1prt4SHEMa5moZDSsd9hpKgZuaypP6yj6piCep6
         St6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gy3QnIuw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy5-20020a0562140f6500b004443b158fb9si1507246qvb.412.2022.05.19.08.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 08:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gy3QnIuw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrhr4-0008MU-1r
	for alex.bennee@linaro.org; Thu, 19 May 2022 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrhhf-00008y-C5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:04:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrhhd-0003EX-Qp
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:04:39 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gg20so5588732pjb.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TWWP0Ec8+JAHhg+W0DujJOolNBmHzV28ZMbXwRVPEws=;
 b=gy3QnIuwB+8z1cPiSOYLwrDpH+zOFehhJ6E63TRECOL9qOD+IM+EJh7k+lGWluy0uZ
 /sAf3AaV2kgn4uLitbw4Lr+L2A900HtWA9pJsMs+zupzDNEtokmeKRV6lDBO0iSDrEbw
 FZnNZzM0dIu4CkPdgHBJUuA3ZtamO6pz+db5VY1PpDlAiUWfob44gPvalEkeoDhyCq/0
 zlbXfP/2e4R3fPV5HSiNijCNdnnzqqkgAuwOSa34vxdapr1z+e55wZrFdTJSSyAGmegr
 8UusIN5KdCTXtnkewC5BsiYBVdXRJoMeie4gRaVMCkZVrADKvhLxR4IA9L87lIv6+C2A
 qvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TWWP0Ec8+JAHhg+W0DujJOolNBmHzV28ZMbXwRVPEws=;
 b=RZDI6OcIgE8xk44X7/1q7s4jdhdy/nOR6W0nhiIgzpUPV0JAg6nPDDeoUlR3U6Ism9
 CwUtYrD2qGPR3IPvMx1nd/NqKDfW3TaKroUQpRNPoxJGKnwL2s0A2VJW8FxTRyl/ZXc4
 iZCFI8vtp0URGty+lcJQMf2R6ktYiRKTE/O5j9YuInlQzkch4ZE5ExZiwE989uYYdZ0i
 Dx/cd3xxi5LxLy+4gQtN/UX9inGLTeHAhdtpwjzE/BCYiQzGY00oefGKvOSJjEwLzV/s
 taYngQoToF2wi1C5JqNiFx2X4sKlk3Rm/6XjLNjzjAJvQy7aZ8h0VVBUbHEoEaczS+8t
 cMNg==
X-Gm-Message-State: AOAM530pRbBqbQLum4Zjgt2dNblqZfXYfvuAtMakUjDhdLtXYn1fw9MN
 CSlV67QNV338iypD53NIg9vnoA==
X-Received: by 2002:a17:902:9349:b0:158:a6f7:e280 with SMTP id
 g9-20020a170902934900b00158a6f7e280mr5132961plp.155.1652972676322; 
 Thu, 19 May 2022 08:04:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a62a21b000000b0050dc7628148sm4333639pff.34.2022.05.19.08.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:04:35 -0700 (PDT)
Message-ID: <c0547d5f-5842-ead7-ede2-23ca5a201ac9@linaro.org>
Date: Thu, 19 May 2022 08:04:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 7/7] target/arm: Add el_is_in_host
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-8-richard.henderson@linaro.org>
 <CAFEAcA_sQzRhq3WNLR3CvmBtt_Wz7Oc=+chDOXrTSrYSj7t6Ag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_sQzRhq3WNLR3CvmBtt_Wz7Oc=+chDOXrTSrYSj7t6Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rc9Rg7nVuU0M

On 5/19/22 04:39, Peter Maydell wrote:
>> +    mask = el ? HCR_E2H : HCR_E2H | HCR_TGE;
>> +    if ((env->cp15.hcr_el2 & mask) != mask) {
>> +        return false;
>> +    }
>> +
>> +    /* TGE and/or E2H set: double check those bits are currently legal. */
>> +    return arm_is_el2_enabled(env) && arm_el_is_aa64(env, 2);
>> +}
> 
> What about the HaveVirtHostExt() check ?

Handled by do_hcr_write, in not letting E2H be set.
Will add a comment.


r~
