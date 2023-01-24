Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3304202ejc;
        Mon, 23 Jan 2023 16:20:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuifm0Xf7Fj0uBOkJBpl2Z1GvuPF8kxjqVFIWBc7GAl1EJIWJ0/3UBDpnIm7mCuZqEdy/bd
X-Received: by 2002:a05:6214:3707:b0:534:6da3:d35e with SMTP id np7-20020a056214370700b005346da3d35emr40977991qvb.25.1674519650907;
        Mon, 23 Jan 2023 16:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674519650; cv=none;
        d=google.com; s=arc-20160816;
        b=ODfvQ2wmD8QqtROXyqMCL4x/W0x54AnRMn8DYn6SP4roiFdq6eY/neQ61RtGbol2JW
         xuYVAqiQG3L7r8B4JsVCVBB2yG1JV/tEoQ7Q2PCbiu1+nAZ7EQTje3/CqAJAqcnJmcmE
         7IgV1wRlivKOagNEqWPN0awx6VIAgvMDYGRMpxsH0ganLAhCiAKJpbuV5BhvKsswSAK5
         nkHAIhvh3HMN4YUyxXBt6qH+6JyCscwssGnrLB3G/Q8MfIFDbv4iLo9f0j4KfZHyHQXL
         djnVs6PceDaGBT+oKqUaMnjJ5XINPrx2DAhrifaYs8lCzDL6TucBQaxSAHoj0mP3yMcv
         U15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WUd9nFA3GIgQlMP5IMjs6T0NTOPKmW20F4EGMXravUE=;
        b=BYxMYNbldpJkMdvM4SUabEJZF+XtIDgHHdIbj7EIjbLKqi0BUR5bV/ePCQCChYIzeg
         DGF9nN62szXT1UMYMwSjyH3V5xJBLkFGULpYxTG8NqFKTEWlBEq38ppvK9WjJxhU2gda
         jjHTVlO9Nl+T9vyZUY+5u11i5wZcN1rlDYU1sc2IDoPvhjrWQh7vjqgYRhfYOgJoOzgg
         CGSJWp2CTqlnRbxlTa1i+KAseQWWWgi1FbXkvNz9OcOgo2S39fyneQoz+URIX0HhWBUW
         k6cbBn74VHPt6M4yFC0M60S85dTNntxcX+Ro+mGnJWxa0tTiLCjm/OQRCp0xmiNdO18H
         87CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoQo1dSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020ae9ea0b000000b006fc31b6b810si483125qkg.566.2023.01.23.16.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoQo1dSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK736-0003vz-9G; Mon, 23 Jan 2023 19:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK731-0003vc-TJ
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:20:26 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK72w-0004uT-8x
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:20:21 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso16901559pjg.2
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUd9nFA3GIgQlMP5IMjs6T0NTOPKmW20F4EGMXravUE=;
 b=yoQo1dSYOPllcSRlTNsdrRULILoKyw8RB5YMQ20RPRkpcewCwYshb3JgMbeQxTBdi/
 1za+CVvqojamj+LveHBRN+n8Z/t9aokXzliLs7bTi/xpW4bx+DFgCEuJWpMvM+BcVw8q
 viZ0IWN7ISNiOg/v7HdEVpUzyPgCV9ZMpoETVkGhs+DL2aGZ6uKJFilCu/v1MQKMghiv
 z+p5WusmC+HcUBb9+fCmmxNPIKj9FYDX/OWOnfv/0LTviGjc+8fovSSRC7t70Z+Fi2Tu
 3iIsn/ruqLLUeLut2Q3z89vtdCXT5UUI/ambz1PXEsHTopXddX0fetaEjZIhKMUrVrzM
 0sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WUd9nFA3GIgQlMP5IMjs6T0NTOPKmW20F4EGMXravUE=;
 b=Xz2gnfzZ51dBf9KEmE7mkVuvXMdrzNy8lAwE0ENKikNyDUJa+Wznoidql9qnt/vYjm
 XEb4o658mINls47iEuLh0HwDwvgJVevgkPyi1zPqihZBI7zfH3u6MIso0OhXP3QqtSAy
 BnweGfRLGBcMiNK7y/SolUJCwVxnkZaDuyQtKGZKlT2IvCvB9nKZBnp+HQ06V+FBTRWv
 HGdxUEtbsmNi+aG/EE++EJnGPEWNuCFXxW0EFBxlmwC/X7ZJaZ2o7wKfvnvYeuHs9Ce/
 fyBxD224AeOEmSBWyayNdtVTBMZElQLp1GT3r91slsp5mKUDL8MeZg6v1Z2xGLALZHsT
 foQw==
X-Gm-Message-State: AFqh2kpxsODAz5mdmvMHg8RFZLzudErUgZccrbCLGu9Zqf1rzb53Dgnr
 pY/5Xe7qOiLWh6LfgBgIYYUNLA==
X-Received: by 2002:a17:902:7c15:b0:191:3ec0:9166 with SMTP id
 x21-20020a1709027c1500b001913ec09166mr26072737pll.6.1674519615342; 
 Mon, 23 Jan 2023 16:20:15 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b0019498ee0cf4sm291359plt.109.2023.01.23.16.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:20:14 -0800 (PST)
Message-ID: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
Date: Mon, 23 Jan 2023 14:20:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-TUID: jYzARDRzOPj/

On 1/23/23 02:53, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 19:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Do not encode the pointer as a constant in the opcode stream.
>> This pointer is specific to the cpu that first generated the
>> translation, which runs into problems with both hot-pluggable
>> cpus and user-only threads, as cpus are removed.
>>
>> Perform the lookup in either helper_access_check_cp_reg,
>> or a new helper_lookup_cp_reg.
> 
> As well as the use-after-free, this is also a correctness
> bug, isn't it? If we hardwire in the cpregs pointer for
> CPU 0 into the TB, and then CPU 1 with a slightly different
> config executes the TB, it will get the cpregs of CPU 0,
> not its own, so it might see a register it should not or
> vice-versa.

Existing assumption was that each cpu configuration would have its own cluster_index, 
which gets encoded into cpu->tcg_cflags, which is part of the comparison used when hashing 
TBs.

But including this patch allows relaxation of what constitutes a "cpu configuration".


r~
