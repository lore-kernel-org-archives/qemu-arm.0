Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp675539ejv;
        Fri, 12 Apr 2024 09:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+hI0olkbHNOo7UlUx04WnWUJFw84L1OYTWQL3n/LqICcjjL/7H7P3/Qo8nKx+ONQukIqEPClV/ORHyB+xqUcuWiQ1ydEa
X-Google-Smtp-Source: AGHT+IFqYzpnw4cMxMLaioKgfNrnSfQWZnGNYlTcXNjVYk/g8L96Ze1Kh1IBIye+8JaSNcJkEMpT
X-Received: by 2002:a0c:eb4c:0:b0:699:247e:a69a with SMTP id c12-20020a0ceb4c000000b00699247ea69amr3482833qvq.9.1712938671799;
        Fri, 12 Apr 2024 09:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712938671; cv=none;
        d=google.com; s=arc-20160816;
        b=GGmYskxe+Tq49eLyjzJnsJffYgWRzOafipWeTCw28huKsyr6amIPQDrY3WAQ7mhkDj
         lW9IwTbw3tmpZ9AGZ3qcWCJpC/OlRMlygRcJY92UCGddkjTd90i6xlYLMtqtDQmaxJhH
         d4Jxdfz+z7Hu4kvDUpIMga3f0AgNZldfOZYYwc8TZPjsyH3TIxZ/llfZ3vK/d3Sa+hR9
         8BA16cdhPmPgXisE9o79wDEZautzKpjJG1UyCgaqNCHvPX5y1ZjbX9OBO2aY0z9zWw/y
         slL/4Q/VdLgbaTNAlqcPTcwofNm3lxdf49QCCOtSlW/NJ+wV0THnmz4EMVc/qALWImBW
         5zOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=USoFStEqNXqZnRqMSDJ7Q4ksTEbQBxRG0TPfOFM2CtY=;
        fh=5WojEhEmN5eF5K+hoc8OKF90T0JOBS6VumJgCO/FgBg=;
        b=llIbZz8jd6iJFh3G/NwrYkENYXAPqMgr7fElLWxKDQ023mgDkxOQ8urWD1nKX/awoN
         bzQRhSLw12aPhCgZYrcURsbU8rL1CngAJI4GywkKyzGaUvfmXDNyHZapUX6ykWipCNqJ
         3JF9mG0ivnVSCN3wqi5jfNGcESskIU2tdtqR6v4E8xQF+J++H2I+xuOt9I7OBSWCyZQT
         avWFJayNyPW6c8wtexIFKLavfjj6iE+xiHWzNxBUlg779L+mRm5YCWw17FWeqGY/0h54
         CGvdlDVITEz3s+SsT8qx/wJoMzcnbm8uGDxhloeo8u2bVCQ+PTA7UPoqwy77F6ioAXQT
         GkPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tc8WBqkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ct10-20020a056214178a00b0069b23f26671si3932202qvb.185.2024.04.12.09.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2024 09:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tc8WBqkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rvJao-0000Qb-PZ; Fri, 12 Apr 2024 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rvJaj-0000Pv-KF
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 12:17:33 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rvJah-0006aI-KD
 for qemu-arm@nongnu.org; Fri, 12 Apr 2024 12:17:29 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1e3c3aa8938so7319365ad.1
 for <qemu-arm@nongnu.org>; Fri, 12 Apr 2024 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712938644; x=1713543444; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=USoFStEqNXqZnRqMSDJ7Q4ksTEbQBxRG0TPfOFM2CtY=;
 b=Tc8WBqkLIcT1ZsKFCTg2/7cD1d1p9c/h9HHohi8tZqqqyM75jmtuI1in1wU2pvsxzk
 VGWJUseUyQV/BjtVSH2oJ7lqaIe3PbJG2CDj9nFjk2+gpKlOFpb4Jtpy3nC7OrdQKcMr
 6bTUaIT8GeID0wZVM7zr8+6yX3gMpMGzPAycGElDK6/dx24pN14u5UBRNr9jAVWBq3/k
 wawI9xYIWbaovWhnJN27fJ+QkiXsKyIuMbniuJUJ4UU61M1+nnW9fj9hVjfDlYv6y5yr
 OXWq6UnRepTCmy+RjFtHCfrZY2XH8Y2ptL3sjXwKpUxiJLflq3zrDUajsQxqeUg5QNZR
 +8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712938644; x=1713543444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=USoFStEqNXqZnRqMSDJ7Q4ksTEbQBxRG0TPfOFM2CtY=;
 b=h5e6ov0A9NZALwGyZBAB6Qcxr2nMY6utZYaRDPcJF5gbZJjyZrj17lrmAIP1RFg6jA
 IKf+pcLlqHMImtMHxfs4XQRyfFSjYEshsV+0GVu1gEj+EACM7o/Ji9eaaguf5XijULJR
 XviCg3PdUwVsQXdQXqxWHscTRMo0gTRx9eV9mTEF1iVjIIr6Vzz0/rXAi68gs5WiA+LA
 xOho0W+8ZYmh4YsjW/xrGJeE3gvnqr/t2XilL0AwikSOGOalbz6yiVDkhQga7Gr8qGYS
 GhMsC3/N2c4uIiTw7YylqKLq7brI0S8pxeL9OZaeigH0WSSGKPy7eZMGKwu59zfursK9
 WOVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/T6JHu6/qERIA456A93yWRwmZX9NyL8+n9Aqk92H6V6TpN3Rd3CGSx1ccAnbSksqwAXPbZhnLTeBppaMBWncRwqW3
