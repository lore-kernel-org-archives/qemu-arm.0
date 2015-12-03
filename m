Received: by 10.182.158.201 with SMTP id ww9csp30701obb;
        Thu, 3 Dec 2015 07:37:42 -0800 (PST)
X-Received: by 10.55.73.201 with SMTP id w192mr11567541qka.17.1449157062397;
        Thu, 03 Dec 2015 07:37:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j78si90490qge.116.2015.12.03.07.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Vx0-0003LZ-11
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:37:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4Vwy-0003LU-Lf
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:37:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a4Vws-0006ub-UN
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:37:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a4Vws-0006uX-OY; Thu, 03 Dec 2015 10:37:34 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 57DD24258A;
	Thu,  3 Dec 2015 15:37:34 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB3FbVu8002269; Thu, 3 Dec 2015 10:37:32 -0500
Date: Thu, 3 Dec 2015 16:37:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: shannon.zhao@linaro.org
Message-ID: <20151203163730.66c769f7@nial.brq.redhat.com>
In-Reply-To: <1447680189-2128-6-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-6-git-send-email-shannon.zhao@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, graeme.gregory@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-arm] [PATCH v3 5/8] hw/acpi/aml-build: Add a wrapper for
 GPIO Interrupt Connection
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
X-TUID: r+Zx0+qFUufX

On Mon, 16 Nov 2015 21:23:06 +0800
shannon.zhao@linaro.org wrote:

[...]
> + * ACPI 5.0: 19.5.53
> + * GpioInt(GPIO Interrupt Connection Resource Descriptor Macro)
> + */
> +Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
> +                  AmlLevelAndEdge level_and_edge,
> +                  AmlActiveHighAndLow high_and_low, AmlShared shared,
> +                  AmlPinConfig pin_cfg, int16_t debounce_timeout,
> +                  int32_t pin_num[], int32_t pin_count, const char *name,
also we never going to change pin_num[], so could be const

[...]

