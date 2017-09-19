Received: by 10.223.172.38 with SMTP id v35csp5249173wrc;
        Tue, 19 Sep 2017 11:30:54 -0700 (PDT)
X-Received: by 10.200.43.23 with SMTP id 23mr3582535qtu.208.1505845854725;
        Tue, 19 Sep 2017 11:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505845854; cv=none;
        d=google.com; s=arc-20160816;
        b=ihkuY+ZOsREJXfZy731BbmzZNNLNeBBod+rWXtbb6vQRC6IqqwO/HdLIf5/Jcj+hAZ
         pv/dJuqK0jc810h1KhsyQ5CyoIEOXBdzKPYED1eLMP7Y9Pe1C4xP86n6DRb22Wia+Ltw
         XwjdZaI+l5mqPWAzOiwbWt7qlIGEmjrFwPWmPzhdhnu7uRFJEtAYcCSy3I9T1UlH/i33
         UXGuu7jXbLN40e02CabLOwhBXb6hZR65rVlzDrTdJGERoUngHVAIoZwyrSSz1cDl4P0a
         L6aAPydhaG1vThUOqszJibFGVNI45jIbK8iDeUxEjFOk8/sMl3nljyL2nzzMEAITYpBv
         hKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=qgS57fBjQZLPDm6x1l7FYBwtgvgK0lxbqzN8BLzn+Yc=;
        b=lxJABBJSkugmwdnEIBwE5huXlQOFQxrzC3iBl1FJaKTkNSbfnxaaDh8WHyfJV8Ucky
         YpVilq+EILA/jNCcg8sWr+dEPXybznn+Mpn8ZruzkEyYUcoREYWT07GrwQMjd1XAfMjZ
         ArdThCCDvvGC4O4OiUh9Q0pjv7WpugEIezIUgFfA2EMq84QH7byk1fm2dfjJjGGv4KOe
         KERoY1XsV1VwOOC9DTfdlNyzI1+AMdoBM4K3KNx8VraYSyAFrGH+6YTGhtJ3jJ8Q0I32
         SMP2TsmXWuITqy8zgxbHB3Q21SKhcuwpqhrD5nt+CNY2s6puqgSO3Za0Hy9t3qd5jZXO
         pxfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRJVnec+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q85si205479qkh.186.2017.09.19.11.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRJVnec+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNIK-00060M-7s
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:30:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1duNHQ-0005Jr-HR
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1duNHP-0006K0-PR
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:29:56 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:47016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1duNHP-0006IX-JO
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:29:55 -0400
Received: by mail-wm0-x22e.google.com with SMTP id i189so1261273wmf.1
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qgS57fBjQZLPDm6x1l7FYBwtgvgK0lxbqzN8BLzn+Yc=;
	b=TRJVnec+ZXpgdiBmlA+OYhvRqDVVeSS34OLPJR+bgtORqahEBeN7883TxF/psCtrip
	j/TyuBqKnbGNOj/YA8nRZAjCT7b86ZAi4iAbvQm2pR6isUMCS2A+2juN8IYEOQnXxs6f
	oVvDAxsQ5h7MhIgF8Qv+4cV2JLCqxo5lZS4+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qgS57fBjQZLPDm6x1l7FYBwtgvgK0lxbqzN8BLzn+Yc=;
	b=RXV7cSzZ49USAt20aK2A8uLV9b5SKFdedFoe5M0uvslSpadI68izo48HTIolJy1acP
	g6BD5KwaD6SO8fs57Utdd4clBGmqCslMGwaXAlIUKTYWG6lKTCQ6D5r44GvULYZ8//7Y
	d6JZkb+hfk5ZzXbVEwHYxa3Ruv42Mas4Qz8SfDIRUkcECyWWOHwmWpTDr3yaIbw8aVD1
	9gkgdVnKAM3LEREDwtc/U5CRzfpTY/s2tqLbY8Vcpt1O8nzB644tukXUH1ibYmSEU5pJ
	rE+79xluuWwarQDCtdQrIjKO6BHthVlLmgzzDw1jYYa08DUAF74PnsP0/AooKUafl18y
	ZIQw==
X-Gm-Message-State: AHPjjUicNX2SYnLb320aML91dZDt/WhJHOJMqHFt9ssrZnhpRlC9fmij
	2nZvdbOHtkqYxJAPtWpUn2pIodD02fD8bsxeXS+aLw==
X-Google-Smtp-Source: AOwi7QBi7MUukM/AHXNwKk/uWsrSjezn71imz/z4ovaULx4vAWyLG1zVC3OyKlMhHpESCsGYvOsTapTyXEmP5qouWuY=
X-Received: by 10.28.102.213 with SMTP id a204mr1720340wmc.151.1505845794474; 
	Tue, 19 Sep 2017 11:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 19 Sep 2017 11:29:33 -0700 (PDT)
In-Reply-To: <150584473563.66.13015229253961964078@69b6ddf88678>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<150584473563.66.13015229253961964078@69b6ddf88678>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 19:29:33 +0100
Message-ID: <CAFEAcA-vvabz8ac_BTPYUq=0pLrbSD4SYbYeeGZUEmF_5ME=Hg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/19] ARMv8M: support security
 extn in the NVIC
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <famz@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HQh4rzzgFqvZ

On 19 September 2017 at 19:12,  <no-reply@patchew.org> wrote:
> This series failed build test on s390x host. Please find the details belo=
w.

patchew has as usual produced an email with three miles of
uninteresting output hiding the actual problem, but:

/var/tmp/patchew-tester-tmp-jpi3jgs6/src/hw/intc/armv7m_nvic.c:1742:33:
error: =E2=80=98vmstate_nvic_security=E2=80=99 defined but not used
[-Werror=3Dunused-const-variable=3D]
 static const VMStateDescription vmstate_nvic_security =3D {
                                 ^~~~~~~~~~~~~~~~~~~~~

I've forgotten to add the vmstate subsection to the
main vmstate again...

thanks
-- PMM
