Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1542160wrg;
        Sat, 8 Jun 2019 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVpjANzv8b6EqhSObbXVKJTGdeaXifxvpNk3lkX4OT4bTqPmirvlKYgMK4P0XkafEHazlP
X-Received: by 2002:ac8:28e2:: with SMTP id j31mr12746689qtj.274.1560022094185;
        Sat, 08 Jun 2019 12:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022094; cv=none;
        d=google.com; s=arc-20160816;
        b=SxEjMTHkOH39DcjPIkGhGNsHV3N6z0Wi96KtOfqGPBGZY+9BBh6Xehl2kq/q+dOuas
         5XuZAx8k0JDErtq7Iqo+6rCPZLVsbQZMlMaeXBBMsNzfpsL3P6magq3dKbiwpMKACQ6E
         zK6s0ukAVq36vr8YQOZ65MMO6pks5VVq2nPcRjChp77EgeYsi2JM5MKXY88PefeG3c3N
         QEb8o+bN9MjbSIHWPzPTfzSGv6vGyAX34UTwiN2wCHbXquImDGVsU9q6dBMy0JW5cTJz
         ayr7eC5fOlDPJHb8aqXyhuepYIHqGX6e0UV1sHpUQNOoG6oEKoMRNdsyTsj5TQYZVfM+
         ++ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=AqWTO84CoZZqQVo9Gojt18pAYy8RmxrkX+dffa758ww=;
        b=ogi0nvVGHieI+VzFnLrv7J9XtPJ5KVSA2DD/QkRhBR+o/5AS+lOiz1nZ2pzlLrm7EO
         gz5cvcrCfBUJBeUFk/jVCnTUIkCFXoy94TuMTXlpb/jb3tACS46gnZonqhXW5Hg/rm6l
         isT4juQnsWdqxZDmMAvjmy3mXkB4RDTY1tWacNWqJRIdENHzZgOWAHc90lGFfxXBl/hu
         JacviKH0He0B31/hGC7I5a7uV3ljoVBUeYbYks+4Oe2Dzkp+811VcmvHU42Y0Pv9teuK
         TpoJ0QrYJNwiW5iZsWVYHg1SzBFRRkxWnp0FEaljGIO1qMHJR2mLjQQrdFwMGp8Fgt8e
         auvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MdGMpXbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w57si4073200qtj.259.2019.06.08.12.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MdGMpXbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh0f-0005y5-OR
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37247)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0V-0005sG-Pf
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0V-0006c8-11
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:03 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0U-0006bM-S2
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:28:02 -0400
Received: by mail-oi1-x242.google.com with SMTP id u64so3728304oib.1
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AqWTO84CoZZqQVo9Gojt18pAYy8RmxrkX+dffa758ww=;
 b=MdGMpXbjGasSHbUx2av+qS5L6S1490xPlmwyURp1VLqW2LGEEFKwifmHBIJKB8b7bc
 LANDY7GSdzlQiOC99rTxfXxkTEbhXUm6moc8cG7+vKFV1RCsdGd2vwt5vNi2u/6bNpuf
 hh4FnegvAmMttrIo504B0bVXoJX9uzauPSlUmxbJWs3TtCi17pHA9wyKZxnu3jKqjZdV
 vxxdrFibgsSo4b6YhLlALSfRrv668xbt+HsCfVCuhsPIWwKOmu+wmHcv9krXFGnL+lVD
 NGnlIMBrPKZmeoPI6rLp467QXZX79y/P/kRdDsnTlj2aALfrLYLNylbwB8n1XjaIzyJY
 IAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AqWTO84CoZZqQVo9Gojt18pAYy8RmxrkX+dffa758ww=;
 b=Qtf3H7VQ+KLxc4u3Tyc3OpR9Ar5EYW0Jp9AD/LNj19VNaVtNf9Ten6LC06bt8NEuSW
 cXnH4/MZ1jDWpJlPgn1I+4PLCWYXLiVJ50RxI6A5FO3V5q2LICJTIP6Fr2FSSWBp5/9E
 0LY2aDrhmi8oiBFaoCqgEiDuM3FsMtNskU9EL+fGBApLQ3oOlXmpuLvjkpChi1H2WFzg
 +WDybwHnghBoHAj0PtIcD/+wXGn1nzGGFu3cuoMQJRqW+imFC5MkK/0mx1W7AocbXJ14
 mg9VpEU05A6xXhZJQT3JbubF3BJRYbWUYtYDdB9Mb+DUcCDVY6oTIYuH3jvKe5DNu2U+
 1akg==
X-Gm-Message-State: APjAAAUkcBm+hbuuuNw1+w5Ujcq3MWZY/pzD3p3Tgtisti1htCbjRW0a
 sFB/1zKd79GVRrt4PNbvZP1sqA==
X-Received: by 2002:aca:bd89:: with SMTP id n131mr7683054oif.91.1560022081441; 
 Sat, 08 Jun 2019 12:28:01 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id 3sm2123833otl.42.2019.06.08.12.27.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4d24eff9-dfaa-ccca-9fc1-e324b73f1133@linaro.org>
Date: Sat, 8 Jun 2019 13:26:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 21/42] target/arm: Convert VFP VNMLA to
 decodetree
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
X-TUID: L8vmBaqFdVkJ

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP VNMLA instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 19 +------------------
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


