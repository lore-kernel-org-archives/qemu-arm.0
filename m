Received: by 10.28.71.27 with SMTP id u27csp835518wma;
        Fri, 23 Feb 2018 09:12:45 -0800 (PST)
X-Google-Smtp-Source: AH8x224Qfhe/MJd7tZUpt/3ZLxmXyKEB64IZFwYNY9/ThZsPOYQXXP/th1RnYNs8ZjxSY+J8Lj69
X-Received: by 10.129.72.20 with SMTP id v20mr1607332ywa.53.1519405965844;
        Fri, 23 Feb 2018 09:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519405965; cv=none;
        d=google.com; s=arc-20160816;
        b=JFpi/rTkVbhYqfnTaHachc2bKWtevVy0JFfSr0zgtd3SDWfHMWiSMYacXxVk8lxY6m
         1HDUsFyjAuc55YnbgA11rlIqRMISbWABI9HKhG0r7GqlOjSEx7z/QCrT7O7dAwkXF4jt
         V2ka+OdYKLchFkiXg3benhtr7JjHhGNPWrkJTZBo6qb8olpq2q/ad82yFILpbYm2rCq0
         26AXEhAa/piXhHXh8NmmKay5rdt6dSmHeANzVDlVJxjdG2X4nBPJnvjD10aED/yqkPsh
         VDSAJdH5R/D8RWjfz3oyEBE7XPj63DHna8F9mvNw7o2mOAH+Mii4chf5D/G7Ma6sO5/i
         zQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=R8tpcxl4hh9sOhGvYB0mTZLShg5EyVkDjQEJkqS+tbY=;
        b=XShPGZVRmXbf/TMavs2sHICvenAOcJV/T3JZZD+OsiU4KiB5REZzj2NWgtDUXpnG16
         E9asJv9wZYaqXveVBOIOhdARXGSSpUB0bdakmZVobjmkBImYTyBmSOZh3SnasjKNXBzk
         4hIq6qAXOHaoYKUOct6sGd1NkPIMJQc4ERAsKpIu21+p4A4s9tUeD8v5zRCZGf6hN2t0
         kY6UrQawn6KlTk4MccxIZqKcqcM3HkLV+RlZ0SVXQN4LQPtblPG76yQWPQLT3/JyJKWu
         Z3t7p+NGJyJiC5OkpaaKCCom4qtG+BdoZiHIc/GoE2kEN+ZSpjw3kwZa2mIadq7/pfki
         KsGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDZGGojK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b9-v6si477846ybe.495.2018.02.23.09.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CDZGGojK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epGtp-0002S8-At
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:12:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGth-0002Ro-Nf
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:12:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epGth-0004Ld-03
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:12:37 -0500
Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236]:44140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epGtg-0004JW-O5
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:12:36 -0500
Received: by mail-pl0-x236.google.com with SMTP id w21so5228692plp.11
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R8tpcxl4hh9sOhGvYB0mTZLShg5EyVkDjQEJkqS+tbY=;
	b=CDZGGojKj6+E5E5kOvXe7DfKA2EV/y9U342H4F2kKNEERYg2JwSctJqEyKXTjqau6F
	i3rAbdyMj4MSE5EkC3g1fTLiYO0dG7853ez7FtMPINOCf41czbkOlPYiyh4AIpYos8e3
	hQZdrtCCvvdWr4MZH2umWtBTT7kH/9qrf33dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R8tpcxl4hh9sOhGvYB0mTZLShg5EyVkDjQEJkqS+tbY=;
	b=MwUbMNUc7bDVtIbhAe9+BZ2dBm0Rqz8Rnz+knBA57R980ECT0i/BfqPYw0jE5xk5qF
	owlCaGrtn7wEcNOytD/1eVqubOiEHs2il+ZPlTRgk7hIvzn+mKNHzF8aDDok1xD04Hxr
	zrP+DopX/s2QponT+nLkIqnxfiat85F5zcDi5QB3sjn9TPlVPRaxz/q89salRbihgrYo
	osCV/PxhGynq64vtb8aM3YCBrJQwBMBa0R36At3itySyY617/ZQ6cUWcKZHpBhsb38a5
	QVQKzFWBh0ic1flDoGQ+EzEhq+Y4l0dIPgLfYH4hRpcfu/zr+l7ZUuUgg7/4RffZsBCV
	eliw==
X-Gm-Message-State: APf1xPAig5diu+z6OwAKTwgY8DkwJNHcI38gJVewRhVGVRI82gs0RVSZ
	lQEUtfQhLGv5QhNxDbWV9UcVpZqrvccn23uyjt3xKGoT
X-Received: by 2002:a17:902:a515:: with SMTP id
	s21-v6mr2323856plq.393.1519405955840; 
	Fri, 23 Feb 2018 09:12:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 09:12:15 -0800 (PST)
In-Reply-To: <20180217182323.25885-42-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 17:12:15 +0000
Message-ID: <CAFEAcA92ENqt_qV-n9T59PBbSjyWJFxhOuaN3Me3PvGSFS3_Rg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 41/67] target/arm: Implement
 FDUP/DUP
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdOHx5c7WpOn

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 35 +++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++++++
>  2 files changed, 43 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
