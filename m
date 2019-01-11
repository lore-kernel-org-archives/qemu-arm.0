Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp261019wrt;
        Fri, 11 Jan 2019 07:26:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5w+4Q4rmiV2khgt0OhH5YiQN+lz3wkhg/gRVSaL2RRfj5DU6CflqGAfWtdfiVkg7Jh/LVc
X-Received: by 2002:a1c:2b86:: with SMTP id r128mr2872847wmr.100.1547220388978;
        Fri, 11 Jan 2019 07:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547220388; cv=none;
        d=google.com; s=arc-20160816;
        b=eGz70vNoXHxbGfJ5Jg+deImRk3JpP/6CsU+L1cRpfE+3+QzPKWjw2xHTAFVglBEnp2
         pNpyoNl5VByWucfEvXE5z4zu6nyUHEGGiXlE5oXnYPmXYGQbKpLphkfHfn/mEu2bvMfI
         mxKI8/S0C+0GgCPowxSsU0B9RKRCgXTWvZC1/8P8ioHF1lAJW+0g+iTGkH8wgZAkPDGG
         0rfKCdQ0lkslncUNWAuhkFyfK11vHgDIk5tZXkXPas5cngaFhLHyNpJH+cckQr/Yf4JX
         /Axy6swHQujXmghEvMdNwdwvl/NtIpc4qGvmGEry/U+mbs8e7GW1WTPL4g8xRUzaXHWK
         8fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:feedback-id:mime-version:to:from:date
         :dkim-signature:message-id;
        bh=tQ2IRKGTCkKOPDE5mPuGwFLcoXphKfAIlhTtGCQL5TM=;
        b=bgmIzTp9bQfZnEGVlBm/zXzOwqC6NZvY/LfaOjUpNmD4ilBTDrPW34OaMqM3fkacKm
         rjvz7UGW6AjC5Q4k3mf6xFZKfWWn6vL5qxh0MJ3X3Sja5/qiHfn3wNTKjJr641HKVsg/
         u2qbgHLt/nNN0bZOXnxLoLLfoWhgkLaz4+yoI+lGvGhUHNnp02Gick0UnfV8T6Rkl8Dc
         HRbDaUK8L7ftTidR9uMk/NIcfwaSHwIDGrgXdGimzBuOAB8NBSLbYIynrzT3l2YWWG5s
         ReJ6tFU2pQzqvmz+V0NZJjBnWXw9mcn3oXYXB8lMiYhsQIZWcTSCppCm5Un6ALEaQHw1
         qINQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@qq.com header.s=s201512 header.b=a+Ikb+wm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=qq.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si13028133wmb.177.2019.01.11.07.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 07:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@qq.com header.s=s201512 header.b=a+Ikb+wm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=qq.com
Message-ID: <5c38b5a4.1c69fb81.ca580.c142SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: <201901112312248933592@qq.com>+6365BABA5BFBE259
Received: from localhost ([127.0.0.1]:51321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghyhY-0003E4-2W
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 10:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <21597375@qq.com>) id 1ghyhM-0003Dv-2D
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 10:26:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <21597375@qq.com>) id 1ghyhL-0005dF-El
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 10:26:16 -0500
Received: from smtpbg436.qq.com ([183.3.255.49]:59046 helo=qq.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <21597375@qq.com>)
	id 1ghycJ-0003qd-It; Fri, 11 Jan 2019 10:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1547219546; bh=Tx3nx3RdAVaMdwMmO20LZrn2mRCbJz4g6TUg82zJ+qc=;
	h=Date:From:To:Cc:Subject:Mime-Version:Message-ID:Content-Type;
	b=a+Ikb+wmH99hN1Bb/+rshSSg5gIfasLnSiiLbNZgpmHxyxtX7r0+QXf9EC7gVWLiK
	s4B6ZfkaCmPSplLa0+xs+4tO4WxrgcRGrVrJs/w2loO+hdfeEdIv0DY6HaiJzyNYDd
	+cWg/u7e1FYKzYv453vfBO606rV+a9InjZwANIQE=
X-QQ-mid: esmtp2t1547219545trrj5wjva
Received: from ZZYPC (unknown [125.33.123.204]) by esmtp4.qq.com (ESMTP) with 
	id ; Fri, 11 Jan 2019 23:12:24 +0800 (CST)
X-QQ-SSF: 0100000000000070F2101000000000P
X-QQ-FEAT: pC5DE6DvekJO3hO4OG88rGhtNzaXOMcaSy7z2ePWZkO0EOFubOZzrKje2RH03
	Z4bICnXRnNg1S0q3ZnSl+Ksi7wavCabvcU8ltj4PuIKC0sJWPWp/SN1t0jUeZ2Kp4F+qrvR
	l+Kmt3DlEF2YNUA34BsEcmMzVQG6RgjIJZVty4YNZrMWYY0VbEk7ioBM0SH4E3w3sX2v39U
	cOeer23ZzLqcI47UE+jh/NaK0RIq6q8+BIaw8CQ0hcLGf0fqjlT+fiAk8kbZHCNXPmOufyU
	0DqO3gt9VsGbhW
X-QQ-GoodBg: 0
Date: Fri, 11 Jan 2019 23:12:25 +0800
From: "21597375@qq.com" <21597375@qq.com>
To: qemu-devel <qemu-devel@nongnu.org>
X-Priority: 3
X-GUID: 300A61EB-F96E-46A4-9E96-142D46B971B2
X-Has-Attach: no
X-Mailer: Foxmail 7.2.9.156[cn]
Mime-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 183.3.255.49
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] multiprocessors problem
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5DecHc54yQa

DQpHcmVhdCB0aGFua3MgZm9yIHRoZSB0cmVtZW5kb3VzIGNvbnRyaWJ1dGlvbiBvZiB0aGUgUUVN
VSBkZXZlbG9wbWVudCB0ZWFtIHRvIHZpcnR1YWxpemF0aW9uLiBPdXIgcHJvamVjdCB1c2VzIFVu
aWNvcm4gKHdpdGggc29tZSBtb2RpZmljYXRpb25zKSB0byBydW4gYXJtdjggbXVsdGl0aHJlYWRl
ZCBwcm9ncmFtIG9uIDY0Yml0IHg4Ni4gSXQgd29ya3Mgd2VsbCBpbiBhIHNpbmdsZSBwcm9jZXNz
b3IgZW52aXJvbm1lbnQsIGJ1dCBpbiBhIG11bHRpcHJvY2Vzc29yIGVudmlyb25tZW50LCB0aGVy
ZSBhcmUgc29tZSBwcm9ibGVtcy4gV2hvIGNhbiBwcm92aWRlIHNvbWUgdGVzdCBjYXNlcyBvZiBt
dWx0aXByb2Nlc3NvcnMgdG8gaGVscCB1cyBpZGVudGlmeSB0aGUgcHJvYmxlbXM/IFRoYW5rIHlv
dSB2ZXJ5IG11Y2guDQoNCg0KMjE1OTczNzVAcXEuY29tDQo=
