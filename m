Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp74961ejb;
        Sat, 28 Jan 2023 15:48:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/1yN27+Nb+Ft8whJtBDzd12/y43QvGNFU6VGZaJYUm29ol3s09qOyJEHHO7MPMdxtU/Y/i
X-Received: by 2002:a05:6214:184b:b0:537:74fe:22e6 with SMTP id d11-20020a056214184b00b0053774fe22e6mr17130693qvy.23.1674949702297;
        Sat, 28 Jan 2023 15:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674949702; cv=none;
        d=google.com; s=arc-20160816;
        b=JQZLc4cH3W1/Ok05URo36y53eaxLXdxf/MpDSu5jp1HUx+YB6n2nm5cCi098ZY4Jup
         D/Uxmsec2MISEgf7eciup2ApMoJOE22sGVnhWDe8V73c7SmVmq+8b+Xl5HzjJqdrgxhf
         qN8pxiIDY7uCzXsfSbfABURGi1Jp0BJ3aWo8gBwMbMN7x8o21cBcuhSNo+lxd5Rn+yPT
         +q3TvCMA5SQhgIZQHdjG3TLCqeQV79HSGXfIQcBrE5VS56GkUdedfPxQrxToeOlZqPrt
         rhBTQpXCfyvhjEahkCDELy2Hhgf2QBV6mUDgdRZQxAGBiekgg4jitWtuCoJkdYf7f2mZ
         yQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=m7BvP99R90F6W63gHfpd2xraeWOR/GSeyPOm2gE5bu8=;
        b=CDpBeC3oEP9gwolEocVemUg2k/bHkEXlFqToSqaNb2b4LKpYBaXR5CrFdJwHF8BrHB
         6A2qIVY/3owMrTEgA+LSf8DqVnvTO6TjbHEbyFSAavdTZFzfi4HJ93IXfl0Kma97Bc0K
         S8u1X7uUvRj4LyevjJvL2NZ79xyOmc5gqVamostUEy4IDqeTLmLGn/NliYExfg3yiCdk
         1ftWKpICJDrG1TlH9OcU+u743cHkoo4h1D4H89KwRRa0CS1NIme9c+FVwidCKL8SyL6f
         lScvWtwg3ILYfQIeNnl4Tc1M4oP7aYhvrvnLta0que40LtpZFonKJAF+sW4oZvOXjAL3
         VFeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UCVkC/ju";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020ae9e502000000b00705b1d4165fsi4677409qkf.676.2023.01.28.15.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 15:48:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UCVkC/ju";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuvS-0007v5-Dw; Sat, 28 Jan 2023 18:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuvL-0007ss-3Z
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:47:58 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuvJ-0006XM-Hz
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:47:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id d3so8289688plr.10
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7BvP99R90F6W63gHfpd2xraeWOR/GSeyPOm2gE5bu8=;
 b=UCVkC/juOY60KNtqAHAFEg8/WC1VdrzoxwpRRYpzBn2yUEIdLy3dViZcpURI9b9Alq
 UjF/DLWrWWUPvWbYpNhw/Qk18txUYgwR+s5ntstLHmKYZilUOESyBCYn4ViB6kVABqHa
 JpN0dP3jAxMUErSsA65DMMdsQTEOrSvndns9IIabP8FY0sd5Mar+fvnujrfXrpfQmEQj
 QJEQkBky94WY7d4Wwz0bYFWecIldqvfFBKQMV7L5FOsfaCvdYJJgpOlKyiM1Jy3FQ57y
 e1QSLtvlpkVN2j63aYk0UQR6ItRlT6UDbeedYJxXGSoeaci5N2dQlmPcEfZbIUThwqsU
 ftpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7BvP99R90F6W63gHfpd2xraeWOR/GSeyPOm2gE5bu8=;
 b=HqCyV2aYw+W3Zbub7E5o6W2ngPcq1Ympsz3r+TVPQOO+Rpwxv0Aft87Ncd+bM4n44G
 cDZR+/KhOx31MF5qHt+R9lKSlzjWdXPFYIttrgqqlY0JTdCKW+R1JnM/TuSKRbEowIAZ
 +DrwP26Ya9Ig/jz7k4Ej5PMepgFu0uoAJFN45t9ptugX1E4rR6Z2CUkKnoVB2vqCXW/p
 CAC1xC/sJW8cGaZ0ruF40mRJyHJszYDzG7NfzWF4JhsGolYDy8C2IEwdvWMCInES1IYS
 mm+jINoZage/jnHvAJmiuzqxqFqlpEX4mSgzorEU2Y8ufkkFv/QANeFZF5QIIxhED4mC
 fzYA==
X-Gm-Message-State: AO0yUKUrB6/ncTWjT0vtcz2yeOrAp+Y/lTKpg+u+W72J4iW1FxuqCNKP
 hkxMd2WPwBBvUQqO8mrNtPZAcA==
X-Received: by 2002:a17:903:246:b0:196:6da2:37a6 with SMTP id
 j6-20020a170903024600b001966da237a6mr3223978plh.36.1674949672158; 
 Sat, 28 Jan 2023 15:47:52 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 i130-20020a636d88000000b00477def759cbsm4342409pgc.58.2023.01.28.15.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:47:51 -0800 (PST)
Message-ID: <08541e98-f736-4471-f7aa-1dda468d8022@linaro.org>
Date: Sat, 28 Jan 2023 13:47:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 17/23] target/arm: Mark up sysregs for HFGITR bits 12..17
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MxKIAg2XtJJA

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 12..17. These bits cover AT address
> translation instructions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 6 ++++++
>   target/arm/helper.c | 6 ++++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
