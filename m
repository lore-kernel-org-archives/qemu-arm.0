Received: by 10.25.44.15 with SMTP id s15csp4618515lfs;
        Tue, 11 Jul 2017 03:19:05 -0700 (PDT)
X-Received: by 10.55.192.10 with SMTP id o10mr4883171qki.86.1499768345839;
        Tue, 11 Jul 2017 03:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499768345; cv=none;
        d=google.com; s=arc-20160816;
        b=lWZJrauqqktMKlINdQ0amOJM3zLbmfjfFMUvD+sqi7ifvvN5FRNtwq1XzcSuKjdr2R
         zo3U0qvpsSMP7ihrxSSccYSG88QHxZmRG972yN9+1qF27eN6Mkf2xG40AHR3G8/YG0bY
         AphvF/wDHUjYoYqymzqjA3LxpHylHPMvFgrjP76bO/XaA+o5r97p4y+acPX4Lc79nZeJ
         QtqtWRGgzx/y80OzlHrPFMjqfXcKl5CjsjTRHlp+gCiKFvTHtJYm0b2+3oBXSvZ1A0lk
         ZPjOJO69Cw0iw5J5GZKklCHjqVxwVR4v9ICvSK30W2CAU+8EbcO4Ca+LrBrp3vm5X1qs
         OuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+3mIz6/irxNkulfuPfFPtZvQHLaA51O27p86/PlHEGk=;
        b=Am9kg/II04n/Lg1zmQ1ONA2rixh0yXWiaWYJ2wpZdAeDZjtwjZVgbMQnO748VAKmHa
         n5Wwnmk45bl53mL+ih4hCgJMaZFiP8cPjvxCG+RIybM0eDxdDFl8/tqTjKfMNuna4zbk
         U7trG2euonIUR2aLGdcQ6SDcW9DTerGLDM7PlSo5VQ/ey2CUyQBJt2W6N4rpR0a2YVE1
         FlEjPP1yJHdftNo/kWv17wP71IIPYYKCB2Kd9UFjL3nDLdLBBo2Qc9/kyLYseZS0zO/g
         VCbtsg8aFnw6H3BpCyMtyIbGo/Q347v2TShDBzSKPm1aVY75roLIVO0wExHJQ8kY0Gn+
         sFJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=K0sulbSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b13si5464979qkg.336.2017.07.11.03.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 03:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=K0sulbSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUsFz-0003Ki-2n
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 06:19:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUsFu-0003KH-R3
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 06:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUsFu-0001Mu-4f
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 06:18:58 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUsFt-0001Mc-UN
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 06:18:58 -0400
Received: by mail-wr0-x231.google.com with SMTP id k67so176036732wrc.2
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+3mIz6/irxNkulfuPfFPtZvQHLaA51O27p86/PlHEGk=;
	b=K0sulbSRoDMo4Jl92pJQT2Cw3glJW95F+SvKsRW81LeEYkNKNubS9Hido9IDbSdZl9
	e+o+Kmsv82wASpkA4X6HVnt1STvL2GKFvcyoUBmDl1dU14rsbp3YAO8DKc+gZjxRLZDE
	uqNwSN17SrvUSs0XLfDTYBHkEFAGHB+PrH1NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+3mIz6/irxNkulfuPfFPtZvQHLaA51O27p86/PlHEGk=;
	b=STUEjNpS1fWHZgugdg8LZyIkjHpuyiuWZlUZyLSPa3c2C7xi9G4xEQJLqTgDuZwDpD
	EnK2od7YggeLZTmBTNuEnLh7OEBKo8fnbWAiGOd0Uq8qVugHi5nT6KUTeSuyUUKx9Z6A
	Mzpn6XF2L2cGOPt+ieFCHsOQpfMooKWLB64oUrRp9XqI+qi9uppHS7eED4On6SDCwCmj
	5ZRKCGcxpNRFEEcU99qFxwjWN2esqcg+AAagZA/PLaPuetWurgZXz36LTgULQDL/W6mR
	pTJhHQ9tj7usBQToPcRVWveIAtjP9i8RxC/N2+Wn+yJ+f6avz/I5UW1zqc2cN+AUjhVy
	Pn7A==
X-Gm-Message-State: AIVw111BzsGKTdMpHgrhncN2pIrD1QQguJiAzlXjJhK9T57C7Hv/Rs7p
	lp+0zqD3NbkV7IZzVTghhsefAMJbfBUo
X-Received: by 10.223.173.143 with SMTP id w15mr10595638wrc.113.1499768336793; 
	Tue, 11 Jul 2017 03:18:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 03:18:36 -0700 (PDT)
In-Reply-To: <1498927637-14496-2-git-send-email-drjones@redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
	<1498927637-14496-2-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 11:18:36 +0100
Message-ID: <CAFEAcA-xAxe88XmyrhjbQ6t24=xBey2+XE2wwSvfO4+u1wZ_EA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-arm] [PATCH 1/3] hw/arm/virt: add pmu interrupt state
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h8JnjDgE4EY+

On 1 July 2017 at 17:47, Andrew Jones <drjones@redhat.com> wrote:
> Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
> CPU state.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
