Received: by 10.182.158.201 with SMTP id ww9csp1486508obb;
        Wed, 18 Nov 2015 09:57:09 -0800 (PST)
X-Received: by 10.31.16.230 with SMTP id 99mr54368vkq.135.1447869429236;
        Wed, 18 Nov 2015 09:57:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h199si65524vkf.183.2015.11.18.09.57.09
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 09:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zz6yi-00011L-P1
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 12:57:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zz6yE-0008Pa-EB
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 12:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zz6yD-0002tm-GP
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 12:56:38 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zz6y7-0002t3-Nk; Wed, 18 Nov 2015 12:56:31 -0500
Received: by wmec201 with SMTP id c201so84569044wme.1;
	Wed, 18 Nov 2015 09:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=C+XCG1wNMit1jN6xu8Z2eVIT+kcdgo/KSpG54si/if0=;
	b=zx79/mGSyEkLu+m7MvW19fSjn+l/Y/whe5Ez0u67k+Pn0ho/guy5FWG60704FJHlBN
	clxzSiCSrHf/Y5n1155J5SzYTNJN5BH0KHbB4WEMSaGSjuqfeZOPzdxewL3/JakYO97Z
	0pvG417K6UBgNML7GKYeDms8J02JfCbtF0twXa0lEZrJJHidpSZvU8Cj9mkfoluiMCvN
	9cdbRwqm2Mv+1l/aPnPrLejBU2zMdqXUvcfAk0aaoH9znKXkovPkDwEhmQ3//tnEBb2V
	lhwIFRKqsBnC2CKDDigtUyxBm991c+ikzPZPzO9R+zxiN670p8YatVaqCvnOxQldohxM
	JXHA==
MIME-Version: 1.0
X-Received: by 10.28.131.11 with SMTP id f11mr10156081wmd.59.1447869391163;
	Wed, 18 Nov 2015 09:56:31 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 18 Nov 2015 09:56:31 -0800 (PST)
In-Reply-To: <CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
	<CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
	<CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
Date: Wed, 18 Nov 2015 09:56:31 -0800
Message-ID: <CAPokK=pn93wX9ePin_BQAtzYc43jJ0dYnNVVCRAYaifXst0cPw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Francois Baldassari <francois@pebble.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::232
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Priority masking with basepri on
	v7m
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lz6ler6OIoKO

On Tue, Nov 17, 2015 at 1:52 PM, Francois Baldassari
<francois@pebble.com> wrote:
> Thanks for the swift reply.
>
> Michael's changes look very good indeed. Thank you for pointing them out.
>

If you have tested them as working and fixing a problem for you, you
should contribute a tested-by tag to the series.

Regards,
Peter

> No need to consider this any further then.
>
> Cheers,
>
> Fran=C3=A7ois.
>
> On Tue, Nov 17, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org>
> wrote:
>>
>> On 17 November 2015 at 21:40, Fran=C3=A7ois Baldassari
>> <francois@getpebble.com> wrote:
>> > On armv7m mcus, the BASEPRI register can be set to mask interrupts
>> > above a certain priority.
>> >
>> > This changeset implements that functionality by way of the NVIC which
>> > ultimately sets the interrupt mask in the GIC.
>> >
>> > Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>
>>
>> There are a lot of problems with our NVIC priority handling
>> right now. You might like to take a look at the patch set that
>> Michael Davidsaver sent out earlier this month:
>> https://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg01542.html
>>
>> That has some problems but I think it's probably the way we're
>> going to go to fix up the NVIC.
>>
>> thanks
>> -- PMM
>
>
