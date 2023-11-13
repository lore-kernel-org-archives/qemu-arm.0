Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1364630ejc;
        Mon, 13 Nov 2023 06:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjzLsYDHeZHv+FT5o3id/ZVXXTmcb/z6lPMWExZCTMJOiUcs6U/ri6Qk4ruowmZzj0YkOh
X-Received: by 2002:a05:6870:3c12:b0:1ea:8645:6352 with SMTP id gk18-20020a0568703c1200b001ea86456352mr6500507oab.11.1699885168208;
        Mon, 13 Nov 2023 06:19:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699885168; cv=none;
        d=google.com; s=arc-20160816;
        b=yUaKnSwSF19maD2SfJQY5STU8rC9lpUMfFW0XbJ08HYU5MUzY1RDu56dFNlQ5E2dcD
         R91WhrBl+nAKXfxExI2pmPrrGZHe7V+RdjLapAJp8bW4VHuojbxszF1W0f2KwdoL4rh0
         7FVS5mvjM6knTh/aNgWX8aDNEuTW9/QlLVtIO6DnF6kS2laD+jc59pdePqWdNawD17+l
         /zOD6yjF63/UTWK8Lid1OpNc0EhBz0HPXrndBCGdyLSj3vLcbgP6vlcB3UyVCnCq28Xy
         kjHQxX7vKJphPGt1NyTK2I7fQ6wFQyN1Ew70477wq3GNPRUeE2ZDYEZiZxWPn9AqT0Kk
         d3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=EPcpKTmJVzz9Ua0aei3X5567vdP+v2aBOZLO9axf1PM=;
        fh=hEgh16zZ6eZefMVoSYI0Mesvch0RQ/N6coFm/sit1ck=;
        b=yhgp2zI+A75+0XInCCX6mXR0K2p/lOYqG02iqrSTwlj760Lt+ex2+nLyrJV4u2Yu9/
         yqTghkk4MRQJHLd9dNubaw3NcDLstyNCM/PIXHXnRsH+fhJOmmU9zTDIPCFW94qNuo9h
         9ZM+VGED6td051RzNNJCZ/WVAmMA8JwKNC1xZQ8MjPv5dLVwUm4mXkHJDMdeIluFvjMs
         eff1ADxxyNR1TbJQ0HKPZjwJepF6pUzqnW6Y91OB34Rr9r2COGdPCICIiaR23reNajik
         9VupiCYO2tO5odOGrPKVNP2q7fs4zB7a4rrzAbYkgGWLeiF3vPbiTnmy3EHDm3sqgFBi
         5wgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iYYlR4Mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br8-20020a05622a1e0800b004180cd5acadsi3766659qtb.454.2023.11.13.06.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 06:19:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iYYlR4Mk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2XmK-0001Ou-AU; Mon, 13 Nov 2023 09:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r2XmJ-0001OV-0k
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 09:19:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1r2XmH-0005sy-FA
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 09:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699885139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EPcpKTmJVzz9Ua0aei3X5567vdP+v2aBOZLO9axf1PM=;
 b=iYYlR4MkmNZKHdc12ofg3AZE27DOoVnyrL4sH7E8olzxl2Ci//+AuiIPrR8olrYw3loGmQ
 sD5+7aa346wTZCAhAiP+1iLHTJSKEYGEJgehijycpKP0GaFcMa8OrjDIb9ubBX5baCVfVR
 jaO/sC3V2c7D7b0ETOpZ7ngpmIn5iDY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-h9nyD45gNtaMUt-wQOax8w-1; Mon, 13 Nov 2023 09:18:58 -0500
