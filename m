Received: by 10.182.158.201 with SMTP id ww9csp268929obb;
        Wed, 6 Jan 2016 16:19:05 -0800 (PST)
X-Received: by 10.140.106.228 with SMTP id e91mr132226949qgf.59.1452125945942;
        Wed, 06 Jan 2016 16:19:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si45061055qka.125.2016.01.06.16.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 16:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:56449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGyID-0002UK-KX
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 19:19:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGyHt-0002CI-Or
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 19:18:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aGyHs-0006wF-Rx
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 19:18:45 -0500
Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233]:36445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aGyHs-0006wB-Nf; Wed, 06 Jan 2016 19:18:44 -0500
Received: by mail-io0-x233.google.com with SMTP id g73so36933916ioe.3;
	Wed, 06 Jan 2016 16:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=tIxz6B9fxYbDA8MEL7WW0iPce8WaLG+cHXoEi26pEjI=;
	b=MeYBfs5aGNaMe++sQKkpDRiYDgF0s9FC6JSxp+wG0FKrBUeAGj0apzyNo+mjbuT03y
	Ipm51COOhLgYuBrvIvW9ZssvoDnZ6o95uOPYAfumynv8ug4p+uFV6MkxCtLq+NRVzgri
	3vhZspsSPzq+XpyEPvJYRTBdu3G1AMAaXv/ReyL0BSUSpIjg7byn5vUEFVmCoW6ahcKp
	nSL9Lx1caJED2p+TQmRbUBy5Z+QuNsO+zuyvaCb1iorugDpWOHipHwxpS6Bz+jzp2F9y
	kARzTzI4sKT9KR21tgxRceo2RBRLKuO3WAuOcGOrOlpW+27WkYu66f6wxQ08j8elg4P0
	f8HA==
X-Received: by 10.107.138.164 with SMTP id c36mr94202208ioj.82.1452125924200; 
	Wed, 06 Jan 2016 16:18:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 6 Jan 2016 16:18:14 -0800 (PST)
In-Reply-To: <72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 6 Jan 2016 16:18:14 -0800
X-Google-Sender-Auth: ry-eKzOKNbeykciXji49jGEZk8Q
Message-ID: <CAKmqyKNVMfqJvZ3=X58yB5j8g=wtCzbHe6OU=1L4D3ZunMs3aA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v6 1/6] qdev: get_child_bus(): Use QOM
 lookup if available
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oi6LkxsqwpG6

On Sat, Dec 19, 2015 at 9:43 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> qbus_realize() adds busses as a QOM child of the device in addition to
> adding it to the qdev bus list. Change get_child_bus() to use the QOM
> child if it is available. This takes priority over the bus-list, but
> the child object is checked for type correctness.

This doesn't cause problems for anything else? Is there anything else
with the same name or something where this causes conflicts?

Thanks,

Alistair

>
> This prepares support for aliasing of buses. The use case is SoCs,
> where a SoC container needs to present buses to the board level, but
> the buses are implemented by controller IP we already model as self
> contained qbus-containing devices.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> Currently qbus_realize() ignores errors from object_property_add_child,
> so it is hard to guarantee that the QOM linkage is reliable. If it were
> the case that that object_property_add_child was supposed to be error
> asserting, we could remove the old bus-list strcmp iterator altogether.
>
>  hw/core/qdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index b3ad467..c96c464 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -581,6 +581,12 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>  BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
>  {
>      BusState *bus;
> +    Object *child = object_resolve_path_component(OBJECT(dev), name);
> +
> +    bus = (BusState *)object_dynamic_cast(child, TYPE_BUS);
> +    if (bus) {
> +        return bus;
> +    }
>
>      QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>          if (strcmp(name, bus->name) == 0) {
> --
> 1.9.1
>
>
