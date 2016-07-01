Received: by 10.25.21.96 with SMTP id l93csp412067lfi;
        Fri, 1 Jul 2016 10:47:24 -0700 (PDT)
X-Received: by 10.129.82.135 with SMTP id g129mr10618468ywb.163.1467395244643;
        Fri, 01 Jul 2016 10:47:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si2966044qkf.208.2016.07.01.10.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 10:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ2XE-00043P-5A
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 13:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ25r-00034H-AP
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ25p-0001Vo-E2
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:19:06 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ25p-0001Vc-1G
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 13:19:05 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k68so74861666vkb.0
	for <qemu-devel@nongnu.org>; Fri, 01 Jul 2016 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jiB7Ot1IMt+b97Ohtd+oj/W+ryam4RUZACSI8u5eZh4=;
	b=EJ1fLb2P7jbrLp7S3ValmHIXi5ag/HtRTUHEyFhw1kvjcqlXthxv1mQbOyQSifBAlA
	3tlkW0slUmB85799so8hCndrXeTBubWAXJ5q3hFsz29vbkcSAIR2wGKRo7pxggz2hN5w
	79D2NcKcuujDJSAKma1LIl9VujgSBjey5PWl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jiB7Ot1IMt+b97Ohtd+oj/W+ryam4RUZACSI8u5eZh4=;
	b=Gd68TPkIMb0GGBT0Sy6mf/MpdcBl9GYcSsx2pmVnXpwm011ul1afphk0eAjExpIJS6
	3rGxdE6hOVeKnQIp5WWHiITGQvLqi+jHrdkvKzza5k6qTtxZQnkzuyo34uQ6NyKOXwXQ
	eHuOIybNCqYfIH4ug5NuDmueJUf1aNVOYkZSClvtpY9GmPBhXHpr9vVciTP/W3cLvz+7
	anS3BYftGK2L9kApbb7wK7VD6vAg7rJdqPy3Jfxtjx6BKgKLb7a9BRPEjxL1wZkY/j4f
	ebMS9F0qs/kNIWsShaAGlZmGcF/s8Ac+5aEEZ03g5rrq/HWtXfWl1Ad8DOt1IxMyiOmd
	czJw==
X-Gm-Message-State: ALyK8tJD9yoqmuzfxx24tY9Gyrfpq8CzsxNyswoXYMO4asSpTW1URiyJcZ2fdg2huI8UBsPoKYMQlUS5d+Gxv0di
X-Received: by 10.31.96.207 with SMTP id u198mr8576149vkb.50.1467393544591;
	Fri, 01 Jul 2016 10:19:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 10:18:45 -0700 (PDT)
In-Reply-To: <1467138270-32481-10-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 18:18:45 +0100
Message-ID: <CAFEAcA9Z_6bPMwCumhwQqqwyy-B_vKXyLPBfJeK8uY03Xx3G+A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
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
X-TUID: pLdJpOP5mpkW

On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>

This test fails on ppc64be:

TEST: tests/m25p80-test... (pid=3D65123)
  /arm/m25p80/read_jedec:                                              OK
  /arm/m25p80/erase_sector:                                            OK
  /arm/m25p80/erase_all:                                               **
ERROR:/home/pm215/qemu/tests/m25p80-test.c:162:test_erase_all:
assertion failed (page[i] =3D=3D 0x0):
(0xffffffff =3D=3D 0x00000000)
FAIL
GTester: last random seed: R02S54b2016fda21b092e18d7a23a2db86ba
(pid=3D65128)
  /arm/m25p80/write_page:                                              **
ERROR:/home/pm215/qemu/tests/m25p80-test.c:200:test_write_page:
assertion failed (page[i] =3D=3D my_page_addr + i * 4): (0x00000000 =3D=3D
0x01400000)
FAIL
GTester: last random seed: R02S8708910d6b72f700bc41e9340a516239
(pid=3D65133)
FAIL: tests/m25p80-test

thanks
-- PMM
