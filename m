Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1286927wrt;
        Tue, 27 Nov 2018 05:42:55 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UmUGj9Tysc5OVldkIX1AjlIKt6JCEPfO5hvq8nDTT4EZFQo3gHUTgUy7w+B9GgdnaMXKN7
X-Received: by 2002:a81:e404:: with SMTP id r4mr31059149ywl.472.1543326175365;
        Tue, 27 Nov 2018 05:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543326175; cv=none;
        d=google.com; s=arc-20160816;
        b=S+37KNwz/s8NZgjaL1I0zpCi1afdZAfkjW+tTilPWck2ZsjHs1dSxCIMaVXd1RUVcq
         1MAx7H0HozVnlLOlvPiffqBy9E36opiw4ryv4CVJderIvXgu9yF/hBpkUOmxqopYruOh
         pdE+IrrwjEOtWCi/S9NgRZmmDaI89il1sgOcvmDAq6kPK5BWXwsMaqp4wPC/87vEpW6S
         RxkJpCduKrYcraX03hgcykqVQRwslwaPZXcu/MfkLMQA1zfL8MvBoL1SvOCzrN4YMfiv
         LGcFkK9GM1rgFmfsNl48eQcV5fRhqoCnD9oEASTjRw3CoFQllCbMeOr+gy8FVrGWm2uY
         ktJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=F59Ljdb+zXvR7NGkU2lJJ228bgWTKNAKMNE5XExhZhs=;
        b=W7rK1B6rhmCUgMDca6Ad8WfqSDyvvMvNtv7lej3IttXh/gWBzzwfKN5D6OexoOvTw3
         uwPtZDuG/Xwla6ukGlQo1k+leRFyV+pCvT7yz4yGazNGRPOPoXGq/U00NOCCc/rEyvjO
         xv+uZ4gM2kvsmAzA0IwROvAE+aJYYJkcmibhJIpPcNr0D+PDk0kFUPW7XnpXShHUKcb2
         /lj5xKn3dp7187g6qtJ5J8/cPy/sadg+2sTbwsUpeoRCL2fiVWE2n7TvUbq0NuP3sS/g
         tDhA8O7uqAKDZ5oULTQHTZR46iAlgDvsmDnq/1mhx/C0Y2so3Fy3XLWCbEgWLZO8uIT6
         07Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r124si2706954ywh.6.2018.11.27.05.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRdde-0002di-Qe
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:42:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRdd0-0002c3-BJ
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:42:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gRdcz-00083F-PI
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 08:42:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gRdcs-0007yz-6I; Tue, 27 Nov 2018 08:42:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17BE0308FC5A;
	Tue, 27 Nov 2018 13:42:04 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6FDD5DD8F;
	Tue, 27 Nov 2018 13:41:55 +0000 (UTC)
Date: Tue, 27 Nov 2018 11:41:54 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181127134154.GM18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-11-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181127092801.21777-11-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 27 Nov 2018 13:42:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-3.2 v4 10/28] qom: make interface types
 abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Corey Minyard <minyard@acm.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PReP" <qemu-ppc@nongnu.org>, imammedo@redhat.com,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: soU+ApA5u7mx

On Tue, Nov 27, 2018 at 01:27:43PM +0400, Marc-Andr=E9 Lureau wrote:
> Interfaces don't have instance, let's make the interface type really
> abstract to avoid confusion.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

What about updating the documentation at qom/object.h with
examples?

--=20
Eduardo
