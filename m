Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2285400wrt;
        Mon, 18 Mar 2019 05:10:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6FpD96WydVfZcLe3S0le+IVwT0mJ9RWXTAFJcqe2PFF0LfvS/6JLQNLCQX0hOdqqVZTj6
X-Received: by 2002:adf:fa88:: with SMTP id h8mr11778671wrr.117.1552911038346;
        Mon, 18 Mar 2019 05:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552911038; cv=none;
        d=google.com; s=arc-20160816;
        b=xfxqAh5HFkbHQ1r3hs4SYUpcvsS/zetkyFIaXNqB5QswKkKtqKSRZrmqIc1nylCVwH
         9tOmmGsERrQv7eoCe71RiL0f8mPUKU2NDJY/Qvma/RP6AH8R8twkDaahqGlaudvd1SWW
         oLpejLZn4VlAa6DzqM9H37BUbyDVd6O/z7nlnTuitUYOgGWrB9eN+fM7KiKCGhORkEPh
         LVw50VzQa8RshQCiBB+M2qKYF+NWhkkVa9G0fedkBBvfZf7O9fHny8UtfxSJA2MKKiv+
         qV6Nkz7ZyF3ob+oFWNgF//GA+I/S5P2eHFUCeY60fJxyOz8+oGJlqgkfAoG1UzNXRgwR
         e85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=PBDx61cuQqKNt5gXGwwrZ/C6AcNQAzgbUYivvW2Tlm8=;
        b=DIUk1AiTlCoQ5XhqxqALahum2Fn3HGl6rqEBtukMppNc5Eo2zkeP4wcVAk9k6hnbrL
         FV09PMzDFoGoRnVxRqG1SeBw1vKqzlG39O2gyW9W0ubmseewZgmo+3S5To6P/zefNPn5
         wXUu0tOyV23d8ccrb2QRXiK/zEWX9x2RRZ0oAzXiwILUCDUB4n677Rt25dp5rTqgfQGt
         Y2j6KPpebxb/jJpE1a3R5nTxMZCcYKjFENNZ77kX60u+CRl+mN6pcKFq9Aj/tP9lqCNf
         UiyiYiC6T7oj4hrwlsSGYLk9WJIlFlLHJ5neL981smc6Mu7DcKfHFpg+TqzlKVhChVWF
         xwVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ntjiayk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si3984323wrm.106.2019.03.18.05.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 05:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ntjiayk5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:40634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5r6D-0002hv-Al
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 08:10:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <madhusudan.bit@gmail.com>) id 1h5pRi-0008S9-NJ
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 06:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <madhusudan.bit@gmail.com>) id 1h5pQj-0006R0-Qd
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 06:23:42 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:37121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <madhusudan.bit@gmail.com>)
	id 1h5pQj-0006Q9-BO
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 06:23:41 -0400
Received: by mail-qk1-x736.google.com with SMTP id c1so9264412qkk.4
	for <qemu-arm@nongnu.org>; Mon, 18 Mar 2019 03:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PBDx61cuQqKNt5gXGwwrZ/C6AcNQAzgbUYivvW2Tlm8=;
	b=Ntjiayk5JgA7PaSCMYcvk2d7p8Tsh6haG2B9d88cYJ5RG30j0pR6IkAe9EXanj3t++
	/qSXGR7wJk/74X8k2NYtrb4C+SSH4hmnjzne/JOIAhs4eBGxthrwfqOuRNLeCgV0qxLd
	zavP82pSt5mKFF6Y/YoWZo4IaEY1ofaTzvWvVhJkq5NiB0ZZbCXetE/IbIdVHvq7ptDW
	lrD29D2Lh1/N9ZklSkhiOumPvlvsyEF+WAPBimZXbfGcgqalOwMYzwnEsy+jsJ20Ajc/
	nt1Rdt40+g4QLs7ZrlUy4uiVcelgQ6XtT9BO3XIo+RVegX6M5caP5JGk9Sfyj9kPUKuy
	y5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PBDx61cuQqKNt5gXGwwrZ/C6AcNQAzgbUYivvW2Tlm8=;
	b=uemTm6hBdQIxt8sfYsAH4QqaEXuY43fr3o/d/31DSn14VB9LZILk8KJqakwVGAQErw
	HU/bVjTRKoBFCACEz7rgJNpcoNhWi3P4lQ12uv1Cr1nA4jsPzDCLTed5EY64CVN3KIwG
	djDVhHqUXrHmp3MwrJCEw6Cehp1HryU540fRVxmb6cuguJvRB95izxMBkWjX/utz8zwG
	+V03Kcn3JDe2QmZV5n9IPRqYqlf7GXBANXtJMJH5hN9GOVDF6456jKIXn+9hkTIKApC5
	BadDTBHRo4iaHut82IwrVJ8qRZL0JbHWPVG7pYUH0DRa7ff4812GAIEenvx7vbfCTzlu
	B88g==
X-Gm-Message-State: APjAAAWl8T0Q6zjSPoUaRY+cNCI/JlxD+WOIfPJyVK9BlfRlmjBneVAj
	tQr9VXbHqTcf0pPRTUg0X2BL47m8dZXjg/fD0qOCww==
X-Received: by 2002:ae9:e007:: with SMTP id m7mr12135806qkk.248.1552904619177; 
	Mon, 18 Mar 2019 03:23:39 -0700 (PDT)
MIME-Version: 1.0
From: Madhusudan A <madhusudan.bit@gmail.com>
Date: Mon, 18 Mar 2019 15:53:02 +0530
Message-ID: <CABQjfmMThKjQ-Fn0KqqdxBEiWkwS_0-VnrWLySrQU4LCoETv=A@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000323a2005845bc800"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::736
X-Mailman-Approved-At: Mon, 18 Mar 2019 08:10:21 -0400
Subject: [Qemu-arm] Boot QEMU Arm from NAND Flash
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
X-TUID: mkcD9ZDB9vQA

--000000000000323a2005845bc800
Content-Type: text/plain; charset="UTF-8"

All

I am relatively new to the embedded domain and ARM architecture

I have devices that use a dual bank NAND flash. The flash has 18
partitions. The project creates the kernel images (zImage and uImage), a
u-boot.bin and 4 different filesystems that are loaded onto different
partitions (MTD).

I have tried a lot of things to try and use qemu to emulate this. The board
being used is very old (Marvell PXA166), so I am using machine type as
virtual.

Somehow, even if I just specify the kernel image, QEMU just starts and
shows the QEMU prompt. It never attempts to load the kernel or anything.

I know I am doing something incorrect. Any help would be appreciated

Madhusudan

--000000000000323a2005845bc800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All<div><br></div><div>I am relatively new to the embedded=
 domain and ARM architecture</div><div><br></div><div>I have devices that u=
se a dual bank NAND flash. The flash has 18 partitions. The project creates=
 the kernel images (zImage and uImage), a u-boot.bin and 4 different filesy=
stems that are loaded onto different partitions (MTD).</div><div><br></div>=
<div>I have tried a lot of things to try and use qemu to emulate this. The =
board being used is very old (Marvell PXA166), so I am using machine type a=
s virtual.</div><div><br></div><div>Somehow, even if I just specify the ker=
nel image, QEMU just starts and shows the QEMU prompt. It never attempts to=
 load the kernel or anything.</div><div><br></div><div>I know I am doing so=
mething incorrect. Any help=C2=A0would be appreciated<br clear=3D"all"><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div><br></div><div>Madhusudan</div></div></div></div></div>

--000000000000323a2005845bc800--
