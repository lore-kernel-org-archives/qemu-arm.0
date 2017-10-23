Received: by 10.223.161.27 with SMTP id o27csp25291wro;
        Mon, 23 Oct 2017 09:05:19 -0700 (PDT)
X-Received: by 10.37.4.74 with SMTP id 71mr8540156ybe.364.1508774719867;
        Mon, 23 Oct 2017 09:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508774719; cv=none;
        d=google.com; s=arc-20160816;
        b=y1OHd04Jo5+h5PGLPgGp9ZpQ8HekoMxWi9r5Tq4iFNo0oWxcXnaTzFaLs6YWUQ75lo
         /cKdv/onjMwvS84acSwgtDRWqtUKfySM2yF8v0fZ7tKmI1FMbAb9uFcCU5YsMhPBOdFO
         0QLABpkvgiQtsEHeJEj+xCa+Z4odR14bTM0piEFz4SPa7xasDT5NWjuWuIcATN4tKQ6D
         SIvu6j+XcnVKYThwl4NwCiJ5BiO7gbJf0dvA+BK67BBdRF94h731lS/aMX8kn/FzcPff
         F/iSzTegSayhCRPiABZQUol5n0a0P6TVZA4O5Z3PU9AEmJtpslHUIBnw2QTyN0Xg4Uhx
         S3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=JkkFdaIJHaCeBqX4pSSsWZfLTZtwrVQYBDGvkg+hmSQ=;
        b=jhQ6PcrDVqhZ8HbXX935UuNV+fEZJpb6kiu8QltBj5uBe9TIW6GBolN2bAmCc0OM/9
         HL9RaZSDwMhI5qXluxp6sepL2Uurmqy596F+ctgIxTqx05blxeEFLlodFJf0wLL+gYp/
         bDqUKkJJPRZG9d+YWbfrusjUYBT8AmFXX5Q6JBryenmKxZvxI4B2Ah+0r8jxcCZrEgot
         pcUQ/vZGKjEL8DCEMU1sdEOCSVncX2qG7pSOeuBYK7HNqGWh10ckcKpfgwLaN5CEEEYn
         eZfKoMLkUjCjUWR4PmbRPmBoHmrfy+JT86rN3uTGuVRn/JWvtjCneLHIeKkOVQZGxjnl
         lQPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W/XQ3H+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h188si1233126ybh.386.2017.10.23.09.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 09:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W/XQ3H+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6fE7-0004hJ-9c
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 12:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6fDr-0004bU-4v
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:05:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6fDq-00047r-9k
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:05:03 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:53327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e6fDq-00045t-3q
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 12:05:02 -0400
Received: by mail-wm0-x230.google.com with SMTP id q132so10803491wmd.2
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JkkFdaIJHaCeBqX4pSSsWZfLTZtwrVQYBDGvkg+hmSQ=;
	b=W/XQ3H+Lm48vkW6tLf3pTHzptv19mXiah5ZwuZnu4pLANzN71SQWhNyqAWdqNIo7yx
	A8MfExYZ59BoKOtDmfQJ/F0Ior1ReXwPqFQrI2NeOTTr4iA9i3Ynl8dfLQPw2QC+VysT
	78d8FBMkEgigG8B2DR8NlZHS9/AU7zanacMgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JkkFdaIJHaCeBqX4pSSsWZfLTZtwrVQYBDGvkg+hmSQ=;
	b=A/Hy2hdopT7mUaHR0HVTW2lzLaXkrw1oErfXc9PUH6lFShdmChJ+UNHaHyOmMB9USY
	XmCA/8bbR7tZ54uTo8/rMKmJAqgoHcuKsMv5oa9DhC2RSIJ5Nn0LVbKD+NNQJgjPR59H
	7kGeMcnzOEI8+qaMNAqT8IwFC/QJhG1zHLxwOa4wZqY2rY19zknIrlJMepCp36HIaMdt
	N2YAci8pLnYfJOfkFC0Yqu5OuR63zMOUB3K3M5zc/EC2srnJZlm8+N/+0JnssWv1S20U
	Sc8QCXom4+SJlTKvvTw4tOL5ZNC9+OfHOKMvzLKjkM5GCiXI8AFCAVa0YeYhd/nBLQbf
	+6pA==
X-Gm-Message-State: AMCzsaVOB8QV8EvHiTgD4P0jw1i9v4BvMIx9UZgE6+87FwiiBQgq4fwL
	MaADqjF0Qg8UOkU48vtY7VdPHfVspJKy9N4b+5JFAXEd
X-Google-Smtp-Source: ABhQp+TKTeov9nRXyWb5G2t3sylo6OQl7/pVLLWdbCQX19LG79EaK2SgPJs5dG3rAL3DXFmtQbketwPhGNc/Up8FY3c=
X-Received: by 10.28.36.212 with SMTP id k203mr5181815wmk.127.1508774700848;
	Mon, 23 Oct 2017 09:05:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 23 Oct 2017 09:04:40 -0700 (PDT)
In-Reply-To: <42FB6EFE-F20A-42CF-8782-D8611FA79000@isi.edu>
References: <42FB6EFE-F20A-42CF-8782-D8611FA79000@isi.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Oct 2017 17:04:40 +0100
Message-ID: <CAFEAcA-sFmpxbEP6iKMjsUJzD84n8WAzjABTKCe0KWvYpfmcZA@mail.gmail.com>
To: Dong-In Kang <dkang@isi.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] Is Cortex-R8 support planned?
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4xX65W3MOqZG

On 23 October 2017 at 15:40, Dong-In Kang <dkang@isi.edu> wrote:
> I know there is no support for Cortex-R8 guest architecture now.
>
> Is it planned?

I don't know of anybody who's planning to do that, no.

> How much man-hour would be needed to implement Cortex-R8 support for Qemu?

I don't know -- you'd need to look at what the new features
are in Cortex-R7 that aren't in the existing Cortex-R8
emulation, and then estimate how much time those features
would each take to implement.

thanks
-- PMM
