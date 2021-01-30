Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2162000lfo;
        Sat, 30 Jan 2021 11:04:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUvVx/JL0XhcCw0tNNkaQXlsG8rbDFXiEx/bTRfklRTqugjkOuPo2Efb9MZ+SCZ3SucJzr
X-Received: by 2002:a25:4445:: with SMTP id r66mr14330898yba.376.1612033494991;
        Sat, 30 Jan 2021 11:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612033494; cv=none;
        d=google.com; s=arc-20160816;
        b=xwNrcHKVQ6Wp0mMMOux5oJWUEx/RH2PqNg2AmaItm93nCkojazhzoe7WHMUftdroAE
         n/91Eo4gjSYCN8tozaBONZQJ4ZuLT4rKo5GgZMVLwcpKYr6/Wljt4OcqX4sfc7z3YHBu
         sA8Atv+ZK6FTW/nEc9xLb0oMa8ZWblpUM2Kls/L26YRGttKKollc1R5NgAHZMBWt1lee
         8YfGv4y3BJlU0SExDuPv9UA+itK3NUrHQXljOEc7PnDg1OzYOLPBQAAMrYDWCc1CsZcB
         mDLLG43O7TzSlvMfqc75HJnn6/viHpn2yRdjgOCXGM9nm4LuQsFTRqwjhUnGJFjdUnz4
         n9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=g9ov0VVs1sCdcd4GwD2Rn1yejaNO5CuETR3oztC0Xkg=;
        b=JJW3mfHaNqB5aHpmrgML4PqpKb71x0g+cEhbUYjsl42xd+MXs/DYlPs6nLwh2kHOU3
         sI2NF28gbCjZMeJWuf8//EqWY6E0brvXgnbprOe0UwJmUF08yh7e+uHCd+yzxkkjsxbV
         VAHXyQ0blH2FHPuDbGPYQYSK6nujxrXLUPHLXH6ALXsm8CsYmBC7BGPOBBZR/0gE8DIx
         WAeif/82GLWup7Au52SdRscScO0yriRRiKfbtp1Zawx27BTXaoaQYJQLiDI0A9VF+wK7
         P8nOtixva4ZdpPTZw8FqK1US0/f2yNAuQNfyhq7BTJLz9ULfx17AOUvGxCGV8+Cbv/0Y
         UgUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@modwiz-com.20150623.gappssmtp.com header.s=20150623 header.b=CIA8NvEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si12960104ybd.399.2021.01.30.11.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Jan 2021 11:04:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@modwiz-com.20150623.gappssmtp.com header.s=20150623 header.b=CIA8NvEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5vYE-0002bO-Cq
	for alex.bennee@linaro.org; Sat, 30 Jan 2021 14:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vY5-0002bI-At
 for qemu-arm@nongnu.org; Sat, 30 Jan 2021 14:04:45 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5vY1-0007zm-Ms
 for qemu-arm@nongnu.org; Sat, 30 Jan 2021 14:04:45 -0500
Received: by mail-ed1-x532.google.com with SMTP id s5so1512548edw.8
 for <qemu-arm@nongnu.org>; Sat, 30 Jan 2021 11:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=g9ov0VVs1sCdcd4GwD2Rn1yejaNO5CuETR3oztC0Xkg=;
 b=CIA8NvEulkN+vLw83eXXsBwWIUXXqW/Jpc4iD01+5FBwHdK2T5VfjHyP+Eel4YI+H8
 JyXiJPCHNWsy2+J9t73XriTuRvntpXPDn2psNuxGy+UHs+ZiRFq53cadFtxKiogZfxgf
 +m6Z+X8ThmF9W/97AQAP2l9V4xojFyH+XWGCeDAMXWLrH39EZav0J4BUVfPBQ2Uz9ii0
 E2yn8EfRWja9XAC5wCWphCOBw/h70alSLIF6rxYWq1gdxKOwLbvRsZ1DyjvIDgfwOYdA
 2RbCFoBrlNi3OP7cWduVsnBoRmVgizuCBq+gdCItCQLuysNZgo3AMmuM2BoaQliWAp+X
 jy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=g9ov0VVs1sCdcd4GwD2Rn1yejaNO5CuETR3oztC0Xkg=;
 b=Js+n84KM+ZYM/qzKovL+oFa8RmnLL3i98b9b8nP5dUo9OYhBNRSEKayRAZntVkbBdp
 gM/t/q15qPn503hTk8xgkDfHDFUlunKCGH1YpmgrW54nOr1jpW9wY96Rq/Llc+MZdQbi
 6TT81AuB/AX23Twpv0arji4TloErWgwcGLK7OlzwM2knJRZ1HPO62dyq0gfdNk7TW/XK
 D5zSRRjYt3xiTeLsSnhTtPYigkzCyffnqU5BbCI3NEh0I7AHdtaRu64CA0xmkmIaivMA
 2H9CUuRX7cc1JqAwHxggp2S/lzMJslJfn6YPrMltcbsPMJyIPLZArGAkXRrmWWtgOOUg
 XX/Q==
X-Gm-Message-State: AOAM533Ao+Wv9e9qMKPFeBm/aLvlG5iEsvD56nR8aut3nNy0tJ6/KCia
 Udh3uqsd1pVN/jgt5x9KT7za+3zSXEo2/dmu/wm/dahZ7fpj9YqfBh8=
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr11164355edx.191.1612033479865; 
 Sat, 30 Jan 2021 11:04:39 -0800 (PST)
MIME-Version: 1.0
From: Iris Johnson <iris@modwiz.com>
Date: Sat, 30 Jan 2021 13:04:28 -0600
Message-ID: <CAN6Exg2Kz9yu-9Ftx4V5QL31duVdNCvR3_Pn-4PG39_zRm+pzw@mail.gmail.com>
Subject: Question: Adding emulated machine support for Apple M1 mac
To: QEMU Arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=iris@modwiz.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oW559irHWj+k

Hi all,

In light of attempts to get Linux bootstrapped on the new M1 macs I've
been working on supporting them in QEMU as a new machine type, I think
this has benefits for testing and potentially there is desire for an
M1 Mac running QEMU to natively support emulating an M1 Mac and
potentially booting OS X under such a setup (although this is not
something I can personally test).

Adding a new machine type is hardly a straightforward process though
and there's a lot of paths the existing code takes that aren't ideal.
Constructing the memory map and how to handle initialization of the
hardware before jumping into code that would expect to be loaded from
firmware bootloaders are two examples of cases that are handled in a
multitude of different ways.

I'm looking for some feedback on the possible approaches, you can find
the current progress of my work on what might (eventually) turn into a
potential patch adding support here:
https://github.com/modwizcode/qemu/tree/add_M1_test.

Currently I'm focused on booting m1n1
(https://github.com/AsahiLinux/m1n1/), a sort of linux loader, with
the goal to have enough support to not need any qemu specific m1n1
patches to handle qemu differences. This goal has been achieved well
enough to start work on basic framebuffer and interrupt controller
implementation.

The most objectionable area at the moment is that I currently just
modify the cortex-a72 to stub out a few Apple M1 specific MSRs,
obviously a real coretype for the M1 should be added (probably two to
account for differences between the two types of cores it has).

Currently I have an "AppleM1SoC" object that will hold all the
peripherals, and then I add a simple machine definition called
"apple-m1" that (once more information is available) should simulate
the hardware environment of an M1 based mac mini.

Feedback would be appreciated on desire for this, implementation
suggestions, critiques (although there's some cleanup I'm saving for
later once I've decided on a more correct approach)

Thanks
Iris Johnson
