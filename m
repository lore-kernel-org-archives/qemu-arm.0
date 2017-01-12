Received: by 10.25.205.13 with SMTP id d13csp1045741lfg;
        Wed, 11 Jan 2017 19:12:51 -0800 (PST)
X-Received: by 10.237.42.196 with SMTP id t62mr11862526qtd.185.1484190771070;
        Wed, 11 Jan 2017 19:12:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f37si5148806qte.335.2017.01.11.19.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 19:12:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=cmu.edu
Received: from localhost ([::1]:59059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRVoo-0008NX-DV
	for alex.bennee@linaro.org; Wed, 11 Jan 2017 22:12:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1cRV5R-00086e-1O
	for qemu-arm@nongnu.org; Wed, 11 Jan 2017 21:25:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1cRV5N-00054V-Qd
	for qemu-arm@nongnu.org; Wed, 11 Jan 2017 21:25:57 -0500
Received: from smtp.andrew.cmu.edu ([128.2.105.202]:38049)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <somlo@cmu.edu>)
	id 1cRV5N-00053y-Lr; Wed, 11 Jan 2017 21:25:53 -0500
Received: from foober.ini.cmu.edu (pool-108-39-248-175.pitbpa.fios.verizon.net
	[108.39.248.175]) (user=somlo mech=LOGIN (0 bits))
	by smtp.andrew.cmu.edu (8.15.2/8.15.2) with ESMTPSA id v0C2PAB5043073
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT); 
	Wed, 11 Jan 2017 21:25:17 -0500
Date: Wed, 11 Jan 2017 21:25:10 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20170112022510.GA14378@foober.ini.cmu.edu>
References: <20170111173457.30455-1-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170111173457.30455-1-lersek@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.7.1 (2016-10-04)
X-PMX-Version: 6.3.0.2556906, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2017.1.12.21515
X-SMTP-Spam-Clean: 28% (
	SXL_IP_DYNAMIC 3, MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05,
	BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0,
	BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, DATE_TZ_NA 0,
	FROM_EDU_TLD 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0,
	MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_GENERIC_POOLED 0,
	RDNS_POOLED 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0,
	RDNS_SUSP_SPECIFIC 0, REFERENCES 0, SINGLE_URI_IN_BODY 0,
	URI_ENDS_IN_HTML 0, __ANY_URI 0, __BOUNCE_CHALLENGE_SUBJ 0,
	__BOUNCE_NDR_SUBJ_EXEMPT 0, __CC_NAME 0,
	__CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CD 0,
	__CP_URI_IN_BODY 0, __CT 0, __CT_TEXT_PLAIN 0, __FORWARDED_MSG 0,
	__FRAUD_BODY_WEBMAIL 0, __FRAUD_WEBMAIL 0, __HAS_CC_HDR 0,
	__HAS_FROM 0, __HAS_MSGID 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0,
	__MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0,
	__MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0,
	__PHISH_SPEAR_STRUCTURE_1 0, 
	__RDNS_POOLED_10 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0,
	__SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0,
	__TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0,
	__URI_IN_BODY 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0,
	__USER_AGENT 0)
X-SMTP-Spam-Score: 28%
X-Scanned-By: MIMEDefang 2.78 on 128.2.105.202
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 128.2.105.202
Subject: Re: [Qemu-arm] [PATCH v5 wave 1 0/4] fw-cfg: support writeable
 blobs and more files
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, qemu devel list <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HDdMpFKWc91

On Wed, Jan 11, 2017 at 06:34:53PM +0100, Laszlo Ersek wrote:
> This is the first (fw_cfg) half of the v5 iteration of the series posted
> here:
> <http://lists.nongnu.org/archive/html/qemu-devel/2016-12/msg00129.html>.
> 
> In this version, the fw_cfg patches have been separated into a
> standalone "wave", for helping review / maintenance, and also for
> enabling independent features on top of writeable blobs. More
> importantly, I've addressed Igor's v4 feedback. See the individual
> patches for the details.
> 
> Patch #3 is included verbatim from Eduardo's pending series (see the
> patch notes for the archive URL), as a dependency for patch #4. If
> Eduardo's series is merged first, patch #3 can be dropped (in fact
> git-rebase should do it automatically).
> 
> Please excuse the surprisingly long list of CC's, it's due to the fact
> that fw_cfg is quite widely used (see patch #4).
> 
> Cc: "Gabriel L. Somlo" <somlo@cmu.edu>

Whole series:

Acked-by: Gabriel Somlo <somlo@cmu.edu>

Data passed in via the "-fw_cfg" qemu command still shows up fine in
/sys/firmware/qemu-fw-cfg on the guest, so also:

Tested-by: Gabriel Somlo <somlo@cmu.edu>

Thanks,
--Gabriel

> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: qemu-arm@nongnu.org
> 
> Thanks
> Laszlo
> 
> 
> Eduardo Habkost (1):
>   pc: Add 2.9 machine-types
> 
> Laszlo Ersek (2):
>   fw-cfg: turn FW_CFG_FILE_SLOTS into a device property
>   fw-cfg: bump "file_slots" to 0x20 for 2.9+ machine types
> 
> Michael S. Tsirkin (1):
>   fw-cfg: support writeable blobs
> 
>  docs/specs/fw_cfg.txt          |  36 ++++++++++----
>  hw/lm32/lm32_hwsetup.h         |   2 +-
>  include/hw/compat.h            |  10 +++-
>  include/hw/i386/pc.h           |   2 +
>  include/hw/loader.h            |   7 +--
>  include/hw/nvram/fw_cfg.h      |   3 +-
>  include/hw/nvram/fw_cfg_keys.h |   3 +-
>  hw/arm/virt-acpi-build.c       |   2 +-
>  hw/core/loader.c               |  18 ++++---
>  hw/i386/acpi-build.c           |   4 +-
>  hw/i386/pc_piix.c              |  15 ++++--
>  hw/i386/pc_q35.c               |  13 ++++-
>  hw/nvram/fw_cfg.c              | 110 +++++++++++++++++++++++++++++++++++------
>  13 files changed, 177 insertions(+), 48 deletions(-)
> 
> -- 
> 2.9.3
> 
