Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2377714ejc;
        Mon, 9 Jan 2023 08:05:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs+d+LyWB1Qz4wpnEXLmoMVLdRwQE//auw2F9ei/0io6fsTDIxriqf5Pfg+I5MPlMOjgmOT
X-Received: by 2002:a05:7500:398e:b0:ef:d262:f6b6 with SMTP id lu14-20020a057500398e00b000efd262f6b6mr2150681gab.30.1673280350979;
        Mon, 09 Jan 2023 08:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673280350; cv=none;
        d=google.com; s=arc-20160816;
        b=T6z2rwA9lOdHTCBWbW2daeZoR97foYgMD/5kG8D7/zN107DE563/JKyyCqKRy7126I
         ckHvLdMPItRqE93/m5Z7Lm4dntuXa6H0MHrvW7rIjOH6w0hbnf00pFUXaGKQJYbfcwld
         5lyN77wC76KmYit6mXyjyhpZSMTryn/5m5+1UKdLiN+2Vt67h2pWMPJOnWPXCn4Mt/0h
         XtG6NiThOAWmBVBb69E5MkVvQkP7uo38JIeqjRW1oQKcUjiidmgISArC9kZP3H6IMqBQ
         lANSaNx8ScHR2KBq/P9P3I4jqEmOdA33RJlyoLbTqCzhGaMOUchNoD08MYEHM8f0jsl0
         CPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
        b=XQfFCpI1Ww/AIAr1zB7IyXKZcvsT+ITiCJNc6qEaj/3Jr8d1VyxTuyDh+dG+19Jzav
         XZldMYtEYEnrDzji27valGBLHWMGeEJJ3hGnJK+/mqbcPzuCCRezDtZzN5ONVvAIfP9n
         O2nKYbVCzhsuNsEODZDjDNd11rnRatDdRCwHVbgm36bQJzkutjPygqEUmSyPacu3a2Zi
         owEXSIG3QNduy53nUjG/eTW6G5xdVnqntGwMxTrry4pNp2CmwJWUiHL7ejdn7vIJrnM0
         M8B6gtZ6Xn1AN7DimDPcrjzCYFnioQJXi28zncp9xSKYIYHthscldHdwU6v8YmrQRL61
         uDow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LN+PGwuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05620a441500b006eeb3165564si4475228qkp.34.2023.01.09.08.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 08:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LN+PGwuw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEuec-0007sq-EP; Mon, 09 Jan 2023 11:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEuea-0007qI-Fd
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 11:05:40 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEueY-0007xn-La
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 11:05:40 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 78so6174006pgb.8
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 08:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=LN+PGwuwBQmwQ3Ub4Ru/HlrWZDcFFrTgBKuWgdKsEXudsSp9Tgbkc2MtxGnCyh2sDe
 JFq9utN+BmwHjCKOaZ1U//0J9BWjAdggMFv7JW7rw48XMWXRofnstNr7HiocWNt/Esas
 XgjyhOIFEZ0fJkz3GTC/n9q/SjgSGPZWLWo6lNv8MIPgAFgBj2H0cH3ieqwVAf7dZmU0
 7svnR5U0i93wI7UAxSvAVv2cj3bvtk9kNOwgdArKJkjULUCiqEESQME0AiUdV6QSzSiX
 CUvPYyPAU8FQ0WvnymPeRnmUjsru08agw1XJurU9+46eLCeaES8Hk4s3PBgz1v6oLO/F
 C1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzhIWrFISrEHyoYy31oAz9jlFFWkhL62f7bSBQwvXlM=;
 b=hms6BoQzisgIGXcU705FeCapwLNlSi5fmh5kh6DDpiA+LZUlGsmYLijAjJZMBDubUZ
 ZT23Fy/N+0WkfQ3eFOiVIj++wJzTlIfCXZLQhf5wfujSdBMgB8w/lmErQx4tTOATNwQJ
 4It5E9ulTwqJ+vnjhsWZiqOSkKoRUaPaz0/Uhgy2ZWCDoOfgoNnzzr7Zge5QWRQwSZn3
 fhSlOFhP2MMZbqf/ybLJ2yx93mOZa8GHOmCjORL6sNeTbNy78prH6oaD1HyoaHUC4mz1
 sfAKOa6eyfsxXQ0xPDuB47xPRJeHucohh5QlghdjDP1T4xos0vh8MWXBzELt0Kjttoaj
 3czw==
X-Gm-Message-State: AFqh2kquisqCLbdpKFD7w2nVJnShx+p2YFHUldSPwqGNfrre5hmecHlK
 keZP5uqFUqk8Yd/xUGVXJIzesA==
X-Received: by 2002:a05:6a00:21ce:b0:581:26c2:aa0a with SMTP id
 t14-20020a056a0021ce00b0058126c2aa0amr66671593pfj.30.1673280336229; 
 Mon, 09 Jan 2023 08:05:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b00583698ba91dsm6264799pfu.40.2023.01.09.08.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:05:35 -0800 (PST)
Message-ID: <5072666e-928c-1aae-3dde-7c4f3a440b23@linaro.org>
Date: Mon, 9 Jan 2023 08:05:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: /edQiywFpNm6

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/bitbang_i2c.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
