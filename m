Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2913659ejy;
        Tue, 4 Jul 2023 06:36:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58x/QpKYplIiG/nP8LeHiWgIYN5Q7fWO9Q0SpCXZUmbE4dXuDAVlN9tnCKHVX0FZfkIzPc
X-Received: by 2002:a05:622a:353:b0:3f8:6eaa:dcce with SMTP id r19-20020a05622a035300b003f86eaadccemr17894087qtw.27.1688477769246;
        Tue, 04 Jul 2023 06:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688477769; cv=none;
        d=google.com; s=arc-20160816;
        b=K4AJGBLBLx0EM6xC2w4RgHPnhjzz0In2PASxhCIFsSXWXewQw+IxHJuuzwDtXsP0yM
         shywctfh1AY1Vhqzpg1nFNO6cIthiCt2fLbGprOQ8OrNHCyvgs/ERA8kJrvi/Kxnw5iD
         HARHDqpnpuLHv9eynmgh2X8XOtACED+YpRfyNg0HI3+Y0KhfdG3neC/n87BWaorQa4hn
         DB1MZjzuIijg0txNIrcc1zG2+pgBeafGbA426vv0SVBO33lH0SCSkf8g49p5BZAHeF7H
         LQmTstKigQD+qu9Lmo1HH025fsSltsulWcrf4ksToJv4ViMYrtnBT9ivQrtV8pX1TcRN
         2dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ExHDRwBi66qNTScO9JUMaCCcf4dgB+1xBOOFnoVQWaE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=NpVHwlRVD6FleD9rV2vYBmBM8nEyMk2Om5iV+ycQYFE+tSYy6YIln/SmP7sbw0Rou/
         gDSFp5l02GyANXYnruh7nhpqdeUs0E5Z9iwQqi5YSSMbYZRrfCzxn65ZQjAzyb3CE3kq
         uiYNM3IneJpCylYtM/RCkD/SPLLQTip4uI1Jgk4Hu/RVT+qBZgKHp9Z26112CeDXGCzq
         5+VUvEKAWY2LMmHEVH9Kja6Ft7cLTBwVbUCPJ1G09MAx6waAtIHoEfgNzQbiMSxAwR8j
         zg7fal4Khx3WsVlZX3ZhDrylSjp9F7BQnekivXrj9heh9CHrcvjrZ1MebIPuEnuJdfGh
         T8WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lUfPW2hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ac858c5000000b003ff18484bfdsi4746482qta.525.2023.07.04.06.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lUfPW2hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGgCJ-0003ZA-PG; Tue, 04 Jul 2023 09:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGgCI-0003Yo-P9
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:36:02 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qGgCG-0003Hu-J6
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:36:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3141c8a6f30so5858426f8f.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688477758; x=1691069758;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ExHDRwBi66qNTScO9JUMaCCcf4dgB+1xBOOFnoVQWaE=;
 b=lUfPW2hcyWdM83nomZ1+GT1JDgASJajt5Y45Fvd4KYq7Pi20GAHN2LK14lNxXyv6q8
 K+23mfAsBvrFs0gePceQ3kcWQo4yHkLpYJ5VDvng3PD7GGM0hoKl9xpgr0JOpIUaiEij
 O7b9/BOA59BaHGwcOosyqP0vFzhJ/wI7ZuXHUWRVoTTLUMyiYrV5eIicyY/5sa0IQ4Hu
 E/bFgMxOdiCQPTU4xTYFjgVJmzecED/5z4Le/rVum/7PCf3eOtl4Yfdsr+NGKqA2QjzT
 gcDx9lZbQZLCsEqfvK+8Zy7LYkU2ZYNENDsRHdW5hnmvAB5qOqnCflmyKw5peTQhmrO9
 iPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688477758; x=1691069758;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExHDRwBi66qNTScO9JUMaCCcf4dgB+1xBOOFnoVQWaE=;
 b=a4eKBQiAgogkx5mxUFGJ1LcNq9IAKwM7Rxp3QS9dKWkjnlzJkyXFhfSuy7uoKTby1D
 B4S7ndHqO5jL/tDLggg8rxp8bHrcGNuWmaYJWGKj6LBDAnS4fqGwIgCsLkrpvsEL05j7
 4mGsQuljrzkASJSid608TqpJ6M0DmKp6m17G4X0ZQCLn9egFc960iNGcLPN8NegVjsmc
 LJ5QeuFQLLwvMSH0oGd+jO+RpgpZ/w+Q1EVq1tKKoknd3YQmctuqkSPurHC2VJUdLhx5
 QEiBNpw4pDVqPEaQWcUbXoMAOqeJiCPw/OGRE8mM00EkJWPSl+oqsIZfg/1ZrW26Cxhz
 Q20A==
X-Gm-Message-State: ABy/qLYYIu3wvfXekiTPCjQcdAFLgCosW0q3eAaziG/EZuqiNkvUIhz6
 mwJfCL7jwDXQ1cqZqSXtP+LQUQ==
X-Received: by 2002:adf:f504:0:b0:313:ebbf:3696 with SMTP id
 q4-20020adff504000000b00313ebbf3696mr10385878wro.46.1688477757606; 
 Tue, 04 Jul 2023 06:35:57 -0700 (PDT)
Received: from [192.168.200.206] (83.21.151.197.ipv4.supernova.orange.pl.
 [83.21.151.197]) by smtp.gmail.com with ESMTPSA id
 r8-20020a056000014800b003143b032b7asm3994180wrx.116.2023.07.04.06.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 06:35:57 -0700 (PDT)
Message-ID: <81e6bf97-b6c6-e09d-51b5-445bdc3a47bb@linaro.org>
Date: Tue, 4 Jul 2023 15:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] target/arm: Implement Cortex Neoverse-V1
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230704130647.2842917-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +B3BksqMwCUC

W dniu 4.07.2023 o 15:06, Peter Maydell pisze:

> This patchset implements the Cortex Neoverse-V1 CPU type, as a
> representative Armv8.3 (+ some extras from 8.4) CPU matching real
> hardware.  The main thing we were waiting for to be able to define
> this was FEAT_LSE2, and that is now supported.

Now I can add "reach SBSA level 4" to todo list as it requires v8.3 cpu 
(I do not count 'max' cpu type).

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

