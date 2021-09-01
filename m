Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp364813lfb;
        Wed, 1 Sep 2021 03:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYGkQhR3WahDgpjlnVVE3LMgCCMkGYIiPpuH8v0TUXONrbz+SXheHRt/Bu9Psl7Bg/BWbX
X-Received: by 2002:a6b:a06:: with SMTP id z6mr20228050ioi.146.1630493863893;
        Wed, 01 Sep 2021 03:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630493863; cv=none;
        d=google.com; s=arc-20160816;
        b=OuE45CACVy7n5joIMT5mY3LWfiif6wqFXKcw6bOtDI41GqWwbGlpzudpfI+Jo18Y6G
         ltjuvSLmaAmsJmjV3SLrnCrnwLA1tuW8KE6KMC7NJnlce/6Eu5L8F5UYqANFiSmv3+OM
         8Rls+EGCkrE/vKanLEUX4f1gHW7Jmmf7N0VR4ACJ1tUu+TjK0xvmGodZuEyqRKj1a6k5
         qqkNn8JHK/wIOSpSuZSOeRlWz/98evqUObC0s18k6zJ4atJ+Eb3vsAATjryX+877X3jy
         kzm76c05qYrVolNWfcy/DhW4x/HMV2yvE2kWwee9V0dGMtE8fOAToBooPuF9pojjf2B7
         20TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Un+ZolysfcyfTySKsZ6MUdvG6CF06LXmy81Vz+1IUwc=;
        b=Fwe/0nvLgusxLw0ObZTCMhp70VmqcDypk9GVryd+U6Kwe4MNzu6YBJZdFDpyiDG3V8
         pXBjOG9gtepHG3qBI7BrHPum3mpVBSHVo42ytQTmSmJ7FWAGodrp25LhLoZS2I+0ggjC
         2JFufuQWcogMMuXt9hQd8pZ8BFMVtRWyXfLlvlDfwX6RpF6WU6U3pcsaz5q3ZiLiwV49
         BeXqQPHog7MN/3uG3Irdc8IBSzlGK4BOcmOAyPZR3ttg7zvh15GGNlU5sWryEUAGwiiQ
         idsuM/+xWKW4biUlf2lWWIu1nWfeRameh8gOC2uHJlqlPNu0sEFN1O5pUm2kBeCN719E
         M8sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcVbY0IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si20598585ilt.132.2021.09.01.03.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 03:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcVbY0IW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLNw7-0001tm-32
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 06:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLNrf-00030r-VV; Wed, 01 Sep 2021 06:53:07 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLNre-0001W3-D6; Wed, 01 Sep 2021 06:53:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id n126so4236592ybf.6;
 Wed, 01 Sep 2021 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Un+ZolysfcyfTySKsZ6MUdvG6CF06LXmy81Vz+1IUwc=;
 b=jcVbY0IWLzIOneqJpFjvnom1Qhg1cTp7JIaoDzxz5Q8oluCi07p5JNn6xHAU3C43SE
 s0nTQnqmLHgdfgvLJjG8Lh26gY1n3Ydiw6D5Qeogq5t45kFDfeK2hWBvXAcCjQoyPx4m
 9Ana7uM4FuzOIVK45zxmba15kU+/ZMPKxiIBkvWmD6nlEa5eXVOvL06dSq1I85iMid3r
 V20fgw9Z9SrXWmilj0FSpg1SRsQrtZ1Y5ohfKBbZV6GQ8tiDtcBHub8ZTJzwL7p+hylY
 0lp2m8y7HOR4prH+7Ebq5k/2k407ESgg+hQ/CSXQPNpAu79mEq1SbOGuGpRDef1lpFAM
 9uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Un+ZolysfcyfTySKsZ6MUdvG6CF06LXmy81Vz+1IUwc=;
 b=GiRm5IPi7x4XOZzJSwGmB9tzvZF2OZ7tCgZ3x9Vs7dpufhAISag7v3rgTtNvn7krCS
 8MjjdHzxb1ABNuln3m6HAYJSpCiaGSEvridEYS6TBtfOa/E5nK6prLHtOTQMwsX9/KrX
 omrrimD2Q5c8EoYyom/IJVGoFxmnlfhqT62ww9AjgPm0B3QEBz0IsWrhpo1Zh48p/ltc
 YJReU8zHEhnqT2ag3QG/FzlM6q5IctdEPv0okYQWTP1wLlS65tIlp5NVkI3UF0j9/2mD
 FraXbnMPDoxf1aHu5o4dIX+duHowmURhNeYOIc3XGZimNA3rI98WJovEv8iNVarV7pPj
 2wAQ==
X-Gm-Message-State: AOAM533eMhA5OemlMFuii0nMSQpUbsv8M4j9M2VjcmgeXsBlVgS+j2R0
 5Zl6/y9jDbVjoukbdMy3CXSnbZvtLvatxXrcl9Y=
X-Received: by 2002:a25:be09:: with SMTP id h9mr39523943ybk.239.1630493585103; 
 Wed, 01 Sep 2021 03:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
 <20210901083251.GG6340@toto>
In-Reply-To: <20210901083251.GG6340@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Sep 2021 18:52:53 +0800
Message-ID: <CAEUhbmUs+K2-5iM93vdTxdJ6H-tDo9etwzao5cXJzLFCC5rtXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read,write}()
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wC8Iu+Ymk3PC

Hi Edgar,

On Wed, Sep 1, 2021 at 4:32 PM Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> On Wed, Sep 01, 2021 at 11:27:24AM +0800, Bin Meng wrote:
> > Read or write to uart registers when unclocked or in reset should be
> > ignored. Add the check there, and as a result of this, the check in
> > uart_write_tx_fifo() is now unnecessary.
>
> Hi Bin,
>
> I thought I had replied to this but it must have gotten lost somewhere.
>
> We've got SW that expects FSBL (Bootlooader) to setup clocks and resets.
> It's quite common that users run that SW on QEMU without FSBL (FSBL typically
> requires the Xilinx tools installed). That's fine, since users can stil use
> -device loader to enable clocks etc.
>
> To help folks understand what's going, a log (guest-error) message would
> be helpful here. In particular with the serial port since things will go
> very quiet if they get things wrong.
>
> Otherwise, this patch is fine with me.
>

Thanks. Will add a separate patch to enable a log message for all places.

Regards,
Bin