X-Gm-Message-State: AOJu0YwglH0msbdxneFHcBEpcDZjAHCTyV2I4x2ssX48v6QXpMFRrioh
 FJna48SD0CUf55hQT/+1lgOniRw2YKndACr4gnu0O+zYJAwJ1t2CEQZ3yqOAFaA=
X-Received: by 2002:a17:902:b287:b0:1de:f91:3cf3 with SMTP id
 u7-20020a170902b28700b001de0f913cf3mr2573948plr.55.1712938644386; 
 Fri, 12 Apr 2024 09:17:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a170902f54b00b001e420abf8c1sm3169196plf.165.2024.04.12.09.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 09:17:24 -0700 (PDT)
Message-ID: <21265e46-637d-46db-81e2-c2ae948e312f@linaro.org>
Date: Fri, 12 Apr 2024 09:17:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/51] target/arm: Add cpu properties for SME
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-18-richard.henderson@linaro.org>
 <CAFEAcA8pQ9dZXh1sghqGmuVRubFkn2HQpRnzDSGQpkUSKGg+jA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8pQ9dZXh1sghqGmuVRubFkn2HQpRnzDSGQpkUSKGg+jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DknieGl/SWaK

On 4/12/24 04:36, Peter Maydell wrote:
>> +  4) Disable the 512-bit vector length.  This results in all the other
>> +     lengths supported by ``max`` defaulting to enabled
>> +     (128, 256, 1024 and 2048)::
>> +
>> +     $ qemu-system-aarch64 -M virt -cpu max,sve512=off
>> +
> 
> I just noticed this while I was trying to understand the
> SME and SVE property documentation -- the example 4 here
> is in the SME property examples section, but it's changing
> sve512, not sme512. Is that an error, or intentional?

Error.

> In the SME section we say that all other lengths default
> to enabled, but in the SVE section we say that the
> smaller lengths default to enabled but the longer
> lengths are disabled. Is:
>   * the SVE part wrong?
>   * the SME part wrong?
>   * the behaviour deliberately different for SVE and SME
>     vector lengths? (If so, we should say so explicitly to
>     highlight that to users).

The behaviour is deliberately different.

See R_JRCSH and especially I_FQKMN:

     For example, this means that the set of supported SVLs might be
     discontiguous and might not start at the smallest permitted SVL.

whereas for SVE, the implementation is required to support all powers of 2 up to the 
maximum (see e.g. the text for ZCR_EL3.LEN).


r~
