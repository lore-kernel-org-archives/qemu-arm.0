Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp686628lfi;
        Tue, 3 Mar 2020 10:38:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vupxxynBihYe/U2a0xA1YHnz+o4uV/M90cpMdvtgUcc3Om2xEUYFzmBQ9/16ihE5p0vitSf
X-Received: by 2002:aed:2519:: with SMTP id v25mr5795881qtc.176.1583260718014;
        Tue, 03 Mar 2020 10:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583260718; cv=none;
        d=google.com; s=arc-20160816;
        b=aKkKfT/SYpJbGXWFQYDjQPKGRcxFqXss39Q66lR+5dr8A6QFVgbAo/NpCARcBinmpz
         8PtDJRiOCiQzn3/kd/pD0jlviUDuXbqbW9BdGrNHs1mOt2Y7DIfILTILf6+HboNtoLq2
         j05pJAfgn+7eM7XFwhG4fbbyMkKZUxOc9djNc9xWwE0urjOy3r31uf0l0l0lB/J7AJKH
         T4/MRsroQjTfpG2aFSQ5y5S/eZqd2ugW5SDA5Ma62QPEohL2k8HmshVCOHS5cyWaNB9A
         aib/FYruaysyHLkA+8aqK4OZ4hdFTsvAVMmp1M6UScInc3c5E019OsJdK6DEQ+dIhBqa
         Ping==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=k+7tOhEXwdjozauRtLq+EcVaLKO1erWvppheX1SzlHM=;
        b=GL/c5zD2rMW8hNEv/ou5FJ6zc3pKqwyeESLR1NlsWk/DIRyItY5LxBhgpe7C60fZfW
         yt///jovSZt3mfPe4VWJaLf6sSO8DVg6UE7IR1Cgc9Nf5CcQg3CDa4ytk1wMeRzkFQ9a
         Sqipga0XC7GgmyUCyhw5eEwhypqGYAU/7Exfvzh5AyVlS8+XoATRBPzSy0Y5SYPoR99t
         GTpT6Rh0kPdjafqVNBXeJpkQ8jIkcxMV0Lv/P91OInausH/Jyqg/ir9LZiYIANuGQ27V
         +iLaKuUKzkNfQzz+sU4+ydol6SjO3l6vIeAfwXhbiOnAoPExBi5l64B460c3smWmGgD7
         Sl/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfeBj9e8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g54si1296804qtb.236.2020.03.03.10.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfeBj9e8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CRB-0001cj-E5
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CR1-0001Y3-Lh
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:38:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CR0-0002l2-HO
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:38:27 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CR0-0002km-9W
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:38:26 -0500
Received: by mail-pf1-x443.google.com with SMTP id j9so1899483pfa.8
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=k+7tOhEXwdjozauRtLq+EcVaLKO1erWvppheX1SzlHM=;
 b=MfeBj9e8VfYJaEHtFu3Ha+EjwE2bDlFu7jip1NyiferRvIVbebthIde7mRaBMJYR4s
 g/rcPOSu3cTuaGNDuWLwCP0OHueMhpIR+TmmxU7x6MAJ/VonAfgFF04T9V7QsWcloYN4
 vcklidFSbeff7YhK06v7qzD9tEGIpFMJG2v8tB6CRyRAI8sgmK51V1FtLsL6h+ToDABZ
 7gFx4/lE9v60WXwx74wzYyWXFXGXIPDyKL5EQM0uw4sNv+uowr9esj7HlyW3TzJNkVM1
 oy5B0XqZRLNCSUsaGmRzkL2n5hmcZuKA+45VCnIMdtrIhykqRIZ8G2lVeCMCT76Y5cTw
 c+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k+7tOhEXwdjozauRtLq+EcVaLKO1erWvppheX1SzlHM=;
 b=G1TV5/QSYbyvfHOH+U23kA62Ka7xk3FB+lWPwj40E54YmzD96PhRUucw0KUH9WU0OF
 AwMnkUP/hVQzL1P4MgurGQlKtddHbMTTA+xsobASbt6SmYd1nA3f1cryq8NzGh4Dy/EJ
 74aOBcCrcxRYUmY4tJFe4G/r7pDeO+NO4I9oItfFnAmDDLuLx0v8X9tTi0wsI4OBpjwo
 H6VujypxDirILxqkPPrOC6sq6ECTuR4e4/wlP1RrrSVXwtEul0UZb+9J/V7C8G0CbPWk
 cZD8gsxAbjjTdRXVp060vbjYAFRWeEoR3KIWmm6ghRtrTYH0cFFW7/DIRaBHXNSni6CQ
 6r6Q==
X-Gm-Message-State: ANhLgQ1Qjdk8/sM1DwgQU0/QHAM6LLPwy8XfOcuxDPEs+4cLpMBTVU+G
 GqKy9oFpojmWba03RQuMj7A6Kiht39g=
X-Received: by 2002:aa7:8545:: with SMTP id y5mr5475285pfn.185.1583260705381; 
 Tue, 03 Mar 2020 10:38:25 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c3sm25518463pfb.85.2020.03.03.10.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:38:24 -0800 (PST)
Subject: Re: [PATCH 4/4] target/arm: Fix some comment typos
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200303174950.3298-1-peter.maydell@linaro.org>
 <20200303174950.3298-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a61e270-7116-eb2e-7dd7-e847f56d9614@linaro.org>
Date: Tue, 3 Mar 2020 10:38:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303174950.3298-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-TUID: mivmb210Oz/B

On 3/3/20 9:49 AM, Peter Maydell wrote:
> Fix a couple of comment typos.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed these while writing the other patches...
> ---
>  target/arm/helper.c    | 2 +-
>  target/arm/translate.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
