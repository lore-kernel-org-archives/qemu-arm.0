Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp783610wrs;
        Fri, 23 Aug 2019 09:24:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtuGp+ReNU+1/CeR1hqlgM3eBjs16iOoxSnyIen7xXq9Nmd7PFxrb5XNvNEkj4pD5GWJhl
X-Received: by 2002:a17:906:c2c9:: with SMTP id ch9mr5126736ejb.167.1566577467873;
        Fri, 23 Aug 2019 09:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566577467; cv=none;
        d=google.com; s=arc-20160816;
        b=bG+ys+tpFU5yPxlrznpoqlItwqDeqeWm+aFe6wI4ZGpxuZXM7o2MLNU4HXkb8bxOUc
         dd0jQ3UwdD6mp7uLNVZVbfsNj4R6+/rCZEvI5ydyOmoWQ2ZNtqJchd+lp/3rduVIHdRr
         DxDYt7tF7nl/fHEx2HdwaYUC9evMsc0mZq/h/M9vpoGqeEw8/eeK7cOHtpYkRRBcXUdP
         x2LKCusR6rVIIr8ZbXFZQE51n6Vsgz1QETu+VA8JP6R973PuUAprIAJG4xhBCOXVyEoF
         ZnSMLq2dLQES+nUIEPtuUp6qdqcwV13VGe4lqV4wgGW7I0GbLW7CYMs5MUIpHrVIufc1
         8q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=l32KsYCTK7OT6MliknFHrDHpd8O4OI/S2wX0MFNBUPk=;
        b=0PoxU+CHLvsSSGLB/muj8oLk3fqJw05+mpApkqV85FkROsxPJOft5xTmxumg/6MWt9
         6TlHDXbFADukJjbvzIYSXBKZ3Jo9Gf9ycZzc02Rsr2VF91D3NnDdGJ+F6yzszRg7Qfo+
         51iAK1UA95Uc/tBsITCXZ/ALkc99bC0Rpl16l7+9HTRirl1SrI7T6hKh6IugME8G8vkv
         Lb8Nch43qWU/ufaUMtMoCAEtinhBK8kOokcRL6DS16bhdYmFL8aSLyiTGTEdzU2oQ0zJ
         RgHrSdHSIVbWsNWJF7RIfJjdgJEQFUly19+7rstV9oBzJOuc2rKTIFHwspAnn41SKj9i
         Bs4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YsdgFsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si1660577eji.260.2019.08.23.09.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YsdgFsPA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1CMU-00062M-Kh
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 12:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CMG-00060U-Im
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CMF-0003O9-Hj
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:24:12 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46327)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1CMF-0003NH-BT
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:24:11 -0400
Received: by mail-pf1-x444.google.com with SMTP id q139so6746483pfc.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l32KsYCTK7OT6MliknFHrDHpd8O4OI/S2wX0MFNBUPk=;
 b=YsdgFsPAYjJlZsgydT3yIu1TFjrYprsxPBuF4K1DwhsvY27FsKOfmo+b0LENs9O3d4
 EZbjTvXXagu0Gtq6znjL1lvoeoL3kaSqX691d02hJ2zuqGm/eY969gY5K1a38pOwuepL
 Ndo4F3u3WHZdOr0EvTyEx3IAmUUxOJQbHe6kty73G/Sb4GCCB44myrZQPp1tci6RbDCu
 4yOWIeNLvNNt0MPtx5k0Dr87/BkN3zUmy1U78scM+p7rYSIbkskQrwcRwIKLkOai/38S
 5hAyhtiVQ/Kk1ZKKTlBV5Jy1pUBvgxdv4SwqpGOMZ333F6TXIIqaQxGkLL6G8uaTPiKT
 od4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l32KsYCTK7OT6MliknFHrDHpd8O4OI/S2wX0MFNBUPk=;
 b=h1xRJ6KehQKmQ41kcecSPX3IFzyw36BT45TnoEo1G1nETxo1ZIDku9YgT8FTGIQxW7
 aFOYISZ6sORQAL/CCjuxUW4zjVNyB6a3yCeozherqhsuaDuHpSuOaesjYDXzagIllPsS
 BbHyzypCHE3WDTUMIUCLXhPKyJrLSF+Y+lx10HwDxmCWnYHV4hWpjkIFureQHu1V+P9H
 cTz+DF2Wl4vG/VNA42qhOT/j/QRrq29uDnf1BE/a7C/xytAU0LUx8duLzNai4MT4KwKt
 c/5c1Ctn2LfwmIWpTVzru0VX1yin91EHfcSNrjzRec6SO/MWDejitf+ImaBbdgDRLfUd
 LbOA==
X-Gm-Message-State: APjAAAWAia6cSkwGiceka8lQLaiesWUtQGq/ZQX9Mwik9J+b1yfppmnR
 qN1Qq0qxIz/XgkGX4tokU0CvRNpJPVk=
X-Received: by 2002:a65:6259:: with SMTP id q25mr4797652pgv.145.1566577449727; 
 Fri, 23 Aug 2019 09:24:09 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x1sm3229097pfj.182.2019.08.23.09.24.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 09:24:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-21-richard.henderson@linaro.org>
 <CAFEAcA85Ojy2u_G6frO_KL-kmTVCfpcOxsW5CCuKr=eKPcm+KQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1766ac0b-5bc5-d01e-7314-9366d2238292@linaro.org>
Date: Fri, 23 Aug 2019 09:24:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA85Ojy2u_G6frO_KL-kmTVCfpcOxsW5CCuKr=eKPcm+KQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH v2 20/68] target/arm: Convert load/store
 (register, immediate, literal)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0oHOsozEcLit

On 8/23/19 7:54 AM, Peter Maydell wrote:
> On Mon, 19 Aug 2019 at 22:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 797 ++++++++++++++++++-----------------------
>>  target/arm/a32.decode  | 120 +++++++
>>  target/arm/t32.decode  | 141 ++++++++
>>  3 files changed, 615 insertions(+), 443 deletions(-)
> 
> This one is brutal to review. I got through review of all the
> decode file patterns but got bogged down when I started looking
> at the .c file changes... I might come back to it alter.

I'm not sure how to make it any easier.

In the old code, we pass around insn and extract bits where needed, including
subroutines.  In the new code we pass around a structure that has the bits
extracted.  I don't see how to make intermediate steps.

It might be easier to review the new code from first principles, since that's
pretty much how I wrote it.

Unless you have a better suggestion?


r~
