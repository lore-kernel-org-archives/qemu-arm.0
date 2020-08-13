Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp679278lfy;
        Thu, 13 Aug 2020 09:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG4Xixlm68CW/KOoW0FIRk4edhL8pR/lpusk83GX/SKKJACELgLQvjOqNf7VHTPDjbCnlc
X-Received: by 2002:a25:76d7:: with SMTP id r206mr7589385ybc.235.1597335961012;
        Thu, 13 Aug 2020 09:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597335961; cv=none;
        d=google.com; s=arc-20160816;
        b=LMPVhWpkKg2KjJvHkiO0ba77UXfNrnGj8qQ4gbDkl1nAwg58CmalvzifEs/znhJZ6b
         PF0C+l05qAs+3+Alx2MEZAes+Xb3U2DZJXIWR47o/CU85uawG4kJymHxXnEEFR5NuXpB
         43HjelK7KVV1Ys630U/0ypDlDeHNQWq87x3YVGkqiPo4r/1/he9lId8bWz1EdNLa0YC4
         vf+QYWmUUoUnBu3FIObMyBLLqPDdEzXVwtz6TN7BuQALo6DRmUSM6OaPiOfiLLR9YkG0
         OvjiPhL15TC0CUuAN+nSFNZ/A+kXYc9ulFJiPvAbPO6yGFXyrNcrzCH8ySl52ZGUBWPH
         m47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wpLEhhn6asYfceAp1ueDPW1rk3OOpjE++dg79EKig+s=;
        b=0fqX0x0p6tKrozeXaulGDG87vkCLRq+Ztj9SF7QPG6SHn9O5zYBAW5Qdukt2srNV26
         7sx7r9ojQn/jDtcvBOVcmxMIxqNEy4E48gkEXTRbVrbXIFT/tWwYFBRCXVtW2WxDKIPZ
         8GQGNaYYZQY7dZQspAC913XilO9LkpBwcSnjlHXwW+BHnt6POAB+zJKIHFDUIZsC2qU2
         aa+WwKp9MEUA0tHuJNlabD2ZnjLpc0GytNIev7k6lsFtGqZCxFI8plkX6YfTa7ip27d0
         vG5JHvR+itueDM+sXbphQFjikp5BxtzmBRTfPwEK08uOgQaYdsyCIe5+Lwlk/cgKvZbA
         a0gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XLZGz8aJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si5128316ybk.368.2020.08.13.09.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 09:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XLZGz8aJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6G3E-0007y4-EC
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 12:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6G38-0007xf-0m
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 12:25:54 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6G36-0000vl-H2
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 12:25:53 -0400
Received: by mail-pj1-x1044.google.com with SMTP id f9so2988813pju.4
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2020 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wpLEhhn6asYfceAp1ueDPW1rk3OOpjE++dg79EKig+s=;
 b=XLZGz8aJH/xOQHLfh7H3a8ItiWRdTMvrJcNavBzPiVoce8JGYLc0O05ZEFLnqBzk/y
 /DJ43zHsL/MVTuZ2kInFgk+ULqYkf23PuGZ9pyC+pdD8lzYugO0/6pvA2WCRgQyX8JAd
 3RbZxYHPDyJgiTHQKt6qEC/19sXH8cL4AklzZsC5iTLZ51np+PngDo6Y0VuxSmBtesUS
 5ce0IH/wuJzSx2As0LEYF44K4BGvkoXXKVgkmUvVe8KSzOuDS67MHBIoxP0bE/H1Avid
 JEXdM1jPg56RTZGPaF+ItkXDhPPQNQn5jtkUHlpR3TxJmmBoF9CiFuO/HO+01b41y+ju
 M4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wpLEhhn6asYfceAp1ueDPW1rk3OOpjE++dg79EKig+s=;
 b=pmCp0BULNDAnbBZOZpx6YB/IbMhewQhAZXfWhIp9fJpnhpWzhpLvqhMQ+2ShX0RqMw
 5eLpEQYGoDkOnWKU1+grvZwaWAA0Wv/ccNjuMMFvaV94cYIRFD3XQsfMp4fod+O2tlp4
 Tx4dPZ0MG+ZHw3wxFGUgmjsnvPShJGQ1254sYDLOCYbjHjDiZGzo10ncCvHkcwdwfrKf
 0B2NJ6OdAZHGq6ltm4fEx57mkPHE9Ur1ARYywwz/9+eA5ALlQJSkHuTzFPxPIggGVrg5
 UvDypILsR1o1E78VxhQFIZJS6Bh4/L9zuiUA8fEduPnu9Qu0+2Wzhr9gFDITMuVnlRqE
 oIUw==
X-Gm-Message-State: AOAM532vmlUctwLS+YFmhloInfY2Rk72oiO+9lVTElua00AyqCx6EMdt
 PkCxWoD8JxjW24PVpuXHtLIl0OpawOc=
X-Received: by 2002:a17:90a:e687:: with SMTP id
 s7mr5957481pjy.48.1597335950952; 
 Thu, 13 Aug 2020 09:25:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o16sm6856048pfu.188.2020.08.13.09.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 09:25:50 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Clarify HCR_EL2 ARMCPRegInfo type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200812111223.7787-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <472d2740-7193-c4fd-c403-fe48094ce1af@linaro.org>
Date: Thu, 13 Aug 2020 09:25:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812111223.7787-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiqOKFL3LL5E

On 8/12/20 4:12 AM, Philippe Mathieu-Daudé wrote:
> In commit ce4afed839 ("target/arm: Implement AArch32 HCR and HCR2")
> the HCR_EL2 register has been changed from type NO_RAW (no underlying
> state and does not support raw access for state saving/loading) to
> type CONST (TCG can assume the value to be constant), removing the
> read/write accessors.
> We forgot to remove the previous type ARM_CP_NO_RAW. This is not
> really a problem since the field is overwritten. However it makes
> code review confuse, so remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/arm/helper.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
