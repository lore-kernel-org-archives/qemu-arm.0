Received: by 10.28.4.212 with SMTP id 203csp3712171wme;
        Mon, 23 Apr 2018 03:34:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrdiVARe91B1+8db7cDUmG5Ul6v+DC/4kWsFNfTNL44eIk5vmg4WfJFMA0q5N91M0su/Qr9
X-Received: by 2002:ac8:41d5:: with SMTP id o21-v6mr17679477qtm.207.1524479645312;
        Mon, 23 Apr 2018 03:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524479645; cv=none;
        d=google.com; s=arc-20160816;
        b=yE258ksCJ5BP2vQQrfWLGdiml755jLS8IrMytq4SeL/E4Vb5skaldN2tjkX0BJ46eM
         Kxju5zuRRPqGJICAs8MSFkdS/3mF6EPrHLzVGUJNtPj/b4udTiy61T770x1gNTQJQ7GI
         BLVkTv+y1rNQSfdqtwz2JcAdP/9MO+gJ2XxJO1LTUHw0rFbFIL3PX3g09gDXVJphs01Q
         aSVsdnHgCJ2zh81mWI0AwAi133iNMBvczc1LBio/WB3OpLoxx8q4aEH17cn16F/SBcA8
         nyqCR/qmEDEI2EJqs+eOWkun8ANyX5qIWTmBwGvWR0pKpdyxI8tp6Z68sbiopVmPp7Hg
         dLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=SWmwY9kA7vRq7DTrk832S/D2+jnyf/c7C085inoIq0o=;
        b=L/c07zML9FjyN13AviM36neDVY4v/w9hPytg941FngaPxiE4z5WfoJCZdPKA9IGzb+
         jRgnIX5QSbD66wm3rynZ2UKjgk++NPlFqPqpBDfDDcyN2s3i9njefu8AV9Gs+2CGhEGF
         umLJTAcxIK67QaR8g1R9SQUOQvO7lV1b0M6wnKMa/1jTFlUwe7zJTcyHlsgGi+Q7hBqh
         8DbDlgUoFRmSJA6x8OpHeSVnpq9x80N41BnMdWIfj0KpQRVCTasC1IwK0wbR013654ZB
         x4NtpD4CFSxgzv2wKYWKLCcbCXipWKQsoTP0DEAyM5IZ2V4YMnq7szC7WZ2Wy+vhT7VO
         Xbkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrqIb52E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l39-v6si11246677qta.363.2018.04.23.03.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 03:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrqIb52E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAYlU-000862-GZ
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 06:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAYjn-0007IO-0B
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAYjh-0005rF-5q
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:30:23 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:34133)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fAYjh-0005pc-0E
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 06:30:17 -0400
Received: by mail-oi0-x234.google.com with SMTP id e23-v6so13766173oiy.1
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SWmwY9kA7vRq7DTrk832S/D2+jnyf/c7C085inoIq0o=;
	b=WrqIb52ETLWpbkee+YDy8hncyZLgQiniORKh8J8kc41h3qAw6O3nM+FmDyHCqHXJVx
	Gqog17oXQeRv/mRHWydFYDcgbFVERPlIjCxvXHbSBLivaQeY8nn+gRG9QRkDUWkc3anN
	fL4kZvreQkiAfE0/i99hmQasgcZjm2/PsZHAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SWmwY9kA7vRq7DTrk832S/D2+jnyf/c7C085inoIq0o=;
	b=lJw9TMGu99Cg2B3ikj21tt9iVhCdSyBCxyEnmt6XJkiy7hLKGa8txg4P1KNcJhQC4b
	lgc8+06dlGIbfJqpZE1WdrnyoIYBS2kKLetnZkoweNlj9pXpmSeXgBzW0/zeyPGStzFc
	otIQuSz/ZjEBM0h7By6LRR4dkx5QWaMPUTHMSKHDx9bAyowEdLROY/saF+ExFvfEmJR9
	dH3XXmjmvxWC1/qepkQqjVAk2mo2cI/QD2HRCS+2/XtspE1JSEFcep9hzrEhZQWkPpqV
	9i1HYab5FGtTNhytYrbYedxZjHCpa23qoTHhVzCkqpPliMVqnh+w4CjzX7+jUToJ1nF2
	9fTQ==
X-Gm-Message-State: ALQs6tD5HirMSb+wxTrMmwnRnm5X92W0hrgiuSSFQ60CWwMbqmURfs/l
	3WeFklXDyD/4Dc1cFGsdpqli2JSKnEkLJafvBmY0jg==
X-Received: by 2002:aca:b2c3:: with SMTP id
	b186-v6mr7266366oif.337.1524479416345; 
	Mon, 23 Apr 2018 03:30:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 23 Apr 2018 03:29:55
	-0700 (PDT)
In-Reply-To: <20180423101433.17759-1-clg@kaod.org>
References: <20180423101433.17759-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Apr 2018 11:29:55 +0100
Message-ID: <CAFEAcA_1q4+kKunX6_d9N3+6tUFGJRRc5biqn5TqDDmh09-kiw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::234
Subject: Re: [Qemu-arm] [PATCH v2] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +5rlgOyUNVEO

On 23 April 2018 at 11:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> commit 1d3e65aa7ac5 ("hw/timer: Add value matching support to
> aspeed_timer") increased the vmstate version of aspeed.timer because
> the state had changed, but it also bumped the version of the
> VMSTATE_STRUCT_ARRAY under the aspeed.timerctrl which did not need to.
>
> Change back this version to fix migration.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks, applied to target-arm.next.

>  To test on a 'palmetto-bmc' board, download the latest built OpenBMC
>  flash image :
>
>    wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/deploy/images/palmetto/flash-palmetto
>
>  start two instances of QEMU with :
>
>    qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmetto,=
format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults

Thanks also for the test image -- I'll add it to the collection I have.

PS: there seems to be something odd up with the DNS for openpower.xyz:

$ host openpower.xyz
openpower.xyz has address 146.20.65.228
;; connection timed out; no servers could be reached

(also manifests as wget pausing for several seconds before starting
the download).

thanks
-- PMM
