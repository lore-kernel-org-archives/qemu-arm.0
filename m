Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2677706ejf;
        Tue, 27 Feb 2024 05:45:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMksFJc+OLndbiJhFQfrVbKnoFM36lgaGCOsRGtxtdh5YgSjskvQBN0F2e0y3JoZxB0Jw55YRS5VDWK5NZu/9SQeDYDPG8
X-Google-Smtp-Source: AGHT+IEzgUq5YD1GlbAGb6dzPa0azmTUZX5jHP/ZKJqpxS9Fa2SE4kf7bkiPLo3+ACPXuS4AQ6gD
X-Received: by 2002:a1f:dfc4:0:b0:4ca:f519:c25f with SMTP id w187-20020a1fdfc4000000b004caf519c25fmr6311503vkg.9.1709041539669;
        Tue, 27 Feb 2024 05:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709041539; cv=none;
        d=google.com; s=arc-20160816;
        b=QxCa0gCFtObsb8bfqgeqKcgYXswTaUw6CzWVHj7khSLbtw6s3XLoZwhCC+CtEOrUih
         DB8GOo5TipV2rf9b8om5EzRsLXiEMehr4tXLL9btZ5h6yJI/Vo9OQ3OJ3eJpMp1ikM2W
         aJZYyeoqc1Z9iQ92AsKuvE9KiMqHe08dQezhQ6wEsc1BurIWvZPEFQPm9qesiBE1Kq6y
         /ZWn7LCQ193wEY3gg9VP5q2toiTsazo1xSw4lwwdBog5Kx2yOvvV7FTqiesEzqIcbIqF
         gBmExYUcdCLBd3vZtHhOSR5MCleKMF0lAiNMI4bYwFH3bYO76bBhVXalu4H1EIhUI0kF
         gSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OsZl158P/T9biXftKiftNkHBySQJ+oNG5Df9v15vnKA=;
        fh=0KhIjKiU+O2JZf1VS9JyMBg+F2e0g/O/OSjhhnPRlnk=;
        b=UmQNbjnUCEDIuDJJQ4pWNQsECtrIPL5faP8zLG+xBajQrt9Pi/gfaLOYHjy+Cz3s6T
         W9FrZZhxXRxKA+VVUTPXPzJqqDNYx0WOvMV9hxeRnSvQYCSIMt1zV4fefA8c0s705gkk
         eCWW1x8iGapoo+ef2bJWQYDqCq6s5cbPXUH9CQA6rApCUE/MvVXvfELZ7t1bUxYQD6WB
         sZuILUn/6fBgvlJUk+MWRcD+eKF/XGVtOjiAX40T3VeGjM7SAWz9x7LOkTUHU8IxPCDk
         fIXcIzqcnNRqOML6qUG9FYlZCQbmKw/23LrhDnOuYPYoNAfXKl94n9qCDb09fS51Nyi7
         RPdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aA7FlL38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s193-20020a1ff4ca000000b004c9670ca7e6si801125vkh.110.2024.02.27.05.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 05:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aA7FlL38;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rexlE-00054e-NI; Tue, 27 Feb 2024 08:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rexlD-00051Z-3j
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 08:44:43 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rexlB-0005aP-EP
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 08:44:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so6923543a12.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709041479; x=1709646279; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OsZl158P/T9biXftKiftNkHBySQJ+oNG5Df9v15vnKA=;
 b=aA7FlL380oajrmMCC2b/yj+oXulzWRWshavnvA0yRHTzX0VncqL+XtnEsLcQiqQ/LV
 VNGhVWdxiL3o+jalmjOWjvjW7AYTOY4EXwFP21nBTX+B0auBgtm3rBA8zfVRI7QAapZ7
 wuInxar9mhcMne4nPogdbVBu/ZlAfn8c8o0jJG4BzSeZBIPxvYuBPA7o5INsSNp+I3aE
 JLfUbnPQFgElUQ/Q03dxFAaEIQGm9VHtVha+fSatZRynBNMd4qAjSH2KvXgjXBqRudMF
 hePoW1ZVKQy4yycP4oFBb7avwpmYBWunf2SeCi8tx2TP9CinSFAZTDvX6EAQgSbi1ji1
 cuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709041479; x=1709646279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OsZl158P/T9biXftKiftNkHBySQJ+oNG5Df9v15vnKA=;
 b=N2lQgp908oI6uzJjJpjAE+PQEAnztctJ/0kxX8b9eEGwAV498AHvRLnT07WT7fP/UK
 GCdC+xisbY2Pen3wNo0XmALtdkpQi4uBzQS2ZuLxxuFM1cfOSqqU7pPpOl3CG/6OQDmT
 vN+PwWayk+hL8pUmXFPMY0yRZ9Ciafr680OD299uWv02Lp7w7Mk3jc59ZEFPsgjWdI/N
 BGOTdvCzIEBnh9NVHcjj97DcXws2Lu8TJ4qeGfiFXQej3ETIgfGV/HejWRW67cEn/sFW
 bvmwjzYpn3H39MFMSd3DtA+klUXqm/QtHEYvaHz+D8y2dn3VihGrMrHcU29n6CQYn2Cg
 U6Rw==
