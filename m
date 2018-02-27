Received: by 10.28.71.27 with SMTP id u27csp5356391wma;
        Tue, 27 Feb 2018 15:00:49 -0800 (PST)
X-Google-Smtp-Source: AG47ELvQzOwS2Zc/76C085PLXjrflUVwVscZrdfFzcDYleCK2XenbuFoGqqYhttTA04bsvTSYtV+
X-Received: by 10.129.199.10 with SMTP id m10mr4462161ywi.57.1519772449726;
        Tue, 27 Feb 2018 15:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519772449; cv=none;
        d=google.com; s=arc-20160816;
        b=n8OUJOryAPQod4+1QBLNqFAQwAZ2Bgs7F6ULheyu0ZWGT4/LOWxoDgCcNUCq6QxIRp
         jHhb9KMeEiytThTFexkukOFI9lLjpTT8cBGU+fisiLVO5Qu5sJHQ/fyo6BcaT9rlcVA5
         YRFDQa8ww6WOiuvxl+R55boKSYxfacodswHIEfDPrTQ/06Nh26Qln4Bq3tEe7FgsOwIu
         Y/tGJJMDxNvzFA5ASc1ncijgXPjncXAJVRDR8YAeXkqtzUgFII8THyjxi2cI66jRbCGJ
         CurfNU/bsDKAdFB/eWEXAQFqEhlh7CHP0kiUH/l2ueLnviBZvqFlhb4YxcJ64V3m211a
         1tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:mime-version
         :dkim-signature:arc-authentication-results;
        bh=KLYnpv5UgI90pCf/c/DmsCpy03LTuNySyuj8SyMv4l0=;
        b=W63ot02u7B1p/9sSjnvizThZsYVXEmjw8DBONXKRKPHDf8Pq1SyHlWoUgOCLH7BvNK
         H5a5bDQydAR7F1M7lzjdL7DmUI+q7a8VmRvuLiwmoHgZaoEP6nN8rmw3pOJ+STmWsgD+
         4tD8VF+hwVEmWuO6Dkw5V+6IMsfk0ZFUYcN9iFvb/kzyWrK9NXCq75eUn3dSdlfXQzR4
         biqit80GiCKlMXG+QykCIeEVwyndbuJq9DVm0b2k2B0rrJl45iz4uLzZ0pOWaEkeNy6l
         JNZzYgTckUmZdcMlJRhIbwO+wP9sungJ8r5yj5MxyJpDcq1GYQAY9aHakjxndmdAJjV+
         owCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@secretlab-ca.20150623.gappssmtp.com header.s=20150623 header.b=Mj51iZ60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l191si45016ywc.98.2018.02.27.15.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@secretlab-ca.20150623.gappssmtp.com header.s=20150623 header.b=Mj51iZ60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqoEr-00011y-9u
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:00:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <glikely@secretlab.ca>) id 1eqo5e-0007hP-FV
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <glikely@secretlab.ca>) id 1eqo5d-0005Dk-Hh
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:51:18 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:45924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <glikely@secretlab.ca>)
	id 1eqo5d-0005DM-CX
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:51:17 -0500
Received: by mail-qk0-x242.google.com with SMTP id g2so647207qkd.12
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 14:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:from:date:message-id:subject:to:cc
	:content-transfer-encoding;
	bh=KLYnpv5UgI90pCf/c/DmsCpy03LTuNySyuj8SyMv4l0=;
	b=Mj51iZ60lf3hOu6SS5QvzAzy+Gre9zbgrshtvwEPe4YAUBQ+3fmwmdiwToQgaVM5XW
	Ml15g9H+38swqFYpp+bDxvZ3i3TjuUooFFK3lKZeG+fE5vFKsoRM0jF7SYd/qe2k/aRm
	CQYvvV0F5JL+GGbVQKIAW+HvFXKbBqQG7fDYalsajmSHQZpfxWtMh53iiNVaElhPhSDv
	V5GRNSVj2r5G2Z7qtkQz35NfEV+WKaXPxqQE7dLJGUu7niRQFGFBxmQI/mmB/+i93vcW
	v66okUTZK7xjrQk8eY33RgmkUoxjvAIY3y/2xjHo1e4itapNS7pjvcrrWN5i7yT2/mAV
	vT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to:cc:content-transfer-encoding;
	bh=KLYnpv5UgI90pCf/c/DmsCpy03LTuNySyuj8SyMv4l0=;
	b=dmLYS1hOXVbw9y4HfdPBFyLpS9bLgAJudbgNiRoUZTLwqYwt7g5DoTI4CR9bjCXcUJ
	rbHtlPrSDvwq7MruswJdtrbgFMXYwxBiJvlOrXJDznDAl7hqcyARk05r14s/Id8u/3zw
	bDsE1HATXopAvmT2yKtzjerxTxPwH1W1s87CEFKqH5/0v0BupGxop0F8yw79DLCvbBu4
	8dbUJ0WTNUJNuTKzQfrfa0IFuONDzaPPpO77JO6etuh+1ElYVi2n+a4sDSflS++SH9Mw
	ZFFpYBWdZKtaVOaWm7uwWYIP7XfcrOLsXEQF9KJ+C1Y4M01/Ca/U8V9Y3bdxh20znYLh
	RA2g==
