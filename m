Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp775289lfg;
        Sun, 15 Aug 2021 13:29:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMZ8jCbuy6KessH/KiWtMpq5qOWKvYPv1k/flXEWt+bqGaOIOz51sDNaGpDaFb5l1k5pYn
X-Received: by 2002:a05:6638:410e:: with SMTP id ay14mr12123020jab.76.1629059382824;
        Sun, 15 Aug 2021 13:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629059382; cv=none;
        d=google.com; s=arc-20160816;
        b=AKCr5GSvnqfFQRZ6/JpkKnS0nng/3jqpzqToPGON6yrlJRag5yU3a+t3bWEztR3WRA
         QuIaFhMX8ju9mpx/cfDzDGD3ANugC8v4qzEk06pr78s0RMlFeZgIBl7hsh9OIty2lyrD
         75dPILmiqhpiUIA41Y6a0GQTpkFxnpu65WLNPLejPmUxutDoIvbxQBFwTEQ4gXr+188w
         otq6Laq/TPnhtrlT9z5RVKKCTTHRLzPwa16sYmSjISuKM33Qs6XO0lg7JOJryW1rI/CU
         JJnveaIE2fMRv/YQR0xdZNDC/dKPxqGB5Sz/1zP1pU1uoqKh/IT3QpUxOZ3cfpeb91M0
         qRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yU7GsQRUpGYmyFZ0NPPZLysVec5A8+nuSMGoQP3df5Q=;
        b=SyOnqk+/VXo6U+Uy3vyJ3XX6CYVXb0MnMaNngCodjwK26Ycui/Y2UIqe8p0n8sWp7a
         ISJV9EHWp4Tw7Hn+xb7FJybkAf3piw6LBl/BKNvvEq5NoAFGSGS4xOJbRu+eZbY9sGmC
         r7fVpmywxGGE2oE38SGvZzwYmWy6RxXnJNTBOiSzC8fh1dJq00jzrzRVHG4DwWs5ydfy
         kP7cg6diNemVS3QIQPHKP5Ib9hIetCs237o0BOB3P1nOcx23WG/9LEjc3HwFUmbybzqA
         IwQ7sVNui8qIgpDPXAASZJhvenbFVU0NKoJVgudsl616T5KK/O1Jc+oJsEeqdZraoQ4N
         sXlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F2Ozo/+H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si13142767ilv.81.2021.08.15.13.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 13:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F2Ozo/+H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFMlK-0004nm-4R
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 16:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMkn-0004nc-OZ
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:29:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMkl-0004OG-SY
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:29:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u15so3103490plg.13
 for <qemu-arm@nongnu.org>; Sun, 15 Aug 2021 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yU7GsQRUpGYmyFZ0NPPZLysVec5A8+nuSMGoQP3df5Q=;
 b=F2Ozo/+H0K3i0hLBigwEWx5GDzm7K08qh60EI39L2EJdSM2lvI7QFM1wx7Putuvv37
 9ePfSSSBVWTFIyqLG+Uffmhq+hyRa/yvqD7Yl2wAV56zIpbOUiCDSWs7dNWOT7FV6UOQ
 3hQGAPL4aTwsYCRmsFeHMBVun5s3IMVAj1cFkxlFVYJrMGm1gakJKYK9rRnaZ7wLGVrr
 3TpFTydBULpKd1rr1WfU5PUStexwe+2Jy6L8aLxNXl12K8Ag6cwFInYPa758gqQlKds3
 hn8WXYKc9eTMhG8QEdI+Qh1LD1Vh4qpFnyaRUwS3nh2J/K7Z8Cx2Q/4mFc7d4hRysA3b
 1wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yU7GsQRUpGYmyFZ0NPPZLysVec5A8+nuSMGoQP3df5Q=;
 b=Vo6olsFXPNCrsk9G/OdjS6X7rACNasOxWuWwaWSxEPAk0xkgFSSP+IqpdRBisxxB5E
 oFE5oNbtOZnEVcA4yKuGNzAK3zCTMkBvhxkyYJtTRIU0QnTMC3n93v+8i2ynm1qNt1ah
 ZbmRAvz2oneMpbQLUP3JE6AICx3gh1NMSnSt9HyRa6mdW4fV2bFlm7PFhPbbn4od7R/R
 E/8PtMpSvsNegn3YIRVWg+Nl9D7jTlYu6wWKdVm1Z54r7SPwgVhyerR3od4UX4jlt7NS
 oN7z9oTbJyORw1dRA4WJuGgBNcKdq3jPAoqANRXDzHI4DwHUlWch5FWSUP9JrHWKeKBO
 SKRg==
X-Gm-Message-State: AOAM531UIJws/4nPoguK9xsb0Kujn3TyDrczRej7J1uhrkHm/5taU3IG
 axJEwlOvOSbcNcN7Ge/Rqh5OYQ==
X-Received: by 2002:a17:90a:7781:: with SMTP id
 v1mr7094196pjk.161.1629059346302; 
 Sun, 15 Aug 2021 13:29:06 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w11sm10919287pgk.34.2021.08.15.13.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:29:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 7/7] linux-user/aarch64: Use force_sig_fault()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd959c76-d0f0-5409-3ae4-9971d0d98a02@linaro.org>
Date: Sun, 15 Aug 2021 10:29:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lJRNX385Plk6

On 8/13/21 3:18 AM, Peter Maydell wrote:
> Use the new force_sig_fault() function instead of setting up
> a target_siginfo_t and calling queue_signal().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
>   1 file changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
