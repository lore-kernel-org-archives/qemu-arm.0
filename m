Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1808427qvp;
        Fri, 8 Oct 2021 08:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRX/ucSBu/2/bYK49aK97HJBvGrkzekFc1N//1prtADnaX3hNb7ZifNrVxjoELLtRTpjAM
X-Received: by 2002:a05:622a:587:: with SMTP id c7mr12812009qtb.204.1633707121555;
        Fri, 08 Oct 2021 08:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633707121; cv=none;
        d=google.com; s=arc-20160816;
        b=Jc6OEV/udnq7Z6RswSrGz+9y32jyQjgX9/E1eUayWhjWjzINE/cNh2DZRhn28aN0C2
         aUxxbqIL8Jd3fUEXYVeU2Zq59A6VWYxY4YTRIH1RNYiy4xFWbqWjXBl0pgiGOemOb/Ra
         Bgy/XdPy4vWCheGZ+ejsLPbDyKyj8WFC636DN7auc/W/1tWBkk9HmY8yFxmIGkcsUS3p
         7S3LbQFzGyssN23TmKrNN3Ktpa1Ly82zblNQeuRNfWPMDVwU8dAjVjLym5hO/2pxEa8M
         DIaaxyL0WTn5LFUHqbVwrx/NHRm0gCHon2XJMJvkWcALR0KakThlr8mDRb3jse9eZYpX
         Ezfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bwwiKFsHy4N2r8I++KMRDAwlT3fDo4NGnqHTIh6JNsM=;
        b=Lnw2DfZz6VMxgeu2RP/rUe6fkm36S6NEBTb9/9WDkj2eUJU7so05Al8P7CcZSdo1ST
         X+ZWx3xO6lPsS6gNZqnC5ccEYOUuzY0gw+7ViYc1/AsTCbabSWI+zfTT5G0r2e1mudAu
         kik8irMB8VAiVOj5dLMbpaAEuJTTD4QRPyERcWeT6yqY7ghFjlkmvcbe3ijG6cy1NJvf
         wz3lEJbOACR7DqkTIxU5U+VEnaeuRDW5VX7rHFXsjqVTwDMAak3uk2wY53lExwwG9AKs
         q6WQFQxalCZhRamCJJ9/fwQ16/ts8+kG9C64yxiO4/H7aHa7/qOQaEJJXBmCXh0IiVp/
         3Pow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bW6B4WGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15si1935875qvb.69.2021.10.08.08.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:32:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bW6B4WGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrqr-0005k8-4r
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrpN-0004b8-CG
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:30:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrpL-0001Mi-4z
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:30:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id e12so30991723wra.4
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bwwiKFsHy4N2r8I++KMRDAwlT3fDo4NGnqHTIh6JNsM=;
 b=bW6B4WGPKOKstqk2PpsP5lY+4oKzx4EoPyF5UuRIFhsjibgZaFv/P6lTQT1W6kbdyR
 +d0Ll4fI7iJOKQGbhRKlX0x0ZndvAMNZ5MG3SmuiqrwmM/ysJZjMIdVEqF3lCthoHNtS
 DvqxcJhoaRCvGJos3A1O+yGfPTndpmcJATEzQEdjOUoN5thzeJhOk2/uat5c1Te/UP2q
 mPGPbnaIZrRCFqwb3BR4QWginIdaP//sljwKI3fJTXejKlLv3t257ZdexO8+cLkZ7bTB
 l7lNvATo8u6gh8dMTOc2QZVBlquaIgBu7jeqp5iRXsVmvCLdRX55VPTCfZUY3fsfwL8G
 TAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bwwiKFsHy4N2r8I++KMRDAwlT3fDo4NGnqHTIh6JNsM=;
 b=tgL20Hzl9qKOGO66UikSVzgiO80HSkan9rYT58ukmoVQyoHZNcqPl9OIgwJiRt7HCE
 ijGyKY2q4B9RSmUNgMm5B4dpq5qJjTw145s0jIBiMmNYOC9PcFh4jmcVF5gG5LL6Op8l
 vqyRLK2RrVhlLPqjNT47EyoyYcz8OTkbbNcGWmIXMpQn1ISn4PP5LPrC3GOI22CcdBic
 kGsP4LRlkSn4ibkWRi+fqT+nvy0neufcxLCjCKGEO2GPBs++7W/UVCKykFu34YlJPlAG
 WJJY3XUIM0VK5hLW4YiqgvRAo/NZcaxS+CHbRkTRv6xOkDCMldSQDOKt/MJ/eR1boqtB
 puCA==
X-Gm-Message-State: AOAM532sXqZkxgmFK1Gjy0HOrWJSOb/SneNBTenSyjPdOfO8deI4Fg/Z
 O4VumkMrwvuxTeBDN+7TptcvRw==
X-Received: by 2002:a05:6000:154f:: with SMTP id
 15mr5022339wry.254.1633707025430; 
 Fri, 08 Oct 2021 08:30:25 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id c17sm2697324wrq.4.2021.10.08.08.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:30:24 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:30:02 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on
 virt machine
Message-ID: <YWBj+ngyUL3QSCwn@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-11-jean-philippe@linaro.org>
 <f5293d9e-10b1-6a85-a35f-66b12680cdd2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5293d9e-10b1-6a85-a35f-66b12680cdd2@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MedXG0O0AKZC

On Tue, Oct 05, 2021 at 09:38:13PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> > The VIOT blob contains the following:
> >
> > [000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
> > [004h 0004   4]                 Table Length : 00000058
> > [008h 0008   1]                     Revision : 00
> > [009h 0009   1]                     Checksum : 66
> > [00Ah 0010   6]                       Oem ID : "BOCHS "
> > [010h 0016   8]                 Oem Table ID : "BXPC    "
> > [018h 0024   4]                 Oem Revision : 00000001
> > [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> > [020h 0032   4]        Asl Compiler Revision : 00000001
> >
> > [024h 0036   2]                   Node count : 0002
> > [026h 0038   2]                  Node offset : 0030
> > [028h 0040   8]                     Reserved : 0000000000000000
> >
> > [030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> > [031h 0049   1]                     Reserved : 00
> > [032h 0050   2]                       Length : 0010
> >
> > [034h 0052   2]                  PCI Segment : 0000
> > [036h 0054   2]               PCI BDF number : 0008
> > [038h 0056   8]                     Reserved : 0000000000000000
> >
> > [040h 0064   1]                         Type : 01 [PCI Range]
> > [041h 0065   1]                     Reserved : 00
> > [042h 0066   2]                       Length : 0018
> >
> > [044h 0068   4]               Endpoint start : 00000000
> > [048h 0072   2]            PCI Segment start : 0000
> > [04Ah 0074   2]              PCI Segment end : 0000
> > [04Ch 0076   2]                PCI BDF start : 0000
> > [04Eh 0078   2]                  PCI BDF end : 00FF
> > [050h 0080   2]                  Output node : 0030
> > [052h 0082   6]                     Reserved : 000000000000
> I noticed the spec does not clearly say the virtio-iommu-pci BDF does
> not need to be excluded from the PCI range.
> Shouldn't it be clarified?

Possibly, but I didn't want to complicate things. As the spec doesn't
specify any exception the driver should handle it

> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!
Jean
