Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2005344njc;
        Mon, 4 Nov 2024 02:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+/vg/VDdS7IFjAujR5nQSavJsexhBJ6C886dXeiCuNALcTnfOOinvlBNAFY3vOtVaUBMuQ6vZsVlqZg==@linaro.org
X-Google-Smtp-Source: AGHT+IHRYerzzCI7ckG8EKAwvu8TR5u/tbVdjQoaIM9xD8V7TO9O9l4zgFmhn4mFANxii0nwzRki
X-Received: by 2002:a05:6214:4401:b0:6d3:4605:bbfc with SMTP id 6a1803df08f44-6d34605bf3amr257857666d6.36.1730715855342;
        Mon, 04 Nov 2024 02:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715855; cv=none;
        d=google.com; s=arc-20240605;
        b=aTiIfDQJKGbNkLmdTU8lAktbQGt1qBIXIJkOKa9d6Ctm+J7GKnI7XEpnqUvY9a8fAl
         ZlDsfuvcXcjrBu6zcIx/X2DXCLq2T/BsVDe3akIngHnM2MT9ranfAHiLqZsAtQwnmo5M
         aU/Ey3+wWLY9yUjXrg+d9Nm/lJJbfU4W+QKYiI57pDPUwaG2dqPCtNRq45RRau05LA65
         8qw8GImFOXB0KbKJQBRxa8bneCWGv5jZu9l1lHVdt+t0H+7mWfynuF1zFLSbArVlghre
         JuHVGCgSGcY3PH1QxQiiuf9M+aBWWpBPRncSqxOrMIwS4DWO640Jy7QpIjSUqrJCta4C
         CdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UK3BOn0srHiEgicKGwdWc4VcuHmtUtWt3iN0HtfNJsY=;
        fh=HaXlFf+yzonzh5lzkdZKg+WdlctjEHwoJpzObGIteYM=;
        b=JP22MdAjnqSsQL5ffk+QyzdaJi7CJ0zkkVqbUvpXNCTqJnRHhkk7ashJJdqbXyMAu9
         89D/Ikqh0sliF5l/emgcLy/+RSVaujT0Pq6uj3DUnGr2g6QHtznjIAIclt6Gx/CB56FN
         X1fT+2QRaWq6ORUHQEd3NpqZeSmyYE9pZf8F7Gd5aLqsEcNla9pHUapQAogGgpDkHwvT
         SsIss63oCSQLGRtVdwCURe4HcxPx9HhzeGnjFL9cTIlrpXkNaogvbJF1uCTMzNnAnNUN
         E1/uvSyXx8pHkLpJGxHzqTD+WcIlhR2F16bWK18UbqvvHNwRwaL9ZiXtN3MbgRmSnViy
         KDeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPVR4Trx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3541ae937si104148726d6.517.2024.11.04.02.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPVR4Trx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uFb-0001Cz-6o; Mon, 04 Nov 2024 05:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uFZ-0001Ch-8d
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:23:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uFX-00081G-NT
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:23:56 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso32996525e9.0
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730715834; x=1731320634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UK3BOn0srHiEgicKGwdWc4VcuHmtUtWt3iN0HtfNJsY=;
 b=wPVR4TrxjRr/8Dxma1blO98Pr7tbrUw04KKKqxBBumhZs1Hrnyw68RmvqTgnNv75dY
 phMUNIu8gxpHFgs8doQGH9PaZSqtVgOmSFDexkIrgqj4aD6ogVLH4CLP++dNy7Tw3erz
 VeQuptQYb6f/k490Kb/mRgsWDpVEh7aYgfUoiq6GAlgOJ/JFZMYeWjl2nEK5dGz6ui5n
 qiSodLLDZ2AI9ZpEMYSPKRvGBtf6MLwNeU3HYAeTunC4p+rcrW/YeaCqysURgzXXwxGs
 O1ftW7vGnYnK1NzR+8W5+TVoQ1RXQe/bdwyReNWFFYqADKrYmrKAmTQTh/FQAyZUKD0j
 0UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730715834; x=1731320634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UK3BOn0srHiEgicKGwdWc4VcuHmtUtWt3iN0HtfNJsY=;
 b=ZL2vhrNbDojM8BShr33c/yirfgRqvIai15cVxCTzjBW8WpLQqXMEF80B8mpo3I2g4b
 iG6ZUk8PzsmAR1fsZ06CH2Z7oRFPPfWjvt78wqJPJJtKsa3Z6Kh74ghi4JwsULXvGdlr
 0d9tS4ShPUqIEFpWq9cIJrUX6SOkOq28tbbsibIrMQmzrN0A/Q0dc5i1TQbrXBI1isn0
 kVHvHI6DoFo+gYf9YIRmj4XFSN9Cqu6ZtwiQ+1XetCAuFADZtucDCMIexipu04oSnqEs
 kfq8DyYPvhkscUVDtvfSVTSGnVre4H/Te3qh4pGjqZvBwLWN3SRW8hr0Ymm1egXGEfjC
 HILw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc84EnYUIAL4fbjKjt3luEDj2Ohv4lt3rqU5/dNjR7zNoUElCHJqeulNdUdwiV2Yh1BZOGugWRZA==@nongnu.org
X-Gm-Message-State: AOJu0YybukXts8+ElF/tgz6k0jkM0N5HmrPKkL9G0jTwxn8ucBtr+vGX
 fyYdZ0jR8n30x2Z6j8MR6vyACL8Pc/cuDq95vthffpQHq4nPjsDT6nibWqQOKQY=
X-Received: by 2002:a05:600c:3b86:b0:430:5356:ac92 with SMTP id
 5b1f17b1804b1-4319ac7642emr273102245e9.7.1730715833761; 
 Mon, 04 Nov 2024 02:23:53 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a99d3sm179744005e9.38.2024.11.04.02.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:23:53 -0800 (PST)
Message-ID: <124c839c-6e2e-4377-9d4c-825a2e8bde18@linaro.org>
Date: Mon, 4 Nov 2024 11:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/aspeed_ast27x0: Use bsa.h for PPI definitions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20241101161125.1901394-1-peter.maydell@linaro.org>
 <20241101161125.1901394-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241101161125.1901394-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: OanOq4m/sMS5

On 1/11/24 13:11, Peter Maydell wrote:
> Use the private peripheral interrupt definitions from bsa.h instead
> of defining them locally.
> 
> Note that bsa.h defines these values as INTID values, which are all
> 16 greater than the PPI values that we were previously using.  So we
> refactor the code to use INTID-based values to match that.
> 
> This is the same thing we did in commit d40ab068c07d9 for sbsa-ref.
> It removes the "same constant, different values" confusion where this
> board code and bsa.h both define an ARCH_GIC_MAINT_IRQ, and allows us
> to use symbolic names for the timer interrupt IDs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/aspeed_ast27x0.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

