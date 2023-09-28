Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2776387ejc;
        Thu, 28 Sep 2023 12:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD6HrJoJhgb53wOnetb8yVmpvo2nmnsDRf6F/+cVt8PtCxbD/A4abs4Na71kdYPR+VwBSb
X-Received: by 2002:ac8:7f88:0:b0:419:6954:3ba2 with SMTP id z8-20020ac87f88000000b0041969543ba2mr2170867qtj.43.1695928968896;
        Thu, 28 Sep 2023 12:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695928968; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7EPgAEKEHoQhIQJKO+S5JiZ5bOAJ9LiXqxGzJmt5Ww6meHMMSJ1CUyQP9KTMSBrvX
         clMuArRPYdMTWqaLO5ayuMPayBJmanf8EPZGfIqbJqJu+bwnuXXU+dM6mRb90jWQ7uVH
         fod8lr4YJu4+jLxpE7ShCTkJygWIKK19XXOfFexCkj7EoVkO0Pkf0nA8DH+EuN8/JZ/o
         jYXqJobUPxhJB7UJY1xHKwdiNJGXr7nzbmJi0rQ4I1oqBEuijULw2bl6oksFqRc3kNBL
         tVK1oZlMuRQr/QTNLOXvAAJxZvWdNTjjVA8CpFrTsW+BKHWPpNj+LyndKqpfLycFr4Hx
         ks3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sKSlZdVOGX+ZMVR36wyq/I2cB7S0oxMqPMwajXWY1zs=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=MD+oKGmfZ/CDX9K73O1lxqitb5HYW3tfsbH6dK4cVB3JxJkkBEtumjGnPK4N7mXhvm
         TKpxSgvXpmQs5iRlE6vBIfb1n1SCOHWk66m8bU2tOx6x/BlnRfNsESaHzASi+k88GXoL
         Tp0SLVifMzvLyBLgVP+Jf5VEsnUx/0N5T2EJHtZwckfxJSMXlVfdZ6kgvh3IIOesPt55
         G+Ab+sRGIs1Qu8bn811Cpp1phqpKhiqYG4KO0NjOV4pzjwFeGCM4WF7oQkBN7iCOsMcq
         Fl0fj5iCT8RKl83BZZfUG3Pdm2+bY8FMnNlRZP0sb6xIMGleJHEohx0I0fiG312LTKLU
         sphg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faVchqrs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8590e000000b00419783cf7ebsi230291qty.532.2023.09.28.12.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 12:22:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faVchqrs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlwab-0002ec-W3; Thu, 28 Sep 2023 15:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlwaX-0002dO-OH
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 15:22:17 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlwaQ-00024w-H2
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 15:22:12 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5859b2eaa55so115299a12.1
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695928923; x=1696533723; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sKSlZdVOGX+ZMVR36wyq/I2cB7S0oxMqPMwajXWY1zs=;
 b=faVchqrsAkF2zSXHfaumcer40r4lRjvOMEPX5hZMwhflOD/60MzM7OH7a6FCh4dYQi
 tX+oJjsuDhsXvTH6P+5BRptv95JOEzQ19PMyfaS9IYgxEBvUWWZ/ai+hkDSCoIKLVMlx
 sifTrlqCnB0KzrfEyYoSiGKR1i1Yx+uYNV5feGpeC4b2cxFt0xTNHH8yNDhIvcnnhUjY
 NFcFZRrY4IaHy0N92bOsL2Vw6L0pH40HQ2T74XqWuiVsI/P/fqJtzT+xiLwqIOdZCht9
 i/NdN3UCiJtmvRD0RGFHEoQOinK51Ijrr+dHHtpGASwqg3X47O/OJI5JR0+NIdxGrkCr
 AdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695928923; x=1696533723;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sKSlZdVOGX+ZMVR36wyq/I2cB7S0oxMqPMwajXWY1zs=;
 b=LUVCb7ucgpkrrP5+SUeS11BJg5YE3GNx60rhZyzKW9dhRFe6W33zltUjbqxx2GLpfD
 rh3HJV9zzqGgw3iZtHjnlYS817TwBdZldo4Bi+K6yN5lNwsV8tsH9Xk4scB6cF0uNqdW
 OSGdWPRfZEiBEyyQzEYn3U3i9lhuQ36L1VM2wvMuZRQMuDFLCywGkr/9a0mgv77P1S1H
 NfMqP8EWBntqvYaTp0ThTXS6j+UNi/o1bO2MPr54wp4iSEwdUjwssJBPhPtKPxOt+AfU
 holoG1l6dmEDzgh33ZhJqgZOuhDpdRNVQd91LzIXSDTKiHzhXgR5XWO5UP0KCdzh3HNp
 eXBg==
X-Gm-Message-State: AOJu0Yx/D7hMiDSL049l4wtOAPprj4KoL7p0/anLzxF0UuPWGhVQa5ZM
 OJirdKzzySRGWpOJ6Sh9Z3vaAQ==
X-Received: by 2002:a05:6a20:6a09:b0:14c:910d:972d with SMTP id
 p9-20020a056a206a0900b0014c910d972dmr2404908pzk.12.1695928923430; 
 Thu, 28 Sep 2023 12:22:03 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 k9-20020aa792c9000000b0069353ac3d38sm1196408pfa.69.2023.09.28.12.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 12:22:02 -0700 (PDT)
Message-ID: <a14e853a-fb10-dd49-44da-2d50ea590088@linaro.org>
Date: Thu, 28 Sep 2023 12:22:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm: Implement FEAT_HPMN0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230921185445.3339214-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230921185445.3339214-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GaxoXpzyRW1h

On 9/21/23 14:54, Peter Maydell wrote:
> FEAT_HPMN0 is a small feature which defines that it is valid for
> MDCR_EL2.HPMN to be set to 0, meaning "no PMU event counters provided
> to an EL1 guest" (previously this setting was reserved). QEMU's
> implementation almost gets HPMN == 0 right, but we need to fix
> one check in pmevcntr_is_64_bit(). That is enough for us to
> advertise the feature in the 'max' CPU.
> 
> (We don't need to make the behaviour conditional on feature
> presence, because the FEAT_HPMN0 behaviour is within the range
> of permitted UNPREDICTABLE behaviour for a non-FEAT_HPMN0
> implementation.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/helper.c           | 2 +-
>   target/arm/tcg/cpu32.c        | 4 ++++
>   target/arm/tcg/cpu64.c        | 1 +
>   4 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
