Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp743034wrg;
        Mon, 20 May 2019 16:22:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJ0TyCnpVSDfL0N9z1i0sHB/tPjQmcMpwoJ8H84r2j5Hn1dLOvJfoMdooS+CQ7ExHS1noZ
X-Received: by 2002:a17:906:7d16:: with SMTP id u22mr42245700ejo.85.1558394535117;
        Mon, 20 May 2019 16:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558394535; cv=none;
        d=google.com; s=arc-20160816;
        b=rMTX8329Sf05X/2mWOQmu/CJbxCguaM5yVrAfrWEinLLVQfftO3OI8t4ILZu/4q9tt
         TsRrSd+rYIC3A+KNMlEjj9Rq3UYUfwWFXEEH7Y4mQHNVMBiq6V3Wa7gAreCUXMbqDppK
         EG01Pi9GYAvHD4X3ih3Of855lEx+agC6z//2tpte9BzZ5CzqX3f2ebjJCWsVsrlQa36d
         HiQONGOMPjYy/Ri/sIm+BPArxJDn+IeGTqDBW4BQrgxm8o/tsY7tbEWHXTxwf7/W4CMb
         0+oN0ChounXPFN2ZJw/Jt3QxGy9XEYMI5asNKp48kYNaKBeWbCMq/u1LBRonO920UQ+f
         Ecgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=/K1CzhcIoF7fjAc30rHRUsge+GK+glXAnsnZpkxETzA=;
        b=laDcDv6xamLOZN7kA+qpNeHAxXC4DnywnsXviLu45ZbLq9AfmfLITaEB6oYVQnBuJ6
         BykAVpyDemyPCtVX2fHaqVxCqbZAIcJVhfrZ9Juc13quZzEB6mYsYdHGiIaKG/Ihy5Qb
         p+3Zr9natR6S48EDJ9yCGVv7EUgTXFSMZ4uTBLEjIs8NizUn7zdG6QlsizdT7dmbILvS
         Wk6G0ad6EjfvGXmkxuk9m19tNZTj/xEs4T9FTstHrCLOnPDbTGnwmPrcdwiliY6Ff0Du
         tv9US0ZxEUYQMpoJ+zi5BJ4AZZd2RwDNXbsxbnzZJ6VLHG+6UElp7aQ3H376PJtclBc2
         TmVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i42si2593213ede.114.2019.05.20.16.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 16:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSrbi-0008GX-45
	for alex.bennee@linaro.org; Mon, 20 May 2019 19:22:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQs-0007SK-7g
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQr-00087H-BK
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:02 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrQr-000879-7g
	for qemu-arm@nongnu.org; Mon, 20 May 2019 19:11:01 -0400
Received: by mail-qt1-f194.google.com with SMTP id j53so18342654qta.9
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 16:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=/K1CzhcIoF7fjAc30rHRUsge+GK+glXAnsnZpkxETzA=;
	b=NlpPW2GzZfYc1Tapq3rD0srEqjFaI1W7v4atqg3rl6HpF1dlY9GRD2W1Gf+HJNpHYI
	12hMiIFsSH77pJKVCNcoqHRitiwzSJzzGYvI58a8dEElYLDaokxN9qqhJAm5ksMiNXLU
	ExbNjk5Izn1OJnFpAcCuAOvindJImbIsDqlzE9Q30o+y5bqqsKxZAnX1m0VCqqEELwDi
	vOww08lDm64Fbw/DzRXhLPcNIPvpG1LJkPDO0klrKL7WuyPROnwyY2wvkRj9JHbPflyf
	UluEYrw/M1ORXBkWNH14zOFZYPoRtVrteHTTGE3ck15Eqhb4AKuk5eLmck6/YlZfN7PF
	a1jA==
X-Gm-Message-State: APjAAAVFkmT9wwa3Mag8Ly9fdyGkWTDa6bmz0HXVKYzy5ZKP2Y6mzINF
	GuwDVVDXJ1MgZNKJNslXdKM1XQ==
X-Received: by 2002:a0c:d909:: with SMTP id p9mr49615208qvj.42.1558393860861; 
	Mon, 20 May 2019 16:11:00 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	e54sm11315139qtc.26.2019.05.20.16.10.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:11:00 -0700 (PDT)
Date: Mon, 20 May 2019 19:10:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190419003053.8260-3-richardw.yang@linux.intel.com>
References: <20190520231008.20140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190520231008.20140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
Subject: [Qemu-arm] [PULL v2 16/36] hw/arm/virt-acpi-build: remove
 unnecessary variable mcfg_start
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
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxpbfE4asJbI
Message-ID: <20190520231059.QcNqXpVZY4KIEaCmIC_VrxSe6dnVS9SOgVqoUbVHG6E@z>

From: Wei Yang <richardw.yang@linux.intel.com>

mcfg_start points to the start of MCFG table and is used in
build_header. While this information could be derived from mcfg.

This patch removes the unnecessary variable mcfg_start.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190419003053.8260-3-richardw.yang@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bf9c0bc2f4..12dbaf3846 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -552,7 +552,6 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const MemMapEntry *memmap = vms->memmap;
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-    int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
     mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
@@ -563,8 +562,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     mcfg->allocation[0].end_bus_number =
         PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
 
-    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /* GTDT */
-- 
MST

