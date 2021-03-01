Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3209418lfg;
        Sun, 28 Feb 2021 19:10:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXHNR5MIGeX/dJmEs+WJ07yEn8od6sPj2CMBPe1DeKEqoJhj0nZJURAzbKKxvaWd7QWeE+
X-Received: by 2002:a05:6830:16d8:: with SMTP id l24mr12128297otr.200.1614568239241;
        Sun, 28 Feb 2021 19:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614568239; cv=none;
        d=google.com; s=arc-20160816;
        b=X0tePqJCgWo5wBbGB5f7w4k6N0i1m2SDy2EhA0MVFLP+fhIJDMf6O2GKZ7Es2jO2Ew
         GUo1JCSbHfN/m/Ry+Q17VlJI15evO5201bFPjrmwfbQjDGCYFpH5HsUaON0lU4du2gm/
         O+DtRTNVTWSgL4l32jFB6bbAjTRmVz+Kd6+NUgjT5wnHjMvGWv69aiC+U4KeR3qOeTDq
         iK9yJwEP/HZUhrowkU7z4XwOv/9D6QfcLe46bHwG3osxCR5HUySxT+0kO/1VCWLiu7x5
         FQoqWv37kZ+kZGdYtSwR412P0EHZgtvPidSI7AAw4rdGtpWyJG/BQUH5qFBX4eSV01kI
         LSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f0V4rBAVTx34D3V2OVFuCVAz42KA19tjSpxZqfXk0Zk=;
        b=yf7Oybt7AN5gGDew5rdVFFstajQdwPVX9B9AKrCXHcZTnYBnt3Mmw87nq1EANnaXFb
         5bpz+T5ESOwQp6s6e7OQWOs/hiXurzksDOnohuhF/CDJ8+XXZBP8FEjwC3L0+ImpBLBW
         LAiBksWUTFA5cubf0qRNkSqLvPKAcZOfB2uVAeEVFX22jQJnxshlyB09ao/PkiE9eyFP
         3LEVTu8aK4OjJE7pKIRATrhoJFqzEU+Dy/8jOKQHxRWF2w740ICvtWIFKfKb3u7+uMFv
         Laueof8oFLg6E1o5JpDU0WW22Izun4tnti1Q4vToQJbJFHwFOHbAw13mNATL9Dv2R40Y
         xRXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDspEZ5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si11778576oih.111.2021.02.28.19.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDspEZ5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGYxC-00038S-Fw
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYwn-00037Q-QT
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:10:13 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYwk-0005Wi-B9
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:10:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u11so8976835plg.13
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f0V4rBAVTx34D3V2OVFuCVAz42KA19tjSpxZqfXk0Zk=;
 b=PDspEZ5z71Fh4N7V6D796GVsU7B6bXBp1NMJFadfKBnVcm3HPLLNopzPQNfQF5nhId
 ghx8ltlUA6VOGxYfjfBa5d6A/WxFfB0OFFdwCyjiaIVDGH1d9oje+cxGSAjJIDob1B09
 lso817rcF2mWP9qIYgH9pMkZywrFRp51E8kbFUjF7s/2Wx0h4UuR5edqfiN4mgNdMDW1
 QLxTPdzi4PQKcpO66WzC7pwzwCKIidbqJAWU/jU9b4dBmhwKHXHjLT0R8SSojdivigLt
 yrvuKVKPqOmQjrVBm1Hz/NiVOEWsFX18KX9DB+BqkoATKRaNOOiiFECfhQejKzD+ZH6o
 glxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0V4rBAVTx34D3V2OVFuCVAz42KA19tjSpxZqfXk0Zk=;
 b=XSFbQvS7uPV382gEZDtdNu998LceAsd63lPZ5JiIZq0JB+1a5ysqQI/b6R4Al0FxDN
 WwOQO3Ay0UBoKIZEIvv7uSkfCmAkIcR8djE8y/MmCY7Ed0IsdhI8IEyn+pVYScuMrDYa
 XyNvZInwVhCU/UUXyxPRii8QxaT8bwQ/zr6P9yqHwOaG568yChcHFbtSbt8KdlU3mLkS
 7JMyZ0ypKTGhYBS0kqbXyHXS+a3Nf3SpX1oCESejI3om7eXg4CTvPaElHswX0qec3G/P
 VnoKmJnbWGVqlonmPS+Of3GwBJL/IC5Vw9diYZFBPJ0/uomQvMuWnlMbnMLUzsqmKUnx
 C9gw==
X-Gm-Message-State: AOAM530RyqLbEcgIN0ZtCwgzMIMCaPDOfoA3CZK9+GYeh+BLwp7aKn9R
 RRlsp8QlcY55qXwFHlxY826QSg==
X-Received: by 2002:a17:90a:ff15:: with SMTP id
 ce21mr15344913pjb.172.1614568208849; 
 Sun, 28 Feb 2021 19:10:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l15sm14933445pjq.9.2021.02.28.19.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:10:08 -0800 (PST)
Subject: Re: [PATCH v2 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e448af34-33b4-cead-33be-843f0c517a1d@linaro.org>
Date: Sun, 28 Feb 2021 19:10:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6cu36/6SCtg

On 2/15/21 3:51 AM, Peter Maydell wrote:
> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> reports the value of some switches.  Implement this, governed by a
> property the board code can use to specify whether whether it exists.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-fpgaio.h |  1 +
>   hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

