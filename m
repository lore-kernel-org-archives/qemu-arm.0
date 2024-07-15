Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2264348nji;
        Mon, 15 Jul 2024 06:55:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOxmPySmA6OukMiL4+OUscb2YVAmR/LLegSTOJMHtZfrHEiQpIXTDUZxDU3p6ebUN7L+iJU12C6zOqXaNZ9nsIl8k4HK8H
X-Google-Smtp-Source: AGHT+IHD/d9iUAU2O4BAZco75WfoKM7PZV0NqFmqv6zc8ls4aIruKgcHjPgo4dqi3qE35TEHjI+c
X-Received: by 2002:ac8:5e52:0:b0:445:e9:e67b with SMTP id d75a77b69052e-44e5cf7b08amr195359441cf.23.1721051754689;
        Mon, 15 Jul 2024 06:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721051754; cv=none;
        d=google.com; s=arc-20160816;
        b=ofePoRlm5swjpnpYDr39ulNorxAFgbaHa+ouIZuSZKtddmjsYHIH2JuCem53oT/uf3
         syqipFaKx0WelK9OZ5EOOJnS4GK5OhDSQPVGmgkh7t8qpu9VHJ0htY4Z6Z2JFY8Um9+6
         ezdMoNLYwaBNZyyq6Tg8Na0ITdh4ttcTBe9+4Z4DLj/SxbAqTLoUj9R3M14Ln0V1o4Qp
         nxrPYvWCxa4HpPQV8xqcPdxZWqUZy4KnIBDFxHypxT8qUbKlbZeg8zG2X5QpNpuYYtFG
         rUsCwrMxyJnl1wbOYa06rTBb5Up7zWuIKqiZ69kVm4Ku49a1ccjRwoupAcMUnxRLoOtq
         sBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=hEOd4CDp/jbPiha9NPOwXg++RHvWlGdyA56E36AJ3zk=;
        fh=rA1iOcGoj0vJ5QPXUR83buDVWmztiTz3HR/C1WqsgD8=;
        b=SuVkaFgITfbNJoFDUSZNhnXBluiZTpaLsV2aa0mn2N7Nwksc9HeIZqdpB4lcHJ/9M+
         vQA4JKbqrBj1pwhspvnMJilFVr2IOfqlWiG62R8r3+CrtCng15PHoKDcDc53HyivBsVe
         cLrcj1qnXbSlwrK/7BvOS82VVXrc2OIUu83RrSwdGn9YMvif6GNJoFInoSOzsuVHGcGz
         xQ/cpMmcBvNs1bOAmlBLzq5IRXTIgd4UWClgqOfYQVaqGJNMCR0khDDKwfFiTt7XIdGS
         qNj3xoQvycWsorpZIbCvjoQeMcRb1XJQ5Vd9wz31rc+BDsndnO/5X4vc6TRQ0cAlqAH8
         aFEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgrpUqcB;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f7d2asi51269371cf.278.2024.07.15.06.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgrpUqcB;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721051754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEOd4CDp/jbPiha9NPOwXg++RHvWlGdyA56E36AJ3zk=;
	b=fgrpUqcBhGMQkIzpkl9ZjeH231PcVGJR+eO7ujQRltuBvvOPhHDiLRVlSw2xoZdkYScwY8
	vjSPoeTognZEXuQbQPFalR7s10EN29MZmqNioC3sEuvFbSKy5mQv1BBe3CB8v3UoCuObrC
	lznkal3fkcsCref5kmxFGHHLiIynl/s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-nM0AS52XMPKhs1-l34npWA-1; Mon, 15 Jul 2024 09:55:52 -0400
X-MC-Unique: nM0AS52XMPKhs1-l34npWA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4266edc9c85so31563395e9.2
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 06:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051751; x=1721656551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEOd4CDp/jbPiha9NPOwXg++RHvWlGdyA56E36AJ3zk=;
        b=tIOlVS3aZOJtu/DqxNFvNSsZ26Bdmc62jltQXqrdkWzqSsl49Hb2Emw82FaHZP4Nt2
         mu2/vqxCim2ASrBVkMeQnXijhRwWA/2YSj/G1VY/Uaqail2iNEnn4RWs7H8N3HtCXKYa
         PTpRRFQib9k3KiU4WsVRg9jUmTXpOVMqDE18tCRjI76H2SPVdzMaBXDcsjazrjuZgh95
         DQExJJ9uTCVvbjX/bcaVs6tMyj/PTZ1vTsyE9gHHY8k40b4T8qJ89LOz3+SdbKrgnjpm
         1k01XGH6oWAIyLkb/ujjvn7MUrKdtTObGDh9Dvr/tQqLooPkrZ948UvIj0LwDZ0jMb+/
         QTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFeVEfnJnxVXQIFl+KlgOFBzUxBBSaSq5SLE7nS0AV+NPEcy02PoDQWqKDRrmysZ+u3lbaoWzCDsM/HtlyKk6GmPi4s8kk
X-Gm-Message-State: AOJu0Yy38Q6xUJEwg7avXCWJY1VSNEYjXqttgCCPbuinZj80XiSZb5H8
	Szxcdxocc6WHGvZiTguEdOSi+ghM88tC+TXtzqit9FJhXxk467s48zW9f13NnO5nN9RUtuSNtle
	ZG6kWglfcidmJ5a/DydE6mEFKmtmcCnvn7HDq6PIRHNB1knFe0lppUw==
X-Received: by 2002:adf:9b93:0:b0:367:89d3:5d4f with SMTP id ffacd0b85a97d-367cea45c84mr11564676f8f.12.1721051751716;
        Mon, 15 Jul 2024 06:55:51 -0700 (PDT)
X-Received: by 2002:adf:9b93:0:b0:367:89d3:5d4f with SMTP id ffacd0b85a97d-367cea45c84mr11564642f8f.12.1721051751302;
        Mon, 15 Jul 2024 06:55:51 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3c38sm6520140f8f.8.2024.07.15.06.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:55:50 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:55:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "andrew.jones@linux.dev"
 <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
 <eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
 <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>, "salil.mehta@opnsrc.net"
 <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng
 (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
 <maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
 <harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240715155549.5302e90c@imammedo.users.ipa.redhat.com>
In-Reply-To: <a43a5a1636c84896be5930570c538031@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240715071232-mutt-send-email-mst@kernel.org>
	<a43a5a1636c84896be5930570c538031@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /WCBBh2wc+/X

On Mon, 15 Jul 2024 11:27:57 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> Hi Michael,
> 
> >  From: Michael S. Tsirkin <mst@redhat.com>
> >  Sent: Monday, July 15, 2024 12:13 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  On Sat, Jul 13, 2024 at 07:25:09PM +0100, Salil Mehta wrote:  
> >  > [Note: References are present at the last after the revision history]  
> >  
> >  Igor any comments before I merge this?  
> 
> Hi Michael,
> 
> Assuming there are no last-minute surprises and If you decide to merge this
> series, could I kindly request that you collect all the Tags (XXX-Bys) including
> the Igor's pending Reviewed/Acked-By Tag for the entire series, so that I won't
> have to churn out another version (V16)?

v16 might be necessary, see cover letter.

> 
> Many thanks!
> 
> Best regards
> Salil
> 
> 
> >  
> >  --
> >  MST
> >    
> 
