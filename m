Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3970467lfc;
        Thu, 14 Oct 2021 05:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkJIRroFVy4E2D2nN0FQqa/W+dsyD6vDHbqUZrIJltkbljszUdvmj0ItfpM81nSs/zcWtO
X-Received: by 2002:a7b:c4c2:: with SMTP id g2mr5565679wmk.134.1634213504026;
        Thu, 14 Oct 2021 05:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634213504; cv=none;
        d=google.com; s=arc-20160816;
        b=FtclJ/7N7Q+OIxYxEGhgA7FZ83MCtQq1cSj1LAiqEpUzcjf6Yd2jQJccBPPpYKe+ip
         TrsotnixEU4kKRudQSBbZTlkSSP9l07FWGyADYSqyPbFXRAU6Sc2MpPCytoH0qdNUSrq
         wk/mOmJVO5eZSCsmOQThmP79oznlugAGz6ZOZre9Fr3zzEO/yY87xCN+23ZnBccXgRw+
         HH0kgFOdKu0XnuN9PnP9IGvPxptJ/FVP0uQltdjfOL8vytoBEvrRPLP1/oDrjS2WhKK5
         7buT5Z2/+So+kJzYnAjlY3Dig8Q2ybBNcGsPxzuDUZEngdkrMaSzAdaBhYGHYNCbaMNG
         LOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lwW6grCDLqkcnD5nmFsNz1BTPRT85AQGIbFaUZd3cJ0=;
        b=rGexX5cuwGUzXpEmtCd0sgfp/z9NvG1Afmz8qdrai4AzFFqL3LGmeRgk080OGAwN/L
         6kvOPkbhpaEYfaqJK4yvDBrBAuK6uqGikkZgH1Hexg7bFZN+BaCd0ylR1nNX9EWMA4iN
         3q80GtveetaDY7mbOPemkhXoLYTcUvU1Y+tIvsM7iN9B6AaXw4pK3kvviQWaBnflw1gO
         GHGEbXS90aPk5trMTcXkwW/2ThlfUzscvnrjkSzp5ewdOMtENh0Y1tXHLCQg4KrEb4Fe
         8HAgsm1tzTr3UF5+CbOeqSLnUF09LvLSjPoziB2ivkETfj+Q10beg+Vt3VjaP7FG57iT
         kcRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BK/oWYwG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si3699044wru.511.2021.10.14.05.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 05:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BK/oWYwG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mazaJ-0003Ip-3t
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 08:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazVu-0005DZ-5k
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 08:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazVq-0002hc-JY
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 08:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634213224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwW6grCDLqkcnD5nmFsNz1BTPRT85AQGIbFaUZd3cJ0=;
 b=BK/oWYwG8AMEpVZWwR/guG388xBlVgM8ANnhoZ1vKU+2iaerN0RMtPEv3279hqb8gERvKK
 lYP/l+hRk3GfgWMNlq1mBZpyxrj+shUV/i0KrC0ikGZzJQWKmtbpq7tmEgJxoAVSMIsliK
 2awHE4/7+XL7vgQv8kZnmzsGSVRPv44=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68--vnie2pZPCOi3m_NBrEv5w-1; Thu, 14 Oct 2021 08:07:03 -0400
X-MC-Unique: -vnie2pZPCOi3m_NBrEv5w-1
Received: by mail-wr1-f72.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso4393734wrb.4
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lwW6grCDLqkcnD5nmFsNz1BTPRT85AQGIbFaUZd3cJ0=;
 b=dxn54px7aMGZ3m8gRI7tYuHxXKN6zHQD8W4rFa/3HsBqo9pM/w11qdYHnnvClvGbC9
 mL4gipBw4Pq2VYXYHt8h5kMGI1DYgI2tv5HivEE46nogWAon54kOdJXYmEpBI1Z+lXRO
 qP5bG64JdNvgovuQNjeRKRj+xcToy9XdIJ9EQ1k0RZzq6GLGGguRjapvmwIVloLHLfNV
 TrMB0DQEnKPeEVIP92rLSf1F5yPgtru1CuD1GYbsnVKMHnh/cFGQIlg2ETooqmKiswD6
 n5rT/f/indaVDCGDJCBqHpYBASX2vx0i0NwD+h7UvUnGXi+SQ9udqL6ljG3RYC6hMl1w
 BElw==
X-Gm-Message-State: AOAM530sdQjjSKzVaH9KyblMnxaRoUNetgHVNuUCHOtUftFIhxAi7+jg
 98OKNNSdvwQJONwWiaf4G0oji6pL2LDzVtEEYfasTa/EwfZiprEQ442sZAPaV526Z38RymX8jfT
 Y7Y7MSyGGNv8Q
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr19546444wms.157.1634213221668; 
 Thu, 14 Oct 2021 05:07:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr19546402wms.157.1634213221331; 
 Thu, 14 Oct 2021 05:07:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q204sm8100587wme.10.2021.10.14.05.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 05:07:00 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: eric.auger.pro@gmail.com, imammedo@redhat.com, mst@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
References: <20211014115643.756977-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bd50e8e9-e1ed-cd28-5259-1369a3d21399@redhat.com>
Date: Thu, 14 Oct 2021 14:06:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+lrh+7xOYzR

Hi,

On 10/14/21 1:56 PM, Eric Auger wrote:
> This series upgrades the ACPI IORT table up to the E.b
> specification revision. One of the goal of this upgrade
> is to allow the addition of RMR nodes along with the SMMUv3.

while I have sent a separate RFC to expose RMR nodes along with SMMUv3 I
must aknowledge this will take time to be upstreamed (SMMUv3 nested
stage thingy), if ever, and this anyway requires additional time to mature:
- there is one problem with the IORT spec which mandates 1 RMR node per
BDF and also
- there is the issue of the boot preserve_config which was known to
introduce some regressions and which is also mandated by the IORT spec.

So I wanted to emphasize that this IORT upgrade does not come at the
moment with any new feature. My understanding is old guests should work
fine with this new revision but if you feel that's a bad thing, please
raise your voice.

Thanks

Eric
>
> The latest IORT specification (ARM DEN 0049E.b) can be found at
> IO Remapping Table - Platform Design Document
> https://developer.arm.com/documentation/den0049/latest/
>
> This series can be found at
> https://github.com/eauger/qemu.git
> branch: iort_Eb_v3
>
> History:
> v2 -> v3:
> - comment on IORT node ID (Igor)
> - single mapping disabled comment
> - Added Jean and Igor's R-b
> - added diff to patvch 3/3
>
> v1 -> v2:
> - fix Revision value in ITS and SMMUv3 nodes (Phil)
> - Increment an identifier (Phil)
>
> Eric Auger (3):
>   tests/acpi: Get prepared for IORT E.b revision upgrade
>   hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
>   tests/acpi: Generate reference blob for IORT rev E.b
>
>  hw/arm/virt-acpi-build.c          |  48 ++++++++++++++++++------------
>  tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
>  5 files changed, 29 insertions(+), 19 deletions(-)
>

