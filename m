Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1003720njh;
        Fri, 30 May 2025 02:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeNHPHwe7OvXaEYexwA2IaAD5iXyhxPQqglPyBn0XhQtQ1R42s2Pe0RzLsNBTz+4eOCpHywVW2I9BIqA==@linaro.org
X-Google-Smtp-Source: AGHT+IGK3RNDjNAFvzQ84cTUa0nh6CIOjidhZEVk26RFbsAsX5BPxevYt8++ASrXukXFbFKs8b0Z
X-Received: by 2002:a05:6000:2209:b0:3a4:f70e:fa3f with SMTP id ffacd0b85a97d-3a4f7a3c172mr1733810f8f.8.1748596016104;
        Fri, 30 May 2025 02:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748596016; cv=none;
        d=google.com; s=arc-20240605;
        b=Ei0U0AL27n7ATBrIpVIjtxBzHgPY/faZZpeeYagh8X8E+NNj9uHF0TpVBXsXC5xfY+
         YKM/c3YPBaxsYY02tDPFxt/0udNrNU8KalZ+TWOe0lG41yOiihT3b/CdUnKv2d2ZGyqW
         h2KfXLYkiOBLYGU7y/e5uGVnmDimF2WbSuROlu/4p/A31d+4iItDv614Vmam85ohuLz0
         rZt2aMo6M8DbvdNRXhrZVmHQ+aPU3O00++PEDSpqDBQ9aoVfKnLPEcxh8MFesOsJLPCh
         TBA3JNF/C4JSta87PFQV6fGk9ABY/grxOJxhnFy6bt/2SV62kudTY8T2nw8h+eEmDUqO
         g+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=aWfCFoE3X/4neZ6AuIn+UAjbVvSSad5DFhJa0OXFXZc=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=gWdRU+QbRuiE/E0IA1P7CM2BEKVzqLLIcElYc/ZYgjPDoWQg2ntoDJW8qe0nr61/EL
         zPdoIDF5DnVDV71FgdEiIjE+JsY4uSskQCMqYqxh4F8chCoilf4ATv/kVl0fwOL50H88
         fwcqqGMg6qfu61UsdKrFPF8PD7Q6rcodMMIs7P8NHSiPXkhPTPlRroXpbC7K0ppVpZTd
         W08Id3fdJfGzQdUQyTrfIba5svBl+735bUFg/L5AFq9emIvpfe9M/Zf6viD2HdR113pK
         XiXV81YmsFSmqasLiTSrHnm4cwV0YwK4z3MHSB3LOHqo5qpD02+YGefG6l7m4261uO6/
         rrvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f008bd5csi2441271f8f.536.2025.05.30.02.06.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 02:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7y296L0Xz6K619;
	Fri, 30 May 2025 17:03:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 693401402FC;
	Fri, 30 May 2025 17:06:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 11:06:52 +0200
Date: Fri, 30 May 2025 10:06:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 03/25] hw/acpi: Rename and move
 build_x86_acpi_pci_hotplug to pcihp
Message-ID: <20250530100651.000042bb@huawei.com>
In-Reply-To: <20250527074224.1197793-4-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-4-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: FjiqdukUe/uI

On Tue, 27 May 2025 09:40:05 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We plan to reuse build_x86_acpi_pci_hotplug() implementation
> for ARM so let's move the code to generic pcihp.
> 
> Associated static aml_pci_pdsm() helper is also moved along.
> build_x86_acpi_pci_hotplug is renamed into build_acpi_pci_hotplug().
> 
> No code change intended.
> 
> Also fix the reference to acpi_pci_hotplug.rst documentation
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Indeed moves the code as described...
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
