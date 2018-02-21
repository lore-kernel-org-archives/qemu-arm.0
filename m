Received: by 10.28.71.27 with SMTP id u27csp286707wma;
        Tue, 20 Feb 2018 20:05:25 -0800 (PST)
X-Google-Smtp-Source: AH8x227VDtNetXI0fCxZHlquE4j7IwMpM/qKPUG/dkF6DUtyNO981wSW/Ln0OEb9vEyGoXHrIvLu
X-Received: by 2002:a25:808a:: with SMTP id n10-v6mr1389702ybk.230.1519185925169;
        Tue, 20 Feb 2018 20:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519185925; cv=none;
        d=google.com; s=arc-20160816;
        b=awp3WLHYnEcPNe2QCKhpmVxGvaWnUcJLcV7l/bRoDj6k4eI9tRWo+IBBDknpIJp9J6
         u+63ztqOcZvU//hMGb4u/HmQnKGs5Qp62Yc4R+RaGglYOdnJ/K62y6l0CSDxW496KtbH
         xwjNldfXfGdt+k1jr7XqcxXT485QRIGgKX/bGRl7Xp7yFAyg3QN3bl3rt6ktAjX5w+EV
         DQCmpDi+UJv9TNMym8tMy8fcPXRLug92ssErTBRypUvVbtsoaaZEospIwUk64gTaUe86
         /FbEQ46VjJIdhGNLjl4tzSK83uB7rHP3N/nAiB6+BixGV4zR23U2y66bA2X6mzbtjrRu
         Evvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:arc-authentication-results;
        bh=WnsR/YJ1PNSEZWMJnmiwprMFGBeJrOPFvJ/AUHezpdA=;
        b=VfcQYnku5G5jlqDptAFdLNALkz4Aya5uy0fe/6NTk6fS4jGtinV2tInhFtvGNkVWR9
         DwVISwI6yIB2PKkQ+xoNrI29i3ZhVUfwppBjq88ufbd2p+CZxx6a2NtcUSQGa5ARixwJ
         jnRxYszwK84LATZ1Z50FyvSRoTwXargk6rDSyrRvSCO/HgkCp6GMO2wn2Idwa5MHJ30+
         YgutTSplnA0FZxLNgGwMZTTULFYom+JJJD5pawpvUzS6X/3ZIrzu8jkkroJk6YSCKXRt
         eJpOfb9uh+GQGdk0ecX2t1VxYgrYX3SaXe4UB/EBzADrP/ZfqbuD7AqfbC9mwW2DkykB
         vMPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10si3247670ybi.20.2018.02.20.20.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 20:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([::1]:59003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoLem-0005LH-Ip
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 23:05:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoLSG-0003L3-4d
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 22:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoLSC-0006VZ-WE
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 22:52:28 -0500
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]:35076
	helo=omr2.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rdzhang@vt.edu>) id 1eoLSC-0006Pb-RI
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 22:52:24 -0500
Received: from mr2.cc.vt.edu (junk.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:9:0:9d:8fcb:4116])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w1L3qIYr019191
	for <qemu-arm@nongnu.org>; Tue, 20 Feb 2018 22:52:18 -0500
Received: from mail-qt0-f198.google.com (mail-qt0-f198.google.com
	[209.85.216.198])
	by mr2.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w1L3qDES017677
	for <qemu-arm@nongnu.org>; Tue, 20 Feb 2018 22:52:18 -0500
