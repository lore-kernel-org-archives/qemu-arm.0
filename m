Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4319795wrs;
        Mon, 26 Aug 2019 12:45:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo0Kh3SGrKBdLl3hIWzvFmxuETipAZY8kO42V7JTNkUGaFU59HwzU0t2GQn5EFnGUNBHRt
X-Received: by 2002:a50:e40a:: with SMTP id d10mr20868016edm.194.1566848726723;
        Mon, 26 Aug 2019 12:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566848726; cv=none;
        d=google.com; s=arc-20160816;
        b=qVbl+fsA3lh1VV8imIiSicMSvN58mxJlfiZlHj3aYYNGc9CnYtrX7XpudOC+5TLoaI
         LogGgXBYhm5V3nGWO3xozh1G2csG9U5noO6DwHcQneUHx/J4H7RXEGfI5MN4gT6GdmGu
         c8cFRHFDZtJwUbkRT741UjfsLQpLdFPeipAj4v1Z+4KMslhiMPEEhibk+/7XdDV/+8Vw
         znNpSSS4SVMz5IK4JOBQFn7HbYk6/2C/QBOUSlUJi9gcDN9+5eEuL5+6ygmTqdZOZrwM
         XjUzWfPSzgcV0lOMIHrrxBRdjxrCN0srNxuMjWXc/Q6bfnsWHEmyxDGN3yh03B9ltN23
         zhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbCEgxFqL2qw5xiOvJPG7rqFsHipUteLqJzcwEoWU2o=;
        b=DUd32o1l9ZP0vs0TRzBbY3LzhkVdPFOVXvK3lhnOZnSk5FiSr4fgTwygLM4Fh7djqg
         nmX12ejnngAsRe3+SQCTfVRTwsiBephvAnpVZhYbJ3QDm3Pi6/vcR57MY+P/kd3BYjya
         ASqlunS/wdS19p3Ee6kQuZjqE11JpsKv8ct9V26z58zPDT6CPAMmBT108KRQJyAa9ozQ
         XI48Z5U/hP2mUGksqaMDF69JaZ3cPGbD33PrvpjpWCWCC2xLGa0gQZ5xFF8tK0uE6GT1
         45acraMlZeoMJ0ycr0qcBa061maCGvYeGkC4a7sHd7CUgf7Ghd2pwMJg60mDyW5PT1ab
         PRIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYLA3cTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si6510521ejk.326.2019.08.26.12.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYLA3cTJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Kvd-0005vj-Re
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KvC-0005s3-Fw
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:44:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KvB-0003Pt-D9
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:44:58 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KvB-0003Pc-7A
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:44:57 -0400
Received: by mail-oi1-x243.google.com with SMTP id g128so13102323oib.1
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbCEgxFqL2qw5xiOvJPG7rqFsHipUteLqJzcwEoWU2o=;
 b=hYLA3cTJmTucU2AN8YJvkTrfcVw0vsuawucRgXUYCGU0LCfFp+G92Q0XqrAMwIPSn6
 ovPeDrfi8a97t+ugsxc5shvZKarWf7ox/HTJYY6yzjcCE0IFAJZt3hTDeEZwWI0MG+qE
 +SYDEm2z7rvrID63UKY9eXvRrBT/aPg9Q/qiDOp3k4otVHOAbhXYtrG6iUJ90ONf/GJd
 qz9I5GzS/AVdmQRsO+Nrze64qDqdxwOxD6G4mvNk8/LMnvXLbfdkSdp3ugDPY6ueKySB
 axk4G8FWZZSrf7whRYm7YaZ+VovFRIgTJjwPppQY9oEl9aWw5pV5wctcxBOnAushWo7L
 CXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbCEgxFqL2qw5xiOvJPG7rqFsHipUteLqJzcwEoWU2o=;
 b=G3PkJ//NCJl1Xm8+R87Dkp4IPgufBiFe4rBbPuy1JAMigaKYNLoKwpHi9cJOfsWK3s
 WHPzDNCvtmw+cBB/dh6XGk/jS1+/TnNdu87f3TlY7QFONnPvWW0ltMjnMwJxLINSuFjB
 nesfre95bDOZjwKnLDdJRHc8ikrxaGpWFtuaUlRUCkvsr1QaUhmWhFI16/5tRZx6uKTc
 B4hjZtSOb2OT24t3un9DTL9O7sUTzgCw338V7WrjGPQj0ZOkndRFknooi2g2GI565nVx
 jQOtUnA3Rt9kptjENfNUb+y/TATgdl8UHE4+TdbsqhKPnCybjaPTEJyQQ5p+sEUbDjTU
 uMyQ==
X-Gm-Message-State: APjAAAVF6zzKkuS7pRLK8+6YhGhjxkS3tfPrNbkseJ/9YMtCFtquO5d4
 MZONYaokgs5HQ6JAveR2srxfzCLs+rZ1zZ1ZiD9VHA==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr12712256oib.48.1566848696260; 
 Mon, 26 Aug 2019 12:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-61-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:44:45 +0100
Message-ID: <CAFEAcA-AfHev4Vd8qT+ytqtt=ZopkcQofyS1TTp6Nq_HTkBS=w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 60/68] target/arm: Convert T16,
 push and pop
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZK74av8xqmQ

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 83 ++++++------------------------------------
>  target/arm/t16.decode  | 10 +++++
>  2 files changed, 22 insertions(+), 71 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
