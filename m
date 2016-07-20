Received: by 10.25.21.156 with SMTP id 28csp1921221lfv;
        Tue, 19 Jul 2016 19:48:45 -0700 (PDT)
X-Received: by 10.55.169.212 with SMTP id s203mr60053043qke.39.1468982925298;
        Tue, 19 Jul 2016 19:48:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r35si386215qkr.75.2016.07.19.19.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 19:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPhYy-0007Ou-NE
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 22:48:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfid-0000Z3-81
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfia-0006ch-0I
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:35 -0400
Received: from exvmail3.skhynix.com ([166.125.252.90]:59112
	helo=invmail3.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bPfiZ-0006bM-MJ; Tue, 19 Jul 2016 20:50:31 -0400
X-AuditID: a67dfc59-f790b6d000004b07-9b-578ecace899c
From: Kwangwoo Lee <kwangwoo.lee@sk.com>
To: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Jul 2016 09:49:01 +0900
Message-Id: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
X-Mailer: git-send-email 2.5.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHLMWRmVeSWpSXmKPExsXCNUdUWff8qb5wgwNHWC0a7oVaLFy1jNni
	9NEOZov/v16xWuzf9o/VYs6ZBywWC7oXslkc793BYjHt1B1Wi6fLfrNazNvwgsmB26PlyFtW
	jzvX9rB5zDsZ6PHk2mYmj/f7rrJ59E3/wBzAFsVlk5Kak1mWWqRvl8CVsfXwXMaC7TwVa86d
	Y25g7OXsYuTkkBAwkVj29ykrhC0mceHeejaY+JlnO5hBbDYBDYlTG+6zdDFycYgIrGaWeNx6
	jQkkwSxQLNG9HaJZWMBFYtfGRWDNLAKqEtMvdoI18wo4S5w7+ACohgNoqJzEggvpIHMkBOaw
	Saxc9p4dYpmkxMEVN1gmMPIsYGRYxSiSmVeWm5iZY6xXnJ1RmZdZoZecn7uJERhqy2r/RO5g
	7GnVP8QowMGoxMPLcawvXIg1say4MvcQowQHs5IIr9B+oBBvSmJlVWpRfnxRaU5q8SFGaQ4W
	JXHeJQtywoUE0hNLUrNTUwtSi2CyTBycUg2Mzwy5RN9yzfTqn73mzzXNDVfULN7965pn7jez
	2sAu6Xn/jc0iy1pn3ChOFFRoEJ95+8Otv+8aJ99xiMxzstW/qfl6ZnZbYOl34a6EOrXV+8wK
	j8nP0pu6hOd6/9ODPIvLtb89lV9k5P1deeGMK1ZyJjwJIjaqxZ9Lrr25lL3gp35Vlv0OZqOb
	SizFGYmGWsxFxYkAvq9dcjECAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LhimlJ0z13qi/c4MJtS4uGe6EWC1ctY7aY
	uqqFyeL00Q5mi3mfT7Fb/P/1itVi/7Z/rBZzzjxgsVjQvZDN4njvDhaLaafusFo8Xfab1WLe
	8rUsFvM2vGBy4PNoOfKW1ePOtT1sHvNOBno8ubaZyeP9vqtsHt9ue3j0Tf/AHMAexWWTkpqT
	WZZapG+XwJWx9fBcxoLtPBVrzp1jbmDs5exi5OSQEDCROPNsBzOELSZx4d56NhCbTUBD4tSG
	+yxdjFwcIgKrmSUet15jAkkwCxRLdG9/ygpiCwu4SOzauAisgUVAVWL6xU6wQbwCzhLnDj4A
	quEAGionseBC+gRGzgWMDKsYRTLzynITM3PM9IqzMyrzMiv0kvNzNzECw2hZ7Z9JOxi/XXY/
	xCjAwajEw8txrC9ciDWxrLgy9xCjBAezkgiv0H6gEG9KYmVValF+fFFpTmrxIUZpDhYlcd7j
	H5XChQTSE0tSs1NTC1KLYLJMHJxSDYxxbRuvPf+9wCTpZNPL569u6aycZvswyHWvT7unwJ9T
	b9a77Xa6perrPr1aJ3RCm2zeOffP0/wuv3ct3louu0Jm9zm1BT/4V1QbshZFX1y4h9f7UM1M
	r9qDSW4ff8WeUXrw6V07w9E2TbY+DcWoazf0npbfuVPrfWOSD98HYdlbp7vFtn7xZ56txFKc
	kWioxVxUnAgAbFdPBR8CAAA=
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.90
X-Mailman-Approved-At: Tue, 19 Jul 2016 22:48:41 -0400
Subject: [Qemu-arm] [RFC PATCH 0/3] add nvdimm support on AArch64 virt
 platform
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
Cc: Hyunchul Kim <hyunchul3.kim@sk.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>,
	Woosuk Chung <woosuk.chung@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWwXwBuR+WF5

This patch series add an evaluation environment of NVDIMM on AArch64
virt platform. Three parts need to be implemented to make this feature
working properly.

1. memory hotplug on arm virt platform
2. configurable ACPI IO base and size both for i386 and arm platform
3. enable NVDIMM on arm virt platform

The memory hotplug is required to recognize DIMM type memory and this
is also used for NVDIMM device recognition.

The ACPI IO base and size need to be changed on creating ACPI NFIT
because arm platform uses memory-mapped IO which is different from
i386 platform. Thus, this patch set includes the changes of setting
ACPI IO base and size during NVDIMM initialization.

The last part enables NVDIMM on arm virt platform. The feature is
disabled by default. So explicit option - nvdimm=on - is required to
enable the feature.

Kwangwoo Lee (3):
  hw/arm/virt: add hotplug memory support
  nvdimm: use configurable ACPI IO base and size
  hw/arm/virt: add nvdimm emulation support

 default-configs/aarch64-softmmu.mak |   3 +
 hw/acpi/nvdimm.c                    |  23 ++++--
 hw/arm/virt-acpi-build.c            |   5 ++
 hw/arm/virt.c                       | 144 ++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c                |   2 +-
 hw/i386/pc_piix.c                   |   8 +-
 hw/i386/pc_q35.c                    |   8 +-
 include/hw/arm/virt-acpi-build.h    |   1 +
 include/hw/arm/virt.h               |   7 ++
 include/hw/mem/nvdimm.h             |  17 ++++-
 10 files changed, 206 insertions(+), 12 deletions(-)

-- 
2.5.0

