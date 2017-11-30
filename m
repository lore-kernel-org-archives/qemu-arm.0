Received: by 10.223.159.82 with SMTP id f18csp584904wrg;
        Thu, 30 Nov 2017 04:40:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbXyUF0ORVV4ntblkYx/jdo+M7oAejc9GYS+2sqHKX093xLPq8vkpb9s5JbPGeN8Pdpslts
X-Received: by 10.37.214.194 with SMTP id n185mr1304495ybg.255.1512045634674;
        Thu, 30 Nov 2017 04:40:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512045634; cv=none;
        d=google.com; s=arc-20160816;
        b=BaF4N9/13tw1H4MhDthgJGkjWkrfuH99RNUcI49tTzLwGdfLortIVzElcW8KgYHsXw
         DID1ZJF0HuwJ3TeCUfNL0zLJWJSvaEEJTLKIkE3OPbRaTpupUpZ6l4OAksbOg3eKxbB6
         chGD7oWkqHPij3ijdLp5NjSs6WQkTz7ndfivhNCbZ+f+Y5rhLiyigSBAQJytReXHCmZC
         vRyxnfcDff2qO9/+DBnB3MGqx2PIDOg9EWJvmD8wgLj+fDPYdnd6viKGcH6339zihlUn
         BPaShOOL/UH91ZcyFeRs4FQbEcA+fbb5pqMtfUFuPsjPnqZIr3BQYN7KcqS3Se2Mskj5
         MNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=ciDtRVaqOCrPzBpH8ivuR4njRC1mJPWzTc5SGyr/wP8=;
        b=eK5iLTH5RQI1dOvFtiqatRxjvNLAO1ze8/jjVCtxHglwDsEqyWUQswZg7wYu5iZCRX
         gQnxxE0qTL5a8md/qbWb8CGcp+UN+l+nJB2ManOnVHUK+9q7WxZzMLsGwXGc3d7W6xI+
         hCTMCyF707eIOYfNnThxLdMmcHGZWfiGO5g/DMGcHZEY4JOs+3vz8mHsB+Mas8IdB+TO
         ml0IyTCSTi1CdF1CRzqD8nwPmZlfkLKoSIlbwvxQjah/NSQPwf11aTIaRt9+MIrbdkQj
         21D3ElrQq1qTb41mKZJvoL8lhSqLmckPWmQ8j4qhQhLVVp4Rc9FZxkboh8xRTU1SI3WM
         JXVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w127si797124ywc.558.2017.11.30.04.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 04:40:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKO8o-0008RV-3b
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 07:40:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKO8h-0008RM-Ea
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:40:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eKO8d-0002vC-VL
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:40:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eKO8d-0002ub-HH; Thu, 30 Nov 2017 07:40:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BA965D687;
	Thu, 30 Nov 2017 12:40:22 +0000 (UTC)
Received: from [10.36.117.126] (ovpn-117-126.ams2.redhat.com [10.36.117.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0E060BE1;
	Thu, 30 Nov 2017 12:40:20 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <22aa483a-ede3-482d-88a9-ca1c03c37420@redhat.com>
Date: Thu, 30 Nov 2017 13:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 30 Nov 2017 12:40:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wu7GFRzNN/Ij

On 30/11/2017 13:14, Peter Maydell wrote:
> On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
>> +static const uint8_t kernel_mcf5208[] =3D {
>> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
>> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
>> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     E=
nable TX */
>> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   P=
rint 'T' */
>> +    0x60, 0xfa                              /* bra.s  loop */
>> +};
>=20
> This approach doesn't seem to be scalable to me -- are we
> really going to have 50 or more fragments of hand-coded hex in
> this file to cover the various board models?
>=20
> I'd much rather see us have a framework for being able
> to build test blobs from source using a cross compiler
> setup (and docker or similar so anybody can rebuild
> the test blobs). That will be much easier to maintain
> and easier to extend to having tests that test other
> parts of the board or other aspects of TCG emulation.

It seems a bit overkill, as these snippets are ~16 bytes long.

However, it would be useful to have a basic patching mechanism so that
board descriptions could include a common hand-coded const array and
place an address at a given offset.  So you'd have

    struct HexFirmware {
        int     patch_offset;
        short   patch_size;
        bool    patch_bigendian;
        uint8_t data[32];
    }

and microblaze boards could have:

struct HexFirmware kernel_microblaze =3D {
    .patch_offset    =3D 0,
    .patch_size      =3D 2,
    .patch_bigendian =3D false,
    .data =3D {
        0xaa, 0xaa, 0x00, 0xb0,                 /* imm   0x???? */
        0x00, 0x10, 0x60, 0x30,                 /* addik r3,r0,0x1000 */
        0x54, 0x00, 0x80, 0x30,                 /* addik r4,r0,'T' */
        0x00, 0x00, 0x83, 0xf0,                 /* sbi   r4,r3,0 */
        0xfc, 0xff, 0x00, 0xb8,                 /* bri   -4  loop */
    }
};

...

    { "microblaze", "petalogix-s3adsp1800", "", "TT",
      kernel_microblaze, 0x8400 },
    { "microblazeel", "petalogix-ml605", "", "TT",
      kernel_microblaze, 0x83a0 },

Likewise, you could have just two copies of the code for all ARM boards
that have a pl011 (or any other UART with a simple byte-long transmit
register), one 32-bit and one 64-bit.

Thanks,

Paolo
