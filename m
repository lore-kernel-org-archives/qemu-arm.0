Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp650390lfg;
        Sat, 29 Feb 2020 11:39:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTd4pDTYeBqGoy9Lnq6Un4Za88Gj8c4sVB6oGZcR8v208PjJqk/iZt2mr9SvcXWR1wJYUx
X-Received: by 2002:ae9:c114:: with SMTP id z20mr8265430qki.19.1583005142839;
        Sat, 29 Feb 2020 11:39:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583005142; cv=none;
        d=google.com; s=arc-20160816;
        b=IgQbO/tQqnn+51NTydEeATJ/z1UMjUOdKSRgb1GxfBf1tBXDdKwgYYsvImn0EMBx3+
         +DoyzDbzr0UbXJ+AjMfldqLlMBF9Qct4k6WQ4zfSXMxBy9+mSUhRNrEA1xYa5wAaUTjY
         V29gQPPMVegPTDIl4SFMLlimVZdFBE43dd/nwOQFwSecdcPTimrlABm6/A+GqaW8rNIk
         jtxY30TloeRPtGDjd/82UMPGvLS8p6GEBwkR/neY6Y/mNr/vcaV9vQVk0L7TAgQIJz7a
         nbKGM/uqy7kfom3nqZiN71eCBFcw0kVzu/ddezklXGMITJnVhrVBlk3FYtP6wEJMA6+5
         C2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=StRG4BSuxFQ2H38OzVfgarWR3LEb8zLZ+DGlIBRMe7c=;
        b=rVLyJxsFZdPpKgAS0PJXrcPp3M3Ks8x5Osnmrl7/CgkYfgxSPw1e+sNH8Dr1WjpxNk
         8aKsEyMGNSv+njHRRZIC6iTR3FOIjaU1wxbXMmaD2XFjoSy5VzxBp9XfdqTcxlOJOsaA
         EwmJ+5Coligm0I1dcwhHSOVm72ghiM3wfjl80S1f8isaUiV5xHxuoenqfzV2CXWHMS8r
         PTqTmvhtfPtLkNQKuDxqrReUJLQvfFNKfRCpsRyUgWqNCVF9eFJXj/ew1+atMzdoFrvH
         UBUo5caRbfeDDwVMbaGS+aQfyBB6N9nT4AjrS4LEqIpHCZtpIKb2JZd53dfj/qLbd+f9
         nbJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgbJV2S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si3298547qto.189.2020.02.29.11.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 11:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgbJV2S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j87x0-0003W7-9Q
	for alex.bennee@linaro.org; Sat, 29 Feb 2020 14:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j87ws-0003Vd-Ky
 for qemu-arm@nongnu.org; Sat, 29 Feb 2020 14:38:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j87wr-0003zm-FJ
 for qemu-arm@nongnu.org; Sat, 29 Feb 2020 14:38:54 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j87wr-0003zQ-9d
 for qemu-arm@nongnu.org; Sat, 29 Feb 2020 14:38:53 -0500
Received: by mail-pl1-x644.google.com with SMTP id p7so2582886pli.5
 for <qemu-arm@nongnu.org>; Sat, 29 Feb 2020 11:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=StRG4BSuxFQ2H38OzVfgarWR3LEb8zLZ+DGlIBRMe7c=;
 b=ZgbJV2S5fvjPN7e3KnkuHzeJz6ffDFLb5zJJc3LbX6T9ALwhJ/Dp/YjtCmnBykg5dl
 hjcVh6MaYBwY5aJLue9AlGkx9Lte4fCCLBIFFt4y/9rAT81L2DhUd694J914kueVKAlT
 fowdmdHpjBx0vW4HA6NzDV/iiHjkWVd8Mr4zYXHXRyGvcyt6S7VsHPT8iqccZ+2Zoh0/
 hkObkqyWD6EDBXeLMshaZQxCazue0Xr/pC1uniu0RIaEMSR1KszGCHiy2BvX6314BM+U
 mzdrBFNvo/4QB7ZpVSzkP1n2DrxsMAWrN+rKGcy83y6+ydHxrjicJnmuuqA/ZrN/WWdB
 hCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=StRG4BSuxFQ2H38OzVfgarWR3LEb8zLZ+DGlIBRMe7c=;
 b=dV6lhjypg1Yboo5O3l+qVMXB1/jfbuXIXmToBICxoCN6fqD5ojym5mAw1Tc874Njxf
 5ACS/v0eNgnmniFsZLUsxZnR6cy+ZUA+4i6Xn0xTEPgzuoncTuHY5FjRk2YxaA3IcTEP
 JYGvDdXQQajsvikDAmC1qcUVPKmmlx92bHrqGijYSaEoGws93227Z16sf3MxGvLaNeZl
 bHl21no/1kkODVTlxxYJGPmV2eKklrbNMZRV7BDhjQMCMCkZ2JbjmW9rBtCGtSOMPY60
 qfFB3Gb84AyxDaNAh4l1LTrrrVppQozVqTenZRyicZVwGANCM/EmwACG3gkGcM1Zjz1z
 zzhg==
X-Gm-Message-State: APjAAAXCidK8sUA17/NWVCobsVvCJWrpWqRrYJ96nvudI+YAw66PX5u+
 dF1111FvIUBQCZIpWW1mL//mBw==
X-Received: by 2002:a17:902:6504:: with SMTP id
 b4mr10129785plk.291.1583005131985; 
 Sat, 29 Feb 2020 11:38:51 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s206sm15912403pfs.100.2020.02.29.11.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Feb 2020 11:38:51 -0800 (PST)
Subject: Re: [PATCH 0/5] hw/arm: Remove big-endian checks on machine code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200228125351.29482-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0899e78b-0082-a826-2e15-b44c76e6c716@linaro.org>
Date: Sat, 29 Feb 2020 11:38:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228125351.29482-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDR+jzKTHX6d

On 2/28/20 4:53 AM, Philippe Mathieu-Daudé wrote:
> We only build the little-endian softmmu configurations.
> Checking for big endian is pointless, remove the unused code.
> 
> Philippe Mathieu-Daudé (5):
>   hw/arm/gumstix: Simplify since the machines are little-endian only
>   hw/arm/mainstone: Simplify since the machines are little-endian only
>   hw/arm/omap_sx1: Simplify since the machines are little-endian only
>   hw/arm/z2: Simplify since the machines are little-endian only
>   hw/arm/musicpal: Simplify since the machines are little-endian only

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
