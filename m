Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp986271lfy;
        Wed, 5 Aug 2020 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa2zh0oAE8y3K9C6J+6cRQq2P26Cjz44LVv4i04/BjYAY8rh4MEYgfRw/9aXoMIHDpFM5p
X-Received: by 2002:a25:d802:: with SMTP id p2mr8207378ybg.446.1596661911234;
        Wed, 05 Aug 2020 14:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596661911; cv=none;
        d=google.com; s=arc-20160816;
        b=EJYs2vgRRHVQ7Nv9Si0iCp4QLdNZ5wEcJRTcxB9dxD4McQGMMwQ3jBQ5S6nj9qJuqt
         VDoFuhsxATiKpWrNvulGTtqIXMkkr5qoVKJFsVW2ODylexubs2d8/5Ys8p9Ub6C4sG5J
         uMByhJggoi+KyeXJE27q8cKen1jzyTVoRMcw0PzwlhTaOZZ0XYbGpFsue1hjprm6k3BI
         pvjOiSEiHudOC9du48H2q8UOvJd7hv97Qfe6zWbnyqPu50S6x7XWWbkFPLlBuBIOGN4B
         rJ44YSs+2WiO93Zt7m4nUGuRUtZ573MO/+DhczeYxroQ6UPpWPou/M1wO5SUUwtIiJk5
         ruLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nykug7OBkKT8FIPOakEQS12YWRPjq4aLZnOHHuZdFfQ=;
        b=uNDyQFYw62zcaenD9+FvDaIREuYvWSZga5C45/kUfK0OABDgjKfpF1ij+JGdyXnytr
         5hhAtX6CZ2wuNIzNHF3B3eDJb1xuTQ+TDhms7ejt2r64jsiiuCt1QUMUsfPL8iEotrj4
         NEelY91a4nlV3rAnJOwOPSS8axmgdA4YXuap8bNBKARmAQMC5YJmeQ+vNejVRFD9TkbZ
         3bMQJgw8uvlscltP2LAbd52guvmbkMnKVdU5StmUFD9vZboic5L0zUZsQM8fHxyO2FAX
         00lWKYY/oseHD08M19Il+ppKW5gzfPK28sCshRIW1f/EJLvPt0k2Hf7qz2JfnxhWzMKg
         /kBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U9ixiADJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si2758012ybe.155.2020.08.05.14.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 14:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U9ixiADJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3QhS-00065m-Lv
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 17:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3QhF-00065W-6y
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 17:11:37 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3QhD-0000na-KI
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 17:11:36 -0400
Received: by mail-pj1-x1041.google.com with SMTP id e4so5424147pjd.0
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2020 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nykug7OBkKT8FIPOakEQS12YWRPjq4aLZnOHHuZdFfQ=;
 b=U9ixiADJq31jCbxqvdt3AbYtFNOl2CHgeb5P64QjEBAHSivQYTjBW7jEvTavPkcKG/
 s3s88C8xCxPc/oWoERiZK+KTOklPYrOSH2ppGQWFSv6ZcJEYWIs1ICE2KZhqmL2avbl9
 SVjTXCD5BwlNTxpU+gu6sB2bbAiEiGPpKIEHMaKiOMxLZsv3jvZdPIeA9yeBxKnjfVYP
 M4Pksaqo64H+DdX3Vs481cxRbScOZTlxv9Rn2ICuza/TTUqNYZGp0XCY3pNDgm3pexbN
 zB6onC81juJAJ986KomZ5JGtqIPLEz/sy/a/FEGP4zNB31jbjUHL2xHeZtS9dq1fg2jT
 4NEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nykug7OBkKT8FIPOakEQS12YWRPjq4aLZnOHHuZdFfQ=;
 b=iWDaXZ3wGy7L5ENRZ10caXMF7uWxES2h1paM6Ik1zNpNiS6oHouJweL6bCcK2OB8Yl
 Xf13o70+itPYHg3NMZjVXWGhhhzH4Fa8pM8RPc0hR52NDlkwzaR9Gf925y4m2CGT1Q/a
 6a7lmNjkN5tLd+//YwOUlNX32TUjDurxHpOEWLqd/XGns/weUFoGcxw/inG6BzIzOj5/
 08IT2y5VU0OuKWE0iy/vUe+y0V5j1aCf91Ju/g/XNpWNfwdp+qAWwCKmDWY1V+BoXLB3
 oQeOH5S4Ym54oHnDWJqntE6mTWR1aLnz/ODQV79oMsCezi4G7qS/Mjg1hEtxhhec84n0
 QitQ==
X-Gm-Message-State: AOAM530QAkt7AQrnX/f1Jr3I9Y+f82y7NNyDq/naPDpmFPVOk1P/CzUD
 hokWC56fKwp28/qcxPpNLcrmzQ==
X-Received: by 2002:a17:902:9883:: with SMTP id
 s3mr4621699plp.271.1596661893664; 
 Wed, 05 Aug 2020 14:11:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id np4sm4355712pjb.4.2020.08.05.14.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 14:11:32 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Delete unused ARM_FEATURE_CRC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200805210848.6688-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc82d899-fe0a-87f1-8061-d1265d919873@linaro.org>
Date: Wed, 5 Aug 2020 14:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805210848.6688-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: jAmbSExb2C6p

On 8/5/20 2:08 PM, Peter Maydell wrote:
> In commit 962fcbf2efe57231a9f5df we converted the uses of the
> ARM_FEATURE_CRC bit to use the aa32_crc32 isar_feature test
> instead. However we forgot to remove the now-unused definition
> of the feature name in the enum. Delete it now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
