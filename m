Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1111657wro;
        Thu, 14 Mar 2019 10:34:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9Ktttk9ywmSfRXoC3nYEXalyTqSEO58/NfBnbV0WYKwG7BUIiAHuBxAV5upFUeycdnlJA
X-Received: by 2002:a0d:d246:: with SMTP id u67mr11846060ywd.162.1552584858636;
        Thu, 14 Mar 2019 10:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552584858; cv=none;
        d=google.com; s=arc-20160816;
        b=KkFrpMGPaU6PcLFhaLuyO2TktBeEpOSem3oGPZEgJFX/x0jQSmcBL1tUFcy9xF28M7
         BVl4IzZwng99qd5Y3fmkqAb3PDAGDnLsSTUFP2sz2QdqQhcNusa2H5JjkOSWnSPthlyM
         qfwyIL3NXJVikhB/pC1eiKZ1v9KZpfa5PQXRY4l0uthKhdlZZB2P3nduxbKcYmSj3K8t
         l+whE0oPAwwGC3ZPK6XLg0S1qpcDHRSHJ//P+VodrmPMqNk7J1yjd4S+iwDuwBSlaSRm
         I7ike0x09JrLOIodFdSA2ovQYCAzhtHglArsoztVWoLitEitTmKRhOnGSJc/CCQecVGO
         RbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Pveam9JslzDMJ5wqe4964kLJADlY7Bv7d1CH+XaORqE=;
        b=rAj/giGZpTxeDdOD9kLCt7c1iBQHnzBGCinJcb2Q4T8PRF4RMB1xfH+kxhAs9ZiKjK
         nQkLz++zlbTvbp8nDk+j9ZO5CoOZjXA9t5yMa2bmy5oGmugZfzGifriEoPWwKa6kPriQ
         vLQo6a3nQmGQjQdPqdHSRrpQpkD2dTYFjC3KNgUqtc+DK2OiR12TUhHAcpOlUCsCT6kl
         +feRvz2vtVyRnV9KASvIPoOr9lESeAzlAclD1ahHX3CvpKmeBMrUcep4cpLBQvCDow8O
         MuoHOtxIVAf6hGdvjFE5ac2eFoWjIkEmzzf/CNLPdQ5bPTWVer733KTFy/baG6EzAIQT
         uEvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GzX7nbnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s125si772139ybb.236.2019.03.14.10.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GzX7nbnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4UFG-0006Em-5B
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:34:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4UDb-0005c0-Q4
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4UDZ-0003UU-Hh
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:32:35 -0400
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:52207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4UDY-0003Rg-4s
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:32:32 -0400
Received: by mail-it1-x143.google.com with SMTP id e24so6017457itl.1
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 10:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Pveam9JslzDMJ5wqe4964kLJADlY7Bv7d1CH+XaORqE=;
	b=GzX7nbnPwsPuA/M4fMGOIQwd1molQDR8A+JKy3EFALo04kHyYFrv2e59Vfa+0pcr3g
	f5jYeGhihEY1zom5SL9cgRrAHxZuJGkwvAjkrTIK65dRTk+vhvyDZqCfYF5HkRCcf7Pr
	Kz56IkLlWScCZoPejSQnr8NzIqBRX2hD8axkCNdnkqPuEgpp11WDmWjadVzpNgQCOfRm
	oz5/lkOjW52w3DuMy9WRhPsETtYAJhGUV2+vx8j3Q6aw8Uz5NbLd4iLBuiY7ZzselTFe
	KxZ8NVZmxOWMAE8V03/4oXR5oGfbQVRtzsnY2uFlsy+HvltLwaUhCUlOTXy2X9vrFM2L
	hc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Pveam9JslzDMJ5wqe4964kLJADlY7Bv7d1CH+XaORqE=;
	b=oENCARWli+RJZAc+Zi0MtfLivnuOSoYsHQaQhJ0p04GeBEh0/OvEvabyEDlscilJ8a
	NbpnXAZHUC8r9dRDI90HIMPogjKh2lWvJYF6i5ea8UkVVXxhSe/BSvlhUyWhOkTKePtt
	BiRvTlO19nVfgef6s5kg+KN0Iyk1fhZcPCahLXhe6l5PteCJYoJGpKPyov6skZH1U61+
	3O1pkNHoovoxy47ADO65JDeIYvzjXSz04ZhmSfiHaG70cwhETj8VIQmLVKKcRJGtw7H8
	qctNs6AsioE+bC6rLbKgw4Pe/3iiAtQ3HjJvbtYCr9o5YID0H5nUEH4XXFwirtI+vD5Y
	H4VQ==
X-Gm-Message-State: APjAAAUAaBqGMmktbBVJ0hi2AyTmCwZRnH1QNCtc/7eXunLeeUVhmFAg
	mOPwWQwvjFVnlxtvTkkcEU+eDoDdMG4ywmnBl77xeQ==
X-Received: by 2002:a24:7d8a:: with SMTP id b132mr3049567itc.66.1552584748687; 
	Thu, 14 Mar 2019 10:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190314163259.3058-1-richard.henderson@linaro.org>
	<82FD2C51B435F943BACD9C947966BF2F0A0E3BBF@EXDAG0-A1.intra.cea.fr>
In-Reply-To: <82FD2C51B435F943BACD9C947966BF2F0A0E3BBF@EXDAG0-A1.intra.cea.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 17:32:17 +0000
Message-ID: <CAFEAcA8r7sH-Gseo7bwnf332L6602CZOru88YNWxiCJRuK65+A@mail.gmail.com>
To: Amir CHARIF <amir.charif@cea.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-devel] [PATCH for-4.0] target/arm: Add sve_access_check
 to ADDVL, ADDPL, RDVL
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6hi3+7fesNXa

On Thu, 14 Mar 2019 at 17:22, Amir CHARIF <amir.charif@cea.fr> wrote:
>
> I don't really know how it usually works here but may I ask why you are t=
urning my patch into your own and putting me as a reporter ? Are you allowe=
d to do that ??
> I did not just report a bug, I actually provided the fix and submitted a =
patch, you can see here that it's timestamped prior to yours (https://patch=
ew.org/QEMU/ ), I was waiting for your reply to send it to the mailing list=
, so is it fair that yours is the one getting reviewed ?

Your emails crossed in the post, so to speak -- yours is
timestamped 16:00 but looking at the Received headers
# Received: from amir-VirtualBox.intra.cea.fr
# (is233176-dock.intra.cea.fr [10.8.35.126]) by
# muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
# with ESMTP id x2EGY9WN003367; Thu, 14 Mar 2019 17:34:09 +0100

an email system sat on it for half an hour; and then it took
10 or 15 minutes to get through the QEMU mailing list
infrastructure, so by the time Richard could have seen your
email he would have already sent his version.

This does happen from time to time, because email isn't
instantaneous. Richard's happened to get review first because
he cc'd some people who might want to review it, which tends
to bring it to their attention more.

I'm happy to apply your version.

thanks
-- PMM
