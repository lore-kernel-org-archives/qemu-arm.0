Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1542483wrg;
        Sat, 8 Jun 2019 12:28:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrMAedOzLEINb+QAgOXDEJUg/UTZtjgafFDCg1P3VB5EBL+n0oJO5VICo+TojgslE5MTzC
X-Received: by 2002:aed:39e5:: with SMTP id m92mr52588391qte.106.1560022131572;
        Sat, 08 Jun 2019 12:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022131; cv=none;
        d=google.com; s=arc-20160816;
        b=jvnQIld2hAqhiZGsW+03Tb56HfpUKwENk7/V5lULdynqlUaCTxgG3Ho7RouksblZR6
         tU1WkhtS/Wu0oJpBaqBLkmHxzYI/L3rBq48HKiBuTnD3wqcRDS+ACdxeCqXVjF/J9NlS
         7OOjJUDr8sWeqa8wcTEPqUSor8uAQBQKsz+hQJrFxFEi47gQADLj39NpIFmWlMQjVkXn
         rvDwy9INpnI/LcXwWKHKzpt9qfbBxV5cqYNrFUPyDBMb+frfHgvtrx0rws2Z43X8SMS9
         etjDmsLZql1OmjHK5oB101zakDw8gk4IYckbKcT3o2Pd4gEDrZkqH/M4d77cyKLh4FzV
         8PvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Ruf9CgPZZYBGr84Ug2/ZhouPbEySmxEeXN6tIqhZS+w=;
        b=h/aV7Db3W/GyEZ29OZDx6UyrlkxqdhLukaJn3DMlroPYaGoyX8ZB6nir9l6y1R0UD3
         0tT6FVyaI1UR039rQbgWfzHh9/BnfB0VuLMvq6mD1FjLIyRr75X+pvvQSYGArEwSU9fI
         zS3u7gXQBNe64/arWeApN0O22wOBZGCclccJhSBVssGZlgCnAS9SFWCKIjMp8wHwNndh
         QJYznuz9Tl98UEQQ+pCeQPeV0eC6QQD8trePM6GPqMPNViOJzRNJp6Xs0I64Sc5mRYAp
         sDH1g9tcTOBw/08QsUfXA0pptH4Z0dioUeEQryExtLpu4iHzyXmN217rB824SiAwrTok
         n6SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOqRMBqy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si1451959qkf.149.2019.06.08.12.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOqRMBqy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh1H-0006Ge-4A
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37375)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0p-0006G1-It
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0l-0006mw-Qj
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0j-0006lo-Vf
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:18 -0400
Received: by mail-ot1-x341.google.com with SMTP id z24so4930655oto.1
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ruf9CgPZZYBGr84Ug2/ZhouPbEySmxEeXN6tIqhZS+w=;
 b=aOqRMBqyiqwQ6xEiwe1Jq+uN5WsjGgm15e6MSYCnC6LNjz30euvFCPjqwTOAhDrugl
 ZL+wyBkVrGS2ZMWiTsjO1E3aF1Mbss/XTELmEIHlEZuoUbppviHPjx+ppXq1aY7uucN1
 jCiDSBkR0v9cNgYwFJRco0RJNB33Pcl/ywHMvyfm9VDWjK22QZ/eb3a+QsR+oZwUu5th
 +FpaJCqtT7lqNr2e6bat7c978+UQZu1AdYfBVHl5Vm72gKOy+6l8H5oorcE80xqr8urO
 4l3KjS4UNm5Of9e8b4z5i+QLCdFXnHEsVE245EpqXdkw+vNi9voB/JChF+PTtRrh9MHA
 sdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ruf9CgPZZYBGr84Ug2/ZhouPbEySmxEeXN6tIqhZS+w=;
 b=NN37ntPwP/3xOMby2p/Fxi4shxnh4bIhQknQpmWayN8JKZTlkbQqRmJ/acyB1ZsIDV
 zltPndeLeVFzPetk0S9GGOzJsRSSOK0TbGpXfn4T2Aqp6j4Hc1CYK9CF9gJv9/yvQv4R
 5UM4R99hSLo+4rnqk/P9O+GjK4a1Otw9JZU5GidUyg4dyk5olshrAOOMHMSp8PDBGKpo
 E0RXtiWt8yjlEJ2nDbCffjXGySAqFU9b28R/xpsfUw9Kvi+ErsYif4wa4EVg4IzPfVqM
 1l8MtzJI4zzhaalptoJGNMoGC1aqiNEn9E3LnQrq3Z94vsK3js3jnVijcC2XfLymG/jE
 ueSQ==
X-Gm-Message-State: APjAAAU2NbR92eUiqeVBC9APeYgAzCgZ//eiCNq/6KWfXr8neA2ghj4w
 dL5hP2YTP8JtVfg/GPxxxDUGgHnTIPwWKg==
X-Received: by 2002:a9d:4809:: with SMTP id c9mr24563564otf.199.1560022096862; 
 Sat, 08 Jun 2019 12:28:16 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id h12sm2023188oti.71.2019.06.08.12.28.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e9438207-da02-0478-645a-f1d778d35f31@linaro.org>
Date: Sat, 8 Jun 2019 13:29:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 23/42] target/arm: Convert VNMUL to
 decodetree
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
X-TUID: rqEt29xjuAyZ

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VNMUL instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
>  target/arm/translate.c         |  7 +------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 30 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