X-Gm-Message-State: APf1xPDNVZRPw61O/uPl/WixX9YMTnow2gkgN/PxXH9UrJ8XhyM9A3+4
	Xk3u/nqZByD+Rt1QF7njhTVX/fuga+CFSE72U+cPPA==
X-Received: by 10.55.31.20 with SMTP id f20mr25943912qkf.290.1519771876047;
	Tue, 27 Feb 2018 14:51:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.243.131 with HTTP; Tue, 27 Feb 2018 14:50:55 -0800 (PST)
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 27 Feb 2018 16:50:55 -0600
X-Google-Sender-Auth: tgvsDuL_ffQDoQgv-KGTTuUEPfU
Message-ID: <CACxGe6vSPG8KcmV5kpxcm3d41b9Vn++EZPAEm1qyoouZ5zPkug@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Fam Zheng <famz@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
X-Mailman-Approved-At: Tue, 27 Feb 2018 18:00:43 -0500
Subject: Re: [Qemu-arm] [PATCH v5 1/7] hw/mdio: Generalize etraxfs MDIO
 bitbanging emulation
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PmLlLrvtTcay

On 22/09/2017, 12:13, "Philippe Mathieu-Daud=C3=A9"
<philippe.mathieu.daude@gmail.com on behalf of f4bug@amsat.org> wrote:
> From: Grant Likely <grant.likely@arm.com>
                                  ^^^^^^^^

Hi Philippe,

Just following up on this series. I don't really have any additional
comments. It has been many years since I looked at the code, so I'm
quite happy for you to have picked it up.

However, it is very important for you to preserve the original email
address that I used when I submitted the patches, and do *not* use my
arm.com address. None of this code is owned by Arm. Please change the
From: attribution and my SoB line to use "grant.likely@secretlab.ca"

Thanks,
g.

>    The etraxfs and Xilinx axienet Ethernet models implement quite a nice
>    MDIO core that supports both bitbanging and direct register access. Th=
is
>    change factors the common code out into a separate file. There are no
>    functional changes here, just movement of code.
>
>    The etraxfs and axienet are slightly different. The etraxfs version
>    includes the bitbang state processing, but the axienet version has a
>    minor enhancement for read/write of phy registers without using bitban=
g
>    state variables.  This patch generalizes the etraxfs version, with the
>    axienet change backported in.
>
>    Signed-off-by: Grant Likely <grant.likely@arm.com>
>    Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>    [PMD: rebased with a minor checkpatch fix]
