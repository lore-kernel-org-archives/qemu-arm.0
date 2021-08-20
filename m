Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1295849lfg;
        Fri, 20 Aug 2021 06:14:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsu8ix6lLo4ksSkXZOMnDDZmE54qEIyP2Eu5nmFXARJhtYcatJU25ADFVlzqkFrOHymxO8
X-Received: by 2002:a5d:680e:: with SMTP id w14mr10149885wru.57.1629465287020;
        Fri, 20 Aug 2021 06:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629465287; cv=none;
        d=google.com; s=arc-20160816;
        b=K9tW7ftRXtJjmWCnwjxakOUuI3RhBgM5SMO+tBqTPwo5vOKkj9Kar/S/pdEe4F3roZ
         y7jAjAxm/1zt8KQF20c6S+w5pBrYBWGTrNWW0n5wAUi8/wh/zBWgOcsCfFmydDFzCekT
         OxN++7a9pA8sObXwc9QBDqxOJgeSInBYDL46Xp/6dJJYwiQLvCc0vEVGcZ9571miYaQj
         7uBh8nHjDjGBiN0+AeZ6vAjT2mr1gbSkSjOdsln6S48X7vl0wvqpTlWEndYGr4Qiid+/
         DgHQhOyh5HMMJtfsimJ4lKrDj3itFa166thSMufJwY5EJ2AA1m6Yqkw/TZ9zSRieIaLb
         pV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=coorekylvS9sm+JwMSLZBNqz7SV+s2ztSxAqaH5N/nI=;
        b=mRougkUGyIyujan1RZw68LsYRzoC48oHlCc4fohgsMhpnDcY4dubCVpP54RvPbh76P
         o4NndZ+ba91E9Njfg16dYvWAVBHV+/7IW2WRseSZNv/sZxt/uEc5CzhrnqOg8XNL3Hib
         jE2Y9wWEKlslH1woRAqgnxL7ZvD27eVcw9XtPOap6rYL3BHfQTlnkf1BUdnaWZGOkHYc
         3VtsfI+7YCJoyR06hvUFv0XWAddmYrFLIw7v9/wfHO6NIFlbcYBR0myPg+leIJmQjNy1
         AtH3i783A01XcbsM9PSuT4rbEp9lls/fILKPBjmL8aLmZIPmHX3Vpp7ZNGPW491mSx0s
         VQEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lUhHopKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hs28si120802ejc.637.2021.08.20.06.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 06:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lUhHopKe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH4MA-0006Vh-2I
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 09:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Lr-0006TL-Ap; Fri, 20 Aug 2021 09:14:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH4Lp-0005RD-MH; Fri, 20 Aug 2021 09:14:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o15so5933122wmr.3;
 Fri, 20 Aug 2021 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=coorekylvS9sm+JwMSLZBNqz7SV+s2ztSxAqaH5N/nI=;
 b=lUhHopKewBCMiO9ZuJnhI7wSnVth6wkrPUyNa/tRiNH9vytP77km6n2UL1OeUXVYpj
 TIoo0FJowBIIMbBUVqzzx2sDIZh3dU7TJ5FE5Q+TuAKqSA/BQ/zFg+AmPSlNDn98w7GJ
 jEykJpJhD4AarxWjar4c4g2f9KwdiCNZjd8T0Cf0exqdyqJOYM2K7VTQtzX6CSJtq4dY
 d+I8uLp6r7BSjxjZvTJq3F9bM2p43lO8KoNwDUaThvZJP69/W5buORUqdA3mGvokdHbp
 +XO+laGGM8SWUSnKBNh1h/4lzDx2D83i43XoK/h1qPSWinCxVPq0UJOhMbQ+DUiHAvB8
 LvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=coorekylvS9sm+JwMSLZBNqz7SV+s2ztSxAqaH5N/nI=;
 b=G0xWBFRdXyk9dd7zq2S5FzJ7dp5GrVcG3NOfHK7Mhh777oXBpceJTjUAxPpYzKMSHw
 gzTQPi+bgQr5kCqjjr3f4/yN9p5kiBc/JfSppygTv7Jq+Mb1wMfjpDXwrfBr0It35FsY
 Gk+W6D001nSh9bCsxKUmAXDJH2TFWET8Y3jHld+EF1Rsa2pEdZgCTAQ5n8QbqNzxwPVT
 nPjN8cwzCIMlzB0uWejK1fTVkpgJT0q33623P/MGd1OujHYXc3+zQ/95SN75+xQBh5iE
 KGEb20Yue1WksXdifOxitPvjfb9zg6/ANw81UdToeyX9cdohMiruPLlhPKkkn9UMNRKI
 LW+g==
X-Gm-Message-State: AOAM5324GQXsq6uuvsaFzEu/vm6adlBS3e3HGBsVuEqhyiWvB/7DczIg
 mmRD34zfLnOxzJqFIq7cSWI=
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr3956841wmi.130.1629465263643; 
 Fri, 20 Aug 2021 06:14:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j37sm3833703wms.39.2021.08.20.06.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:14:21 -0700 (PDT)
Subject: Re: [Patch 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
To: Tong Ho <tong.ho@xilinx.com>, qemu-arm@nongnu.org
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-3-tong.ho@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <faea8430-fb60-2c7b-ed70-4efd16a264f5@amsat.org>
Date: Fri, 20 Aug 2021 15:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819031525.653995-3-tong.ho@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
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
Cc: alistair@alistair23.me, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwS4Q7k7oJAT

On 8/19/21 5:15 AM, Tong Ho wrote:
> Add unimplemented APU mmio region to xlnx-zynqmp for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

Again, please point to something more useful:

https://github.com/Xilinx/embeddedsw/blob/master-rel-2020.2/lib/sw_apps/zynqmp_fsbl/src/xfsbl_hw.h#L271

> Signed-off-by: Tong Ho <tong.ho@xilinx.com>
> ---
>  hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-zynqmp.h |  7 +++++++
>  2 files changed, 39 insertions(+)
