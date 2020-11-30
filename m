Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5115139lfb;
        Mon, 30 Nov 2020 05:13:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG2vz/4P27XXxEkr1Ir3oHWD6J+51qC24HVmUhxfhKhMwv3rXU27HJg+xWhsVzXGQihrxI
X-Received: by 2002:a25:38ce:: with SMTP id f197mr24576864yba.12.1606741986349;
        Mon, 30 Nov 2020 05:13:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606741986; cv=none;
        d=google.com; s=arc-20160816;
        b=RnjkbUdpKpIEasF/7rw/vCAB3X/+z6xRp8HTiqCPfk3eHsA3v71JTMHdioJzTSL5ev
         RGdW2Dy4i/PeYx/thUJVsVwoV8ZXWxZFsfdnI2yz4ZVnAPl0N7zdwxapsuP7BvUJ2Dbj
         MCQwNZ6gmATd4EMO7Qh740QTy+WvrfQ3zVH9NWYWAXUoTdSq/kHVgsAuFRl+39XloGo1
         oMDJBQf0OH8UTRv3OGCXsLqFfG40GNwqoKdIGM5TxE5AQd2YFikhF4oIBZSSjIPPDTzt
         YtvM9EL8pAnjHxeN1sSzqLMAJHQ6rr+CMZ1NwEQbI3lBrMzq5nSB+qSxhKwHUC5njwvL
         wHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+cQUQe+R5J9nJO78a40Wfj9NEMSXgjbnuBH4fDcF9eQ=;
        b=P//O3CiDije4xTn6634x0lNwMck9ry8Y2YXdM4/s/jLEcPfzU33UB7/UbC2JqeW9xi
         E6IS1skHrJFzJqu48QyINVjNP70sOkoTC2Lux2DzoiD0IgL2gw17WpTe47G7wc2DIUe7
         ZC0oX95oIy15vNX1uok90N3KLND9GTTUWADdBGGqn2VnR0oVHVHHX663pIpsK5/X+mkN
         DE1a4I0FbyrGfRYUB7GoWGXiWW/2eDkKeLe64mMOlGA4hNkf5ZdKQnNxf4uYnn6BcKlK
         uknHHHq5CISJwRv6wc+1S9llZhY31pCU0Bp1ZvJ457Pm2ZCBB0kPrVG7C3FSZ2+nbvdj
         JZUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B6r5dZ2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si19680211ybb.239.2020.11.30.05.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:13:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=B6r5dZ2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjizJ-00050k-HB
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kjish-0001Ga-Il
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:06:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kjisd-00064N-Pm
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606741570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+cQUQe+R5J9nJO78a40Wfj9NEMSXgjbnuBH4fDcF9eQ=;
 b=B6r5dZ2qOcHgVOgttXq85PqqBfoAMyudt+aIxC3wgm0wzoI27i1bOIhlruYmZz9SNKXYaq
 vkYG3FtEvg8QQsuzcO3zzmclbnUj611CW0zLl3ePKnP9Y0u6bqQuUaRJ7YU7o9YyVzr2Lf
 7GcrVOOCh8Wi/vguQ2vvsqYZFIN9mCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-CutMxep_Nwu7IgFwroGMGA-1; Mon, 30 Nov 2020 08:06:06 -0500
X-MC-Unique: CutMxep_Nwu7IgFwroGMGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C622E809DDA;
 Mon, 30 Nov 2020 13:06:04 +0000 (UTC)
Received: from [10.36.112.89] (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DEF260C4D;
 Mon, 30 Nov 2020 13:06:03 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
To: Peter Maydell <peter.maydell@linaro.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>
References: <20201124023711.1184-1-jiangkunkun@huawei.com>
 <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <54899eb7-e16d-502c-4757-f24596fea446@redhat.com>
Date: Mon, 30 Nov 2020 14:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_tfEO0FaTq_Ud4FE_j93O0ohx3mGKtm2GoGZDfw-ZPAQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zm1tQM5w/5V7

Hi Kunkun, Peter,

On 11/30/20 12:29 PM, Peter Maydell wrote:
> On Tue, 24 Nov 2020 at 02:37, Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>>
>> Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
>> Descriptor is 5 bits([4:0]).
>>
>> Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
Acked-by: Eric Auger <eric.auger@redhat.com>
> 
> 
> Applied to target-arm.next for 6.0, thanks.
thanks and sorry for the delay

Eric
> 
> -- PMM
> 

