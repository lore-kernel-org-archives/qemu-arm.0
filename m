Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4065474wrh;
        Tue, 7 May 2019 13:46:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCexYYzHYtsLwT7Ii1XNcPoOwUT+qxvZKLzC/kc43yKbdL+9/uwmfIjbfXRi7yqBDwKiAA
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr4789710wrt.295.1557262002304;
        Tue, 07 May 2019 13:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557262002; cv=none;
        d=google.com; s=arc-20160816;
        b=Ohz2zh3dUhVmZzp0Wt4eROerCBGfWz9oi2gOau19mdCmjA+eyZMQhOwdsuJSi3lQWB
         Svul4tdOeiP94BmLV4Y/uO2lIrA9A5VE82LQ0ptvHgpDxSo3K2sSrtoyvqw2SXCnSAWJ
         GGuGGPyb03zL2kIskJjRejzhMxduMOrKRXSUGDzD65V7U/N3k18XJTjn+8ItpkLwgSA/
         Kcb0y4ezolfEvuWMNvqiRHAclIr+LeZF8YNAmw/o9y6kgivAUJ5FHtI/U22Pi656HXUd
         OJPLgyXb4dM+BNdYSEoc4ltroVYaLg0KLM31lm1Tnh9OwTOgd8eJucOdRbJR0qYScHw2
         RCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlafPzVtkQj6gMkNjEBbCgVk1uNGe2TuGOJbbA5OSRI=;
        b=nngRTpVpZXweCBXsu26Z2KW70sYzLni3Nve30wfcmkKnWhv3AmHUuA7UZ8RHH12SnT
         +8UQkoih5KQCQtywWgIlreWw0+ZXhZ6WGYIu7sQ2mxRSqQPJ5uQi1e3ueObIg/0//byu
         0nQjrhyQesZ/x1JFPerBYRnfBiJA/O+Zm8cvVwg/GlInmX3Hx/K79PIzNXF0PoBxzddd
         DIxWc2DQVvK65ymfD3zLdWZKFXIuWuut9CnsVEe3xp766x6D926GLiJZnVmMDJlOLTR6
         mkDxMzdZM9m4U4vuvgcL7hjPj5PttTKMlR6AMkaAaDMkw2tC3OzP69Zr84ypbN1LPNOF
         eB4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PbwytMeN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si4068497wrh.415.2019.05.07.13.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 13:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PbwytMeN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO6z3-0000al-D2
	for alex.bennee@linaro.org; Tue, 07 May 2019 16:46:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO6uQ-00050d-Cd
	for qemu-arm@nongnu.org; Tue, 07 May 2019 16:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hO6uO-0000gy-Ea
	for qemu-arm@nongnu.org; Tue, 07 May 2019 16:41:53 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:37581)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hO6uL-0000KV-L8
	for qemu-arm@nongnu.org; Tue, 07 May 2019 16:41:51 -0400
Received: by mail-ot1-x336.google.com with SMTP id u3so10852319otq.4
	for <qemu-arm@nongnu.org>; Tue, 07 May 2019 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IlafPzVtkQj6gMkNjEBbCgVk1uNGe2TuGOJbbA5OSRI=;
	b=PbwytMeN81PbGANknvfHT6PqdqtN2bNfsusLvncT1v7eXQgwbdaI8DzrSrgPVxxVXC
	PVS8DNAZSOKus9MFuh5sZpcmb45C5SkcktaSDPTTjb7zYP/xIRrX4EMib/XhuJKV0I4/
	HX3Y5RqUjJepSmpbdihsdME23GKO5Kn0ZQDuet//uuc6NUkrdslurysQ0/akQ9We5MG7
	J4E8m+kSZU8lQZ21n54VHOUO77CoEwo2WrsIr/Qln59FBif/JOq5yNTTPeDvs9gxsZZZ
	Ypnbl2TYDO0h1CCS16rMwQZdxNgONaMPlBIJmKnk4AHD8PjUfIiWtPvt32M4MER9xk0s
	Dz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IlafPzVtkQj6gMkNjEBbCgVk1uNGe2TuGOJbbA5OSRI=;
	b=apCzujMFq61qgRmFU0oAoDh7jsAC//rWZraDnpqP8gIfYZzezcG/lmvdQdFNnO12Rz
	+cj9z8evfTi3+cc4elvZv1TceD7AWkMQ+JYqM+72JkxBNXXKfcYaUHbNSmHFdZ7Wpsqy
	7S54Nc5ulRDpv8IjXxan/YPr/NPAWIYrq448lxXbNrgXGjarEglBsjdBEwafXRzwpUL1
	m3JNE7fGpE1uHZEmBQxGMHzU/IqQWIUedwpjbO0Ge5taNnwu4bRcbw6gY31OIVoafZvN
	HKH2v9ACuATfvyn/82RKA5MAKOvfhY/4LarlU7j24vAcL3L/AhErNvJXJ1M+HxHkfqr8
	C9Jw==
X-Gm-Message-State: APjAAAXZXtprTlWdtFcy0QGWKLcyTggzi+5FZCwVwrjm+fEp+zLJPMSR
	1PE0IQLJM/5JZ1R80NiYygxxtVwlYWNPNek19zfaUQ==
X-Received: by 2002:a9d:6d19:: with SMTP id o25mr5740744otp.151.1557261702549; 
	Tue, 07 May 2019 13:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
	<CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
	<CAAVaN8xxU7ZzDZ=-TMe8_U5z8Zoiq4ny-Z1VK8bgUyAJ8YdPXg@mail.gmail.com>
	<CAFEAcA8cYs2Z2viWy9GGF=9=k--h4+cZizdSc5bpaibuAzurrQ@mail.gmail.com>
	<CAAVaN8xLkOx6xO2_P+f8GCqApSxMr879bq-peeL_1HLCZw-MCA@mail.gmail.com>
	<CAAVaN8yuA7X0WcUJDoD_uo=+j1ZjJ6UcUdQ=WFQEkso5KvFpog@mail.gmail.com>
	<CAAVaN8wF2xbNawG40J9gcx5C1DXA5RTmK3XfAseQheBBbBXO9Q@mail.gmail.com>
In-Reply-To: <CAAVaN8wF2xbNawG40J9gcx5C1DXA5RTmK3XfAseQheBBbBXO9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2019 21:41:30 +0100
Message-ID: <CAFEAcA_3zDgHHg3me2jif4DxEf_Q4AGfph41=+ddiy0at4gaag@mail.gmail.com>
To: Andy Ng <andreas2025@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: Re: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL
 on
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
X-TUID: OoV0941PW5BI

On Tue, 7 May 2019 at 20:56, Andy Ng <andreas2025@gmail.com> wrote:
>
> my filesystem is rootfs.ext4 format .. how do I get it to mount with -M virt?

QEMU doesn't care at all about the format of the filesystem -- it
just emulates a hard disk (or equivalent to it). Whether ext4
is supported or not is a guest kernel config question.

thanks
-- PMM
