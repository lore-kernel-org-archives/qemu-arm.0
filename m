Received: by 10.28.91.67 with SMTP id p64csp2201810wmb;
        Sun, 4 Mar 2018 22:01:14 -0800 (PST)
X-Google-Smtp-Source: AG47ELvBNIsJeESo2bulc5vVaX2sY8yNfRLZOd+uJD3gODms4ZgTBacl9NMQ11fFWz15o2rpjOCY
X-Received: by 10.129.109.82 with SMTP id i79mr8409291ywc.60.1520229674448;
        Sun, 04 Mar 2018 22:01:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520229674; cv=none;
        d=google.com; s=arc-20160816;
        b=CTKIh/2sBUXLdAQIA6PMYJt5s62Lt/FgBrRUe3srUnTV8MvbSvBhyFUU4Or2DzjjcN
         d2gMWg5MXChlRK7uIZori+P5BUwbMVI6C6YAWtMlYIL1CyYnoYvgefBm6av5OUuW5k84
         BLI2Vx3anup1aRFIUYFHaXMnrldj7nykKgEsZ4N5+JmTLTV/o1jSPcBkyRGMbmKxOknW
         LZCnWASnppS7zubdqZSilVwVsO2NHKZ9Nyuse4MFZZzBq/UmvtHGFhVEfGv/IfTtcyZM
         pISXcJoZ+clM7Me4mzJvki/G/8m3PLYkUGAxwBOKKy5MlJsRQ+5859Jw61hvv+a7+n/X
         At7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dtHLhhxCmvJvpBnaBMls2VD8tsF9gZyj/ORN6aTYVe4=;
        b=Gm9/D8dkgjrJ+EqRbhJuaHyvpTKqsTqdibJi9SzsaIXFW9qgTOG+A3Nd1elVdZDZmA
         3IMxgv7nbdK86b8Jvx293obIe4qrO8FKE4XFvZBujJUBE2DDw258YxYxD4iWVfsfb1G1
         HV9ZmRbO5dD6fel+s+YMyhcYd+iONO6phc6g6w0v5GXv2pPq2M14y73k03eX/k52tu7u
         5uWzHkqwCYpMWNu1ZyBFiB7FOWEvDIdclARxIKIkFeUH7v3i3YdfnLx50GoYEGmQtymw
         P79+Q1cV5TIRKEOl3IjiaRPjjvqLz3OGCG7OIunyxnOX5cvzHytH6XVbDRo3Kkepm/Uk
         B7CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PNwlDTU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x206si2020205ywb.276.2018.03.04.22.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Mar 2018 22:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PNwlDTU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esjBR-0000Kj-U3
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 01:01:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esjBI-0000Jl-Oj
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 01:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esjBI-0003qR-1D
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 01:01:04 -0500
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:39861)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1esjBH-0003qB-Rt; Mon, 05 Mar 2018 01:01:03 -0500
Received: by mail-qt0-x232.google.com with SMTP id n9so4197745qtk.6;
	Sun, 04 Mar 2018 22:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dtHLhhxCmvJvpBnaBMls2VD8tsF9gZyj/ORN6aTYVe4=;
	b=PNwlDTU2SoWUCsEXrAKpNe8ZTFZUA5Rlfnkc49ym3cVpyIDwiqZVmIft4P2AUKnruF
	FdFXQmmW80LMTRAvvOmXMcLRQ5FB5lrrBYVLFTu2WTUK8Hw31JEdgHalOH2rnayTEUfh
	Olqw9LW3yHPIrlmVwiDJhNraw2OgKNGLfd9B2b9NYHHyA9r/yfAk03DPMBFa78IoORvr
	ZtGyCVSLKif0U+84vBDk3VXWJS7IFJdQKbFpdKLYpPDOn+eCT0W4DDDdSw0Hc6jFAM8q
	l2mCd/7Ga0sWJQSh17kc02KPfcC4RKV5eni5WAK6CtHCUZtvlUd0yTyCA+/KZkJYoefM
	BVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dtHLhhxCmvJvpBnaBMls2VD8tsF9gZyj/ORN6aTYVe4=;
	b=AyAtXvCIuN3+VAnuzGQ4Y3jIB5i3NpLhJMSPEvROZnqE+nW158le1gbn9iTsHgZ3KK
	hIfVrXQaBiHx68fNX1v1/bB2FN0i/SFzAqt1giPCVGOT4CikeZa3Axpp+kL5Ciyz8Qr6
	ODpMOx5mrSJBGEU9gyaT2jzW9EuTV5ytqd2oJFMv1qOX3rnP56GtJ2rMF31LhrZ7ciZX
	R5o35fC7n4VFqsNiPdFMpGbzckuUJ5Pwg7PgMlCEw9BrVna85ch0zYSgpVnL4M94daSU
	mjPG7U1uccAaguiozdWVjpa8y13UDoen6agFOu8hVpzKjMKOcu5xWKHySiH/zjdZgUVJ
	7snQ==
X-Gm-Message-State: AElRT7Ed6uweEXiW0NBj/5iXAZnEVshg3MBlgkoDS1Bgud0xRCVyN4gl
	wbZDykzFQ0KqVJ9XGdTF1e3SjZ7LM4WgUs14IkbGqg==
X-Received: by 10.200.30.134 with SMTP id c6mr20104323qtm.320.1520229662819;
	Sun, 04 Mar 2018 22:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.80.146 with HTTP; Sun, 4 Mar 2018 22:01:01 -0800 (PST)
In-Reply-To: <20180305051655.5944-1-andrew.smirnov@gmail.com>
References: <20180305051655.5944-1-andrew.smirnov@gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sun, 4 Mar 2018 22:01:01 -0800
Message-ID: <CAHQ1cqHc-kk+Ls6o8oWjFSKij0tOBRObbYBZiiFyGo1kS2iiYg@mail.gmail.com>
To: "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-arm] [PATCH v7 0/3] Initial i.MX7 support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hU6BI9YxBA/h

On Sun, Mar 4, 2018 at 9:16 PM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>

Ugh, just realized that I was too hasty to call git "send-email" and
patch 1/3 in this submission is broken since I forgot to remove
"is_express" field. Please disregard this version of v7 and I'll
resend corrected one shortly.

Very sorry for the noise.

Thanks,
Andrey Smirnov
