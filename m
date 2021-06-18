Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1630781lff;
        Fri, 18 Jun 2021 07:49:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtmX4pDa90srvjkwXzJiIr6RahQa5rVCvllF5KTq0doqKV00rHlj1aojfepzmWr2kxRiDj
X-Received: by 2002:a1f:ab08:: with SMTP id u8mr6478232vke.10.1624027748647;
        Fri, 18 Jun 2021 07:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624027748; cv=none;
        d=google.com; s=arc-20160816;
        b=yOotOvS1pHS3Q5ax+5LJo3iSKZAYwQ6weGOo895xBQMqXHXFVKmU9MORKdNiH0liiX
         AT8E3NKC3Bzep8bK42RBqaw1jPC29AT70HScYKT62ceQLDVWwHBTPoF9aPgNPAlM5ftw
         /DPq9qIYr0lqRTE7FoszQg5WEm6hTW5hFTCma+bculXUOIwjc65BXle01v2mx6s+ElwL
         7asLBfgLeGCKpsVN2sPRylV7rxI8jZXirciQHgReyvsf6PNIaTdLgYh9sKxKmKgdwVJa
         xuX/pNy6gLXEEZ2Tf5du4InWHXr1+lK6FO2BL+Cap/7IOibbRjhDlQsvkAjy8I+v8SWs
         D+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sVDzdrALyz1Ut5u64nza+nfE2rUMiAyHcq2AHxcbUKA=;
        b=LDEo1Zex0HkPmLlH+OtGLCBuJCTg6o1NLnEtCDWgaIA5bUlv8oRvDXLNKNLK3AdlXu
         YCosIZGNFN1IrTp68u6uT8nsjcHz9wZYDgQmiljwaQyAIZbTgIlfQ+9Oq+93ZDUFVoR3
         MwUuMOL41VUe5Lnwi5bC/NgfRADZ5WjBsUG59pM3FvnWAPl6Cd378vwpIW2TMTZKvqnU
         WR/l/St38mpsuRS5KtMfa9saxnvxIfh4WOr9E/3MLGnHrn5LSbgurZByEfEdMqPWLz5C
         p/mhQiecR4Uq1x4uuFDqcuHLEhjUPjWbh01rcmF7wTUDGyt1/gol4Kgs+fidSMUGo3Ym
         1xPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMPjsFk2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si7577290vsi.152.2021.06.18.07.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 07:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMPjsFk2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luFnv-0002Zp-Vu
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 10:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFmo-0001B0-Nt
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:47:58 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFmf-0007mE-7t
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:47:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x10so4789076plg.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sVDzdrALyz1Ut5u64nza+nfE2rUMiAyHcq2AHxcbUKA=;
 b=bMPjsFk20VWbE+piRqoBq73u9O2xzqHbDadlPR2vK1GGI/aJwFF8mUQL4yTgGokcjq
 IqGQzK6SzkFQLGRgDN0QwKqSdVa5kNdmrmtRFG/43Po1C3LvqoyyGLWO4gQNdPjMqEe6
 MEGO13vcfJoRWgF3XVN0dYB2NYhHwZXz9PqsYYKtfUO0EhcmtZVb3er8nNIzKdgBDk3o
 4FYqSMC0IW6T15z/y5vEZqM7LRfwqhyY31epRSBf4UGCzN9obOdGHWNgn9Q9Q3md32QE
 i/SIUv9pEZjFk3eVfVyENP6Ta01TiEA5cLpeJUjKc/GEICOemUYixbPD1vS2PiXBF5WW
 jWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVDzdrALyz1Ut5u64nza+nfE2rUMiAyHcq2AHxcbUKA=;
 b=MLTQzO6mtglfY7VUv3Ff7++1OgnQgsoc2PcH6wvmD4ODuE7B+ndNh18+hgy2K8hrns
 nBVo20QzspRvIjY0Sbw1tjPBLDG6l4oSBKE02f9xBXm/AlqMb9aY9/uoQ8bTMjnkdnS5
 XucHIbNUPqVBTDxeXwSNkiQdSa7oWe8tuCCNjUaEwqUOIBsROnrcqD2AUkX5WeHi+aSx
 8xpUIjhlDELc5JjJ2ljRvpO/MPjjlUWecvHGGUzSpU247KhjZSjpfjeJJh/C1hXcbN1k
 CurLSgK5K+OKBa8wN0U37gyV9vAsyq0how5XLYNmTFzMcuu2h0lR6N0+sIb0Me46Wsv4
 ZeUg==
X-Gm-Message-State: AOAM531qvko7qf2t78NXE3Q+NSnpNgT0CTf0J3pWnm5d21MmHJUPWPwB
 MPaq6fPRgd64iM3cSpxOiIljL7JqGqTrVQ==
X-Received: by 2002:a17:90a:6548:: with SMTP id
 f8mr9354201pjs.106.1624027667651; 
 Fri, 18 Jun 2021 07:47:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id e2sm8284702pfc.135.2021.06.18.07.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:47:47 -0700 (PDT)
Subject: Re: [PATCH v3 02/44] target/arm: Implement widening/narrowing MVE
 VLDR/VSTR insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1d8014f-c102-395d-1f1c-d02276a7c5d1@linaro.org>
Date: Fri, 18 Jun 2021 07:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617121628.20116-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saC6ffUI+NQM

On 6/17/21 5:15 AM, Peter Maydell wrote:
> Implement the variants of MVE VLDR (encodings T1, T2) which perform
> "widening" loads where bytes or halfwords are loaded from memory and
> zero or sign-extended into halfword or word length vector elements,
> and the narrowing MVE VSTR (encodings T1, T2) where bytes or
> halfwords are stored from halfword or word elements.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> v2->v3 changes: pass MSIZE, so we advance the address by
> the right amount in these widening/narrowing versions.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
