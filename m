Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3391645njb;
        Tue, 9 Jul 2024 09:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWwwx3BHg0748g3CkAvtiFwztfiVJI50WwbgnRT2dEqw5c8O9dj4RkRW+H587coiXUI+9O6bB8ctZeI03aSL2LIcaTzR+w
X-Google-Smtp-Source: AGHT+IF+l0aJvXM535dAx3uFbmQgWT5172PuRZEhOT9RUy9xhVcXfzKeBPSmfIC2/vS6nFPDABxm
X-Received: by 2002:a05:6830:3152:b0:703:68d8:1599 with SMTP id 46e09a7af769-70375b3de93mr3631209a34.36.1720541854138;
        Tue, 09 Jul 2024 09:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720541854; cv=none;
        d=google.com; s=arc-20160816;
        b=BzugudkqV7zvlMpvuu4CKwvTOnZQd9tI6i+QJ0T5OtP/4lLyKCIjm0Nu4Dp4B/8at1
         tPn/SH5titW5jkh6+QQ9xXrppyIa7lx8F0pNGPLpSYMnAZANSS4S5urk8ARTgOQsw8TS
         MoT9Iho3KGEX3wfHHoKecZVqFizzGSwHgbgVQSO4PmF37Z1dU6HJoxX7iLUAjU4PfcRM
         SSHhGz5LsoXc/F3umbIeZ3HO8oWRtiMvgEeyGruNe6WdYBLwr5GBpImX+ofecXfue/2l
         qVa2Q4U8N4d3mZYyYUn7Zy9Or+7N9uEak+a/DlsyYtsHKH1gKEq/ufjUPwEWwVdY5VHN
         P+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e5jTu8m0he4wvkUxHZKFE/0Z/w0sL1L0Ak74Z3qeqEw=;
        fh=3uYHR+caMZi55h5M7D1P+ozzaWB+prOnt9oMZ59ELKk=;
        b=m5b2eob3N7cp8+/fkRzEQX/rEBcvGU5yLnejKLe263Scoy7D6yCRpMxmc1UF8bOwQc
         ghAlpFgrhs+vZ3HbAeIBnZ/ka1ikSuG8EEUvxtwlLRF5MU6+zKZbXE5fYEmPq8t+uKZr
         P2pBB9PZ7vrRkMM/jtypXN9O02Uy7ZMbmZT1bsoE0rpYGdZOUCuhzqc/oMAgTTCJuJqU
         3I0X3nOJgxbRmDjpnJngzBwYBeLpAjpalaWohKmFy17iRDnPK4Y+hNkyGDHoO1YbR1HX
         /coGCOkg78FQ3PmgBsdqL824tpzYgoRjh1Rg4vwdezwYNh97nk8x69HGzmPC6H5LYsoQ
         hf6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLJI9e5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49031886b85si365447137.747.2024.07.09.09.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 09:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLJI9e5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRDWu-0008Fp-R1; Tue, 09 Jul 2024 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRDWt-0008FL-QF
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 12:17:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRDWg-0007uW-Kw
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 12:17:23 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4266f344091so10705965e9.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720541829; x=1721146629; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e5jTu8m0he4wvkUxHZKFE/0Z/w0sL1L0Ak74Z3qeqEw=;
 b=LLJI9e5VSZ4p866fw3yP9+qf0z9nOPjJoAC51Bpy4lpbTXZCV/UbeojyoL4sfJJmGo
 N+6+3C908/TFHChf7axgqOIZj4MmpR2RRTIXzSpTSDbbWxGSUDahFtGnvfIHj8/7C5dP
 ZDKUkFU0Pd8WMY7vROgsx9IVgSkr+S7jrVVk/FiDZ6zdPlmtvUcG800tGwKh6qfcVGTm
 khg4r5eX6iG8AgF0FIp78jiYh9yC9ncNPVqESASg6ybRLtcM8wsFfNyeqYqaHnXEyl3F
 e5Y2YjRg+XtUn+poYNuXVTyhrIgb76hnJKHzJd4gUyRYItuCuF0g67eu72Apyu+1hN/L
 KCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720541829; x=1721146629;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e5jTu8m0he4wvkUxHZKFE/0Z/w0sL1L0Ak74Z3qeqEw=;
 b=Pw866dtMEiFCuNi3tFQ0TzMXsOg+skF9DTOr7ipKGXREVjdZzNKwpxmW664ZCbPQaQ
 J5WM5uJnil/4LKKIfX4mUNNAULZc/00xAV2a9WKpy5EruuYWmUyI46RHK/p3Q4x/mqn0
 NMbBhcGMhtg7nc0pDvfTwOLzgwxSdbzIizw6vu/Zq4zG8ejfY0XNAJ8UvB57DGejvQJE
 GCM7zoW1rHD2H2EKvP5HBf4VNEjA6f6SKhLVmSdHC8ma5bXY67snjE4mk65jQg5uaGoO
 UcRARjhFBaEF6lxyUY6DIJdlOuAvv82O5lIfhcjbhB/nGB5wyCsgq/6/tIlY36g5IceX
 UWFg==
X-Gm-Message-State: AOJu0YzgeM8B39gxhdxnGtFEqMmyNA2tR+OhUvhycayQFesnDc/U7MhQ
 DPl5GNSOFoZTx7DPBXnUKDTK/uxQmxZ65rDoym3icCgUCJgwKtH6n0acmC5Y1pg=
X-Received: by 2002:a5d:5f48:0:b0:35f:1161:e1a3 with SMTP id
 ffacd0b85a97d-367cea46c6fmr2547807f8f.5.1720541828863; 
 Tue, 09 Jul 2024 09:17:08 -0700 (PDT)
Received: from [192.168.69.100] (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde891cesm2975832f8f.62.2024.07.09.09.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 09:17:08 -0700 (PDT)
Message-ID: <75a83c4f-aaad-462b-bf99-8bf3aef00d93@linaro.org>
Date: Tue, 9 Jul 2024 18:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Aspeed PATCH v47 18/19] hw/sd/sdcard: Add boot config support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
 <20240709152556.52896-19-philmd@linaro.org>
 <77788eda-ee5c-4db0-a890-034dc4995502@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <77788eda-ee5c-4db0-a890-034dc4995502@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: AsXQ76JdChqy

On 9/7/24 17:52, Cédric Le Goater wrote:
> On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
>> From: Joel Stanley <joel@jms.id.au>
>>
>> With this correctly set we can use the enable bit to detect if
>> partition support is enabled.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> Also squash?
> 
> where is the "boot-config" property gone ?

Replaced by patch #15 "Implement eMMC 'boot-mode'".
