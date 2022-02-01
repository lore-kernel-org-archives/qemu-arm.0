Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp801437lfk;
        Tue, 1 Feb 2022 15:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbN6VcXUTvw851rAq1kWu/EUUJqCgZ5FsYRMk9bf+glHz29gOyp/3t/afVEDta4sCUo0Lw
X-Received: by 2002:a25:7d02:: with SMTP id y2mr38570323ybc.23.1643759810707;
        Tue, 01 Feb 2022 15:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643759810; cv=none;
        d=google.com; s=arc-20160816;
        b=anGQVQPI1wH+uqs0qljCeyjCBWGrLigSBKn9QmKjyZuV7xI1N3UqkkJnAGDF2CV2Ey
         Ck1NRsX9Xs1A6dIQffRYDkVOT4vG7ve7i8ZMJ8m+UelXDqAyenQv7rRn/oJOX5ykmVfr
         htV2l4TCSQpMooD2id2nqlkN+eoBGLWiWqI6oyaGPO6cFF6OZEuGwTv9nmTT40srWRd6
         V8HCigMIq2TAHWCxFeCuIUUf1ODfR9M/JASBhWSTJpAMKVu5XUOcdnGyf8HWha5v+o/i
         kT4SgTgPJe2tLLoCBO4Zqjb9Zj190fz3nH22in8Tblj7MH4Gi4EjPwxQKmT5g4C7zOW+
         HQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:to:from;
        bh=+RTfN15ZyHTFKylKbnvHo7ev7eWhKXN9YmfDSVPp6FA=;
        b=tFYG/koQd7Ix+7RR4mYEa48nlKXIrgSm6/5wPaRp2saU/KZDMUJjAuCHcFrb+aTdRk
         r8ejatUcRz1DSb3oYlc+yTcS8Op1oqDVJ6vzeHLKVq7j7FA6+ROwg8eU9AK23JASsWxq
         4cz7j3Aq6y8VbqSTEx44K9kzKEc7Chs2HMeZP77wQ6byJLQ40hSluBhFD9XnuDjhOLrz
         HmZWeAscc2PDYjT8QuYa7uY+yS5CW2FOZ0Dm0iSqqV5AF2yuFbasN/59tzDhko1dpC+I
         a+shUnnVD+jChby0eAhuDCD/nY8NIcHp43bzTkbbl4OLgWDFVPmnhxeVvx56OIr8qBor
         VjhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si22908653ybk.517.2022.02.01.15.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Feb 2022 15:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nF310-00007Y-4a
	for alex.bennee@linaro.org; Tue, 01 Feb 2022 18:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nF2N3-0002rw-Mm
 for qemu-arm@nongnu.org; Tue, 01 Feb 2022 18:15:43 -0500
Received: from dia.uberspace.de ([185.26.156.221]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@rpls.de>) id 1nF2My-0002eL-3V
 for qemu-arm@nongnu.org; Tue, 01 Feb 2022 18:15:32 -0500
Received: (qmail 17468 invoked by uid 989); 1 Feb 2022 23:15:25 -0000
Authentication-Results: dia.uberspace.de;
	auth=pass (plain)
From: Richard Petri <git@rpls.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/timer/armv7m_systick: Update clock source before
 enabling timer
In-Reply-To: <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
References: <20220201192650.289584-1-git@rpls.de>
 <CAFEAcA-amKEjN2p9UbPLw2-1CdnPGqY+xG7bTMgnGdLnDKirzA@mail.gmail.com>
Date: Wed, 02 Feb 2022 00:15:25 +0100
Message-ID: <87sft2rxf6.fsf@sit.fraunhofer.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-0.331549)
X-Rspamd-Score: -0.431549
Received: from unknown (HELO unkown) (::1)
 by dia.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Wed, 02 Feb 2022 00:15:25 +0100
Received-SPF: pass client-ip=185.26.156.221; envelope-from=git@rpls.de;
 helo=dia.uberspace.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EPA9ZzKKmf5T

On Tue, Feb 01 2022, Peter Maydell <peter.maydell@linaro.org> wrote:
> Thanks, you've saved me a debugging session! I had a bug report about
> a problem with the systick timer a couple of days back, but I hadn't yet
> got round to investigating it, and now I don't have to, because this
> patch fixes the reported failure :-)

Oh, I didn't see the issue in the tracker. I guess someone else played
around with the new machines at the same time :-) A quick workaround on
the guest code side btw: set the clock source and then add the enable
flag with a separate write.

And if you still want to do a debug session: I think there is another
related problem. The `systick_reset` function sets the right clock
source, but I guess at the time of calling reset the `cpuclk` doesn't
have the right value (probably zero)? I was confused at first, because
the reset code suggests that everything is OK from the start, but that
doesn't seem to be the case. I don't have a good enough overview of the
qemu sources to know what is called when. But even if the reset would be
right, first setting the clock source and then en/disabling the timer is
the better order IMO.

/Richard
