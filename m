Received: by 10.25.0.144 with SMTP id 138csp240058lfa;
        Wed, 26 Apr 2017 04:49:43 -0700 (PDT)
X-Received: by 10.55.19.205 with SMTP id 74mr32747424qkt.220.1493207383099;
        Wed, 26 Apr 2017 04:49:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si20673942qtd.62.2017.04.26.04.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3LS2-0004Lv-Ft
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LJO-0004Zl-Gj
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1d3LJN-0006uK-Q4
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:40:46 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1d3LJN-0006uA-IZ; Wed, 26 Apr 2017 07:40:45 -0400
Received: by mail-lf0-x241.google.com with SMTP id 75so24552298lfs.3;
	Wed, 26 Apr 2017 04:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9Bh8WBC5pbaUqXqOKwat7VWBatkF4ddLXetC+61wT2o=;
	b=LOT3UKB6lwlcvfRNS96sjOGazm8vwPnQV2mT3jxGepbc6FNKvLVY1TbW/8K7WHbWxu
	2N0MUcFh15x2H25coLJaMdopKWBmscxhreJmGbCklQGG4AsdfiyXP99f7spnjmvkIqgt
	dePPhBU27+sfDbYx/1fNcN6acXhgu/HJCB1HUbSlZib2rnhSR7x36t/jo2o84ToscBKi
	/byhl4rHNbV2ONRbJGR0FdUeFmuDQCx5ZN1uswgMCG6yZ1sGfdAf/f+u6Ki2sptXKxnl
	+5ubUoh+26I0kU94xlvsWMgYFc4hDGEDzX2f3asvqvI3aVV2FIi3zeO/pS6PNVov6tNu
	TcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9Bh8WBC5pbaUqXqOKwat7VWBatkF4ddLXetC+61wT2o=;
	b=rkpV6kNG+zLGDN5zJwT7UllvbnzB1yyb0kbXw1n6GnpSKqhcdWfK7deZ2lDQ7ZzNu9
	fEfYOX92HLT/gm9YwDkzIv5bqjMWY0A1KHeb8LDXxPTogYv7ByYAKEIrDEoHzxPg3eu5
	/vkpWKCmHhaQx5AuDLTN0ARvcOCEAdgePp10YEvMeFGN/a7AMBtD3qYMCtLh3ArgMUE2
	r5tvjdFdwNDzYoRPNK4xcovFnHld4X+dhu4NKOENuXNfQAizG5wnjJxHf/er8VwrYoFF
	Zz5v0LsRAr4edwKuMI4BRYm7sBrsFo2GJoIv7z2g/40vpApgQlpxifaw9aVryetyKUY7
	aT+w==
X-Gm-Message-State: AN3rC/7b0iw/atrDg6HahwJo6qRjHMJP131Ka/2kqr/6d7+KgTweDI0n
	eLJdmTP1eZQvQ6q7m3rlyFRc/itMhA==
X-Received: by 10.46.32.35 with SMTP id g35mr14120013ljg.126.1493206844307;
	Wed, 26 Apr 2017 04:40:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.80.1 with HTTP; Wed, 26 Apr 2017 04:40:44 -0700 (PDT)
In-Reply-To: <1492173995-14140-4-git-send-email-eric.auger@redhat.com>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-4-git-send-email-eric.auger@redhat.com>
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Wed, 26 Apr 2017 17:10:44 +0530
Message-ID: <CACJhumf3+knQdPj2watGezS0E+2es+Y5Y-wW0MQ1Tw1E810UGQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 3/4] hw/intc/arm_gicv3_kvm:
 Implement pending table save
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Vijay Kilari <vijay.kilari@gmail.com>, quintela@redhat.com,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	Vijaya.Kumar@cavium.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qTF67ltWG9Xz

On Fri, Apr 14, 2017 at 6:16 PM, Eric Auger <eric.auger@redhat.com> wrote:
> This patch adds the flush of the LPI pending bits into the
> redistributor pending tables. This happens on VM stop.
>
> There is no explicit restore as the tables are implicitly sync'ed
> on ITS table restore and on LPI enable at redistributor level.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Prakash, Brahmajyosyula <Brahmajyosyula.Prakash@cavium.com>
