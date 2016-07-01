Received: by 10.25.21.96 with SMTP id l93csp404855lfi;
        Fri, 1 Jul 2016 10:28:14 -0700 (PDT)
X-Received: by 10.200.50.237 with SMTP id a42mr34768956qtb.80.1467394094258;
        Fri, 01 Jul 2016 10:28:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si2911262qke.301.2016.07.01.10.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 10:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ2Ef-00066s-Mm
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 13:28:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ298-0007zK-45
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:22:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ296-00028f-8m
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:22:29 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ296-00028b-41
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:22:28 -0400
Received: by mail-vk0-x232.google.com with SMTP id k68so74975576vkb.0
	for <qemu-devel@nongnu.org>; Fri, 01 Jul 2016 10:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TluuM4IZ2UHYbg7hp+vNJxOR8MAgyWRVPpkMhzZKI3E=;
	b=OYgV10bafKOinxxUM97EdeVxziII2f/uPRa6/gi/mWETjgy3dPndM7KafXbil4YkTk
	jd9MomGQQL5U2GPHjIqRSUHm08VVRcStvd70U2SbJTRqoxJ5khoCHL41GDOXIQqJdIhT
	ghIUVAmjKzIN3uT/Cwv8KAs9k0yf+Wlw/WXl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TluuM4IZ2UHYbg7hp+vNJxOR8MAgyWRVPpkMhzZKI3E=;
	b=ZnKhBUOpEAk5ecddiD2/DRanCuLb7bw+CVqngmF4reCAjqA+hgkbIx1PrNoi8prQaN
	J6IB4T3rh5RkMFkPrnjxeGnfk5rCJHgUYvIirKI856FwtMrZqcdOkNfEUpXgxsE/dfOe
	QfwQdLHLzyCRpqts9My7fJBRpw9L9QFPNuMeH3Eufzu5BXiPONqHP6zkPY7SYDr+4Cmh
	eeDebFeJu9N626wquOw0EDISIwxVxwKh7q3cOovvgGZdmfJ/9uPKBr7XZYQA5vZzH7lI
	+jygZEE2Ayhyjtq0eCheRxSLFEexy1/G6o9B+KdaPPWdhyh4OlhpP3LxC0gOq5HaHMAI
	1U+A==
X-Gm-Message-State: ALyK8tLVKN1HG8zCshLQM0Ez3y91KDeu8akWTvnNQWq4Iw1JpWuTc/F9DX54iAgt6lyawyRcY/iwAglOD2I3w/UC
X-Received: by 10.31.208.196 with SMTP id h187mr10176612vkg.120.1467393747698; 
	Fri, 01 Jul 2016 10:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 10:22:08 -0700 (PDT)
In-Reply-To: <CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 18:22:08 +0100
Message-ID: <CAFEAcA_OV6MoYoW4TwdTxs3iJAWnKo-1uznPOp5zm9dLxZ20bQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WBu8wemHb31

On 1 July 2016 at 18:18, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> This test uses the palmetto platform and the AST2400 SPI controller to
>> test the m25p80 flash module device model. The flash model is defined
>> by the platform (n25q256a) and it would be nice to find way to control
>> it, using a property probably.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>
>
> This test fails on ppc64be:
>
> TEST: tests/m25p80-test... (pid=3D65123)
>   /arm/m25p80/read_jedec:                                              OK
>   /arm/m25p80/erase_sector:                                            OK
>   /arm/m25p80/erase_all:                                               **
> ERROR:/home/pm215/qemu/tests/m25p80-test.c:162:test_erase_all:
> assertion failed (page[i] =3D=3D 0x0):
> (0xffffffff =3D=3D 0x00000000)
> FAIL
> GTester: last random seed: R02S54b2016fda21b092e18d7a23a2db86ba
> (pid=3D65128)
>   /arm/m25p80/write_page:                                              **
> ERROR:/home/pm215/qemu/tests/m25p80-test.c:200:test_write_page:
> assertion failed (page[i] =3D=3D my_page_addr + i * 4): (0x00000000 =3D=
=3D
> 0x01400000)
> FAIL
> GTester: last random seed: R02S8708910d6b72f700bc41e9340a516239
> (pid=3D65133)
> FAIL: tests/m25p80-test

I'm going to take the easy approach of just dropping this patch;
please fix and resend it.

thanks
-- PMM
