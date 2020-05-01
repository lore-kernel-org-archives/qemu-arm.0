Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp210476lfm;
        Thu, 30 Apr 2020 21:08:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypInyrj0BCAplabrF5bCAibjrUolQBOZBDgsstTSgdM/fHXVn9PSuAcrdCdntR56ceZe2kqY
X-Received: by 2002:ac8:550a:: with SMTP id j10mr1895331qtq.193.1588306084825;
        Thu, 30 Apr 2020 21:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588306084; cv=none;
        d=google.com; s=arc-20160816;
        b=WD2m7IuuXvlMCNnjIavcCC+gE1KiTNj/Gk7nSoP//bSHOJDuQjGVW0423ZAA71lZPk
         yXVfaGDORdDOjNGM6AjL2PMiJlStepeF+ceSUp/ICS9sD9xRvQjb0jg5gkg7Ce/euVUr
         CNAFcsMQi5jE9XlpWzAI/IAQtT5KzmOXHe0IW1mBuKlhszhh8aEGjJfCprR82T3bKZ5D
         JuhAG5dH6577jTMQ8UK2brRTRyr/4rUUlTxf590ZwWwWWQG9b/O1w5ixus4M3xWfMeum
         CiFdYi+hvSZaIUDwDa7C22ku8xSXMl5rskFn+gaklXJJFA9RBWLhj9W9VIgGn0IG4whj
         bOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=53zo227nmqhkaH2bxUIKsDvrPImSGtKqPyQI6C8DCFU=;
        b=ptOI9pRRr3ZGnaQPhpfmAMmiKTsib8SwztQycA/6kSuCSRMjapBd2QIuoAB+Mz3Z+o
         2PYyrjOvtc2ds+MvJJwNd9ftYOsJFSW2x9hNtTk0pn2EVVZJYBe0yidFLL/FoSjN0nJx
         sX3lk/uRLOWCt9M6QOL7och6pv5vu3CzB1jNlE3cU6W46WvhaFNNnscZN+ON5zgXH5+R
         N7coKo0fgPAYYNrhGO2sl96kdRSIt6hQZtZUyC0ggKBBvDjf4AGK9yh/JFj+o+zbDCKo
         tGRojrBpRdOXc61djt7UTfQsfG0aOUfBJRPecaz6i0SXrDl8s9R8au/eRUkC0ROD0eEW
         P7yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJAojlc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id z25si972787qkg.363.2020.04.30.21.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 21:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJAojlc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMy4-0005gN-9J
	for alex.bennee@linaro.org; Fri, 01 May 2020 00:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMxw-0005es-T9
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:07:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMxv-0002dh-KD
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:07:56 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMxv-0002Xm-2y
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:07:55 -0400
Received: by mail-pg1-x541.google.com with SMTP id l12so1191813pgr.10
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 21:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=53zo227nmqhkaH2bxUIKsDvrPImSGtKqPyQI6C8DCFU=;
 b=UJAojlc8CYQugPotPXeeaT4d2AvbwPZ7dF66nyHuMqfADwPuLTirdxACle7/7VYtz4
 IMpyHP4pPa22OR6RviQFuIZG4ASmNgJrAY8fNIz3NVXJwlN20tTi9STnIAYGj6M3kxBn
 r8vfVfB8YKGDIILuhtdm7PTxhpmuoUq9F/u+5d3jlDpnqq3wpie+z8LFLGcAKDJYUBTK
 kI6TWVD/VDo8jakp3gRDhauZEeeb8iCXGwxGaZwt244G0FLkN7xSbn+vgoqopYlm1glT
 3QPZQLLRdMR/CN1NGTfG4VGTkISwEdvuaTXOO4yepEsnx67Qer7QUyS7biY3MADwrsnC
 Odmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53zo227nmqhkaH2bxUIKsDvrPImSGtKqPyQI6C8DCFU=;
 b=QZ3YK4JKq2RzxeKDsdngzhkT9ew9hCtEo39zlz9mzarVxHTStM15psGNg7YKrnxvF4
 sNI1XCoLgy4TmNxs0ECLHsoiTI4PYtPBWsh5lMOUQMbCS6AAFLv/apGg96TtpJzRJA5h
 aZIlfp9g5c6+EQ1tsULyrn0rREIaOsS/63+NrRydNyqiRnPwseZNhTy3xhiSl8em+Qeq
 9YFACZxAc0HHbaaaLMvZMA03E7LDAikO3Kis2m6Of4j0EI9+DSfbEzgd2Exl99GSVk5m
 EGponQaMKXfU5Jc8SuhnQtNDIw5c4fRQCxNyNFstNahMlLfE2xRlQ18/3iJnQtTUYOmB
 QmFw==
X-Gm-Message-State: AGi0PuaY4vI3YweD2gqkfIUfeb/CwrSv3FA8/HRcup0TPuNPzDKjOo7V
 gWI/aw4MG8VIWy5iKKxchu7RKQ==
X-Received: by 2002:aa7:9a11:: with SMTP id w17mr2218097pfj.314.1588306073505; 
 Thu, 30 Apr 2020 21:07:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 5sm980206pjf.19.2020.04.30.21.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 21:07:52 -0700 (PDT)
Subject: Re: [PATCH 33/36] target/arm: Convert Neon fp VMUL, VMLA, VMLS
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef96d1f3-65b3-808e-afdc-4f43f58fbf21@linaro.org>
Date: Thu, 30 Apr 2020 21:07:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: 426i4P3MMA+h

On 4/30/20 11:10 AM, Peter Maydell wrote:
> Convert the Neon integer VMUL, VMLA, and VMLS 3-reg-same inssn to
> decodetree.
> 
> Since VMLA and VMLS accumulate into the destination register, we add
> a reads_vd parameter to do_3same_fp() which tells it to load the
> old value into vd before calling the callback function, in the same
> way that the translate-vfp.inc.c do_vfp_3op_sp() and do_vfp_3op_dp()
> functions work.
> 
> This conversion fixes in passing an underdecoding for VMUL
> (originally reported by Fredrik Strupe <fredrik@strupe.net>): bit 1
> of the 'size' field must be 0.  The old decoder didn't enforce this,
> but the decodetree pattern does.
> 
> The gen_VMLA_fp_reg() function performs the addition operation
> with the operands in the opposite order to the old decoder:
> since Neon sets 'default NaN mode' float32_add operations are
> commutative so there is no behaviour difference, but putting
> them this way around matches the Arm ARM pseudocode and the
> required operation order for the subtraction in gen_VMLS_fp_reg().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 49 +++++++++++++++++++++++++++------
>  target/arm/translate.c          | 17 +-----------
>  target/arm/neon-dp.decode       |  3 ++
>  3 files changed, 44 insertions(+), 25 deletions(-)

Note that we do have helper_gvec_fmul_s, similar to fadd before, but currently
no mla.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
