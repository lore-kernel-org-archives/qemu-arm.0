Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1041474ejb;
        Thu, 23 May 2024 06:01:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr2HyKGic2YPK4XwTsFKbpruccXzLNp/wMZJlxkst/VD9VJKTAF1zWywrEZt+M1W+LMNaHLOOq0fQVnkUbfzaQaOrPMFWi
X-Google-Smtp-Source: AGHT+IE1A0AJulp1UJbRl6AGm6bgnYUQ+c1VuVyGcX/HoMgqZlyBqyfdZBDAP9HXZq7VJDCEyly3
X-Received: by 2002:a6b:6504:0:b0:7e1:80f7:fe0 with SMTP id ca18e2360f4ac-7e36f468c87mr529594639f.11.1716469279051;
        Thu, 23 May 2024 06:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716469279; cv=none;
        d=google.com; s=arc-20160816;
        b=GTwoEtQS5RpS8bPHBwlybs0gPkPmu1wx/XS6UrSL/SEbVa7P3yNV2ls7tBwt0fXYVz
         EPSpYHbWIXBPS+Xw0a51S6QOadI0Qxe9eFilfmnMtRMvJuvAAyNSZ/SRqRvl82QVQjLk
         GXMwcjwvH8dwT6MQdZBN9lAVx6DC9rpOIXbklpM9z2SPd2J1G5hpySSLvUStggT0ezfI
         PMtZlxQTxTvfFWNA12XlYuqq6Y2oRiZOgjYXBE+SEL82/iKye6EP0qIPElK6jBOogVv/
         WAmjJ0Aam1dnbbbhKMoeEbTVDGXW6fjtNVbLpNTBtmsH9PWBbUVzoUXkAsKa6/LTJFcN
         VipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CKPv8dnLEr6PEgjxUX69HV4d3UOqhjAtYN3QlN+i9BA=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=nRR6ooslHY7idYxJcL3ZLltCu8W5lMvyqUN9NJ1aZtRbEzPgpX02z04mWeiAdzT8xw
         tZ0IvTzH9mYYcGY6ODn3LZRTA+2VIN8+cKB9S7hcu+Ib0Zh5x+MtzT53JqVN0SfMcD1E
         auFC9VMPpGqhDrI3WdAg0dmzyhzHkTtv7y2/f6pV8HQFCKCTKz78ShLAO3FGH7xRNvcK
         INnZVtsnNNkL3NaMOmA/DxENcTMSHpeUDZTgaJeCqXLxdG+oe9Kc7MUpBdgX9bR1tVdb
         OJDKKdrobPCLFOyhQOrEIBHuOcCC11Pn+pUL4P8ZJXcgLH8UfuC9YrEafl9eWQtGMLid
         /0LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T79XGtn5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-7e217a5ff8fsi607191939f.146.2024.05.23.06.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 06:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T79XGtn5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sA84F-0000mq-TO; Thu, 23 May 2024 09:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA84E-0000mG-43
 for qemu-devel@nongnu.org; Thu, 23 May 2024 09:01:10 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA84B-00059I-Cp
 for qemu-devel@nongnu.org; Thu, 23 May 2024 09:01:09 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-571c2055cb1so3119540a12.1
 for <qemu-devel@nongnu.org>; Thu, 23 May 2024 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716469265; x=1717074065; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CKPv8dnLEr6PEgjxUX69HV4d3UOqhjAtYN3QlN+i9BA=;
 b=T79XGtn5xhqLwkvvQOupeaB+6vlEdDZZr5OfOxXNkSRfKCJy61CGs+ikkHelDr7Wzs
 SWkQTrHFCkLh1lL0zSyz3Ct5UqMLqIUqjGaRoFsasMuBnVIvek3KRahO2iTFC7cjvyOx
 jBW8OiDDEATb1SnuBWs/DBa6yS2A2uwpWMIlVL0G3iO7Zr3aSEOUm9lVhbEfKipdzqtN
 r2WXjAghHm/P9UumotJQsQEEi/yMw1N5VckA8ZPy3O7Yn9WVrPe/BpPrpr5pmnttFaN4
 xm77oSeWQ/niiUVF0BqRxvc993JCoq/QllQmL3yAF/pnuRTU9gwGlWt3B9GZ6toFp6TV
 CfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716469265; x=1717074065;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CKPv8dnLEr6PEgjxUX69HV4d3UOqhjAtYN3QlN+i9BA=;
 b=DIiqvTXm0mpPtDwtJ2YyV2NWqZ+2dpwUGYzNQGea5YsvTilZqbb0nvO6yYWI6KyUH2
 t+XJ+6Ep9ATfS3kfUg9JaLqyC0UrjD1aT7ZIsAzSvE1yqfRvFjo/lle0N+mPQpBGutSa
 P29+iAt24eQdfcXUrdN3frfCXEmTG/LD2VHxvI01fgwjd8675y4qaplL+f1R2j9hPoXX
 WG9jvhGLi6aKBie85/ZveHyuBuOZfV4dbCCPmpg1JU58O59dF5bXGiPrrajbZ7LPRBtA
 /oRwvrFdAA6F+0kuJEYU+qxqvQjvc5cQuAmcQXrCk7RswGgRvHyKAOmgOJKrNAN1Lh3r
 T/SA==
X-Gm-Message-State: AOJu0Yzf+ilZsvkbqLAsp3QWHMldYDXroWvnSCxDQeWRD13QCvDrv/pn
 FvQoZU49ypztUSisTa5gaMxqcSGyIEEhzw0Tiv/QFo7SG4Zriw6HR3ljSClLGTnCX+iGeCB3Qge
 QFspCaMynYEf2xqjPtdyV76E/SnP8GMC+aSGBdg==
X-Received: by 2002:a50:9557:0:b0:572:3f41:25aa with SMTP id
 4fb4d7f45d1cf-57832a4b1abmr4054635a12.11.1716469265676; Thu, 23 May 2024
 06:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-13-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 14:00:53 +0100
Message-ID: <CAFEAcA_j-iV_r5WA35ULULeqFN99iPJZwrFkYUH7pwCSNsG1fA@mail.gmail.com>
Subject: Re: [PATCH 12/57] target/arm: Convert FMULX to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2o6JHK7N/7Sq

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Convert all forms (scalar, vector, scalar indexed, vector indexed),
> which allows us to remove switch table entries elsewhere.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -671,3 +694,25 @@ INS_general     0 1   00 1110 000 imm:5 0 0011 1 rn:5 rd:5
>  SMOV            0 q:1 00 1110 000 imm:5 0 0101 1 rn:5 rd:5
>  UMOV            0 q:1 00 1110 000 imm:5 0 0111 1 rn:5 rd:5
>  INS_element     0 1   10 1110 000 di:5  0 si:4 1 rn:5 rd:5
> +
> +### Advanced SIMD scalar three same
> +
> +FMULX_s         0101 1110 010 ..... 00011 1 ..... ..... @rrr_h
> +FMULX_s         0101 1110 0.1 ..... 11011 1 ..... ..... @rrr_sd
> +
> +### Advanced SIMD three same
> +
> +FMULX_v         0.00 0111 010 ..... 00011 1 ..... ..... @qrrr_h


Looking more closely, shouldn't this be 1110 in the second nibble, not 0111 ?

> +FMULX_v         0.00 1110 0.1 ..... 11011 1 ..... ..... @qrrr_sd

-- PMM
