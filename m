Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1454720lfc;
        Fri, 16 Jul 2021 09:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD3EtHN30Q1KePIOZpfEDupTVTFed/TTfY4cPCR3a/cxDtwn59sF7nlxo05fkCCdVARhaq
X-Received: by 2002:a67:ee43:: with SMTP id g3mr13062165vsp.55.1626453262707;
        Fri, 16 Jul 2021 09:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626453262; cv=none;
        d=google.com; s=arc-20160816;
        b=K/UO/VfpDiYJueHBNlKyPBqsRsOmwmt2ypNb5GIXlw4nEIJ9M4RwAdjCytFqFNeQtM
         bvP6kaXXGZ4wwskanWGr8+4EDjZ5oLLekxb9QKwEJqjHPMEnFcGnQIFuDxdOx9q+KwZa
         J0vivYsF8FAXwEtRwBzcMDX67ktnnkAxl9t0RR8SYuYamOOQCMYpNvU5B2KEp4kembbW
         FrHpXHRikj5c6sdGx2qGdNxYl8RGExblyDSD5og3bPgGg1z770IZ8tyw8dkZHN1O9gnX
         bJyuEyT8U7c7I/2zF+zJi410b7kaslwr9Scl8+l2lF0Bmib9W26Dk3iya2W1QprP46Tf
         VFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rP2/KXHrABUuOZ7Gry2VPqvnsBK5X6S+2R+W1T6Z0o0=;
        b=ZOy2F3nHk7J+6apFCyD70RCkxs1vnbeHoRtTXb6R+QrQmvVIDa1RNVesviv0IXJ4v6
         W9dsMV8qmbYkQN4Z8Jyxvi52iJqMsuFaV4wkOuOxgqq6xXC6UxXuwcAgMgi7RTOBDQzl
         rMYoLw2EZYjtOVsekzNulNWAHoppM5Xu5fgPiphmwbUbjHXxoGRss3v7n+FGf+2U2dGT
         dPc0bsfLbh2E0O5RLhuU536Rb6o25vInQkSQVHKXF3f3vxjcklKv6KgxVzHqSZVAXSFZ
         rNFuMEu54dhVgNO6aoJgHFbZbjE/rVTrDGmf9cKqz73vMvzNKqW+tAgXzUoAfg+mV8hf
         85BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQnXchg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si11127103vsk.363.2021.07.16.09.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQnXchg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4Qn7-0004MT-VZ
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qmz-0004M6-FL
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:34:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qmx-0007wj-Rw
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:34:13 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 17so9344182pfz.4
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rP2/KXHrABUuOZ7Gry2VPqvnsBK5X6S+2R+W1T6Z0o0=;
 b=GQnXchg5a0C2+9YfIV5znMVPiUQPxmvsCN5a7glhY6UJBM7FzxctQg3msA5JVjHxya
 5LvQZ+9NJILgXE2juhrDWWAGiC3VBg947SjpR5qEfeJj7d/75asOMdFQ6oyHuHkQ9nNU
 F3XL3cfekmD6tI/Y8U0JprMDI5xe+1+M9idb2PaenPhM+93iLxfY+jFM9AlRcPlCq3d/
 AvxXAGgVJekrYBE+NnJaY66ZqVtRuqVs0hFCajNXGpRISFMzuvIWUQX06nvrizHPbEsx
 zvhjU4eg9SBvViA+I99VgpoJt4W876faZkL0Smn6Y3jZc9pfROThpM0oqN5QbDVFYdr8
 9r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rP2/KXHrABUuOZ7Gry2VPqvnsBK5X6S+2R+W1T6Z0o0=;
 b=np6HBTmUJRl1eIUO2HCZd01xpeA/agtpedkRXBtOcvscN7m2nSs22RDVm7y4hXwDjJ
 w1WvJiAPMlmSSgYvLJUx/jTqoE91NqmXFtvj/NMt2ydEB8eiDuTmLRyXY9wSXc/BQMPT
 Km4g15IS84rrAAXF253FYvcybHwYIJKIWjO7Sp/cAWAihxTtcaPjmJPG7gzQg3aCdKLN
 t4dgk5y7J8Qqobdg7tQiB0/6N12lUAS2eXUspvB8+SMytOrlgadRSjnFtS+Fm66WHIEC
 CWVU23BSNJT1Oakg5Gr+Gh+BqUox4uQjtsXWPytG0kpRdYhvtItFwzlWj7kPTDHOUaYn
 hrRQ==
X-Gm-Message-State: AOAM533c7Uq6VE/K7SpH9POk2qlmneRuKgCpAI8I59zZwsa2pepV42mz
 zk87QSLSbBJORXZKTMX4d0IGGw==
X-Received: by 2002:a63:5442:: with SMTP id e2mr10951706pgm.365.1626453250325; 
 Fri, 16 Jul 2021 09:34:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v10sm12561668pjd.29.2021.07.16.09.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:34:10 -0700 (PDT)
Subject: Re: [PATCH for-6.2 06/34] target/arm: Fix 48-bit saturating shifts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0332b682-1bd0-ca64-65f6-e06e1ad9c0bb@linaro.org>
Date: Fri, 16 Jul 2021 09:34:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 43tGTMIAPoz0

On 7/13/21 6:36 AM, Peter Maydell wrote:
> -    return (1ULL << 47) - (src >= 0);
> +    return sextract64((1ULL << 47) - (src >= 0), 0, 48);

Clearer as

   return src >= 0 ? MAKE_64BIT_MASK(0, 47) : MAKE_64BIT_MASK(47, 17);

?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
