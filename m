Received: by 10.223.150.237 with SMTP id u100csp1413765wrb;
        Wed, 8 Nov 2017 07:27:48 -0800 (PST)
X-Google-Smtp-Source: ABhQp+T5bgmyhxa9bh0o1IefhvboOg+k08UdUPVjwxm+Sht9XpU+89VunPKtsiSAeXe0azW9R4H+
X-Received: by 10.37.201.5 with SMTP id z5mr585842ybf.297.1510154868673;
        Wed, 08 Nov 2017 07:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510154868; cv=none;
        d=google.com; s=arc-20160816;
        b=k+KqIMw8+aw8Jf5WtMRn/9JWcP4XfBRMIAf5XDvq+m/FKJTqPefwjc00pCxwRmOmdi
         KgAdkfRdXbEAbaA1wTWL8nbURHzkMJz5Z3JpGkkeKl98IS7o5pGfANtrobVziwyflzVD
         Cqn9jHMWSDv8Ghw5A2EGzdqIFJKgdmvs3pvRi1+1kv0tgNVGbxXK3hEujoVAyFpJuzgg
         vQ9HLAz/dK4tAReH/MJ9lJNniThaOfPj+aqJFmL6/31ZwH3pIDxTgc7SLja23YMvjeP2
         y4ONtSFdVq5ZOuTnxE1SzMiZFffSmOC5lk+rQ/Nk5HYe3jubMUddRKUZ213waAOk8ztm
         3aDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/cp7xaFOJeKef3lLaHy6abN0WGMoBsTQCRcz3OmnZWE=;
        b=VHi7t4TcTrkd8VO5FYaZ/iOrC8jeKnEcvFOQtI3WCrcPXfQUujORPvjSsqugMWdoPW
         uyLRAS++Mqsk64pjTaEdb2sz9A1bB1v8jzhaM1LAjs6YFeE50lkiPx8OgfvEVN4FEFLP
         U7lhZHQur0icDu0PZvB4GWJiN/avyerFI57M3Np78L4FrszWYmnWF23JVX6ZZodkMy3x
         wxN1lZFvfiOyEQZ8buyI5QWCEQRJDk49/af1K9UJgex4VngAY5D5F1P9ia9h+wo512lh
         5JZocvvsj/OuD09o1wmqYmr7tYL357+Km+fxa8sPgGrmfVBnx3S0TeGHjWPErKw/FnyO
         fv5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JNlZrE0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si1091041ywh.631.2017.11.08.07.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 07:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JNlZrE0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCSGa-0007oQ-3T
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 10:27:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCSGO-0007kC-MA
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 10:27:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCSGN-0007qm-Oz
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 10:27:36 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:56977)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eCSGE-0007oI-5i; Wed, 08 Nov 2017 10:27:26 -0500
Received: by mail-wm0-x233.google.com with SMTP id z3so11605309wme.5;
	Wed, 08 Nov 2017 07:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/cp7xaFOJeKef3lLaHy6abN0WGMoBsTQCRcz3OmnZWE=;
	b=JNlZrE0q14AvdmbtaVfqnQ2/e+bq9kvHiiMIutJRQyKmcmASRwSY9PpMOpRVRVG86S
	ydsbm10kNDe0IYOEtPCOG4Xg9g1SFtdHsQi5w/JhfxVjhN+B//cxB2aS/smJDs5ghYQK
	464UzDCmI94+x7cxe40OYwwEqIFbevXbu8XJATJWIm43n04Ye2aOCy9c9c7YfrBLJfbS
	lYQqK3gIOjKejpADkpOYjVpFcaBDMLLANcGI1rM5wpPbRFMZY4Mfrz4X192/JdrvNLZh
	QPBlDav7wLySTn0+34TZZWBHZ5peTKJWDUKCWsgZEzCAgs+HrerBjl00MxRFVFujOHpI
	pRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/cp7xaFOJeKef3lLaHy6abN0WGMoBsTQCRcz3OmnZWE=;
	b=ri8hjx01wzMlPelfynnwXBq1MP+MWFqk5B3apbZQZxdMWk/kWtEccUX0tjfQABzydU
	53Gw9dPOikaajCgIar77aLjYr04sbmlX9xthLGzNQf7+Kq93Yz7Fytdqs6e2JKX2rrmo
	gD+o4vrsruz04Oak2tFINqfBPtYOdREXRwpozZc5csmPjFHjw963FtQdof1DTe18uyoS
	xWu5IrRinXCLtSprcMqw0GOjeG6VqKC+jQd9Rpk0BkqD7gpE1xZxfEBXs/GJS/Cn3G/t
	Ly3048aU6Y0J9XaCJSA3CrtkFOQe2ClGckmrN8dgIUIQtII39GB8tnjN2bUnpeHQr5dw
	Bf5w==
X-Gm-Message-State: AJaThX7zRma1Ud4SnpH4CdHwHf4YEgeEE21zZvGs+63edI6waSl9tD9A
	lZB2F/VS0ohDLCuMaSlqYxmnf/wvJDtFEshoo2s=
X-Received: by 10.28.206.142 with SMTP id e136mr786804wmg.27.1510154845020;
	Wed, 08 Nov 2017 07:27:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Wed, 8 Nov 2017 07:26:54 -0800 (PST)
In-Reply-To: <308c6070-e9b8-f40d-2389-96497dbe238d@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
	<51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
	<87shdptdf0.fsf@dusky.pond.sub.org>
	<CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>
	<308c6070-e9b8-f40d-2389-96497dbe238d@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Nov 2017 07:26:54 -0800
Message-ID: <CAKmqyKNEA41=HaDJ5A8X=UXBvWzzviG7Mv63fa2Zr0tPcxrqkQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/46] Replace all occurances
 of __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	Qemu-block <qemu-block@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pkw9APip7doe

On Wed, Nov 8, 2017 at 7:00 AM, Eric Blake <eblake@redhat.com> wrote:
> On 11/08/2017 08:51 AM, Alistair Francis wrote:
>
>>>>> Let me rephrase the question: do we really support compilers that don't
>>>>> understand __func__?  The presence of numerous unconditional uses of
>>>>> __func__ in the tree means the answer is no.  Let's replace AUDIO_FUNC
>>>>> by plain __func__.
>>>>
>>>> Answered elsewhere in patch 3/46 (where we DO replace AUDIO_FUNC by
>>>> __func__).
>>>
>>> I see.
>>>
>>> Put 03/46 first, so we don't have to mess with AUDIO_FUNC twice?
>>
>> I would really like to avoid that, as the conflicts will be a bit of a
>> mess. The way I see it there will be a lot of churn no matter what,
>> so we don't gain much by swapping the order around.
>>
>> I have a new series ready to send today, so I'm going to send that
>> through as I would like at least some of these patches to make it in
>> 2.11. After that if you think strongly the order should be changed I
>> can change it in the next version.
>
> I think the reorder is not that hard.  Put 3/46 first (changing
> AUDIO_FUNC to __func__), and then 1/46 doesn't have to touch any of the
> files that used to use AUDIO_FUNC, because there is no intermediate
> state using __FUNCTION__.
>
> If I'm reading it correctly, the rebase conflict is limited to a slight
> rewording of the commit message for 3/46, and one line in 1/46 to the
> definition of AUDIO_FUNC (that will no longer be present).

That's true, it didn't end up being that hard. I'm launching my tests
now, so I should be able to send the series out later today.

Hopefully some of this can make it in 2.11 :)

Thanks,
Alistair

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
