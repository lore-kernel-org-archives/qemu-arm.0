Received: by 10.28.4.212 with SMTP id 203csp3781447wme;
        Tue, 17 Apr 2018 05:53:23 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/4+CzDPEyucdzByHzc2rL0Zfvgu6yg7twrUIW2uWULcY0Td3NDLtrzwqyAF53HoZzhgdZD
X-Received: by 10.55.176.131 with SMTP id z125mr2254793qke.342.1523969603303;
        Tue, 17 Apr 2018 05:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523969603; cv=none;
        d=google.com; s=arc-20160816;
        b=b9NhKWnKvNBc8ssTBj5w9c2FW/kYU0LXDZs3UG+USQPrwgsW7VLN3rb+iR9HONfuH8
         uHhALYR1q3znznh4J7HavIdLfAvXeVXgzA0RgcyhNEUQYTIepC1fM0A6eTrW2slgM3Wf
         MR/uMEpmWUl1BLRqXCNIScWL560sWygLTV9pZG1hkVsTxMO54P6yU8A0tEotZPqaz55z
         XkleBYA1zZzXe0VW2fm02KVxlKQkSyMJGf+Lf5v4AHa/26DapgXZANTZ1x4CBw4qCqEp
         +ECaX1/mWX8lSgBnFWcNuNmTzfnvB5zik3wzDGzAo0LmC7Yfuvmbw/uCNs0ySIvbuzCm
         xUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QUjJAo8PO2oAUGDYbhka39Oua0x/YqD4PxRqIGV9Djs=;
        b=YZ/k/aMQ+70uPuaoxARXj3VVDA/ZB4rZ3XtJXOUyk5PYWVbVvAp0TYdINjDU006af6
         dUMaZU8Wv5H8U9/UHhzGLzxe2z1945v/RNGhLsuTqSc/o6yawMORaffn+RlVp/8Hec3G
         KSekvz4nq4Hhjgko5uzJIfkKgpOjAh1VmJuzRk5vUDqWKJG6rZbbh5TIlWWfvWuhdKjg
         jXiviIUxTAXjXmUji3KKNmIFNY3i1e+HtxA2OUdFLuD5rZvmNl1oRuHjLr3gNlIctIw/
         I/y7kjsM3o2bKRv6PCl3KA+v/SUHXwJIZqVB70abmgMh/knLw0hGCxTDrXaRLYLjZ5Kb
         GNgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c9Vf7n4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p21si1625085qtj.352.2018.04.17.05.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 05:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c9Vf7n4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8Q6s-0000vl-R0
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 08:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8Q6W-0000qT-JZ
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 08:53:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f8Q6V-0004fV-Kv
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 08:53:00 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:46870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f8Q6V-0004f5-Fc
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 08:52:59 -0400
Received: by mail-ot0-x22f.google.com with SMTP id v64-v6so21208869otb.13
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QUjJAo8PO2oAUGDYbhka39Oua0x/YqD4PxRqIGV9Djs=;
	b=c9Vf7n4leELPfWuXneunyukmN4EtDg1IfqaPcTLhUWdcuD+jBFzUWuWgVO6DI/4PYs
	fhOXT3h965Jd2eYkiJpb0XumEvmFVblIyFs+Ub5bsS74fbV5qSSm5SlLnRaXZt5e0vkC
	2AhtGXoSilp24BP7ss9gU6rkTbIXknk3x2XyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QUjJAo8PO2oAUGDYbhka39Oua0x/YqD4PxRqIGV9Djs=;
	b=aUtyW4OEJ10kOT3Uoh32R7AT81lai1bzaLoyaPnzBbTfXuG9G0lfni35bCrCFkwv61
	erI9xD+VaZwyJUBH67k2W7/q6/nsiZFeZuyq0PODvYTdJxinT8Hmbw2u9LIiv2yID08k
	oBx4d7W1f9xHjZaedSuY3s9PI/E8g5nDxL61fNAVXbMLIdm58oZdS1RsD7XLxN2oUAK0
	tnQIV3HgrEVA8vkSNWYETIOgUgb6+LOgMyezPmyU384Z5bV+DZrKPIPHLGriTGAuchE3
	QpT7SI2oVYfwhdhkaRd0vupbNznQ+lEYhQWJLOoVhz2QO5scgedDH5yQ7X72JUW7xgv4
	psZw==
X-Gm-Message-State: ALQs6tCcbZqhz+2ThsD5oY6UiVypvtYJTATRqa9XF+4htfFdYmczVBbF
	OVMICSERPv9bo6OdgEPG8Hz2cNDxNuGJCgNszIC2PtJ3
X-Received: by 2002:a9d:32f5:: with SMTP id
	u108-v6mr1192880otb.308.1523969578742; 
	Tue, 17 Apr 2018 05:52:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 17 Apr 2018 05:52:38
	-0700 (PDT)
In-Reply-To: <87in8qf2w3.fsf@dusky.pond.sub.org>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Apr 2018 13:52:38 +0100
Message-ID: <CAFEAcA9pTyF=xHz_2Dt3XqQrUnKrPthFP+zpjV8ba2PVM-s7iw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 70huF+A0uteS

On 17 April 2018 at 13:12, Markus Armbruster <armbru@redhat.com> wrote:
> Thomas Huth <thuth@redhat.com> writes:
>>  In case someone wants to help with creating some bug fix patches
>>  during the QEMU hard freeze phase: This test can now be used to
>>  trigger lots of introspection bugs that we were not aware of yet.
>>  I think most of the bugs are due to wrong handling of instance_init
>>  vs. realize functions.
>
> Yes, that's a common class of bugs.  There's little guidance on what
> kind of work belongs where, and plenty of bad examples.  Some of the bad
> examples crash (as you found).  Some work fine, typically because the
> device doesn't support unplug.

I've been vaguely wondering if we should start to recommend that
all devices have a correctly implemented code path for destroying
them post-realize, even if they don't actually implement hotplug...

thanks
-- PMM
