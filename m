Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp180792ejc;
        Fri, 27 Oct 2023 06:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxk9boTqCtN3xr9H8/ikX1cJmqopAIu7pgUaTfPOp9ivqVx/tkbVOM3z8+zmYqtkTbH7Fu
X-Received: by 2002:a05:620a:4707:b0:778:a656:e352 with SMTP id bs7-20020a05620a470700b00778a656e352mr3552391qkb.11.1698411944280;
        Fri, 27 Oct 2023 06:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698411944; cv=none;
        d=google.com; s=arc-20160816;
        b=S9Gz0k7lbqHdnOb/8PBQ/7tGYv4JPnXJCKn0rWDIoQa09+LjPoPa0eS+sO7rbiP9HT
         zD5Wqrb3LtcP1AIa5GjUv5CByvAWXIMiMkCJWaUA8AeLO/qklTf/PCK9kflBo91Pk0xV
         Zd1uiCoU3NJVhxojsRZDgBZyD/wX/CubFYii5EjkfrTGrIYJYHB93qSc5baGaBlLSzny
         q0/luKhpGy8E22kO3kBcTQnewFrHstEDqYLOK3gEVQNBpnlPprB2IUz5azv8rkaZgEHB
         2dqP8iziLHDejjBNFKhNGFNsY2rJuq1LTRKyR0+k6GvjE+Vw93v1g0llfhjsyynG0b91
         v/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=zPQjhoQ1E5USycJ//Pc6ErxRJzo/AyNfPGhonSaOKxM=;
        fh=yBg5jTax3bX/nm/oKv3FgmG4/dEof1Pt7099yXc4tJI=;
        b=SPz61gMW87sjlKR49R4TTp5Gu8d6VjpWE6k6TWVc/zs+3fDdFUO8ZN0K4Lt8+B+DGz
         Wkw7l7lpyKWJ85phewdX//sMvNUI33OtEHiv6VD60VPVe1gOvxfAqb7l67AXsrWNhxzc
         uKa9cB/DqfwVNeiSuvNmmlkU6z3GVCuobO0ZCxgEm+YpwwLMCMs+4seuXOMceI341K81
         MIN67NulSzaekZnbXOkVtX47rQpclagk5HxZ8pFkW2/Mk2HSpvNrL4d1tt9j44xPDBFa
         aUmn8Qwq2Yvo8a65WMKBhpn5BRE27pBkwdTYZMPcWPuPNRMLM2gbKU6tdrDYZQEjnlSq
         NZtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZvkHH2He;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x20-20020ae9f814000000b007758709cfefsi651695qkh.215.2023.10.27.06.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZvkHH2He;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698411943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPQjhoQ1E5USycJ//Pc6ErxRJzo/AyNfPGhonSaOKxM=;
	b=ZvkHH2He5/c7aYKZ2f+4D2r7esKIBVMdCl/6gBwPaPiFnIZBVjZS5NDs6knqtAM/6SFtfX
	Yn+DCGpfhwZYB0p23Ea0nBMdyDS6bzmh4cq53khZYDVB2LD2sY1BqwvBzRvt7wCexLhtgf
	ciglKLwKWZ+zW0RWr6nI4NQlyTv3jQ8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-kGt6F7hMOReSg1SeHq6Osw-1; Fri, 27 Oct 2023 09:05:40 -0400
X-MC-Unique: kGt6F7hMOReSg1SeHq6Osw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a62adedadbso145665866b.1
        for <alex.bennee@linaro.org>; Fri, 27 Oct 2023 06:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698411939; x=1699016739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPQjhoQ1E5USycJ//Pc6ErxRJzo/AyNfPGhonSaOKxM=;
        b=JSlFz0vI77AtWs/f5eXNTXhuqC9uWHveyab2xsfnATseCvf+E8X77yVXWGPnuMFdvw
         JZg26O5lkZawNhmFLc+WGkcPz1zXKrJwZZ7mwqmDT7ELzLfsh1Ifs9/5lLy/cPjE6pgV
         0LD9Kt2yCYPW1m6p2vm7D9OjWwKQgpf5ghYEEw21ZdBCkRQMx2AH/mZSwJor0ACwoPj9
         Zk9a3kbgcxgbHmqkfH9SDnDRYPOpUtT/2IzX0q200Tv6lNJf+Ow1nwisx5VeYc3mUQVc
         HexGCmW3hYnb2jWUczqSx52kUHdLZSjyHlg1q2vZPobQBYmy8fevpe4HyOHTtr2D+vfl
         k/3w==
X-Gm-Message-State: AOJu0Yzec+vKYz5HXH8IQRf+WBB1UMQBEV+0AfF8cbat4ItiUuC/ZYWL
	ibSt8gjSZr586HKU9Meoe3zY+QQL7lMt/55sFnDSGjYd4D6m6uLM0B/iWpvSGgmSkSpwU/mFOW/
	NqyMXWikKrg06Mztp
X-Received: by 2002:a17:907:72c5:b0:9b2:f941:6916 with SMTP id du5-20020a17090772c500b009b2f9416916mr2006921ejc.17.1698411939333;
        Fri, 27 Oct 2023 06:05:39 -0700 (PDT)
X-Received: by 2002:a17:907:72c5:b0:9b2:f941:6916 with SMTP id du5-20020a17090772c500b009b2f9416916mr2006879ejc.17.1698411938913;
        Fri, 27 Oct 2023 06:05:38 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id dc17-20020a170906c7d100b0098e34446464sm1180550ejb.25.2023.10.27.06.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 06:05:38 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:05:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <linuxarm@huawei.com>
Subject: Re: [PATCH V6 3/9] hw/acpi: Add ACPI CPU hotplug init stub
Message-ID: <20231027150536.3c481246@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231013105129.25648-4-salil.mehta@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
	<20231013105129.25648-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Y7nemikEdeOb

On Fri, 13 Oct 2023 11:51:23 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.

merge this with 4/9 that actually requires this to be done. 

> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>      return;
>  }
>  
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}
> +
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>  {
>      return;
