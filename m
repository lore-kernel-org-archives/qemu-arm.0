Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3125562wri;
        Mon, 28 Oct 2019 07:57:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpXmYehoKdoSUTww3VnwP2gOLU/WuDNIH0WKy9sGUZJJOJavQAj1g/y76srFfS+auYByyF
X-Received: by 2002:a05:620a:98b:: with SMTP id x11mr15958299qkx.257.1572274623252;
        Mon, 28 Oct 2019 07:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572274623; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGQx1n8eO+0/rpnLl7ZWvSkniUJxf9Y15RlEXZUXcbKQnS0v/7TmXOCmZ+sNlvqpC1
         4qrE2X4ednKcC+yu1XgIac5BxPqqcgzcwDfpxAQE4DjfIvHBYV7BA06M4KAURc2I6AP3
         gyQv+xtH5sNb30h3J7GlQZO4M3hTIlXfeQLqqbO4f0R9F295DZkZB5PUKCz5GwDBBP6t
         GJqq2lJVl62LaCLR2iojsCkrjIpz3XsfohDLIJ5+sI/MOTYf6GzSzjQkUEGsjPwUA4+l
         sPk55RI2/+aGhaGTLk9A6o4ghECd6x26bVOOttRaD0ddQvHjCQhmes7/HPYxUJ5pS3tg
         FsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=QtNd0UMqofsV+XZWmGpconlIFxP5DQnlNLXPHI1qYVA=;
        b=tMJRAm7fDjwheVLf5qSihjpziC2LEF1sUaIglP5nMagIukvW4LpqbQRX8O/nTpg1Lv
         M4hfZ31NO4LNXBGhh2vN+AGv3ccUcpWY9I2tGxyfnEqSPmfyniw3NFRHkFMFhgrbzYQc
         6MgYJHrQXbGPCp8XbcIH5icPBG6f9Gq/w2Tfw/FeBFF/AagH9sBpqcxA7XGMKOgjJy+n
         GVT086Mt+TVV+7DXGIhcDUPB/FLedzSyWBBtoK9OhxDvbYiSl5e/AKtMguGI4q37qgf+
         EEoKjqe7ClsDF9BFLExeR4uUOMg3HJUd/xl20cgV3sFVNHQYfQCwu2YZ19sh+SlSAq+w
         CpdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si9403294qtm.389.2019.10.28.07.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2019 07:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iP6S6-000586-Ny
	for alex.bennee@linaro.org; Mon, 28 Oct 2019 10:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iP6Rx-00054Z-Dd
 for qemu-arm@nongnu.org; Mon, 28 Oct 2019 10:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iP6Rw-0002xS-3p
 for qemu-arm@nongnu.org; Mon, 28 Oct 2019 10:56:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iP6Rv-0002xA-Qm
 for qemu-arm@nongnu.org; Mon, 28 Oct 2019 10:56:52 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7FF137F41
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2019 14:56:50 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id c32so11127809qtb.14
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2019 07:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QtNd0UMqofsV+XZWmGpconlIFxP5DQnlNLXPHI1qYVA=;
 b=L15bpFYgmoO3mJEDehIk5Gh0TSAAP7wmzEVHcAWYmv1c1kYi9thndIDwQfjByeY7YQ
 E3bB34pUSG2BwzHEC6/GJFtgJ66P4JqM96FYDgQF2ZIdHVIQSL12u3VQhX8f+MAThP5G
 pdGAX28es9s2gnA68jyTWK2rUAGyP+x3HEb6tudpSLf/9Ih2JGfgHGUmxfoVf0sy1423
 6bb/GIc54iCW9tl9+w3ebJ0cgQsTpbTRIkJqHl42hEZ8iloRS4L72PEFK610GbiLinb9
 5rZ5PH1Z9/bwxsxogUOsa7W87uMSdBzMgPGNelLH8FITBJWti9eambiutG2s0ZUfCam0
 ZEFQ==
X-Gm-Message-State: APjAAAWnuKu+9tuWQhVeOAO6do7m3cEE7nvJepatvpk2SHfG2Qn26jA7
 evEqkwb1Cd6I5K2niTRA01mCo7AxA3RwmaX0+DrMuOHthTRbKNbjKNCtNlGpWVgM8S9Ok1Vc4Yk
 Ux93fXoYINsbk
X-Received: by 2002:a37:610f:: with SMTP id v15mr15487577qkb.98.1572274609944; 
 Mon, 28 Oct 2019 07:56:49 -0700 (PDT)
X-Received: by 2002:a37:610f:: with SMTP id v15mr15487560qkb.98.1572274609617; 
 Mon, 28 Oct 2019 07:56:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 p17sm5696481qkm.135.2019.10.28.07.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 07:56:48 -0700 (PDT)
Date: Mon, 28 Oct 2019 10:56:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Subject: Re: [PATCH v20 0/5] Add ARMv8 RAS virtualization support in QEMU
Message-ID: <20191028104834-mutt-send-email-mst@kernel.org>
References: <20191026032447.20088-1-zhengxiang9@huawei.com>
 <20191027061450-mutt-send-email-mst@kernel.org>
 <6c44268a-2676-3fa1-226d-29877b21dbea@huawei.com>
 <20191028042645-mutt-send-email-mst@kernel.org>
 <1edda59a-8b3d-1eec-659a-05356d55ed22@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1edda59a-8b3d-1eec-659a-05356d55ed22@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 imammedo@redhat.com, pbonzini@redhat.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, linuxarm@huawei.com, shannon.zhaosl@gmail.com,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org, james.morse@arm.com,
 xuwei5@huawei.com, jonathan.cameron@huawei.com, wanghaibin.wang@huawei.com,
 lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dfw5aKYZnFej

On Mon, Oct 28, 2019 at 09:50:21PM +0800, gengdongjiu wrote:
> Hi Michael,
> 
> On 2019/10/28 16:28, Michael S. Tsirkin wrote:
> >>> gets some testing.  I'll leave this decision to the ARM maintainer.  For
> >>> ACPI parts:
> >>>
> >>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> Got it, Thanks for the Reviewed-by from Michael.
> >>
> >> Hi Michael,
> >>   According to discussion with QEMU community, I finished and developed the whole ARM RAS virtualization solution, and introduce the ARM APEI table in the first time.
> >> For the newly created files, which are mainly about ARM APEI/GHES part,I would like to maintain them. If you agree it, whether I can add new maintainers[1]? thanks a lot.
> >>
> >>
> >> [1]:
> >> +ARM APEI Subsystem
> >> +M: Dongjiu Geng <gengdongjiu@huawei.com>
> >> +M: Xiang zheng <zhengxiang9@huawei.com>
> >> +L: qemu-arm@nongnu.org
> >> +S: Maintained
> >> +F: hw/acpi/acpi_ghes.c
> >> +F: include/hw/acpi/acpi_ghes.h
> >> +F: docs/specs/acpi_hest_ghes.rst
> >>
> > I think for now you want to be a designated reviewer.  So I'd use an R:
> > tag.
> 
>  Thanks for the reply.
>  I want to be a maintainer for my newly created files, so whether I can use M: tag. I would like to contribute some time to maintain that, thanks a lot.

This will fundamentally be up to Peter.

Reviewing patches is generally the best way to become a maintainer,
that's why I suggested the R: tag.


> > 
> >>>
> >>>> ---
