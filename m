Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp461577ejc;
        Tue, 11 Apr 2023 05:20:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y7BU2ywv2lDx5RUBT3qXwXhqPTEInoQGGSyqzTqsk5lD1rZ2F703A4D7EfvD8MAhT3Lupz
X-Received: by 2002:a05:6214:2402:b0:5cc:ce87:7d7a with SMTP id fv2-20020a056214240200b005ccce877d7amr4645581qvb.41.1681215644569;
        Tue, 11 Apr 2023 05:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681215644; cv=none;
        d=google.com; s=arc-20160816;
        b=GOYtpQkNENbB0EJm6zCnJZ2/pw0rEr1guNy8+bDBmgtGxixeelNfwZSYwayF3k3LDi
         K54bJ6X4qVvaduRRFvoP1g29F09uYAiZ0VX8nFNFKqwL7op0iQy0DS04uitZXAO8YShB
         zttiBXehcluIa0CY5H48EFX5sNoxgQ7+dfRB4PEP9YGC1DpnBCwbubtHnkIwQum/glFn
         QHyxBR6moQiLM6kgJus5EvUc+IDeOxfs5OSDuIPxgLHRVSjw+xKirJ026MeQL77dcuZJ
         2MPxgQhdS+4TYByl3IovKRtrmD1ALSFYWataUACZ9aaobuU4DyJPZRuRoBKGotptcmgG
         8bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AdR/cis2mMTjfqTeFw23e6OnYtotYZMSJaPlWOngn1M=;
        b=qs5YijkCE6wCKPtp7Da6mJ6ozrjKAiMdcBnTqWNa1jZi6MokHwcWawW15NYvpXmCaQ
         MxOoKLqRNJjuDSZx2kNPy4YqzQXy9Q7IkHnvDtjk6CPgFePpDreRnonL8sJE0AgYxnGQ
         6tmvKJ7yD6JxdHxlQi6fm1eUx3Z7UX+LRtP+AnYXh3sOfmBVxmxhktotnCHyXBTl02vh
         1b3JZP42k+IdJ+m7skTToRJjIEQq8j8Shsa/pHsrYbTOaqRv0pJ75OlpOTkNsjVLVdWO
         h2gL4lIUCgU3gy2Y5SbU3g1Ml8BGzXIIoNx2PUXd3P7GFYywClq4XfZVrk4X+lZ7nxjs
         2nNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvrFcv6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020a056214224b00b005ecfb600511si3139933qvc.298.2023.04.11.05.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvrFcv6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmCz3-0002UA-Da; Tue, 11 Apr 2023 08:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCyx-0002TR-9m
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:20:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCyu-0006hP-QF
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:20:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i27so7320661wrc.1
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AdR/cis2mMTjfqTeFw23e6OnYtotYZMSJaPlWOngn1M=;
 b=QvrFcv6kcGpoH6ND5p+18qkSAGvApqwHjoPruGNRvTF6BRCySPAxK/Om1Xn7DJkce9
 CKgwD3l+nZ7GF+YdhFd0vr2nCqNQ4YIXnN90D/85V8L4X5yUgve72WcA7uxwSyZZjJvY
 cDQka3UCBhB4IbK7RRhWOc7Zs9WxD2QJXWTWU5uxRBe9Jre0TXsqAIguBgwvlqB5yTlj
 eN9qpYB4fbQSd51+ngOhp0cG3qfKu2QvzMZHMfrG77WIQyjTBBiWdKYVV6nj+snL/lI+
 RR4JEY6q7uTM9BEAmY0UYtYDGhnLR+WyNn2BDRf86CiFFpRiCpU07hn55qCoWzvLi4HX
 ScPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AdR/cis2mMTjfqTeFw23e6OnYtotYZMSJaPlWOngn1M=;
 b=YV6oBraeJ/4C7/3HAAoZUUlDhkkEDID8JGdQtkbhQ72+n96RHynD7e5DNrE+tt92Q/
 WL2eKjHr9jJrLkttyrEqDFy1mfEVKqQQ1ua85dFnGQze7FuCs64zVhtXTlLdaq9qdT9x
 txJaSYLKbK0t8Jr2VjPsu166iLJghO50Eez1Ty4QJcWHVd220/eGbF+q7CQJLSLsWoVn
 Y8XBykVOBDY5oPMAsnftFflVK2L4WxoyInXT4NjF3SJsDUGHYF4PafhBM++31cj/u006
 /4yfaUtAVi/meJIEPY1ub8adlEXrhiqSfdEnJvKo4u3yn0bDllqO8qY7fX17kba1sX4m
 yHrA==
X-Gm-Message-State: AAQBX9fkttMxwwnZGK7FHIYQTimvgPt+kArHROV5ht4hAtHQwel/uKnq
 S80MMwvFtNe037Ak/6FbXDkazA==
X-Received: by 2002:a5d:69c8:0:b0:2ef:b341:4a2d with SMTP id
 s8-20020a5d69c8000000b002efb3414a2dmr9748873wrw.24.1681215614546; 
 Tue, 11 Apr 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a5d514c000000b002c561805a4csm14460067wrt.45.2023.04.11.05.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:20:14 -0700 (PDT)
Message-ID: <8127465c-79d9-aa94-4c3a-3c413934780a@linaro.org>
Date: Tue, 11 Apr 2023 14:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 26/42] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: tFRFgx+eXg3L

On 8/4/23 04:42, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)


>   static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi)
> +                            MemOpIdx oi, TCGType d_type)
>   {
>       MemOp opc = get_memop(oi);
>   #ifdef CONFIG_SOFTMMU
> @@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
>   
>       tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
>   
> -    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
> +                        s->code_ptr, label_ptr);

s/1/true/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

