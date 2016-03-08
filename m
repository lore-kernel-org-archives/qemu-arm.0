Received: by 10.25.208.211 with SMTP id h202csp1894552lfg;
        Tue, 8 Mar 2016 04:13:41 -0800 (PST)
X-Received: by 10.140.98.98 with SMTP id n89mr36308571qge.9.1457439221011;
        Tue, 08 Mar 2016 04:13:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v39si2667597qge.105.2016.03.08.04.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adGWC-0003wH-Ga
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:13:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGVq-0003cd-Qs
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:13:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGVk-0005ZY-Lm
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:13:18 -0500
Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233]:34569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGVk-0005Z7-Hu
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:13:12 -0500
Received: by mail-io0-x233.google.com with SMTP id m184so23463834iof.1
	for <qemu-devel@nongnu.org>; Tue, 08 Mar 2016 04:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=sYRY419fIo8hf2k79YU//SzDYS0/v1IV8FNuaOHbF20=;
	b=JDMOJHSfVlFrSP/B/qtMdkg/D/PhAy0S3gilYGQL+Ey5CpQLdGy4p797EYMQ9Lg4K/
	EwOyIDKOJqaNazWm0JTbP6a3vq+JYCo4KdUl2Yw2WJK6xCDE0+FVN5gLJu80zLQGHnWP
	dmicJfl99EJW+hCCbKjqG+bz62NevLtAVlimc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=sYRY419fIo8hf2k79YU//SzDYS0/v1IV8FNuaOHbF20=;
	b=mXAbmJv/4AXagxtWpTbat310tYD82G33bTlaITO/4esZQvHsrAbGxChpLPUPnnelET
	mZ+ssuY4mCnkgYOdS74Rh7K3COHS7axIBSZs0OqF8uHngxs6s2tgmXsnpu7jjeuL0+Ec
	0T3u+42YYzoGgbz9Eov0EN6HO9p83V/SJEjcM3RT33BceJ3TFuB9st8gkl/K8HrDw9NC
	GDs6PmVq9EOmWC8Bpru1pkzenZopy6ohzyiKd55TeDziu+r75iXnpXBL2/4S4iOkV267
	m8ZiU6IFVRj3h5sOjWdv20zrhRxUN5ScEEB16Z6cR6y6J4ezMz51ggOdDVT1eZ5KRusz
	aFfQ==
X-Gm-Message-State: AD7BkJJ+VBjfEvdqg+AkfaoKhapLb6syU8DGnTz1/wCJKOjX6JQQj9XR7+vGNdF2RoKEwaUS7g8+t1PZbbKerH51
MIME-Version: 1.0
X-Received: by 10.107.18.214 with SMTP id 83mr17176455ios.130.1457439192088;
	Tue, 08 Mar 2016 04:13:12 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Tue, 8 Mar 2016 04:13:12 -0800 (PST)
In-Reply-To: <CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
Date: Tue, 8 Mar 2016 19:13:12 +0700
Message-ID: <CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::233
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/4] virt: provide secure-only RAM and
	first flash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 95gk1/ssEEG9

On 8 March 2016 at 19:10, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 8 March 2016 at 19:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 08/03/2016 00:34, Peter Maydell wrote:
>>>> > I think that, if UEFI secure boot is in use, the UEFI environment
>>>> > variables should also be only accessible from TrustZone, because they
>>>> > store the key database.  At least that's how it works on x86, where both
>>>> > pflash devices have the secure=on flag.
>>> If I understand the setup that is being used correctly, UEFI runs
>>> in Non-secure, so making the second flash device secure would mean
>>> it could not access it.
>>>
>>> Ard, do I have that right?
>>
>> The part of UEFI that accesses variables can (optionally) be moved in
>> secure mode.  If you don't do that, secure boot is not secure at all.
>> Accesses from non-secure mode do the appropriate marshaling/unmarshaling
>> to call into the secure driver.
>>
>> Again---that's what it does on x86, but restricting variable access to
>> the trusted base is an important part of UEFI secure boot.
>>
>
> There is currently no implementation for secure boot that moves the
> authentication layers into the secure world, not even on actual
> hardware (modulo the closed source solutions that we don't have access
> to). So our secure boot implementation is interesting as a reference,
> since it has all the moving parts in place, but should not be relied
> upon as an actual secure environment.
>
> As far as this QEMU port is concerned, having some flash in secure and
> some in non-secure is going to be useful regardless, and 64 MB is
> plenty for both the code and the data. So if users of the Trustzone
> port (which is disjoint from the KVM port in any case) can tolerate
> having the code and the variables in the same pflash file, I could
> simply move the code into the second flash, and we could reserve the
> first flash for secure (so it sits at physical address 0x0
>

Uhm, actually, the code is not even in the flash to begin with. So
having the second bank be non-secure only makes perfect sense imo
