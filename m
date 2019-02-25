Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9983629wrx;
        Mon, 25 Feb 2019 06:18:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY9FEb8NY/R8LjHpyANdiGeDPEeXU84bQGG69ryOuEsefzOBNwL2mcsycsioUJUABkxvLzu
X-Received: by 2002:a25:a2c5:: with SMTP id c5mr14033744ybn.378.1551104287284;
        Mon, 25 Feb 2019 06:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551104287; cv=none;
        d=google.com; s=arc-20160816;
        b=jFB/lM0vZLNT/IRVPhXon3rTPJLzV0fODiMKEA/OFvvKaaQ2EI502Y96BVw3ysTcrW
         hz5aGgu84QWjiRDdaKBErJ178lOScnoDn/Ec36F9qhPRn5d3gtfBPNsqp1NWE8Cecsp+
         a0iWHAqaOijEI8AZxCqS2Z/yyMlO+HKHsUBCwEutDOAJoBU6Z9mzs9umWsIOT22LSyRF
         s8Mggl+zGxJqfK6VfFGZT4u1+Mxa/UgfYxldFZ3tkrg0+CE20aWFjnXItOg889NEJvn/
         6laJCxvCTKccv/8OjetsdwRTcyurljjedFy5VdlodssE4oAubc3X1gK8LxWz1LIAh6QQ
         GRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=sDBvZR+pfSzzu+l/dqJnibhgSdFrnmpzMz1/NEVSmKI=;
        b=mYjDFxaKtFkv0919OvdhT8K0gC4pvd/nUkeMujVvoUZyLtDtnX464wAByPYRln+6Kn
         fn66zGd36lKqWuRuWg7Bsu41CNyx/NqQeX7ryiuwK+gNECAR8D1HKKmAirxWzh5Q1NKU
         gpuH/5cmVmEB5heVRcTi/GJfIesjHcU9xZH6r6shjMIfb6Y1FpaoYxcTiOCQo7bIg7wj
         ThUOqpQ39fhxxoPbqAyndzdjLbd/bA56TVU9gQwmXQFGaDTAt9XEV/UEnGC6n4PAkeDo
         z1Vn0GmKOxfikhFAzamytbAPZ30uBEG0cLQOni8v0NaqIGB7Jisju+53/6YdcDefczNe
         Vj8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=CdYN+iQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si4725804ywm.58.2019.02.25.06.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 06:18:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=CdYN+iQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyH54-0002ym-Jn
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 09:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyGIj-0000wB-OO
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyGIj-0003jC-01
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:28:09 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:43763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <benny.baraz@greensql.com>)
	id 1gyGIg-0003gB-Tj
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:28:08 -0500
Received: by mail-qt1-x835.google.com with SMTP id y4so10344494qtc.10
	for <qemu-arm@nongnu.org>; Mon, 25 Feb 2019 05:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hexatier-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=sDBvZR+pfSzzu+l/dqJnibhgSdFrnmpzMz1/NEVSmKI=;
	b=CdYN+iQ8Qw7Btt02p4bRkm/iCF1cRs31BmOprY8AvakNHP9r8RGrgqLgNVu05wh2UO
	awOwr2DDtaXFFUB0jpW5Wd0cfgj73wEh3XMq7Kw1xRM4tF5ylMMBp4NpkV3qhQNh9kqX
	KcZODVtEmJLEOV5KnD5HP/Zbza7Al6WrDAvIcQJNLnYrPwxoeaFA6XQihP1r2l3Tag+k
	w3MyjPkBeksKFSlF0A/PW1D3coeeV/6F+AKhMegHxFTYtofZwNbWS0dGW4bw51Vm8bRh
	W+v50Xwr8TVtOqWPOapQ2xvRwBCTq15eR44+sBsDKzOawjrKJoinPTCsJlkJKE/mBCX6
	sW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=sDBvZR+pfSzzu+l/dqJnibhgSdFrnmpzMz1/NEVSmKI=;
	b=NxGK4DrZL0gClUXVUssS+HfLESU/m25DTaf97KttwtHgjLtHvAZJffLNsTrmdMrMQJ
	BqqF5a5l3WvrOg2W6NwZ7TSrWc0T/vbZwKTXhuk3Xu8wOkSmoCw4/8ZAkfNZjBe/Hngn
	s3cCJVpdb+scFRRgLSFmzI1E6E3QwjLqgnlsn29066VFnU8O5rrDGmHyH//QwSorYtXQ
	HqPK0g6SI07xAJytpvnnfVBsx0WS7aFhZgPTM5+iToe7j2Nphtiu6d+yN5EzCD9TzH/T
	vkAclSSFCKWRBaXJ5wutE//Im0BVQnQLQozAyb9Y9hI9s3FLcnjHiL/HxG9GRGZo8Vfc
	UflQ==
