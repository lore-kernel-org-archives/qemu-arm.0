Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4055753lfa;
        Mon, 7 Jun 2021 20:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS9elUcznjYs8wnWeZv2qNPnRzioeQfEMXOYTlBamOAwYbiKvLVd861BMgOglLqtYrx/vF
X-Received: by 2002:a25:d0cd:: with SMTP id h196mr30528832ybg.335.1623123630387;
        Mon, 07 Jun 2021 20:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623123630; cv=none;
        d=google.com; s=arc-20160816;
        b=0wRV0IIzISC5sOy+5Abl0IzItPBSqdIr/tk6fAaJCuK4PwQoY5/RfjuLKcQLvZxDYM
         MRZbQVeC/3Vg5jftntFT7C87AI6tbszVDs+F1mvQS1ISSGOAz1fAPifMLZtnaqKreMOw
         7F4jsFbC7+IKfKaOm37rv7shYCy/ps1uYDhcLcSUSYfwKWQd1+uRtUiLr43+KvnXDihP
         liXKJj6H+Zqv6La69Kdq6K/QApZc0dFQ+CnvX1dXFQJ7nIBr5b6pti+HiERxSsgd3GJt
         CpTUs31ciJ8Mg5V7r4S32Tl79lg7sG2CgjlkakbOBET2BmfJin9mw9N1ctvwi/JdGKVD
         NrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rPVBKYfXcnQKOC26+kqJFqri41rZP14tBHlADE/Vt+s=;
        b=D9dT4WS+ijip56+ONvrhjupy0eqjGwlzp+ENw+Eb76Jf/jbqYUGoiDEhdzhKxbbs1A
         or3qY3q6XGrmVF/6ho3Z+wTLyID6rI2nW/OY3oIG0sbuxNnH4VDLhIIK1ba2pM6N8iX6
         Vnn7boKk9t0f3/owB/Dew3J8jDvufIf2ZzXE4V/2oGO3JjwprPr4wzfvcIODqFDTr0h3
         KZt7BHLDjw/di2JN6uaDXEtHaVIH9Jl6EHyJUR1mNJ9m5ttJ8C+m6FDoahzSs0RDLnFy
         gIH7Ft91t2i6NgbB/+4Am7/WWKqKG7P6biZnPIPj1PqMDafPFIt7/hWvPmxbkZmXpsmZ
         Ex4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9LNj42d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z189si18187722ybf.40.2021.06.07.20.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 20:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9LNj42d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqSbN-0005El-Nr
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 23:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSb9-0005ET-PA
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 23:40:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSb7-0006Gm-FH
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 23:40:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ei4so11074755pjb.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 20:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rPVBKYfXcnQKOC26+kqJFqri41rZP14tBHlADE/Vt+s=;
 b=q9LNj42dRo7LfrquOGbTxoPF7sUI0gutx3B28yETahRTKEgNTXIE9VVerUJe/XwPb+
 AGm5SDLNVP+svBU8M+SKtvT9HvvUCokbb5sYuztgrM/TZ4F1O27SozIRf2uOUFIaHfBs
 NamNJWRMvrbaStsFZK0SA5xTfXRm/CcXlThlWYOV+yUYF9zBn3HXzLILR/xppUq4f4gB
 y0f+KCxCSpE99szJQX4eEY0gg3tEL2X3RVFgqjrGGTJwL8+hd92vfrPO4b7b3AvmKsUP
 JG7TevCGerHuOiPjRuiQo9+/93jgauFUmq/Hu18PAOJW2ucaSjcOE5FzMTnS84zrCleq
 ugmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rPVBKYfXcnQKOC26+kqJFqri41rZP14tBHlADE/Vt+s=;
 b=oQ3CMEKyuPbTLN3ZkwVAQRP9uc3GC1zpOsqh6iesTimebKlpzDPMlQz1S188VmlrkR
 t9hkgJ4+iUfH8+B7pMLoarPkaqoUKU3RhJ5Y9tc7smTyVbAn39UEPU3ZotMw8GqKFi17
 bWUOdiyFQvZjrXvoPOBn35kJsADDqZwdlWgLhGJFkycpqAjfzWwRalt5qrZeMsGOmfk2
 fR7ke2q+BvSiA6Eggej2KGpHaUnH8uewdDfOusAYsceegcm6ZowTsmTo+whxIEqQk1z8
 tN1qtDkXTveMnwPH7nm8EEJcnBU6FZ7OGSao5aQvu9lumi2LyQv8n3wDO2fsr4anN8kx
 8LZA==
X-Gm-Message-State: AOAM531T84iTree7Iyhxt8xZsKaai9MJOy/SHV9Nl/0V4ljzDRvJDCBD
 VsZhWGQYd7NeVLZhgaScwXm/Iw==
X-Received: by 2002:a17:902:44:b029:ee:9107:4242 with SMTP id
 62-20020a1709020044b02900ee91074242mr21111274pla.18.1623123611819; 
 Mon, 07 Jun 2021 20:40:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q24sm10030349pgk.32.2021.06.07.20.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 20:40:11 -0700 (PDT)
Subject: Re: [PATCH 09/55] target/arm: Implement MVE LETP insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9324f3bb-d497-bff6-7a92-1a602b30b6c5@linaro.org>
Date: Mon, 7 Jun 2021 20:40:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: Gt6fztbMGfCs

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE LETP insn.  This is like the existing LE loop-end
> insn, but it must perform an FPU-enabled check, and on loop-exit it
> resets LTPSIZE to 4.
> 
> To accommodate the requirement to do something on loop-exit, we drop
> the use of condlabel and instead manage both the TB exits manually,
> in the same way we already do in trans_WLS().
> 
> The other MVE-specific change to the LE insn is that we must raise an
> INVSTATE UsageFault insn if LTPSIZE is not 4.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This amounts to a complete rewrite of trans_LE()...
> ---
>   target/arm/t32.decode  |   2 +-
>   target/arm/translate.c | 104 +++++++++++++++++++++++++++++++++++++----
>   2 files changed, 97 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