Received: by mail-qt0-f198.google.com with SMTP id c25so289176qtn.12
	for <qemu-arm@nongnu.org>; Tue, 20 Feb 2018 19:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WnsR/YJ1PNSEZWMJnmiwprMFGBeJrOPFvJ/AUHezpdA=;
	b=RYNv+GkPltuaqsOCW31Cu/sHkz3jg0rcwWNBFXZwDnhxjFf1Hbg3uBdCQoVvoe1bI+
	qo6qyeh0kfbG0I7dbZ67OlK7ICxmrWoPMLWoQ+N4ZO5DidP5J9SGep3pcSEJs1pAnTl0
	byqxsv+XxSmbfoq70tlP1sq2YhJvMvIuvFwbPtcerIBSyua3MUtFGEhOZcdX94Uhe0bH
	sERqkfaJ6KrDlhdeWL+oXqBpL6ZH2bvpX7Y1EuInYc7ZYA41SfOUJu5dKJV66u2ip5wI
	kn++j+0PQgNBJfJp6Fo21yAS16LJarBGf2/W78vw0G94j0duLYeatNdg9mAZSeFXAzHS
	CTxQ==
X-Gm-Message-State: APf1xPBjDrGAbrjnehkaKyz7lxhHuscmzk24cIjH/B0aouVbyVjjKjwM
	qX7ggkyv97qqmMNOPZ6pSZZBPGYfks71RuhKUDE5E2/KnJFKDkh8EKuzvyEGTOJWAQrXVsFl/mz
	i7zIpeM4CdctcSrMBNQaE2cpqLv8PlGDZ11f160Y=
X-Received: by 10.55.145.193 with SMTP id t184mr3079614qkd.39.1519185133473;
	Tue, 20 Feb 2018 19:52:13 -0800 (PST)
X-Received: by 10.55.145.193 with SMTP id t184mr3079596qkd.39.1519185133143;
	Tue, 20 Feb 2018 19:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.39.200 with HTTP; Tue, 20 Feb 2018 19:52:12 -0800 (PST)
From: Rd Cheung <rdzhang@vt.edu>
Date: Tue, 20 Feb 2018 22:52:12 -0500
Message-ID: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="94eb2c084f7c359eca0565b0da31"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8400:0:33:fb76:806e
X-Mailman-Approved-At: Tue, 20 Feb 2018 23:05:14 -0500
Subject: [Qemu-arm] ARM cortex-m3 instruction fetch misbehaves during
 do_v7m_exception_exit
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
X-TUID: Xupiovt+buxh

--94eb2c084f7c359eca0565b0da31
Content-Type: text/plain; charset="UTF-8"

I am emulating TI RTOS(Texas Instrument real time operating system) on a
cortex-M3 device. I have made boot up code work, but I am currently stuck
at exception handler.

when the code return from exception handler it goes to:
0x1001c90e:  b401b402  strlt    fp, [r1], #-0x402

while it should be:
1001c90e:   B402                push       {r1}
1001c910:   B401                push       {r0}

I notice the TI RTOS return from an exception with PC with bit 0 set. But
it should not be an issue of current qemu.

Can anyone give me some clue of where to look at? Or is there any work
around method?

Thank you!

Ruide Zhang

--94eb2c084f7c359eca0565b0da31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am emulating TI RTOS(Texas Instrument real time operatin=
g system) on a cortex-M3 device. I have made boot up code work, but I am cu=
rrently stuck at exception handler.=C2=A0=C2=A0<div><div><br></div><div>whe=
n the code return from exception handler it goes to:</div><div><div><div>0x=
1001c90e:=C2=A0 b401b402=C2=A0 strlt=C2=A0 =C2=A0 fp, [r1], #-0x402</div></=
div><div><br></div></div><div>while it should be:</div><div><div>1001c90e:=
=C2=A0 =C2=A0B402=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pu=
sh=C2=A0 =C2=A0 =C2=A0 =C2=A0{r1}</div><div>1001c910:=C2=A0 =C2=A0B401=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push=C2=A0 =C2=A0 =C2=
=A0 =C2=A0{r0}</div></div></div><div><br></div><div>I notice the TI RTOS re=
turn from an exception with PC with bit 0 set. But it should not be an issu=
e of current qemu.</div><div><br></div><div>Can anyone give me some clue of=
 where to look at? Or is there any work around method?</div><div><br></div>=
<div>Thank you!</div><div><br></div><div>Ruide Zhang</div></div>

--94eb2c084f7c359eca0565b0da31--
