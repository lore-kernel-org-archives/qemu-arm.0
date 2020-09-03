Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp678217lfc;
        Thu, 3 Sep 2020 09:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrdal7cfiVX4PllHNzbBjJYQD61ShpENmAIC8gcZmePLDOc6RxQ2P6iS1gRMPi6JqHRgAe
X-Received: by 2002:a25:b946:: with SMTP id s6mr3713343ybm.266.1599150335553;
        Thu, 03 Sep 2020 09:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599150335; cv=none;
        d=google.com; s=arc-20160816;
        b=PZux3sHNWuIuH216OxJDJw9DlFL7Z0pMAGDtlXozAXP7jCJPTd2Pa51/xXUXJ3ULrP
         9OgeYAItB07MdmEmAFLKkJ/a8aZhhgcRRrrUp5N/0NdvXQ/XK6HTXhUqO8igHXjnbAOU
         bHWL2VzDRgtPOw7lat4v6YXKXYkv48awrVEuR048SSlGaidPC6P4nFPqawqQD5qAtdku
         dX9Zoq4ZvAwUf/l8LqueoePAOwMG+sJpdG5MelzmsCc0lOTHLw8blV+Ga2ZrbZnKaXNz
         7n38hcVtutNfDqDQlxFF9cz5GsWa2TE8NLMCENkUGs0BpNvO4KspKMhF1qbrKVOKrESC
         zspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d55bjfYXbIsQpM11ZH3ArJgmncniHoUsc9n8g/hvS9w=;
        b=LCmnfcfju9g9ZbKHRpeykT9yxi7YJ0zGVn7BfJm93tDhb5mPMspbOrxctOIP7d/UeA
         5pkKIqWhR+rXWc81YPRBdpEC0atTYUWZ1COsFXeRyzaJbUPVpq/hH5l/NiW7T19JUuBW
         iPi2AOWWDZM+rCxyC0BsqQsX5BKkkH2aL6rkovYVco7xmTYjn7V/4MUnma6FDQuYTCk0
         nMsrwRC+kffXcdoa2PNrMYn2PmiQiGI6SumznvyQIe9WB25oSseJKNvIdZCD8rEUMFni
         Gt1yjBKUF4uIxhvrc/kU7KclIbqXHVk8atjia2cco1jFiBtINknyPLpWkaila4QSoHn/
         /lLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrsvskKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si3499469ybn.135.2020.09.03.09.25.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GrsvskKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDs3K-0004o2-Vb
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs3B-0004m6-HL
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:25:25 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDs38-0001sL-Cg
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:25:25 -0400
Received: by mail-pg1-x542.google.com with SMTP id v15so2544306pgh.6
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d55bjfYXbIsQpM11ZH3ArJgmncniHoUsc9n8g/hvS9w=;
 b=GrsvskKegSWpkZmawPLF6i9hwKpDysPHBPo50N/Mb6qU5go/tEB6im10njk8YzvFBd
 BYZYmAXxZydDY1ohw64zNd31eekMxEdim/XbDSUJ0gRYhTx9shdiLspVZuzO+ult3aUa
 CGq3Lr61hcO85/1WVKj34InXQImqMrSAbmGSiPPcaMC2cY+DjktfR0P4cn7DTBsVylJb
 QcaHhNJyz69MvVUNvIP7SMJy3znK5trMR3KSN/pkKd/JEwGaaGnJIzv6RbCM3PyLOSCj
 EpUMyVgkMLUlBxLP+El3iANjmIIVhHbB841VIbcmwRBsOquez7Rs+g1J02MK5tV5PGbz
 V2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d55bjfYXbIsQpM11ZH3ArJgmncniHoUsc9n8g/hvS9w=;
 b=EPrhkHzKyCvVXjXve/UloIuEfzA/kckw42+ACwAyTi6PBddB3w1YSMEdcr0dTDe8Ho
 qwqWFbWa0plocnyW3Kmxa7f8OxaWm/tkHI1FrXrOHuK1U5vjPavM4vFvmBOBI9JMiPi7
 mm385so0odEXQHyhLvHniun/MUKg1YRU/4ZmF0VdrEnw5jxpfuBCswwzUNybnOw6BWAZ
 8I9NcvKYCWyrc8LNqRTcjf4qgWd8KOD+jOmeFLCUmQafaNJfCwWdsEKtfmc5yGX/0Ltr
 wCPljWOCBAhrYIuJ5b4kyD7MvgeLsI4MbgA72UF0msB3PFrlOq8AYb987t5teIu4xleH
 2nLw==
X-Gm-Message-State: AOAM531H0ehitNwa4JWb45DePNbFtDRRYV4vKTV2zS5Z+9Vc+FUb0ioC
 kd6Zxg1Mk7vekHH+udEL7gLTIw==
X-Received: by 2002:a63:3d41:: with SMTP id k62mr3438216pga.87.1599150320475; 
 Thu, 03 Sep 2020 09:25:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q71sm3132304pja.9.2020.09.03.09.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:25:19 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Convert Neon 3-same-fp size field to MO_*
 in decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200903133209.5141-1-peter.maydell@linaro.org>
 <20200903133209.5141-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4329a97-d20b-f47a-ddca-cc42cb190ee7@linaro.org>
Date: Thu, 3 Sep 2020 09:25:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903133209.5141-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
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
X-TUID: cJrgNY0mlp+4

On 9/3/20 6:32 AM, Peter Maydell wrote:
> In the Neon instructions, some instruction formats have a 2-bit size
> field which corresponds exactly to QEMU's MO_8/16/32/64.  However the
> floating-point insns in the 3-same group have a 1-bit size field
> which is "0 for 32-bit float and 1 for 16-bit float".  Currently we
> pass these values directly through to trans_ functions, which means
> that when reading a particular trans_ function you need to know if
> that insn uses a 2-bit size or a 1-bit size.
> 
> Move the handling of the 1-bit size to the decodetree file, so that
> all these insns consistently pass a size to the trans_ function which
> is an MO_8/16/32/64 value.
> 
> In this commit we switch over the insns using the 3same_fp and
> 3same_fp_q0 formats.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> ---
> I wanted to call the field %3same_fp_size, but decodetree
> doesn't seem to allow a field starting with a digit, even
> though it does allow a format that starts with a digit.
> So it's %fp_3same_size...

Odd.  All of the names get prefixed, so we don't have a problem of a digit
beginning a C identifier...  I can look at fixing this if you want.


r~
