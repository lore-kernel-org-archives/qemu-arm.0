Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3633325wrx;
        Mon, 4 Mar 2019 05:55:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpQLLImIPM0LZ1ihUyyxMqOnyNE7fYef5AztsKXF2CCOjE/8JTC/QlKtLXeZsjgRIfTJ8K
X-Received: by 2002:a25:3ca:: with SMTP id 193mr15029960ybd.498.1551707730674;
        Mon, 04 Mar 2019 05:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551707730; cv=none;
        d=google.com; s=arc-20160816;
        b=gUj9TTTi9BAToldQdrrQlQjvzp/a9xYCeJ+cZbwlWy8t86VhLJupMsjkaWlJABZOOJ
         S7LIXpKv7Ovk/hf2kBdRTlH7yHt9yMwlPcfwm6Lo5/ufkSma1wZL7sd1Sc+chK8lUXbk
         VDlYLPxuZcPcovIov5c+/XPTOTyMDBJrY/ozf6aMhZ7kxoPw0NvQYKwNobkWOVtZdsmZ
         uYnRr27dGzFNl8nQOJFiswaCQMY4mjQRPKdNPYmZvJ+tNQ4WaCABkmq1qX1LSlu+hzH1
         CkqH5gZ6Ckl427eGS31d6qM4xRR5K5KhE/aDGr8l8NVzk8BWvx4Tc9+6jPgndBQk9ANU
         wQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=1rQ2d2zU4vVREZuCDc0Zv2x7Hv1UcThHYhGc6iEgTEM=;
        b=KTjqYrEPZVufctS1rnHkMEri2SMwmEu1Gza3I6cCtZSJwfpI6LZs3Vn8FNTJQg2GC1
         ktrhuxGjDiLkZvP6Jk3Ge1amXrGB77ZMoZc6y/Mvelmug5LdvSlEmgR661MTq26KKfHO
         g5TRjbp1QpSSFHHf0D5SCZ5aiyObeYK8iYtU2McMuBLyFQmCq6X8SGLJtcagEeKwbWoY
         nkvXI/UTjNQ7ODiGyKYUpL0Gnh7/ks4AWKFcU5Ak8/JnQgwEwhd/AvbKkEV4uJGP0Nh0
         iIXGk4egOJ5++c1AW1RYbMPF9gWfmwuw7loCqQVtZoglvp44YHB+WOu1lHL1Ne9zkIYj
         2USA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20si3136552yba.110.2019.03.04.05.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 05:55:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0o42-0000d8-5c
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 08:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0o3t-0000d3-ST
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:55:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0o3r-0001q3-P0
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 08:55:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60412)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0o3p-0001mR-QN; Mon, 04 Mar 2019 08:55:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B41481DE3;
	Mon,  4 Mar 2019 13:55:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE2F81001943;
	Mon,  4 Mar 2019 13:55:11 +0000 (UTC)
Date: Mon, 4 Mar 2019 14:55:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190304145510.57c73177@redhat.com>
In-Reply-To: <15464582-e8a6-6654-7679-15d87c10af38@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<15464582-e8a6-6654-7679-15d87c10af38@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Mar 2019 13:55:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel] [libvirt] [PATCH 1/2] numa:
 deprecate 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jLX09GXnuBiE

On Mon, 4 Mar 2019 09:11:19 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 01/03/2019 18.48, Daniel P. Berrang=C3=A9 wrote:
> [...]
> > So I think this patch has to be dropped & replaced with one that
> > simply documents that memdev syntax is preferred. =20
>=20
> That's definitely not enough. I've had a couple of cases already where
> we documented that certain options should not be used anymore, and
> people simply ignored it (aka. if it ain't broken, don't do any change).
> Then they just started to complain when I really tried to remove the
> option after the deprecation period.

> So Igor, if you can not officially deprecate these things here yet, you
> should at least make sure that they can not be used with new machine
> types anymore. Then, after a couple of years, when we feel sure that
> there are only some few or no people left who still use it with the old
> machine types, we can start to discuss the deprecation process again, I
> think.
Is it acceptable to silently disable CLI options (even if they are broken
like in this case) for new machine types?
I was under impression that it should go through deprecation first.

>=20
>  Thomas
>=20

