Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1281656lfi;
        Sat, 28 Mar 2020 20:57:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs951L8OPEFAk5oa7eKD+OcWgGKmTmkFgf6qfETWvNHdlJ9QrYnbU4i3VWSHsDgQ/eDYTyR
X-Received: by 2002:ae9:d886:: with SMTP id u128mr5794433qkf.240.1585454230374;
        Sat, 28 Mar 2020 20:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585454230; cv=none;
        d=google.com; s=arc-20160816;
        b=D1fp9cgTTh6RKUrq+qkZ0lhqufFQ7PcPpgx93RLfbhGiuY7b5Fy3J5tpJbInDaGLWu
         r7jJwxBOoXIIWwrahZCjvhhmEHGTinxGvkrwdfmeK4QK/EPYYlule4GX3HRtzctCy5Sb
         Pfz24YTKlu1sm1S3jXfOe46zqXfbUZiXIVinZN/t+9yHdrshvNlXLpeOT+k0IPXHZInx
         BEs3lPr4I3UjrvcqbGgzRB4iU8+q3kW1BIsb5RH77YW3E9VKJGC+gGGK1WqLb3IQukCb
         VEW51l1s5nTPYvN1ksIzLRRYRaauJ5bVy0kUywlgxWGVLWDWZ7CKgnXSToZtY7aiLHH1
         vcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YHsKxquyQgTi5vsa/k9/RfFAWWGgIUKBLwSRhGYqLz0=;
        b=FP1yvAPIF+QnGeVG/Q5ppqNSZ8OKxjLRVw2rWL0963jHSoLfuuviHgUiKjUN5uOteC
         V1nazLBnYeSyCYcaaRvS/zBa2SIX7JLMSA0oL8pV8lxLLARwu/EeG28cDhuYFRIU19D2
         /ftIKF8pAHVpCppoBHb3wuAfyDl2EC5AfVt9VcOPP2g5JAVtKTQnDM8lguAYpyEk7fR+
         EeVBSva+HK/pmgFm3DqeaiKWBgC1QLPGC0zyjFoWv095OXH3NufODj7di8M1TlZnm/kH
         olTfT/9FuBVZ1lya4miXjJfdI2/HRiTW4PVJZ3zCUX/cjOOKBl1R5A2y6PzX++5UY19j
         pkzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3CnWOAr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si6290261qkn.374.2020.03.28.20.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Mar 2020 20:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3CnWOAr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIP4P-00014P-RG
	for alex.bennee@linaro.org; Sat, 28 Mar 2020 23:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jIP4I-00013n-1Z
 for qemu-arm@nongnu.org; Sat, 28 Mar 2020 23:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jIP4G-0002Ti-Ul
 for qemu-arm@nongnu.org; Sat, 28 Mar 2020 23:57:01 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jIP4G-0002SA-Lj
 for qemu-arm@nongnu.org; Sat, 28 Mar 2020 23:57:00 -0400
Received: by mail-pl1-x642.google.com with SMTP id v23so5231125ply.10
 for <qemu-arm@nongnu.org>; Sat, 28 Mar 2020 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YHsKxquyQgTi5vsa/k9/RfFAWWGgIUKBLwSRhGYqLz0=;
 b=b3CnWOArP8obvNxMrrZZhQfvqDOdHX7aeG/ew4N4NNP5FeGcJHlVCCJRBq5xh1oh3i
 TlfUXHnY2fLXiPm90gXIZJSQgj4//NgcSbYom+aHkY8RPwEUh+1BbIc/3ysjYUaLMRY6
 +j1FVXpDtjouM7cgF2sCtvzkrJIgGYc6wU4UqnKrGohtkGM4cwPP3jq5tlXJz07PmtzL
 PGRV4TygBioA5yqABXUtesJHBBdBFcuJYsdXz7sN7NjQzLqBY9yTbO+BataFxDvMHwgh
 C3XqEyysJr6RmWH6qOY40ZhV62Qy25OvsYyqnvjDTxYxeJ9FOOmmw2mu419WRP6gTcJo
 bWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YHsKxquyQgTi5vsa/k9/RfFAWWGgIUKBLwSRhGYqLz0=;
 b=kiuhfTo8EISlLe7J5BRGvfoL19zh4FU1d2d2JffCOrmKRc0mHgQESWJpjoHWKWRXhR
 UdncRBB0Aib6BFSvK4NP/TTYgmg/d1ognu9fnafngkWa7LxoztH4spfsOfh7+55zPRGD
 29+Q9bnFE0mH3HnyBeQSK92VHcTYTKFVp6rcSc78gH337vg6RRx8QmY5tWo52d0tSmHE
 QGJ1COpwupc3HTopfarUEilwV6onavtq/BA52gjd0aTNkdz3T+8a33JMTv1sLUvWn9/e
 CnsvHVpm1pg/OxeS6Fzkw4UdfbJ7z/rPUs+eNzgx29ZfdG6UU+9boCAJ0cnB7F8LUROu
 f4+Q==
X-Gm-Message-State: ANhLgQ01qW7JadHRCKa/OxrzrOoVHx/zdCsrQhji62FAidFLGGK1capQ
 Uo+A7v/TA1X/1WioBQJodtHkTQ==
X-Received: by 2002:a17:90a:aa88:: with SMTP id
 l8mr8694395pjq.10.1585454219032; 
 Sat, 28 Mar 2020 20:56:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id g14sm7098378pfb.131.2020.03.28.20.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Mar 2020 20:56:58 -0700 (PDT)
Subject: Re: [PATCH] target/arm: fix incorrect current EL bug in aarch32
 exception emulation
To: Changbin Du <changbin.du@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200328140232.17278-1-changbin.du@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d466db0-9949-6c0c-969e-1b70a8cc7435@linaro.org>
Date: Sat, 28 Mar 2020 20:56:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328140232.17278-1-changbin.du@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJRGt40/vqvD

On 3/28/20 7:02 AM, Changbin Du wrote:
> The arm_current_el() should be invoked after mode switching. Otherwise, we
> get a wrong current EL value, since current EL is also determined by
> current mode.
> 
> Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
