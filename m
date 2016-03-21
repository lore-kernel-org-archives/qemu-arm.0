Received: by 10.25.208.211 with SMTP id h202csp1364983lfg;
        Mon, 21 Mar 2016 09:24:16 -0700 (PDT)
X-Received: by 10.66.155.232 with SMTP id vz8mr46618270pab.53.1458577456270;
        Mon, 21 Mar 2016 09:24:16 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s16si360317pfi.193.2016.03.21.09.24.15;
        Mon, 21 Mar 2016 09:24:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1756764AbcCUQYO (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Mon, 21 Mar 2016 12:24:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42011 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756270AbcCUQYM (ORCPT <rfc822;kvm@vger.kernel.org>);
	Mon, 21 Mar 2016 12:24:12 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 06054804F9;
	Mon, 21 Mar 2016 16:24:12 +0000 (UTC)
Received: from [10.36.112.47] (ovpn-112-47.ams2.redhat.com [10.36.112.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2LGO2ER008166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2016 12:24:04 -0400
Subject: Re: [PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND
To:	rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <[PATCH v2] Replaced get_tick_per_sec() by NANOSECONDS_PER_SECOND>
 <1458576150-3384-1-git-send-email-rutu.shah.26@gmail.com>
Cc:	kraxel@redhat.com, samuel.thibault@ens-lyon.org,
	stefanha@redhat.com, kwolf@redhat.com, crosthwaite.peter@gmail.com,
	rth@twiddle.net, mst@redhat.com, imammedo@redhat.com,
	peter.maydell@linaro.org, balrogg@gmail.com, jsnow@redhat.com,
	alistair.francis@xilinx.com, agraf@suse.de, jasowang@redhat.com,
	blauwirbel@gmail.com, mark.cave-ayland@ilande.co.uk,
	cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	armbru@redhat.com, lcapitulino@redhat.com, qemu-block@nongnu.org,
	kvm@vger.kernel.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From:	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56F02022.40108@redhat.com>
Date:	Mon, 21 Mar 2016 17:24:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458576150-3384-1-git-send-email-rutu.shah.26@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: 8gQXOqoCKG9n



On 21/03/2016 17:02, rutu.shah.26@gmail.com wrote:
> 
> Hi,
> This patch replaces get_ticks_per_sec() calls to NANOSECONDS_PER_SECOND. Also, as there are no callers, get_ticks_per_sec() has been removed. Replacement imporves readability and understandability of code.
> 
> Example given by Paolo Bonzini,
> 
> timer_mod(fdctrl->result_timer, 
> 	  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 50));
> 
> NANOSECONDS_PER_SECOND makes it obvious that the timer will expire in 1/50th of a second.

Looks good.  I've edited the commit message as follows:

--------
This patch replaces get_ticks_per_sec() calls with the macro
NANOSECONDS_PER_SECOND. Also, as there are no callers, get_ticks_per_sec()
is then removed.  This replacement improves the readability and
understandability of code.

For example,

    timer_mod(fdctrl->result_timer,
              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (get_ticks_per_sec() / 50));

NANOSECONDS_PER_SECOND makes it obvious that qemu_clock_get_ns
matches the unit of the expression on the right side of the plus.
--------
