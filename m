Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1542148wrg;
        Sat, 8 Jun 2019 12:28:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKBiIijkRLqg9wZiWDdI2XXp+aAyh7q06UbuUNzv2iD85X+ko1RheKxG6RQ+tu+Ug0cTqc
X-Received: by 2002:a37:9e4b:: with SMTP id h72mr48439557qke.297.1560022092745;
        Sat, 08 Jun 2019 12:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022092; cv=none;
        d=google.com; s=arc-20160816;
        b=NQyomCWwDGKmGYRM5Crf/utrDNeG+hIpSHS9UYaI/Qc4wmaB+uKLojFmudOM+d246s
         2ZVY26htXwgx8UAvZEnPZXCpWq/J9e7otLGvdUEovNv3Av/nC54WcKx+Xsb3nTPWhUhd
         WqM8tlywWm2jeJ1tvqxlrmxT+DK1UQZ1Z+QjvaF75mlc8RDZCTkc9GFkp3PXvD4+PFii
         Fw9F9mS426KGZpkjpiSC5fNdwu9UDeSqlQL0+SGBDg6EZDuHLfyTHP6sE+DXLVo4KnXx
         sSPYY9gZBVW0gdAwAfM93cYmXb/jTWmcK9E3uDgeDbYMmC3kJ9xMFv50Wx4SPwIBkEGT
         /+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=mTSBuLLkD9ZUETkcyw6UxodPLZ3R6xviQCot0ZhBSBo=;
        b=eQ4ewCGzy4uCMRo+CWl+KjFTUHUHzI6b2T9KmOgYg2SsyCMBSgWITi9GxhD0ZU5O6o
         AmkVDbY6bF3V89n/Xp5XYT5bH/1z1X8rrAgJa81ndHLkaYXhxL4Ub3OQ/L88dLojpkWB
         iYiwHpngBZWsa7GuWZnYeIwhrxpeD8EiuZG/R7Lmp/KayHfTtUQCI6ucLmPxm6gVCswX
         SJU/XfsCs5eqDvoHh2o4HPxl+A3WMPhYZG23x5v8+uGsUGrb5qGR/EFdy+ABcuo277M+
         w959NBDcOIXo8b0X8A+YbsASDU0JLgfgUL8VGvL3x6azMaBW7FBDxD4bofbwIzf5WPXM
         fHcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uNPWE4Pk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28si1520469qtc.320.2019.06.08.12.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uNPWE4Pk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh0e-0005pM-9A
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37195)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0Q-0005n3-H7
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0O-0006TJ-Hh
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:27:58 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44730)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0O-0006Rw-CL
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:27:56 -0400
Received: by mail-ot1-x344.google.com with SMTP id b7so4884603otl.11
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mTSBuLLkD9ZUETkcyw6UxodPLZ3R6xviQCot0ZhBSBo=;
 b=uNPWE4Pk9M7Yh6eiZiOW7FMbF5Hsi8EF9e+pIxhLEV9pThfdlVSOdV1Plxzzk4OkRe
 WRXftRA4kLDJQY446jNLgLV8UNzEsU2cpH8E2C51RyWWZl20vV8NoFoljthE8vYMBjAM
 4be9PNiPNu5gXXYQE9AsbdwBsmM5XnCLCfbqV6vyZddkckUKDpVLts9JxR+qtkmkK5YF
 u7auIuIBkmp4RHOYjCuJymcZ7caXJOanrcg38Qi3JsiD+5SxlbYn3HnKeW/V0l1NkfDO
 AIIntP7CRF4TzJ7+78L1NppU9aU4Jg3PgPF/ChQZIL16NkiCkhrsdjMoyko3KegMQ8q+
 G3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTSBuLLkD9ZUETkcyw6UxodPLZ3R6xviQCot0ZhBSBo=;
 b=La3GVZj7tFV7pjAXOfWdmvTnJA6GWDHzWTvi0KvkQCUj+Ut2+T43yq/4nQ57DYn+Or
 DM6u65c2yGb8MaCfrhInHzz7pftJbDxOOjjjTOtN0/3USYwx9ZBdSAQtD0FwnLtSqB35
 wry/d3SRMZVdM4ZnVo3jh8p4Oe10kHoTCoWIIpnzwJKllNjV9I8XJehHr34QgPFSTAT/
 lPJ3uSYkkuZ98XgIiHl/sQGlJiy0TNsvr65fLSCRu09lmUowflMKAiOD0yPs/Fv5WSB9
 q12WOb4p9Xy9cJGxQgvftqZ4m9lfbypdWFK5QwO8OPnA3ujf+0kmmCqH3rjasLXqxswW
 CXig==
X-Gm-Message-State: APjAAAW2jQ0sIVxN1GurDs5wYjaX0ViRi+54MqIh+qZL5Ws4PdlhIFWE
 Cdi7VBWyB+vpUpbGoAc+fG/emy5d6XV3Aw==
X-Received: by 2002:a9d:27e4:: with SMTP id c91mr21512082otb.360.1560022074116; 
 Sat, 08 Jun 2019 12:27:54 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id q62sm2056850oif.57.2019.06.08.12.27.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:27:53 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <53422629-9764-afc0-7b46-cf69e02884a7@linaro.org>
Date: Sat, 8 Jun 2019 13:25:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 20/42] target/arm: Convert VFP VNMLS to
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
X-TUID: d9O2TrnhQh34

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VFP VNMLS instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 42 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 24 +------------------
>  target/arm/vfp.decode          |  5 ++++
>  3 files changed, 48 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


