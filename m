Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp90190njl;
        Tue, 8 Oct 2024 03:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUp6g6GmQAfCxC9WZvudaaHmBEKPLBAmJ3mWBJkMdzItyJctR6FrEv8GnIzOyPBgg8XwEN1f5KiIhdiLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFyzVpiFXpH3W8W8YmBkOTeeWFeIPJnrfKTZFlC+32KNTMncXpnKVJ/RhCSAm/nFnzAwIrj
X-Received: by 2002:a5d:69c1:0:b0:37c:c832:cf95 with SMTP id ffacd0b85a97d-37d0e8f0f03mr10892102f8f.50.1728383441844;
        Tue, 08 Oct 2024 03:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728383441; cv=none;
        d=google.com; s=arc-20240605;
        b=izfUgWI2SrUPFK/gjEHSeaPiOslXsrraJNwoN7KTlGuILUXTNKGhJIcJGSjaCIq2jW
         xT7k2wToCDuQoqCFrwmCOrDsfbv18morEl9ao+vsd33xy0JUqJm1S79NzawMMoJbB8tn
         bATy1ZZZ4nPWxs/EvFef4GuJLdewlF3uew+eVRhlIcid8gFs6Ksl05xXw83bijnHxzSL
         Uvsbnjmo0Qq8+Tekgzdw3vRN3I6wEsXzJv8ygVSmft/z5uqYDT8ZSW6+EiokUYsP42jJ
         aIASEfmtv04G2LUtq3TWS6XwywSmMGdoQ1a5MmGMI2VhvCd+VmRf+xAJwOgZrzBuH/yg
         n8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=4JSCiKZ8dc+zqAAlgPHV68ABcoQP7faBNQAAzoDY6yY=;
        fh=i67y20WhMIajIU6LRj9RX8HIHHlxm8AArte7kFnVDDg=;
        b=Tx272X3/Gudur8/dBDu0ec++/CWAaQPNBWQdkBLWj+yKQZchgzQ+PmRzhB+ZuC9wff
         sMRhHKB9OPubWXsxks8qHUZGmLeHZ0iCswcxayTsrEqSQcCaWNQRRuL/GonNOwApNHVH
         /aEgzfno9rGGvA61rnpGbY3uVFCXYqxqAaeYcDuoXGvk4AeaA/ly1rKhizeXYjWfxlVN
         ZRriYVPSv2eJfzSkI1O+rzrsa2rnREJAELoqZSoVGHpVAS2dF4fXEtAvcAwFrRMoY5A5
         gXWUdR/x/8tcsoz3wAgUmedt+i9IyjLbNFDv2FNRdCB9YMlrMZD2qc0gUtWgl/KozaO6
         R9Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d16b992acsi3371019f8f.982.2024.10.08.03.30.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 03:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNBy71NNgz6GFS5;
	Tue,  8 Oct 2024 18:26:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D6A581402C6;
	Tue,  8 Oct 2024 18:30:40 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 8 Oct
 2024 12:30:39 +0200
Date: Tue, 8 Oct 2024 11:30:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>
Subject: Re: [RFC v2 00/12] Introduce Hybrid CPU Topology via Custom
 Topology Tree
Message-ID: <20241008113038.00007ee4@Huawei.com>
In-Reply-To: <20240919061128.769139-1-zhao1.liu@intel.com>
References: <20240919061128.769139-1-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: arr/ky/hBJeE

On Thu, 19 Sep 2024 14:11:16 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:


> -smp maxsockets=1,maxdies=1,maxmodules=2,maxcores=2,maxthreads=2
> -machine pc,custom-topo=on \
> -device cpu-socket,id=sock0 \
> -device cpu-die,id=die0,bus=sock0 \
> -device cpu-module,id=mod0,bus=die0 \
> -device cpu-module,id=mod1,bus=die0 \
> -device x86-intel-core,id=core0,bus=mod0 \
> -device x86-intel-atom,id=core1,bus=mod1 \
> -device x86-intel-atom,id=core2,bus=mod1 \
> -device host-x86_64-cpu,id=cpu0,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=0 \
> -device host-x86_64-cpu,id=cpu1,socket-id=0,die-id=0,module-id=0,core-id=0,thread-id=1 \
> -device host-x86_64-cpu,id=cpu2,socket-id=0,die-id=0,module-id=1,core-id=0,thread-id=0 \
> -device host-x86_64-cpu,id=cpu3,socket-id=0,die-id=0,module-id=1,core-id=1,thread-id=0

I quite like this as a way of doing the configuration but that needs
some review from others.

Peter, Alex, do you think this scheme is flexible enough to ultimately
allow us to support this for arm? 

> 
> This does not accommodate hybrid topologies. Therefore, we introduce
> max* parameters: maxthreads/maxcores/maxmodules/maxdies/maxsockets
> (for x86), to predefine the topology framework for the machine. These
> parameters also constrain subsequent custom topologies, ensuring the
> number of child devices under each parent device does not exceed the
> specified max limits.

To my thinking this seems like a good solution even though it's a
bunch more smp parameters.

What does this actually mean for hotplug of CPUs?  What cases work
with this setup?
 
> Therefore, once user wants to customize topology by "-machine
> custom-topo=on", the machine, that supports custom topology, will skip
> the default topology creation as well as the default CPU creation.

Seems sensible to me.

Jonathan