X-Gm-Message-State: AOJu0YwT1CbxSo2a89tn8WU8KybhRVzn0ty0ccRU62O/q5yg9HanNzWx
 DBTaDufUPs6SjXTB/dOHeJEG/gPYPr19fpD7JemCk2AuMos1VWU+/NhFQHZQsVIglLiMt5z22OY
 GV0XWt2gmjo74bqPhTqPEiFP83DjT3DpPHHmBlQ==
X-Received: by 2002:a05:6402:4342:b0:566:25c1:9e51 with SMTP id
 n2-20020a056402434200b0056625c19e51mr3031610edc.7.1709041479430; Tue, 27 Feb
 2024 05:44:39 -0800 (PST)
MIME-Version: 1.0
References: <CAKAF0m-DmGa-dRABswuSfWkQTh1Cqhie2APi=fGdFLEUA+YaWg@mail.gmail.com>
In-Reply-To: <CAKAF0m-DmGa-dRABswuSfWkQTh1Cqhie2APi=fGdFLEUA+YaWg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 13:44:28 +0000
Message-ID: <CAFEAcA8PJz7TVMmOTBF9DadzBz0HtpXx1X_Np2Pev4MQh5exFw@mail.gmail.com>
Subject: Re: Undocumented behavior with CPSR_c mode
To: Kirill Zhumarin <kirill.zhumarin@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: r8FjHaSVGLa7

On Tue, 27 Feb 2024 at 13:15, Kirill Zhumarin <kirill.zhumarin@gmail.com> wrote:
> My environment:
> Real hardware: Infineon PMB8876 + Infineon PMB8875 (ARM926EJ-S core)
> QEMU: from master, arm926ej-s
>
> I found that the M4 bit in CPSR_c is optional when setting CPU mode.
> On real hardware, modes 00010 and 10010 are actually equal.

> And I get different results on qemu and real CPU:
>
> --------------------------------
> qemu
> CPSR: 60000113
> MODE: 10011
> --------------------------------
> pmb8876 or pmb8875
> CPSR: 60000012
> MODE: 10010
> --------------------------------
>
> QEMU just ignores setting invalid mode.
>
> Of course, I understand, this is an invalid code - according to the
> ARM documentation, "00010" mode does not exist.

Yes. The Arm Architecture Reference Manual says that
setting the M field to a reserved value is UNPREDICTABLE.
That means that the implementation is allowed to do (almost)
anything. It happens that QEMU's implementation makes a different
choice from what the hardware ARM926EJ-S does. QEMU does not
attempt to follow the exact behaviour (either UNPREDICTABLE
or IMPDEF) of individual CPU types.

> But this is not a synthetic code. I found it in an existing bootloader
> for pmb8876, and it works on a real device.

This code is broken; it just happens to do what the
author intended on the specific hardware it was tested on.

> That code looks like this:
> ```
> msr        cpsr_c,#0xc2 ; go to the IRQ mode
> ldr        sp,[DAT_00082e28] ; set IRQ mode stack
> ...
> msr        cpsr_c,#0xc3 ; back to the Supervisor mode
> ldr        sp,[DAT_00082e2c] ; set Supervisor mode stack
> ```
>
> Unfortunately, I do not have other ARM926EJ-S processors to test the
> behavior on them.
> Should QEMU repeat this undocumented behavior?

No, we don't follow device specifics to that level.

thanks
-- PMM
