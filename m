Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3962199ejc;
        Tue, 24 Jan 2023 13:48:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsYm5INkwSjuuI9ewVieir1yJLAH4mlDC0iuxRsrdjOyN3QyQeDf4Rue4jrkF+TYPa0Dnz/
X-Received: by 2002:ac8:744:0:b0:3b6:9a8b:7413 with SMTP id k4-20020ac80744000000b003b69a8b7413mr26005560qth.16.1674596884818;
        Tue, 24 Jan 2023 13:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674596884; cv=none;
        d=google.com; s=arc-20160816;
        b=lXjJxPo4fvDburG16j9VHewjqBhFvHCla7/AJoHRP00LSZ1elj+iR/3hjEVsGDCjaI
         BN8wfwsvXlJKkvhDREdCV0FZjp9Jqg4BrqJw4dNDIdV9AnxNKImIt4tZPDMMuTWzk1B0
         S4ItqPxlHXaeMIzWwqfLVdMhxSuwv5oRLyJRNZOBvAqVoD17DJMw2Mbsx9su7SjxxyPj
         fW4woKLEaLWRqqv+/3KJ1bX70vCd4nB0U/8wdDcUE01a6tBYV64FHCOgPUgAeBxWp/sm
         5E3HYy8cS7yn/mKSCwpzFPpUsRGs5vbviZoNhrQ9IraO2Ewsaz0WH9iPHCF6pRJfSofv
         6GKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vZbBMAJHV9ndC14OdFP77XoK2HSlmIdxWS4+suYgqAw=;
        b=e/jGPXwQT5XN+LbZ2hRy62hBUASLhW/eKyTRVZAHdLxMCIW/m0/Auq6EVSxRFDgodn
         4LRVunw9PsEGlyuqDebJQpqxaTTHqwO6UX6NvLJT03RAnGlT9TRviBgFpnDbzUqbHw1Y
         Z3iJGY7jgwtBcwxoHr/snyhJ1hCmAhIit5tzW5JVQBrwjSY5ux+inCudN4ISeyGKgzW7
         B3HOw9cu19dlk+SYSED27PcU9pyy77FazdczWdxengncFJG8U48fh4/JTxVSa2oOw9ID
         /Q35autxCoxcWj7a8QjW7cVDvy38WNKaHTp+BFoEpBbvM2lx+A7Ur2aneDj0XsMAYkXl
         ja0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e+TI4FA8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020ac81246000000b003b05130768bsi2157327qtj.61.2023.01.24.13.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 13:48:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e+TI4FA8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKR8Y-0003yC-CX; Tue, 24 Jan 2023 16:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKR8E-0003wo-5r
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:47:24 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKR8B-0003WX-PY
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:47:05 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f3so12206261pgc.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vZbBMAJHV9ndC14OdFP77XoK2HSlmIdxWS4+suYgqAw=;
 b=e+TI4FA8MYad0BmBtmOnXWM/K4+StGRNeuOYFFlfDkGSJoarYQjYH2FBEBy9wvfkRo
 bBz/tExKW3ZUiXbW+PJz9gG87GdODFCw2Cn1W8LQ88voj+Kqb5EHeGUo0PbcINRrNYrq
 vyx056i0Z+6fhB8VB4OH222RGH7Zh46bhkng59xR4kGQlZOHImZ9woFB0MReVnTWYyqF
 JOcYc1uqM9FyuHd5Jt0feOZiQb9YkV080mZ4En/hkvHlSQk5w9Ge4vV0L+7tQnFFhmmo
 gNLncG4Yvi2S5e0+6oX9J+v8yUkE3VUkEh56eMJ82iJgBSy6wI/Q6BCx6ENNbFmfnhec
 lYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZbBMAJHV9ndC14OdFP77XoK2HSlmIdxWS4+suYgqAw=;
 b=Q3eeNn9q6t4GBC6Ytin3samulnnkAZ7PhRnPnHIcF0CKMdWdhctmKoLUCUxEopsX7q
 iicaYLvRHUXpg31YShgv01W5HMKCrTXnPMK+EMSQbepnQHVES6AFns28e7fSQdXKwbh/
 EhsSaQfwnJtt045ynXBYkKv1M8Z0dMuKG/qR6VeMCz9L2rdDoFe0Mg0U67ZnZIr0ypyZ
 maTyW4Cs6lhrZQO9gSdpLdAK61iOkbE+UJLEN74kNzqdktCGvEP/n9dNE2hHge+7mbhJ
 m8feM2KrbPs2rUrNZxjKhFKIMFNleAP2LUepsIaEHLvs17rkahlxEqchQFsCjeiMsfIh
 gkZQ==
X-Gm-Message-State: AFqh2kozVJSiZwEkibVfh4rkwA55E1p9FSGJsfh4S44NBEg4b71WukWs
 rNG+ZRLR/1qUp60K4YOybntcCw==
X-Received: by 2002:a62:640f:0:b0:581:f301:23fc with SMTP id
 y15-20020a62640f000000b00581f30123fcmr44370061pfb.12.1674596821109; 
 Tue, 24 Jan 2023 13:47:01 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z11-20020aa785cb000000b00582579cb0e0sm2068154pfn.129.2023.01.24.13.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:47:00 -0800 (PST)
Message-ID: <9edfb063-eb7e-7b89-779b-e786e7adbd49@linaro.org>
Date: Tue, 24 Jan 2023 11:46:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 00/36] tcg: Support for Int128 with helpers
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <73231653-7149-6376-633c-c4f61e576c5b@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <73231653-7149-6376-633c-c4f61e576c5b@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q1a4iujXeJ9F

On 1/10/23 13:12, Mark Cave-Ayland wrote:
> Now that the TCG documentation is more visible, would it be possible to add a patch to 
> update the relevant parts of docs/devel/tcg-ops.rst to reflect the new Int128 support?

For avoidance of doubt, this document covers the intermediate representation and some 
backend specifics.  There are no changes to either of these at this time.  The TCGv_i128 
type is lowered to TCG_TYPE_REG (either I32 or I64 per host) during translation of guest 
instructions to intermediate opcodes.

Not to say another document shouldn't be written covering the translation interface...


r~
