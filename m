Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3636189lfm;
        Sat, 4 Jul 2020 15:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC64H5wnLKp9EeQ6AicFBKFJgnRiH739343g+BnK35EGIg8Q6LiGzF8uaOBl0IPDrpB1ns
X-Received: by 2002:a25:cfd6:: with SMTP id f205mr66818851ybg.363.1593900539248;
        Sat, 04 Jul 2020 15:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593900539; cv=none;
        d=google.com; s=arc-20160816;
        b=YJ5HtESKiUnpinIa+FC6Fn2mC3mm1LJBARrUr9tJmJLINfbvcWR4DEKQ/bLblpopm8
         T++W8Nsbnzvd1AUVL/5Xoiuy8peCMx3O5I3CLVZQBpOGdSvm/ZwY6A+sID3hJDNXxo7P
         7GoZ0YaMhB080fghBvkOv3W+zoNTwWTMp2ioIJomnowPY5CBxHTTyB4uC/b+aaVjbAwT
         BHh9WsVTCg64ldHbrRxj5Y8YpCY72/Ohy/ydg5p5DxDUIQyBSiEn2B/oUEyuZJ5sDA7q
         QWkM4l9ws8UE5GX1TYQAdhhX/I5QiFRK/H6NPZuubKLWXzNRjIj7EYrceJP2gwnXdGRX
         0Sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tl9pyqwQQvWzEGKAR2q/B3OOPcIbXvoX8eKvNRuOpOU=;
        b=zUOTOz2lGvrtdULoLTmCvQ0IhfowIUVI7Vv+0Ttd2/3hT3m72b6LvBB45DuM4uP3h7
         QkTs6UiUxuumH1gdhlr/hSxISzTkLSahcZ1FkFPZM5ex2pfeyFodW/J/iDDsSqwJZVs3
         0EivmuvX7PHHjAoMfA02Ik3XMTF/NZ2V7/BbIb3Rc3lKEOl5B9s4c/+cNycbLjLFIWF/
         8PL2KjecRG8eLXhcS3n4HREHtMwJlDAL4ZLreVW9OXKfkIO5DnRdoffubzG863LfTRbz
         XMv3Y61pa1+PcUIj94DJtH9pWBbfkxlscDdkVLyo1PR2rcveU3kp/e8oIKCEKS5eQiaF
         +4tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iU9GybWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si14328865ybf.10.2020.07.04.15.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 15:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iU9GybWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrqLC-0007In-JP
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 18:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrqL5-0007HV-Nd
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 18:08:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrqL3-0003Jl-RF
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 18:08:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id w17so21160943otl.4
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tl9pyqwQQvWzEGKAR2q/B3OOPcIbXvoX8eKvNRuOpOU=;
 b=iU9GybWSxLPSqFE6OT7V0ks9zx6tnLE6JNohhn/Ai50sCBqxERjeFW1ozhvgiOkqzY
 BqQ3WeEzECWPBFDY2CseckzBVLX9evCs/B8XL/QQJfEp4BklYlRw+IT98B6zxx2t+p0J
 GmeZ4Jqu5eFv2Ekb9rYTlLBkicJxM/GuA/n/aTP3GcNUeltbdj+bwSD1MhubjnNMAygF
 +wML6Q6ALbaQxMD1bK7nxpr3zRQr47Up9PfScmtQ66UN+Ol4rS3pCrjXtaesKkfiuXh5
 oGyiFA7T3szen8Flsr8NQB4Kfiv33p4qh+ub1kOCLPtmsGKHQphOZd8uAEhJmJN7haEb
 P7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tl9pyqwQQvWzEGKAR2q/B3OOPcIbXvoX8eKvNRuOpOU=;
 b=TttLH5Fpf9r8Hlut16Q3qEzemudEhLYOvW498kZ5nCixz0SXW275aTy2IhqnoiBEmp
 eF3CuDLJrh5aKd04wrExQeqnEUq9ZgOpbFUfay4VNQRPgqeB6guzOBW0mBJpnUuSAwtB
 +oowf8tT1b1V+P81N88MWrehv5x4JjIGkBG3xbjMyBwRAEC8VL6L8mgiuHyKfHRQdats
 +AfHh58LjljUMFWr0ZNxzaTsipePhOY7C9bIJvVvxhybkyzOy0RJNLP3XVtDruERwT2S
 GMS9JA9QGS3o8C3BO0xomsFcCyj5EBedD7w+Buaa8w6VO3XkufG6lDFTlbtznpBOLaRE
 RqeQ==
X-Gm-Message-State: AOAM531lUMevxJyZHZg8+12kWrj5oajm91zwH7JkxhsBwVdqxj/uDD2g
 Losaz9eL/LpCOHROBur0FKkGQIcyPUoUT1SvzMtarUPkQvY=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr28371672oto.135.1593900528275; 
 Sat, 04 Jul 2020 15:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <b7f00d84-bb8c-78e6-3fe1-54507c872ebd@tribudubois.net>
In-Reply-To: <b7f00d84-bb8c-78e6-3fe1-54507c872ebd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Jul 2020 23:08:37 +0100
Message-ID: <CAFEAcA-5Rj_2oP2eYemy=saChKa5g0RZLNFhqML7zZVabpgxvQ@mail.gmail.com>
Subject: Re: How to force EL2 mode when booting ELF32 file as kernel on
 CortexA7 or CortexA15
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K5NkaOdmbqTP

On Sat, 4 Jul 2020 at 21:27, Jean-Christophe DUBOIS <jcd@tribudubois.net> wrote:
> When booting an ELF32 file as "kernel" then Qemu seems to always start
> in SVC (EL1) mode.
>
> When booting a "non ELF32" file (a bzimage or any other binary image) as
> "kernel" then Qemu seems to start in HYP (EL2) mode if the processor
> supports this mode (it seems to then emulate the uboot behavior)
>
> Is there a way to tell Qemu to start in HYP (EL2) mode (or even EL3
> mode) when booting an ELF file as kernel (assuming the processor
> supports it)?

QEMU basically supports two booting types for Arm:

(1) "I am a Linux kernel, boot me the way the Linux kernel booting
ABI specifies". This is what you get for -kernel for non-ELF files:
it does a bunch of things, including starting in Hyp if available,
handling secondary CPUs appropriately, and so on.

(2) "I am a bare metal binary, boot me with the CPU the way it
starts up for bare metal". This is what you get for -kernel
for ELF files. A real AArch32 CPU always starts in the highest
available privilege level, so that's Secure SVC if the CPU
has TrustZone, Hyp if it has virtualization but not trustzone,
and (NS) SVC if it has neither: QEMU does the same.
Guest code can always move itself from S-SVC to NS-Hyp if that's
where it would prefer to be.

thanks
-- PMM
