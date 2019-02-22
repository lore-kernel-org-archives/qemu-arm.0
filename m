Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6778403wrx;
        Fri, 22 Feb 2019 02:19:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbpdgD1BePv9Rkl5m0UBQh6UjC2tlKRCd/M4ciQGUlSwPhjiCn1EATUfqXV/oTeKkcCKtNx
X-Received: by 2002:a25:84c7:: with SMTP id x7mr2600548ybm.370.1550830764216;
        Fri, 22 Feb 2019 02:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550830764; cv=none;
        d=google.com; s=arc-20160816;
        b=WZV9hPj3X4rKSgUOopk5664Wu7xMMKaBSSz2BaXSsg9Z1krbumHRC7dYojNa8JKefX
         NNOYXbq5+ZiEXYZjCdYIrKVcXMOHR1shatq+7+JKRyQdze5S9AXDyHhjFxgSWkgd2jXp
         SrUD6Y5jhq959ha4tFiA2K+t6wgqzjDNI4BcnqFkWa+524IqU+YnAoTQf3Ho9Iq3wk/c
         pd353+gJtpRnYkTGEuKD4k2xi0Vcfaju6FntQaI1JfIWH/TnpIPfJIuHASQLO1foiV9E
         Efae/P00wb0eRqBMiANPAwI+lRWhRk3k/Sb0wWvIfu18Zljr+Mewd/73/pQBZBMcQ92L
         1TFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=nt8ncaB3lU8MY2Kc/ILzDImAvc7keZWz98p5yLXrFjI=;
        b=WGnvz0ZcBzjN6js018NqZKnvsDCcUCoeAvFWP/sAeNoJZNYvqei2vyCCgMqpa8f55k
         GcN78KU9XL+Rz0Lfxof3deXEZDwukoUDItE0nbIxbfFy0V1MfZBQfgAg319xUhOaXla2
         8FeOjJBZJ4UUTYqt5+OuoJRAOqHZL3l9Ye+AJztG91aH9ItVGUDx8RwB+QyKfcEHQ231
         4eH8VsDuB/ZBEaYhAN9zHBl3/VqRPnn2pwTLFHWisW80fjQTb2KRkTrGqnpA0qRVgnSq
         7B3vjh0EajPU3T+eGETtjr2hwMwmOgmgLRJnUt6vwhQ8ywfJ80X7HZyMf9djYdjmvY+z
         KB8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si659505ywb.237.2019.02.22.02.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 02:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx7vP-0000Ra-OB
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 05:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gx7vH-0000RB-Pb
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 05:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gx7vG-0002LM-J3
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 05:19:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53612)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gx7vG-0002DD-6a; Fri, 22 Feb 2019 05:19:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6FDE3082E07;
	Fri, 22 Feb 2019 10:19:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74995600CD;
	Fri, 22 Feb 2019 10:19:00 +0000 (UTC)
Date: Fri, 22 Feb 2019 11:18:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222111859.2703fc7f@redhat.com>
In-Reply-To: <20190220224003.4420-5-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-5-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 22 Feb 2019 10:19:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 04/17] hw/boards: Add a MachineState
 parameter to kvm_type callback
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbLmSyWw7Vv5

On Wed, 20 Feb 2019 23:39:50 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> On ARM, the kvm_type will be resolved by querying the KVMState.
> Let's add the MachineState handle to the callback so that we
> can retrieve the  KVMState handle. in kvm_init, when the callback
> is called, the kvm_state variable is not yet set.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> [ppc parts]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v6 -> v7:
> - add a comment for kvm_type
> - use machine instead of ms in the declaration
> - add Peter's R-b
> ---
>  accel/kvm/kvm-all.c   | 2 +-
>  hw/ppc/mac_newworld.c | 3 +--
>  hw/ppc/mac_oldworld.c | 2 +-
>  hw/ppc/spapr.c        | 2 +-
>  include/hw/boards.h   | 5 ++++-
>  5 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index fd92b6f375..241db496c3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1593,7 +1593,7 @@ static int kvm_init(MachineState *ms)
>  
>      kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
>      if (mc->kvm_type) {
> -        type = mc->kvm_type(kvm_type);
> +        type = mc->kvm_type(ms, kvm_type);
>      } else if (kvm_type) {
>          ret = -EINVAL;
>          fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 98461052ac..97e8817145 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -564,8 +564,7 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
>  
>      return NULL;
>  }
> -
> -static int core99_kvm_type(const char *arg)
> +static int core99_kvm_type(MachineState *machine, const char *arg)
>  {
>      /* Always force PR KVM */
>      return 2;
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 284431ddd6..cc1e463466 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -420,7 +420,7 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
>      return NULL;
>  }
>  
> -static int heathrow_kvm_type(const char *arg)
> +static int heathrow_kvm_type(MachineState *machine, const char *arg)
>  {
>      /* Always force PR KVM */
>      return 2;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index abf9ebce59..3d0811fa81 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2920,7 +2920,7 @@ static void spapr_machine_init(MachineState *machine)
>      }
>  }
>  
> -static int spapr_kvm_type(const char *vm_type)
> +static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>  {
>      if (!vm_type) {
>          return 0;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 05f9f45c3d..ed2fec82d5 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -156,6 +156,9 @@ typedef struct {
>   *    should instead use "unimplemented-device" for all memory ranges where
>   *    the guest will attempt to probe for a device that QEMU doesn't
>   *    implement and a stub device is required.
> + * @kvm_type:
> + *    Return the type of KVM corresponding to the kvm-type string option or
> + *    computed based on other criteria such as the host kernel capabilities.
>   */
>  struct MachineClass {
>      /*< private >*/
> @@ -171,7 +174,7 @@ struct MachineClass {
>      void (*init)(MachineState *state);
>      void (*reset)(void);
>      void (*hot_add_cpu)(const int64_t id, Error **errp);
> -    int (*kvm_type)(const char *arg);
> +    int (*kvm_type)(MachineState *machine, const char *arg);
>  
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;

