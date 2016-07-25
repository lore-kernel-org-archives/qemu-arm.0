Received: by 10.25.21.156 with SMTP id 28csp1243874lfv;
        Mon, 25 Jul 2016 08:52:20 -0700 (PDT)
X-Received: by 10.237.53.19 with SMTP id a19mr29030261qte.67.1469461940044;
        Mon, 25 Jul 2016 08:52:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si18290205qkc.162.2016.07.25.08.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRiB1-0006Vb-Ia
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:52:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi9V-0005rw-RU
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi9T-0003Iz-PM
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:50:44 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi9T-0003It-Jn
	for qemu-devel@nongnu.org; Mon, 25 Jul 2016 11:50:43 -0400
Received: by mail-vk0-x231.google.com with SMTP id s189so249153004vkh.1
	for <qemu-devel@nongnu.org>; Mon, 25 Jul 2016 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3El6+F0yIgYrqCX1ccRKrl90/N8VunGvTBowi6oHeG4=;
	b=H2ZNZo1pdtY32YSeEoZngsvNz32ECM+uzCFH/kS635JJOvyi+YaLUY7QWdCAmHkYuU
	D3D4lDkpJJJg6qwqp41taKo1Hvgfxa5MO8vy7FTDCTwtu/PwbLzxt4SaiamnKfR4RII+
	TTeSHP3FfLPGiBbwn9UqPPyzSEqTLST7wlbE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3El6+F0yIgYrqCX1ccRKrl90/N8VunGvTBowi6oHeG4=;
	b=nI9k6/5TZhXLZgUXy1G2jbQ6+FzWZJ1czGyzDJoTf+V8sM9fwsKcVNMWskB6jE669M
	sN9ZMhcl3RmNX6YhD5e11ceWcklS85RAze+j/o6cJbgT61ViwcN/p6Lgp8M1sOz502JK
	jEP12nKuqrBLYtUXMBNRu3iOgLeBc9eomTn84ZSwXPAA0RLf9KfRp3n93oaGY6GEUW76
	986VdBwcPpQS1nVCymKKrcWTMr0pAgfZ0Wme2B6T7ved1zhIBPdw4yLeTuGzYh0ahTSI
	GLhntP+YuNYhR4udARfnyKofB/HrEZBm90xZX/zZbSqea9W5AqzVkumkN4ulFfgZmTez
	GPVw==
X-Gm-Message-State: AEkooutZsw4p2gm/DCCHv1O3gO8gUCRRQjTebPaHAexMOt12SsatBtNNkGmPlpokd8chb0pe+alQfIzuPvWSO5TF
X-Received: by 10.31.7.8 with SMTP id 8mr8626050vkh.157.1469461843185; Mon, 25
	Jul 2016 08:50:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 08:50:23 -0700 (PDT)
In-Reply-To: <0e07a2d1e31e51a9f9be6ecb7b3a8a5b5108c6c3.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<0e07a2d1e31e51a9f9be6ecb7b3a8a5b5108c6c3.1468279072.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 16:50:23 +0100
Message-ID: <CAFEAcA-2oGjXNmHoPTJSOD6X4zh_tv8AwZGoGAzErVm2QhsasQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [PATCH v1 5/5] xlnx-zynqmp: Set the number of
 priority queues
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /hWyJADAAW1H

On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Set the ZynqMP number of priority queues to 2.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 23c7199..0d86ba3 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -332,6 +332,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>              qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>              qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
>          }
> +        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
> +                                  &error_abort);
>          object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
>          if (err) {
>              error_propagate(errp, err);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
