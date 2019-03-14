Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp805844wro;
        Thu, 14 Mar 2019 05:50:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLikVdhuhcz/hsqfaFLPnLCt0VwYI8ncyWHjCVIfRbklky9D/c0jDoU0/qbTOv4dhLcspq
X-Received: by 2002:a25:1e42:: with SMTP id e63mr25587803ybe.485.1552567810865;
        Thu, 14 Mar 2019 05:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552567810; cv=none;
        d=google.com; s=arc-20160816;
        b=fc3X/MoEMAs/PD8jb8NddIn8ZdmoZAqx+bvove7tiQH5H38orAfV6h3g8iK68W1mxG
         g/YpKNWmdSZzn97SpLuobkfohbEQVvy9Fml49SDMIOnfcGaFg3uOH8rw6ISx3Wx/QQly
         iyJa21r9UiVqGmNnZG5uP02OgYeQ3xvFQMQc/ZO6TgVHGCwC0bf1LytSLb0V6Y1S3x2m
         9mo35FQxTbo0lD1zyVJpyM2hUAJWvxVf/dEI/RoSyeL9tiyGTPMTQZE45xE9DWXd5gsf
         /i4sd+zh1OXeT+svaYgah2sAPhBTdx12DngxjJS5WS+nIKasvBO/i4Yz3OWC2ggqxwq+
         Q8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wc98OiND2QHY+ImLWaLAaPj5aTUQY3CGUpYRwwbO4Sc=;
        b=znDma29+Klp7dhVGARfGTb/Hb2UfQWyNzXOGD4VraNnSnBmrlpQSDbqAtb27CTNRWO
         felKci+rirRV9qF1c8dsPXzg8A0Z3QlV+dNsuoB5E/sL2kOqbGyA/rgzG3wJU7EEXqAI
         5HC317CXXXGNMEjwtDV/06nNab/CbqrPXjdiUTwrcJREPBD5vStgZ38CPDrYtqX1sX6X
         QIlyVW9TlMY3aWK39G/owmV8TTL6FHV+zzdV7U4ilLqdtAmBC8gDmHiHJwiQuibsnkeA
         Abz5phBa3VIJUTdKJZj7rm8gO7e4bHT/VCWUMXF++fMALhdvtQUTE1bOqPraUDl8vr5n
         y4HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=gDa+JJNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b75si8501559ywb.52.2019.03.14.05.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=gDa+JJNw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4PoI-0002of-3n
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:50:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4OLr-0007eT-9J
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4OKj-0004V3-C4
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:15:34 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35253)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bluecmd@google.com>) id 1h4OKi-0004Un-W6
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:15:33 -0400
Received: by mail-oi1-x241.google.com with SMTP id j132so1030461oib.2
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wc98OiND2QHY+ImLWaLAaPj5aTUQY3CGUpYRwwbO4Sc=;
	b=gDa+JJNwFsghDxtgP1mwVNNcVRdIgTnhh6i5EkLtZP/9jq6rmKfqdg+sA8g7XHjsmq
	WfL9tIlyBG7QQryYCmijjempZ3MXddOihbWiY1RtEde9A4JjsKB2FFZ/mo+sbChBW7/Z
	v9CLqCbdjI7YTxNzd+5btou34iY21351uLc5xmEr4yYuSfKOkG/5czIj/eqIFS1y2vs7
	Vz8nWla0ZQIHHJCD5WiqDo+i7XN+asUVNsDmddSS9INjJqdwqhcuYseaO62D/l6EVvMM
	Xs2YECAsC6AKOf70pHNO6BsIUTPwHqf/SRF9hK5j/Kju+lK5f3iVsR5M1AZKCjEconJS
	XphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wc98OiND2QHY+ImLWaLAaPj5aTUQY3CGUpYRwwbO4Sc=;
	b=JyGe5BJ9iENt4MG6imnrnm5CVDjOrBScmBSvwLriu9FRwXjLoEzv85mQk7pCx0WQ6I
	fNXWlX6+fHjR3dfP6xJfQj1q3+G9TNVG41kd08b2UrqD9fnuwZTWX7eedJcGf8SQW2tY
	LnaWAqTNBqs1Dg1B12MSXkisXkyLdYqNpX2k6s1j235BJfB+QyJTjhIfF3bo02f/cDm3
	Jso3I1g5FeBTRZ+hVmDCAuQFum7pPrqV/M516xllS8qfPvdTasEXuef81RkUATx+lMcW
	pysp2o+XNjTrJXYBp7XbU+8NpxRR29dnHBXT2TI8nM0md9jwm144MXtg8AcDg1JhD2qs
	CFdA==
X-Gm-Message-State: APjAAAX5phUHAHNt9a6gFwyvTvLN2k6y2eC9Yj1I0V5RLIqsoci7kMcS
	PuvhWjT9Goozrk6P1sVbuMN9QDUQzvSVGzO3/PII1w==
X-Received: by 2002:aca:b408:: with SMTP id d8mr1615093oif.15.1552562131505;
	Thu, 14 Mar 2019 04:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190314084235.9887-1-clg@kaod.org>
	<20190314084235.9887-6-clg@kaod.org>
	<CAFEAcA_5rXmNEW+Yms8BhaFBn3UaJKNYhhO8xf76qWh6-zHj_w@mail.gmail.com>
In-Reply-To: <CAFEAcA_5rXmNEW+Yms8BhaFBn3UaJKNYhhO8xf76qWh6-zHj_w@mail.gmail.com>
Date: Thu, 14 Mar 2019 12:15:19 +0100
Message-ID: <CAEfeXvbki=OyBMd2wYP81Y9di3aLN8ZT7y8THyfT_uLu5RaBRQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000579a8b05840c0a00"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-Mailman-Approved-At: Thu, 14 Mar 2019 08:49:53 -0400
Subject: Re: [Qemu-arm] [PATCH 5/5] aspeed/timer: Use signed muldiv for
 timer resets
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
From: Christian Svensson via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Christian Svensson <bluecmd@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMehaELvILP0

--000000000000579a8b05840c0a00
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback,

On Thu, Mar 14, 2019, 11:57 Peter Maydell <peter.maydell@linaro.org> wrote:

> But overall I'm a little sceptical that the aspeed timer is
> really a special case that needs a signed version of this
> when no other timer in the system does...


I agree, and the v2 of the patch doesn't require it. Happy to submit it
when you folks think it's a good time to merge it.

If you're curious you can get a sneak peek of the patch in
https://github.com/u-root/u-bmc/issues/134.

Regards,

--000000000000579a8b05840c0a00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Thanks for the feedback,</div><div dir=3D"ltr" class=3D"gmail_=
attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 14, 2019,=
 11:57 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
But overall I&#39;m a little sceptical that the aspeed timer is<br>
really a special case that needs a signed version of this<br>
when no other timer in the system does...</blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I agree, and the v2 of the patch does=
n&#39;t require it. Happy to submit it when you folks think it&#39;s a good=
 time to merge it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If yo=
u&#39;re curious you can get a sneak peek of the patch in=C2=A0<a href=3D"h=
ttps://github.com/u-root/u-bmc/issues/134" target=3D"_blank" rel=3D"norefer=
rer">https://github.com/u-root/u-bmc/issues/134</a>.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto"></div></div>

--000000000000579a8b05840c0a00--
