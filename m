Received: by 10.223.197.9 with SMTP id q9csp10206052wrf;
        Sun, 22 Oct 2017 22:01:00 -0700 (PDT)
X-Received: by 10.200.50.45 with SMTP id x42mr17831180qta.114.1508734860666;
        Sun, 22 Oct 2017 22:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508734860; cv=none;
        d=google.com; s=arc-20160816;
        b=oLMzwYj2vZWgc+oteoMLyMFLiQy9GELthgSfFQgsZ7tZVidyDENR8L6u3eIEzUA7Py
         ARYJRwK7oFaG64p2S7BfQBm4rbL6hiWPmwBdtsC6t/VD+1QXSBaFXYBXrBXvA+igxhp+
         eIq5LKn6/3TfDatlwOGLnZn0WG2GAuLdfhnsm3YuBNcvCkJnNBUgwaVkHGmX89+UbltH
         i4VA+MGA/AK/h5OIHb9d6C3dwRfXXbd5bZmBswfg54C0rmv+VXMt9brhX0+vDECQzy3g
         IdlX5JfEliEGhONV/7cub+Nhhdk4TMBnCWQq6+RkuoeNwBQLR8GPLVeegM8VKtnOXF1v
         IMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=uOz+EMmjmFE3pU/areddaX02Lzh2x0I1mJmzl7yNOPg=;
        b=FwCy7USG5G8MawbEETsJmQQBDRi8S4sp1mHUVEFLPARCUgqFBGoSqSKbSDw2txyHio
         uj3puLHubqug8CgVa+fBUh27GVjwyqc28uv1ja5loTvDs+NaXmgAjnANoFc1beOcjQid
         cIMFvIfwFOUQlM4hU0qcJ75hjt9s/8l/nrr/bpAUWBL8x3kJ/unS9q9WnPWMstGfT6vQ
         +MSQ5PIRbpntoH5xTi23Dd/7lD27+4YFNIVIRm30D6NKGzoDkz0bUhm5CogeuC6QEkwX
         nfG7szzYJeoyC+JY0HRPZ20tN+2Wc6TyooCkGwg+x5r9V9rQDhgWqUgODf9HofuqFllQ
         d0kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=1jrJLLf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d79si5387051qkc.32.2017.10.22.22.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 22:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=1jrJLLf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:36843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6UrC-0001NB-Gg
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 01:00:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6TeA-0007Ed-37
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 23:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6Te7-00015w-14
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 23:43:26 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:54633)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>) id 1e6Te6-00015H-S4
	for qemu-arm@nongnu.org; Sun, 22 Oct 2017 23:43:22 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04130c14
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 03:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:from:date:message-id:subject:to:content-type; s=mail; bh=k5Awfx
	WSaaRMwpBZyDusA40MBrE=; b=1jrJLLf7V3eg+cZRNxAMzBNIZEvFpaxKI9pm/4
	OtwGxOWhekxM2TexliueXeIAxcBOUmdiNswEQtrEH4QIiWuSoimagJHleeVnMUoY
	XBYna6AcgtJKcZe6ms9QquWXmATmMq6/eK9fRrdu43n+0cGCSayWKoE9rxdgRe3n
	8LOFh6Juc6Q6WxZi9N/xZOaK/hdnq/pRowAjddo09guRaAWJeOtOzc8HlSOAZtGO
	p2xizS4XYHJAGme0J8OQoWXSqnk11n+K32ouNbFZE3Vuj4cQVRwkbZ0bW8czfYBE
	d6iIWm5UdwybMbUl6j5xdYOSFSBr398lpk4EtaTUBbch4oWQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1622a1da
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 03:42:01 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id j126so28600043oib.8
	for <qemu-arm@nongnu.org>; Sun, 22 Oct 2017 20:43:19 -0700 (PDT)
X-Gm-Message-State: AMCzsaWlAT833NrGw8Vd9C7uK3ieOA/UclFqbzXEeRlXb/TB9Ee33tA8
	F54pVvz93errHiX4nFTVkMnw1o07ayxySDo0cxw=
X-Google-Smtp-Source: ABhQp+RV4XGOSWsOJapzHkHo8VniQotZKpIr0xR00t3nkOo3FhYEd7G+bT6FyS7eIJt4GIBJzpvEaARAomNgN8Mh14k=
X-Received: by 10.157.68.6 with SMTP id u6mr6494808ote.211.1508730199364; Sun,
	22 Oct 2017 20:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Sun, 22 Oct 2017 20:43:18 -0700 (PDT)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Oct 2017 05:43:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9ookp9nbyU-aaL-7F1y0unn7whfSfadj+oMfjLc=bwpOg@mail.gmail.com>
Message-ID: <CAHmME9ookp9nbyU-aaL-7F1y0unn7whfSfadj+oMfjLc=bwpOg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
X-Mailman-Approved-At: Mon, 23 Oct 2017 01:00:51 -0400
Subject: [Qemu-arm] 2 pl011 on virt machine
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
X-TUID: PZnLfkYvO/pd

Hello,

I'd like to have 2 pl011 serial ports on the ARM virt machine type. Is
this possible? Or am I really limited to only 1? Can I add an extra
from the command line? Can I mark that secure uart as available to the
OS kernel? Anything to get a ttyAMA1, essentially.

Thanks,
Jason
