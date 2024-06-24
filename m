Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp427374njc;
        Mon, 24 Jun 2024 06:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMn3gyB65beLPaVwXleHZJDooGGIIUcmlY4RraTAUhHA2tuHZMSttUQqFWVuuDOA51mSQ8KCGHPKOBDE7wIwdQU+NFhiY2
X-Google-Smtp-Source: AGHT+IG+1hcDLEOk7q0EhMlYOJVedUIigdbnZgtUPJQfEurD1zaw4yeXUcUw7IZIyNu0wHZc5J5P
X-Received: by 2002:a05:6808:21a7:b0:3d2:278b:2af6 with SMTP id 5614622812f47-3d5459877e4mr4927702b6e.28.1719235327968;
        Mon, 24 Jun 2024 06:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719235327; cv=none;
        d=google.com; s=arc-20160816;
        b=MD8KxkiabqjZc6RVBBAuD1OTeVFkW6BwzqRrxCWggRr+hpisrY1nU0q7RCHfIOng2s
         Dm5S4Rn6ThZL8Dw1qnVyNj5yQQliB6Ergj6RZxRDZXz6wYpsx+ROVCii3IjloH16Y4Le
         GeWrSkdT1viYoMeCRa3XnNF5/NLzwi87O3BxrwgM9CCwNMqJskYP3g/wRO9/YHksdmbk
         JK0F/VYCuWyccVz6kRGdnzD/P36z8gBDEuppz5z2gvljk7d/SLg3E23zNkLTHSFY7U63
         T/vNY+gEHuKIwyNQcYGRjK6yA6lYPUWSevSPOsO4r61OHaX1vbtn8kcCfnKN0Ojk0oI1
         j/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qtPfj3Rr8TYOLDSlaqbXQgaU5zT7Ct0Jmt7DP5WEx3Q=;
        fh=2LU4ESW3gVKfSxj2+7TBfkI7LBnPTvjz3gbfbq/u0zU=;
        b=Ja8W95I4VDPrHU7GrzQaaxOuqFm2xGFLqwrHdQ7IGMgHe3qudhSLUWwaT/sJaX41Gf
         3K12AhqBqa5Mw8BrUXXtuaxeKX45Bhb4Dg6jRhLyn/1eD8ZfHp21/Mfs3lr4Xg4OgYfw
         x7ufb49O30nroSpSo+RXKf357WNbyt6lTDH736cg/LMdP6PM6Ma4svDUyOFxbrXerd4O
         5Qx/TvesqV+x3kl8hTDNkOvepFvy6Y3K8YyhTTaqJc1UGNebIhQ/TRlScvw6KAT+W1IM
         x9ItLv+ZpqZ+fkVrivk6pwUH7dKt1jeR6Y5DgSP5wKk1VW19IWFVc0o6MbxC658CZgz3
         Pwmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u1gPrvZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c08146si82900251cf.294.2024.06.24.06.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 06:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u1gPrvZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLje0-0000lD-6v; Mon, 24 Jun 2024 09:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sLjdv-0000kY-6a
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 09:21:59 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sLjds-0006yr-GZ
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 09:21:58 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so2696364e87.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719235314; x=1719840114; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qtPfj3Rr8TYOLDSlaqbXQgaU5zT7Ct0Jmt7DP5WEx3Q=;
 b=u1gPrvZExOKOIEOtUNlzxMwG9Ce8g837VIdmQnWPiDwBuZKlLxxOklyMRihLx5ZTA+
 4UjhkecCTqvdhf3/8eTipVmg595Ot4era85PdzbeC4BN19ClOnH6dhveRKplkBNaMA+W
 Dq/WduKFqQ5+fH606w/r8VeL9peGvKCGkTBRVWiH4raOFwDDwD0w+41TwRKuf2zMyqPq
 MZxQ2bKnuHgTMd6m5FdAM9I0r36XeUuJuYOL5mwQQdMVTwkppFCGYboF7AZO5qchA26s
 +U6i28OVa19In3+IYF4GWejxZMp3JcKwc+mTOmvLudgU6OiLJvdAWHfcC2o4OxQnOKdi
 AQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235314; x=1719840114;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qtPfj3Rr8TYOLDSlaqbXQgaU5zT7Ct0Jmt7DP5WEx3Q=;
 b=nzvlS6/wNNHvZIKyijt5G1F3fh3Z8gdZOUYFqhJGZ79mNZ6pw4tRLiShiGqMdyVdbY
 EJ/R4fcttV3QndGxvw/0+gUnp62lZyuTFVHXH9c4L+16nAKvs6FKlKjLlekf14ckCO2a
 fVi9KEXYxIIWHQnmG673pjA7cBJqIMYwHBC+FYeJLywFRjby1wJoXCWFtV8li/spTGk6
 eC+8/KF/+CiBLfOyoZuZ4I0hWg91ZelbpIQLN5bOZY0cnS6O47jfF7QRY+M4XrQD4cWu
 ZbIizKTA6Q6RnE/epaLlrDcYCCWLoHZX2WGbe+NniPUcCT6Pm2R/Kr2fgjKKbOFX5CYf
 I0FA==
X-Gm-Message-State: AOJu0YxloQ1M47alMEUwEVTob/1GfLE+aiPkj7xU1kBuFKZb2u2iNbjs
 vrc7ZFXEFJm7nf7ibTFSpX4QMwUSoKoTggKK45voSuEaxB7kGkmxtS2EdWlCDHw=
X-Received: by 2002:a05:6512:2827:b0:52b:c296:902a with SMTP id
 2adb3069b0e04-52ce0610642mr4384985e87.5.1719235314279; 
 Mon, 24 Jun 2024 06:21:54 -0700 (PDT)
Received: from [192.168.69.100] (bd137-h02-176-184-46-22.dsl.sta.abo.bbox.fr.
 [176.184.46.22]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366383f6777sm10115425f8f.21.2024.06.24.06.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:21:53 -0700 (PDT)
Message-ID: <dc589268-efa3-45ae-85e9-30937fef81cd@linaro.org>
Date: Mon, 24 Jun 2024 15:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tests/avocado: sbsa-ref: switch from OpenBSD to
 FreeBSD
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org>
 <20240624-b4-move-to-freebsd-v2-1-64ea7b04998f@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240624-b4-move-to-freebsd-v2-1-64ea7b04998f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: 0f8+ptObKnDt

Hi Marcin,

On 24/6/24 15:14, Marcin Juszkiewicz wrote:
> FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
> than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
> so we can stay on 14.x for longer.

Could we keep the test but not run it by default on CI? No need to
upgrade the distro version, using the fixed cortex-a57 (and not 'max').
I find it useful when bisecting hw model changes, when we don't need
to test the bleeding edge sbsa-ref. At least I'd like to keep
test_sbsaref_openbsd73_cortex_a57. Maybe:

   @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

> 
> Moved from Neoverse-N1 to Neoverse-N2 as sbsa-ref defaults were changed.
> 
> Timeout messages expanded to mention being affected by PAuth emulation:
> 
> test_sbsaref_alpine_linux_cortex_a57: PASS (24.00 s)
> test_sbsaref_alpine_linux_neoverse_n2: PASS (82.24 s)
> test_sbsaref_alpine_linux_max: PASS (81.10 s)
> test_sbsaref_alpine_linux_max_pauth_off: PASS (23.54 s)
> test_sbsaref_alpine_linux_max_pauth_impdef: PASS (28.96 s)

(These are Linux test outputs).

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 53 ++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 26 deletions(-)

