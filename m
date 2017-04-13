Received: by 10.25.0.144 with SMTP id 138csp760977lfa;
        Thu, 13 Apr 2017 07:09:20 -0700 (PDT)
X-Received: by 10.55.179.66 with SMTP id c63mr2487682qkf.147.1492092560859;
        Thu, 13 Apr 2017 07:09:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si15879449qkl.112.2017.04.13.07.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 07:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyfR2-0007Xk-BY
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 10:09:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1cyfQB-0007F8-BO
	for qemu-devel@nongnu.org; Thu, 13 Apr 2017 10:08:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1cyfQ7-0000YX-D1
	for qemu-devel@nongnu.org; Thu, 13 Apr 2017 10:08:27 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:10230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <samuel.thibault@ens-lyon.org>)
	id 1cyfQ7-0000Y1-1k; Thu, 13 Apr 2017 10:08:23 -0400
X-IronPort-AV: E=Sophos;i="5.37,194,1488841200"; d="scan'208";a="220334412"
Received: from unknown (HELO var.youpi.perso.aquilenet.fr) ([193.50.110.248])
	by mail3-relais-sop.national.inria.fr with
	ESMTP/TLS/AES256-GCM-SHA384; 13 Apr 2017 16:08:19 +0200
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.88)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1cyfQ3-0005FT-11; Thu, 13 Apr 2017 16:08:19 +0200
Date: Thu, 13 Apr 2017 16:08:18 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <20170413140818.flntaxvwt54a2pgp@var.youpi.perso.aquilenet.fr>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
	<1492076514-28821-6-git-send-email-clg@kaod.org>
	<cae91a9e-cc37-347f-d8fb-85a3173d9dcd@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cae91a9e-cc37-347f-d8fb-85a3173d9dcd@amsat.org>
Organization: I am not organized
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.134.164.104
Subject: Re: [Qemu-devel] [PATCH v2 5/5] slirp: add a fake NC-SI backend
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Dmitry Fleytman <dmitry@daynix.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x09lwBHbJN0k

Hello,

Philippe Mathieu-Daudé, on jeu. 13 avril 2017 08:45:23 -0300, wrote:
> > The NCSI header file <ncsi-pkt.h> comes from mainline Linux

Please mention within the file which file it comes from exactly.

> > +    case NCSI_PKT_CMD_SMA:
> > +        rnh->common.length = htons(4);
> > +        break;
> > +    case NCSI_PKT_CMD_GVI:
> > +        rnh->common.length = htons(36);
> > +        break;
> > +    case NCSI_PKT_CMD_GC: {
> > +        rnh->common.length = htons(32);
...
> > +        break;
> > +    }
> > +
> > +    case NCSI_PKT_CMD_GLS: {
> > +        rnh->common.length = htons(16);
> > +        break;
> > +    }
> > +
> > +    slirp_output(slirp->opaque, ncsi_reply, sizeof(ncsi_reply));

Are we really supposed to send sizeof(ncsi_reply), and not accordingly
to the size announced withing the packet?

Appart from that,

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel
