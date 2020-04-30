Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2233175lfm;
        Thu, 30 Apr 2020 11:49:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHvDX+AkdXSCjkBk8lRzkhPt3HXhSh+qyqLrnRcNnizAbqMPSMCq9vuV2Ngf0ROnk6VGPw
X-Received: by 2002:a37:b0e:: with SMTP id 14mr4987510qkl.170.1588272543035;
        Thu, 30 Apr 2020 11:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588272543; cv=none;
        d=google.com; s=arc-20160816;
        b=II5FG08Q8IseckYr3ziiS7O6Dnn6sT4BhHAyiBevvSLsQi+HCfGPC9z+hwPEyoeGAG
         yWqzq/VDvg/FmvLHXwsKqKO8JSuY+mIKcE2NPr1RMaViaFq1+fC61IUz656asup5NW2w
         Um9EbgM14gBL4SNqtO+fPbC9LI7QwVfBmgSvWWpeAll3McL+CLBV8WgERzGHVBrlXFja
         gHPQaVs3bzppy6pt3PIMfAHwTVmQxB4QnuMcH8mQ+7Xxbvmzfko2486WTu4+GNyOCQpW
         vXueGyaPJfbiy+NL5twQHagYzZSJO0TbWYx3ATqZ0VA6CqTFqYzIFaZSrUwMJ8zbPy/g
         XpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VcbUvPE2ZRGVxOI9OKFnd+iEsBgZpafMiZ3wjH3hb2M=;
        b=WnUfVrafzMdGFF4F/XnFcWPWxRdbBbrKscaz31BqsDSLEX0YVOc3aV7GP03CRH7IzV
         b5WD/0wGNfT9VohW/QpInPbrXXiG9y5IPPWmCGXHsSLqC4bQvrrzpjg0OvmoTRGXrx2A
         BjowObJVfgL2tdmyw0k/ucN4rU5gKGiGKju2h/ytwVyPOnp6Hb1TUXpNlu3LPKh00C2R
         uwATTZCkRZd9xjXGO03RWBhZPQhXDr+9gZXBsLAs4eM0cQmCAJOCwonUAcWm+AaNm1Oz
         lLV1ijyiojT4luEp2A2dtz3INcRmw3/lV9frYw6/bHQayEXWCqmUJrwkk1SF6EwGFk5q
         WfdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEPYYDwo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id z12si229106qkz.166.2020.04.30.11.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bEPYYDwo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEF3-0003Zn-0k
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE0h-0006Zf-NQ
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:34:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUE0h-0003yh-C0
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:34:11 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUE0g-0003y3-NK
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:34:10 -0400
Received: by mail-pj1-x1044.google.com with SMTP id hi11so1100013pjb.3
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VcbUvPE2ZRGVxOI9OKFnd+iEsBgZpafMiZ3wjH3hb2M=;
 b=bEPYYDwoiVye06OX1TGQatE2OMvpVGSRCJscL7kfn06WEv3cVeJHoq4syk2bn8MLGd
 ioOnCv3ERqh+2BxCJ2GBVk3N1eWvtbHm9nm86aDQVBPNiqchzjKzBIWe03V8Dd7Tepbc
 1Qmc2QuNd6QPM4Qrid4dOFkq5ozrGaNn3Orgt9xTSqF9fiCzabm6Q/z7Wd4NbTVZWQRI
 YPtpgCotmLkpwc+sLJ/+B1JZP4/jWdzLlIUGZxPc8J41MAE4KZrZLecMR0OO07s4vhli
 lSZW0qe6vXVlguLQ2S+TniOnjoN1UXd9Cc+HNMP3ZlI+M4ZhFeJOMDQjLEOjuyNoaebY
 lRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VcbUvPE2ZRGVxOI9OKFnd+iEsBgZpafMiZ3wjH3hb2M=;
 b=orbY+FFHk1fRn0zqoUoCHyigrXTjvyRc7MmCPBXK06SZkx0+DtFdhwu/w+Hf9iX0Et
 YTQkKilp4PIYUd9/GWAONEAeSD7nnBnXaSTR+ezA9430d2hZKzMjbdSvqfBvKhTNGMJf
 5pnZYPhXFmUhUyQ8AkL1RZlrHDehsUJoQNPR2U+IQ9pIIRRVeozLUEmEMrkkBd9riLyW
 8PUInUxZlLoaFUsYbzbCsKC3nLGxntdJylQ/cIl6sarkmNmwq/x8pSMJS2irQtx+wDSW
 +aevAaiWK+FOyBaCKhwdGsNG8erXPh6oSLvWpybE5O9v+G3Etd91SbnGq6VqeoUIgnUs
 1Srg==
X-Gm-Message-State: AGi0PuZXVvev5j2s/fsfqrmtOAwertHfkZ0jz6KNKcRegRW1HNPSne7i
 WMwTyXLIMTGLgfhpwHMUlIZq5SewIhA=
X-Received: by 2002:a17:902:a511:: with SMTP id
 s17mr326117plq.33.1588271648833; 
 Thu, 30 Apr 2020 11:34:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c15sm405544pfo.188.2020.04.30.11.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:34:07 -0700 (PDT)
Subject: Re: [PATCH 04/36] target/arm: Convert VCMLA (vector) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <074d5df9-8373-95a8-10a6-138327dd0ae1@linaro.org>
Date: Thu, 30 Apr 2020 11:34:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: +LgculWH55iI

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the VCMLA (vector) insns in the 3same extension group to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 37 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 11 +---------
>  target/arm/neon-shared.decode   | 11 ++++++++++
>  3 files changed, 49 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
