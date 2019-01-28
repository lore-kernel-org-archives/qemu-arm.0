Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3380450wrt;
        Mon, 28 Jan 2019 07:10:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5qs4ML8XP/b1gpEiJXjJaxVkr4letk8beWhYU+0qm3A/z4LMGAwEbEfdZr10sxiQRf8+co
X-Received: by 2002:adf:b3c3:: with SMTP id x3mr22240668wrd.294.1548688225075;
        Mon, 28 Jan 2019 07:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548688225; cv=none;
        d=google.com; s=arc-20160816;
        b=ALfzVj2DlvoCJRf2nat3sebKJJzlAj6bcOSRwWOuq+q3PPtcMB4n7vFBdesOilJaEo
         xjVdvVm/pB19oTFVUNLEbfjqKjpvsmbiBho2Pz8Zd1Ye3UF7zPK2tWLoaKoDU5z9sXQg
         aNVurAMjx+UDh8dTbegHPPa4bBUBRv5Yle2K6i5OjemoSIX5L8PCV8B6FfGfDBsrAsjr
         ESP4CBPzNXLyoJUWk1HNshP/bP0OVeRYtG371+yKcxqSuVJe6eaxsxHqxqo4sVAZGgmY
         fYjjDFh4LCVGb3Ee4MKwWTnwr80arEyfIt39f0Vfv0THfUIn/YRzdP5aPCEk/5IXztDx
         5/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=GE8PMRDF6K9BaxdlIYWAQXQWzR3YKilFt856wEdo9i8=;
        b=tuwjMH+Cx9bYRS3LFZDBzVrPo1cUQd7q5l8bcHazY5ueQ5wxbGHHhh3y99MdXz0mqF
         yX/dXDZKdmG8sGn9llhC30Oy97zD+qstAiCLF1WuwXk9NANbmf3z3HFkyR7dTT2CCz6s
         o4yMIBnN95QpWPMctj+pdeerS4q/6szpPT0CAh4whb+Ab/TtKlUyxxO383a8x89XNsoP
         sueMxiUnrHbTl3dTHX2FuXKjbPOmcr3vOsh+MbK0YPDVFFyHtebUdyXNu7OGzkZ89mYs
         hFdZEEWsLdjBwDJBlMMYralsb+i6bMMfRD1LVMF/kWmTWQvunSubVgciDB/KoXFT9+zj
         mtUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=skZLPwiT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1si77855462wro.136.2019.01.28.07.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 07:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=skZLPwiT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:33379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go8YK-0008Tp-45
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 10:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go8XB-0008Io-Nv
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 10:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1go8Lb-00048L-DK
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 09:57:15 -0500
Received: from mail-it1-x133.google.com ([2607:f8b0:4864:20::133]:37570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1go8La-000486-LU; Mon, 28 Jan 2019 09:57:14 -0500
Received: by mail-it1-x133.google.com with SMTP id b5so19722002iti.2;
	Mon, 28 Jan 2019 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=GE8PMRDF6K9BaxdlIYWAQXQWzR3YKilFt856wEdo9i8=;
	b=skZLPwiTvYn97Z+FzPL3eC2D8rkAHkoDggHRQr5zNwCe1iDdnT7eQXKzXeAALBJJ5u
	UamvqF86I1HwadDmmsHVT47Ly5X8TBmMRMavZzsjGufK42J2wMXTfuwuR1RFOoNACoBm
	FpZCRGtuemtNV4KlERO8ZYdQyfxTwCG9cnZG7cAlSwa17Icv/Ec4au35Lxzfos03ymHc
	wT1U5JKmd/i1xuIjbB90mp/fxIcoYtNoGxUbgmbjJRqRgMnZz6a3Man8kNc8QDIgxiIM
	4jbktZqL+x4p+vwFfcxC2/rilHm0phnb641CyFxiIWrdYeUlzkocAfC1R4/IcJ/cAVUh
	jMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=GE8PMRDF6K9BaxdlIYWAQXQWzR3YKilFt856wEdo9i8=;
	b=rsXOJi3wvTB/29Xi7tpqXSLoZX4YpohqixQ3FllOQ0hIeo6Q5eCL5Xy3Ypf8sJW3dX
	G2AvuVTy4uWbkFu9xVjHko7aTTKKMp3lGYpib8ltJWuqCyeHqUocmeLQMoSoHmvlCzVD
	K9ux0yWPN1Kml77M41zYXnJbx+VqEC9TToMfgg+lzmFmfl59GLqvV7KAnzkpIHtX8Ub7
	0i7kDLo7fpnmPqE7vMokTf1BcrO5nDRkucwDSb2dYEnXbEb6a0be8JCbsApOkJtipL78
	P1o8d7/PNtBOcrdM8hPAPur3a8PUFhDT1kRPrew95q93gUFEKrOqkuPKg2ddBBaxCfkB
	agkA==
X-Gm-Message-State: AJcUukeqKRJJ8sCneShoQNIMjlZ5R4+d6ewbbFQs60tEA4IbG6z7dk8k
	qggxfDO2zuaj1EVY5G4aiY5eYBOUKIXpwlyNX/tWdg5wnT4=
X-Received: by 2002:a24:fa04:: with SMTP id v4mr9016763ith.175.1548687433524; 
	Mon, 28 Jan 2019 06:57:13 -0800 (PST)
MIME-Version: 1.0
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 28 Jan 2019 15:57:23 +0100
Message-ID: <CABoDooPLHeQgTW-5C93VKsmRf9CzJUuAzmJHFrCDOpLZoUn-Lg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::133
Subject: [Qemu-devel] AArch64: fcmla decoding errors
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WwRqd1ygzQRZ

Hello,

I found two issues with FCMLA decoding in AArch64 disas_simd_indexed:

- FCMLA is not available as a scalar instruction
- size is wrongly shifted by one instead of being incremented by one.

Thanks,

Laurent
