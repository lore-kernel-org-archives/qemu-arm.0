Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp637241ejc;
        Mon, 25 Sep 2023 13:13:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZWLweP9ZviljXOT69wUsxwdlSl0UV8urnDqnj58ac2/I0mr+qPJRM755mk3Y9bJrZ0n9m
X-Received: by 2002:a7b:ce92:0:b0:405:39b4:314f with SMTP id q18-20020a7bce92000000b0040539b4314fmr7400930wmj.24.1695672800523;
        Mon, 25 Sep 2023 13:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695672800; cv=none;
        d=google.com; s=arc-20160816;
        b=vMMVdhiCTsLTAjljDxYj7Ylwmro/yZZjqgMqtFAzc8Jwg0TcN0FL9Ydfx4EWLO1ig+
         qyFxTI+Hv4qf8wgF/nFmQxSmW3j/pl+80qufhlhMhMOBIPDCBznhez2eaxH64oMKeSLg
         +cksMwq3aw5yhDbvMQkM4fAlrPKJ9JZUA4LrGJ/wCqgzPG5Dgpj4MI1DQNZ6Zqxh/m/E
         g4EEoG5+G2d29zOD+zEFEfi8cOMi77a3yK26ZJlraWdX5T7VMz2Ofjp2p9Lo6sDw/QHV
         31VUlE/O72DdLwScK9C9kCM/qth6155FSb81u/PuGnEG/In2XCB6AGvx9F5Ldv8IC4LW
         XVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=00Vye0AwWLIPBMODYPNFehasw86ZiZYbsbuGrJxr2N8=;
        fh=NyOLPhE49Voss78srUQw0osHrsIcTmXmLPuHaQzqROk=;
        b=ymfn3eOqu2TSTifyxpnKKlsR8oia1iWdfibuJw00lyBYx1rxeiSYUQUZRqXeISCGLt
         A4RynVAUEmt61GuiNKl4520MldUNDxU4r8dBRwmAeWgRHcEJ4k2zLOw7PUDvPxowZPpW
         ZlA6W2zih70akshHvBwDzd7K2pA1TmfTYE5xX+3vw0V1KfqjhFL+NUFlV78VgPY5upyR
         Itt/9Sp0aO4MGfy8R52a1kncTu1fwR1wZzT6HE/f4CABH4MnZ9j1HvW1AD+rW38D1VNf
         Ya7PfClp3pdb7gzMAYUVW2LtygqJkfd+iC+9V/ezqGRtbvWuT8NtRkCwIxmraVn8VLLc
         5d4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass (test mode) header.i=@armlinux.org.uk header.s=pandora-2019 header.b="P/010aGD";
       spf=none (google.com: armlinux.org.uk does not designate permitted sender hosts) smtp.mailfrom="linux+multiple=linaro.org@armlinux.org.uk";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=armlinux.org.uk
Return-Path: <linux+multiple=linaro.org@armlinux.org.uk>
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk. [2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by mx.google.com with ESMTPS id n17-20020a5d6611000000b0032330e023d1si557529wru.69.2023.09.25.13.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 13:13:20 -0700 (PDT)
Received-SPF: none (google.com: armlinux.org.uk does not designate permitted sender hosts) client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142;
Authentication-Results: mx.google.com;
       dkim=pass (test mode) header.i=@armlinux.org.uk header.s=pandora-2019 header.b="P/010aGD";
       spf=none (google.com: armlinux.org.uk does not designate permitted sender hosts) smtp.mailfrom="linux+multiple=linaro.org@armlinux.org.uk";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=00Vye0AwWLIPBMODYPNFehasw86ZiZYbsbuGrJxr2N8=; b=P/010aGDqRn81i7BeyzDbwnBFp
	1Acvh+eQ1re3F9NX/J7wuI40gFCaLDNr9gTfe0zDzlAcZ2c3x+M3fy1J1LzTUtp77NCsFFBvtuyqy
	dwv18vHqnYIfl2y6tXgjXCZOh2MhRHL+uImGT+5RqL2ycX1j+4l8Jnep7ADL7qOxHRlbdVULbgwqB
	tUL7SdwWV5Um5ZHumJrfTmSYIuifmKkXgK+OyXwZup1DEmpIIVb8Xcc55l+L7pUeoP1m/YWNPyZ5N
	SdyWC69YeSbwb1p4bZFpSgESiEP9ZhrWAuzXC6Uii/sDHxgarj8Uw1pdyMCQ5MxW0EAywS2KqntSy
	YJbXDDtw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42842)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qkrx1-0001Xs-0q;
	Mon, 25 Sep 2023 21:13:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qkrwx-000875-Gn; Mon, 25 Sep 2023 21:12:59 +0100
Date: Mon, 25 Sep 2023 21:12:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lorenzo.pieralisi@linaro.com" <lorenzo.pieralisi@linaro.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"justin.he@arm.com" <justin.he@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
	"miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>,
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
Message-ID: <ZRHpyxCe8ybsxKck@shell.armlinux.org.uk>
References: <20230925194333.18244-1-salil.mehta@huawei.com>
 <1ba2e69bf0a94c1498ab5863b365559b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba2e69bf0a94c1498ab5863b365559b@huawei.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-TUID: vk7Lzv7PUqha

On Mon, Sep 25, 2023 at 08:03:56PM +0000, Salil Mehta wrote:
> Looks like some problem with Huawei's mail server server. No patches
> except the cover letter are reaching the qemu-devel mailing-list.

I haven't seen any of the actual patches - just the cover letters.
Was that intentional?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
