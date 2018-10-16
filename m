Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5652772wrt;
        Tue, 16 Oct 2018 03:05:40 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60LBCtyWa1t0MP6zd5Nve86m8kDXWxsG2052foKzGjUQrLfqDlNPubReF5y80n+Yc36bX8P
X-Received: by 2002:a0c:b0a8:: with SMTP id o37mr12220859qvc.49.1539684340062;
        Tue, 16 Oct 2018 03:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539684340; cv=none;
        d=google.com; s=arc-20160816;
        b=dDn0ByE71+GVC78/xOFRRMXpzXBRUyEGGs5E2EN7z2bqxUdVFzP2iOV22cdum5fmqb
         9Q/RfsClMlfAZNfgXgb6eBa+R9HxEiwkL3EXa0X5pnOL6d/z+alaMRlYHgXmefr88O04
         dstn+F6mewhzdnIEKYyNRlCUQ50mjl6NRde390nUOy0IKNSq9F4akPDhVVdpU0nhLtMu
         LDWCJGFieXbxlviCv7+toVk3gIynoNu4c7KSJIl9P6NWlbe0AgmN6QjzQlNbXogVcggy
         zj5RgpVLkh+Li0dN+mQtiEysjTymx72s8+tN6bgF/bhxiK1EzZe0Aapxp1PNcHl8US4C
         tc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=k7nhOJAGfFJ38fnWOjbzNhDcU9NH61O6smzdg85YgLI=;
        b=yRqNp1Ox9vnZVjA7ISwzq0Ao7LYRhF5c6Uy9MkQ/Gkb7xwrLlzPbdUkfVc4L0EwDRT
         Xxj7up3lysKR8feykZiwhnRbakqDdT+cM4nz1AAkKYVwNYmwj/HKeObOfnxTIWqa/26p
         mdMdchBB27WbI2349tJGZRIttFl12X53V8sBbnib/39cAEResD8YOLSetdsmItgYsvrH
         9rc+DUopv8kvR9F3ZgqLLhscACa+eDVm8cDBJGQiWMeSDfVob6dTbangND77SmrpkhtM
         LDPyNB0lXuyeNajNQsrNaGwOhNKaTyzX3L9Pm3wwf8KVG1ybUdZTMp8N41UaXmpW5j4d
         rgCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/O2NpNJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p57-v6si6215842qte.210.2018.10.16.03.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 03:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c/O2NpNJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCMEN-00015T-Fo
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 06:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMEE-000156-7m
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:05:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMDz-000450-EV
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:05:21 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCMDy-0003WN-Pi
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:05:14 -0400
Received: by mail-ot1-x343.google.com with SMTP id l1so21906168otj.5
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=k7nhOJAGfFJ38fnWOjbzNhDcU9NH61O6smzdg85YgLI=;
	b=c/O2NpNJf29xtM/Gm4R/GjYFVBouBWIs1inRJSLft8i2rXiLQZ1KMxzF5mZLZV+SuT
	LTa/Yk4NaURYBIPsymSkhUIq4xX+JBhJvYshrUSpHa6mK7rnABnH8qhcwAO50i5g5Rkt
	wcIecvDp2T7aQFEKw664lJCkmd0oWBgywPsNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=k7nhOJAGfFJ38fnWOjbzNhDcU9NH61O6smzdg85YgLI=;
	b=e/lNCxhuKHI3Ll1qw/YK66lpBH3gHabbVm9+XkTdSjw+2Zl5xFEDgp6JelMKNNnykl
	iW1up/q/XGaAiBJP2u6CASAhYmuKEMVUO+dbUyUV4bnodbEpRVTzLaZ9eABiPK+EwZNV
	4fttr6o4R2FEK5+mNbNlgkcxZxoEaie+cX+b5m3caspQvcKFV9cif7J/WrDxkcyMq/eM
	gY5UqcwsAP99Zkkhu8E3vdClFANUZIBDANOQB6O+iWDQjZWhJl9RnM/ZgoRZ2QALg1Li
	UkDPoc1rd2ByA+kcMfbpYAnTqF7UAe6p8YFsp9wnxX2ulfObsM8aM16y7Qwl1I5pZMh5
	WiZA==
X-Gm-Message-State: ABuFfogBJHhK5dL6kxGzkplWK0N24Z459CfPufr6np3gqYJbgriFasrc
	Pip+6Mi8FheybLR5SvsV8wh5V6eIA5VnE/ioNeK6Fg==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr13686642otd.238.1539684303702;
	Tue, 16 Oct 2018 03:05:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 03:04:43
	-0700 (PDT)
In-Reply-To: <20181016110200.0b20a7f3@donnerap.cambridge.arm.com>
References: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
	<73dcea68-2342-63b7-9691-a151f00a42e8@redhat.com>
	<65e2edeee9d94a288938da9cec4b16bb@dornerworks.com>
	<20181016110200.0b20a7f3@donnerap.cambridge.arm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 11:04:43 +0100
Message-ID: <CAFEAcA-5Q+L65b25i-qwyy-5fCQEzfaUB+N2D+pts8zVtyi2Cg@mail.gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: Increase
 compliance with kernel arm64 boot protocol.
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
	Julien Grall <julien.grall@arm.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mqco9+Fai2OI

On 16 October 2018 at 11:02, Andre Przywara <andre.przywara@arm.com> wrote:
> On Tue, 16 Oct 2018 01:19:35 +0000
> Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com> wrote:
>
> Hi,
>
> Stewart, thanks a lot for picking this up!
>
>> On Monday, October 15, 2018 6:05 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> > Hi Stewart,
>> >
>> > On 15/10/2018 23:26, Stewart Hildebrand wrote:
>> > > +            /* For the virt board, we write our startup
>> > > "bootloader" at the very
>> > > +             * bottom of RAM, so that bit can't be used for the
>> > > image. To avoid
>> > > +             * overlap in case the image requests to be loaded
>> > > at an offset
>> > > +             * smaller than our bootloader, we increment the
>> > > load offset to the
>> > > +             * next 2MB.
>> > > +             */
>> > > +            if (kernel_load_offset < FIXUP_MAX) {
>> >
>> > I don't understand how this is related to FIXUP_MAX...
>>
>> You're right, my apologies, it's not directly related.
>> write_bootloader() calculates the size of the bootloader like so:
>>     len =3D 0;
>>     while (insns[len].fixup !=3D FIXUP_TERMINATOR) {
>>         len++;
>>     }
>>
>> The size of the bootloader then would be len * sizeof(uint32_t)
>>
>> It would be nice not to have to repeat that logic in
>> load_aarch64_image(). I'll send out a v2 after I take some time to
>> wrap my head around it...
>
> I wonder if this could be done much easier, since TEXT_OFFSET must
> actually be page aligned. So all we would need is an *upper bound* for
> the bootloader size, as long as that is below 4K we wouldn't even loose
> anything.

Yes, I think it would be fine to just set a max bootloader size of
4K and check against that. (If so, assert() in write_bootloader
that we did stay below the max.)

thanks
-- PMM
