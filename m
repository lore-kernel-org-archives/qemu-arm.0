Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1120368wrm;
        Wed, 9 Oct 2019 09:07:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+3ZwAHdhoF5GHi62vlPLb2lUVY6uk1LGJIv3huOGcMQeh2xgNGSIOs6+VNrTy+JQRJHcu
X-Received: by 2002:aed:30d1:: with SMTP id 75mr4550348qtf.163.1570637244743;
        Wed, 09 Oct 2019 09:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637244; cv=none;
        d=google.com; s=arc-20160816;
        b=W/13cqIZ4MS5/lZAG7Y+nnS6xbjvatpeVEG32YJgbEbpxzDzP4K+Y7Yhnezn8lOdqS
         TSptLPEh6sY8oltHA+oTvVhsRTCl5VcDTcTys7FnXGZ/Y4EgQpjR2xpsSj9D9BGbhxiQ
         vDNHVabqryWK6tHLdyg/24n5uIB4axXPAkT29jtipmINUVbVumKXt5LQAiDlZ9V249Yg
         wRAYHS6AgzrDdaFkSYFQc/fP/3O3jir3OsRXJcHAYFJh5T7eIACd+6dF0KwiZHk2+q+o
         xg6EcjjHtj2aQWO4crSOdMAg06s78CEJcqYaTWPzj0i2921JDN3SvBu62WZlvto/osnS
         +Rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=QpMRAGzqyaKVSZ/WsucxIHXQWGc+xR6gtPuc7Rlbolg=;
        b=SST9Xpu9wdSNmH5NB4VCD2O2hneAkZ8Hx+bf/+9MP8uE5eL+0PUU1RtPN+Mse8rQh9
         Osm470Z/hNmiGs1tusNMTiJGCpQkpWBgpNpJusb2zp7Nnu9ZNscZ8NNibyNoaIAp/WhN
         M28ieRPkw6R7BNsM0PnWvryVceTKViNdNxX3NZDt9/WZYxPpfJ1UGzNT6Dw2EG+SNXEw
         AucdDGsjiFy68CnWLcWr6I7NZWtLJOtl1ohWHeU4h575nAKNCyuKN6ALKlUhGy9G8GVk
         kddNmcpf4nTxzPofLq+UYW9rn+bpq7LIM+K8PsX8yNK5OZFm+WQNE8rTs1x34HDNJY5t
         Nwkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L3MjuNlg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g34si2507816qtg.19.2019.10.09.09.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:07:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L3MjuNlg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEUl-0005rD-Og
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tQ-0001hy-NR
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1JF-0000NW-IA
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:02:38 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:33982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1JF-0000NN-CG
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:02:37 -0400
Received: by mail-yb1-xb41.google.com with SMTP id m1so225765ybm.1
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 19:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QpMRAGzqyaKVSZ/WsucxIHXQWGc+xR6gtPuc7Rlbolg=;
 b=L3MjuNlgOJOkQVn3AvLDwrMN39qiriqpRbt8s11ROImBWeBQ5CtnUTQ/2n/zvd4dNt
 MvOZYyMDhq677B1uy8r6Ka2BXGQZzgjW0sEQ76dJ9WMMp9qypsaFKVT/F8zwsLoMGWlm
 6Znz7Nu+kD+828cR6ki1LO03stwF3Lbz6vbifoCaxpwmmgIHdH1/AXtY3xUOxn8w5kBg
 lkRDchbm9BFrQH+XW7MMnMK+LTYklQu1xh9N0i4vLxM0pZdWFfStaw/W2q66X+FqeLay
 5FX/UI1qEfRl+qaTJ/Z8LBGEMpRzseakelCvr7m6DsDWFtS7dohUWS/DXDPY1YPhGudJ
 4/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QpMRAGzqyaKVSZ/WsucxIHXQWGc+xR6gtPuc7Rlbolg=;
 b=dFwvvTrm3vAmnZrHmPysiEyIaUQQuhFq8i9xm7OlD53CuYugv/4YurKTH/au4c/VQ+
 UXb4qmmzqEq4ux870ThtuS273ht9nXs+yqZpd648WPNrvtF3n7H5EHQiN+agG0BhzmSm
 a3JcE1+AiMsagYJggM3rYJS1uamzMtL9q2Ad5Ubc7eR3CMLD8LlhJRRmeaNDs1YPX/Jb
 Jfll4mlhru+tx2loreSN/GCEV98gym9iRyBHWvJOwFZNO1n3G+YgefyJF8h4CikVaTd7
 usaZxWNOch1foHjdlSF8VwC2HMsSSGjEZHbWn82R6xKAUunloa1dS6Aujf6ayFDoMK5/
 djmQ==
X-Gm-Message-State: APjAAAUDHnz057NsYrF3COLunMHPneIVyVLuuLZnVQvmGL1YhN8BIY71
 XUWdFCTBlplTbgFu+ahJZp3GJw==
X-Received: by 2002:a25:9947:: with SMTP id n7mr479699ybo.263.1570586556693;
 Tue, 08 Oct 2019 19:02:36 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id b73sm227571ywe.35.2019.10.08.19.02.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:02:36 -0700 (PDT)
Subject: Re: [PATCH v2 16/21] hw/timer/exynos4210_rtc.c: Switch main ptimer to
 transaction-based API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ffd005c7-62b1-b2b1-fcac-a157afff7533@linaro.org>
Date: Tue, 8 Oct 2019 22:02:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTipoxa/KEk5

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the exynos41210_rtc main ptimer over to the transaction-based
> API, completing the transition for this device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_rtc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
