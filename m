Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2263201lff;
        Mon, 14 Jun 2021 12:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/k1o5Mad4C6Oo/BywZuAsueDi5hBGj88AjI0Z/GtKip8JJcCE8v64cU80c2ih86zz7UcJ
X-Received: by 2002:a1c:282:: with SMTP id 124mr832669wmc.82.1623699729230;
        Mon, 14 Jun 2021 12:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623699729; cv=none;
        d=google.com; s=arc-20160816;
        b=j55CUGJGKeOwncXRJ6sogFgW5ucoI3TodRxKjJd/DRJvxgTtPLsteluz2ywcpF+Yve
         GiT/PElbRQK2JIIguKwDsOAVV4mtj8KfwyStI6/vwjbaX844iX1hGk5cYmo/Sy8Q8Im+
         ziM5CmYvKcVrpO0oxpe5olalnwVlRC/IRdYg4pdxev9DXLX5lNU+KUUP9b0ywfHTUrGH
         /2uFyfjfkjpoFoPMv3rixfYXVdBeFGs5UYH7Ht5wY3KmIAh/jENrU/5NmjZaxCI32GaO
         3YRVsm+QprGmNzCvkpx5YZEs4ekm/pU+8OT2Sh/tjuA/BFaIjl9gFToHbFXaZRD1AGoV
         v6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nlEDPKKPnqNmWmp71TyymOVGqwxHdrV6AwXYAG7oLFE=;
        b=h8pmx+Wt1LQHZMTz7af3IId6xxYc5152O5s9Wn99fVG/fZuLtFUdweQx83Lnrt6yyg
         +rVFYfWHXDCMrJC0GRXB5H/ALFJpdd4EjPf3bt2gBY5sC8/5/ZmUzM1EmUxeNEqUpO1W
         htB1eVWxnhrAByY/NVfufZTyssNMW3sCk/7UHhqiwdBm+eBczwmu8UhuHTjjkddqX8Qk
         gPZqLCJ8Sk3C0Brsoq3KDPyPzR6nohyUlcoS+/N+b/m5W/i6RusdSB/GE8H6QiQ2cr6h
         E/5VjMzOEVJYaeYJf3KC0YUqu4XSVEumXzNuT6rSKCSRXdQxXMMWnx+jtneQH6HRXkFh
         BTRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5cpxUnA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si9563092wrf.236.2021.06.14.12.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5cpxUnA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssTI-0004UI-Da
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssT9-0004Ty-On
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:41:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssT7-0002LL-0W
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 15:41:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so236652pjn.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nlEDPKKPnqNmWmp71TyymOVGqwxHdrV6AwXYAG7oLFE=;
 b=l5cpxUnAAzt6oZ2UPD3ZxTP93Al4u03gFLZC2IUbSouzCFiSCErEJtvpsu9xPAHNV7
 dkQjs7VCjDzWhDX9LbR05GgFyMjcGAYY7zklXy1/aWwvRcIlCAAROgvUZtnPWhd5NMjO
 U46VgwjoMS86LKq/NQkfkzD/s5rLh7W3IEVJRxgtj6TYgMWFTG+4dRkDFRNdpMQlLzxF
 +PHo9BwD6lWEotvG2OeLqqia6TvOKzi5XpC+jYxyLva0F5qOTvGjM7zPbUHB7rv2ZXS5
 ltT4yjPQi/eevgVJmSWedFLe/HYm6uxG9FryohDK4tgmiXDyCgPBxvisTzXCb57MOMIH
 LH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nlEDPKKPnqNmWmp71TyymOVGqwxHdrV6AwXYAG7oLFE=;
 b=J9xikiSAhTG1XwLdRSvBa70qX5SHmyd37WtoQvI3BIjMpUT8g+padATkfemiZg71SH
 5fItXJ9pglDrA5X/LTMskuwsUHJT/J/l52V2rhZ7D0l3eVswSmbiThueMItduyxnlNVi
 K1pUzIuYQqh3CgCx/kGtscAAlwJYiUqD+9Q/WRn+sGIB5qSt3+lX/IUxpqPzhGOYAAuR
 d2mDv4ozbbu3dG2wFskpjHqIyOkAlDWfpitGXG36AWRPCRAqD+zifzrxuqDuY1Qd23Sb
 wqfAlHHL/KX730wXU97dZsBimTdwhTyHGTHIyv2tnECnlZhSuIphLRzAvLIqbVD70P1C
 fbXg==
X-Gm-Message-State: AOAM530w5LI4wqf0tugTPIddVT0qmnWOeXqX74QHqcvVMG95hvAvlUZm
 gmLNZwWJjjK2JI0nc3eqnJH5+Q==
X-Received: by 2002:a17:90b:d98:: with SMTP id
 bg24mr20092424pjb.41.1623699715735; 
 Mon, 14 Jun 2021 12:41:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 nn6sm12495338pjb.57.2021.06.14.12.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:41:55 -0700 (PDT)
Subject: Re: [PATCH v2 13/57] target/arm: Move expand_pred_b() data to
 translate.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4153f1d7-2bbe-78f2-04c6-14c83a5dd155@linaro.org>
Date: Mon, 14 Jun 2021 12:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
X-TUID: K0Q4zJeCK21d

On 6/14/21 8:09 AM, Peter Maydell wrote:
> For MVE, we want to re-use the large data table from expand_pred_b().
> Move the data table to translate.c so it is no longer in an SVE

vec_helper.c not translate.c.

> specific source file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/vec_internal.h |   3 ++
>   target/arm/sve_helper.c   | 103 ++------------------------------------
>   target/arm/vec_helper.c   | 102 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 109 insertions(+), 99 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
