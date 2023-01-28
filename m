Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1547575ejc;
        Fri, 27 Jan 2023 17:11:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8CQdF9e8caeBPs7LpjhtmVSRH3rsUFXUZiDRYus2jM/EmW2lahsnkU/sbYGp0glbc2MQxy
X-Received: by 2002:a05:622a:181d:b0:3b8:2e8b:d8af with SMTP id t29-20020a05622a181d00b003b82e8bd8afmr3743566qtc.55.1674868312807;
        Fri, 27 Jan 2023 17:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674868312; cv=none;
        d=google.com; s=arc-20160816;
        b=yh9TOfoWiJVukuVnCu+HE6aT44sZzWEHCfAjFUYfNK+1hc04M4ylraAT5O4alZtPTu
         M7mSRfRY0+gjPJU9BsooJeR8x07N++gymcrdQRkiq+ckTCTqWylM7KjZKA1I2Y0PkuA3
         quHJuj6mSpdL/UHpVzkGe34SFnjrwVx9PMdwJitnPl1oZqujBevOQvoHzwrAbfb1W8q9
         k9XU2l97SQRjVF4utiKIY6FCDdzHp99/BgM0PE9Vk2XIyXRqrX7c2YdOEUShkYRXtcdH
         srMIPFvMU3jriDgbT3imqv5a9PQp4FD85pAq1uEVJ6PjgAPqorR0zbtdTp9fM4SQDgtK
         JweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tbzrszhQoWSxYZcdrW5Vn7Ixdg0TRU7nKJnQZ5Yat1k=;
        b=Jt1adTdDa+jojScGP375LqhyhwqxGbf2ArKTgXeDo6nI1JWa3krXGTeQu2T0V/TQOu
         YmUoOO5CaN2oc2tNM3P3QooYItrtEk15LmLDjHacGp8hLtEMtgn0UUT4O06rGl4w6tTE
         WL0F+BT2QTfxTknSFXuq/U3OJXgUJ8FovzgiZBoUpGLtK6gnTjBiwh21kD/+rfcdYcY2
         fZoVDiqc88dJl7F5xxigIRPZuZ7XJAsd8QdfuyB1KG2oNMuvfDcaqG31dEKyWPUOmJ5w
         ZiVQfWMUOg6ku43P0TJs7MzaWB7btpZPEZClWHuBhuFbe1v2NKQgK1bo7vGtkwTzeq/z
         QAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzNtvMK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020ae9ec10000000b00705f514af17si3530156qkg.188.2023.01.27.17.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:11:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzNtvMK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLZkj-0004as-PK; Fri, 27 Jan 2023 20:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZki-0004aZ-VF
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:11:32 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZkh-0007vl-AE
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:11:32 -0500
Received: by mail-pf1-x42a.google.com with SMTP id a184so4405186pfa.9
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tbzrszhQoWSxYZcdrW5Vn7Ixdg0TRU7nKJnQZ5Yat1k=;
 b=NzNtvMK3iIR4JStGpdgIl14XIIVUnfYEiARAb88djSWSxjZ3RGT5ezHcscim32CsTb
 hYE5EkiOuEMl7EapOnstL/fIrbnOFn4nmLlEISN8rTBhZpnbvUIuUj+1kHNYe2RPTjmc
 DBTvUy/w2QSvFhj8bR9CJEzEE3xIb1xDv212wBenWnB3XUaVhPZ5LmUlI5vfK5nVJZAN
 yHzmyhDrZD08BxkRoTqd6kstLgyo4OUUn3sVnTQjEToc2oLvzrebjuPNIKY9xzEoRegl
 yAgBu9QVXryoJjwb2rELe817NyWM6xmtp0YIgWjFun8JD5moG1JJyBdvY7/FCxKWL+PL
 yfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbzrszhQoWSxYZcdrW5Vn7Ixdg0TRU7nKJnQZ5Yat1k=;
 b=JX4FlKEktY+HcIYwy4BjR+IAKbL3JBjT44JiKhp00mgY7ImwHoqmZCUIOMUySuy6au
 LblwbOE/R0G5dQXmk0Im7FFqFdxrZwtsdmq+Np9Sb+L7iGRSf0lkVGUYnQPsNYxC6BGs
 dv8nIAt7/h8zPS/qF90TyPwWEBDQlKclyqPKU9CcCtYIUHAsuYtNlnOTsHEgzf6HFGoZ
 xxjnm3lW3Wqe7+l5yqxlpmYo5QNlsZlVEIcz5I7y7OaUvvYY0IsirJn7SOWUOXSs1ThX
 AV5BlQCcj/mBNrLRjERiEtEhoIRSucobGSP8dApoDYBcGzKucCLYm5xN87hZpQOu4weX
 GSJA==
X-Gm-Message-State: AFqh2kpRyojx0cBN5IusPLP9SaflLWRRjwbuzGcLqeOXISddsYdz9xaa
 ZyRiOCAETLR3pGQnpRXfbns+oA==
X-Received: by 2002:aa7:8a04:0:b0:581:1c:82a3 with SMTP id
 m4-20020aa78a04000000b00581001c82a3mr39582196pfa.1.1674868289752; 
 Fri, 27 Jan 2023 17:11:29 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g196-20020a6252cd000000b0058e264958b7sm3321565pfb.91.2023.01.27.17.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:11:29 -0800 (PST)
Message-ID: <43748d60-0d62-fe74-021e-ffa5a584a3c9@linaro.org>
Date: Fri, 27 Jan 2023 15:11:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/23] target/arm: Remove
 CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2shB+M2HEftp

On 1/27/23 07:54, Peter Maydell wrote:
> We added the CPAccessResult values CP_ACCESS_TRAP_UNCATEGORIZED_EL2
> and CP_ACCESS_TRAP_UNCATEGORIZED_EL3 purely in order to use them in
> the ats_access() function, but doing so was incorrect (a bug fixed in
> a previous commit).  There aren't any cases where we want an access
> function to be able to request a trap to EL2 or EL3 with a zero
> syndrome value, so remove these enum values.
> 
> As well as cleaning up dead code, the motivation here is that
> we'd like to implement fine-grained-trap handling in
> helper_access_check_cp_reg(). Although the fine-grained traps
> to EL2 are always lower priority than trap-to-same-EL and
> higher priority than trap-to-EL3, they are in the middle of
> various other kinds of trap-to-EL2. Knowing that a trap-to-EL2
> must always for us have the same syndrome (ie that an access
> function will return CP_ACCESS_TRAP_EL2 and there is no other
> kind of trap-to-EL2 enum value) means we don't have to try
> to choose which of the two syndrome values to report if the
> access would trap to EL2 both for the fine-grained-trap and
> because the access function requires it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This isn't just "not used in QEMU"; the architecture doesn't have
> any cases where you need to do this, except for the FPCR/FPSR
> with HCR_TGE case, which we handle in raise_exception() by
> squashing the EC_ADVSIMDFPACCESSTRAP to uncategorized.
> ---
>   target/arm/cpregs.h    | 4 ++--
>   target/arm/op_helper.c | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
