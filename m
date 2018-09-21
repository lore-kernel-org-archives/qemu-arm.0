Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3449710wrd;
        Fri, 21 Sep 2018 11:23:22 -0700 (PDT)
X-Google-Smtp-Source: ACcGV623oN60kgyCd7Aw2ZG9hjPXgqEY3dAQZdVutrTec5+vko00ThE5lTzcE9qDmnEmpPiR7fIt
X-Received: by 2002:aed:2dc2:: with SMTP id i60-v6mr1403054qtd.340.1537554202586;
        Fri, 21 Sep 2018 11:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537554202; cv=none;
        d=google.com; s=arc-20160816;
        b=R3d4chREbfePEy6E6hXLZgSv5jwqG9w/GUnmb2hGavUOM+eHkuepj9yZz+jampHnTZ
         dZRXGGx3UTTWm8cNyUZcAyR98MaaDuaCuO6Im4xfCRJr+XiCrROCibWlc5EWNlthT31/
         e51JrnCpZDpcRcNSQGPyBG8R6cCLfJ9XD8trUAnV8GOjuaFfJlQ8RpnhrMwgGLhS+UAs
         dMHEHGhg5vPJ/E7MJ3Pi73Le+XpUicmbXit0yRddK7m8GVKc0tlLzILbj5BwimQ6ZB3e
         8hdTjWpZ1pilU2QTnNoPlhBqvj3IGHVYk6JoV0/lexDChjBYsXnlRAe5AAe+qs9F5/tK
         q9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:date:message-id
         :mime-version:content-transfer-encoding:from:dkim-signature;
        bh=XylKQwFZofH8DtOZtSDXagBDhldIRSdIRv9iIxVb4wo=;
        b=BmmW18yHKa9xcXQ4pap93pnMX/6kRaKeCVupbkH1ycbUqJzzsACg2IAEozWGSY7V/K
         45oFlC4Tqhr0T0e0GiMloNR0m1hTjPyqCUFk7YiJPZu6ZQdTu1I/G7Io73iksVkd4arq
         G+YlAFl0BEEw01g4tQg2UFOYQILq5tvfaO3X2yLLSDbI3bZDeE7NRinvZaERddArQ6vj
         tACysNfofQK4YI7DqFpED8OlmNqFthtb+lkWeuETcBBl/a5Jt0+wYqUtlx/qxNKkBAK/
         tQBenc66X6o7s1wkzoJdsa8rZhws7zu5FetYTrhpBP6DbuCbWWKuaqqSjxwgb9VTc8L6
         n6dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nog2J1qC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si88409qtb.89.2018.09.21.11.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 11:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nog2J1qC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Q5K-0005mf-2K
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 14:23:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g3Pn8-00006I-OB
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 14:04:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g3Pn5-0000Pu-MX
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 14:04:34 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <karthimohanraj.in@gmail.com>)
	id 1g3Pn5-0000P1-Ae
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 14:04:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 2-v6so6401672pgo.4
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=XylKQwFZofH8DtOZtSDXagBDhldIRSdIRv9iIxVb4wo=;
	b=nog2J1qChh9+Nbc9cfQW5yLgZKDmq5WNrez/aXYHmlGvPxjpRndEqVB+SFsBtOa9tt
	TM8W64UOfKvuTXQ8KlOOP5b7HLVOoqZD/KGLyhpSv140nxrUWXARxoKhvP4+YW+A5+Ja
	qAENOHAJ15eGMoxQ+boDQw0E84M+wLf0pylIiF6ZOqJw+pd1gvbshH/33MuJ/MSQUjVc
	c3dQPmb5mzNvl45ZGx3UJ+jHXwXyzf8k+W1iryHVDc8NGUuiZn6q1q8YO2LrwWnxJw64
	+niAs/0LaZbqDBoumaEF66Ra9QaFqWEu6N2etIAtM0aSuwYVxHK345Np8G3cbBWq+dTM
	D0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=XylKQwFZofH8DtOZtSDXagBDhldIRSdIRv9iIxVb4wo=;
	b=iVDG9M2bT8XrApdkrdk0GAt5AqoDrk/a8KawzqcXaDwjmXFOMUZweheEduY49wswtO
	VsJCZwk7/pdAq4TqxFuvXy+i/ref4Sxqe6jhnCrrC4leSYKMk2xy5MlVAZvBMGWrhm3n
	b0renelW81h5jWEPh6mc6m2fmRT7r1GMIev4tx6xQjvjd4xBq4zVguhQMMxFU8eU9iVo
	fZKJPRAsd5bQPZAnx91aNnEeyo/yA4OVMIEEONLq/qAUThcNjlBm/7dnfoyYuRM6kQMh
	00+wc73MjHas3ColO+0lOffla2VKPYFrCCkxHo3ev3RwxKyzfzLqZc3QLxTfzE+AAuz2
	Vftg==
X-Gm-Message-State: APzg51BZrdAqpQX4rw5Y9ZIRHDiINULa2IUtwmqkEqBnKQ6HJThViaHi
	0A2EIjKXyVZ8uLj0RYqBSi+S31yY
X-Received: by 2002:a63:d401:: with SMTP id
	a1-v6mr42290571pgh.414.1537553069311; 
	Fri, 21 Sep 2018 11:04:29 -0700 (PDT)
Received: from [192.168.1.100] ([103.6.156.105])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm29012435pgp.13.2018.09.21.11.04.27 for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 11:04:28 -0700 (PDT)
From: karthi mohanraj <karthimohanraj.in@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
Date: Fri, 21 Sep 2018 23:34:25 +0530
To: qemu-arm@nongnu.org
X-Mailer: Apple Mail (2.3445.9.1)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52c
X-Mailman-Approved-At: Fri, 21 Sep 2018 14:23:05 -0400
Subject: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
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
X-TUID: dqdRLcc20+0a

Hi All,=20

I=E2=80=99m new to Qemu Environment. I was trying to setup a Arm (64 =
bit) emulator for getting hands-on and need to setup an development =
environment. I was not able to find any document or any working article =
for setting up the ARM Emulator using KVM. Can someone help me to point =
in right direction to proceed?=20

can this be achieved in Nested Virtualization?=20


Thanks,
Karthi=
