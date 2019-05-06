Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2894824wrh;
        Mon, 6 May 2019 14:42:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwf+CxhEzRilxi5e+hccHj4xSwdW0Xs3E9RyKlGsncJJoVD/GXHKsetLBhvvk6kKIhd+A+M
X-Received: by 2002:a05:600c:114e:: with SMTP id z14mr3562304wmz.92.1557178932527;
        Mon, 06 May 2019 14:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557178932; cv=none;
        d=google.com; s=arc-20160816;
        b=vuqZwI5+Pb1W9I22Ppt0QfJX/WGIrlJBZulmExBpPeYNgpLYtJiZQdl7NgdABMhaQN
         RrP4mxpxG1S6oAmii8rew6ykN5ysTKoHZtBghp+0F1sXFcs2dxGgjZ4HIRpFnbasqxew
         fq8vA5y7G4WKJearma2DWYZkWPCtU1sy+BkeVtsqPK+Rqnv7NMJ/xO8iq5F9vjlOJSJQ
         brjye0Y8EN354SOZIWtB0jImWMBufxZmk9vlcjt9CPrsMgGtDhj3vm0c1TFdDg5dl/+s
         WKd/9UaDPMahF+UDQ4jJOU0uDXr70uFqBuSipQyxtSPtesgyOS19TOPZ7xT+szA274o8
         fScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=bhzIWh/jGUZ92LkS5Pm6x9c/lxDAB8vYUy4BXlpiieE=;
        b=rVIPakzEPu5G04O3qTfwywY5GEGCUVakKpJtPGFUU9m+Y4+LskAR/dFhvN0LycbQcH
         YyLbFL7oRxvDGk9dLQ1FXWPTKsjfJyKLY4GLCc+Av668N0D9LEealU1dum3n4iEaS5At
         pIwizvQbMLtxfHfV4ozucHuWAWWdQoDr6go0EsKNSD1O2bB4v2JiglsjClzUfjYMgi2R
         VzJNWB7VcjkKpcORlINAnL2bUepGFj6QxIJg/Hm8uUeKUiVokvljN5ZTzZcb5MQEWsar
         ntzjUTbO5/6U6Z6jYXFTx1U1h9MeavhgOuKvra1b/3g59iNgJ2hyKqm+4Z9GGvm+iqvS
         NQRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si7477964wmo.88.2019.05.06.14.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 14:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNlND-0004Bv-Ke
	for alex.bennee@linaro.org; Mon, 06 May 2019 17:42:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hNlN2-0004Bn-Vi
	for qemu-arm@nongnu.org; Mon, 06 May 2019 17:42:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hNlN1-0001Ro-Vh
	for qemu-arm@nongnu.org; Mon, 06 May 2019 17:42:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hNlN1-0001RM-Qa; Mon, 06 May 2019 17:41:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F6DD81E0D;
	Mon,  6 May 2019 21:41:59 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CEFA5DA99;
	Mon,  6 May 2019 21:41:56 +0000 (UTC)
Date: Mon, 6 May 2019 18:41:55 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190506214155.GI28722@habkost.net>
References: <20190312234541.2887-1-philmd@redhat.com>
	<d5d84efd-ef8c-4e0d-d48a-6996d91832e7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <d5d84efd-ef8c-4e0d-d48a-6996d91832e7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 06 May 2019 21:41:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Acceptance Tests: Test the Raspberry
 Pi 2 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5X95M1zF7vl5

On Sat, May 04, 2019 at 01:52:51PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 3/13/19 12:45 AM, Philippe Mathieu-Daud=E9 wrote:
> > Add the raspi2 to the list of boards tested by the
> > boot_linux_console Avocado test.
> >=20
> > Based on "Acceptance Tests: target architecture support" v5:
> > https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg04111.html
> > Based-on: <20190312171824.5134-1-crosa@redhat.com>
> >=20
> > Philippe Mathieu-Daud=E9 (2):
> >   BootLinuxConsoleTest: Let extract_from_deb handle various compressi=
ons
> >   Boot Linux Console Test: add a test for the Raspberry Pi 2
> >=20
> >  tests/acceptance/boot_linux_console.py | 34 ++++++++++++++++++++++++=
--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> I was hoping this series would be included in "Acceptance Tests: target
> architecture support" by Eduardo (removing the 'print' debug line) but =
I
> just realized I forgot to Cc him :S

Problem solved: queued on python-next (after removing the print
statement from patch 2/2).  :)

--=20
Eduardo
