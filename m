Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4664772ejc;
        Mon, 6 Mar 2023 05:51:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/QMx7YGj8McghGkkOoqoSdhgK7p6m9ZhT9bYK2HZwZxxjEoJDRWqHBXzeuy2z+8xiPDgJL
X-Received: by 2002:a05:622a:1106:b0:3bd:1835:b001 with SMTP id e6-20020a05622a110600b003bd1835b001mr18146736qty.20.1678110667334;
        Mon, 06 Mar 2023 05:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110667; cv=none;
        d=google.com; s=arc-20160816;
        b=u+l4Hw7TP3vfnZu9L6vpGjAK+oeIOrXA40Qtg9LDJ1d9+3/11fnJmBCfwfn11UrYTp
         CzMvFKox9+cHTxbXiRgPAh1dIjtd/MrTsm2phDsyzJC1jrKGQRSjvp9Acm9l1EVxglbC
         iREz0/ywLX8M7GVd6F8wzpjn/B/InvIDaglgY09PTsItwuTRI3fUJ5cmeNEl8aRBzVxd
         PkxRFW9uJg6QqWvwOz+I4ACbqWWi4UDjsEsG/mCxGmPSoQ1kXZCDp0ls/U3IGR1on1/f
         4y57wmdbg6pKkQ2mkL6fto0HQzflmFNsoxz/X9hp1DEvONAIsKL/Ucnltnh7SQJ81Uf6
         I/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R6EY7YLlxUlNircTEBcEM7bEjeHXHZddnC6H8JIHLFo=;
        b=jEDYZiQQCeCH+Iicogx9p/aPGKQ28ooN9y3TPpKW64pJDoKn1mO1uBW63XN2jRWuQH
         hVN5OlSCOVlgGBWtajx/haOmtVDQfpb0IwF8TNAxv536Cu+ySbTKXnJ5Qxb+ZCTjYDUA
         j9WComfBqjOdQiFBktXJLueewzKWVdi+oRNrulAucchcdEh0wY46UZEDUkF1TGrNajes
         S32R8gDmnqS90gcD5rb77u/QoeykByWp+kHdfEbD/XdZbT8SmhTnD9P3/qbxhk1xYvlD
         AHQbU64PbsMb72koRxUy2Rmq7UNPF+yNGtcizjzrR0bX3tgrIvX89iSujfOj1Ot7GqHL
         +IHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VXN5/NSy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac84e86000000b003bfc38296c7si7418547qtp.468.2023.03.06.05.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VXN5/NSy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBEi-00056m-S6; Mon, 06 Mar 2023 08:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBES-00055t-5z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:50:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBEP-00044H-Eu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:50:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so8876531wrz.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R6EY7YLlxUlNircTEBcEM7bEjeHXHZddnC6H8JIHLFo=;
 b=VXN5/NSysX8D8XNoV6nEc/9ce7fxc2EDcC26U4QTj6SVBuvQAI9eUS66JVEANwkNZc
 3OfOuRKbN9V9KDqMaowNV/Tr4fvSoo6olfCoEH6+xEbGyHwXNok0b429zQLANTZYON++
 oDHCqkxjN8CJDWJcrnsF2wrq8Zc0Lzl931NIpMEdR/IyXOU2sfTIDFZVmB5qYUIlk1nt
 D4QouQ8bz636QbxvMKfN+UfTxNMX96YFbCgK4M6C12P4jVTmnIoVlj5TiNcahHp/FOQM
 Zb3O4XTlu19ZSNibpf1iWA6AX06hYR1fwCMAy8wxB1GYz3iqB8r6p8QCg4VWYz1NUJ8Q
 qlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6EY7YLlxUlNircTEBcEM7bEjeHXHZddnC6H8JIHLFo=;
 b=01TiZsabjt23sYA99o13jH04gwoh2MI2IsFoiAOGd9+fQtrHYvIt8zA6H/jrsJqcZs
 WohTOVrjc5NjfZLq4Ut1OZoNm5TlVpaIo/dzq2rltk+FnHVESuD12NdQkwpxpRwbhd9n
 jSOW+v8XTbWuZpvIMkvaQwM/O0vx/Xz0iEHj95dB5JgPpcZ98ACAGOwE+gj8ZixMBazz
 1RkUaxsm26G3AWuUgjgla6k31hAhT9zsY7Ij38qybfvzRoPioNME7ZYUVO7vRwxo2k+d
 Fumn9EzYLpNAde+72VzXbr5Js8PSQezeln3J2ckZ7DIaTfC2hooJ5frkbQwhunNYI69L
 dEeA==
X-Gm-Message-State: AO0yUKXYXKL3gl604pC0x15T672OlyhFC3xOgrVzf2UOJ8W2mlCkfrHA
 yXDEWkTbYSFA3R9OWQYkS+fzqw==
X-Received: by 2002:adf:fa4a:0:b0:2c7:d56:7d72 with SMTP id
 y10-20020adffa4a000000b002c70d567d72mr6104765wrr.19.1678110617503; 
 Mon, 06 Mar 2023 05:50:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a7-20020a5d4d47000000b002c5706f7c6dsm9945140wru.94.2023.03.06.05.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:50:17 -0800 (PST)
Message-ID: <a58527ed-1573-75e8-62ad-3123951d93fa@linaro.org>
Date: Mon, 6 Mar 2023 14:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 20/70] target/hppa: Avoid tcg_const_i64 in trans_fid_f
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: PU7p2MncdnG3

On 27/2/23 06:41, Richard Henderson wrote:
> Use a C test instead of a pre-processor test for the id.
> Use tcg_constant_i64 instead of tcg_const_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/translate.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

