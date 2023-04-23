Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2395518ejm;
        Sun, 23 Apr 2023 12:02:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBaduuI5nOsE9jFSdFonWduaA/WRoQFRokyvi1PDSkFa9LYz2cxetUs6tWSATWcKOXKHTK
X-Received: by 2002:a05:6214:20af:b0:606:526:a828 with SMTP id 15-20020a05621420af00b006060526a828mr12622696qvd.21.1682276568654;
        Sun, 23 Apr 2023 12:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276568; cv=none;
        d=google.com; s=arc-20160816;
        b=m05aeNv9MijZyfoLbpGV0p6EI4i4c0FFxSq5GvSG4dpBkDwn3CPszGFdy8QI75Kee/
         7LXOujp99+uCXEhJzvJBcReW8EIj0MdXP8qTDy4301DGrP+/53iSezg3g9bkXQB08aiV
         GC2W2fEHksyNg4Wj9Z6usLdj0yGpOGv+P74OINbma5PLKFcWkBnaIMvMvKZti0ixwJ/f
         BlP8USEHshzH10IUuJ0NbvC2GuJbELa34kQ06HSE22+DpxSHAynXqdhEn5sQxjYYgYHH
         zPJ4s39hZhfaVdoLS/sPccXiC4LAScV46S3Eg1mqdJoBQ+LrlFXpczNOYhqhn/a3x0nq
         Yfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GBN5wcHZUSG4gSnKo/pkXGWb4P0E094RZYM0hsP/MIA=;
        b=qNdkVBwMOgJ6k0BzmAGlNaddDnq9pnnnk/IXxI4qaB9KhyBdgFR3h9Uz3Y6A6mmSqN
         mP/TXynDfQXnLE5MAuh3Fku48+znPncDRixSLzyPp3lJqr95QeMybmZ2BJRMpaHcEJh9
         647boTSxq3lgOK9+pX7TZgyM+Sky44Du9Mw2ZgIfy+zpC5WmLZsAOMkWLs48al1Roznn
         gsbMA4Nsr/hhwRh6QLSQ6HS1wCHVkYmWba/+bkEu3+x5AVy/slHG79ZDJtD/Os/r8aDO
         o4oq6WmnN+QEy+JvRR7zSc9/ZdnXzFc1WsNMpuifFTXciqprpLW7/6Pblp636f2MYnLq
         Bigw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntfukK7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed3-20020ad44ea3000000b005ef47108414si6356872qvb.120.2023.04.23.12.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ntfukK7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqexB-0000EH-E0; Sun, 23 Apr 2023 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0008VB-9L
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewv-0004Pj-MY
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so7058605e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276433; x=1684868433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GBN5wcHZUSG4gSnKo/pkXGWb4P0E094RZYM0hsP/MIA=;
 b=ntfukK7OvoBh4rcO3lj64YwOp9Kv5nnhgrIAbspm3yX/2mmQaADG1qhY4SUpqIjzW3
 I50ikr5MbnVRjvu/dh09UoVCyEJbZMwWSXsscl1YF0EI/vHxfsnkp/VqchjW6rTYaQhA
 yxBXAj6vR1KLVjDpMtxLVJdfy53ekFkZOXep0ic5Z1PxZbLcgki88YFXKaE8uwVfz6HC
 cnZEjAnN8/FOgBHVVtcxbuU+YM6y4ywNIwEsp5hTD16mcxH6FXvEstrMeMFKQBqBKkqV
 nGZOwCXkeS4aLQEzM2NacRvAYhpQ0PP4YXOUjdwvgVvuLTheqmmyt2yR2LXUGv5LQ+L4
 4KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276433; x=1684868433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBN5wcHZUSG4gSnKo/pkXGWb4P0E094RZYM0hsP/MIA=;
 b=SIPUfeVjmvM1PI2lOxMzAmQg1EitNg4/Rvmqwqay+Tf/6VVnIHz6e2Mk919f/eRqgP
 qJ0zoeDiFTcpaAq3LJ0XsT/RQh0Zb+PkTEcbuP+vgw0BYWNNvCFuEkIKn6bq7S8snAt0
 rrQxuUFsnPIfqXhwqnclgi7pJQZg3d4fzuZFzroXj/9Ub8HhGlFRLSdB5BpdLxatZPfb
 hv1LARltICmhz9ZPkNZ8/JD6KeK9Q/whqZpdU7RRs5NJjh2M7xnK2Clt3N4FsgMxEcCF
 MI29teZtbYLJMttsP0jEs3AL2zfExxLsxYyE8lZxgO/UBlgXBRvJHBtFo995kXI7vkaQ
 jM/g==
X-Gm-Message-State: AAQBX9cKwIjdVu0nPcZ7fgvVw6DQ0fXbpHcbxsl+SOXy10UusouRip4C
 oHdUSq7OrrVSbHnXYaN23qjlSTmjr6tiGpb0Fmox1Q==
X-Received: by 2002:a05:600c:2214:b0:3f1:987b:7a28 with SMTP id
 z20-20020a05600c221400b003f1987b7a28mr3357822wml.29.1682276433689; 
 Sun, 23 Apr 2023 12:00:33 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm13617136wmp.36.2023.04.23.12.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:33 -0700 (PDT)
Message-ID: <f7192acc-2ad1-8bc1-fc7b-0f23518fb2e8@linaro.org>
Date: Sun, 23 Apr 2023 20:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 20/54] tcg/i386: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: gnK2UfQc045t

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 113 ++++++++++++++++++--------------------
>   1 file changed, 52 insertions(+), 61 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

