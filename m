Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1483355lfm;
        Thu, 25 Jun 2020 09:55:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL98nOcst7LAHa1zis02SPrxt7n2deTr0q/6jYelrPn5hLF6p8gKb6yDlYvDFNMhg32lTG
X-Received: by 2002:a25:bf8c:: with SMTP id l12mr57414795ybk.447.1593104110792;
        Thu, 25 Jun 2020 09:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104110; cv=none;
        d=google.com; s=arc-20160816;
        b=sVTSv2ypjaZ/0Bm04gbLDeijd9YIPWQUYrhGGcQEJ/8TlUejBPHQKajyJCBFhl3qv+
         srYZvMkwlF9uenLN2EuDlnxrnalj/xkSJOoRtZCzJ4c09kveZUu/Y9eUKzBnRj/SKJxw
         NgSNs94iBsSLsdz9ASRZp/9x7vhS9BEP7SDLpPhOJSChHJ3+fsCkbl5iEx+lREf4kDH7
         YQBl2Vs5VVSL0a/Kc/uhWG9mVA+T8+kud+57j6epCRga3boqFtdeIjP1X/PCFdSPe1cR
         UiFTz0mPLEr0OvFZTVSbj60HvlDslVVfgsG+n01IPy03Mfl9LRxPSGhkjeTU0O+lByvd
         keWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wYC5IYJjTNZDnMPFwIwmpQTVqAlfDoQB96PN41pXC3o=;
        b=SGYLGIxWIkYKDUQILLHUqqBJm3t3efH4Xj3SODaYRJyNQlQJTmwTVw2CmP2DgB1PpF
         FW9OZ8XyQb9JVprzbgv7HWgay7VQYRrsWFaq8LxMz5k/HqYTsTm/o84Jr+qr9UvzS51P
         GPqfftVhny5TRB5wZo7NMz6pZM3d4QmnLJ5z7osMqdIazVw9jcGol13h1kCvDHhExMsr
         6X5ocjubipTlxeGBJ8plnhAaSWus/EqauFUVy71UW93rpnRsNzzCOrxVM9brEWIg8pv8
         hydy3NFcZhks/28nhG6V2QnDNWU1NnMERBJmHDBM2EUszPWqsASbZffOLwt8vUpGFAKY
         oA8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljSt4YTY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d33si7504866ybe.4.2020.06.25.09.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljSt4YTY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joV9a-0006Ik-63
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joV9R-0006HV-6L
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:55:01 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joV9P-0004gS-Hi
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:55:00 -0400
Received: by mail-pf1-x444.google.com with SMTP id d66so3285912pfd.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wYC5IYJjTNZDnMPFwIwmpQTVqAlfDoQB96PN41pXC3o=;
 b=ljSt4YTYFmDenRtOhyt1jOLd5Msq/g33Yh1MuYOe7IqGDnfjrZh6bNS3kVNFgTslXl
 oedZK6pQsPj2HjFYw9jsuqD8OPcf4FyMlsIXnNcgV7IStTHnEdJPR/wbmDtHZwZxYOGN
 ebHvflNtkV7vTpuH1mvTDvyGSdgKvLGVxAg1q5p+UFgwbqhmmw3LOnVL4bePvW/+cdsV
 vLttuB18a4W1jfXFc6FknngT9U9YM/1i43dtzWveGKSOF90rYDB3kWlCjClpj+wey0gj
 E7Q0z/1vUwrdGEcLKE6f4lkHJ3PNxS0iLWSJqDqQ4mikgPOkEGJASU0U/4FzKsuiSZ+k
 nArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wYC5IYJjTNZDnMPFwIwmpQTVqAlfDoQB96PN41pXC3o=;
 b=Lw/uYl3Gm9WBxAAxsWPWsP2PuGT2JbgHrwH70N4E6UMiUTII4eYNtXM/yz1LSKXyn9
 +zB9JZ0bhHloZViGsuTHxEpBhziCLA0KLkxqJeZcPNZ/RFYJSKpmfyBDFVkCgY9ovPP9
 6FrCZUWjSh85m63MAkq/UxapvspVrYm0nKFOIjXhcUsFnfDiq0wnm1Vnti8A5De+aiPD
 9he7tu9isefkJ6lMX4yZ33QxmHJ2/Q5mCg+bMnvaLBEag5UCw+6c9b7s/hELhNjw4NRK
 FMjj+aTg0UmQ8tqk28MHNkNFGZqeb6CoK7tV82HdtlWsGbW2pqTNRlTn7zS3cgkAJJKx
 JdrA==
X-Gm-Message-State: AOAM532hSETds9Lui40WBxfIryVhmFxtAZnxLckaKwnKZDAyPnAeX0EA
 40hsAGPVsFpmKD4JTXB1c5ERlw==
X-Received: by 2002:a63:1e60:: with SMTP id p32mr26285770pgm.172.1593104097711; 
 Thu, 25 Jun 2020 09:54:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y7sm8697823pgk.93.2020.06.25.09.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 09:54:57 -0700 (PDT)
Subject: Re: [PATCH v8 38/45] target/arm: Complete TBI clearing for user-only
 for SVE
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-39-richard.henderson@linaro.org>
 <CAFEAcA8xy_Q-6zXexBEHLR=WSYTXVvttL9V4HqiMPmtRm__TEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e80eb42-655f-9ffa-264a-f72627efdf42@linaro.org>
Date: Thu, 25 Jun 2020 09:54:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xy_Q-6zXexBEHLR=WSYTXVvttL9V4HqiMPmtRm__TEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gjf/GiY+K82o

On 6/25/20 5:52 AM, Peter Maydell wrote:
> On Tue, 23 Jun 2020 at 20:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> There are a number of paths by which the TBI is still intact
>> for user-only in the SVE helpers.
>>
>> Because we currently always set TBI for user-only, we do not
>> need to pass down the actual TBI setting from above, and we
>> can remove the top byte in the inner-most primitives, so that
>> none are forgotten.  Moreover, this keeps the "dirty" pointer
>> around at the higher levels, where we need it for any MTE checking.
>>
>> Since the normal case, especially for user-only, goes through
>> RAM, this clearing merely adds two insns per page lookup, which
>> will be completely in the noise.
> 
> Can we have an assert() somewhere suitable that TBI is set?
> That way if we ever do have an SVE-capable linux-user which
> doesn't set TBI for some reason we'll get a useful reminder
> that we need to fix something.

At what level would you like such an assert?
At present we have, in arm_cpu_reset,

      /*
       * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
       * turning on both here will produce smaller code and otherwise
       * make no difference to the user-level emulation.
       */
      env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);


r~
