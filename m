Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp863ejn;
        Fri, 23 Jun 2023 00:05:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Vl+EcFMOUm32GfbtqFPzQROzCGFbr9ECAwEQBpN5kDaq69lb9FhgKhLa/h75m2PhU9QxG
X-Received: by 2002:a05:6214:c27:b0:625:75dd:236d with SMTP id a7-20020a0562140c2700b0062575dd236dmr23531119qvd.23.1687503910264;
        Fri, 23 Jun 2023 00:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687503910; cv=none;
        d=google.com; s=arc-20160816;
        b=lAwX9/cmMwonNn5jMYb5Xi40mTgQ224OKUWH8LZynODf02WJgUy7qHibD6+cvu3OCX
         tid20SaaS58mdIKcN27FJCcs0NaNuvp8uFg5cjGSU1MYXBeFmcCjjtZeJTNZGfcd9HOC
         WMiEkJi0Q2sdUb2bF6pNWU9qSkw2Kw92czX397UCg02r4kD+Vld9BIvBisqq+4tkzZKo
         qFpBgNsu4IR0GN2zy+tDIbku8WPpXYX85WvawNs0uD8VA+EANI355mym39merf9wi1Yu
         Y/vnA0LebrQD7v3qTPx1HmJxwolFOndcoPjmIsjZrw5Cs1RjboPdMDnvQ7DaoscY+Gn1
         G4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cT4MyoMDtwoUaZudbQdRXjpQgVGQFbmpGqTjbUxnO+k=;
        b=KYs8LJiumhst+xJlKNT/gnSlf0v7m3xwCMxkQdKpVkAwuOzwe+WBKmLtWqhjktCc1s
         fLqW41MFrKOfICOI5GePGDjvcoAQa1E4hsyw40tpn78/Kh2JmkQF4xuaKJFPOolF6H5u
         /jPJUlElQkDX1nVmbg4rTQI63AVyTBTkXyzhML6YuXAJeQk07PHSSIhmzcjl6cNCwVuQ
         GWWnPKQn4WqKJ6S031l0o4SZxDgymSxxNmdp5Hvbc9jLjrpeKf5J3LkOI5gyx6zPByAr
         taL05mVrFUXOnvYwbfXCiWvnVXpOzUk18VGua+YybrEOLs782weDWvCReJK8L6xiIEDn
         32sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HpIXGafR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85e4d000000b003e96dcde986si3340899qtx.692.2023.06.23.00.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 00:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HpIXGafR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCaqo-0000M2-Pl; Fri, 23 Jun 2023 03:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCaqi-0000Iq-Jo
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 03:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCaqg-0004wy-64
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 03:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687503889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cT4MyoMDtwoUaZudbQdRXjpQgVGQFbmpGqTjbUxnO+k=;
 b=HpIXGafRoy04cVkf9WjhMgdsq5XSIt/bNj6PejanupK89xGWxxHBvRLqE+WznVJvaLXNJQ
 gPywA9lCYP4yBDm6GAVui7iZfIEcD0lqPGfditkKnvBP3Yd34Kcf6aO5iwuwaxHfGwM5XE
 JlQP1PfJWvI4KbzGWb91Zf0Y/IsLI7Y=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-G4N-e7xgNW2CkAOIG6VFsw-1; Fri, 23 Jun 2023 03:04:41 -0400
X-MC-Unique: G4N-e7xgNW2CkAOIG6VFsw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f9644c213aso184168e87.1
 for <qemu-arm@nongnu.org>; Fri, 23 Jun 2023 00:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687503879; x=1690095879;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cT4MyoMDtwoUaZudbQdRXjpQgVGQFbmpGqTjbUxnO+k=;
 b=PSSpiFedKQpHcBHiIjLYvhEYhvhWHiiTAEYUNiNAApl2CEhor3TuMz3bD0FU7uy+PW
 WBX1I6VAfhmgs5UtLvcioHgE3kLkzEMBcpJ5fVSiQH15YrgSpTehcwVUwK9tf/TFEEaw
 L0kuxvQTxbzGqkRc5SaxcmeWUKJVn9xvOqJ3Htf2lnQHZgyF2lb1D10OhM++o+GtsfjT
 1n2n3F9I6AVGX9rtZ10gWzhIOYY1au9fB7ZkJ4M/UBEuECwtYSy9kzeyL+JKNWqIGMSA
 /KowcaI9pZH8lL8QhzjQabb/v5Vshs/gdeIxETkQKF+QQPL/MK16ju4weQTOBzEVbAPJ
 tA2w==
X-Gm-Message-State: AC+VfDzzg5CtzaaEMMW+smoFlc1HXTmchZwfZioHlbadmstMkNr7cQC6
 75y5FFCOlC6v6QNZiYx7X1RqD2JyJY2EzqwV2ErdJ0yqHj7wksq1DvqqM5ptW51w3XmsONB6mLF
 ax2Yk45QNb1kd
X-Received: by 2002:a19:ca4e:0:b0:4f8:8be4:8a82 with SMTP id
 h14-20020a19ca4e000000b004f88be48a82mr6531520lfj.22.1687503879581; 
 Fri, 23 Jun 2023 00:04:39 -0700 (PDT)
X-Received: by 2002:a19:ca4e:0:b0:4f8:8be4:8a82 with SMTP id
 h14-20020a19ca4e000000b004f88be48a82mr6531502lfj.22.1687503879201; 
 Fri, 23 Jun 2023 00:04:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c729:1700:9783:58ba:9db:1221?
 (p200300cbc7291700978358ba09db1221.dip0.t-ipconnect.de.
 [2003:cb:c729:1700:9783:58ba:9db:1221])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05600c221400b003f8f8fc3c32sm1426036wml.31.2023.06.23.00.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 00:04:38 -0700 (PDT)
Message-ID: <81e0644d-96fa-8d1e-17b5-03f548729c93@redhat.com>
Date: Fri, 23 Jun 2023 09:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/5] virtio-mem: Device unplug support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
References: <20230613150210.449406-1-david@redhat.com>
 <20230623015740-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230623015740-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H+6BpMuIWh/K

On 23.06.23 07:58, Michael S. Tsirkin wrote:
> On Tue, Jun 13, 2023 at 05:02:05PM +0200, David Hildenbrand wrote:
>> One limitation of virtio-mem is that we cannot currently unplug virtio-mem
>> devices that have all memory unplugged from the VM.
>>
>> Let's properly handle forced unplug (as can be triggered by the VM) and
>> add support for ordinary unplug (requests) of virtio-mem devices that are
>> in a compatible state (no legacy mode, no plugged memory, no plug request).
>>
>> Briefly tested on both, x86_64 and aarch64.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: Gavin Shan <gshan@redhat.com>
> 
> Lots of duplication pc/arm. Which is not new but do we have to keep
> growing this?  Can't we put at least the new common code somewhere?

There are some minor differences in the code, but I guess we could 
factor the (un)plug handlers out.

hw/virtio/virtio-md.c
include/hw/virtio/virtio-md.c

?

-- 
Cheers,

David / dhildenb