X-Gm-Message-State: AHQUAuYZ0NAe2k/iNalcL11BHPTgPf4yE5wATjYvtqp8wqwIbRmm6vdv
	WhuCAdm9UQUmj5rDMqUpjU7kcMdHoLCfdNL6t65671Al+3Y=
X-Received: by 2002:a0c:c966:: with SMTP id v35mr13899733qvj.116.1551101275361;
	Mon, 25 Feb 2019 05:27:55 -0800 (PST)
MIME-Version: 1.0
From: Benny Baraz <benny.baraz@hexatier.com>
Date: Mon, 25 Feb 2019 15:27:44 +0200
Message-ID: <CADdcL-_0R4fPFjyMZMHWy43iB=F6Y_ZF1F3CbhMAd_Kv0MsatA@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000087666c0582b7e814"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::835
X-Mailman-Approved-At: Mon, 25 Feb 2019 09:17:42 -0500
Subject: [Qemu-arm] ARMv8 (aarch64) emulator
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
X-TUID: LgH4wt6MxW+l

--00000000000087666c0582b7e814
Content-Type: text/plain; charset="UTF-8"

Hi,

I have to run ARMv8 (aarch64) emulator.

I have created an image centos7-arm.img with
qemu-img create -f qcow2 centos7-arm.img 40G

I run the qemu-system-aarch64 on Fedora on Xen.
(particularly
qemu-system-aarch64 -boot d -cdrom
/root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda
centos7-arm.img -machine virt
)

But there is a challenge - it answers
*Unable to init server: Could not connect: Connection refused*
*gtk initialization failed*

I see many people asked about but no answer has been found.

Alternatively I tried to run
qemu-system-aarch64 -boot d -cdrom
/root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda
centos7-arm.img -machine virt *-curses*

In this case there is just no prompt.

Do you have any idea how I can solve it?

--00000000000087666c0582b7e814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><div dir=3D"ltr"><br></div><div =
dir=3D"ltr">I have to run ARMv8 (aarch64) emulator.<br><div><br></div><div>=
<div>I have created an image centos7-arm.img with=C2=A0</div><div><span sty=
le=3D"color:rgb(51,51,51);font-family:Arial,sans-serif;font-size:14px;backg=
round-color:rgb(245,245,245)">qemu-img create -f qcow2 centos7-arm.img 40G<=
/span>=C2=A0</div><div><br></div></div><div><div>I run the=C2=A0qemu-system=
-aarch64 on Fedora on Xen.</div><div>(particularly=C2=A0<br></div><div>qemu=
-system-aarch64 -boot d -cdrom /root/Download/QEMU/CentOS-7-aarch64-Minimal=
-1810.iso -m 8000 -hda=C2=A0 centos7-arm.img -machine virt</div><div>)</div=
><div><br></div><div>But there is a challenge - it answers</div><div><div><=
b>Unable to init server: Could not connect: Connection refused</b></div><di=
v><b>gtk initialization failed</b></div></div><div><br></div><div>I see man=
y people asked about but no answer has been found.</div><div><br></div><div=
>Alternatively I tried to run=C2=A0</div><div>qemu-system-aarch64 -boot d -=
cdrom /root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda=C2=
=A0 centos7-arm.img -machine virt <b>-curses</b><br></div><div><br></div><d=
iv>In this case there is just no prompt.=C2=A0<br></div><div><br></div><div=
>Do you have any idea how I can solve it?</div><div><br></div><br class=3D"=
m_-1904047479752640569gmail-Apple-interchange-newline"></div></div></div>

--00000000000087666c0582b7e814--
