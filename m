Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1584914lfb;
        Fri, 27 Aug 2021 06:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV7maa+S2+TfYIeubHPvJ99dPcmi7PqfKib3ouMyepQXVLZJwiI+jjdqxWH2/mPdwjLtNg
X-Received: by 2002:a17:907:1c8d:: with SMTP id nb13mr10008656ejc.155.1630070911349;
        Fri, 27 Aug 2021 06:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630070911; cv=none;
        d=google.com; s=arc-20160816;
        b=KhRuBSJxNKYQjTsPX3f+EkP0vGBJT6TM8CM/7tqNNB8QVknzVKZQfAOm9mu3uFPrGN
         Bfahf9EqIwcFI83hK0luF/r7dzKX88beQuryyKflB8brWMzPa4BdFVcqyKnZCrNPs309
         RarGyUJKgYnwrq5qqRQu5fpO8m73EWv5FbFnif/McRpjZC1HO/Z1EId93VGMw0Cd3ers
         7yAwqKoe3RWs31ta/ZpHAgS7qzC8VyjUCRAiXKLAB3yHXwlF8uSWHGhC3EvHY6SRhhHf
         tItZ7wxrLoGE+jGkxE4NpZBp6EkYV4WcyXmc7xXtd58ToQ+FL94EyABQhZuv0BbylMXn
         x1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hLXmW8lnIR0vGIwVfHCn084kS7VObtURvu8WDB3Cwmc=;
        b=yRIpt9TadiRLu/+II87rCBOmLyTViNn+fBk0Nv8RTZ/tHOvsDYIfweZByH3Q91+sFY
         tHu5XdKsVRxKYcZIi+JG9BxwxR16YtyD4/4MhQiPt/ToUgfMMow2IPMj+A5TLORqRKJx
         6/E5SP0LbOTRCcdbF4HIhMQtO2oUbq3h104PrKq5XyKwkto0H3qS8pGxMhh5y/51lhuZ
         rZJz6tL/1kk9UC7s+c7J9cwnqrCgS87h1JCsnCUrCKVVRvoRKQRmeNCZgzZy74xvA4dv
         OVLBBTaphy6x+U/n6KeQuFLmZQgfnd/Fdrq35Mp1fXTXa7kM5kQilnzJnuRVeGyqu76A
         392A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hs0EMql1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si8158003edb.471.2021.08.27.06.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 06:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hs0EMql1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJbuI-0004Bj-Fp
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbu3-00044C-5R
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:28:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbu1-0002mt-Kg
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 09:28:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id h13so10474182wrp.1
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hLXmW8lnIR0vGIwVfHCn084kS7VObtURvu8WDB3Cwmc=;
 b=hs0EMql1ACYClqanVSWdcjsuvuI32Z+hQxAHSNdXl/Filj627ZUhlpdu3L+8242PAT
 Z4y5S03B0XnooofDg3HtrTdBSfo7SL9LmSk9pRKNCCkfTr6/A6uvuKwqNjanHF4EYMIq
 QmlE3yh7CLRPLyZfbo+R+IAzqWtlpR+aCko+mFCkYuGrU+VqK66ceDOvn5JQgNunlg2Q
 oiJ5GoxeBIr0/DQJBrB1KZxZ+aDNcbmbHU2NcZgf1gpo3c6nUxs0ytG32bKGwXYBcgXZ
 1yy1xGwW1e1U6W3iD73DbNMTsRah5UnXKIJltrDp+wpGEK6+mdOMLKfhCrKjhyGkk8Yu
 dgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hLXmW8lnIR0vGIwVfHCn084kS7VObtURvu8WDB3Cwmc=;
 b=n3Xs9TRHtgFCRRV+r9Ea/d8jYf1CMiVucz/laxGAg16zEecjEr/bf7wumTruaz3qmf
 w1c2EN3isObQl+Ojukj7UdqXj+u91LUYAktzC/2CbkCAe9OMVWe+3uzo0TdvZInXV0wk
 bZaj/0trXrDQXeuw/y7VoIk1PEtcdH2iVMJYnCt5+DBA/qjSp72JeQHufvGADlZ2kDso
 r5WfaihTAdPoNGk39KGl4pFfEydSmIRT2TmM6SYEW2VDVDiOfbOBucDhFOU6opFy6Pk1
 obgWxGBS3levzhvLkADt4MjaMkPLVrKIEBzuGr9HxNiqpiaqbs5/tFa/sfHVOY2rChRr
 PknQ==
X-Gm-Message-State: AOAM532fkvFqJ2+ZNFA/hWQxAe+RkOUwkUrqGN4iA3+C0kjoKbVaagNN
 7RCH/3MXIHs/8HA9PLfnuiSshw==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr10433678wrq.292.1630070892241; 
 Fri, 27 Aug 2021 06:28:12 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id l26sm2060769wmi.13.2021.08.27.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:28:11 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:30:22 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
Message-ID: <YSjo7hZ9ptMH9JSx@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KCGwHrYlSVxP

Hi Eric,

On Tue, Aug 17, 2021 at 04:58:01PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> > Allow instantiating a virtio-iommu device on ACPI systems by adding a
> > Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.
> 
> Don't you need your other patch
> "virtio-iommu: Default to bypass during boot"?
> 
> Without this latter, for me the guest fails to boot.

Good point, I think I've been lucky during my testing. My bootloader and
kernel are on virtio-blk-pci devices and as I wasn't explicitly enabling
the "iommu_platform" parameter, they would bypass the IOMMU. When enabling
the parameter, boot hangs since the IOMMU isn't enabled when the
bootloader needs to fetch the kernel, and DMA faults. That parameter is
specific to virtio devices. Using another storage for bootloader and
kernel will result in failure to boot.

I've been postponing the boot-bypass patch since it requires a
specification change to be done right, but it's next on my list.

Thanks,
Jean
