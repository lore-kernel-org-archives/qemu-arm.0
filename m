Received: by 10.25.0.6 with SMTP id 6csp805032lfa;
        Sat, 13 May 2017 14:08:24 -0700 (PDT)
X-Received: by 10.55.21.90 with SMTP id f87mr10301972qkh.240.1494709704175;
        Sat, 13 May 2017 14:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494709704; cv=none;
        d=google.com; s=arc-20160816;
        b=miJSreTMKLn4grjRT+74wbLEFh782r/c7RYj34OnYlR6X7ln3UnOHEp3oNVuuAVFfU
         rxnNLwR9vuCsWwynwa/o9hY01eW4WFlm+C2daAbrw9iTimcV/PT/w0+gj8yDh54N/mz1
         0lBOwN5QZ74iY+R3KuCLMZS+E5RtE50QuG1gUMTh7LXFGRjz5D5Ke3AnNIMryh5a10CP
         kbEQ75UAnS0GiZCD+Bf0vDrn9P9e4zjStpThMRfe71K+WOmGGl+Ub+ug+ggoZJxk40uT
         UqkkTVThxJR3gHJIM+w47s2fXzkrR44/UOE3axQll11D7rmhv0JIK4dcu8slzUmSOIkx
         D7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:date:message-id:mime-version:to
         :envelope-from:from:dkim-signature:arc-authentication-results;
        bh=Cg/OeEH8RXleXLyaCsxCQjQ2jEY0WAuwnQxecl6gfrU=;
        b=0WmbAO77nE+oXkshtnuhkvzOeJ0DXuvkz+1+NPhdTrzcN8hLZ+bgEVu/+2A+8Jndja
         hfC3UVZFYwajmBZ/LLqhKNzmJei8X/2tcc30NZYtvyB9EVdzgBh/S+mFE5PW22C5geij
         NVontG6JvjWrfmreNDibZXMJ25EyR8jY/KmI0gU2xwHehD7ZxfjG0p3lMKB4uT9h/gTp
         /yLW+NHzHyDTUmRLfmyiOgV8xriFe23MdxfnXyjktkCSLcxUSEAvQf6ea+jIyq5D8Ia3
         0hGjRmveLHsOJ7gv+oLBWZ54NXy/9C/RFib0zdxiXMDspm4iVEfYcF0+QVp3ZpL5Fzvu
         UiDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x46si6903489qtb.264.2017.05.13.14.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 14:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@yandex.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=yandex.com
Received: from localhost ([::1]:58823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9eGz-000703-Mo
	for alex.bennee@linaro.org; Sat, 13 May 2017 17:08:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gungomanj@yandex.com>) id 1d9aJX-0006u4-DV
	for qemu-arm@nongnu.org; Sat, 13 May 2017 12:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gungomanj@yandex.com>) id 1d9aJS-0005Ms-Kt
	for qemu-arm@nongnu.org; Sat, 13 May 2017 12:54:43 -0400
Received: from forward11m.cmail.yandex.net ([5.255.216.137]:43913)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gungomanj@yandex.com>)
	id 1d9aJS-0005Fv-Ar
	for qemu-arm@nongnu.org; Sat, 13 May 2017 12:54:38 -0400
Received: from mxback4h.mail.yandex.net (mxback4h.mail.yandex.net
	[IPv6:2a02:6b8:0:f05::10d])
	by forward11m.cmail.yandex.net (Yandex) with ESMTP id A0183215C8
	for <qemu-arm@nongnu.org>; Sat, 13 May 2017 19:54:34 +0300 (MSK)
Received: from web21g.yandex.ru (web21g.yandex.ru [95.108.253.230])
	by mxback4h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	pI7s12Go51-sYi8vQI0; Sat, 13 May 2017 19:54:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1494694474; bh=nLuh2A4aO86GYzIv1KAivaOSdg1/x7SIp47YqLWxE8k=;
	h=From:To:Subject:Message-Id:Date;
	b=Cze53ZTfQAquKhoRKQ3isZ3xDeBBqgyKIsAOWSMgIL2YHmTOlXzHLYIQm7dhJssqx
	mZh2DfOcDMqghTtS/Dhzj2c39Bzh+WvKXRSK7NnF8aEyifFTimFnZtJ09dlWV5bNe/
	jxZQhlDKFwZnfMSBDAxcCJHAnB7VlPIFpqnoj3YM=
Authentication-Results: mxback4h.mail.yandex.net;
	dkim=pass header.i=@yandex.com
Received: by web21g.yandex.ru with HTTP;
	Sat, 13 May 2017 19:54:34 +0300
From: Jimmy Birer <gungomanj@yandex.com>
Envelope-From: gungomanj@yandex.com.tr
To: qemu-arm@nongnu.org
MIME-Version: 1.0
Message-Id: <3837361494694474@web21g.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 13 May 2017 19:54:34 +0300
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.137
X-Mailman-Approved-At: Sat, 13 May 2017 17:08:20 -0400
Subject: [Qemu-arm] PL110 or PL111 on the Aarch64 virt machine
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/GlScOVekdI

<div>Any plans to port this virtual LCD display to the aarch64 virtual ma=
chines? And if not, can I get some pointers on how to port PL110 or PL111=
 to aarch64? Regards and thanks for your responses in advance.</div><div>=
=C2=A0</div><div>Jimmy Birer</div>
