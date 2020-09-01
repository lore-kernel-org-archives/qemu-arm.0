Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4805503lfc;
        Tue, 1 Sep 2020 10:52:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7EdXqZfeH9ywsmioBVZTYHOTKkJwLGkQ8RaJX4zybiBE+yR+MASaSO4dnQxR4AV/i3iTY
X-Received: by 2002:a1f:b254:: with SMTP id b81mr2647448vkf.64.1598982739761;
        Tue, 01 Sep 2020 10:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598982739; cv=none;
        d=google.com; s=arc-20160816;
        b=N4l7xcN7W1MgCksE8ZF0a/QUklPxTFGWsNMA3Zkh8UDwM3MFz6rFPhTseuJmUWN8zy
         f8W2pAadn/5qV70lKLkBMgt8jKsGRQG/LLB0OLxx7GxQy/ww9sSQ2MBodgRt0qNT1u8+
         nsS+cEzrZlDjME/P8l7QrXISN1AnoRapv5h4OTlsuC/kgZy3xHWaQN2jIIMrkTWSRV+/
         rqkS+zmAY5BOkl2TpFJS77M4fImcCp2R8NLIPMnOhsW+GwJtP2+LE09rh1MfcGh47TjS
         EX0bGs8U/ONlDaGtaMVmqVxS/x4a3hHf2LbPyJCzIxp3LccF2MffgUx8BAZrpRDfW0En
         6ZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iJn/yZuTvtlfrDCaKJZyfnG198ldJ/I47rjZTHt+fLQ=;
        b=k4YCbvUs9Yaulh+lXs2dzSxs8BVA5JHtk0OK7a1lNvkyD+GeP/r3O0XifgpkIiCa3u
         LkOQcmsmOOyrfJl2xqiLrEm9FJ+Iu8EuJ7K3+6et7xcDLYwTzE51B1+aGPSmkeN2ArMS
         KLFWB19/+7DtEFUrqAN11wb8DUf3/CuIbZFlnCjaWrPIWD0dEQ3+DKUPABvLlLDEZTHu
         SAe0dPaSHBh3e6aGVOGvGZQ6UBpzrJWPTWk3uVGmmHn8n84rQi2huVp3TESFWBYZCNCW
         IfuumFnSivy7xwki651AQ6A0fCuXUASau7NjvkvuIWqRTFYEbA9FlJqG+f7DOm9JV7O7
         nfeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doomOpgB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o128si710971vso.308.2020.09.01.10.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 10:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doomOpgB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDASB-00055e-1R
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQE-00035i-IJ
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:50:18 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDAQB-0002Z6-Si
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 13:50:18 -0400
Received: by mail-pf1-x443.google.com with SMTP id o68so1238026pfg.2
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 10:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iJn/yZuTvtlfrDCaKJZyfnG198ldJ/I47rjZTHt+fLQ=;
 b=doomOpgBlUtVvUPch5YdQwj7eI+cc7KRwbQd8lIlMTi9wVgMQktCI7yzmgUdUDI9nv
 E1lJi1Icm3aFRw4/ULEGn+yeu2I0K+H9DId7CFNWvvqNniZNY1BlacoN0BHW+2Mk6NOP
 anndXakvcQpru1oZSd7XZkUATGpknbZq0tTPp4wkfg1WP2AZ+XXpKhv2W7MD8drcNs5n
 6ItPRTWNAJQLO8gqrD48fjSCnDAjbtwAkDtkmybbR2/Pc5Olz4mZMki2xlbiHqcB3csF
 /B5DjTBJV3FwfHfCaXk7rq4AxHdYJXJzkQDJBimrO9dizZKR7WvYKtOkfXE8gSmbZEtV
 bf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iJn/yZuTvtlfrDCaKJZyfnG198ldJ/I47rjZTHt+fLQ=;
 b=mEmEoLS66LiNyu3ACRadteD8aM0EiQPAYPVij2l+o83lWhvLItafG9ymiOwvXS8GJW
 87AaOJpvG7B3R1BVfBaF85/fkSUz9L4mgEsgJZEOqK+4U1OueLMg2p+qvfSNSJ4db9WJ
 gJSp/UDuGoErNlbgQgzpxU3u3pbMFLqqDI/Dlcnc+5m7l31lRX/yCsGW+/LYJfdiHinY
 pFGIVBI0eChtI+PkijLpwAgHNEvsWt3CaHI4vVk1yZfdpYT0VOytNB1yu0LDtjKrQaRb
 z5hBUumhwXQHFYf20Ij7ZGt7pLmU/i5MiMs7xfwNam7QCxJIsfWGhqG49BWFFRUeGMEb
 yX7A==
X-Gm-Message-State: AOAM533ryUgT+TNYJbLlDLCb3onlbdODgH4oDiGEJwdBru1nbE2VzHDI
 3WWjeav/ToXG7sZXHiZFYsEjQg==
X-Received: by 2002:a63:4405:: with SMTP id r5mr2470508pga.382.1598982614591; 
 Tue, 01 Sep 2020 10:50:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n2sm2656496pfe.208.2020.09.01.10.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 10:50:13 -0700 (PDT)
Subject: Re: [PATCH 3/5] hw/ppc/ppc4xx_pci: Use ARRAY_SIZE() instead of magic
 value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200901104043.91383-1-f4bug@amsat.org>
 <20200901104043.91383-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69fde22f-6a2e-dfe7-20de-3ad7c5ef36a3@linaro.org>
Date: Tue, 1 Sep 2020 10:50:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901104043.91383-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-trivial@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emjTBsPkE5PD

On 9/1/20 3:40 AM, Philippe Mathieu-Daudé wrote:
> Replace the magic '4' by ARRAY_SIZE(s->irq) which is more explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/ppc/ppc4xx_pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


