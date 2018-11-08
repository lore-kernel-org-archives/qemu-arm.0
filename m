Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp367033wrw;
        Thu, 8 Nov 2018 08:54:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5fVFH9Uds/K3diesiDeS9+jBSygQaRKEn0wtcGinY7e5gRPzqI0+dNhIDKzfBJfUg4z1bMP
X-Received: by 2002:ac8:dc5:: with SMTP id t5mr4998251qti.80.1541696081528;
        Thu, 08 Nov 2018 08:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541696081; cv=none;
        d=google.com; s=arc-20160816;
        b=VVOAOle641u85ANgQ5XtYSHjzZGy7HLMFlZZe1OiMsT88HLJkyPhWAZVabEXcZbg/k
         obpIPpyr1QzY7GZMIE662QamRimtZzTXs9MMTpGc6DvXVz8qjfcTua+g8dNL7/NDIVn6
         g+KeBkkgvCNgal3TqSjTeStC0kplUrY6GMv+gYUhwxvp/ZP3MgzbVwkeActmiaXCHdlq
         E5eSXRVU/DP8FfVB4k332EHbdWLzU7X2Z0C6aQx678lCcz5O8QsGDDskUoZnjYGioocY
         W43URJUfZM8wuXMUYXDgh3PSLbUvqCoj3u8EIPW7L+sOY3BJUyNjhaO8k0Mbv3XDp3ig
         Y7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Zt9aOO64iPrBbhM5bkwd0h5D6PCLPsom7B766e7D3A8=;
        b=pqhC70F9uJn0g4sagk0naUQ/5CO99Lyu7EoHWvi8Pn5lkWQ162RHhmTFN4eUeStguU
         ozFIV+IsLGpgCekt2qjvjGC0FqFzknGpzscjpUYjfLgFqoKy2rIo/hmsvyGMzNVxAxzY
         1pbkcLxHi+3oi/q5w8TFntGbweDQ3T4y+8EUbEsbhYAe7cjr3XYWJ+KTSCbVqKNjxHU5
         xQnmf7l3vbRsU4PPCzteXjIU55sPAVYuVAZNDs91zFNCx3GEM2odMOkRqgL09tkqN6CU
         54+Iz7C1iNGAOxRvM+iTL93WjuzNYVu+/KUPci4Y7fuocVuLAuBA3oQoUdJQPGS+d7Sz
         ESKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l61-v6si1467661qte.331.2018.11.08.08.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 08:54:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKnZp-0002bc-33
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 11:54:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gKnZi-0002bV-0K
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:54:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gKnZe-0004Xo-Gb
	for qemu-arm@nongnu.org; Thu, 08 Nov 2018 11:54:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gKnZa-0004TW-KO; Thu, 08 Nov 2018 11:54:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFDC930820C8;
	Thu,  8 Nov 2018 16:54:22 +0000 (UTC)
Received: from localhost (ovpn-116-36.gru2.redhat.com [10.97.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFBA9601A1;
	Thu,  8 Nov 2018 16:54:18 +0000 (UTC)
Date: Thu, 8 Nov 2018 14:54:17 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181108165417.GL12503@habkost.net>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
	<20181106110548.4209-2-luc.michel@greensocs.com>
	<28f0188a-e8fb-ad21-0c1d-9aaa5b81d261@redhat.com>
	<CAP+75-XPStesboG8yybAaknYHg0k6nxwsihJdEVeHJnOJHNKNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAP+75-XPStesboG8yybAaknYHg0k6nxwsihJdEVeHJnOJHNKNQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 08 Nov 2018 16:54:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HY7ZNZVqT7c0

On Thu, Nov 08, 2018 at 05:23:14PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On Thu, Nov 8, 2018 at 5:17 PM Philippe Mathieu-Daud=E9 <philmd@redhat.=
com> wrote:
> > On 6/11/18 12:05, Luc Michel wrote:
> > > This commit adds the cpu-cluster type. It aims at gathering CPUs fr=
om
> > > the same cluster in a machine.
> > >
> > > For now it only has a `cluster-id` property.
> > >
> > > Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >   include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
> > >   hw/cpu/cluster.c         | 59 +++++++++++++++++++++++++++++++++++=
+++++
>=20
> Eduardo are you OK to cover these files in your "Machine core"
> MAINTAINER's section?

Yes, no problem.

--=20
Eduardo
