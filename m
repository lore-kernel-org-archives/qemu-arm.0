Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp542143njb;
        Thu, 27 Feb 2025 14:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVX0cBRAR/2NYSJXIc0l2t1B4/0wX4BRmIqhAGRxCWVN3EjdcUrg6xNjv1k/JRwUMh5yLJihtXa4ehHng==@linaro.org
X-Google-Smtp-Source: AGHT+IEYdoT57O7wrVZi0t75+x6JJcUA6rdu5x/GttGLPeX/2q8SDlL1u4Bq76k42DGhsmVxVgCz
X-Received: by 2002:a05:622a:1916:b0:471:f754:db47 with SMTP id d75a77b69052e-474bc04e652mr12933551cf.2.1740694557567;
        Thu, 27 Feb 2025 14:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740694557; cv=none;
        d=google.com; s=arc-20240605;
        b=cVget9OSVHjfJ4b397JqMy3wudOHPgyHvjel980oIipdZAK6HQgiJt7XZHtuWPIJxc
         8nbNjTbj0s9k54k1o3djKrXhGmwzlgZN4PzuNTFwBg17G+mpot2ffsKTq44n1kpcAtwa
         imhUOhLM1DxUsLRIdQsgNMSi5KKx/KjPaUwuEViQUUxeSYPCPfnioYIGUGywIRCN2CMN
         ViU0BAGiHn5hy4KvUuFAblWUowrdtTaq1fsNj2WuSZLZu2wO63iu4NDdwrGR7CNlDHcf
         aKQOPrw3rfEftJe6CZE/TYOYTTQbOaxooT5I0jANitXSOA7uodIbCYbcpZt0kZHb6T6z
         tBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dQ8oRyWp+zcVZSGxJ/QE5G1tnsxekhvTRwNh6pijwrE=;
        fh=avNzjoO+Ib8kdlZOqZVoRMtCKdtVo8brtZTnx31xzjM=;
        b=Hg100t3oKxJH5tPM7Q5TA/eGdkcy9K1HfbIfqjfJ/dLY2BGC1mA5iClJlzvSF3hYaj
         aN9dLVpS7rWbQoPo89lf3LC6rHN0jvznJ9BZwlVM6ICPPxk0zFrXnFiw6JnwI2tzqR/I
         1yPpXmf+l5Fz5oDCzQp9fn21kV8cs0A2pFIy5rvR4pfSBDS44v3rtaMg4YZyL4locLPe
         Ttz3JCoXVAC1ku8O5QBmrIQXJsfvpblKZ7YdjM3uAhHhv+viE3nTM9Qa3Spg72CNkJPX
         pza7cMR0gQZJS6s1vOL1WhP8SvjaT2xGJZmLHenD9Ii1H7YHOLgYdvG2ysjNM+usbw03
         ljmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDBGaUPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240dc76si20574271cf.439.2025.02.27.14.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 14:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDBGaUPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnmA9-0008BH-3b; Thu, 27 Feb 2025 17:15:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmA7-0008Ad-1x
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:15:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmA5-0001Y0-0s
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:15:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4398738217aso13132165e9.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 14:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740694519; x=1741299319; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dQ8oRyWp+zcVZSGxJ/QE5G1tnsxekhvTRwNh6pijwrE=;
 b=wDBGaUPQ13m2InvaPGaRK26heHg0ckioz6deNNLKtqjGsdpmH+vLhxGh2sbHIgnIIn
 twfK2ahMJJNdc9+g321aP8QzgyK/bpnfSwRaTSUmYGBq5a1GhXIjtqzgVrdHexoIwmaI
 u4RHVMQT76rn1cO1Pj748JgsOUnLlbqn5GwmX4bOvVSixB0SoEloBuIvspnAyRJFOBhf
 UoUmcreW3rjVhoHYJMtQRjTuYA3Ea4GWXtdY6ivnKCaPwYZVmH8kAQ1N64+GA4ZXv2RB
 qcM+RCSrdcGlrZLgXDbvB7dSooZjZhHtJzk+R9UaBYt2bOhzE+i57Tx6os//4WUb0y9R
 WqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740694519; x=1741299319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQ8oRyWp+zcVZSGxJ/QE5G1tnsxekhvTRwNh6pijwrE=;
 b=A0B0GYH34MzLz7GKkUo8+CqhWFGr0feSOvs4N0uYJs/rw6tYBaZq3T56RMwCswhJO8
 +DgXjovjtq4x3J8wjh9anqrzxH1M9S1fHXAwsYDbszvOmyKUhtMdzt6eNJDfLZWSZpy+
 AkcMskrDMSsymeb6OWiS3VndRn96UNoh0RWmxgqr4dqc1uhOUEBXW2XzVkgdUkvE3l6n
 R5m3jZi53h6PVvNFR+V2rFpIdYOzDg9ZYIAdclv7XDQImqp8xH6jL/rOiAyr4iVEY7t5
 wLqen9hnSF72vFUl63ytTgYOGSO3oKSqA7KC/GO8fUhBmSh+Ppl5HdJr6pky+yddnp+x
 6bZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+VCIJpsSEqTkqOzqV/dIabPH3x+BBPKaQAs+Btrus84AAxNm/dXKNgzM47MKgqgk2oNVVorzb2w==@nongnu.org
X-Gm-Message-State: AOJu0YxYJC24K2a4n2Y1Mt7xnhIlaM3REu2OLgS3mmSI2OaLvxhjbkrc
 63+bzioRaKYgj+ERsklfhmXFNgGmmgLvJe23FsUUPM4SkhJk8bhArmDaRAVAiRY=
X-Gm-Gg: ASbGncsgSPvkEPqVtALLFZk2GZL78UuI3IZgW2b289rbt+rgFkk4N7YRvflqvp0hbSI
 5kkVtZKoFHdwB79qDTirjrOnkJXv6XjuuhLFyLwppPj77o3l/B6teNK9rxnnMVWhnmUzQJfPI+0
 XO9JC2Uw+sTM0o/X5ikkGISgCUCJrsQ2COqYt7Hjx1TdnBrqLDmosUzC8vzd5UOGdgOQE0qzyI5
 YE8e287XzQAAZFvM+UIL4Eplp0e9/8Axi9XNGR2cnc7AmdeDkI7qMKuH6m3cEziMthrST2Ygm1e
 mvL6kXGqeMLfxAwLNriFHJorSmy1vn3t0U3JqmNHd8umkbTjIFtqoqA6ZU6s60vgov/2AA==
X-Received: by 2002:a05:600c:1d82:b0:439:9543:9488 with SMTP id
 5b1f17b1804b1-43ba6727b65mr5835535e9.21.1740694519186; 
 Thu, 27 Feb 2025 14:15:19 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba4c345asm71633975e9.0.2025.02.27.14.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 14:15:18 -0800 (PST)
Message-ID: <172cc542-939d-4415-95bf-6ead94c2ced3@linaro.org>
Date: Thu, 27 Feb 2025 23:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/arm/omap1: Convert raw printfs to qemu_log_mask()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
 <20250227170117.1726895-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227170117.1726895-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EVTMKbHqYIyU

On 27/2/25 18:01, Peter Maydell wrote:
> omap1.c is very old code, and it contains numerous calls direct to
> printf() for various error and information cases.
> 
> In this commit, convert the printf() calls that are for either guest
> error or unimplemented functionality to qemu_log_mask() calls.
> 
> This leaves the printf() calls that are informative or which are
> ifdeffed-out debug statements untouched.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c | 48 +++++++++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

