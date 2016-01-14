Received: by 10.25.159.19 with SMTP id i19csp121829lfe;
        Thu, 14 Jan 2016 15:37:56 -0800 (PST)
X-Received: by 10.140.30.101 with SMTP id c92mr9627891qgc.14.1452814676417;
        Thu, 14 Jan 2016 15:37:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si9929337qgy.13.2016.01.14.15.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 15:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJrSl-0006BC-U4
	for alex.bennee@linaro.org; Thu, 14 Jan 2016 18:37:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJrSk-000696-An
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:37:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aJrSj-0000EK-2O
	for qemu-arm@nongnu.org; Thu, 14 Jan 2016 18:37:54 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:34226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aJrSg-0000E3-Sr; Thu, 14 Jan 2016 18:37:51 -0500
Received: by mail-wm0-x230.google.com with SMTP id u188so3022937wmu.1;
	Thu, 14 Jan 2016 15:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1zV9CrRHe6LytEShPm+Vyzuc5xcnnPuyDq5VUMJx6I8=;
	b=YcOY+o2AxjpKLrZtHhQhbpX6UPv9KndHaYyfkJNvkrOqoy898ZQSoO2+aYVVh7UFKn
	b0HfGXJ7BDCKGDOyssB3QpwrceBFdi1H8Q/eQJZ94uYh6UE6NNRRc2QRIOmcj8hviQJh
	seBKfPbyVnYrpwO7cQrKL9jAeb+ArmAQ3GywNCKf32FHolPFh2XLdVoq3I2BN3xDS196
	EMGa0zxtDE4CZx9R6357m55t/vI1wTldWJa+QakdQe6HDhtY7j9PIZtK5PGh64Zxqz23
	BE6xGso6JIXfhOJf/t1nUEZ1RatAO59AbW8fzEvJ6AcY7lCmauGXI0xHFLos97crGW4e
	GfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1zV9CrRHe6LytEShPm+Vyzuc5xcnnPuyDq5VUMJx6I8=;
	b=ZUYa6EleAIThHV78t14DARsp3vjm7yQ6cX8uDN5o4JFMZY12g4bJzL61D0x3b8T7Ee
	YBJG/fWklALyiBXbaz5iUfupVeZM8y70W/w/E3nNhBV4JN+VesCCLzTEUwLyZHGOeiMk
	6W6spRH3RatYMkePOcQGlVfcf+1fNuL5KuSe/j/LM0BzbShjVyOLDdCC1kjHLfq29Jjg
	b+40fnqPTZn5blV/hdpysbjor0ryygVvlDvllYDmcZXRbN1pMPIKe3KPDtLgGlhL1Qms
	mpiLM0D6UnIb0yxXUtq8dukDgrFJ29+Xzuv1mOmGzvWLJyTsDV+qjkXS7tyIURMOSr4l
	OLNg==
X-Gm-Message-State: AG10YORYLOhLlI97VWpEgwhzPICDsj8FSDgz5BelCVq255/3v483qktRChlsYY7U/m6DwJVe8o4gUS7pkt50jQ==
MIME-Version: 1.0
X-Received: by 10.28.65.193 with SMTP id o184mr25041wma.15.1452814670148; Thu,
	14 Jan 2016 15:37:50 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Thu, 14 Jan 2016 15:37:50 -0800 (PST)
In-Reply-To: <1452779575-32582-13-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
	<1452779575-32582-13-git-send-email-peter.maydell@linaro.org>
Date: Thu, 14 Jan 2016 15:37:50 -0800
Message-ID: <CAPokK=puYvom4LiSp8_poNqFq=oumUwYy7+FEz_CJ9R+USVygQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v3 12/19] qom/cpu: Add MemoryRegion property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 43q0oHxYd126

CC Andrew,

This may be the missing feature for your system_memory for CPU RAM
access problem.

Regards,
Peter

On Thu, Jan 14, 2016 at 5:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Add a MemoryRegion property, which if set is used to construct
> the CPU's initial (default) AddressSpace.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> [PMM: code is moved from qom/cpu.c to exec.c to avoid having to
>  make qom/cpu.o be a non-common object file; code to use the
>  MemoryRegion and to default it to system_memory added.]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  cpus.c            |  4 +++-
>  exec.c            | 14 ++++++++++++++
>  include/qom/cpu.h |  1 +
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/cpus.c b/cpus.c
> index 725a51d..3efff6b 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1375,8 +1375,10 @@ void qemu_init_vcpu(CPUState *cpu)
>          /* If the target cpu hasn't set up any address spaces itself,
>           * give it the default one.
>           */
> +        AddressSpace *as = address_space_init_shareable(cpu->memory,
> +                                                        "cpu-memory");
>          cpu->num_ases = 1;
> -        cpu_address_space_init(cpu, &address_space_memory, 0);
> +        cpu_address_space_init(cpu, as, 0);
>      }
>
>      if (kvm_enabled()) {
> diff --git a/exec.c b/exec.c
> index 0e4f681..5a1b208 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -628,6 +628,20 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
>
>  #ifndef CONFIG_USER_ONLY
>      cpu->thread_id = qemu_get_thread_id();
> +
> +    /* This is a softmmu CPU object, so create a property for it
> +     * so users can wire up its memory. (This can't go in qom/cpu.c
> +     * because that file is compiled only once for both user-mode
> +     * and system builds.) The default if no link is set up is to use
> +     * the system address space.
> +     */
> +    object_property_add_link(OBJECT(cpu), "memory", TYPE_MEMORY_REGION,
> +                             (Object **)&cpu->memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             &error_abort);
> +    cpu->memory = system_memory;
> +    object_ref(OBJECT(cpu->memory));
>  #endif
>
>  #if defined(CONFIG_USER_ONLY)
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index ed23246..2e5229d 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -297,6 +297,7 @@ struct CPUState {
>      CPUAddressSpace *cpu_ases;
>      int num_ases;
>      AddressSpace *as;
> +    MemoryRegion *memory;
>
>      void *env_ptr; /* CPUArchState */
>      struct TranslationBlock *current_tb;
> --
> 1.9.1
>
>
