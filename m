Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2750873qvw;
        Tue, 1 Dec 2020 05:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD1CAsiVuP9OwVB8fseMPkznxRHe5JUsWzzNnQthfCYJpo4IXFyoO/bHypHXDoGiCNj1gd
X-Received: by 2002:a25:7e03:: with SMTP id z3mr3438850ybc.251.1606828305866;
        Tue, 01 Dec 2020 05:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606828305; cv=none;
        d=google.com; s=arc-20160816;
        b=jCadxcxi6Q7NaMYMGPFFKUOClbkVtI5TTjHx12nOfVSCz52hdQ5x09mitv+k870XZ9
         kcIYsG4CJM1DKu9Bm3KoYlUy3g0kt6UoOo/u8MskEkpd4YFnJ4R7n/JywDSgviwsrbOw
         Ut5265/gYkhS5fGV+z9m9ml2jJko4tcA8QX2Qd+gqRTr75p2meHzDyzF2cCGL2KfpYFX
         63P0kJdzu3RkYiqMlK06Jopq9KwfMpCCM5ezJhoI1+zl6+OR4w89SSkOwTSL7gbh2h+1
         tmxesI9AUkaqbvCxuOYt0V4WeVnLWRNxdqvlKi49X1iimYkpbBl0lmhdAKTXa36yrnOA
         J3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xTdvkhQT594WTZnzp9Y8oLp1uFxM9ohAEqda1xatoaA=;
        b=Emux6RfTZErJkrSf9HQF/mJbHPvmec6TWWW+6OwxYBOnUhWmAl6JS1Rn5RyZTiNR3H
         moetzqLShKWYIPRFAJT/iS6xmxAUsZHlyQL3p9FeLC/u61XTL1v68G+sD3Ohq2bE8gqk
         13Z5q+qDWI+l08DlFWug8ySEeH501lyoKNEjDP6A1r6fil9quhCArxvPotiyPBs0l3La
         rUgF3lQglASjC+l0rYxXEqHPjSppveG7p1cb9/zll5U6oYlvBuGW1/kt9Cazwxf70/Sf
         SuL7lq8xvVu1Hq8Q4d9WovCuyCXoJJSDF0in4lGmIZqbevHbFQ+RJa+P0xx/lwRiCgUK
         rPxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2KA0iTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si2198659ybk.261.2020.12.01.05.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2KA0iTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk5RZ-0002gG-7m
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 08:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5RG-0002Mk-Bp
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:11:26 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5RB-0000Uc-58
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:11:26 -0500
Received: by mail-oi1-x242.google.com with SMTP id j15so1668168oih.4
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 05:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xTdvkhQT594WTZnzp9Y8oLp1uFxM9ohAEqda1xatoaA=;
 b=X2KA0iTTDcGKjw3yCu1XOgJi36AYg29oRZUI51AwEEX/Fc50Nf1tfqea55Bdwp1HWR
 hfbd96J0UpcJJbjdW2z4XU97JHOdLeC8PKjdvpQZ0gcN0uf1cDYH1GUPpUoW92pBqdd0
 KyRxNDpZC5GZEJi4Rd56a0EFnefdJcTYmgbcVr5ndZzZUSdHgpMGWiVItzvKEdah6ghz
 WR5o+YLDeZjOAAax/I6+zgUxKiPEdHKn0pdVuEp2nM3fSmf2EbjGM51bWi9dGA5u25Lc
 nrmuxnHgXjS7wKe4nvNu9Yk6SPQ5ypQlgp13R5AMLcPn5X7sORx3wZ/JNO517XNh6g+x
 u56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xTdvkhQT594WTZnzp9Y8oLp1uFxM9ohAEqda1xatoaA=;
 b=OcAynlS99rPpC2lH80KhNj20E5elfmMbOS8jtm7SshXO7KiRJrYJeWR3nnocDbdqFQ
 U50FcNGxaW+X4W9h4RM+zyePV4PGQnRjIxfziLt+XgfxYqsDg9JImFBEVkIzvoYrw6yR
 XtZrHrflwvpn7+wYhBVkge6qGzViPePoqGKH+FcJtTjuzLzfk4O++6EskVQKXBS0Qhhw
 Pt2+xIH9EHxBEmaUBsJwcpNWP83Rp1KkxHXQpiy1vFgYq3VSQqHYFpdkdyFMEr0bBJz7
 S/zwtazfcnThcGPjyXyHyRPays6j+XmoMiqZ4lDlwCT9YSyMtMY+0aschGAQUo45Ay+s
 oyoQ==
X-Gm-Message-State: AOAM533ibfl303tdaHxpRcBMC7nCTy1ZlkBgpdHe1ekY4YU4S43/xH0X
 C2s3gIwYCXU/zDhHTkpLFECVJQ==
X-Received: by 2002:aca:5114:: with SMTP id f20mr1522542oib.107.1606828279731; 
 Tue, 01 Dec 2020 05:11:19 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k63sm384788oia.14.2020.12.01.05.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:11:18 -0800 (PST)
Subject: Re: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
Date: Tue, 1 Dec 2020 07:11:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: VC9jEMhu9cff

On 11/19/20 3:55 PM, Peter Maydell wrote:
> +    gen_aa32_st32(s, value, addr, get_mem_index(s));

This is MemA, so should use

  gen_aa32_st_i32(s, value, addr, get_mem_index(s),
                  MO_UL | MO_ALIGN);

a-la my patch set from last week fixing other instances.

> +    gen_aa32_ld32u(s, value, addr, get_mem_index(s));

Similarly.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
