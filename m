Received: by 10.80.163.71 with SMTP id 65csp2745171edn;
        Wed, 5 Oct 2016 08:55:34 -0700 (PDT)
X-Received: by 10.233.223.132 with SMTP id t126mr10162978qkf.107.1475682934196;
        Wed, 05 Oct 2016 08:55:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si27512097qtd.134.2016.10.05.08.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 08:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1broXd-0003jl-Gu
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 11:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1broXY-0003h1-H6
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 11:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1broXW-0003h5-Io
	for qemu-arm@nongnu.org; Wed, 05 Oct 2016 11:55:27 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1broXT-0003fu-Dq; Wed, 05 Oct 2016 11:55:23 -0400
Received: by mail-oi0-x241.google.com with SMTP id o93so4256027oik.0;
	Wed, 05 Oct 2016 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=qLspdhbrmp7jtTfQXfSf0Kwu/dk1G1S3wBG/cd2gSmg=;
	b=jPZEGNrbeQZ7R6RGV8MT7RnUfAOHrHoDf8sBbnN9p/eTceJBEPR+8l/jVhLIGtF07v
	szCOHCek9Lpbt/HLf40q26fZbXjy5UJw/dCx+JyBKO4MhM+WqtUE9PAWmPlzZNkJEN76
	+w9uvDAWolmXlX94Qa2gam5tdEbSrYf8rJOPB78h9bpkvXNmA8MLVwFY/lWS6SLtiOJ0
	oQdvnwRwqpUrqMGSnsM7b6GTOeKdcQhJeK4BEVdKTJDw997c1OBlsq/S6RE4i1/yC02t
	bfNAvE10HZGYt9lzEVHR+tTTOENkPuKklzE0G6ZTk8tJi0n9fOT2mpbyKQ3GIXBG11zz
	4JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=qLspdhbrmp7jtTfQXfSf0Kwu/dk1G1S3wBG/cd2gSmg=;
	b=MXZAWI+LKCoD42bXgCaKmLJujtJ0UW7Sgh5DAmlvPYGmn56rEaY+DBLsLX7vPn7FKo
	eBXoIjYJ8tX6NEZ8axBNbMykc9DqPvi4wvslXzTkl6U0Ocpzk9Dt3pxS1nGTuygWb4uD
	k1jlTSVOiKCqYtPgV9HFBy0LSAIjly7ff7gnwZ7aQK6XK5udTigC8oLPNK0N7TdJ2PI3
	bVlKddRRWsydCN5q+GkrY5QZxPLmrMhNryTYoGy5lJEBDBxWpdykl2XivhfmovJF+7NE
	mjBqQbGoNqPioIekkLHA+oumwuNeLOLZhWM2gJcK3bTjY78AQIuyuiLT/3/RBkOigymM
	jVtQ==
X-Gm-Message-State: AA6/9RnaZpiHVsC8JFekOS7jxqzGQDwvLL7u4nToHhm0Rq2uhKNFnqW3WzqRgCLKU0WYEF1bHRIj6ZVhUxxQ5Q==
X-Received: by 10.157.31.48 with SMTP id x45mr5443042otd.29.1475682922544;
	Wed, 05 Oct 2016 08:55:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Wed, 5 Oct 2016 08:54:52 -0700 (PDT)
In-Reply-To: <20161005144426.GK3877@thinpad.lan.raisama.net>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
	<20161005133530.5702-2-rkrcmar@redhat.com>
	<20161005144426.GK3877@thinpad.lan.raisama.net>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 5 Oct 2016 08:54:52 -0700
X-Google-Sender-Auth: r48Cppc4aQ2yxnu3sBVnUU_gv1g
Message-ID: <CAKmqyKOzaft9EXBXgHx9qQAqEo19_nOkdYBSy-ic2+dMe5a=FQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] qom: add
 object_new_with_class()
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
X-TUID: gXStZxdnUwyu

On Wed, Oct 5, 2016 at 7:44 AM, Eduardo Habkost <ehabkost@redhat.com> wrote=
:
> On Wed, Oct 05, 2016 at 03:35:29PM +0200, Radim Kr=C4=8Dm=C3=A1=C5=99 wro=
te:
>> object_new_with_object_class() was a close contender for the name, but
>> it is longer, the type system will catch possible errors, and the only
>> reasonable replacement would be a polymorphic function that would not
>> break existing users.
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
