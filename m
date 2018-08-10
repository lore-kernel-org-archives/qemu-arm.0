Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4451wru;
        Fri, 10 Aug 2018 08:30:48 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyLhAvW5vzuneyMpmcBCDFoMglmXUk6gRGb9ekNciYwMu7w7encBKomz4pr8BgWv1JGGifK
X-Received: by 2002:a37:cf43:: with SMTP id e64-v6mr6026675qkj.68.1533915048404;
        Fri, 10 Aug 2018 08:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533915048; cv=none;
        d=google.com; s=arc-20160816;
        b=Qw1jJe7dL9UL97npVyPcfY6esQscuY8ghmN1yyTSdX+i/25LTrg4uDArbSTuedWkPF
         ZRSIRO9jr467hRAVMiZtbQ6Gzq1a54r2td+h4TFaO1MmUQFWVZ44RS3f5mnhVZf+YqL+
         KAaRgGW6ukdXoOyUSBmJ/2mlkIGRm7Daj3IIFYFgxIRP77Q10JCYHYYIchms3IKDD3/x
         LK2OkRTb7puvyhF/7xi2Thj3s/5MCud8sVgfKSMsMYjp32ku0RcoP6XlBgRnlsd0bGCZ
         j1QwMyCRDYo6K19KzSFLR1sDCk7wGUgwoXpmF9zRqRF/CE0WLQEBPvo1ztgvmL9HogCa
         7aaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=Ik5IQU8pcIhXzoocmDeLiXf2PqWlIJkLttMqQ7fsCf0=;
        b=Ysr+Y+xBsZtRWS7k6zhUCFiL18BdQ176/z4tfy4CTOLDzaZpBjK0icKufYF3qNBxNe
         QD3dH75z1CKtiEbVviQKcmt2ZOG8fimC+X95KPtznjlAuQP2X+BF/Z+ISdCX+blbMzHZ
         UAOUdDUnuiOcOh0FFNBLbTazf6frXIXaXXB3nRQRI1kuELWZ+quhU+sPmDSO7l+WtAP1
         bYkCTrfQVZR4wCo0xDnDdf39MtFKxWylnlh1vMaEbb7D5g6eUTywFE/BmthR70tw+FCD
         I4jitDWyDIw+I9x5uXtPIbZup2flq6SL1noU6cIeWnbG2+OQ2npDo9X/+CgE/2BmVLFP
         ayZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com header.s=20150623 header.b=lzRbQPRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16-v6si1109419qvk.273.2018.08.10.08.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Aug 2018 08:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com header.s=20150623 header.b=lzRbQPRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fo9NH-0007jp-En
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 11:30:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1fo9M4-0006fV-8O
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1fo9M3-0005JI-Fm
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:29:32 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:37887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1fo9M3-0005J0-9t
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 11:29:31 -0400
Received: by mail-ua1-x931.google.com with SMTP id y10-v6so2267338uao.4
	for <qemu-arm@nongnu.org>; Fri, 10 Aug 2018 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ik5IQU8pcIhXzoocmDeLiXf2PqWlIJkLttMqQ7fsCf0=;
	b=lzRbQPRyTYNiGmDWARMiYJHNR0lSwoC28WMsIINsZ8mpsDWuWQegzBdSftPWGLCfnR
	qZGOs/gEvTIJeQr7RNsgYv8P1kUPkxghNRCZCq0FG8Q6uqYqrlif791RdeX7OKgz0zIv
	HLW39wxPt1tgaGEWbSGbfShTYZ79WP0H4m3SIIoEZA0+34y0j5HOCOKevvI+cR33ZSDu
	jV+ayKt61ywTjYpgj8/NQEaW/cwn77crpoCdEDJjNJ33Q3GYFb94mLDnbQj4RY4OhLn6
	a8srj0pchVfMpPjNVKPgi4XJijeqVtYqWt0WiuC94p/tg6+P7108tNp0epHNEX0x/gJM
	bvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ik5IQU8pcIhXzoocmDeLiXf2PqWlIJkLttMqQ7fsCf0=;
	b=iDCuhSLbr2kdQwTDj79M0dwE06S0tAR75qmZ3cJ61Bz82IFItlHZnoMI+dr/+qjZ3g
	6BXKLgMB07wan5kgGvyf1gjlJo7c5w7MtAL+50O85h7VsfjYppSOAs6F7P1svMpgOLPu
	Gx0Zms1Z9Ny70QqX4Bz2Dk4nKpMJvOZ1Sy+5FxDtaSk4fg0wzvkNjgWiqSUAJLV5xE66
	U+87j32iU1dnE/ikfQnFO0RF+mapAdDU6UKKmGGBUk1O29m+gkdhkd4ps6K4g/yvEdhl
	Uxki6IoQbV/t6OWF5Fvdq1HEb5WaY/YgBdoOW15lSy3EewIcy8II7YXkre5fshfn+UUb
	vtzg==
X-Gm-Message-State: AOUpUlHAxSF5baHnbkuX+LxtXRp30+ub4iWyoB+Ju+UyUxuvnmpfdQ/E
	Uk7XtYCTHsPb4vnJjUWGvi40u1hkV5dMKBFDXIJ01YrPYOQ=
X-Received: by 2002:a1f:5347:: with SMTP id
	h68-v6mr4481765vkb.141.1533914970336; 
	Fri, 10 Aug 2018 08:29:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:7f53:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 08:29:29
	-0700 (PDT)
From: James Hanley <jhanley@dgtlrift.com>
Date: Fri, 10 Aug 2018 11:29:29 -0400
Message-ID: <CAF++6AMVaAcAtKHN+NpheOuvu4mKaSo7W5yMFHs7_hpALzzcTQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::931
Subject: [Qemu-arm] MPU/MCU vs board setting cpu-type
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qs9GqCwz7qS3

Would it make more sense that the MPU/MCU implementation (ie
stm32f205_soc.c) define the property for the ARM_CPU_TYPE_NAME instead
of the support board (ie netduino2.c)?

It seems like a chip die version should have that property inherently
set by its init function since it will always be the same core type
for that chip die - and for a board, if it includes that chip die in
the init, then it will incorporate that core type.

-Jim
