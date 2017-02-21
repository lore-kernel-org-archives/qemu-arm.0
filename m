Received: by 10.103.98.197 with SMTP id w188csp398747vsb;
        Tue, 21 Feb 2017 06:02:27 -0800 (PST)
X-Received: by 10.55.26.98 with SMTP id a95mr24613471qka.223.1487685746959;
        Tue, 21 Feb 2017 06:02:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r58si8537223qtb.43.2017.02.21.06.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 06:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgB1O-00061d-5A
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 09:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgAxO-0002Fu-SH
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgAxO-0003jx-DY
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:58:19 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:36805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgAxO-0003iD-6D
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:58:18 -0500
Received: by mail-wr0-x232.google.com with SMTP id 89so78012114wrr.3
	for <qemu-arm@nongnu.org>; Tue, 21 Feb 2017 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=itZP5Gd1mqvegQgXEMrJP7P+yQMmoxBx2kHgrogt2+A=;
	b=csH5Tn6lClVK19poZsZ+mUFS4B7uhHOEt0A+dhlL+0f5LcXyfui7oPHF2+i4NwokJ6
	tgX3Vki7UjYJppH8tUcA7A7GtRIrVly4i+Za/IyW/4g9TbRvYCjDoxERJKYzG1mPMvnS
	Kv8SJshU+WyRwgRe9QHS071eTtObOwFKkylPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=itZP5Gd1mqvegQgXEMrJP7P+yQMmoxBx2kHgrogt2+A=;
	b=QhUU1iGpYcYiwhi3UwGfuRRtulY1kyquqUtJnyH4XkmVLHd2a8u/KgMW5hAA7X/U/L
	fmvs+I7xd9CF7qoUB/gp2VsoW9IxON8cuM7MSOqqwFcYxEKMv1z/6K4d7FcoIPFbr6If
	vmkmMIVhGg80ByClbGaRJtdX83fku5Ve01Nu/P54lBbCUsSMo4PY8t7079ZTEi//VV/0
	lIR6baCKIqKnR+woQMrvyJrCQtZRbgh2AAu65y4oibIAHnysNlKrnKLwriZO7KinQ4C3
	aiZWXNu5ZbRzozzvEQjABr2OiOcB/vnMD7MXQISWA7JiFPkpNlLnU3QGiJqjBfE4+1NA
	cN8w==
X-Gm-Message-State: AMke39klwuaFUSt4WIR3M31CeWVX18Z7hr12eB+xct3T2VrhHkETWADBSQx6c/WI+hZoY0jYd/LQ8chs/Y9FQIV8
X-Received: by 10.223.169.76 with SMTP id u70mr10108918wrc.187.1487685496962; 
	Tue, 21 Feb 2017 05:58:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 05:57:56 -0800 (PST)
In-Reply-To: <87poibr6kv.fsf@dusky.pond.sub.org>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
	<CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
	<87poibr6kv.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 13:57:56 +0000
Message-ID: <CAFEAcA-75VPiOzPauZO4ukYVYWffB1cu1-tsQs6Hs8m8Vf41OQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] generalize parsing of
 cpu_model
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2M99N66PhQB

On 21 February 2017 at 13:56, Markus Armbruster <armbru@redhat.com> wrote:
> -global is a qdev thing.

...which reminds me to ask: is there any hope for unifying
our properties so we don't have both "qdev properties" and
"qom properties" or are we doomed to two distinct sets of
APIs forever?

thanks
-- PMM
