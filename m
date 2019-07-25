Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10334535wrv;
        Thu, 25 Jul 2019 01:16:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3mRfuJoKu1TWHQlrAiX8wtn1MMMww80A+nkMB+whdJoBzHvgq9vdAqRTTnF/Rjs3JdJO6
X-Received: by 2002:a50:ae8f:: with SMTP id e15mr75099707edd.74.1564042589422;
        Thu, 25 Jul 2019 01:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564042589; cv=none;
        d=google.com; s=arc-20160816;
        b=VGLiGTW0/T+Lh3H3tn0RAmLTSWhJ2doFt2smAxs7o4CV/RdPuNgLf5SrK39WeVSsq6
         7Zu70JmitICuRH95MMxP2q5oGvAFtcd96DzgNpL9gRqc1mTKEC1utGcup9letcrKvrlw
         LunCzVsw66IbzYTkFKZWlFBePnb1MpjMZv3zEL3l4f5UlkIZwLsZA2rch3di6lK+0AAL
         bPAu8cYnZsETIGxCyMrX/XhWIqiSXorTO27CO603qopXykjKRjatrowHedseCYSGQoOf
         CuHtcSbHkYI4K14gkmOu1jfWAP0Iy5URUyxpKIgOxVUGfO8IbQcdULIteKV1kj5gtx6z
         BaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=pXehI4uoZtMVse2N0JGWNDj/CxsVExY7nnJovaW66sk=;
        b=xebDrHeOdAIK50Hbs3QgaiKLFlFq3l/CvKMQs43svuNXVdCHBOVi5FvGA7Fg6MAKmp
         BhTe+XTYE6+Lfks+60aXTQntDXZy1Qikt43/a82QengXb4LDq+FVLl2DVo/cdqN36S67
         FAO5AK9lscRQKl3rqm1dhZRK1JOSIcgWFzNfFGO64LNtEF2XJxRaIvJgUwLIYgSJUDeM
         v+BmisyQOfa+qTkehDlCOmb8PBjoy3UzbGG5H9OHyP2VW/ZfTB+dXa91YxMoXCAQTFAX
         aLmrvV64mCQhvanwmXCLU1iNBdO613DqDxWainkg3xsh4PEcqQ3rC4j+L3MrUo6z3VSq
         tHxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s45si10965778edd.112.2019.07.25.01.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 01:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqYvM-0007ni-Fk
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 04:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40645)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqYvH-0007nY-B5
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqYvG-0006hV-76
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 04:16:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqYvF-0006gm-Vr; Thu, 25 Jul 2019 04:16:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 049258F02B;
 Thu, 25 Jul 2019 08:16:21 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8265DD8E;
 Thu, 25 Jul 2019 08:16:14 +0000 (UTC)
Date: Thu, 25 Jul 2019 09:16:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190725081612.GA2656@work-vm>
References: <20190724143553.21557-1-damien.hedde@greensocs.com>
 <543de194-b4e9-de7b-3dab-55fcc0976bc2@redhat.com>
 <20190724163812.GJ2717@work-vm>
 <e66cc73d-d185-c52a-b9fd-5081f960f0d8@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <e66cc73d-d185-c52a-b9fd-5081f960f0d8@greensocs.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 25 Jul 2019 08:16:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 4.1?] pl330: fix vmstate
 description
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9KhvqkwArjx+

* Damien Hedde (damien.hedde@greensocs.com) wrote:
>=20
>=20
> On 7/24/19 6:38 PM, Dr. David Alan Gilbert wrote:
> > * Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> >> On 7/24/19 4:35 PM, Damien Hedde wrote:
> >>> Fix the pl330 main and queue vmstate description.
> >>> There were missing POINTER flags causing crashes during
> >>> incoming migration because:
> >>> + PL330State chan field is a pointer to an array
> >>> + PL330Queue queue field is a pointer to an array
> >>>
> >>> Also bump corresponding vmsd version numbers.
> >>>
> >>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >>> ---
> >>>
> >>> I found this while working on reset with xilinx-zynq machine.
> >>>
> >>> I'm not sure what's the vmsd version policy in such cases (for
> >>> backward compatibility). I've simply bumped them since migration
> >>> was not working anyway (vmstate_load_state was erasing critical par=
t
> >>> of PL330State and causing segfaults while loading following fields)=
.
> >>
> >> I still not understand versioning and migration
> >=20
> > Incrementing the version (and minimum) is the right thing
> > to do if you conclude the old one was hopelessly broken.
> > Migration to and from old qemu breaks, but who cares since it was toa=
st
> > anyway.
> > As far as I can tell pl330 is only on our zynq and exynos models
> > so wont break our versioned 'virt' type.
> > So from a migration point of view:
>=20
> Since switching from VARRAY to VARRAY_POINTER does not change the size
> of what's migrated, it should be possible to accept migration from old
> qemu if we can ignore the data in such cases and default to something
> (but what ? put the pl330 in reset state ?)

I don't think it's worth worrying about doing that unless you need to
preserve migration compatibility - which is less important for
stuff where it's used for dev rather than VMs


Dave

> Thanks,
> Damien
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
