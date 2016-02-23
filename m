Received: by 10.25.208.211 with SMTP id h202csp1612614lfg;
        Tue, 23 Feb 2016 01:05:04 -0800 (PST)
X-Received: by 10.55.80.68 with SMTP id e65mr40368838qkb.46.1456218304832;
        Tue, 23 Feb 2016 01:05:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u144si33074979qka.104.2016.02.23.01.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY8u0-0005LX-9n
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:05:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aY8tx-0005Hx-6t
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:05:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aY8tr-0004Kk-7F
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:05:01 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aY8tq-0004Jm-Pl
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:04:55 -0500
Received: by mail-vk0-x236.google.com with SMTP id e6so155034890vkh.2
	for <qemu-arm@nongnu.org>; Tue, 23 Feb 2016 01:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=+L+axBvGfvo89tzI+MqI36msSbvHPB/7Wp4TxC1TA6c=;
	b=TjbTRzWeMkMY9Cgf7c6HjMOCbM6ApKfqKEfrxuxtQ5uPsm8upKlqO44wvrCSAtN5Pv
	xuiOPE4Ist94t6PtaJ7Ap3ZDwGtQfwdY2k1BO4xSh43NAh0wuATqHvqVRiYdPj0/DlgR
	al/isLoMP6w/bzZ/h6C2DKJc3rVmPYY+d2Whc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=+L+axBvGfvo89tzI+MqI36msSbvHPB/7Wp4TxC1TA6c=;
	b=DRmySLJ+naDsVjFFltw+Pdnf/HphRIQ4p34y+mSb4WT+/ytCO73ls5Xq/OK2JqU62G
	Y5NswVeltG+LduAGLtsSP+3bieyH7fE2SoY7pWkpZFmozx5Ck+s4Z+OuChdzdTjbUPET
	kHNmDjlgGMWklJ/nPYCu0U4ihcjevZragOxnj3jfrpUL7z7xzd5xFzyh4FLSACqaeQXN
	ideYDQY57ORDSggThccwCCkW78hVAXzc9Vi5ZQ3b0OLPCI9Py6LkZNq3nmxDDkPI6OQH
	S6SQnmHGi/WKyuajvH0qsmHwg+0+Y+C/3xShnBRqTl+abj62A/pejzitzeVrcn3xOF00
	KaTg==
X-Gm-Message-State: AG10YOQbz3zlMPpFaJ3Im1nI3qUWRudIhTLezrUFe81PsDSYuI9K4ma7vgKlsy577MlpfLSWQTpA5BD5R46P+wJq
X-Received: by 10.31.141.2 with SMTP id p2mr27708450vkd.37.1456218294193; Tue,
	23 Feb 2016 01:04:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 23 Feb 2016 01:04:34 -0800 (PST)
In-Reply-To: <56CBEA1C.4060900@163.com>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
	<CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
	<56CBEA1C.4060900@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2016 09:04:34 +0000
Message-ID: <CAFEAcA86KRN5eS4p6frpP5XnxUE69nXB3aQ6=W3zKE+j1RV8nA@mail.gmail.com>
To: hitmoon <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus (pass
	2)
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
X-TUID: ximcs8CF+ydQ

On 23 February 2016 at 05:11, hitmoon <zxq_yx_007@163.com> wrote:
>
> =E5=9C=A8 2016=E5=B9=B402=E6=9C=8822=E6=97=A5 19:03, Peter Maydell =E5=86=
=99=E9=81=93:
>> You'd basically need to have extra VMState structures for the
>> devices themselves which just said "inside this M48txxISAState
>> is an M48t59State", and "inside this M48txxSysBusState is a
>> M48t59State" and referred to the existing vmstate for the
>> M48t59State.

> I add a new  structure for m48t59_isa as follows:
>
> static const VMStateDescription vmstate_m48t59_isa =3D {
>     .name =3D "m48t59-isa",
>     .version_id =3D 1,
>     .minimum_version_id =3D 1,
>     .fields =3D (VMStateField[]) {
>         VMSTATE_UINT8(state.lock, M48txxISAState),
>         VMSTATE_UINT16(state.addr, M48txxISAState),
>         VMSTATE_VBUFFER_UINT32(state.buffer, M48txxISAState, 0, NULL, 0,
> state.size),
>         VMSTATE_END_OF_LIST()
>     }
> };
>
> is this correct?

No. I said you needed to have a vmstate struct that said
"inside this M48txxISAState is a M48t59State", and your
suggested struct is not doing that.

thanks
-- PMM
