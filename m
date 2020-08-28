Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1749150lfc;
        Fri, 28 Aug 2020 13:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvwqCxMTXWSRRf9vg1ukZuMzBJ5LqHm+2zmLllhstkD38Ek6XZ+2pKCmYIHCKHimBiU8OA
X-Received: by 2002:a25:4183:: with SMTP id o125mr4860349yba.76.1598645195859;
        Fri, 28 Aug 2020 13:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598645195; cv=none;
        d=google.com; s=arc-20160816;
        b=iPhl058MeZP8OFg0LDMQdsIMARoNJrfrDfiHpDZIGT2+d/8q7vd3B5WBL9MUnAy6Hb
         aHmgXF4qEmweH/hCupHkGroBz17b4PLyHW6eIwI+KBZZiNB/SgmiO5RhhXxtbmYx2bC8
         DPwPwh35vkAQGK/K6lNDbkajeVdoFoYZUUoTERkPmvXLCeJZQZ35+LPDj6fN8W/x0QXZ
         /zJsQO5+UrjuECtEM3njBbz5lw6LgNnoXeE6rM5S4J05/SnBRwSIn83CTY3+Iemt7A9T
         Hv9e03cazn1S9nRN8fFBu07RVUBouLMfranx0ah9rKRsZvjt5oTeXdMf+SnmWA1KOMVQ
         45Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5LGxAUBIe/ldoq1ephnDySUKsX8JZ2P7+aD69ClJqLs=;
        b=Wo8au34bEKCwZIkZxguhAa2pJt/rYULRsACCI9PP90PqSvTcXQYOLdRegHZYDrInmp
         8ezClifgqWa4n7sCPRhFPDKZP2ivUnyANBrzDbwcHCQSNXfcvgFD+9QlDdhHBWFTJBXI
         142eqiFco9E3W+YQsDqX79v3wYZ5WHCUw1Tki5WYIwYZYhDqs9jM5XtbiqwhUhvDAdiB
         9Z5/CfGZTVqcLUlXwhf9qIAJ+Ec3U8MGQUnB3O1v19kkmy3eWh8A8/hDp/mfTmHnjF/g
         KXqAZ+j3a1ZK/ZJtf7hvk9rxVfKM/0TA5vT/3Y1cILJImnSkyNjDu/iVLH8iWpvyWZcO
         wPag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdJMW06B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l188si272354ybf.176.2020.08.28.13.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdJMW06B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBkdv-0006ND-6w
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkdb-00061G-BJ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:06:15 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBkdY-00012U-Km
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:06:15 -0400
Received: by mail-pl1-x641.google.com with SMTP id k13so161153plk.13
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5LGxAUBIe/ldoq1ephnDySUKsX8JZ2P7+aD69ClJqLs=;
 b=OdJMW06BXCzyhhFc1jQUU25UK6B/rf0kDvmyjASa0rKriSgBNB2LlEXC/+Zo/Ilhw2
 EVJl1Du5eqJXfXLcCdWASmrsgRCNguWPg/MawI4wG7NJEuhdJ/o5a2CFEfUYwSHQrquH
 PRnPT/UfGjaKTp9th0HonwIXo0Cy41+r5+2C4GNXWQ1gHcTRdjX2EEGxRF01yjht000r
 yF80ERQYSpXGYqci4N5i125uIX02w0gqLygoyFhYXiNi83gHIqF5K+lVw+WqtUHLo8Q+
 cBK/98aoMXvwdSG56SXT2XeE1c9++qYM01TqhFGULUQbrt5WEBzuzh89h5Be0KyeST6j
 NhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LGxAUBIe/ldoq1ephnDySUKsX8JZ2P7+aD69ClJqLs=;
 b=IFYfctxiH5Rr63rY17xI7dSO3BjwxISuLZk2wvrE9OZDy2Y6nXqaEtf2RqaG0Qt6Ls
 lLRYkJXkv639g1iMfBpQVnqL9dKgNboAYQbldctEm5NBVXn4gNoTOC7tmyg6eFyl7pXJ
 1Ba1khkgTwzjpAZAj9EJb+7dcJMUuygFqEtC1T3Qkm/s1+CasKdAt7G8zpLqxaTnuR/e
 NmxBI7U8bZkThG6k1jZYOGK9uoCpDuWxTntOy5fR9Ho2nWPQlZx2hY795vpAs/jd7s+F
 MJKCG0ZIEWtYP5GiIciJQfZ8OgHXeYOXEksJB7N8XHN7msDfZgJqJFBWHWGHk9EbVxJ/
 gjsA==
X-Gm-Message-State: AOAM531eTNtkG8Fg7cOBj4scI6GQ+8G8NdPcB1JPLxFlbs0uUCSmW0pT
 8Vhi7VZzX1VnYSqca25gyEJSHw==
X-Received: by 2002:a17:90a:34c4:: with SMTP id
 m4mr554648pjf.222.1598645170970; 
 Fri, 28 Aug 2020 13:06:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i20sm232541pfq.204.2020.08.28.13.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:06:10 -0700 (PDT)
Subject: Re: [PATCH v2 23/45] target/arm: Implement FP16 for Neon VADD, VSUB, 
 VABD, VMUL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a90d9b04-ddfd-46c2-6a41-1d654cda2c6e@linaro.org>
Date: Fri, 28 Aug 2020 13:06:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: q+lUY9Os353b

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Implement FP16 support for the Neon insns which use the DO_3S_FP_GVEC
> macro: VADD, VSUB, VABD, VMUL.
> 
> For VABD this requires us to implement a new gvec_fabd_h helper
> using the machinery we have already for the other helpers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  1 +
>  target/arm/vec_helper.c         |  6 ++++++
>  target/arm/translate-neon.c.inc | 36 +++++++++++++++++----------------
>  3 files changed, 26 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
