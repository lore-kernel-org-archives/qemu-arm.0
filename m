Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4944962wrh;
        Wed, 8 May 2019 08:10:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0Mram5BoTUenLL6YnI1BtmsVeibmg+7ldYq8Q21nsTN3vWhNUJzyQwtVKauBiEqpiL7SD
X-Received: by 2002:a5d:4649:: with SMTP id j9mr11170379wrs.64.1557328220921;
        Wed, 08 May 2019 08:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557328220; cv=none;
        d=google.com; s=arc-20160816;
        b=ULS2YmG9Nc68VLzstwhwBtnG3ywOWuOkYKLpiFT5WjrS/VrmhysBEvdw597DTWaBCK
         AmrXa/NIjwuRXZQ8qKtjXU7NJKRqi4/jzMBTJluCzruNyL+WZLTcxa6Wx30ut4LvcNu5
         jDNqv5IPfY1G9MO36lRPk7okpuvA9M8w/euOpBWTTcN87Pc0lGHIQcGXSJfUvPFvT1Yw
         Xw+PsOMAf9Oo9JhNXGw75ZLJpSXcZNeMlO/CPqqr1kt8mI38DCGvlL1RBbXJC1mIm6jk
         HXFhqjBkSnzsM3KMAxPRhZEVdn0M+JLpY6rzFt4AUaPaRe48KW1S+67nnAApcpJt91LQ
         ycXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhstZBYMCPmMMOU9xP/v0Vc28rbFxbDh2q+MWesDRE8=;
        b=komXuATHydA9Id8LUUT6Vc7j+15iu8zg2xHlaTF4nk/mIpjbJcG8UCeq15UZe+HvyS
         Am7QbN61NbgeBW3NK08BFils73GdYGyTOsU+lrpgFiA/xoY2OFIi8m8HSvXcDZ1PutlD
         Jo7tpzr+cyLLJfCEbapU/Id3kf1DjVctfgekVYZVvHwfejyOxjXb2LhKmntIFq0mWZW3
         RbIJlAQwAhgYzG2B/AMK3NZ0pUFJRzVwM3jYz/yE5ki9RlvJ1DufV1PjMGVOZQeHlbVj
         fIrHxrVk2fz52WzIaJxqJxJaAwK4hevg8VzQNr3/YIEy/iLAf2ppc5TP5abOcYTxNyh1
         qFfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QTw9UvjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si11918481wrn.78.2019.05.08.08.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 08:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QTw9UvjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:38813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOOD5-00053n-SN
	for alex.bennee@linaro.org; Wed, 08 May 2019 11:10:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOOCi-00051i-Vs
	for qemu-arm@nongnu.org; Wed, 08 May 2019 11:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOOCi-0001MT-1N
	for qemu-arm@nongnu.org; Wed, 08 May 2019 11:09:56 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37545)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOOCh-0001Lp-Pt
	for qemu-arm@nongnu.org; Wed, 08 May 2019 11:09:55 -0400
Received: by mail-oi1-x22b.google.com with SMTP id 143so15406576oii.4
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MhstZBYMCPmMMOU9xP/v0Vc28rbFxbDh2q+MWesDRE8=;
	b=QTw9UvjNxBCsGrhLFVG4ffaS9//1ysR2DWCqaDSI1GKPw38uMRj/PG3R/Uad21KR7v
	1l7qMKAKekJvug7DjfELMxqPtjGvPALiVdYrdWIvjqOJgwtY8GiVBUsZlDxzDPJ8Klk0
	C71ljxZYEX0ln8VUXzJzSdzUNv109tLnFnbILCWlt7kN0YXhPHiKXy5iVgdymtr10wUG
	ddxbfa0/NXKdKq1RW7ssMwZ+XXag+I9513yNoKjIY1Kd4B3NeopwBaN/HeEHYy3fwuf6
	sib2Fo9BEanA0jjdG102wh8XsIV5IZyD0jRWZhtdkzfIVLFEBqLjPXU77FwG8xypi94J
	AOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MhstZBYMCPmMMOU9xP/v0Vc28rbFxbDh2q+MWesDRE8=;
	b=BEFzr3ofD12ZMx2R4LPL+oeHbVVFb2SPMHr4usyXfULBeOkcEI36xvpr69cXYVPkb0
	PD3/AmsIQl9PQchUbTnaRBKC+Ckb26KTeIy4dCsdf/1CKXGNmfeC73LptMRWG/PPP/Ne
	AlHT9FdI96RtAnXasrn6yQbYLJhetcBafXEzqc4uUdUnihWhgv1ilcdJQWZnHhksz7QS
	B9K/se04qrkSOdbZb9KMpZJhasTJOfGh/M/qHgWQAC3ESfDiHtygeYEcSJ2CQ3jzyPUA
	OkhPR5Z9jMMO3rxjkAUoC/t13utpHGdrDEsNGA1Vw0M9LRqgd4X2KfZHuGir0rlC32ra
	1exw==
X-Gm-Message-State: APjAAAX3n8ZfvUW6Ja52uiNp23VIfEkzKtglGdQPbZ8dP3+lFsYprnZY
	H73v7rSa7q2NXw3QCc4qgKcxf98ToWCfM1tbmSQmsw==
X-Received: by 2002:aca:b783:: with SMTP id h125mr2564337oif.146.1557328194554;
	Wed, 08 May 2019 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190507134521.31044-1-thuth@redhat.com>
In-Reply-To: <20190507134521.31044-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 May 2019 16:09:43 +0100
Message-ID: <CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-arm] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30uiaa+7i0Q6

On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-07
>
> for you to fetch changes up to 69f879e9fefab9aaf24893fe4ce23e07756d703c:
>
>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-07 15:01:47 +0200)
>
> ----------------------------------------------------------------
> Kconfig settings for the Arm machines
> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
> ----------------------------------------------------------------

Hi -- this is still failing in the build test where I 'make clean'
before doing the build:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_BINARY=i386-softmmu/qemu-system-i386
QTEST_QEMU_IMG=qemu-img tests/a
hci-test -m=quick -k --tap < /dev/null | ./scripts/tap-driver.pl
--test-name="ahci-test"
qemu-system-i386: Unknown device 'ich9-ahci' for bus 'PCIE'
Broken pipe

thanks
-- PMM
