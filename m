Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1535444lfb;
        Fri, 23 Apr 2021 10:12:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxkzep+bW6USQVw96LZ4qb1fjCLEVY4kXvac0tejGc/EFW88NgiZ/GqBIDeM497EODd4si
X-Received: by 2002:a05:6638:258e:: with SMTP id s14mr4595104jat.28.1619197961689;
        Fri, 23 Apr 2021 10:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619197961; cv=none;
        d=google.com; s=arc-20160816;
        b=ALSVwiK5s/aleBLTJBF6HxJ4zgSB6mjneO2bd0SWysqJZUin/NzLznn2E/+4jrs0e8
         bbFZ+/xV4ZMsExitqDLxZfPn19h3CAeggxYzitIKOkcl4a9FQqdth4hcvls9TS0x9RRg
         G/7aV9D0x+zV+I/eglwj0E8g1LqI7SQScvbltJ6BlOj4jdiyCSRYOfbYsEjT+hGCmj2W
         hh2mtLYuLtznM62hsvLlUU+ZgsOsZOXh6lljcuks3nne0LwgLLC8nzRfcuqzMzctDKQS
         mzc7S9K8muWDxB5XXL+hQFzGXjQ+u+Lc6S9x8WinPZW1vyOFaUjz9YOzwnWVPpgRBNVX
         MyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V1/Z7NzxToULFyFZY8mmaKqjlH2kxwusr4i8iKPtwfM=;
        b=R9S3eEvG8RITbgpRyXgYkiO20ACy4ofUZfvGnEV5h63QjiLWMu7LadJ9XDH65rKmGJ
         efJxKT9iVHH8ZQBzYSzgOZRwIRFAvPypdFy6m/49zuh/ZD3Q2qC5f4GDX9XGvovesWNy
         aqZ8sTumEGUJXooObGcJQFBQMCy1KHWDMMjqp3mT7HvfEDfxWPZSV4fjER7YBYF3PaBl
         bBK5xRRktvYzCOMEhXYg1ivpVSY5bBWDT96nhrA31Ms3AqkPz6k6wK0cNj+sz95RzzLv
         84Xo76La4u8w+r0GpoYfEjsfeUKZ6aZAO11608qlX0MNPZLopn17nHLgeYy8148oqzeC
         N8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W9hIDfxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si6173533jak.73.2021.04.23.10.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 10:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W9hIDfxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZzM8-0007eU-Uh
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 13:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzLV-0007cn-L1
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:12:01 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzLU-0003VR-2P
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:12:01 -0400
Received: by mail-ej1-x629.google.com with SMTP id u21so74944469ejo.13
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1/Z7NzxToULFyFZY8mmaKqjlH2kxwusr4i8iKPtwfM=;
 b=W9hIDfxuMx+9VAS5pFtwRcSLhVEn/u0CecopZo+xFs/QeaQhFwHBLljfH1XcLMwhCr
 30YqgCA+4jGmFT51dFyGm2N4b9G0lrLeb1UFnnVFbXFQV3NNjXLvoBI0x5yiYtmkfsQx
 TOFzd+WMaeMOjTfZ2lzgNorEPC5hDPego8SEC+Mvbru4blkZ40ASR6jY31a5qmjC8TVu
 SHC/dHhapnw4ncSYseMi8U6tDWh/rX0zijqZP8OBtW6B4WZg/N6dvLdYh3kqaitDYYqO
 TQjp/HeaJVTSjfBblwpJhvMDBi7CQr59ZTUSYWpEtf7ifKwqY7eUbqExAVVDtDVrsCWg
 hHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1/Z7NzxToULFyFZY8mmaKqjlH2kxwusr4i8iKPtwfM=;
 b=kKMYfGZFPkwlOFGtpKzHlpsBkMhv4jZsKWJ5RcAkcvLCQo01gcaouTaOtRqCCBMxUn
 qpTX2/I9WVA8aH0TSyPnhwICiFPrKPEA5907b60ZuIXG8DY3ZLfVhtYjVLV2cj+LBMPT
 ixRPujgyXRhLPnMh/d0grzvK7O+rrVFV1TKqPfdaoyuM+XP7lT50wzLBHGkQweoo/qo7
 L4C56Ubh0TlHkCodhj6rgw1KKBVnAIWTN4FcYIZtPLsimuXSZVgJinuHOFvB3Gs4dyLa
 /ft+8Jf4q5CXdUVDulqCn27DkNsntbSQrNfqNB6VA2KHVkDOKgrXYcr2qv4WHR1xDskX
 QuOA==
X-Gm-Message-State: AOAM533371pKWaiGs+2GntDIUZbk52i4NWOVzdmRZ1x4WOZuw4hZSPgk
 Esp0tr7lRGnL4RDwmTuSLbH8TEfijVMgLgJ2DUhaMQ==
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr5478471eje.250.1619197918339; 
 Fri, 23 Apr 2021 10:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-4-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:11:02 +0100
Message-ID: <CAFEAcA9orFRnGEvmT-VJgRUMPVLesOkVpAdByfMK=mwecCGUyw@mail.gmail.com>
Subject: Re: [PATCH 3/4] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cPh8fBtPnj5r

On Fri, 23 Apr 2021 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no such decoding in linux/arch/arm/nwfpe/fpmodule.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I wonder why we put that code in to start with...

thanks
-- PMM
