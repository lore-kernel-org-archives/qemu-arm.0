Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp633625lfc;
        Fri, 29 May 2020 09:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyByGU19zX28+vkvTDHdshflcTxDEaXmXSrMo45udWjucnaCAIQT/j8oZcbXoYW2KoR4Sy7
X-Received: by 2002:a25:c8c1:: with SMTP id y184mr14118689ybf.474.1590768955148;
        Fri, 29 May 2020 09:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590768955; cv=none;
        d=google.com; s=arc-20160816;
        b=cdHCGw8msU15i02L4UWGm2BahdA+MuA+3DEk0ITqUy0aG2HA/jgIwVwVobFrQ2j6zt
         0GqeCI2qiYcSScSHNuY4gww+iOslaOrfWtYi6AQYDu+yB1NvDf00gt6ms3bgfKm1NBLy
         gRwW4seDLETAHwbEMJ6k5aW1RQmIQtRe+SeUos0inXmQ/x8rvqPhV1maFwGjHqKDVWN+
         JhVmrk5PWMBfGsvjIT39aml/7xzdgJsE/OGPr7DaQ6in8PoHB4wXCa0NA3JsbyIidQ8O
         eVLuE6YwQAxKrSA/h/zl4a5PU5e9Yvo7XCr65e0A87nTvBzND3OFKERtiiXDszpivDjq
         KClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=56skEWDk5MuyNktK9SF2FuTYRB3ePorisxcBU9HiDU0=;
        b=vYyQAajeemia4ERM0F6elQ4fvUBVRDhAXa9KWaknCs4IIVSK1/ZbgVTSwSAhEDqtOL
         Tvwn76hgFS/IU9p2d/9T0lg7IKFgs0X9Zyn6Mol56Pp6iGWbXtD31+AK3cPNRkqYkM3i
         M5Pfa092qvxLV/zgb3Xx4RO+e/8K5sYMYKiBik3GocwFKUO+ovBSJ0t7Fa184DlIZu5D
         0lX45h/DkFWL9FJpFIlo88ejYskwpbqG6LZgFTZFyHxix4jFs7Ej1DgATIr0s7dUgxPe
         Ht/EJ0MPU7We6nNL6AuWIFC+XcQ8zk9NQHPJbfdyc6ToHMHOzFGvwaMsoKI4RaLfMHR8
         0VbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=spHjqyDU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b75si8156655yba.453.2020.05.29.09.15.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 09:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=spHjqyDU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jehfm-0007s2-8u
	for alex.bennee@linaro.org; Fri, 29 May 2020 12:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jehfP-0007qT-Me; Fri, 29 May 2020 12:15:32 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jehfO-0002dp-Kl; Fri, 29 May 2020 12:15:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id h4so4020694wmb.4;
 Fri, 29 May 2020 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=56skEWDk5MuyNktK9SF2FuTYRB3ePorisxcBU9HiDU0=;
 b=spHjqyDUggsvprADniidmmLGKrmbNTNiuipbl7R3lceWbz12VlauhuVmjG/03u+j5l
 CLNL+kjMGZziVFdyP6mLa9TFKPBvoE+1HY3EFzAfX46S3cKmnnRZZAE25suQf4teGJho
 P2Qjyc1NJezvFlQXCPkFEz2FkuGR+dqJuxRpnR+Sdnr/vRbjiN+GT4ssoE6/m7eRCogn
 +Rd+UqYdN2xROyaAcxj2NBeMbSMGdDL6HGCrQXBiN0edWDu+msMAn+TYun/71/U1oGgF
 /WOPNLuZaWNSY0EU5jnlFfkxMS4ICS5u2glGABFocETlJ2Fcgz3DdN1zRrX179woJJa7
 W+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=56skEWDk5MuyNktK9SF2FuTYRB3ePorisxcBU9HiDU0=;
 b=Qa7+O8H2BYsGuqd/LxYmbEprKguAhUvF06UYFDVqfLSv48DYnQszK9UiT+3u5gFZ7S
 Ny3eBYrUNEB8ogxNo+2RQGwCqVcrr1VmmdRiAnUiznK835u98pBxt3AeBhklKzCOLbG7
 xSMyJTP8jlw4dfq/LvN3Pg+hS9D2J3V8ixa3r0qPhkp9RdwnwJrZHzM8rQkY6mDHLiWp
 1iWUeSby5Ng12SRLkQQJfgovJyRTdNG46rU9SnBIOkY9z+/FoohsqrsSCKdqZpFQEk2i
 yiXOqPBi16Ttx7tS/Zh7kjsb85x7jRT47P6M1GYoIXzVlOFj7+SH7ishjjkC1DnZJUc7
 voZg==
X-Gm-Message-State: AOAM533gxQkEhFsy/hzMmQ0y4LE00CVEsf8oSMjOTPBOI9z8gtTovK2y
 8kjF9+fidFduhnSmmuUpbAI=
X-Received: by 2002:a7b:c086:: with SMTP id r6mr8949470wmh.29.1590768925094;
 Fri, 29 May 2020 09:15:25 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id z7sm10529022wrt.6.2020.05.29.09.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 09:15:23 -0700 (PDT)
Subject: Re: [PULL 00/21] Vga 20200528 patches
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
 <CAFEAcA98OyyyC6gs34e3U03=dXz8GkDn5qf38UaO_XBB679V+g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bf43132b-71c2-d411-7cf3-e9a00066ccdc@amsat.org>
Date: Fri, 29 May 2020 18:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA98OyyyC6gs34e3U03=dXz8GkDn5qf38UaO_XBB679V+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L6Hhvas8BzOJ

Hi Peter,

On 5/29/20 12:29 PM, Peter Maydell wrote:
> On Thu, 28 May 2020 at 13:36, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> The following changes since commit 06539ebc76b8625587aa78d646a9d8d5fddf84f3:
>>
>>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-hw-next-20200526' into staging (2020-05-26 20:25:06 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://git.kraxel.org/qemu tags/vga-20200528-pull-request
>>
>> for you to fetch changes up to fa0013a1bc5f6011a1017e0e655740403e5555d9:
>>
>>   sm501: Remove obsolete changelog and todo comment (2020-05-28 11:38:57 +0200)
>>
>> ----------------------------------------------------------------
>> hw/dispaly/sm501: bugfixes, add sanity checks.
>> hw/display: use tracepoints, misc cleanups.
>>
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
> for any user-visible changes.
> 
> Could somebody send a followup patch to fix the indentation
> error checkpatch notices, please?

If this is part of your scripts, this is a nice feature :)

> 
> 5/21 Checking commit 97f369f2479d (hw/display/cirrus_vga: Use
> qemu_log_mask(ERROR) instead of debug printf)
> ERROR: suspect code indent for conditional statements (16, 12)
> #34: FILE: hw/display/cirrus_vga.c:1038:
>                 if (s->cirrus_blt_pixelwidth > 2) {
> +            qemu_log_mask(LOG_GUEST_ERROR,

I explained on the patches:

  False positive.
  Checkpatch is confused by the mis-indented code
  previous to this line.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg706364.html

> 
> -- PMM
> 

