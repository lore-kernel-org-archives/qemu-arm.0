Received: by 10.25.0.6 with SMTP id 6csp1828013lfa;
        Tue, 30 May 2017 06:52:23 -0700 (PDT)
X-Received: by 10.237.42.102 with SMTP id k35mr24172770qtf.58.1496152343227;
        Tue, 30 May 2017 06:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496152343; cv=none;
        d=google.com; s=arc-20160816;
        b=0xt3KGSMkATMRGyeDF1Mqn1gkoPH4BggEIxiajaA/PBfGdn5a/oTC4LzRb+SUOJZLx
         7SfKT/mDJ27/9Jo0ZBpCyLmzsxO0zp0+589dYxp469Lhg3+TTbuIWsC+QZ6hdpddrMj9
         eiyfe9vj/C2j1bNP5MFeatpwBRBtB6cphQSZlCsTn+q5qNZ0fgYFGgJnuqub5nf93gVe
         QgKm7A4WSi/K99lkAKmVkar0PzY2cpqjeA9iJ3rDy8oKshv8z+XZWgT669QTTs89aW/c
         RyN0A5s2yfLR4E2Q2jSRdxDjaVEshSNHF8Ih00ace83zS/6qWPYCh3th3A5tlXeq+7Gl
         EhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=SEI9qKx5kzKhcjebaRdmc7YFjEAmsfvT+rHgJmEFQGc=;
        b=T+/OM+aumMCLwIkPMKnufwN97kRPJ1u7y1za02FQYyWqIEAhrcrwPt3GMYahArUvJG
         zHCSiS2dLhb8HhKoethIYGhkKm1yVvDA5W5jLTeI2LpEM3PRbF85DWKSixJdBRiydD+k
         3u0vED9kwsjGJ4/uXtsdUy04J8apOvBu3wRHLkUEPLDPKUBoWm5c1+1NORMMBxdcRQbG
         woUa+5oImhHM1UAcVuaZfRIY+/gg9MJByrn4Cc8T0Vab9XlrHUDWNqNrDeOyREDlUQpa
         yd1TP/96xkLzkTzay9gSjHVFlC3hc0DbZJObUqHq8sED/d51hM9FUSsz5KuaQkul+Ey8
         N/3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y78si12564072qka.94.2017.05.30.06.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 06:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFhZO-0007a9-Nj
	for alex.bennee@linaro.org; Tue, 30 May 2017 09:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFhXs-0006gK-0Y
	for qemu-devel@nongnu.org; Tue, 30 May 2017 09:50:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFhXr-0004kG-Aq
	for qemu-devel@nongnu.org; Tue, 30 May 2017 09:50:48 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:34970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFhXr-0004k6-30
	for qemu-devel@nongnu.org; Tue, 30 May 2017 09:50:47 -0400
Received: by mail-wm0-x230.google.com with SMTP id b84so92791856wmh.0
	for <qemu-devel@nongnu.org>; Tue, 30 May 2017 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SEI9qKx5kzKhcjebaRdmc7YFjEAmsfvT+rHgJmEFQGc=;
	b=aPdj+XThVg32VWGPCdpRj29b7uQQ2X/q/+67m5x/KeMLujVtBUix633oXF7ubG6nWK
	CERm4SwtDrSOhhUW6QjApJOlDqXPYuJJAUUVE+h2tqDKof8yTuHGDSZYvhPjbMlfxPm2
	frZ35jT7y7mHranK6dvM6PriO+71mSsmP7jEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SEI9qKx5kzKhcjebaRdmc7YFjEAmsfvT+rHgJmEFQGc=;
	b=Iu5Q5FxQj71Oxse+DGDvAR5kq4jArb0dh61QMIvn8nqNDOJL13jihPebfMmNgzsd1u
	9ovb+nroWncXE0Kary/GgEGinlhwdTYyHYKK3lcNgxWfbAF0sMNpphy5NlxCyCoD53D4
	LnBWkueDMYC02eqm+KISTwsM+gu9ccVCPpsVfIgw+ShztGXxCiuekyoqwDMCGdyaOaBx
	9ykN/PayNj81LYvLK6PYtNbEYqorDKJBYl7JpSfvnQRUQtpPMOpjzVE2ySxrbGHNq3Pn
	MyNiT1pIIebc7FsYjocrpOmGXbJA7bWSxtFCrcrRzXYnjeWysYCv307EZr/iULG5tzsn
	icDg==
X-Gm-Message-State: AODbwcDKMdcU2YsfSLtSmGCnXhFO2Q5k7/sJhr8A+v9KULoj5HJJWjpT
	UX0HBVUych/UeA+/EG8E/hz9n/MHoq/C
X-Received: by 10.28.24.202 with SMTP id 193mr1927087wmy.125.1496152245940;
	Tue, 30 May 2017 06:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 06:50:25 -0700 (PDT)
In-Reply-To: <fa2c7203-644e-9209-91d8-e37c345b8240@amsat.org>
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
	<1493226792-3237-4-git-send-email-peter.maydell@linaro.org>
	<fa2c7203-644e-9209-91d8-e37c345b8240@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 14:50:25 +0100
Message-ID: <CAFEAcA9T_JHBu=vw6ohVj6YwqcC5GMQKB0HJA+ZPo746j+db8Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 3/3] hw/intc/arm_gicv3_cpuif:
 Fix priority masking for NS BPR1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q1N8i/0PHh5n

On 14 May 2017 at 06:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> If you agree with upgrading those comments:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Yes, I agree with all those comment changes. Since they
were the only changes I've put the updated patchset
straight into target-arm.next.

Thanks for the careful review!

-- PMM
