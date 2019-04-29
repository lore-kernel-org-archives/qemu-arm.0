Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3311985wrh;
        Mon, 29 Apr 2019 02:41:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDlUQO70aL4SBpUMkr0k4aTbFcGVgrIcyLyKt5+jHvIZ8SApYa5cmr18ftLzOxYbwdKoJD
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr4857691wrm.197.1556530900297;
        Mon, 29 Apr 2019 02:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556530900; cv=none;
        d=google.com; s=arc-20160816;
        b=FarlFg0z0uldYOEkCP8YIx9p3Ba/X9ZCKo4kAD2BGyxf2eQBhN0ELgMHwD/eRF+XIF
         b/cDkFZs/gvIwxD7mSGHzK85t7BAUvX/+DwRabqD8CwsUVmGlkDcFKITDqQtiNwOFFbh
         eOPncrmTwO/yO1vQIjrsxf/CTjTMlMnlh1ISNfr0qwDMbTpjYSHEo1Go41vh/Jivnuf5
         7SqDH5t/Rk5+/p4QatO6SjFhigGbLHlPSZ0nQPCByc18v1tLoBP2MPvI77e4DbqzoFnV
         tCe28yleZOpvGJ4WFr/vK/BtVAoIN5DW7FqH3h3yWRWCgPDvB1Jv5zV3ezoTF15866ik
         Qw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijk1o2ge62wcY3D/7EY25+VIN8rwk4d/VXp1pxEpnWc=;
        b=b3Shj5vx27OxJlDKY5oe25RCzibY56aBgMUy/7GaeAkdrMh0gIimqzaDGMHWdlWB7P
         X7BTSFNLdMLA8s5o6PnxKfcf1wNGyqSLBAK7b4fcMnKK6GLsWZC8Cr3ydQg9+f5hvGdP
         yJDY2oMCXcnAYtjXLXX6RNk9s8UWbP4ay+zQoHMkiTwx+3d39Ce/txAy+RKlQF+8nnMW
         FV10o/h1ylOD1BgGStOvK6E5fb/mBcNX5CQzAolx/PfzNRWHPblE2whSMAM2OWgibJba
         rO/eo/7TAmCMyIOgVZO7g+HCAZ7u9rYLfnC0Sh1lktDMDaSagLs7e86QWxQXji1VvzsZ
         tZDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yzg/vQuO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si9934006wmb.165.2019.04.29.02.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 02:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yzg/vQuO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hL2n5-0007TN-Dw
	for alex.bennee@linaro.org; Mon, 29 Apr 2019 05:41:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL2mu-0007RS-QH
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 05:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL2mu-0005J9-0a
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 05:41:28 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:46739)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL2mt-0005Ht-S2
	for qemu-arm@nongnu.org; Mon, 29 Apr 2019 05:41:27 -0400
Received: by mail-ot1-x334.google.com with SMTP id 77so1864158otu.13
	for <qemu-arm@nongnu.org>; Mon, 29 Apr 2019 02:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ijk1o2ge62wcY3D/7EY25+VIN8rwk4d/VXp1pxEpnWc=;
	b=Yzg/vQuO0WMtn/lzNjp3YlXiEwcSDjZ8TjziJeusooelssFUJYfBwmRSik++wrK97f
	24whv1kDLxz5N5h4uH3/7oduz+VYMuuCGAHS92cW6C1W3+mnehVgfprw1d4KBnFQ0YxQ
	Z0wMCQOODWIOfJGtV/0mo/KNNhv6cfrp21Fy4Eo+1+FRm6iPtMb6DeCJEkPc11Um65EV
	qvyYp3tlHZGQwmAA5lLqvF/ePJ7eR8Zhon6ZEz0XvjBOX3fwCzsw4r9UvkoZE4Gfc0Kz
	eyl9UYtZouJ7T3KDy04ZwJXDVecy14MvfI5p/g/N3hUkt2uVbOdN3/fNfZg3r4nULi1v
	kOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ijk1o2ge62wcY3D/7EY25+VIN8rwk4d/VXp1pxEpnWc=;
	b=cuQc+W1UziRt0FBzJvugHxsmwlVPZcpzxsWxbGFmWuO3Fxk80a8kYYtsMqkIpwEWHX
	KQbmQL97UKLAER8DVZBrPEN375KHPXRtneL6oizpQwjxWh62n3zG7WejzgyzpDxEbnN7
	vgM66v0aop4dwaLi3xwjcnAbFqtnLS2MWIP17qSOs18i6YV9hJ0QEp4WLQAB31i1USP8
	7zjbaYXTdz5FAJHZdiHRyx0I4ws283GijkUmLxdtAkqUxuC5V02uyBXF7hdOhOUlv3MV
	WPsXjrBjvQT7hFLl/gMgKlqj3viO1GVggWBCoZWTl3S47MQ+MbDZ0Qqu7waGi4Tp+/TI
	tT2g==
X-Gm-Message-State: APjAAAXuo/MjFHJy/jvMWplQ6mozrqPitlrYi+O8RHfOdAndEvnYlIvd
	EXUkCoEy+HxdAx6eyqhEo2/VumFHDYJmIdNxXu7O5w==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr559982otk.316.1556530886197;
	Mon, 29 Apr 2019 02:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553510737.git.damien.hedde@greensocs.com>
	<bf7dcbc7-5dc6-6269-87e9-44f027946cd9@greensocs.com>
In-Reply-To: <bf7dcbc7-5dc6-6269-87e9-44f027946cd9@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 10:41:15 +0100
Message-ID: <CAFEAcA8e9Ua8p4LQ=VFkZE69_vr+-EW-bjKX9W-LmgZmvho7Sw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::334
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 00/17] multi-phase reset mechanism
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ycKu81G4No1W

On Mon, 29 Apr 2019 at 10:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi All,
>
> Any comment about this ?

Sorry we haven't got to this yet. This is on my to-review list,
but so are 23 other series, and I've been on holiday for the
past week or so. I will try to get to it this week.

thanks
-- PMM
