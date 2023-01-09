Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2113222ejc;
        Mon, 9 Jan 2023 01:31:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuq+q+1UYdSNUpmRiM/0yvSjw9QzmFSBZ2jkXBeNjN0y/47jlzEqj5mzoKgG1fPv8+SAmy0
X-Received: by 2002:ac8:47cd:0:b0:3a7:e4ad:5499 with SMTP id d13-20020ac847cd000000b003a7e4ad5499mr94916350qtr.32.1673256680512;
        Mon, 09 Jan 2023 01:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256680; cv=none;
        d=google.com; s=arc-20160816;
        b=HTulx9tbbLGN37vSccY6tIMoDrMGoYXOxGa3mig7jUXHUxiYkHmw8qpHnAjKBzylEH
         moJKQ3Jqjxt+3jpQ/tKBxEwm1YMfohmWSTBUtK4Z1fxLHBgB51wY1G9jTImT2SkLPlQZ
         Tq/nzwLzf2ljWKAceUFbx+Y+WtP16JX1/5/ZJTtRSrmbAd6PXpbuIEQ0mKttrXRS9Ije
         N/AH5JYW48ZtpDrz2TAja6kp/j0gCf/+PDt62zW9SB2pzCXaHwbFpjiD69RWR+/Q4chf
         SRAJ6lG2+HMwBkuyQ8ZTgdRTw/SdwlTqI1YVEMBM24VnKglowrzYB56EaZjGU3k3Hpgq
         SaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hBlUJ44Oh9WLfFR1ZERviiOLSvWR/WNjWxMzKjtf5Ow=;
        b=UChsPpAlsywb4TddJPeQ1/YDkKJ3jbsp75BSSTKFN2ly/zBULxtumkyCIv5JZIB8LU
         MXCWewyw5ltic/XpZPRZqXw0r+PR4NN1HAoSSjDRt3FsHt73Kp4daS6jvLtkA8zfiZ/i
         r8Q4fguE3JL8sCHqYkmhDPKDxh+IUxy7hof0++bTQ1JkEB8rYFNzYcMPXF/qDWbakKvJ
         fkP8lr9eb3EropgUT2nfDg4BBk57aDhpgvnII9QXiSixjhmyP/kPaFvS6LQVu5iCisKU
         r+B6uVMNONE2x15tYvk6KraKpcrIWaOvCiqJQX6174+Rz1fOtB8roiXWDxWzS1A7X1XJ
         6fdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jDj8EEbp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp7-20020a05620a458700b006fa18244b2esi4210361qkb.116.2023.01.09.01.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jDj8EEbp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoTa-0005Xs-Qx; Mon, 09 Jan 2023 04:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoTQ-0005TN-NW
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:29:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoTP-0007ud-2g
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:29:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8503169wms.5
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hBlUJ44Oh9WLfFR1ZERviiOLSvWR/WNjWxMzKjtf5Ow=;
 b=jDj8EEbpfNzOFNPoctf4POE21E3pfejeXgh0uoKJNZ9Ezqml1hej3nhGCxklTp85if
 NKYfGf1SR2t61jjw8AOlDWleSKNOktCLQQcMt7EqQccB/QQXKdfq+kHww5mHpN8kMJsv
 F573MpTINy0COZzgQMN768LOZG2eLeqWkGCxgiOrUYeZLmNjonamYFo+B4V6H+PiajZk
 WkRwi6HgB7fSJfye3R8ruM4x6YY/EuRVplJQTTh8vfx0FgUSn7vRNbe2ylfqWBKJc1Pk
 8GK35xMU8rNP5P3UgHv/sMmtG2SUiTgQTTF1zruXNoSNSEuKK175Y3eSWijcgJdZP/b4
 CvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hBlUJ44Oh9WLfFR1ZERviiOLSvWR/WNjWxMzKjtf5Ow=;
 b=21iz38DXMFPDMjRZGt2v/7ut4OMiELeldg4rIXo0PvsteuNGc2O9n9iD3qCp0QR/xd
 nFpTnZYYl+Ng+6Hzkkw5PYcQQiSal3n6au8bnldWycQ9bhC6ZjDf5nA9bdhqjl6MpJ5v
 48VPjBJfTBRPQheuTEeNl+GDFNqndpwVGX8hhuhxaIQ7sLF/2gxnCDQqP1JAqhNd8j0g
 Tp8+gpjXIaZA6N1CkVlNBvtrpIYHrDYROYAKJfORY4l+O53GLXcDyWRxrXzQVqcK9Ii6
 rMidzQrCenz8sBLtEzirl3R4qnAA5sQJ6qDkEG+QDGSxEpkH5ftBLvALT6/hsLJGqbIC
 LMBg==
X-Gm-Message-State: AFqh2kp8d7u2hY/eARX3NK8xaCO98FmnMz8ISLBQww8ZwvD0ed+iStpS
 QLbO9SPBeNmzT3Ce3KmsZFdA6j50owUUEzC6
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr55871873wmo.36.1673256581389; 
 Mon, 09 Jan 2023 01:29:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm11431298wmo.3.2023.01.09.01.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:29:41 -0800 (PST)
Message-ID: <e901bc9d-1c3c-5cc0-7a59-e55816babffa@linaro.org>
Date: Mon, 9 Jan 2023 10:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 5/5] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-6-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109091754.79499-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gVExqVQgEY2v

On 9/1/23 10:17, Philippe Mathieu-Daudé wrote:
> This device model started with the Versatile board, named
> TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
> as per the official "ARM SBCon two-wire serial bus interface"
> description from:
> https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon
> 
> Use the latter name as a better description.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/Kconfig                              |  4 ++--
>   hw/i2c/Kconfig                              |  2 +-
>   hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
>   hw/i2c/meson.build                          |  2 +-
>   4 files changed, 16 insertions(+), 16 deletions(-)
>   rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)


> diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/arm_sbcon_i2c.c
> similarity index 81%
> rename from hw/i2c/versatile_i2c.c
> rename to hw/i2c/arm_sbcon_i2c.c

Sorry I forgot this hunk:

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..a3c7748505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -940,6 +940,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
  L: qemu-arm@nongnu.org
  S: Maintained
  F: hw/*/versatile*
+F: hw/i2c/arm_sbcon_i2c.c
  F: include/hw/i2c/arm_sbcon_i2c.h
  F: hw/misc/arm_sysctl.c
  F: docs/system/arm/versatile.rst

---
