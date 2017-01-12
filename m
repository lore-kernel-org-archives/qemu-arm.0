Received: by 10.25.205.13 with SMTP id d13csp1337980lfg;
        Thu, 12 Jan 2017 08:51:41 -0800 (PST)
X-Received: by 10.237.62.130 with SMTP id n2mr13143718qtf.204.1484239900940;
        Thu, 12 Jan 2017 08:51:40 -0800 (PST)
Return-Path: <ehabkost@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l68si6477446qte.4.2017.01.12.08.51.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jan 2017 08:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of ehabkost@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=ehabkost@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E52F2544;
	Thu, 12 Jan 2017 16:51:40 +0000 (UTC)
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v0CGpct8002538;
	Thu, 12 Jan 2017 11:51:39 -0500
Date: Thu, 12 Jan 2017 14:51:36 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: rth@twiddle.net, Peter Maydell <peter.maydell@linaro.org>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Anthony Green <green@moxielogic.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
        Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
        "open list:ARM" <qemu-arm@nongnu.org>,
        "open list:PowerPC" <qemu-ppc@nongnu.org>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/3] qom/cpu: move tlb_flush to
 cpu_common_reset
Message-ID: <20170112165136.GB27893@thinpad.lan.raisama.net>
References: <20170112154731.1028-1-alex.bennee@linaro.org>
 <20170112154731.1028-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170112154731.1028-2-alex.bennee@linaro.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 12 Jan 2017 16:51:41 +0000 (UTC)
X-TUID: UNiJHprkJ6VY

On Thu, Jan 12, 2017 at 03:47:29PM +0000, Alex Bennée wrote:
> It is a common thing amongst the various cpu reset functions want to
> flush the SoftMMU's TLB entries. This is done either by calling
> tlb_flush directly or by way of a general memset of the CPU
> structure (sometimes both).
> 
> This moves the tlb_flush call to the common reset function and
> additionally ensures it is only done for the CONFIG_SOFTMMU case and
> when tcg is enabled.
> 
> In some target cases we add an empty end_of_reset_fields structure to the
> target vCPU structure so have a clear end point for any memset which
> is resetting value in the structure before CPU_COMMON (where the TLB
> structures are).
> 
> While this is a nice clean-up in general it is also a precursor for
> changes coming to cputlb for MTTCG where the clearing of entries
> can't be done arbitrarily across vCPUs. Currently the cpu_reset
> function is usually called from the context of another vCPU as the
> architectural power up sequence is run. By using the cputlb API
> functions we can ensure the right behaviour in the future.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

For i386:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
