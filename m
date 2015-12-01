Received: by 10.182.158.201 with SMTP id ww9csp2294825obb;
        Tue, 1 Dec 2015 05:06:32 -0800 (PST)
X-Received: by 10.55.79.69 with SMTP id d66mr66964717qkb.76.1448975187845;
        Tue, 01 Dec 2015 05:06:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si39824960qgi.84.2015.12.01.05.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Dec 2015 05:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a3kdX-0000RX-H4
	for alex.bennee@linaro.org; Tue, 01 Dec 2015 08:06:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3kcv-0008Jy-AL
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 08:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1a3kcs-0004dE-4X
	for qemu-devel@nongnu.org; Tue, 01 Dec 2015 08:05:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1a3kcj-0004bR-27; Tue, 01 Dec 2015 08:05:37 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 73F3E344ECB;
	Tue,  1 Dec 2015 13:05:36 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB1D5XgE026467; Tue, 1 Dec 2015 08:05:34 -0500
Date: Tue, 1 Dec 2015 14:05:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20151201140532.340805f8@nial.brq.redhat.com>
In-Reply-To: <565D95F8.5040805@huawei.com>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>
	<20151201124127.1045c90c@nial.brq.redhat.com>
	<565D95F8.5040805@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, graeme.gregory@linaro.org,
	mst@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-devel] [PATCH v3 3/8] hw/arm/virt-acpi-build: Add power
 button device in ACPI DSDT table
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
X-TUID: 0bDafFRsBADD

On Tue, 1 Dec 2015 20:43:36 +0800
Shannon Zhao <zhaoshenglong@huawei.com> wrote:

> Hi Igor,
> 
> On 2015/12/1 19:41, Igor Mammedov wrote:
> > On Mon, 16 Nov 2015 21:23:04 +0800
> > shannon.zhao@linaro.org wrote:
> > 
> >> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >> > 
> >> > Add power button device in ACPI DSDT table.
> >> > 
> >> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> > Reviewed-by: Wei Huang <wei@redhat.com>
> >> > Tested-by: Wei Huang <wei@redhat.com>
> >> > ---
> >> >  hw/arm/virt-acpi-build.c | 13 +++++++++++++
> >> >  1 file changed, 13 insertions(+)
> >> > 
> >> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> > index bf6b934..b25c90b 100644
> >> > --- a/hw/arm/virt-acpi-build.c
> >> > +++ b/hw/arm/virt-acpi-build.c
> >> > @@ -340,6 +340,18 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
> >> >      aml_append(scope, dev);
> >> >  }
> >> >  
> >> > +static void acpi_dsdt_add_power_button(Aml *scope)
> >> > +{
> >> > +    Aml *dev = aml_device("PWRB");
> >> > +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> >> > +    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> >> > +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >> > +    Aml *method = aml_method("_STA", 0);
> >> > +    aml_append(method, aml_return(aml_int(0x0F)));
> >> > +    aml_append(dev, method);
> > since _STA always returns 0xF you can just drop it altogether,
> > as _STA == 0xF is implied if it's not present.
> > 
> 
> Yes, but I think adding this is harmless and make the return value explicit.
It's useless and consumes several bytes, it's better to drop it unless you have to have it.


> Thanks,

