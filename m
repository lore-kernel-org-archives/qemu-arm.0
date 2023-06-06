Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3535719ejb;
        Tue, 6 Jun 2023 07:39:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4X8kB3nCSTT4iVS2dduDsH++BMOiVsh4CxQTvwA8DRHicaw96CLvtR/7sFz6oI74hS4FIl
X-Received: by 2002:a05:622a:14d:b0:3f9:a618:f9ae with SMTP id v13-20020a05622a014d00b003f9a618f9aemr2356065qtw.26.1686062375338;
        Tue, 06 Jun 2023 07:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062375; cv=none;
        d=google.com; s=arc-20160816;
        b=HwCXj6NttKDHru+jtBNyYh6idsNIbm0otDC7triaorTgB/635XK/27YqmHG6oqqE8m
         aLwqMUdUGecLy3fxmAJn8Y812fy7r6UyRnnmoFagAPCUiwyKvGBVOhyBtW3Wvy2LMOL4
         4AN6hSmoiThDpYA8MI/CwEGuAI+RrfrS91MXppNQjwL9KziUZXr7x+ApbCQM8+xzlBUZ
         OxnAPrX2OHAJKRQfGYvbBw43Vq9OXopT3XzkTQM14XD26ZHxKKEwc0ybcvOrHBQOLyFO
         MC9E/zvviot8RcT6LSCrgie9zurodDREpjN8wx2R8wMSG4u7KkzKI6+S+Aw4GaA0ijdK
         /00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YcVeRheuB7gq+ezkQ3FqST0s5x7EHoi8tTahXk0iVkc=;
        b=rqp9jmSAeBf2bw0HGeu4h2W4//7jHX0KVWKA1ozHWhiHF1Ucq85Tgir6yfhe6Qc3N6
         6OidpiCk03fTmpmdzy9STnptWo3wcvwPVx5KsbqS0Sj4+sGuZY4PmilvASHv2YCqXiK3
         YZCQQXMNslLGJ48YyKTu8xUWzcek3L9ZdO+8t9PDNFZJnIR/0hfDhssZNdw1IlrSemgX
         IJeqr91O440pfVUV/5ZccEXabdzZ4AjGPAANfabIzyYgXRG/ELtvqE/0ZxrEmVPuEkRB
         CdPonvio1ytbpko62DM/EWazZrJ5BUzjAk2fmCDW/llsUHxc5Wobn0qCpq5btVOmp7gu
         ohFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epebHp+O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ac85c10000000b003ef3c2fd077si6688039qti.740.2023.06.06.07.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epebHp+O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Xpe-0002hG-Cb; Tue, 06 Jun 2023 10:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xpa-0002cZ-0j
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:38:43 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6XpV-0002hr-TM
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:38:40 -0400
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-77a1cad6532so20154939f.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062316; x=1688654316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YcVeRheuB7gq+ezkQ3FqST0s5x7EHoi8tTahXk0iVkc=;
 b=epebHp+O4sx2km81wwjHOwBNUErXSEntL0wGHl20sIFjOoS5QTt+t4HFfm5wg6+sF2
 J8gyVp61rshxZtmVkkxWka37Tk7V01qolg0Ua4QdeNz4pbwhuy97NBBdznlq/EXl+Y4P
 1v5TAzmF0gFfA0sMLR+bB4brF0POi5X9mI/4DRRaEvrAYp609i0IIK6vO0voebyFWubP
 +XQYXqi7JcP8+GyjEBbIPb5sJM9cEf4TBJsiME0qAkUUO6SN+mx0OJ84k1FtRFmvm7Zj
 mYgTkpZnp+CAA5AsWqjo9bOCt7/Up3ZM4GAijORQAOXALbgDhRQiclLAwV8+plBT2+1Y
 bSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062316; x=1688654316;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcVeRheuB7gq+ezkQ3FqST0s5x7EHoi8tTahXk0iVkc=;
 b=C+OMnYR5bHUFrcI6vf/lC58If7Cwywxt1PIc24HscSk9Siv9rcM6CwcPa3AojcvtK5
 PWtccgwwnXDxdMNWujjFPs16t+gfaBfHSWeWyH7MQ2b3+delpXXBW1bmBbzKD9MMunTR
 4ecKAJmkyty0A4lISVTdmr2f/F3E8H0wARji+zI2Q3plyjJnkpMcRS1rDanpREAKI8qq
 ElKJU1OgOqc1TFXdvvE6wDxtScjFwzZWQC+M4nL+TTz+fR5ByubCFtfkJd0pNmJm3FUf
 QSVfzCeHTpFUW4iI+AuXsgGG/t7BD0TOX1Du1f04q431GErH3LP+fVjh11DfqvkPLUOu
 MNfg==
X-Gm-Message-State: AC+VfDwV95wPtTMRiMPiBajfz1gHBuRn0JHfPUGesJxlapCqlCh82oIQ
 +7sm23aVRd+pAw40b0CXf1Issw==
X-Received: by 2002:a5e:dd09:0:b0:774:9c66:cbd6 with SMTP id
 t9-20020a5edd09000000b007749c66cbd6mr3922978iop.17.1686062316667; 
 Tue, 06 Jun 2023 07:38:36 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a656381000000b004ff6b744248sm6940210pgv.48.2023.06.06.07.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:38:36 -0700 (PDT)
Message-ID: <86378349-e78c-3bbf-8960-a9f2399f0bdc@linaro.org>
Date: Tue, 6 Jun 2023 07:38:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] target/i386: Rename helper template headers as
 '.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606141252.95032-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: LjOTbjepJGnK

On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
> Since commit 139c1837db ("meson: rename included C source files
> to .c.inc"), QEMU standard procedure for included C files is to
> use *.c.inc.
> 
> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
> about includes") this is documented as the Coding Style:
> 
>    If you do use template header files they should be named with
>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>    being included for expansion.
> 
> Therefore rename the included templates as '.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/helper.h                                      | 6 +++---
>   target/i386/{ops_sse_header.h => ops_sse_header.h.inc}    | 0
>   ...hift_helper_template.h => shift_helper_template.h.inc} | 0
>   .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
>   target/i386/tcg/cc_helper.c                               | 8 ++++----
>   target/i386/tcg/int_helper.c                              | 8 ++++----
>   6 files changed, 11 insertions(+), 11 deletions(-)
>   rename target/i386/{ops_sse_header.h => ops_sse_header.h.inc} (100%)
>   rename target/i386/{shift_helper_template.h => shift_helper_template.h.inc} (100%)
>   rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)

Move to tcg/ at the same time?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
