Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1403011lfp;
        Mon, 18 Jul 2022 09:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sWUXT9m1NtmfY+LMJYBojkdglvbcm43wjAsh2HoATpiKqHsvVLPOMBJ2o9vNVyOOUMpVQ8
X-Received: by 2002:ae9:f302:0:b0:6b5:520d:194d with SMTP id p2-20020ae9f302000000b006b5520d194dmr17461265qkg.617.1658162733259;
        Mon, 18 Jul 2022 09:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658162733; cv=none;
        d=google.com; s=arc-20160816;
        b=BQR/0qhepEMmiVPKdzSin/bfNCZGt7twHeHyMogSkiBYzP+Sf3asGa1kF9on9oJi3Y
         Vu0OCuHViz/gj8gH1JimLwQfCLf3qt1lbrGjTyV3z6OW2a/n5Vl0SUEKLXyJ1JT7gdiu
         I02otd2vhmLi1E+cz/mYGWsd8DocWb3RZ0+irEGNUeEXK7pJdZiUujvKlWjP8bUfFaFb
         TJubgVwxC+RznZC4amQ+EXX7KFoI76nszeB3N5we4YVtCmMk8NzISOx28O3cEe1F3VPE
         sWGJoYg75steKZvSXhoNeUWxNum2AXk1OItHW2M/6D8Pq0sUCkO9ofHCZQpjFHT7FWSy
         8GrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F3CjwMJanWnb0Ty3YKvemEn+k96tMz1Z28xI1PTY5JE=;
        b=0JnbNqqwTIutSkoMCfhq8XEuk7UMq9Y11MifWaHHNQb4ybUnIr/7Gl4XsqN9ID6VRc
         rfoCRtnU3p2R5F1AHgY6E5NkzKIG2jWharwvxGIbKB3iNDrchNi13p/O6KbzJ53cw9LA
         jaiNZRaR6x9WN2syDh41IBlcoLc0qUZGnbLo6V517PT6roHgKp569Lb1xlGHzcH46dVX
         O9Z1sU8R0HQKx86iy08ChxTj1qfMLoMLT20ycPPuv1v438JX/A63W01gW5DykgKzSu5E
         9hrXASP/SwEOI7n5wjdL9tgQWvnFuTUI4K6zV9bSWDnQBA+OlhQzj3vDcyvUkZ5wbqeF
         2GEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXI7T1TU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb20-20020a05622a1b1400b003196e8eda00si3590056qtb.290.2022.07.18.09.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 09:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXI7T1TU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDTsB-0003bt-PS
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTqx-0001nR-NW
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 12:44:15 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTqv-0003sd-Vz
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 12:44:15 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31e0d4ad6caso53131637b3.10
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F3CjwMJanWnb0Ty3YKvemEn+k96tMz1Z28xI1PTY5JE=;
 b=PXI7T1TUiACmoDEfxoKAxyTk2caFB6y7tR/LCy/SY37GsQ5EY+Qa7ipo5J5yB2bgnI
 9s/UVk7IDLDdZTHfjW3714ENV94KmO3up0opRNWoGEcykEIomcLAgmDTobNqm0MLvO6k
 fQSzmMQx2OCQe4VWtOb8kBUV6idkOoHj3tz/3UqZHKyIL57bN/Tvl2QoQb56AfbzsgL+
 D+EIJudi5DySEU8DOEY6CkACIz7LZifjGl8ZKSxHx506OAKdffKyorRT48SPEJe3OcSQ
 cNZfAVw+vZvtwl/RbjobwMEq3JRGM1SlsdppM4dlOKTwhXMfyCM2rQgRrDZA6U4minXt
 eELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F3CjwMJanWnb0Ty3YKvemEn+k96tMz1Z28xI1PTY5JE=;
 b=Zny2aeojMjFmIiVzZrqloXRyqevaVIRzHhkhAKdg6O+23xQr0s8rY+qrWx+oYfsj+8
 qO85Rgn6kAHALRXxaaoVY7w0zRNcSW3YY2tVqHkr7Dl+qXMXNXlRojoTFqxwDL6Dbv2m
 m7KhvN48LTZrCxpk0sM1yUmOHrKJMKDGHntcHVNZNBoa+TM/qsvVVtY9cYfC9QrDSZXj
 LjBiLyGSP0m8gtLRG76undgDkQYrGifbh9FRKfnRMEcBJny4XTNcgaHHQPoDS3Msxp/l
 fOPJjWfh2PvGhVSFWo+3ay+cir8ExdH8mcSxCoWCqjBJo9IXZM2RVSMfg2Vn/7yuJacF
 eLdg==
X-Gm-Message-State: AJIora/fZqHoMsXI4a37h2lQhpqwCxD6IXrl3/Z2ac8IGcCOkc8+uj+4
 vUGKYOgdgcANQ/FMm//wZTWHWBL3IC6vDAAdUwql9w==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr30187828ywg.329.1658162651811; Mon, 18
 Jul 2022 09:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
In-Reply-To: <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 17:44:01 +0100
Message-ID: <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95V+0LfAiYl+

On Fri, 15 Jul 2022 at 17:18, Jon Alduan <jon.alduan@gmail.com> wrote:
> thanks for answering so fast.
> Attached a tarball file containing everything you need to reproduce it (If not, please let me know).

I can't repro this compiling your test from source, either with
a build of QEMU 5.0 or with current git:

$ arm-linux-gnueabihf-gcc -O2 -o /tmp/timertest src/testTimer.cpp
-static -pthread -lrt
$ ~/linaro/qemu-from-laptop/qemu/build/qemu-5.0/arm-linux-user/qemu-arm
/tmp/timertest
Create timer 0 536856
Create timer 1 537904
Create timer 2 537920
Create timer 3 537936
Create timer 4 537952
thread1: started
thread9: started
thread0: started
thread3: started
thread2: started
thread4: started
thread5: started
thread6: started
thread7: started
thread8: started
thread0: saw 0 alarms from 0
signal from alarm 0 536856 0
signal from alarm 2 537920 2
signal from alarm 4 537952 4
signal from alarm 0 536856 0
signal from alarm 1 537904 1
signal from alarm 4 537952 4
signal from alarm 3 537936 3
signal from alarm 2 537920 2
signal from alarm 0 536856 0
signal from alarm 2 537920 2
signal from alarm 4 537952 4
Remove timer 0 536856
signal from alarm 1 537904 1
signal from alarm 2 537920 2
signal from alarm 4 537952 4
signal from alarm 3 537936 3
signal from alarm 2 537920 2
signal from alarm 4 537952 4
signal from alarm 1 537904 1
signal from alarm 4 537952 4
signal from alarm 3 537936 3
signal from alarm 2 537920 2
signal from alarm 2 537920 2
signal from alarm 4 537952 4
signal from alarm 2 537920 2
signal from alarm 1 537904 1
Remove timer 1 537904
signal from alarm 3 537936 3
signal from alarm 4 537952 4
signal from alarm 2 537920 2
signal from alarm 4 537952 4
signal from alarm 3 537936 3
signal from alarm 2 537920 2
signal from alarm 4 537952 4
^C

thanks
-- PMM
