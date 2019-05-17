Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1662796wrg;
        Fri, 17 May 2019 03:15:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzk1iqeOdz39TKxcyge+Hgre+K9QShihRLTMvGvB32aVa9Ns7MG4JK03T03XkBXmLyMp8Uv
X-Received: by 2002:a50:d791:: with SMTP id w17mr55743675edi.223.1558088107797;
        Fri, 17 May 2019 03:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558088107; cv=none;
        d=google.com; s=arc-20160816;
        b=sU6DvdanLsoEKMegNJlAhK4F7j4fFp029u0qY5W8nIrS5NWF3rk2FU4WgSQOOFQg+M
         erb7mmr/7QRsIWyyOmFaDtVLY0sbaHnrVOEcxkNE/okV/QCx+ZkiBOwl3/NPNzoHNWwi
         Q2pI1gfuuTdfKq3wpkTEeDnL4BZNUT4fk34D3h94FC06gcp3xlwTxq6Uc9QNUjz9HgCN
         jstT0OcQikYdTxs9pIJ2gbqeUQyAMuMFX5WLXnCwG56iFbDtVmY3uUAgPZuRjUCEGSkP
         hVVurSHRhUDZK6OMPWRltUw5sItzpvf0NqiFPArcOhwO28pf/G2LSFGRE2FRddgbJwm7
         I8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=oKqOhqzy5CAshD5DIvmzZotPDhc9KZUbgNAqdto0Ccw=;
        b=jSsX5NmhA7m18b0h/EEgkHVc5OWqz4J4tyDKT6OQkEyDRBwgqSkzenbkbfbCyNuMnU
         mxfch+gLQQYvqKWE07VMsomsFCjtjD5rZzpIvHmNs8Mx2FCHSJQUeFZbxXjar6Ur97xr
         QpBKQprV2kT+SAbQIOlbIDebMqxUPdwde1nWjTiHhvH9dvCPwx4qD1ygUWqZOaTngwzS
         Vx5HwgyOAT/7nLoMVLLM7jLS+Rfo2hWu3MHNR3uKJA2/YKfSuOHeJAJlp6s3uLURpSTz
         bT7U4w1CqkBNPE1PlEHGEv4CCsstP/HoNTA8iPahRJxvq8BAqgPzbq+nM9kdNFXBXN4p
         piHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si5271985eja.174.2019.05.17.03.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 03:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRZtK-0003W1-Rq
	for alex.bennee@linaro.org; Fri, 17 May 2019 06:15:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRZqY-0001Gp-1G
	for qemu-arm@nongnu.org; Fri, 17 May 2019 06:12:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRZqU-0005e4-MZ
	for qemu-arm@nongnu.org; Fri, 17 May 2019 06:12:12 -0400
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:45277)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hRZqT-0005YH-DY
	for qemu-arm@nongnu.org; Fri, 17 May 2019 06:12:09 -0400
Received: from player735.ha.ovh.net (unknown [10.108.35.74])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 689D21F1A34
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 12:12:00 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player735.ha.ovh.net (Postfix) with ESMTPSA id C24D55E2D28E;
	Fri, 17 May 2019 10:11:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-4-clg@kaod.org>
	<4f7131a7-9099-f506-035f-abc584bf56b0@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1f038e7c-8980-006c-fffe-c5204052e03c@kaod.org>
Date: Fri, 17 May 2019 12:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4f7131a7-9099-f506-035f-abc584bf56b0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9867386783842929619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtvddgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.98.131
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/3] aspeed: use
 sysbus_init_child_obj() to initialize children
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VWs2Y6UMxSE7

Hello Philippe, 

[ ... ] 

> A similar patch (although better described IMO) was posted here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05931.html
> 
> However you improved it by using sysbus_init_child_obj(). If you don't
> mind I'll respin addressing Markus comment and using your improvement.

Sure, np. 

When is this patchset expected to be merged ? AFAICT, It's blocking 
this current patchset, which is blocking Joel's RTC one and others 
are on the way.

Thanks,

C. 
