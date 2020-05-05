Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp9678lfb;
        Tue, 5 May 2020 03:16:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJCVSq9Qugb6DVGnwSkAR4kkVo4NLgoi7hK9lXNc7zBY0ztlTOp9aGlrT8sYv65esdZ9fLo
X-Received: by 2002:ae9:e30d:: with SMTP id v13mr2679062qkf.309.1588673814621;
        Tue, 05 May 2020 03:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588673814; cv=none;
        d=google.com; s=arc-20160816;
        b=jzBKy99YjVZyRBKgDGKhFHLZ3ixEp/hZSyLbD621cpODf0n6JVPZerAz2EGaSlrq2y
         ki3jScr44iN7vD2ZpnWFnU4r5HHWds+16DN8lOLsRIvbPXc1ZKBHiGOhbVOIEBVOmIPc
         cfbZHNeIjLVE55mLiwRHizWB1FkYMqoABcs6p9KJfrY9xyr1EA0y4nkFdP5/c8i3PAiT
         KoqL74mgg5Vrwq0dngRA+bjbtTni8BTRk6tqKF4peovThGsrXMDCmGYFf/HD9CI0KmPd
         iC/r5ZdacMBQ2hPVPXQYAYh7DzAqE07kJB86F9Vb8SMFqOlMj4bd9Y7zp8GpztHKBQTv
         ih9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k2E1BANozowIuRLwzQhWAkc5j3kkcoUCFJeH+kJb5Uc=;
        b=nadxbHGLBADJTErDHbuqYdAVzFc5aee/oLJLUoeHwnIxyc6dk6XH/Ae3RMDRlZ3OrI
         odlSfcVh+23JmpMpQwVJ0onEe+SQ0F+IMuwEOMd70VCtWM2InesXblwQSFBEY+r7XBNF
         9MbwFBDQXKoel1fkLDLRFXXFnPgZiPRgabcGWgENeP5q1vNF8SqNJbxXu8WuSPVJB+pS
         2f5nupQfzFDTNTK8u+tw6OjdYSQbwPzp04258be8nU0l8vsvYvnOWsqV4Yh1WPiyFOxx
         gl3snuZmIyqa/H5OeQzlDQTQjNgWB09wCFISHpb7hZkwKzYhe6gjIrChOSbBwkfuaBjG
         vq5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uh0mg/F5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j12si968990qvo.21.2020.05.05.03.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 03:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="uh0mg/F5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVudC-0001S6-20
	for alex.bennee@linaro.org; Tue, 05 May 2020 06:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVuXF-0005ue-MF
 for qemu-arm@nongnu.org; Tue, 05 May 2020 06:10:45 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVuXE-0001wZ-O8
 for qemu-arm@nongnu.org; Tue, 05 May 2020 06:10:45 -0400
Received: by mail-ot1-x343.google.com with SMTP id g14so1141639otg.10
 for <qemu-arm@nongnu.org>; Tue, 05 May 2020 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k2E1BANozowIuRLwzQhWAkc5j3kkcoUCFJeH+kJb5Uc=;
 b=uh0mg/F57LfyLKGl4gKQ3i0zq5ozIDmsn8qKb11GOhDcpbjfHr6hB/rEzY3yh2CGKb
 +Md45jf9/FnbjvrtBj7/rM+nf2v0VpJlYDBqpaSJ9qo8tNTfiwQuLKmxTQ4XRzb7G/ZK
 9iqO0kHqLIMJLVs1WW2HrWEqlkwYay64rQ7uxgN2q/Y0a98WvVmA99YdQc8EYYoHymic
 srIq5b5/XodbyjHh/f92tScv2wjQiO3QG+YKAx8REtKosdjTNoNcTAVJlxl1a+1mgfDF
 yfQx6aZvM+q4lWvHt8VrBOsGFHL8fLVh0CIVSTcBnbaTdpwvk7I81fbPbe1UMNWRRArK
 1XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k2E1BANozowIuRLwzQhWAkc5j3kkcoUCFJeH+kJb5Uc=;
 b=eIMNaDXZZLg722qltQxFJvOMONxynD0h69SjI/ZnUfCiDNKV/bv1krYtqTRIfda/PM
 FfCvySCBQcTDkRhgKskbq78e6N+2IzJCSHs2CzTAr+9glF8EEMEVTaoRhQ0p5epnSkO7
 3KnWEnKPi82BAkyH6rw0q9Af8K/7Ojv+t2YOQMBIDoGYCr5YI5l1aWpVj4O7Yl3nSnKg
 6y5r3VrxrGpXk3Y7wPtn6SPsGJBUf1sDEGMpC+elSN0iDPecPSUcD4eKv34Cm7HWXnp9
 jQMZREV9eZ+bdVOUWkp7ZtwfA7mYI6iovIkXKK7yxDALl4Gfaf5fpdx7KPYHa9Rz+o/g
 3RcQ==
X-Gm-Message-State: AGi0PuYF1TBkAiQ5e2S3rlp/BMF3hZluPDdpgrOJqIsJOmmNyfF5REmo
 BzLjxgkFEnbB2KB88AzH3vosNmCMYFVAR/I/PtzBCw==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr1591546otb.135.1588673443251; 
 Tue, 05 May 2020 03:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200505095945.23146-1-f4bug@amsat.org>
 <bc8d1213-5578-52f2-7a86-f45dfa8b33be@web.de>
In-Reply-To: <bc8d1213-5578-52f2-7a86-f45dfa8b33be@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2020 11:10:32 +0100
Message-ID: <CAFEAcA_Ci7ymqWV2tvnJX-Me5D0QQhaKaBkJVaL7KxeixCZJ_Q@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/musicpal: Map the UART devices unconditionally
To: Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L56pG5douxME

On Tue, 5 May 2020 at 11:09, Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 05.05.20 11:59, Philippe Mathieu-Daud=C3=A9 wrote:
> I don't recall details anymore either (more than 10 year ago now...),
> but this looks reasonable.

My guess is that it dates back to when the serial code would
crash if passed a NULL pointer for the backend rather than
treating it as "same as if connected to a /dev/null backend".

thanks
-- PMM
