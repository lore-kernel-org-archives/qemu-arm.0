Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp256440ocb;
        Tue, 4 Oct 2022 08:21:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bFF3s6qXS8NX2fTN2TIyMX+maXPBycpWOwtEYILOlBDZz4qsRVKM3Ukjoy5Vogw7lQlJM
X-Received: by 2002:ac8:7d8a:0:b0:35c:b85b:9c8a with SMTP id c10-20020ac87d8a000000b0035cb85b9c8amr20083659qtd.628.1664896895762;
        Tue, 04 Oct 2022 08:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664896895; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7FNZXkzQTKcWC+xPhPLCjlWhKwVKKYByUgkNFjtwSCm7nkjUJctaMcLXXP2u2+g/Y
         3uU2lxQd17bQODPjV8y3TEp5PExzQ8hAM+465iREoJjcy4skzRi4nOdDD/yrJDTUEUHb
         TdFESeO8gW9uqmHliUBomd92xB77yy6DXZ8nkhc1Uq3Mlt9eLQTCOFilK7OcWlB2+SGk
         f4ic8vE7zGeJaDlKg/EzdlgIEReR48pQewS9ciZvu9W4KXDG9UjloVXqQ9u4VauC6gyd
         KRlQOzRhe0JZ3d62VoWqorGDSMJjsaA6yT8IyfxSAT8t4pPRiBmBdkO31v+LXZf0kT/i
         KEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=52RAFqhvsYrhr56dbwJuvMJ/gc+ez7UiKafkoa+arf8=;
        b=VweP5Lv6jTe5qoLvT+Xhg+gMtPWEW1ZHLqLqNk2Y9oAmUdf8GvjQs5GYzqyiErSCNM
         Ahc6OqqJ5oNh3C6v3GUFhhgFDjbZCwaU/qnPKFaKia3DTrRPVstM63fZ5jq8fRlXNnrK
         jvNwx0fJQUK330fiBylA/mgmtha42uxzobWF1o7T6wS08eSFqylfAhGmiJ/u1SXJGw5W
         5shnbb1x+JFwSIzrdyFATxEM3uZ6FuMbTb9JBXkUFi6oRfjZL2jeG919ytJbFpuB8tx5
         Y9U44xOXYmPJKT0ZPL+5orgVQaw8eGbn/Qtsd4arc53GgED4ieVCrJBWVGzdltPL09BT
         6gdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="clNr/Ixj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv6-20020ad44ee6000000b004ad71b0f585si1198221qvb.15.2022.10.04.08.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 08:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="clNr/Ixj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofjjj-0003XX-BY
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 11:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjDo-00064P-La
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 10:48:36 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofjDm-00085E-Tr
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 10:48:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso8760390pjk.1
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=52RAFqhvsYrhr56dbwJuvMJ/gc+ez7UiKafkoa+arf8=;
 b=clNr/IxjLJBk9aUePz1D+riDrsI5YSQzNVSgXxNF+Gyv9XXqJmYB/Rkuo1DlqaPXnp
 1bYTUh9ogwGNGnRjsXd40bR6saIjepktcqLcc5Rzmwlxda06hP/WM9EEIH6be8O7XUfb
 BaS/luc7d15t2h7hnk+6KgBFzUZ86LgB+QNTLstflogm9jpDq2CX/rpt6rZ82HpXs19I
 Ab0rrP7wDUMcwvfO4rUNgSHQFjEscCPv1KAiFxjY6vA/oMQW4zMOVWQSp4cF0SYnUD26
 iMu/RpjaupOW1lCyt2RuTGy1Wq3xp4Gv8QKEO4E/5JIPAQIvHZ8prRS+QTl+Kt7FBKKN
 zXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=52RAFqhvsYrhr56dbwJuvMJ/gc+ez7UiKafkoa+arf8=;
 b=LvQQJHdMCICCYKZhnl7TSUk6a3KrMUPEjeBqxULDUl8+d8Nq4z4S2ImVlwzajGDihi
 IUezK/2ws/9dvbu/TOKX3WNj7LZdeQXQ90fPkt1bijWp34NwJH5LzxUV1Xy77uJ8F3KX
 Wo5TyZhwWcXlYNlxaQIAzM84p/fuAB84yrP3F7sNRQm7WUcVJUD36qy1oD55Nge71vPz
 fPCftPE5/udN4dGPzjLitkVGZC79v9mbrtSu5Ij5SrG/h4NBjfDaQCacN6XaizDvuQnj
 Y4DIqkNNULmYHrSMXKE+0Yv2QIQgQvZuaasmtxwtUwLGMQZt0uIV205UQDcPV8mfDpKG
 vIkQ==
X-Gm-Message-State: ACrzQf06fTHFzkTXuIXce8dP1D6RtiZOB73w4zwiYEB41XdFONhitfKn
 f/ttAXFW7/JGM4tqcC706lRNww==
X-Received: by 2002:a17:90b:3141:b0:20a:9553:cd90 with SMTP id
 ip1-20020a17090b314100b0020a9553cd90mr112357pjb.11.1664894913390; 
 Tue, 04 Oct 2022 07:48:33 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8015:12b0:403e:a15b:ff5e:d439?
 ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa7998b000000b00560a25fae1fsm5562534pfh.206.2022.10.04.07.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 07:48:32 -0700 (PDT)
Message-ID: <8534c37c-7a90-f60a-ab5a-b9b5be672fa9@linaro.org>
Date: Tue, 4 Oct 2022 07:48:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Implement FEAT_E0PD
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221004110554.3133454-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221004110554.3133454-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: f8kHX66fmaXR

On 10/4/22 04:05, Peter Maydell wrote:
> FEAT_E0PD adds new bits E0PD0 and E0PD1 to TCR_EL1, which allow the
> OS to forbid EL0 access to half of the address space.  Since this is
> an EL0-specific variation on the existing TCR_ELx.{EPD0,EPD1}, we can
> implement it entirely in aa64_va_parameters().
> 
> This requires moving the existing regime_is_user() to internals.h
> so that the code in helper.c can get at it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Based-on:20221003162315.2833797-1-peter.maydell@linaro.org
> ("[PATCH v2 0/3] target/arm: Enforce implemented granule size limits")
> but only to avoid textual conflicts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
