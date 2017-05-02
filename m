Received: by 10.25.0.198 with SMTP id 189csp187097lfa;
        Tue, 2 May 2017 01:13:56 -0700 (PDT)
X-Received: by 10.84.129.67 with SMTP id 61mr39967878plb.150.1493712836137;
        Tue, 02 May 2017 01:13:56 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 63si16799736pfc.26.2017.05.02.01.13.55;
        Tue, 02 May 2017 01:13:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751274AbdEBINy (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 2 May 2017 04:13:54 -0400
Received: from mail.ispras.ru ([83.149.199.45]:52138 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750767AbdEBINw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 2 May 2017 04:13:52 -0400
Received: from PASHAISP (unknown [85.142.117.226])
        by mail.ispras.ru (Postfix) with ESMTPSA id 8E81754006A;
        Tue,  2 May 2017 11:13:49 +0300 (MSK)
From:   "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To:     "'Markus Armbruster'" <armbru@redhat.com>,
        "'Eric Blake'" <eblake@redhat.com>
Cc:     <qemu-devel@nongnu.org>,
        "'Peter Maydell'" <peter.maydell@linaro.org>,
        "'open list:Overall'" <kvm@vger.kernel.org>,
        "'Michael S. Tsirkin'" <mst@redhat.com>,
        "'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
        "'Alexander Graf'" <agraf@suse.de>,
        "'Yongbok Kim'" <yongbok.kim@imgtec.com>,
        "'Gerd Hoffmann'" <kraxel@redhat.com>,
        "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
        "'Rob Herring'" <robh@kernel.org>,
        "'Stefano Stabellini'" <sstabellini@kernel.org>,
        "'open list:Block layer core'" <qemu-block@nongnu.org>,
        "'Magnus Damm'" <magnus.damm@gmail.com>,
        "'Christian Borntraeger'" <borntraeger@de.ibm.com>,
        "'Anthony Perard'" <anthony.perard@citrix.com>,
        "'open list:X86'" <xen-devel@lists.xenproject.org>,
        "'Richard Henderson'" <rth@twiddle.net>,
        "'Artyom Tarasenko'" <atar4qemu@gmail.com>,
        "'Eduardo Habkost'" <ehabkost@redhat.com>,
        "'Stefan Weil'" <sw@weilnetz.de>, <alistair.francis@xilinx.com>,
        "'open list:Calxeda Highbank'" <qemu-arm@nongnu.org>,
        "'Jan Kiszka'" <jan.kiszka@web.de>,
        "'Igor Mammedov'" <imammedo@redhat.com>,
        "'Cor nelia Hu ck'" <cornelia.huck@de.ibm.com>,
        "'David Gibson'" <david@gibson.dropbear.id.au>,
        "'Kevin Wolf'" <kwolf@redhat.com>,
        "'Paul Burton'" <paul.burton@imgtec.com>,
        "'Max Filippov'" <jcmvbkbc@gmail.com>,
        "'Marcelo Tosatti'" <mtosatti@redhat.com>,
        "'Max Reitz'" <mreitz@redhat.com>,
        "'Michael Walle'" <michael@walle.cc>,
        "'open list:Old World'" <qemu-ppc@nongnu.org>,
        "'Paolo Bonzini'" <pbonzini@redhat.com>,
        "'Aurelien Jarno'" <aurelien@aurel32.net>,
        "'Pavel Dovgalyuk'" <pavel.dovgaluk@ispras.ru>
References: <20170428021317.24711-1-eblake@redhat.com>  <20170428021317.24711-4-eblake@redhat.com> <87h918bmpz.fsf@dusky.pond.sub.org>
In-Reply-To: <87h918bmpz.fsf@dusky.pond.sub.org>
Subject: RE: [Qemu-devel] [PATCH v5 3/4] shutdown: Add source information to SHUTDOWN and RESET
Date:   Tue, 2 May 2017 11:13:51 +0300
Message-ID: <000d01d2c31c$091afd30$1b50f790$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdLAMEvPeueWF9hpSJWc7lM87UepYQC65a1g
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pYSDETxD7Kj7

> From: Markus Armbruster [mailto:armbru@redhat.com]
> 
> Scandalously, replay/ is not covered by MAINTAINERS.

Here it is.
http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg00080.html

I'll try to figure out the SHUTDOWN problem.

Pavel Dovgalyuk
