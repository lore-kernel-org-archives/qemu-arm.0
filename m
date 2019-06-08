Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1542439wrg;
        Sat, 8 Jun 2019 12:28:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzehWln6OJVKmSK0LGEsbbfquimFO/CDMVtZxsGuMeeuwD6YtiIUK3cII42VKIEZBt3FVy5
X-Received: by 2002:a37:4f51:: with SMTP id d78mr49837885qkb.253.1560022128051;
        Sat, 08 Jun 2019 12:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022128; cv=none;
        d=google.com; s=arc-20160816;
        b=JwOAZlMZV1iZjWv6Wsy+7+prLry2QAZuiBSwrd7kGv22QBJ2Zrfdnh3dj58CMvdFjE
         U/WWwLoDJLtsznlhtMjvJnwYwRAStToCkHHt9JqgJO7nnUc0QzZMGJAydmj6jVAmVXlw
         aGf5WBQjedjG6ERJepwai7sJuSftU1N9iHl4uMfqCd3BAg2p/aCgDAKzwEtyjl7REBn4
         cWjvSB41h3HATidtYUhst9b+6osjyvxjjH2Jth0bBYqlKex38rZeKMifAImTaPqsdVsr
         AOrDJNnGEHsH2q1E1V+WJGiMDigvztpjgSqth2NAgp7K3ezpf/zdurAM1XbtbBmpmB+D
         k2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=sEWy4COw99n712ZJ7B/Et7osu3nKhiB/4wnnmeFoF0U=;
        b=T890jqilnh8bTcVJsq1Ha73wcCSQTkbXp7l5L0/w1rZvS9D4UN6v8w9J3/Wuy1uMRe
         2mEINPhFq+TRT5kjDCHg+CJawTcRdwbYL61tOgsQERDFNioBEuFLPeLWkdCDkqnPhBPn
         KleKDPkR9Jjc92D0t77gEJ2Uni/dCdrrCubml6kzoy5msO4yhg0caWrpsMbCYLqQRmyv
         5FdNkbjSic5zK3rA1yU1MQtKsPasjwJ2lXeMVzhTIYA9rb2ZG4pc0gZa+SejJ4OmIiIz
         k9NxhJ1bZ04cjYYqvFW+7LiETWmdyJ7bkVZOPCPMqvmu8RhgBfVUTuNQIRqYIkcLLiDq
         MNMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=li+2JogW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si4000054qtb.21.2019.06.08.12.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=li+2JogW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh1D-0006J4-IU
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37419)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0u-0006H1-Tj
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0t-0006sr-Vp
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:28 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33697)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0s-0006qq-MZ
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:27 -0400
Received: by mail-ot1-x344.google.com with SMTP id p4so1706012oti.0
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sEWy4COw99n712ZJ7B/Et7osu3nKhiB/4wnnmeFoF0U=;
 b=li+2JogW5zqYiub4oPSZy1MiJ1TrmV6tBNrUzltsPE8lqag33NyGH9NTkMxWkwMy7D
 EiTCQUPuoC+dvWg/MbfqSlUl9T7x5/ZDLx15Of9sJ8TWtyJ3CQkBotAOKbY8HbTR5cqO
 fruut5SOnQC12JENjvluAqYTW7Crp9rM5OEtZZvYhtySLxqddPz+Y/QAn4ts9lPiBOSI
 MXsMXFqJlfy1LE0yyVKZ9LH5BVZHqoP9P+vA1/IySWnxyAwEBuU2BSbZ8HjqFDdlIvRM
 sJcGoClYGTpEfi+o9oBjqmNksWidYO0GLxKiIdJbuBRQmOej3nV+H29VcQ59SWFWzmj6
 Dd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sEWy4COw99n712ZJ7B/Et7osu3nKhiB/4wnnmeFoF0U=;
 b=Au2GyuIj0ZvekAk9YLfO1kGv1k0Tz68mcpQWTAFMf9y+saqoSgiYfq6zvb/eoPpeDC
 YY7LJ/YjZjb0xA2xNim61rZTx3yi+tQYnmVvmW1pdfRJgFtylj7gyeZ5keBpAj3YClRK
 Jh9QUOKcwO+UuBZzB0+5hjNPEpO4C4Ahkn+31vAFuHlPuDez88I9ofStnUWmPCKWSZxU
 DVfeQYe1ym6lD7kFeMWgDokTG51Ts+5KNQSr5Gxi1B5PXHZQwV43Pq41JS6v9rOPvNwz
 WFm6L20uIIq3R1MM1TkUcBdy1n6jfXUjQfQDuY0EGT1ZuOjkExl8LiYxHTDMqcXebNxf
 xwbA==
X-Gm-Message-State: APjAAAXR7Go43NjjGqOhPE6ruImzIIokV835sf93NAFhc41P3LdrzYd0
 CavBMWAqFRWgGQAlLX1b3bbkBg==
X-Received: by 2002:a05:6830:1597:: with SMTP id
 i23mr18685914otr.281.1560022104175; 
 Sat, 08 Jun 2019 12:28:24 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id v198sm720230oif.0.2019.06.08.12.28.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49572456-073c-392b-ad26-9d87a79056bc@linaro.org>
Date: Sat, 8 Jun 2019 13:29:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 24/42] target/arm: Convert VADD to decodetree
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
X-TUID: 5zcdyRoL1J+u

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VADD instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         |  6 +-----
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


