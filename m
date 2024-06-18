Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp727689ejb;
        Tue, 18 Jun 2024 03:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU18Akv7VE5Ng8tJ4S0U/4bRcSur2LVKEYeR0uoN85reoH55yhosC4J3c1RZUuTD4+pgEFEcdEuYsc3AQ3UHbkrR8ND0JgE
X-Google-Smtp-Source: AGHT+IEn7qCg1o4DFXIo3Xid0LzFC+k+b86yT0pSTolML/cHNHlA3Nxc1xyCKSzKD5rTnZ0b4/yW
X-Received: by 2002:ad4:4206:0:b0:6b0:81c8:9f54 with SMTP id 6a1803df08f44-6b2afd8da1amr121592946d6.61.1718708095613;
        Tue, 18 Jun 2024 03:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718708095; cv=none;
        d=google.com; s=arc-20160816;
        b=czJ6IQ5cck09inMursGJo8huuWkHuyTmnvTbV71KX1BhvNtFCTgcLdaBrFtw/rNZsh
         7tcDkKdU8dHmdpftH8M8l4xOyd4mzJ1duptapNRhDAY0FqbiBZ3Ttm2oAVXajgSb0jwg
         xR2EnSNWGxbRb8QB/N3kxZgMGcxaN4LmCm6p3/1/jKVeSdGxAgDgu2FNA8IxWa29R/oj
         3qzinIetvtxH4a9o97BM8/UCjrL2X8WC+WxQhgf/u4rWLjpRU5gveXtfiBovYeNJhJ+T
         DWaAQ9iJ1QK1s6Roo6v8UmVygY4GjlGgCxM4SbdR6izDN18PEY4ToTo+JKRyY1PfQ0+W
         liYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xgIw9IKUSsnidIbwU0XCTiXGMITo0Ef+Km6UW4Y49Fk=;
        fh=/THEWr1WCppVR9aQlkEj0ZlVgZe/lDKoatzDmpxqrPM=;
        b=XIyOQwSvUNqVA+1wJGfJF2h9L5MOOax6C7wRWGzIrgoBfdcksAOu35uZkkqpjCMk2+
         +SU80U2OLKd2X6jqQHu6L/buy5GI1NsF4cSAbqtKNPICw+H/7RfgqWJKBClZI/RykOFf
         sDeP0C9HIHyodeljDZKn2KR+WziF7aF3xNaWEOmLx2Yw66FioV7zYOqsR5QgtFUM8afS
         //09Y78THjtKLl9EhrlcqXSxEMxjYszUzwpKOzllF1wNczf8DV/jr9OA6TL17RyKcOL6
         U2Z5cM9J5XWmBbi0A+5NyAzlK558PB9cPpsAp1L3Em9wSZHVVcc6byPgBUip3I733iqG
         2eaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aCF/d6nf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afce35si112346186d6.261.2024.06.18.03.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 03:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aCF/d6nf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJWUA-0003ea-SJ; Tue, 18 Jun 2024 06:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJWU9-0003dd-7T
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 06:54:45 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJWU6-0001fo-9K
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 06:54:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f7720e6e8so267372766b.3
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718708080; x=1719312880; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xgIw9IKUSsnidIbwU0XCTiXGMITo0Ef+Km6UW4Y49Fk=;
 b=aCF/d6nfyQ5Q/E4n0kz/gKvAxgGNZrpfaBwv4JTHxjnTOnrruB+YJBvKkcKqMa/17y
 SjBhFdk8pI0uuPfl7djQVDDvUnWl0JXAACTqudqZzAXacywrDE7AWXzWJTz3x3v90q0e
 GsdnGy8j59l3GJU2I6Z/ZOi3UAut9XbxmlZgzeTTpqfoYpMgH8OGkYauyOy0vTZRjAM5
 sOG6kdtGbdenis97fmqXj1NpqM8i+1rqm0tW/eDGqfMAGo60HpIBhGgPv53kHtPeFNw6
 0Zf+PJ110IhkzdDIu34vakkgmALSJdODAjKIN8KfasfBie9pmn1uGng2hG/Eq1+exwAN
 J1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718708080; x=1719312880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xgIw9IKUSsnidIbwU0XCTiXGMITo0Ef+Km6UW4Y49Fk=;
 b=v5lPMguAiM9HZAwZ9sU5jmMC+n1t0H8eIpwBFpmEDg/4cwFPFUdB10C8GfwMcf/FAm
 FSwLzXrAXi8kNqXyZV/TVYXEWQLQegp70Rsrg18B2IW+sdGs8uIPeqFHmYqjM1r6uHNb
 C57P5R/6u8HU2CZxC+5b7VoXZL+GGpft40Li14jVo8Ha0C8IW7DW1tdgf4vnOukxhNNC
 uHqpSccqY/B07v222Ihr/AC05R7icUYMyLXcwWJ7XaK9pcZ5uSHD+S6vkYb6Ctnm4YdY
 y2MDOMkNVD0/hC+j3fgBXD2yz1p0ztb3UerisQGmYSW4F33xmPHOAVVmaw24IJOWAiYG
 Ckig==
X-Forwarded-Encrypted: i=1;
 AJvYcCULTpqTcONmGAAXYtj64mliXpr++HYSbrccNBo5egt4knzQHs+Seb2dktUnwMEfY2zmgDsoX6cAnPYVxRTmU8VN+06n
X-Gm-Message-State: AOJu0YzQ2fn6U73OMieoSJW+2+1uFZLVOjqAFzRSyNLXCtqmKEXvZoR/
 n7XpZc4gqh/gxfXwKIBQidV0WHjQi+sNYUkCTt6rN2AAH8hllcnyYiJVF+/+nOs=
X-Received: by 2002:a17:907:c086:b0:a6f:6389:4aba with SMTP id
 a640c23a62f3a-a6f63894c9cmr1099538566b.3.1718708080320; 
 Tue, 18 Jun 2024 03:54:40 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5f1c8d6fsm546611866b.0.2024.06.18.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 03:54:39 -0700 (PDT)
Message-ID: <dfa19fc2-b049-4856-b118-b7e5cc6a92ae@linaro.org>
Date: Tue, 18 Jun 2024 12:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/dma: Add a trace log for a description loading
 failure
To: "Fea.Wang" <fea.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
 <20240613013501.426905-3-fea.wang@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240613013501.426905-3-fea.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IPUxFSs4SmB0

On 13/6/24 03:35, Fea.Wang wrote:
> Due to a description loading failure, adding a trace log makes observing
> the DMA behavior easy.
> 
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   hw/dma/trace-events    | 3 +++
>   hw/dma/xilinx_axidma.c | 3 +++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

