Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1530303njl;
        Thu, 3 Oct 2024 08:54:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVb8zUliNhQBvNQ4G8L2/CS9cPdyQO5rfqtC/ary0O86rCo7aCH7yTGpVMsWJ+7Y72BtxahgRPsvyqotQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE759zq3q57Y6kH4nHVd6mjGLsrOty8sTWUlkG7PB+qFhMXm5IDj9Tp6mUMmyuRIgOWaNyL
X-Received: by 2002:a05:620a:4625:b0:7a9:aba6:d00f with SMTP id af79cd13be357-7ae67e33eeamr631331385a.8.1727970849711;
        Thu, 03 Oct 2024 08:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727970849; cv=none;
        d=google.com; s=arc-20240605;
        b=fQMiOj0nGSxfORZkifNZxe1hkUzVnPvbVDDEZxalxatktK3A0NbJln+iJ/UlPYOZoD
         j6bxauduLZdGg3kxlUixetbmExTPWBrSlvAR62iq+IrSBvBYSOU1bzy03Xh3L9X048Yl
         Aa79RtKS+KGGVv4VuzzdS83lGtHLAMczfe+I9DwZxfIxR8D5TBkEh/An/xCvNp61YVhs
         rKfCyvyjl2faDHSJB3qGdPi1oe23jxrk9OmDPCkvNvOc/5m/4anmr/IbDf140hmyTdNZ
         8cdhQSP+dIQGmMao8gueh4s55CMKnFWhKUsC3LnM93xqN7L3Hu523+Fwnan3z+2wK+ou
         eCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IjeBHXjlzQSNtx38IpNpXzQgASImIGzCJUFVpITmfMU=;
        fh=m6NLIPfOABRRBEdGzy56WZJMtytGh8TRRl4j5zDLcEk=;
        b=ct11o0FW3WcaMY4VEdqUbyIobJJTk8V/SI35Aw1VFhiYipk2byyctPsOeEslj9ELjl
         VUXIY8iCC04N91upIYp2AuZ5yuhXBMEa0dDzGdOTDs1Z22eQ+DVYbMWQ3oOo3CVMAGU2
         7n9jnC5f469y5EzShVi6PvmicHP8hZsxc9zb2pqFaeaj7GB/PZ+2TwBvnYp/2iDma+lq
         hyU2lSwJjnpoyx4pYVuJrUma1RkpzgycrlJin+fQ7rTdLTJKYIosZx5VGuDkZ7LXQbvr
         cpokpU/LEOJ5cv0mztw1cdU9Vt7zK8uxUJGzrxFTdn51icrCdpyeBY7NDRAfz2ddWNKK
         qOOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZ8wNRWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6ba08b23si123619985a.445.2024.10.03.08.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 08:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZ8wNRWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swO9T-0006Om-D3; Thu, 03 Oct 2024 11:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9S-0006OW-QY
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:54:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swO9R-0003NJ-D5
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 11:54:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cba8340beso13330935e9.1
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727970840; x=1728575640; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IjeBHXjlzQSNtx38IpNpXzQgASImIGzCJUFVpITmfMU=;
 b=UZ8wNRWFwxsMCrHbPJQjfNLLKQ07BWZZH7HMS1IQD5nggJV/20jDqRX83MGPtTf28E
 cuwPm3SkRTjzAOqqW95Dm6AwedXlf0vPaVI1A0dahlWeqBRdDwY1+xSGVPDQAuPZXRb2
 CLIKSuDNKt5W3WJcn6mHmxLlNJOySG0gJzO9OPdQxCHRv5zmHdr+V5ukUvmqTCk1FL+s
 CuTi5gWYYYc2ufo1glozPat7K/pm/Yr9hhWMKQVO86Jd22sxVmWf1Z4Tl0ipvSHTDd65
 hn0wHTB06GGP/XGITZzKjcMYc4F1cPLBNXNPVMQEHv+uH9dz82lDkvWmhcJ2w3uzc5Hh
 EmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970840; x=1728575640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IjeBHXjlzQSNtx38IpNpXzQgASImIGzCJUFVpITmfMU=;
 b=Z0i2cKRYk2vXdiV3FSRvaQ/893UiJAu9DBpLOxtQnCYrQRxvq+FNbCUae4JoQJi64t
 zjwSCO6yCVhzDJusL61JR1/tCP867aE4hW/wHR8ttKYSoXpVdTSwDcBucwsF6+wuiBpz
 e9KWpVonPDWn4rMwYmewfdOZ9QuttXLMVCFm6y6hbUGj+RZgf4Z83f8ZjBvuP+eHWQte
 Diap3UkeN426/O/1wX1ERc9ZGVDomy0lO55cgSL85E0wZ9pBQsjCFPJ9DDkjrIpEDP3c
 9bYjP+ZDJ9/FVKi197aah0nvlXxesQ8/UQ+vE424/S1lpl2A0B+xyOfN++0k05npMehf
 KVww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMtz/fsEftYw3WzgZg71TZYCP4Jht2Ju5Ym04rq0o7aEOrIGxa5rs4lwPIFyUe01SRUowNjFHg7w==@nongnu.org
X-Gm-Message-State: AOJu0YxhIsolh32al6QHkyrwU4yZ6ZBuTwpA++cWqbsih3G/KilNZPXs
 /yr1Ms+ok1AN8UQJ2M446e0X+2nCnAZj2RpQJuMCmt4saa3W38OP+QxYMbXfskU=
X-Received: by 2002:a05:600c:1f90:b0:42c:ae1d:ea4b with SMTP id
 5b1f17b1804b1-42f7df9ff6dmr24091055e9.13.1727970839664; 
 Thu, 03 Oct 2024 08:53:59 -0700 (PDT)
Received: from [192.168.13.175] (49.red-88-29-183.dynamicip.rima-tde.net.
 [88.29.183.49]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082425f5sm1544489f8f.50.2024.10.03.08.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 08:53:59 -0700 (PDT)
Message-ID: <5ecffa01-9c8c-4239-9962-c8bcba26c1af@linaro.org>
Date: Thu, 3 Oct 2024 17:36:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] hw/ide: Remove DSCM-1XXXX microdrive device model
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20241003140010.1653808-1-peter.maydell@linaro.org>
 <20241003140010.1653808-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241003140010.1653808-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: UXMyQ9PS2/iO

On 3/10/24 16:00, Peter Maydell wrote:
> The DSCM-1XXXX microdrive device model was used only by the
> XScale-based Zaurus machine types.  Now they have been removed, we
> can delete this device too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/pcmcia.h |   3 -
>   hw/ide/microdrive.c | 644 --------------------------------------------
>   hw/ide/Kconfig      |   6 -
>   hw/ide/meson.build  |   1 -
>   4 files changed, 654 deletions(-)
>   delete mode 100644 hw/ide/microdrive.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

