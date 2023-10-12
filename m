Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp864476ejc;
        Thu, 12 Oct 2023 07:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuuLpgeFvJyKm7BYuXNR1R6u2Ui+UX9ECU6OGPC6JN7NwjLWXIVA+Gn7BYACmpMALbO5nU
X-Received: by 2002:adf:a2d9:0:b0:32d:8373:f4c1 with SMTP id t25-20020adfa2d9000000b0032d8373f4c1mr4491078wra.27.1697122148103;
        Thu, 12 Oct 2023 07:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697122148; cv=none;
        d=google.com; s=arc-20160816;
        b=oSzTNxlFwNjV7vmiX63B3YxNT/4P/GompESIHiaTOzcC6MuJdk8ELVpKp482aCXssB
         0+jNF8UlUuGatT93TO/Nf+B0lZtsX2jWO+w6uINejYgwejb6ht+0x0XhXUHbz+l0VO8N
         q2KjO0//1/eiDcIti06BgrPW1SVs1UBlEGGQ+Xi460W5vBmdYs6lacalOO/M7z8BlPK3
         1pkcndGTSrGVCgf22g5hpiErwLGQC5k5Egd62KdqQjzhGwtSPb8JUsaRLnwY6honVtZU
         q8XRJlOzjcvLgFmsDO9TOAl/kyZjPAj2Iw9xFKnBQX+WLBlIFNAWIZUqn9L4aWCRIxBn
         jpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=pwN75t4op2bKYoBkdhuCpNGY5D46992g+QAb8BlJc4Y=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=MZL6ugAQr76JutUjrdAXHIquEeMtTTaPpBsuOZH9S49ahYhLC59H++4u8fM19MIM7q
         SFguxqTaCg3pz4DlsDuzR0W1f9SC33eGoJlO60VuG/k6A2WVpoHCLnhCoZPLDiu8v8wv
         yw7+ar4pTwFkT+K+HyyEr2nrhZ7Kb9bZfyQeZdZibLGmxrnlbKrf1/qEaH5HpUvcv9Ys
         a/TG5QFetyM1+4VBZVqeRGzhKiEn4Xd+oEWDiJ6fHTivnBX4aCvlSBVTelvLPNFRLHme
         km+7LsohKkklpZiWTorubJRw5nDEy38ME9jhV+oLoLIYVUJtIOIki2PNfXNSFrVanw7S
         foCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r7-20020a056000014700b0032339bf4a8dsi6990189wrx.837.2023.10.12.07.49.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5svw17w8z687hF;
	Thu, 12 Oct 2023 22:48:44 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 12 Oct
 2023 15:49:05 +0100
Date: Thu, 12 Oct 2023 15:49:04 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V5 5/9] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Message-ID: <20231012154904.0000728e@Huawei.com>
In-Reply-To: <20231011194355.15628-6-salil.mehta@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
	<20231011194355.15628-6-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: XX4JeY/DkKre

On Wed, 11 Oct 2023 20:43:51 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPUs Control device(\\_SB.PCI0) register interface for the x86 arch is based on
> PCI and is IO port based and hence existing CPUs AML code assumes _CRS objects
> would evaluate to a system resource which describes IO Port address. But on ARM
> arch CPUs control device(\\_SB.PRES) register interface is memory-mapped hence
> _CRS object should evaluate to system resource which describes memory-mapped
> base address. Update build CPUs AML function to accept both IO/MEMORY region
> spaces and accordingly update the _CRS object.
> 
> Legacy CPU Hotplug uses Generic ACPI GPE Block Bit 2 (GPE.2) event handler to
> notify OSPM about any CPU hot(un)plug events. GED framework uses new register
> interface for cpu-(ctrl)dev. Make AML for GPE.2 event handler conditional.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
