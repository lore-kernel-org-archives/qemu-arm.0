Received: by 10.25.0.6 with SMTP id 6csp1887384lfa;
        Tue, 30 May 2017 09:07:12 -0700 (PDT)
X-Received: by 10.55.31.12 with SMTP id f12mr16984130qkf.101.1496160432345;
        Tue, 30 May 2017 09:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496160432; cv=none;
        d=google.com; s=arc-20160816;
        b=H1XnpyyDV3/KjOLq0DdJjyCwuXTwetS+uci/aOqZC14K0Vns0C6G4075uPNJ10FcnC
         LGKTi8HpUfi7ZBXS8s/oOE9nwuxnfbMR7CRn2lCcMx9bO+MNkQeJlUnHZtuj7Chxt63k
         9FaKEErHpwaVPVPa8N5OJkRf6JFX7yjxmXiCNB11Vt3sBgVvyc3qaJgORsb9r/h86Be+
         qGfilPHBv5pPU8TgUg8JHhB1OvJYek8+RnHZtNsOKpPlcMZS1hS6edxoY44BKh0EVBG5
         kqprZ48S/ckiHFVu7ktuYwaG48CWLtXCBMAguaD2u2HKLOLP6drNmUlQ6d72YlgGf1ri
         2/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NjeMZt0dneywayHDR0GqJQH6uu7eT1QK4OMywma/DY4=;
        b=pmqP+2YXMt7HpjZmG2HDKs531sEXyF833JXjL1X0U1MZKGm3kiByCKAV6JcDMszgHa
         3SLr++WJVxSf4x9mBdZGjtNsSQI94ItPWUk3GlHdopO6x5mFwJfB27WfEF+XuSuDuZf4
         KXrxaqtEGGXuXlUtpLaXKeJ4VP8cwr/ePSQNOErlW32raeFXZbBufwS5ddTCD/F1UCOi
         CTh2f1pqNymPXRBKuJKl/1aIGePcq5O3XEoDQ7oxR9IUhD/N7wlET55T8zBXB1yUKrRI
         3GtQXXsp1bSC1Armw94NtjBzFlSrxWvRSEJM0mhSM7hk7mx0Sl+IZasjQ3Nu8pIHOk+l
         LOqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si13320267qtc.85.2017.05.30.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjfr-0005gm-P2
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:07:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFje1-0004KT-Oz
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFje0-0007QR-WF
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:05:17 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFje0-0007PY-R4
	for qemu-arm@nongnu.org; Tue, 30 May 2017 12:05:16 -0400
Received: by mail-wm0-x235.google.com with SMTP id 7so95898752wmo.1
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NjeMZt0dneywayHDR0GqJQH6uu7eT1QK4OMywma/DY4=;
	b=QnL+m7cfE5Yqur0Xo/Sp5GzD6QijozX0iED/3ly7W47IArpIsLnvNu2r7RaF32KktK
	r730UCtdMhSZjhvZGLWEc1hLybQNO3ailIWc80WPvXycsEUQS7ZFRpsWpMu4qPMr1eHK
	VoDDj8ixBbdUylWUc5/LC0hKT1+daMhZL4/EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NjeMZt0dneywayHDR0GqJQH6uu7eT1QK4OMywma/DY4=;
	b=uQJBhG+Nd7c7sU3sjdP+OVlQKPzLGOHn4VIdmy7frKM39Ja/W/faViQOI7l7D58dPm
	yEw0oBAGzIenrr/WjhEtrY77s6wP21YHqTEgpMktT6oAYm+Lo/59PsFmS1p7EPjiIFzu
	q0piFf/n+jGPu8GMp0Fia+pV4/EmzjVzWBY7cwU+qkl9S0QR1QbRwJUh3087g4eetOdW
	BtmprtWJVJND32EAKZjzawO8+2gOiQxtZdsz1ynDYEdxXEWQORTKeh+oTcxzNg9ILS0f
	YCz8EDowB0JyuJR9iug+sFBIZxE+Veg+l3y7Ys41XIjXgPTuMksxXscIst8zLyyrC+Yv
	fUBQ==
X-Gm-Message-State: AODbwcAXJr8br3AJuwZ5YULqbJ/0OVt7foc8D2zyXZvERVLWy7WN4kuK
	gKLoKwMza3P9UN68S4k4ofB1uMB7hd/3
X-Received: by 10.28.24.202 with SMTP id 193mr2407432wmy.125.1496160313330;
	Tue, 30 May 2017 09:05:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 09:04:52 -0700 (PDT)
In-Reply-To: <1494697399-352-5-git-send-email-eric.auger@redhat.com>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 17:04:52 +0100
Message-ID: <CAFEAcA-GCKfxEpy9p=k7NzoY2zez-KVXNMuAx-ruW5t27ZMgQQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [RFC v4 4/5] hw/arm/virt: Add 2.10 machine type
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9f/I5L0nq/M

On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
> The new machine type allows smmuv3 instantiation. A new option
> is introduced to turn the feature on/off (off by default).

Should we go for default-on, or would that break guests?
For other things added to the virt board I think the
approach we've taken has been:
 * if this is just an extra device, simply provide it in the
   new virt-n.nn machine by default
 * if this is something that changes how the machine behaves
   even for code that doesn't care about that feature (eg
   EL2, EL3, since they change what mode you start in on boot)
   then default it to off
 * if the feature only works with TCG and not KVM then
   maybe default it to off

thanks
-- PMM
