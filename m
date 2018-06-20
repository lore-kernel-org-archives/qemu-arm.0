Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp908617wrq;
        Wed, 20 Jun 2018 08:37:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLD6XCerN/aJchq0A0w758AoyTM7cVjQIy/KMem+cSCOJA43HEuF3csbteINjhHckELqNkz
X-Received: by 2002:ac8:44d3:: with SMTP id b19-v6mr18574472qto.167.1529509053007;
        Wed, 20 Jun 2018 08:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529509053; cv=none;
        d=google.com; s=arc-20160816;
        b=qPcYfbjd4mACJaFKLwK4jIGC4BxfNNTm4w4ADxm9V8ra5RXtcPXBb9Yhwo8QTP3Zyi
         umcJsbCO9bHjIW4oAb2oO54wafa1WAxVZJJYGYt9Y7JxPSNlxVuo6qfXVYWAJG0WQNok
         0Go6LQjJB/I6QTxGVwA5JCV/9MqYOl/tRtkkEB3KyEq4kfoIXPkimtVa0HgkegbqbCkT
         PU+tOGILFGGyZevuB8Yc1dIE46PFk8HMQIy0AeP6ZhTtmwmFd6a1b1WLE6ZtJebJ75yk
         jLqDE7NASMOME8luPl6NgYsHGEo4xrOSUeXxWha7/G1IMgAxw1NyG10tok2x8rKnvzHK
         /Xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8VRmGrcN/OHggoDfxN/t4rbh7OFjrLaov6kjrKWntoc=;
        b=ROaEx4qJ0mO9f5c8BXIv8HWjzgSy7Z0UyB6KqtNRXolKkzWPNGTDEIcxUjyBEQnDt6
         l7hPPxksZtFN2D7Gslo9SXNXWciiKpB7E/Nn+9OAccaeDLPl/WM14fJMIMmazFtQxUIz
         vRKUfi3nb3VF1BLZxn9nKRWPXEcVpaZ9TSGcBJtWtFsW0ia8EuAGnFtBsnROEb/55n8J
         X6XDWy7pIZt7V/lZRuqfCjkF4eYknlPJjyyZG/MvejbetpwmMO4FV0fKT1YyV3SbcXpc
         IVUFkepgoo7gm2/o411vTInWNE0WtiOhW0EJIq05vULJ//5Sq3yD7NxnrImUwO5L1MeL
         Y2MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grMEY+js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37-v6si2650434qvt.22.2018.06.20.08.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 08:37:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grMEY+js;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfAq-0005Uq-E2
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 11:37:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfAd-0005U0-SW
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:37:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfAc-0002iD-Uc
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:37:19 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:45895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfAc-0002hv-NG
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 11:37:18 -0400
Received: by mail-ot0-x234.google.com with SMTP id a5-v6so4161737otf.12
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8VRmGrcN/OHggoDfxN/t4rbh7OFjrLaov6kjrKWntoc=;
	b=grMEY+jsgWmAChlULTUSQpIDxMRa04jhJfUJULRsvT9ts67ncazr7UD2jkpkIGef3b
	4fhGok8516CXbe0bL4T5YeCTHli8nSI5P8YTCy6HApvOz/+sRoK42T5ieV75BLtdnBEd
	mJ1XcFo6UvLePEOyzrVQdsZZR4XkOGDpegNbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8VRmGrcN/OHggoDfxN/t4rbh7OFjrLaov6kjrKWntoc=;
	b=Tvr43ug7+aBVjlXQdwU1bLApll4G/6i4uF0kbRSma00qcPi4GDc3BnC5WLZS481xj+
	IOhuFbq28glHL/bIj9gD9isM/kulG0/YLa1Bk1YgyVXSJIe/xD/bo4+MZ7pPdAqvj5Ru
	oM4WCYcB2zkiNTGr0lCgo5MaJLL0VXCMffHfgsBHXH0TWmtUj3qIULbVhPIkFObfG8/E
	o470xf9XpsS+jDg2S0xN8sF5VavB/M92WyfgA9TC14MW843oGF7SEzsDeTAk7kPeDJYH
	ycF7cNJkSRU2Oj0Ktsy0xZ6wrai+YukASRXSr0u+wzhtFQ5pnEwXPaSh90ue+6M9sKRj
	e2pg==
X-Gm-Message-State: APt69E2Km631mUTvERYTzUbEEWXeZhP0vDvz0T1lHGvRe+rGJD00qsfC
	arZKK6WskMDvRHEuiMMowIaVGQkd6uV7hEoDxxyYfA==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr14235415otd.210.1529509037967; 
	Wed, 20 Jun 2018 08:37:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 08:36:57
	-0700 (PDT)
In-Reply-To: <1528790908-23441-2-git-send-email-eric.auger@redhat.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 16:36:57 +0100
Message-ID: <CAFEAcA_YbwG=1OUxAutMwyYjQSV=QvcN2Us1EUUvVkCmRJn1ug@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [PATCH v2 1/4] hw/arm/smmuv3: Fix translate error
 handling
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
Cc: jia.he@hxt-semitech.com, Jia He <hejianet@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gartd7ggjogg

On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
> From: Jia He <hejianet@gmail.com>
>
> In case the STE's config is "Bypass" we currently don't set the
> IOMMUTLBEntry perm flags and the access does not succeed. Also
> if the config is 0b0xx (Aborted/Reserved), decode_ste and
> smmuv3_decode_config currently returns -EINVAL and we don't enter
> the expected code path: we record an event whereas we should not.
>
> This patch fixes those bugs and simplifies the error handling.
> decode_ste and smmuv3_decode_config now return 0 if aborted or
> bypassed config was found. Only bad config info produces negative
> error values. In smmuv3_translate we more clearly differentiate
> errors, bypass/smmu disabled, aborted and success cases. Also
> trace points are differentiated.
>
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Reported-by: jia.he@hxt-semitech.com
> Signed-off-by: jia.he@hxt-semitech.com
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
