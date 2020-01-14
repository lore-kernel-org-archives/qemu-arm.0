Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4938601lff;
        Mon, 13 Jan 2020 18:42:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzOyqbMjS4g59JuRiVeRQVbB2/Uev5uKCOxF0OlLrjbtyCwgbtSrYTljY6qJqziMhVvnW5
X-Received: by 2002:a37:a98e:: with SMTP id s136mr14741934qke.253.1578969752949;
        Mon, 13 Jan 2020 18:42:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578969752; cv=none;
        d=google.com; s=arc-20160816;
        b=EEUq2MT2nRNTRSoLyDnfAhqD6p8v7JAzTSFpkewcRLnUzxRencbTgf9ElkGO6j+yQM
         1AneqIIef4n1w2gOgBqt+XO2YoFOfe7sLqsG9Nsqg+fwLaWsHr8du8JzL2UwP9HV24hp
         fSwZpDsUZzvWmmPkVXIBsAnZXu7mVQwykJ/r9Ole+CrSpgcHrUBjKhQwQaIJjoreM7lJ
         oMXr1o+MjoNpaJxztzy68aI3EddMhPqJfxvXZazgdB7qI2yeY1DFqVViwpwiB/i5++a3
         TLaStz57q7MiHYMIveIAMVLb0/PxnZVKcNjL0cEgwi+L6vX4/mYakw5zAiwxvY1x8gh2
         voSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Z+qU3ZjV3dgL6PtSDGYYuA+a9MNC/JVybRb2augdjhg=;
        b=jPNgvlt0HZHWhcDfnfWxGKETjl7VD9i1BsyfwVzEKI+EAr2xCeqsz3XdnPV23Mqnma
         tP82o9VaRrlrtokQ6HVc4a0LplL8h+y2cLo59LNPdv93+mO+9fkWW+krDAMSeB4fNpbm
         gopxnYqtUGnHaGzzrWW/KE4bUO2zhtsYdrjinX2T0Umf00bY6bnBXtgJbUODqsj+EZhd
         Ae32D+e3tK2sBGQ/ZCUtqlnSlLMGNNc5JAo9ZOKUrN41a3M0NBBjJ/2GXIbLcI7au0nX
         4Ca5weZZS5piM+o9nOS7l+/8Xc09LLFcbrNPoEs3zST5A3sbjEFzx8A633ucuaX76mWw
         LJ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GddnC7YS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id et20si7203078qvb.144.2020.01.13.18.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 18:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GddnC7YS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irCA4-0000Dt-DO
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 21:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irC9G-0007t1-LU
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:41:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irC9F-0003Oe-JA
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:41:42 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37665)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irC9F-0003NS-Cc
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:41:41 -0500
Received: by mail-pl1-x632.google.com with SMTP id c23so4616103plz.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 18:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z+qU3ZjV3dgL6PtSDGYYuA+a9MNC/JVybRb2augdjhg=;
 b=GddnC7YSCjqU3BnJ9b1ETTwxYW1SIYhDYGjx1HCLT1cD/L4f3k0Qe1jUeyE7Q5M4WP
 l+Yw+sa4kSKmPN4v+tqCfbgdtUEPbvlCFv5MdVT7Ae2aPgO+syhYWiT03lGJqorLksp2
 jNfE5oq/bdDPGCrCuU3mvh+olzD0nRB6E9gzZUHAk8NcrMxj1+mivuwROvrXU2hR6WJ0
 nc/otnyYOWQnENLvstNberygjCFLF5+BvnmreROUJkW1QRZKa2NCJ5KbSmfQErySPPaM
 s9g/WJ622VV+fRyjHx6ezKjfPG+f+6zpzALpQ1UOdhP7wawJ2Hq+CmSfyDHupbCnBStR
 N5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z+qU3ZjV3dgL6PtSDGYYuA+a9MNC/JVybRb2augdjhg=;
 b=WyZqRMtV0g1A1GaAAG5oTsyxkOaIZkBODXtfKXCLMz6ylbHg4KSgP1iG4SYTXFcgVo
 cpba0IDeValOIl4PBOuQlMlNbTv+L8lSjx36o15BO6O4yaHpFqKH6nt0mJvB6vqX1Kxx
 IGf/73TRey4b1gTI/ws5J99Hjt8H5NDpei94s6Wzk25GJtOGuFK4OPQxgvaAURcyvCEi
 Hx3wJDoQJTfg3cljChaVD1plYIltoXqliJc0+2I588bpFaLqY3YiFc2PVWU47Js0UShl
 m0O7cRFgw+ECDOxMuT9DJAvfrbmNGYETal1NICkvYcnezaY66D3E2kuY6JCeY2zshHqT
 eU4Q==
X-Gm-Message-State: APjAAAUZKZ9e748JDMhxWC9YN0Z8bo71Xw08VpUheY3iTmQZQVec2M/4
 HNJh5wuDNgPJnJFoLzykprIiqg==
X-Received: by 2002:a17:902:b48c:: with SMTP id
 y12mr19688980plr.153.1578969699968; 
 Mon, 13 Jan 2020 18:41:39 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id f8sm15072560pjg.28.2020.01.13.18.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:41:39 -0800 (PST)
Subject: Re: [PATCH] target/arm: adjust program counter for wfi exception in
 AArch32
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f45c4a2-0192-aaaa-8d0f-7ea7890ca448@linaro.org>
Date: Mon, 13 Jan 2020 16:41:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::632
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJ3O0lLbhSu+

On 1/10/20 8:02 AM, Jeff Kubascik wrote:
> -        env->pc -= insn_len;
> +        if (env->aarch64)
> +            env->pc -= insn_len;
> +        else
> +            env->regs[15] -= insn_len;

QEMU requires all braces.  See CODING_STYLE.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
