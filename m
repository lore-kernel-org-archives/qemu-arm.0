Received: by 10.80.163.71 with SMTP id 65csp2745723edn;
        Wed, 5 Oct 2016 08:56:43 -0700 (PDT)
X-Received: by 10.55.18.153 with SMTP id 25mr10305570qks.125.1475683003549;
        Wed, 05 Oct 2016 08:56:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e128si5623371qkb.93.2016.10.05.08.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 08:56:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1broYk-0004eh-DR
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 11:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1broYf-0004bu-9W
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 11:56:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1broYd-0003yw-Cn
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 11:56:36 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:36510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1broYa-0003xu-60; Wed, 05 Oct 2016 11:56:32 -0400
Received: by mail-oi0-x244.google.com with SMTP id h186so11819666oia.3;
	Wed, 05 Oct 2016 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=erOitlrjYZvn9am2OkkkeIN0h4YfWoiLu/l2zyy1YJM=;
	b=MO1rhR2gSVRYRpTZrngFMplwiW5Mt3rx58yoVVr+m3pDs5nE1SUg+aQFexfejqH9/c
	1iC27sYAo3PVQUwYW8dIeDZv6/sivFzhhxLL/B6Oi0DjyQruHtB5m00kIWRtlvRs7Tys
	2EnvCt8eqxBZ4HHkq7A1C20cN9CeLMSSUwXCeskrF1ZCCEkpHQwPK+dEvuLIX3RawSnP
	XC9nISBXdi9uspi5OI/MJyQxkpbRbxyn9xJCBjHqCxbWRovv1brmjiGDdbpGQORakaDA
	R7qOEBjMFRQ/m+Zg6wsWifeY5eyavIcqhDir2KPXjKdAj0XguXm/Vr+eqbdW56nC3SI8
	DrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=erOitlrjYZvn9am2OkkkeIN0h4YfWoiLu/l2zyy1YJM=;
	b=bqoOY5OKglfZIu3LnkBvFVjJ2dM/+F9YXaebDIP5UaAp/HtHD8L/q0SwfLqkP0C9zn
	qpC8SHO0buREYNLKKdJDa01ldolzL0Tfb3priKKbk2I7J2YmoLeoqbN3R9d1qE5RU2Yx
	WYLmtZ8riy7DUjDjPzVRPCDtQBb/MfGm1SZXJvpTQU6dRFgfgKSNUlcHiMM0UbkCXnay
	sWkWD3da987aM/sUxXFaymkZNSZJ5p3TC7isUnLmKNQy69yiS4W54eKCcLnOkYXQTP/l
	EuSUCirPVXhkyXnHGCnfjf57t/dAcVkzRk8tMAsWgZRc9kcedAD8CUlyrUN0cPog4Fb3
	YEgg==
X-Gm-Message-State: AA6/9Rml2QNHKqCCCPikIeioqXy6KUlgYLZ4HXPf0EhsbIKk1ed05Rii7YBMTT48UKVDZIidNhGX78BK7KmqtQ==
X-Received: by 10.157.17.183 with SMTP id v52mr6007278otf.249.1475682991460;
	Wed, 05 Oct 2016 08:56:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Wed, 5 Oct 2016 08:56:01 -0700 (PDT)
In-Reply-To: <20161005144451.GL3877@thinpad.lan.raisama.net>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
	<20161005133530.5702-3-rkrcmar@redhat.com>
	<20161005144451.GL3877@thinpad.lan.raisama.net>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 5 Oct 2016 08:56:01 -0700
X-Google-Sender-Auth: LCnO9lKl8wjOvU6OPQ-xt20Tmv8
Message-ID: <CAKmqyKPwuG7JekM-U0p1ReT+nu-QtvBZ-FL46mGiBPVypS1V8A@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] coccinelle: use
 object_new_with_class() in obvious cases
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yquxDZLkGg2m

On Wed, Oct 5, 2016 at 7:44 AM, Eduardo Habkost <ehabkost@redhat.com> wrote=
:
> On Wed, Oct 05, 2016 at 03:35:30PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 wro=
te:
>> object_new_with_class(class) does a better job than
>> object_new(object_class_get_name(class)), because
>> object_class_get_name() lost the class->type and object_new() looked it
>> up again from the name.
>>
>> Manually changed vl.c to fit into 80 character line.
>>
>> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
> --
> Eduardo
>
