Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4891803wrt;
        Tue, 2 Oct 2018 03:40:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60IirvRtvvTX1oydwYMHf24yhS97ZSyD43N3KhYMg+fllvQojMvtqdHLXEk/h08SElC/oUF
X-Received: by 2002:a0c:c349:: with SMTP id j9-v6mr11660554qvi.235.1538476823951;
        Tue, 02 Oct 2018 03:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538476823; cv=none;
        d=google.com; s=arc-20160816;
        b=sGIC/y5UWcGOhz82GgdPYcJZt/Z6fuZ0n7EwbNVaq9QevEFY9uXJVFAP9fnr+a2XjQ
         jgXJZl47TgB8cgoTH1QWgPXOdA57r9noTrcIdX2qhryMcAyUtcznwwW532jV7cn8jzRr
         z64naKifYSuH3O6wUEzx56YMf8RMcRY8nCwXE1YwwvhSM35SIUx0PxiGDBDppJY0zCNk
         fsi8Cuhq3x2Iyo0AWZN87FhQc8/ks8sVYapBUccVqmSKB8rPyqmiXXiD2Gq65W3aTjfT
         h4noDdMR4PMJcFE0LUSEHMlyT4Iae6CgOdU/KN+TQD1okPwpKZaswKBkUsB/NlhiNYlT
         /Z+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=yA/f3VBRYJKcAPnPzSUXIdg+208onvmntsxHeNY4xww=;
        b=DyvMbzt33ZMprFn6KvtkI6QwEnAkydMmUbIkgRcV1zCDYipDe2DwlId5B6qBgI1NOh
         etywgx5FeaMj0YJIbtjy+ew8fjDJT7Z6pAeVhaMu/4Ns6n+kKRZpr+0sR+XSKclprSCv
         K6PnD6kG+KI1XNcJguX5ge2zQ8EZ2d2oncJ6gCrGsOw577nOUTFBaGc0f2TvEq2UepsQ
         4oo9IEYhnz9kqY52YBFhk7ISF8nsaSJXlQ7KR3GvrsBAh8C6wAul/MB572v+eTloEvQP
         STAU2bttKAYZnRffuKBEpmoW7nTyGRUIvvDdBFf4+ONmrWgmwzGZTQPFJhGC8v6LW7IQ
         iFNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gEkD3Hnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c79-v6si3264624qka.3.2018.10.02.03.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 03:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gEkD3Hnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7I6J-0001xh-E6
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 06:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7I68-0001xO-9S
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7I65-0008Oq-PS
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:40:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45645)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7I63-0008MS-S6
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:40:09 -0400
Received: by mail-oi1-x242.google.com with SMTP id e17-v6so1070928oig.12
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 03:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yA/f3VBRYJKcAPnPzSUXIdg+208onvmntsxHeNY4xww=;
	b=gEkD3Hnf4XrUgvi6m7hmjwzMM6lt/xqaVkz+DEoPKrufPymk/TXXSOBvAnuG1R0ZXo
	/VXkgnJ6TiRPEG7jA+h7CI+z+mWDZMdwhe5HPq8d5LHZPJsn7BbGbdfvVyzxvjQeeRyr
	37QeJZJ4EQaubSIJA/HiPBNQSDsIvSp20q1j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yA/f3VBRYJKcAPnPzSUXIdg+208onvmntsxHeNY4xww=;
	b=oecyJ0M6jvQeJSWMY7WuuKrC5oQA7APie2YhhYr3SkaUz/hgqRTthag7abh61Wx8ch
	P3SeGR06MhTSloMG2lqKI78D2prCLQ5KVKdOw1vjsD9zvCY9h8Z7wka1uXPX7fdD0j8S
	eKgebDGIu3IEvW7k0mFxdDZ4dx1cGcGoFgh8Du4aTc6BXS8tsD/bX844faxT8QNCRKED
	rtQERri8H5cMTbjnuMobLnDf+7MbJO+ILOvjh8ay1dokKnuu9laoQU51qEgzki4ERTv3
	4WIps0QcVcaY57ibB8zID89Ww2SgDjNOuA7sd9P5tGmZ/7XwJ7eypnWEdoqPqb4uk9xJ
	M6TQ==
X-Gm-Message-State: ABuFfog7Jrc5cF98dX3D5sAI7daEyoriRiiQ8niqD0S71gu1NVHMf9k7
	jRhrp9e7rf1AEHaGkwyB1p0DaG7TzAA7BHFSWQTDsg==
X-Received: by 2002:aca:4f42:: with SMTP id
	d63-v6mr4525420oib.255.1538476806972; 
	Tue, 02 Oct 2018 03:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 03:39:46 -0700 (PDT)
In-Reply-To: <1538069046-5757-1-git-send-email-gengdongjiu@huawei.com>
References: <1538069046-5757-1-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 11:39:46 +0100
Message-ID: <CAFEAcA8Ui8-1NGW799jkegK3_XjC18N-LCdJy7-NQe9VGDHDOg@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH] target/arm: fix code comments error
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
X-TUID: ty4lqEt0eIul

On 27 September 2018 at 18:24, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> The parameter of kvm_arm_init_cpreg_list() is ARMCPU instead of
> CPUState, so correct the note to make it match the code.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>




Applied to target-arm.next, thanks.

-- PMM
