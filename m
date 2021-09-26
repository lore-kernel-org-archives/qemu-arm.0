Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2610564lfp;
        Sat, 25 Sep 2021 19:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMkyzLtopfFCn+Gz2k6NQjYL56ZzVKjeanM0vYIMme9aVftQ50g17aAjmwQ896RA/Gib3x
X-Received: by 2002:a02:cc22:: with SMTP id o2mr15646121jap.128.1632624631369;
        Sat, 25 Sep 2021 19:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632624631; cv=none;
        d=google.com; s=arc-20160816;
        b=XQS9r/aCW3y5jcimL06CMVl+NqaCMmXfaYPpfVRFg7gc+gEiVLtKKpQZkKyPsUY8F2
         Ah4T14CQchtFmTtUHQsE1S8A/368zwzK6/I6mz2ysD/04SP8y5IV/BcRmgvRUBLDBdyS
         wqXV6PtFW1Y6GzJlC0gByxuXLsvOj7vnbmmFYT/g9q5iv2mdYbyJw+ykm99AG84wNzo5
         2Oa+hYkrtjfcmfTW5ERrEe7DNWaU2a3C3vE4jJG1WhMewMlqfRLXKymUwOtTBr3bYNm9
         tn253z/N4pZuu4sAdYPnMgrvFZJgb5HqCmP5AReVBcLibzPE8s1k8cZ/l6xfzWsBCrnT
         +W6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gLJzSmcBrxzcvSFv1Wv+eRpGhPdjDxJGqGXgezXLuBw=;
        b=SQFMb6Vnfd4hq9VclohTB41amTEWZ3zTPUdHAAyuYhVYFCwdshBFTHLmXw0nWOOhi0
         UfCTrplRjSZ1xSNPt1NirAcnFUF/pTKNrWERmO5u8UaFDTj7hofgBQ1HK/tk7XSZE+j4
         JVCKP+fV09+TMuW+r0aISRK7EqdVPx6rEDpUDvB3sZIwUnN0/cG4HlebucA3qCSkVZbS
         yAsJCw4zXYZDPh7cQAjJKNhrse1KiNXtDM7KeZG1lu6nr9wQMwcqpZGsWiML0yD+Ms8g
         HzKk7ZurFZG9HT1GTMDpFnPvHwywicGNs1gAt3dNAKZ2MHQzMVxUADZEOUG1H7NJ47IY
         f2RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CuzXqnAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si11749210ilq.119.2021.09.25.19.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Sep 2021 19:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CuzXqnAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUKFK-00023g-NQ
	for alex.bennee@linaro.org; Sat, 25 Sep 2021 22:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUKEy-00022a-FQ; Sat, 25 Sep 2021 22:50:08 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mUKEw-0003yj-Lu; Sat, 25 Sep 2021 22:50:08 -0400
Received: by mail-yb1-xb34.google.com with SMTP id m70so15154068ybm.5;
 Sat, 25 Sep 2021 19:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLJzSmcBrxzcvSFv1Wv+eRpGhPdjDxJGqGXgezXLuBw=;
 b=CuzXqnAPxhzOZlsNv46HaiD2mSaM4Tjw8dPqHOeYZCzAbyQIyHG+niwgoipopri5a2
 RgASbkCUXpRo7Ch8WtT9HVlhfUX0geZxb3JNlkROMRcavBkpg2mBq8ETRye5juE+R7bb
 4P6bW/PzSupxon6mUcM3MafLvBcr4wtPd8giwW1oQkEHPaWGOPqMvYPGkl4xcQgRaCRV
 5LICfw9ANBDwK5oHBxjbT2RRCfonEDn4uRWTJqy5Ri8cZuu8DqU9BJBkYOFKuktK8dFt
 iC39bR5g+z4pPUl5bHVDZ4cQ4ISG3vfjAJOsvKty94ZoUZQRy7gAQ3LxivdmnC95XArg
 odtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLJzSmcBrxzcvSFv1Wv+eRpGhPdjDxJGqGXgezXLuBw=;
 b=hQx//Ojsgh0we7loVMvFf/uilsCcxWFhl2rRL6u9JXhbTCKhFnQTJzgGKuHzW6Xo86
 o3LdyQYhyiAyrMf0H/sy+aFP2shPMXAdnJG3cRCugA3/AmqmNIdphHWlb6j4N+N6pS08
 PGehDnRI0dBD7Wv8yDnUYfOqfusN02Zyu9J2kKcxxeZVm2xp/oI3pqgesdgdQF0jXvi+
 800zHSVEvnOMHXPApAhjcFOksrejL2ftsigQck42lRwoKDGsu8mJojwdRVSR6DpGZbqh
 BUhxi9bKTrFfT56ggzoS0Fm4F0p9LXbAQ357ueGm4VX5jLsZUV78LYxn+snpPPOnrxVi
 rkDg==
X-Gm-Message-State: AOAM530CDYLzR1XkkOpKI45cP63aR3B5JTgCABwBtJaOOaz/VC0FjKBB
 RArzm4c4kuSEhbr0VjKljB5Kj0rCNKb56svCik0RRr8QhzM=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr20191653ybe.453.1632624604686; 
 Sat, 25 Sep 2021 19:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
 <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <20210916142140.GA252836@roeck-us.net>
 <PH0PR11MB52058E0462672E61797758B997DE9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <2cd83a88-952c-6f86-74b2-8c0da3ce4394@roeck-us.net>
In-Reply-To: <2cd83a88-952c-6f86-74b2-8c0da3ce4394@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 26 Sep 2021 10:49:53 +0800
Message-ID: <CAEUhbmVVjXKUxa95+GPPZSU5=isgTs7EMnN7gxgYn9Lkg+a0Xg@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Cheng,
 Xuzhou" <Xuzhou.Cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zf5EN9g+8AFq

On Sat, Sep 18, 2021 at 12:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/17/21 8:09 PM, Cheng, Xuzhou wrote:
> >>> I got some free time in the past days to investigate this issue. Guenter is right, the Linux imx-spi driver does not work on QEMU.
> >>>
> >>> The reason is that the state of m25p80 machine loops in STATE_READING_DATA state after receiving RDSR command, the new command is ignored. Before sending a new command, the CS line should be pulled to high, this make the state of m25p80 back to IDLE.
> >>>
> >>> I have same point with Guenter, it's that set CS to 1 when burst is zero. But i don't think it is necessary to set CS to 0 in imx_spi_flush_txfifo(). I will send a new patch to fix this issue.
> >>>
> >>
> >> Thanks a lot for looking into this. If you have a better solution than mine, by all means, please go for it. As I mentioned in my patch, I didn't really like it, but I was unable to find a better solution.
> > I am doing some experiment to verify that the new patch is reasonable, so the new patch will be delayed few days.
> >
>
> No problem. Note that I'll be traveling for the next 2-3 weeks, and I won't be able
> to test any patches during that time.
>

I have some updates to share, as I have been working with Xuzhou
internally on this issue for the past days:

Current mods using BURST_LEN to determine the timing to pull up the CS
line in the SPI controller codes is a workaround. Hardware does not do
this. To understand what real hardware behavior is, Xuzhou used an
oscilloscope to verify our guess.

It turns out the root cause is elsewhere, and a proper fix will be
sent out soon.

Regards,
Bin
