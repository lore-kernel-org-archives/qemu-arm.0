Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3976408lfm;
        Tue, 23 Jun 2020 03:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIRUtwoKe74t1PdBtY3hlipDrBU1LErNQsh/mnLR8yC0z61JwjdL3zGr0x9V3K9Q4O3qH1
X-Received: by 2002:a25:c08a:: with SMTP id c132mr35140737ybf.118.1592908657299;
        Tue, 23 Jun 2020 03:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592908657; cv=none;
        d=google.com; s=arc-20160816;
        b=DRt6ybHOK4yWDw4sZbi9zFVNHYD+UB6rkqpty93Xhgow4ySqlt8XtZ3ziuJvnmD+Ji
         6P2Jy7CoRZT8v+L5LyHGLyibJc95YDDo6xq7Y8oUWPFNEF4sG1aLHHDpl9rsDReDOfts
         61J9ogplXZScOhRGL1fIw9EAgEJHDL6LxmwKzXciY3NfdgLRj064+t12Ml00kse1wzVE
         qAsji5U/IHs6sep4gAIfcYIIc6u8C5GA77rMsa9IOE1Hu7D1A9Z0Z2bpwcvuDYUt8BAE
         r8esMtUYjkiBhlWTEfXxwS3eKtXGunQ+Z/eTZnhJtHlr3tRRb0sCa3t7ip1KXoaV0ow2
         iIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNpCe9Xf5Z5FWvCiL4N3Vt3CrcsQ8Z3kIRn68Z5fG9k=;
        b=OZmB0nz9kz4/vh6igt2svGKnfFABtSr/hFOciBrYgwROPSdOz8dBDDEVgx4roH4d8v
         2tEwJd6HbcCdMlCRNmyfjpOF8/IQO4O1T4sWliMIliz+bhOywWUxGQqzRahvHdw7/Ddi
         5GzXazUyDs6YdLEBYTNoqHVY+1Wmps5V6BthS7s/yRTGf/EOUxwvjIMh5zHo8O8Otzvm
         SRSS1PuzV1kCigrAT+6LeZtIBxzrSXGfrO0IfOlqoAQM2p0DcZh2N+kuQ2ZZBZIOpDKH
         PKfGcWFIvH1GPXWjQmRYjHOw0VqMkRlLawdKkmd2Ahv/OybrOsIyYmi9QXlLEp/+aGHC
         4CYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VjHF/AuU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si15124016ybn.352.2020.06.23.03.37.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 03:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VjHF/AuU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jngJ6-0006bc-Ns
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 06:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jngIz-0006bP-Ny
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 06:37:29 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jngIy-000070-9I
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 06:37:29 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so2521255otc.3
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GNpCe9Xf5Z5FWvCiL4N3Vt3CrcsQ8Z3kIRn68Z5fG9k=;
 b=VjHF/AuUJs6qCVCVzKDfaDuwyNRhxExM3TUfmvc/v9+NeTVg+d51oGnzayhD2JEPZq
 sdMynLo2KvwyeqPxUYsTBo+cEKKD3fOogLV8WRflAu6+oJkE+zofDUHzGi4UA9ZsZpev
 +e9qcano7Yqs0RL8yMxd/2Iuz8Cy2TCk5tzbbf+xhzdnF8vWnuJKDqBHIXBS2E2gCAn6
 S2mDg2pAHrpLDjOiTRbyOjO3sjy4eDai6U8NAD9qsT2ZDsF98wguGXaVpFGGOaU8z8GQ
 MTifx3kYAufiYcoaq5QcIyUw4j1Pt9X8Q7DwGEEJJmuWtg1Wbwn4bwPSM/0vSEl0jCP1
 no0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GNpCe9Xf5Z5FWvCiL4N3Vt3CrcsQ8Z3kIRn68Z5fG9k=;
 b=WOikyVZq/Davs9XXSB0SlO3q1fjWDHSP7vysXVITjk0z/+27hWXYtvn724P3z0ugHl
 m/De9l95Me16iSFJM0SyuhkcnMrrFdJn4O7cezlvmGyjSk5XWuiETB5ax6MGt5Z4OHWp
 k7FglCa/zjO4tczTDdFl4c6unpIChtq0HyakoYvOVzeNz8lT8zR0A9pKgx+RX9TpI+wT
 fl5fuCajhDh7W2ZR3draqxtu8W7mY9N70fXzP3qX0Fr0JAAcMQopITMapyl+o6JW6imz
 k7XpBpTTjLC8GRaKbKnyLT7HlG46R8womqFRiQqZ5k+ffscH8jdeOEBzrvRKu2F7YmWv
 g83w==
X-Gm-Message-State: AOAM5329QTAtP//QcFZKLhPRmf7ToRRVKwvBOgKhbXz2IUJ2uqHfRgoL
 V7clF+cDvoDwZlSUduJvY2t1rM8xM+AJaGaAjpnYQA==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr3586650oth.135.1592908647266; 
 Tue, 23 Jun 2020 03:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
 <b4d4a654-3d45-f7d7-1009-8e9f055f88d4@redhat.com>
In-Reply-To: <b4d4a654-3d45-f7d7-1009-8e9f055f88d4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2020 11:37:16 +0100
Message-ID: <CAFEAcA88dn8M5DSjr7WwTVEJGvN5-dKe8kiFCX06M6nruPJvQw@mail.gmail.com>
Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 prime.zeng@hisilicon.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lFrkvnO3B5L9

On Tue, 23 Jun 2020 at 11:15, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Shameer,
>
> On 6/22/20 2:41 PM, Shameer Kolothum wrote:
> > This adds support for memory(pc-dimm) hot remove on arm/virt that
> > uses acpi ged device.
> >
> > NVDIMM hot removal is not yet supported.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Works fine for me when passing "movable_node" in the guest kernel
> params. I am able to hotplug and hotremove PCDIMM slots several times
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks for the review, Eric.

Applied to target-arm.next, thanks.

-- PMM
