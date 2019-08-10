Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10476937wrv;
        Sat, 10 Aug 2019 07:02:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvVB6Rutlzwa5L8M7fJU7LdHJPR+zWP1hSTs31BQQGAIq7vtX93n8zzLTp9Od7IF1vF/2j
X-Received: by 2002:ac8:689a:: with SMTP id m26mr22590388qtq.192.1565445724140;
        Sat, 10 Aug 2019 07:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565445724; cv=none;
        d=google.com; s=arc-20160816;
        b=AZTvnYifLtPHlgU1BSISPEkR7HEeGSD/mlzu0V3Fe4xHFz7AXqdnByO8ahqHoHB/96
         JEtKjnS91a3FasfN7DrLBL0E2sHlRd7sgcwwQ8ynQj8/9AfXfekTHyxyWQYlLFxv6hVO
         A7OXb2quKKO+IAON+UqWhKxfuaV+dB+HG0nHXZwl8cnHvLDeZcjbH9Eveq0yZD8MvVeP
         HLYpBHa5J6v403Iu24m8O2gnyZP4xsDvkZ3PBWpCVY/mGfJgWz+k9jOWG5xTFZy1b9Mu
         WQ62Dr6TnqvyEihrFVzUJ6amtkoeTUonsNMfg7sNKjE3xgndi3Z5Jc1dLbt6203+bMcO
         kKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PPYv0iX/gZ679yNJSyL7o1U/g5Zvio970XEQGheyHuA=;
        b=kuB6OHuV60hR95WWqpOTevhq+WhqlGS/47ybksIBtkoS+W/B6ak580Hac/2XR7+6W5
         eIVNmxJXccHe/ovv62d5fnBPxiY7GycM+mfIM4rimdoZkhawoBXulHQn6Ri/N/UizQl2
         Wk6mx9MCRe4upWreCCvMguQkdvaLQj5p2n90GKpAXPVcuT9vTT2WlXNB6ViKdQAyqyN+
         3pDJrX3bU/CfULaLVDslLQ/UpE4u9iIHXLAxve352q0SlmPQxzod6+3JlXCVzjHWuq3i
         4dXhKGDq204HXvvyMleu7Dj3IdLzsQykh8Oakknz0qK5teGhF/Fbb4GleAUV+B3TFvMB
         xVzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxj2uJIR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si3271250qtb.285.2019.08.10.07.02.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Aug 2019 07:02:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uxj2uJIR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hwRwZ-0000T2-Np
	for alex.bennee@linaro.org; Sat, 10 Aug 2019 10:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hwRwO-0000Su-TY
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 10:01:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hwRwN-0006Wv-Rg
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 10:01:52 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38119)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hwRwN-0006We-MK
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 10:01:51 -0400
Received: by mail-ot1-x330.google.com with SMTP id d17so143701839oth.5
 for <qemu-arm@nongnu.org>; Sat, 10 Aug 2019 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPYv0iX/gZ679yNJSyL7o1U/g5Zvio970XEQGheyHuA=;
 b=uxj2uJIRGGUqiH9zcH9htTBfVqEdGMeTwaiXCl2P/+Z6udsZqKxt6I/pZGZvJ3IiU2
 O+CLKcDbSkQ2VClBwiL01EeGNCsUxdUnstWXlLR2p81RE3a+dVw4/5edzmrbVQmfwJ9E
 44hVLstL7oPmdNg3qeWYSzE7++6XKngDpZEds7JnZrKE4yuvsgVRs3fSoTf47MTINnUW
 SRXc8Jpf6Bo/X9RkVoZ7j7JuCLWgbVye0GK81ktTnVRo4VM5j5DBwSh+517fRdhLY7JZ
 CV2v6NBDVRPWjrDyDZfGiOb+LCuwAmQlnT6m+6VuMLvmj51tJv/LY56/9uZhpJthSgt9
 0NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPYv0iX/gZ679yNJSyL7o1U/g5Zvio970XEQGheyHuA=;
 b=dV15liK8TDHwUhKM+QGD1inkXX4SAUhDlorIrKRoMp+nmwh5dKR7uKYKyTrOpfyQM5
 XLEjFh7cvr2Bwcwb8PFXoeh9G57X0BVtoseFC2tO+mI/PpOHrfao6Gx1Y05vJoilCSdW
 wMpi3KBtn4zFU+2WRHXX9vo99797V/zRqpaBsjjwlJuS4mZlDaJIHPf3ZD55jUtORYrX
 wrweeJCIngtF9qbSz+1tstdvIVQ6acBK2xiPg6orDqaUfY+ZUfuOdmFURsrDiuHUkNbf
 HK3fHSXwgsJ0EFrzP8KbSqzKGpNDOJTvVWQwlbw8KXnISSrBwFfgyzN6Qfu1F4LxRUr3
 yw7A==
X-Gm-Message-State: APjAAAWS9adbJ/1whD16u+wqCdRppHo1DaBw7y9paTnCc/p6JVtWOq61
 KlD6N5FBEDEN7c5oGApYyO6QnB3s/xVfQUwxOg9QJw==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr23366748oti.91.1565445710144; 
 Sat, 10 Aug 2019 07:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
In-Reply-To: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Aug 2019 15:01:38 +0100
Message-ID: <CAFEAcA8jh7zxb02Yv-R4h-x99bsGjAg9zQMNgiSc=SQcthnyXw@mail.gmail.com>
To: Esteban Bosse <estebanbosse@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-arm] Beagle Board support
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
X-TUID: KE8Jv3lSvgZ6

On Sat, 10 Aug 2019 at 04:39, Esteban Bosse <estebanbosse@gmail.com> wrote:
> I am new in this world, but I want to port the old beagle support for qemu-linaro to mainstream.

That would certainly be nice. The major issue is that the
patchset in that tree is (a) often in an older style
of API that would need to be updated to use the current
recommended-practice APIs to go upstream, and (b) in
some places still has multiple changes tangled together
that would need to be disentangled to form a clean
reviewable patchset.

I'm happy to provide advice and code review if you're
interested in doing this work and helping to maintain
it in the upstream tree.

thanks
-- PMM
