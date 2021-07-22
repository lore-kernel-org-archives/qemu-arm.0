Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp88806lfc;
        Thu, 22 Jul 2021 13:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7L0K1d3aiDB4hqEa737KM6KD0fW3GTSqSQt90oyxGP3kRpL1ONwqZG0JY2q15AcWoEyQa
X-Received: by 2002:a25:3c3:: with SMTP id 186mr1797047ybd.130.1626985170865;
        Thu, 22 Jul 2021 13:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626985170; cv=none;
        d=google.com; s=arc-20160816;
        b=laykWN3PgiEnoEAj/WxgC/rscjw32HqHLilXOzyjQl8zlV/5YzjxW8JwSouzeT9+8O
         ReEMM8bIIQfCzezWpZ1V42XS+XlJNQTTkUxKfNSCFOA+k/wgIhtX1QG+KhhAwlr9BqGy
         OQ9FRphMbwgXrc1Y0/psfndEENyzsiHCs4uUof92pz2UE+LDIMjmAkA21JwBMKb6PzGl
         l22Ts+fH2RwSagqPMszXWlmoZzGc+EQZcDsrcmwme0e1k1IJa1dRsilG0mCs8gG7zreH
         go4JHGgAHnoxFEFwzLejm3vfSQtLPHFlnUYSr0Yvm0ApcYYchD/WZinrUBjJNk0KOw1Q
         Bcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qqOD/MAtz/2tH6T11m3/gTWq9fkdgGQmdJRMm/Rergs=;
        b=YzosyLU1Dl5lFHx2yLHPqFHJYEMvo9RAY9ahYufM864pkSKo/t2n3rAQrkymlKaOZt
         IL3DYV7Nzvk+rEFe+syS0ojRz867rkBNetvKulRGAJw+x83wOxq+wzHXQqrz/yURkD9w
         TqDpl9BhEwEasQ2hUcvIrWN2cdcYgkxHDkFBdjMnT/vuaCAhAFnZb6oxZUmnvnCFebzO
         2SiaNezAPmfk8Df3DwB6GZeXwXW+maJG6I8Ia18KHAS1jHoPOIdiDMI+NZkRmvqSFDag
         ++UOB55/nnHbSEHFMgRojq5S30tBBdLMgAkmejvEyIYDq92zOnjM1FSLIoNMCVVaeByz
         sClA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZ0DFUyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si29089121ybu.97.2021.07.22.13.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 13:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZ0DFUyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6fAI-0005fw-8z
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 16:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6f9o-00056F-Mq
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 16:19:00 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6f9n-0007o5-3A
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 16:19:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id i1so530448plr.9
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqOD/MAtz/2tH6T11m3/gTWq9fkdgGQmdJRMm/Rergs=;
 b=bZ0DFUyZXJ6uR2Z5EEhBfMZGV4vO46sxGwGv0FyGFLLJdEKFZg09vtPNP6kZQz5eCH
 8d9Ui7X2FR4QUcOVQWHg0BDoUetR4IItfoVfdFS/ZPi+oq2h7byORVNsQ9SAX3K69sSo
 h+tQxi4CuxT+VjmkKRQTuCSsWbD7Z4nvrF+ltn+AtfVPaLrne5phBwcL/7YSXLr7/w/h
 W2Pf7Tk6keVagHHiR9gbAoDeR5nNT4EgxNen7Rp3sxilw0mRvHbtBkDKibPSoBWXOMV5
 4XiBcIWbPoNo2rSEBRHbuX9g6nZaJAT4yRU/YTSk9ozV+9NB2N1+YXr7k8VbN10bPiyz
 JD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqOD/MAtz/2tH6T11m3/gTWq9fkdgGQmdJRMm/Rergs=;
 b=uLycpkJfMO3xywIF/Qe/IgBasnacPEbpLNlfK/V5RjuMRFGbQ/TEAFILIeDfgpp/On
 LPj2RQ4EQu+x23efBZEWqf+bLH/PTfVimchRXLg1LXs9N1w123Jg3N8F21yJukhr6YWo
 hHOYCWz1qbfuIzW5ju55f1tqr8S5NPCDUWcqE6w/Qooby5t3075ccuGcD5fB3MXoyIvi
 czd3QCxfD2FZOHaz7TY2XPbmTpPEF23fZf/jRLU1UBkw90rgGMoORDiL+HwqjSuOxkNi
 91ZA3IaXWLB3YrH+RSI81Asodto8wjrDtUjEQyfo4gEsuC0KfgRF4eGgKAkAVDPEz+Fg
 SryA==
X-Gm-Message-State: AOAM533U+7vyk57lahB7dNHM36Fp1X2fkJAcYMpn9KRsE2ELtfLmX6LX
 JDPBn/vTOL8KipLrt7JW7Xsruw==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr1386318pjh.193.1626985137278; 
 Thu, 22 Jul 2021 13:18:57 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 73sm27196308pjz.24.2021.07.22.13.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 13:18:56 -0700 (PDT)
Subject: Re: [PATCH for-6.1 0/3] docs: Document arm mainstone, kzm, imx25-pdk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210722175229.29065-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1bf6cf7-9cf4-ddde-45a1-d95cf72b3a4e@linaro.org>
Date: Thu, 22 Jul 2021 10:18:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9jFUrFr3byLd

On 7/22/21 7:52 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    docs: Add documentation of Arm 'mainstone' board
>    docs: Add documentation of Arm 'kzm' board
>    docs: Add documentation of Arm 'imx25-pdk' board

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
