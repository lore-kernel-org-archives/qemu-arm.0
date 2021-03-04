Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6445218lfg;
        Thu, 4 Mar 2021 09:54:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydCCwtxTBQ8AHN3z22M0aVNK6R/4ZKi85ysUb6G6Gd4lv1reemdx9PcE1DUDVXq9WdYvyk
X-Received: by 2002:a05:6602:2590:: with SMTP id p16mr4591797ioo.21.1614880474559;
        Thu, 04 Mar 2021 09:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614880474; cv=none;
        d=google.com; s=arc-20160816;
        b=Bly4lKwWEl6dMSClXi1CapDaTmzD2NzXEg/yh92lRQnFGfHylx64zwqZWTeionTHuD
         9Y+gDys3u7rj6vvlgZvD+J8o1dRDoE01qpaPQQgI65PKCymndVgUM1BLz2IC/AkF4Lgs
         z30fpHuJPA/Fk/mtQDxY42N8/KGAouID/JsOvcSNbES+udxdfAQSzDLXEt7J1jghxp1F
         uqAEIlHY6+MK3ZFhlOc+2LSH0WMTNx1pNsOttVLJQcjUdVGNVcyhz3DbRZvGYIxFLFx6
         AXtrNmdy86VfhiH0vg6LeW44R4Eg0BMQQQkY26AA22TTnqlna8weGfl69p9lOTpqSSdh
         kV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uo/PFc/+t5LfIOm1CBanoBkXHmi9lYlCT8NTA/FCKWA=;
        b=iBzc6u21/QsHsma8ytfgdqk6hfG/+DLpi5C4CsbjaBoM0cNFAA6idd4IME4txu1LYO
         pl6ZuQN2A4aWvDhLacEs3JT9dHSLRMZFM/+kn/gqWqh5u27e8sXV8BlxHU45t7hog7p1
         cNzJ6nYdESL3vAOpZ61KMxMD902t5hBq63qPw05EhiuDw1OYTk3LQ+8nD+I+f5FBnUXW
         hWkXaOR7ilAOWcvb7ZsAn/zD0fi4IFflnKS2nBdVzBTbzT8VuCKYyiNQ7HAKx+3EYfmR
         Lem8ntvyA9JOs/ElbHgqKBy1B5JIue/naf79Zm/L7a40u47MFaEKhN9DhPXavAhfg5ri
         0xVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeEUSolu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si28836jao.83.2021.03.04.09.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 09:54:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeEUSolu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHsBF-0000bW-ST
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 12:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsB3-0000aE-2a
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:54:21 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsAz-0001jv-1a
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 12:54:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id d8so6150335plg.10
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uo/PFc/+t5LfIOm1CBanoBkXHmi9lYlCT8NTA/FCKWA=;
 b=UeEUSoluu/6KkqM1DLnlF6g5Flp42KhHtssVn68/f4bFS+SDK0XJQPoQU85zH73d8O
 7EWtq3mhJRhyxeIsjq5ILEI8oWneZ0F+pRSVmsnM5DPFIVrXYGcHsRpGKkpBXcZXZFZ8
 FM05GdawfGe+VcSWT5oLkOBXgVpY3XvOvMKNOO3a4egYLmCpnCopnqXrAbbbjfN60IAb
 Oumky7e5r7X3rPV/mqlaxV69FxYrZ2N7Ld8c+bq5IcVN5FbxN329gVSYsVdROYVwLXDO
 CcoBvzTk9nGNk/FNVeR1edEPgG+u8zJtPdcmMKpHbatNiVvSaXNYArWKMq3Tln2tba1b
 9MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uo/PFc/+t5LfIOm1CBanoBkXHmi9lYlCT8NTA/FCKWA=;
 b=jVmtw3OxuRdHjCaMHh+xld9NHnFq4cm7ef7arUJa6eDfjQMRGMiiE8Jr1Ya9LPo1K0
 6r1kR+UNmYZBoHB6aFUSTn4YqJFlnc9x8rGMZTXwLmQ/mAcNVRQxesRTgOqb72AW1Srl
 83VH6JMa7kMyytY4K+WAse28sU6JBaO6+dq8A+1bONkYLgxzaDALqTCeBQJEJ+F223tR
 ztCDoDRzbMhScVu6rXEVdeHsZUeJ6RxZJMibE7dxjOLR+CXhBrHDbu592e4sfwLI/Sae
 q+CBncm6txeDb+IyK4ibQE0HQ3Qs1MR2JIbOLho0arElgLIlfIppcFeVgVzVb6mFue59
 aXtw==
X-Gm-Message-State: AOAM531x2Lb6Eo8lghJhCSTnU/GjfZwx9dtd4/0SbECwv16xYHLyJ+L0
 poUXPKB+rVQr5FrragD5Ndk8qA==
X-Received: by 2002:a17:902:7407:b029:e4:9645:fdf6 with SMTP id
 g7-20020a1709027407b02900e49645fdf6mr4845013pll.19.1614880455373; 
 Thu, 04 Mar 2021 09:54:15 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mm12sm10389402pjb.49.2021.03.04.09.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:54:14 -0800 (PST)
Subject: Re: [PATCH 10/44] hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and
 IIDR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b88bf72-7317-73c4-dedd-30e7e3c1f208@linaro.org>
Date: Thu, 4 Mar 2021 09:54:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kQkuJO9xecK

On 2/19/21 6:45 AM, Peter Maydell wrote:
> For SSE-300, the SYSINFO register block has two new registers:
> 
>   * SYS_CONFIG1 indicates the config for a potential CPU2 and CPU3;
>     since the SSE-300 can only be configured with a single CPU it
>     is always zero
> 
>   * IIDR is the subsystem implementation identity register;
>     its value is set by the SoC integrator, so we plumb this in from
>     the armsse.c code as we do with SYS_VERSION and SYS_CONFIG
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-sysinfo.h |  1 +
>   hw/arm/armsse.c                  |  5 +++++
>   hw/misc/iotkit-sysinfo.c         | 22 ++++++++++++++++++++++
>   3 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
