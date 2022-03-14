Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1888205lfo;
        Sun, 13 Mar 2022 23:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8OfgJzihR1jCZlUfi6zDb+xJdK/AMx/soTGSFxUKJ8cLMLsC0vjxYfEns/fnw8186YH2C
X-Received: by 2002:ac8:5a8c:0:b0:2e1:b3e5:c923 with SMTP id c12-20020ac85a8c000000b002e1b3e5c923mr15071310qtc.647.1647239092826;
        Sun, 13 Mar 2022 23:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647239092; cv=none;
        d=google.com; s=arc-20160816;
        b=s+VYBEYOghnjePjYZtHSNwPt/7n2X4bxOngGrpFnPUWpvRFYLG9Q+A6ezI0xcNscx6
         brcPpAHnr8SVoJ6AFas2e8XvZ1LXfNQPCupURDeq6eNkbzFCjvKza5yXpCyGKjB8Ip/M
         mKFc5yMe1L2qgyfTo4HMxKs7Qum6XKt2zuDq5Qc9QLqsAOmGXMhDPZQCuPCTU8tsKFgo
         tF3iaGdR2kewiCa0OfMWTMu7iYemnjvFBhR2naEmnPNwA4a1JaNly2rU0XvrL4CHIZsB
         tgNbKEVS4w+LxfZqzCU9+yv75nG6/7gS8MOywLiFMm9XTN3u8s3oiLjCm+QUv5N1Jkcc
         ccQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=/Z5WWfBSf5eaaGbZO8/yTp39Lv7XafhTAv4YklOLmMA=;
        b=S5WKOmXxrpyQILhF/+cWfSnJYcmszq6HH7xOKR/XVP7rFG/54On5pDodkMv65MBviq
         p1ALMDSuADs2Sctmz8i0xKLmOrxruCisMVS0+M2kb2pDH39iwM26vBebQTsGOB+RZD3Y
         XA3NmQFY17aMO8+cnD5i+/zbf61VJLmUriB2XaFLoN8jsSfE8AN5yv/7x8/WBgMSMvY1
         JakjXiYAN8OJ1sG6vZngoFyl2dTNXx6G2A0lsfQDpM646sPF186oFRUKTIr+x10CQizG
         LQtCvVsk5xz0kjtShm4T3mUTOqQEyMQ+35JqQEVdlnxLlyVkyQP/nf/U0rd4Wjc9RkcF
         xuLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lkzt+NUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t32-20020a05622a182000b002e1cc4530f7si2320306qtc.533.2022.03.13.23.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Mar 2022 23:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lkzt+NUJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTe8S-0004Rj-Bf
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 02:24:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nTe8H-0004Qy-D5
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 02:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nTe8D-0002FT-W1
 for qemu-arm@nongnu.org; Mon, 14 Mar 2022 02:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647239075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Z5WWfBSf5eaaGbZO8/yTp39Lv7XafhTAv4YklOLmMA=;
 b=Lkzt+NUJomdx4r/JXvgoKK3a8KaXpKBHayZaHLgIsUKZ/ntjPKqq0OUYLnZXO4V8EenMEj
 AqagWcMOpME6pdhKUWkwdpRj+KP6ah+vd4g7g7zMOMGMuPnkt+GujWyHXMLbdMLp9awtGq
 X3b7JVPwIoJgh4nxIYPtjBU/KacH5J0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-gdxVFmxpOoiP_wZvR79lew-1; Mon, 14 Mar 2022 02:24:30 -0400
X-MC-Unique: gdxVFmxpOoiP_wZvR79lew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ECD33C11A00;
 Mon, 14 Mar 2022 06:24:30 +0000 (UTC)
Received: from [10.72.12.179] (ovpn-12-179.pek2.redhat.com [10.72.12.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D5B95E3A23;
 Mon, 14 Mar 2022 06:24:25 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
References: <20220303031152.145960-1-gshan@redhat.com>
Message-ID: <eec5ab0f-fcc1-cbd3-988c-e654ddb4932e@redhat.com>
Date: Mon, 14 Mar 2022 14:24:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j2h1s5HfbKVv

Hi Igor,

On 3/3/22 11:11 AM, Gavin Shan wrote:
> When the CPU-to-NUMA association isn't provided by user, the default NUMA
> node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
> Unfortunately, the default NUMA node ID breaks socket boundary and leads to
> the broken CPU topology warning message in Linux guest. This series intends
> to fix the issue.
> 
> PATCH[1/3]: Fixes the broken CPU topology by considering the socket boundary
>              when the default NUMA node ID is calculated.
> PATCH[2/3]: Use the existing CPU topology to build PPTT table. However, the
>              cluster ID has to be calculated dynamically because there is no
>              corresponding information in CPU instance properties.
> PATCH[3/3]: Take thread ID as the ACPI processor ID in MDAT and SRAT tables.
> 
> Changelog
> =========
> v2:
>     * Populate the CPU topology in virt_possible_cpu_arch_ids() so that it
>       can be reused in virt_get_default_cpu_node_id()                          (Igor)
>     * Added PATCH[2/3] to use the existing CPU topology when PPTT table
>       is built                                                                 (Igor)
>     * Added PATCH[3/3] to take thread ID as ACPI processor ID in MADT and
>       SRAT table                                                               (Gavin)
> 

Kindly ping. Could you help to review when you have free cycles? :)

Thanks,
Gavin

