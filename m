Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6809222wrw;
        Thu, 15 Nov 2018 01:58:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5ejdDtZvu8IdKpzlgPBA3rn57c59Gs/WIEXF98w3oNe0V+FN/rfARx5AWVeYBjz1kkPclxy
X-Received: by 2002:a0c:b24f:: with SMTP id k15mr5573910qve.72.1542275887404;
        Thu, 15 Nov 2018 01:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275887; cv=none;
        d=google.com; s=arc-20160816;
        b=uBb/Aj90aA6aQr+scgo9RzdGMfv77CNrA1I7xpSd0sEldw3qTMpX8WWrhcwb/zeoS/
         +M3gbuGZDRYchE02AXvrks3QNE+VpO81RtLtICciwk4xi0XUR4Gi+BETeW+uWwKT+OIs
         9tf1wsQ5MBu8l5LUAglqVQoOwY5N6aPja4T2UzGun+oQJax+r3QXzGX9lWsP7A8rHcZx
         PnTSqHRpY5hVqOSyPFvI/FemizHiPpGVqDIiixu37w+RjzaolzIgB6olSKQndE40DCjx
         FeOSRpwLNM92MNtOPE2zwcL2iYLyz51iPdWrMsQspOyCvazYAfIuO8kKOLnxS+drLMZC
         gPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=OkWBTpeq6vlFTpPSfGVcJZgnSUc5NG1tqzzs39yroco=;
        b=IJiaT3myT+hGi4ga0SUS7YZEsMRaMR6s5SKre387r8s+0bP5tBvc0eAOocL3LIXR53
         sUENTcZGJvN9MxSPeGQz5d8JADXto3Hg/4voblNaA3DtNpsf0OgPDsgyR2fcAOaoYFNo
         JUg3zYtTPj1BmGmfBW/QZfk+C3epHCo9lb6bPN4zrKr6aa13Ao/XyzE/gdObs7zhzHr5
         wYnxtk8HTdopEXUmtKN8KHh09/smuZRDK1+Ztoev7QngfmUEFVvEkJl86DAbKK5oPk8J
         Qd5DcSsUTXbWuqxH1RbIIDCA2A9alGWSI0qsdzSPMuSPgSj23TrAIbfDP4FM5ARmBvMY
         e+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SaCzLKZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si8564848qvh.63.2018.11.15.01.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SaCzLKZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEPW-00033o-Sd
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:58:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNEKC-0006Ng-Ol
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:52:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNEK9-0002Rl-1F
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:52:35 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNEK6-0002PO-L6
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:52:31 -0500
Received: by mail-oi1-x241.google.com with SMTP id a202-v6so8120168oib.1
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 01:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OkWBTpeq6vlFTpPSfGVcJZgnSUc5NG1tqzzs39yroco=;
	b=SaCzLKZgRHp0qdjR/fFq1ZQf2gQvEmnSgBcmTwIYkGyj5Xp3HVfTPkAYOecjS66QtH
	zN9J77nHJmf5StxVRJycgP6KFXXyAzNkw2H1ybzKYPEb/y1zjrfnKmmYaW0HSt3pWuwq
	hqGRV0+xHdijrm+4JpjP4ku+kti+vFKidFu3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OkWBTpeq6vlFTpPSfGVcJZgnSUc5NG1tqzzs39yroco=;
	b=UrpKNBOtMURP+lz3bTsPAg9HNZdaH2q4dF1NrzqpwdvLFejAL3qSbkmvALIODpgLKZ
	Pg8IyaIL2O1r8vAcyAQZdFr+NIwC8YIog1ggCSSaG7f7KUljw/9J4eIJnWogCxMu7UIW
	gwBchmS1djHjgYq7TGLJVrEEMcsQKogZzMhJAJJZE0KK3Anf2B4jD4v4s5j8e/7FpCPx
	MNk+2D8DrJ9IP7ynSXDNPMDYCgFsjiPKkQqDNzhSNtsTyNrpqeUG9xVHkNJXy4qjykul
	mwskEHJNfuf7gUWVd+B8Xb80HZKWzhyttcNR39+B1LsPrj0cSWDbcq/8MbejjPnyIsHf
	/i6w==
X-Gm-Message-State: AGRZ1gKUQI/xsmKd8OHTCG4CW0KJMR4dSobccvkW5ToSkDQ1h9BuufnS
	YE4W/hXaSSF8TfQIt8SD0lhoZAFteDztEF7p7nCBDA==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr3356186oih.332.1542275547072; 
	Thu, 15 Nov 2018 01:52:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 01:52:06
	-0800 (PST)
In-Reply-To: <293e1825-5f9d-1e40-85d7-cca1fb16ba94@gmail.com>
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
	<293e1825-5f9d-1e40-85d7-cca1fb16ba94@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 09:52:06 +0000
Message-ID: <CAFEAcA-h2AV_ybL==pcsz6QQRpQm-Ar-jjTC8zh5bx4UdKMyPg@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Support u-boot noload images
 for arm as used by NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XfljJhZqpMuE

On 15 November 2018 at 09:22, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
> ping

Hi; thanks for the ping. This patch is in my to-review queue but it
may be a little while til I get to it, as I'm currently prioritising
work for the 3.1 release, and this will be a new feature for 4.0.

thanks
-- PMM
