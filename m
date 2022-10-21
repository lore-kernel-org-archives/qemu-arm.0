Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1285682ejn;
        Fri, 21 Oct 2022 09:01:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KHOHbPe+F41Fqp01d201bw0xrN8SHUHDBRDGEpIFdjAbt1KMaNuZfkP7Epj3b3F1bGB33
X-Received: by 2002:a0c:b2c8:0:b0:4bb:5787:9131 with SMTP id d8-20020a0cb2c8000000b004bb57879131mr2080850qvf.111.1666368096656;
        Fri, 21 Oct 2022 09:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666368096; cv=none;
        d=google.com; s=arc-20160816;
        b=eERhYKrsK/jw0tbjCSDJZbucwYO3Q66XaXbNcXJssxgVf2EyCJmIx920vnHPwh/x3t
         aWUnrNv9DIQ4SEyuwjDN9xvvmIryOH2fe2ePRLOtBKweARxW/M5pJCW7VIhbJqunaKmV
         /VE+G6GaZB27/GqbJtDFhlrYybnfDRVkAHiIfxWqZvinMQnAdtKFgl0XN3mpJa4iaogV
         fSIAsFxmK6dYWrXo4zlIbxTMcBXol+YrSlgFFQ6dVSXCOKewri+57nU+R7hZAHL9n6Hr
         dRL4XMB0FB3coDHS2GVvqpsVPu438jed06tTEG7HiDujzQIm1K0IC0Jj83nG/NBt0E76
         O1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z3+lgBUOUMk0VTZfcka40Z4LyTbdgXQZO/4d+Y/c9Fg=;
        b=xiUYGfgqQMOl/EGa8L5DpFHG6CbyHpRHN9wxSyrLGT5oc+bDIjBMgGkueS6UqNb38v
         ZrRPbh1Q5lQUmJJtneYrEG5QzVCzuW5ExG8X0g8Vhne7JjYmD98EJyXmCzxCKIBfQmUS
         CzKQ9RHRKsYjVmxZ+yQObpKyympOSehE2teuqVZ12vgPImmKq28v/P4iKXFa8l4Ka8Lg
         N1ISBbfMhq1txXd0U0FaMYTWdDU4u9zkE7vRyZXJUfa0CmAQuHWTLJNdmkY7A9UJI3Qd
         szln0rP2/TQkGwGY6RxkDDlefyixImOsjWnIZmIVem/17Z1CXsTtUKXL5zvYOCVg9n7q
         ESBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eY67rfIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd6-20020a056214400600b004bb56b0497fsi853944qvb.169.2022.10.21.09.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 09:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eY67rfIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oluSj-0002gT-2Z; Fri, 21 Oct 2022 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluSC-0002Y4-Ns
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 12:01:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oluS7-0005U1-0P
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 12:00:59 -0400
Received: by mail-pl1-x629.google.com with SMTP id u6so2719164plq.12
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z3+lgBUOUMk0VTZfcka40Z4LyTbdgXQZO/4d+Y/c9Fg=;
 b=eY67rfIukKseMquAziFC8G/7a48d7mbOgo3TQ/JZOPZrDRFArMoNvnihQ5MUizyvBD
 zODjFyLQg2+pyQDTKoBrsGq0HmQ8owOr7R34ic3puZBpd4d7RBp1MA0xAf2Vg8YzZgM0
 uNbi463Q5kc9Yf/1O8O45Gg8fyd9v36hlqWbSrHb+vBc/4yogVsyyrgSTw9guHK8ps8t
 DZJ+7M+sgN3wcObvpV4nVIy1uVOmAyGonyFojwv7MkSpRutdF3zF02e9M3HB6Wne9dFR
 mZZeaHYU6/cYOWkl7I1krtL9dCK8PN/slRf8E1sYciZI/kdE34kKGX0PZfakfJjx+eO8
 9SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3+lgBUOUMk0VTZfcka40Z4LyTbdgXQZO/4d+Y/c9Fg=;
 b=D+5LIna115CkHZy0rEMjtk/XfvugcnNTHuzK1LMnuDHtGnTWEwImyuicLy8XXhFfIP
 Ttr0V8A4HXpp9cM3/gkej+TAJirfeuUquFyGpjX0wicEe6FQTa/TlVbRc2bx5c+VxED/
 Ref3SdrZghyhQ5AppeWhU0Hb8Jvemxwl0cvLmSen3hoTHb3XjfrwUczhcOmMCb/HGl8I
 tVj52yf1cDrp9ZYoX41GmlknZn6dw4HzFiYlt11mnhGPbloMkYiERHnxO+Uh0/Yhy6PX
 gFiiFW/OytasZNjLnKTJrizcfntzWDe541+L8Zv0RFxyAOiTdjrcEocnM/0MRwh99uh0
 k+gw==
X-Gm-Message-State: ACrzQf2Re5FnsJOnDP+Z6sSXHnBW5Xlc8vCd+QZzDKox3jiZaVOmmWGg
 3umh731DGhFzQ+B4FjAWot4z+2AYpdvtPq89XQbCxg==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr19290833pll.19.1666368053045; Fri, 21
 Oct 2022 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
In-Reply-To: <Y1K/Oo/dagg6D46m@strawberry.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 17:00:41 +0100
Message-ID: <CAFEAcA-H+OW+sMTTsb-sOKt_Gm0Fhg4iTbGHUYfVysNDqeYG=w@mail.gmail.com>
Subject: Re: [BUG] AArch64 boot hang with -icount and -smp >1 (iothread
 locking issue?)
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u0r/4jL1PNo4

On Fri, 21 Oct 2022 at 16:48, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> Hello,
>
> I am encountering one or more bugs when using -icount and -smp >1 that I am
> attempting to sort out. My current theory is that it is an iothread locking
> issue.

Weird coincidence, that is a bug that's been in the tree for months
but was only reported to me earlier this week. Try reverting
commit a82fd5a4ec24d923ff1e -- that should fix it.

https://lore.kernel.org/qemu-devel/CAFEAcA_i8x00hD-4XX18ySLNbCB6ds1-DSazVb4yDnF8skjd9A@mail.gmail.com/
has the explanation.

thanks
-- PMM
