Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp563552wme;
        Mon, 21 May 2018 11:15:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpo0Wn73yKnbW1xJeN1WpLZgqHobK1TjpRjwOS7p0ncPoVJ6+emlEe8hPfSTD64VRzavJ+2
X-Received: by 2002:a0c:e242:: with SMTP id x2-v6mr18904033qvl.60.1526926505872;
        Mon, 21 May 2018 11:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526926505; cv=none;
        d=google.com; s=arc-20160816;
        b=fFM7lmx957G3zU8c0xFzR15TOu/seJsiJMHrI3LbhbliWBD7hBfvDJHy3pFsV7mGTk
         n2CRcKgaZHCS3iRjfLeRHtII1gRivPfNbM/eueShNc4EBLqGYP/VQPk09jqyd5QAiuDT
         fTriXalKKBSAND1KGlb47S84rjkCBzHKTMNWvpoET4ZcAE9G9dB0R0l+iIEIeCKW+1i/
         UBvUPZllmz+KfnNTCObMwtoo75C5aFs1+/hYPPi3CaUrdgZhIEBSOBA7rUyNjcpHsPL4
         hZNraWvQnHBRmRcpEQOzGLFWdp9L4iVaBXLC1jKrCKHTzy3HI5ev43hY6MPTicLwj8jr
         yzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=68NuM/fCbct4cm0p3q5ja1Fyw/paIYPjbzhwSj+IV2E=;
        b=Bo95nu7gtLUXNF9UjfUuvbR79K8vvtdzJ1zDbQKAP1zBsw/H9Ju/2DSmR7y7awOCCV
         LSyRAwIOLcLFA91LlqBvs8v+p/B0BHAIWHZqy8OMF0mp79MhGLIwpdBpMqXzqth2YHFC
         gHtTXlH4YPiFxWiKXaACu/dB1BU6VjqeUcxa5QYcQkgB5AdvW8dBFAPWVLhnZMYalzA9
         2GklPKLsXWh5WBhpqPfP3+72RdSuBqydeGjQMsxKJIsijiiULn876Sx4o1dico1PmVeM
         mPQWPfZECK5v2q+gJ4t5G5vKCIOBUHmkVU1cK0vumE7Tx6NQEJ5zWMRMvy5HEYzMpZnl
         X8ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWHFiyye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22-v6si8437459qkl.392.2018.05.21.11.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 11:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OWHFiyye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKpKr-0006wC-DA
	for alex.bennee@linaro.org; Mon, 21 May 2018 14:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKpKi-0006v1-3I
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fKpKh-0008Dn-B3
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:14:56 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:39987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fKpKh-0008CR-5K
	for qemu-arm@nongnu.org; Mon, 21 May 2018 14:14:55 -0400
Received: by mail-ot0-x231.google.com with SMTP id n1-v6so17877496otf.7
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=68NuM/fCbct4cm0p3q5ja1Fyw/paIYPjbzhwSj+IV2E=;
	b=OWHFiyyerN8B509fDQmlqsbm/jCyN/mqb1Sev9K4xpH8X6HM8Juz1l1atDnAHxu8d/
	WDBYFd+Jazz6y/BCKlGDqyesD0PZuBrgmLNmw1xf3KXfMFgjUG+9OtqN7RFip+D+4+mU
	hGky+2Snm964gyurWTRRgfHguRMl66OiKIWz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=68NuM/fCbct4cm0p3q5ja1Fyw/paIYPjbzhwSj+IV2E=;
	b=guAIZTCZiBAKQ0M2XwSfl0ymOHWU4dYC8mh+tAyDc/LXZuk8qKkBt8jEzXrxj+WdL+
	56bojKLjCM4nZF845796vJL7kMI9Vk87+szgzmU8X1Rxxj0Q04CkHnd5gNZ3ILNdioCQ
	13hPeCbu3INuqdxnkY+ky7xkYtzkzqXLGI5XkkY1TZymY8eomT6bpX97lR3DnBACdURZ
	TMSJQjEe+NGuTMFQuCIT5Yc0/o6+GbyUce4b4tU0zzFYu/eYa8GiFvZBHNWr3zgvzZwD
	dZLj+4xdHFTMrpH6l5sDsMw0BHzDjDywwUOK4axItvoGZVcziyzgMMzVKBRpJmoq6utC
	i5kg==
X-Gm-Message-State: ALKqPwdJat4U4YSbBJn00eUbB8vNNIQ+1DWvqdeCk8rlYO42Fxl2ZCDF
	cKiFchfctD1cL3B8UESw7xXkK9XBzoXr3uOBedtMbqz/
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr15099840otd.210.1526926494413; 
	Mon, 21 May 2018 11:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 21 May 2018 11:14:33
	-0700 (PDT)
In-Reply-To: <CA+ALrx4QBZOpRe8CBZzgsrqpmV_5eb0tKh00aMGSjZkPUJ99Cg@mail.gmail.com>
References: <CA+ALrx4bN1o=2oduB0uhs8acjVWOO0KYkduiP69ZZm54wP6fVw@mail.gmail.com>
	<CAFEAcA8hsrXXBp_KRxqjg5hj8L8Z3Pd5wNfbwnkxJqLJivFupQ@mail.gmail.com>
	<CA+ALrx6BmOyjH+v__TckKeDEyQefFZeQT9F=5BCHnY2tjqhmrQ@mail.gmail.com>
	<CA+ALrx4QBZOpRe8CBZzgsrqpmV_5eb0tKh00aMGSjZkPUJ99Cg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 May 2018 19:14:33 +0100
Message-ID: <CAFEAcA9r8XgxPGhqHoECVnp62wVm717Ux67N7_yn85MJT6Cqrw@mail.gmail.com>
To: Elliot Buller <elliot@tinylabs.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] ARMv7-M MemManage vector trap
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+Y25arqeaE3

On 21 May 2018 at 19:04, Elliot Buller <elliot@tinylabs.io> wrote:
> Sorry I misspoke. I still need the MM fault active since my handler does
> some register patching necessary for normal operation. I just need to
> disable gdb from breaking when entering the ISR.

I don't think gdb will break by default when the guest enters
an exception handler, unless you ask it to. So I'm not entirely
sure what you're after here.

thanks
-- PMM
