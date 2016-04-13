Received: by 10.25.208.194 with SMTP id h185csp127532lfg;
        Wed, 13 Apr 2016 12:04:15 -0700 (PDT)
X-Received: by 10.55.11.137 with SMTP id 131mr13409310qkl.51.1460574255809;
        Wed, 13 Apr 2016 12:04:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si29547260qha.127.2016.04.13.12.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Apr 2016 12:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aqQ5G-0001gY-98
	for alex.bennee@linaro.org; Wed, 13 Apr 2016 15:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1aqQ5D-0001dH-TM
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 15:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1aqQ5A-00006T-Nl
	for qemu-arm@nongnu.org; Wed, 13 Apr 2016 15:04:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1aqQ5A-0008UT-JF; Wed, 13 Apr 2016 15:04:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25F03C04B309;
	Wed, 13 Apr 2016 19:04:04 +0000 (UTC)
Received: from localhost (vpn1-5-188.gru2.redhat.com [10.97.5.188])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3DJ42Ef001838; Wed, 13 Apr 2016 15:04:03 -0400
Date: Wed, 13 Apr 2016 16:04:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
Message-ID: <20160413190401.GE11931@thinpad.lan.raisama.net>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1460465891-6142-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<20160412184551.GC26803@thinpad.lan.raisama.net>
	<EF5FA6C3467F85449672C3E735957B8591692A9C@BADAG02.ba.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EF5FA6C3467F85449672C3E735957B8591692A9C@BADAG02.ba.imgtec.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
Cc: "blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5JkbJCzN8Ah1

On Wed, Apr 13, 2016 at 06:41:48PM +0000, Aleksandar Markovic wrote:
> Hello, Eduardo,
> 
> I greatly appreciate your time spent on this matter and your unfailing attention to detail.
> 
> For Alpha and Xtensa, this is for sure, they will zero their CPU objects, as you hinted:
> 
> target-alpha/cpu.c:
>   162          cpu_class = object_class_by_name(TYPE("ev67"));
>   163      }
>   164:     cpu = ALPHA_CPU(object_new(object_class_get_name(cpu_class)));
>   165  
>   166      object_property_set_bool(OBJECT(cpu), true, "realized", NULL);
> 
> target-xtensa/helper.c:
>   125      }
>   126  
>   127:     cpu = XTENSA_CPU(object_new(object_class_get_name(oc)));
>   128      env = &cpu->env;
>   129  
> 
> So, I will remove their set_snan_bit_is_one(0) calls, as you suggested.
> 
> This leaves only ppc, s390x, and TriCore calling set_snan_bit_is_one(0) it this
> patch series..

All CPU objects are created using object_new(), and are already
zeroed on initialization.

ppc CPUs are created using cpu_ppc_init(), which reuses
cpu_generic_init(), which calls object_new().

s390x CPUs are created by s390x_new_cpu(), which calls
cpu_s390x_create(), which calls object_new().

tricore CPUs are created by cpu_tricore_init(), which reuses
cpu_generic_init().

-- 
Eduardo