X-MC-Unique: h9nyD45gNtaMUt-wQOax8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40a4c765d3bso8853535e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 06:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699885136; x=1700489936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPcpKTmJVzz9Ua0aei3X5567vdP+v2aBOZLO9axf1PM=;
 b=kNpOb/tm2yBG9taMdkjVBcFQpY7eQlja6DDQgZw1E3jcsVliUzZhI+j+JRdqVvI3OL
 wlPWn3KGRK/qrulHBzVDGZFC9mqhSW+rqvcAVpOLJdc/nBzD3p0FzFz6ASBlHVTUS/EM
 DEDokNAmzpZ37l78/Ml0tpUbxtPXCjV6fV5WPymyxJP+WXS7D3DgrtZ1AZdiLH1+eflm
 ecUObxq2mMRAUxkcSpkWE9bZFHb0RmGBvmkEW69+i3f1PojCfO6UT+jWZEZDzLJtwz3Z
 y0kbkPEd03AYF2do1ey9bfuTgAZaTHafF6FpCPt3pVb9wPS708zDKSUVbxXaO8io3fj8
 yvqA==
X-Gm-Message-State: AOJu0YwAVXbRwOR43u7eH9d3pCTBNNDiX0dJcYpKeTt0X+WLC/pxv5Pq
 jO/MTcZGQ0piq+ACWDKwetDN/yNi0yqMj1uXzv1iFhJh92RtSp3/npZs7tKN+ZB7Wnp6gVtf23h
 ZEW8fPgRIdLwx
X-Received: by 2002:a05:600c:3b17:b0:408:3634:b81e with SMTP id
 m23-20020a05600c3b1700b004083634b81emr5849697wms.13.1699885136319; 
 Mon, 13 Nov 2023 06:18:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b17:b0:408:3634:b81e with SMTP id
 m23-20020a05600c3b1700b004083634b81emr5849681wms.13.1699885135990; 
 Mon, 13 Nov 2023 06:18:55 -0800 (PST)
Received: from redhat.com ([2a06:c701:73f2:e100:f288:9238:4f0d:83ab])
 by smtp.gmail.com with ESMTPSA id
 p41-20020a05600c1da900b00406408dc788sm14151733wms.44.2023.11.13.06.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 06:18:55 -0800 (PST)
Date: Mon, 13 Nov 2023 09:18:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
 Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20231113091756-mutt-send-email-mst@kernel.org>
References: <20231107190039.19434-1-ankita@nvidia.com>
 <20231107190039.19434-3-ankita@nvidia.com>
 <20231107172318-mutt-send-email-mst@kernel.org>
 <BY5PR12MB376329341A19E4FA1B5B63FDB0AFA@BY5PR12MB3763.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR12MB376329341A19E4FA1B5B63FDB0AFA@BY5PR12MB3763.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pBD/000ZVBNt

On Mon, Nov 13, 2023 at 11:14:00AM +0000, Ankit Agrawal wrote:
> > It also looks like this support just silently fails if the device
> > string isn't the right type or isn't found.  That's not good.  Should
> > the previous patch validate the device where the Error return is more
> > readily available rather than only doing a strdup there?  Maybe then we
> > should store the object there rather than a char buffer.
> 
> AFAIU in a normal flow currently, a qemu -object is (parsed and) created much
> earlier that a -device. This complicates the situation as when the
> acpi-generic-initiator object is being created, the device is not available for
> error check. Maybe I should treat this object specially to create much later?
> 
> > Don't we also still need to enforce that the device is not hotpluggable
> > since we're tying it to this fixed ACPI object?  That was implicit when
> > previously testing for the non-hotpluggable vfio-pci device type, but
> > should rely on something like device_get_hotpluggable() now.
> 
> I think this will be similarly problematic as above due to the sequence of
> object creation.
> 
> > Also the ACPI Generic Initiator supports either a PCI or ACPI device
> > handle, where we're only adding PCI support here.  What do we want ACPI
> > device support to look like?  Is it sufficient that device= only
> > accepts a PCI device now and fails on anything else and would later be
> > updated to accept an ACPI device or should the object have different
> > entry points, ex. pci_dev = vs acpi_dev= where it might later be
> > introspected whether ACPI device support exists?
> 
> I am fine with either way. If we prefer different entry points, I can make the
> change.


Not the expert on QOM. Hope one of QOM maintainers can answer.

