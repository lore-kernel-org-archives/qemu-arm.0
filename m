Received: by 10.223.159.82 with SMTP id f18csp9759wrg;
        Thu, 30 Nov 2017 05:55:13 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZTWfitBlhros0xNSFNyBzeAlOgoIiTzPIqO4GDIT1WrcMKo5Ty6hZ28P8MkX/1h1hawC87
X-Received: by 10.37.170.101 with SMTP id s92mr1534269ybi.263.1512050113560;
        Thu, 30 Nov 2017 05:55:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512050113; cv=none;
        d=google.com; s=arc-20160816;
        b=xfMFr+zO5a/Cgvb11tOt6DnPmwwmzKSIenrkPmNicwPdk1dBGIckxqF+wgifoUeUBX
         My1wuaGeYfB4S9k4Xc3YTTQjRxrM/U9+gopRR4uWWiJsJXSo2iZDjQRvnNM4PW5UFnUr
         /Fnhq5LBFDej/stAPIesEoAPhSyRgxEuOPBrFxQO8MGifM1JRxREbA7j+8RBdRwGyMj+
         txBP8TcSQkaFqo/5yRZUJyjc+02dLiTwRGLJvWzF/B7MCoguX9mu0kSftnibA/aIYJop
         OnmMh6AU8/wnmYRFUqCegWx83qgQENgpI1F+c7tIQVjVybyexcuywR5TGlw6/vqTTkRi
         Bimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=ja3Nn3xLYJvEoB4uiD3O1yCFWiSslkIutq7YrN1YuGs=;
        b=wC61wFqF7lpox74VNd3WUJzWB9S1CwWGMAu/1qkYUja0WHmwcPdfYrKBRh5cF5ywc9
         i7Eqeev0blBnMB+PFKsG8kSRD5S5ARBqR0f761JqOPjB2J+Vu+zmy+MdGpvXhRLV8kaM
         ELalQOlkumXvMXWhJx0Z1lPoe1h0aF/0FdD7+rMHwcjVVbwK4lpNvPYFQG8NjeZYL15F
         Sl70/bV/bHIl1xGdINIl1dFAh02dylmM7Tg98/LbbQyJ/zVqICS256DqSeF+rFKMT2dk
         k+j50IC86HbHprz7DXW27VdS502oSvGjKlvAdbjSo3K2Bf2DQQ+kpmnIfTvyiRO60tpW
         YhlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si827151ybd.32.2017.11.30.05.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 05:55:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKPJ3-00057F-42
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 08:55:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eKPIv-00055g-6q
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eKPIq-0006rp-BT
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 08:55:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eKPIq-0006ra-1T; Thu, 30 Nov 2017 08:55:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2AD16868C;
	Thu, 30 Nov 2017 13:54:58 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E20B60621;
	Thu, 30 Nov 2017 13:54:49 +0000 (UTC)
Date: Thu, 30 Nov 2017 14:54:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20171130145446.3d47b906.cohuck@redhat.com>
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 30 Nov 2017 13:54:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "open list:New World" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i8Rl4Z/Rd7TZ

On Thu, 30 Nov 2017 07:41:59 -0600
Eric Blake <eblake@redhat.com> wrote:

> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').
> 
> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/acpi-utils.h         | 8 ++++----
>  ui/sdl_zoom_template.h     | 8 ++++----
>  audio/paaudio.c            | 4 ++--
>  hw/adc/stm32f2xx_adc.c     | 2 +-
>  hw/block/m25p80.c          | 2 +-
>  hw/char/cadence_uart.c     | 2 +-
>  hw/char/stm32f2xx_usart.c  | 2 +-
>  hw/display/cg3.c           | 2 +-
>  hw/display/dpcd.c          | 2 +-
>  hw/display/xlnx_dp.c       | 2 +-
>  hw/dma/pl330.c             | 2 +-
>  hw/dma/xlnx-zynq-devcfg.c  | 2 +-
>  hw/dma/xlnx_dpdma.c        | 2 +-
>  hw/i2c/i2c-ddc.c           | 2 +-
>  hw/misc/auxbus.c           | 2 +-
>  hw/misc/macio/mac_dbdma.c  | 4 ++--
>  hw/misc/mmio_interface.c   | 2 +-
>  hw/misc/stm32f2xx_syscfg.c | 2 +-
>  hw/misc/zynq_slcr.c        | 2 +-
>  hw/net/cadence_gem.c       | 2 +-
>  hw/ssi/mss-spi.c           | 2 +-
>  hw/ssi/stm32f2xx_spi.c     | 2 +-
>  hw/ssi/xilinx_spi.c        | 2 +-
>  hw/ssi/xilinx_spips.c      | 2 +-
>  hw/timer/a9gtimer.c        | 2 +-
>  hw/timer/cadence_ttc.c     | 2 +-
>  hw/timer/mss-timer.c       | 2 +-
>  hw/timer/stm32f2xx_timer.c | 2 +-
>  hw/tpm/tpm_passthrough.c   | 2 +-
>  hw/tpm/tpm_tis.c           | 2 +-
>  migration/rdma.c           | 2 +-
>  target/arm/translate-a64.c | 2 +-
>  target/s390x/kvm.c         | 2 +-
>  tests/tcg/test-mmap.c      | 2 +-
>  34 files changed, 42 insertions(+), 42 deletions(-)

> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index b03f583032..06d06010a4 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -58,7 +58,7 @@
>      if (DEBUG_KVM) {                          \
>          fprintf(stderr, fmt, ## __VA_ARGS__); \
>      }                                         \
> -} while (0);
> +} while (0)
> 
>  #define kvm_vm_check_mem_attr(s, attr) \
>      kvm_vm_check_attr(s, KVM_S390_VM_MEM_CTRL, attr)

Acked-by: Cornelia Huck <cohuck@redhat.com>
