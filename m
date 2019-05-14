Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3816843wrg;
        Tue, 14 May 2019 03:10:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/vbUy+dkZSgTPBicyrpa2cowjobJKCJfj0nbvJ9vZTFQbz+rofM1FzjStK0zWHxYaTs17
X-Received: by 2002:a17:906:8613:: with SMTP id o19mr2617428ejx.126.1557828640516;
        Tue, 14 May 2019 03:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828640; cv=none;
        d=google.com; s=arc-20160816;
        b=w7QkbBm7lnG6tjU0RkwmkEILelmvcpYcxGGNte95QM8FtYIZ8fvCRKsM8txNQr2hwJ
         iTZ/TGflusvz+1UnxrDbRAN2YNXO73hl7uXPyaYmCfU81Cgg6d0Gx8b+MPrSQiN94fJp
         N489mqWLNSNEi2DILy0k9Ujua+sr0xZiPN5tRttJof6yCtVRDp9auyFLMwOkpzB34G5V
         mbEDa6gz7BekUeG3W23BPfLl7fY30d/sGSYB1joao+0J6C7cKaSU2JGPtollKeFa/+WY
         trLOh82KDaWYIDWVzxxDZAXfXupGz6uiLUMBmc2sQe1DroJ8S4BNCuMjXicccNPybkyH
         dxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieeBAjC7rpZuKx1Vo4jU6/Nl1XP+QTqXW/y6IG+o4pc=;
        b=07HFaMzPvZ/608qxd0T6LQNkb9vwtwQlv38wr9TxD8DLkHE+Xa3+XHSCFVM1Kc7zJO
         8W63VsuM4G+SvU40FFUiT0JF/83AI15Nsx1eG8dxMlZZRMy1yf5SwcIGp0z2sCOwMGx0
         uiafpj2WsZmlbhRkfJdHwZHX5/iKPlwJs50YEHd7HCbwnm+Bjjv0G2MRf3Ds/wuw21Ud
         fLRyRoJ/vSyPYSt5enbATa66HvV7+1Wcorwhrja6cpPv2XhIdhQM5JfVh1zk1kMVCmDc
         vTzCrvmFxmqSt4ZYHrCO+8reRGN5O57L/FXx49R64I4cwxapuwbj2gWUw7YBAku7VWeb
         N5bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0xJnxhq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si2241648ejd.89.2019.05.14.03.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0xJnxhq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUON-0004fM-IF
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:10:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUMm-00041r-1U
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQUMk-0003tV-3D
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:08:59 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hQUMi-0003iK-Bi
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:08:56 -0400
Received: by mail-oi1-x244.google.com with SMTP id t187so8344773oie.10
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ieeBAjC7rpZuKx1Vo4jU6/Nl1XP+QTqXW/y6IG+o4pc=;
	b=B0xJnxhq1R5cxGp1jHWjFsh1nZBukb3pqwtpRvb+wRBqp4tuPL20yENIH5UIdGgSKe
	TjLmt74fl8aLmfHvZKJL53FiE18akQ0c8YOUwfnLGtVvtGoLb/Tj3RIOVBq0EsgGEEHO
	cH41m3Oy/SVZRjCJaNYh8RUinmTOawdxY7c+aOts1eH4kdTJEhc4Il0QlYP2/g+RkZEc
	bXNITqGgI+EZwtf9oku1ZvpfWyQl8QN4Z9OBRLQCmSMSUP7C5qM0POaqPL5dzhFde/ns
	Ut/Tox2xFhVDi3L05luAQNCFkbO1ci7RL9mdwkRUNdIuCcnCXRR4kySYMWuEoXJI1tgQ
	ZL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ieeBAjC7rpZuKx1Vo4jU6/Nl1XP+QTqXW/y6IG+o4pc=;
	b=WZZu3LeSMYzBud58DVJpn8acstbx0OVzybVz4/18YIJVYdhVF4TesvycJjoYZ4ci6b
	KmwljlxfKMoN+t0xx1XUFY6SCy/mEBSFyf6GKlgq1rlpqC8SRBYgqH/cJFlQFToCkKl1
	D/8fCz7O7RE0trLCs+GkcRknJOpBFRp9OldH00YjRmHUqNpu3xsOhcwtyAzoVeZiQvJx
	t+zRKnX7BNao+0sVGqsxlIJI2lkmOS/QfjARlGriOKnr/SkhlD+I+r7mRUenPItPIYw4
	vhZ4uxYbOeKv8p52OJJB5UOcDBrbMvbJlIiaG5PXijNwn6c8v8r5ZDCbjC6rn4M7NY4M
	lHPg==
X-Gm-Message-State: APjAAAU6SDbMfNBFdttX5Vt6qxrepllKNU4c1Briwxzvn2FnbfvdYpGh
	EuRZz9vVcH8qeEbuuiFBEGvP6yLC1B074RLAjC6ChQ==
X-Received: by 2002:aca:5785:: with SMTP id l127mr2203222oib.48.1557828532815; 
	Tue, 14 May 2019 03:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-5-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2019 11:08:41 +0100
Message-ID: <CAFEAcA_WVjE5hZh0EibxiqV+NtqY0VsMPs-tqC3Y=GRCbvhEpg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/4] hw/misc: Add a config
 switch for the "unimplemented" device
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mv0Yd8sEKv6h

On Tue, 14 May 2019 at 11:02, Thomas Huth <thuth@redhat.com> wrote:
>
> The device is only used by certain Arm boards. Now that we have
> fine-grained Kconfig for these machines, too, we can enable the
> "unimplemented" devices only for the machines that really need it.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 9 +++++++++
>  hw/microblaze/Kconfig | 1 +
>  hw/misc/Kconfig       | 3 +++
>  hw/misc/Makefile.objs | 2 +-
>  hw/sparc64/Kconfig    | 1 +
>  5 files changed, 15 insertions(+), 1 deletion(-)

Commit message says "only Arm" but code change changes
sparc and microblaze Kconfigs too :-)

thanks
-- PMM
