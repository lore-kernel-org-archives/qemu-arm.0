Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5616179lfa;
        Wed, 9 Jun 2021 11:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0+o2RZCKfS6LHG0VSm6EgsoUSiVxPAOx3BFn2/S80nYHOpE/qdOv4Kh4Rc8cLL/I5Ooup
X-Received: by 2002:adf:b648:: with SMTP id i8mr1017939wre.425.1623261651052;
        Wed, 09 Jun 2021 11:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623261651; cv=none;
        d=google.com; s=arc-20160816;
        b=piuCB1hjEM+bgJ82knXkn32eEj48c1YYaiftHUzQPbKPfcLBaHW5xYm4lN/NmBWh3C
         /GVuvGCcpSTzXprdmx2Ay5moU52Kt282cTpvgoh3JUtlLVt8dXzNmjmZWQHZxumjojzy
         wuXWWLW+1zD+kQv5LEPAQzChdEHoYs/BKu3Bu9P3iQg0PgTaUFeiC1bf8YtRaBgU1WGV
         feTvIvndMd0ph3SmBgGbweth7w4etx57TPXNjRQECyw76D8bozXgu0UdiefbBkcFzi8+
         WL1wokEQE4zhDevWBSmUxI0klHBzVc2ztJZT67VB8YUhhbfvfbg5ozLClifZ8gaN+Rhm
         Y3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uCbrR/ollNlfmhc0ftwjGOB1gvgU0p7m1+gu09M1djE=;
        b=wvMoHGJGPTFA4tY2tlmGPH+ttC+M10tth7c0uIOqlh+v2Iy6J/03vuRoRFTII6ThE0
         9H7FkD5RKrwCrQRTAn2mThPB1Na/U9G1jLPzoEUvdWgEW8bIfHRseAcLodKs4MtaBG8O
         YYIOG5t3uNnehYLPUPQTCzvuLzkIxJJ7HZtyy9SRZnAPbXuRcUsRNqwFXMDyezu+K2pW
         cHkP6phpjleQfxonl92uguW+/Kxx0cJzjX9zZxWtUpejx3/6PGTudcqsKeYpEKC7Qdv5
         KZO2n3WmdGsPQyX9BGpd+Tw9cw0Gvr7qMr3myF+HzbDvHgnft5i2I04hb+GWRIr/13XU
         /RoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LS5EOPKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si478839wrs.172.2021.06.09.11.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 11:00:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LS5EOPKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr2VW-000670-5m
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 14:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2VN-00066g-MP
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:00:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2VM-00051E-48
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 14:00:41 -0400
Received: by mail-pj1-x1033.google.com with SMTP id g4so1898822pjk.0
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uCbrR/ollNlfmhc0ftwjGOB1gvgU0p7m1+gu09M1djE=;
 b=LS5EOPKFXxprtFGoWmswhrB6saiLYivb1KQ3lvPya+T21V5rTjcFS6kYwh3clNQ+Bz
 3HGmP9BsJ5E2TR505OCyuyxxjJbA4fwtUwbdu2DQegIyajEzRYTbfQd3zyRhSW8M9WI7
 XpqzTUNrazoYWbEvM6LEVW/eboRTpOTkLXdTspc6hV6IzobvULhed80w97oAlua67fep
 j4KacIvvcvwzBlcOgRkVXLK11Nlvd5Qp2qlTjZXLsDub0vngNwjs8kkit2mJkFUb5/xL
 0WIiMUHoByUGcj5lzo5y9Yd8tX6/q9l2jjowwlotawSwD9taf5LMvi76TpDzKoVs+W0F
 hfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uCbrR/ollNlfmhc0ftwjGOB1gvgU0p7m1+gu09M1djE=;
 b=rIVHTOHHn8SVg96sckr+VMRdhB7zW3qFKggrYHsnIiFVK+WMAguOUBlI/4meIP0Xes
 cnhH1QbyKhx93HQA0UYwKlbQvGcVkHysLsRf/IhiIIlIKifXeGWGPGAKHiCglcie2gxF
 rFuafqUI4pRGo7Jk/EOo5P+h69W1Or1Cae1oSFyyrZe5hoZoPQUW8LrNE77JNDho4zpz
 /Lz8xHHYF3N0XlCjlyks1Pz1Qvi1A96xhTuBkRRvFzlpYGG+RTBcUD5oqCLjXoEmmPku
 I7uD+w/ilV5jlF7vdnpTarhgf5FDPCI2DizYO/praZLAniX9j/7rtMbftEKegzuyYoMX
 qEKQ==
X-Gm-Message-State: AOAM530Ym2H7nHxI7Ff5hZYbVOP3sf5nX6nXUxBOq+V4TqlD853kiSis
 Gb/1vUOlrJW9OpnU/j668dkf7MqlnHrlfw==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id
 gt18mr12049781pjb.139.1623261638696; 
 Wed, 09 Jun 2021 11:00:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 b14sm399594pgl.52.2021.06.09.11.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:00:38 -0700 (PDT)
Subject: Re: [PATCH 34/55] target/arm: Implement MVE VSUB, VMUL (scalar)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ccc7ff2-be93-5a1b-274e-8015d1f6124c@linaro.org>
Date: Wed, 9 Jun 2021 11:00:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 8cSCD6CQBMXc

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the scalar forms of the MVE VSUB and VMUL insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 2 ++
>   target/arm/mve_helper.c    | 2 ++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
