Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp237031ejo;
        Thu, 4 Jan 2024 09:39:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7GXjrU/PV1+3LBdVMPlFIxjecWzv/OYH2O4fkbeSEi5ZVdcUf0pTXs+LaCtpqT0m9qb5u
X-Received: by 2002:ad4:5bcd:0:b0:67a:d70d:71b8 with SMTP id t13-20020ad45bcd000000b0067ad70d71b8mr1110605qvt.34.1704389998942;
        Thu, 04 Jan 2024 09:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704389998; cv=none;
        d=google.com; s=arc-20160816;
        b=oGHRGoZMUh5G6vdEkGUR9Nk4LwTdnOrWhEkj701LyF4vsuDRP7mgEk1Xvo3ZwFl983
         tbHm/oRIJgfjemmXhxAViowsbel1Lh7B45ppDUpQHO/y7SmzERG1NG7bDAZUaxTa88xY
         0ox57dMhF3VK1+i2fTHOPdrQYz2YssSbtzQXJJSqTUOxgReR+Pk1FywGP/TM+ZjHTaui
         NMh8NwmyPnKbX0pH5XPJYXU0ZiKWB+Gq1AEJwr1FqIZrjD8KcvQ0jnbcHIFNVX3sSomf
         avcv9IC/1jxOqZ4iaRh2sokqcfQDFxy1rUa/ir8swpTIX7J8KeKeYhc1ITJCjMwbNZG3
         eaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OWYluG7mflE0wvMjptMazuT+lDtcvVxC9qL4w5BOcZ8=;
        fh=KyXtQsGNqASDK2UfIAQ6SsKRCp1h+gEnlNy2TZEaKZk=;
        b=U/BSLQvAQgjWMl9C2JBrCJ45896HPHE/MRAt/zdo2pynPWcDn4nwWWC+VbH9+fMbld
         f+kx7LevwrKLep6QXM5uTIEgG6EH2Y2dg9I+dNTJxFf+QhWPRh1W/Co986tPBRgzavQm
         tXfnR3DLG5TQAhrKBujTkyilg4XRq/MPa9r2UR3X+XaUz5P0OzGrXfM3DgSulbDL9zes
         BdLsrFQuLgwBAQVxRfMUIdt+iODrHGxl7qrhAYv7VQOK3AufaCaOIzYA4vzidd6yMxn/
         l6jwehxMguUyJkN82M2Q0q93qg5kAPjUu8qE9cwN+r0xxUWQ41agyeGb3T6iiz0eO3FJ
         E/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PmmTLuZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a0cf584000000b0067f9474ef53si30122431qvm.368.2024.01.04.09.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 09:39:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PmmTLuZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLRh7-0003Om-Nz; Thu, 04 Jan 2024 12:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rLRh6-0003Oc-Pt
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 12:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1rLRh5-00022E-1m
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 12:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704389985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWYluG7mflE0wvMjptMazuT+lDtcvVxC9qL4w5BOcZ8=;
 b=PmmTLuZFF9hYFfrMNaDRaNzvAh0FiXq2P4wceIaY5wfi2nlrrT/2SynPIU4oUdEGJNS9B+
 5yKIuNw6pTzPZ7DKv7bHKqjCpSdq7GYj5Zn9tQPPgPrkayGLHyVURJvxhKjsyvL3QoIIOY
 I3jaNYuVQFXLpGyY76NznYHGCYcldrs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-S86wqyS8NceabE8dBQYHMg-1; Thu, 04 Jan 2024 12:39:44 -0500
X-MC-Unique: S86wqyS8NceabE8dBQYHMg-1
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-7ba8315d1cbso55707739f.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 09:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704389983; x=1704994783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWYluG7mflE0wvMjptMazuT+lDtcvVxC9qL4w5BOcZ8=;
 b=htsNjser1g3T42xNXWBONgo03/+m32HnZqJCNoi/VFZi2kvT63cfBFcLL892oTfGwE
 gZl3HDxyRE9tr1ZzeGTVdS/EREGV5nR7LzbO5hTQkEgunxVBodmBz1CcjtgHHUTMbxBu
 X7zEAxIDtRFuRTcA3zv1lWcuTvVqAwKE602xdOwcIoVxsaHudCvp+ANfZB1ijPxT5in0
 cqmoTZf9DL0Q6qbixKeVfrU8uNdB8wKwkTQE4J0UPfci2QICk4VBfAQ0qR6naO4BC4Km
 ORtj4i8g20SInRUL65TDjBEQ9Z8rw+gnRvHamWD+31SE9dTxEY0Gh14TrA7C3VxoZSJb
 vr3w==
X-Gm-Message-State: AOJu0YyYU2cMtCFEunkLR5re1BhZMRPyE8xG/xeSxaLmQ03Ycf0bAFYq
 JA17RicXi/wll0CdRgDvvfOBMUFQ6ezOjhmWjTXROtKqGFdigfC2qlv7kb7wWNi1NHg3svuL2pX
 bP5BS6eSVRBY/4vZJz9tu
X-Received: by 2002:a05:6602:21c9:b0:7b7:ca3a:8e97 with SMTP id
 c9-20020a05660221c900b007b7ca3a8e97mr924968ioc.16.1704389983510; 
 Thu, 04 Jan 2024 09:39:43 -0800 (PST)
X-Received: by 2002:a05:6602:21c9:b0:7b7:ca3a:8e97 with SMTP id
 c9-20020a05660221c900b007b7ca3a8e97mr924938ioc.16.1704389983275; 
 Thu, 04 Jan 2024 09:39:43 -0800 (PST)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 v8-20020a5ec108000000b007ba744e8244sm7919510iol.40.2024.01.04.09.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 09:39:42 -0800 (PST)
Date: Thu, 4 Jan 2024 10:39:41 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Jason Gunthorpe
 <jgg@nvidia.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun
 Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 Andy Currid <acurrid@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, Uday
 Dhoke <udhoke@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 1/2] qom: new object to associate device to numa node
Message-ID: <20240104103941.019f9b54.alex.williamson@redhat.com>
In-Reply-To: <SA1PR12MB719917E2C9D98C04AE9058C4B0672@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20231225045603.7654-1-ankita@nvidia.com>
 <20231225045603.7654-2-ankita@nvidia.com>
 <20240102125821.00001aa0@Huawei.com>
 <SA1PR12MB7199DF47EDDA9419E22FD79FB067A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <SA1PR12MB719917E2C9D98C04AE9058C4B0672@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.691,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lg60EBFSaP6Q

On Thu, 4 Jan 2024 16:40:39 +0000
Ankit Agrawal <ankita@nvidia.com> wrote:

> Had a discussion with RH folks, summary follows:
> 
> 1. To align with the current spec description pointed by Jonathan, we first do
>      a separate object instance per GI node as suggested by Jonathan. i.e.
>      a acpi-generic-initiator would only link one node to the device. To 
>      associate a set of nodes, those number of object instances should be
>      created.
> 2. In parallel, we work to get the spec updated. After the update, we switch
>     to the current implementation to link a PCI device with a set of NUMA
>     nodes.
> 
> Alex/Jonathan, does this sound fine?
> 

Yes, as I understand Jonathan's comments, the acpi-generic-initiator
object should currently define a single device:node relationship to
match the ACPI definition.  Separately a clarification of the spec
could be pursued that could allow us to reinstate a node list option
for the acpi-generic-initiator object.  In the interim, a user can
define multiple 1:1 objects to create the 1:N relationship that's
ultimately required here.  Thanks,

Alex

