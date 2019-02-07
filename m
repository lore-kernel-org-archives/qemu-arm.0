Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp116739wrq;
        Thu, 7 Feb 2019 09:54:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaZz0bD/h9ti+jW0rRlFjXpRqQIcjfdGzzX+mHumKEfRI/vijv1wvy+ApGpe5ZbrQ6Tos6O
X-Received: by 2002:a81:9b10:: with SMTP id s16mr14344306ywg.335.1549562053369;
        Thu, 07 Feb 2019 09:54:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549562053; cv=none;
        d=google.com; s=arc-20160816;
        b=ou5SUOQljYnQfuvcgJq7H1j1SLU1pWzZ3OcJJ/wMuKejEJA/mtrM5cKWdn5hoQwzTk
         Z28IPsgqzjot6hGpGCTqBtBS6xPnCgBfQdheE0r25crFa1yVYL8p1MxU3aDyLx6AFTnX
         ff3swojWWeaI4xFojf9jaxXyGeSG0SqE5CzWulrpxPJPV9nPNt9J5FdgePOad10FZl1e
         QMVnOjdtZwUJrE4tQJZkzPxwvbP13OLeVO/ikZVC1W1Erw5Qwu6NXmUsL+K8syMrXdgH
         FIPUAFqzi2rqkMnhoLnTLjyH7INKgd3JJURkXP623bQ7yGOL3VabNhGKdIgdKepUPatJ
         M2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAvfixq+x604Xsb0NGCukJNQPybekNGJD//+ITlvSR8=;
        b=CY7r7tK12xx+jTI8t66D3ED6DwjTki8PY1K9AqAPt6ZroaIGSGX0tNIpTcWsONQcJD
         7Lsy63AI7WfuE+4smErcr8i4/laN0zcXWkqgb6hibsYovYNvZf80E/W27Iy1jw0y8vis
         Ss3xBD60hdhrkYfLyyIKmooLAJ2/KKfrkH74a95nDzDqz0AV0PjmYnGOayhrkDoSLOUa
         yZdcfsR2RjvyN00Nw/dyYqnBtw0p9HYjmUQa9YpM+JrUCMG/3S7ahbU0USh5jy0ojKpM
         TzsTd+lLVasTYzST3yOEq/LSXxDF2phlyIZYO9lrQ+lnLrIYI4K0kQ0Vb+hZhbEI3SLM
         qsSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HPe03P+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si5919033ywd.414.2019.02.07.09.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:54:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HPe03P+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnsK-0000HN-TE
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnsD-0000Gx-SM
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnsB-0000Ce-TK
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:54:05 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grnsA-0000Bq-43
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:54:03 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so1332502otj.2
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lAvfixq+x604Xsb0NGCukJNQPybekNGJD//+ITlvSR8=;
	b=HPe03P+W2qUY6kFLirGTIB3K1a1BgdAdHv9n9cnr6NlvMZc8CtOnCzB90IZqhAc7Or
	UTmmSs1UP2W4XOBG9s0WEEurvbEW+fZYfLPkHvs3eIaVDOdfVU3Y2XH4l7dM9NPSV5KO
	IcsvPli6dgfDWvxI+qWmiMHLSTG7khmopWPKKqoOS08lcpts//tmyiBAjKr9Nd6+cgop
	FKEbZeZsBBlFWjymAI5LwFZNZ7i3A8B7At0lphLBIrOBi+f+9eljlXYYFIySrwRIcOXV
	j6MLFD/qIvyv8YRrBkra1Kc1pv0p+sBVUfTumug6lLSn53+9pWJfJ3C/cFwdOPyUuSEz
	FsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lAvfixq+x604Xsb0NGCukJNQPybekNGJD//+ITlvSR8=;
	b=n6O3529MfdO9eXDpIC/Hy3t3BqIqCH6I8OsH0ExTSbXdMlXv2fAA9bj2ZucSG4E/ui
	S8Hcg79UozTt3lPKdzSrd3vXLQuCCV71UTMU5u+5feW4dkqqFnPEre0pEjH65+IiDthT
	hnmc7NaRlaGCMmflqCVfzTf3V+DrKfYhrWk9+ZaVCksIMwi3tGS5esEKmrvLhntjNeT7
	JRSCmafkWPqD9x/5BzDOqNJmvV/SeGi7SUBfLLB+6peAZ/TNKGcSIxTQvjT7Qhp9XKPs
	m3FPx68WWTSw5KuVihYvL/x8vgPRc/PSON2X3WGYS/cFu4zpMvf0uAaybR/Fb3Ssbe6b
	3chg==
X-Gm-Message-State: AHQUAuZWJT1v+I09AVzrVsLf/FO/4i53+p/Qtki5c4G6LgXP0PT5vQeV
	4KcQvrHG9ru9vl1kSKRzPqmZmoArGju4EvAC7+fmrg==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr9443762otc.238.1549562039455; 
	Thu, 07 Feb 2019 09:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<CAFEAcA8XTc5RTxifOA-cYb2FfRaC5ZMBh3AEcxL8LZqh7qxo7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8XTc5RTxifOA-cYb2FfRaC5ZMBh3AEcxL8LZqh7qxo7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:53:48 +0000
Message-ID: <CAFEAcA9ecJu19JjSgHrNK9n7tHmjJRkGrRvJZ5MYNLdRCfk-VQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 00/17] target/arm: Implement ARMv8.5-MemTag
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
Cc: Mark Rutland <mark.rutland@arm.com>, szabolcs.nagy@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
	Dave P Martin <dave.martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: myCgsx81CTWO

On Tue, 5 Feb 2019 at 19:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> I'm working through review of this, but feel free to rebase on
> current master (which has now got a pile of your other patches
> in it, since I've just merged target-arm.next) without waiting
> for me to finish going through it.

OK, I've now finished review of it. I haven't looked at the
last few patches which are linux-user, because it doesn't
seem worth doing much review on them until we have at least
a proposed Linux userspace ABI for MemTag to compare them
against. (If we do want to do an implementation that precedes
the ABI being nailed down, we need to hide it behind a
defaults-to-off x-property.)

thanks
-- PMM
