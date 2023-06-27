Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1209919ejx;
        Mon, 26 Jun 2023 19:35:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zDAQE3D1djKFoYLJgu2JZDCIT5ilWF7VsbFVVywa7wElbQHHcOUwOyJw7BHu7MK3Oa62o
X-Received: by 2002:a05:620a:1992:b0:765:44c2:826d with SMTP id bm18-20020a05620a199200b0076544c2826dmr14456647qkb.27.1687833316860;
        Mon, 26 Jun 2023 19:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687833316; cv=none;
        d=google.com; s=arc-20160816;
        b=0LS4GvCyTsQXX3Yg1Jj/Mfi8KtfmZEdRnC7ciMzM662Nu1qE4RtJvp157rhxogwRZM
         8nu2bk5d7C6mIU8GKY/UCrfJS0q/vkZHPvhyfsQUkmmnLGsslEV6UaWpPf91jV4H63dg
         tECeLWydZpzKxJY0h/ps/cfpwp+h3YCJZubvz8RQOYxGA8TnwmBKp8ynN0jaUNubx9Bs
         c+U7utsyPPPeqvPLVZW1TocW2JefeZZSJgAevjm3Gln3gccSMRWkfXuN6nt04uQZsgSN
         1mviQ0eUIBXFhNCQQE4oNyMtnseIjxpLcX950Nj3bajgBOuJ1/jZ7yrGJ+Etiek4OH3c
         aSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wu4+qGRzze9rNAF/oBI8QT0UDNN6zhdjUkN+ApOnm6A=;
        fh=p01iR0kXXdHzswPfYtCM/PuHg1+ebGVnt+Xmrsr4zF8=;
        b=rLNVgofcLOAHMNixV/gL0+9zPPWRkw+vX7hawr42nRHRCdISesYMEEJ6TWjO9wl3Gf
         RqJPnHTnsry5/cPPcDh6xQrWzRoAgnW2KDBLytJTEfU43SkK93s7UbOhSGxRklFczd42
         ss5S+xjR9PXep4vJxMmeEfqLxVAWsMZJLkcmYGRHaRK2CtysO7Hiemxy88Ep9iXbYhug
         km6bKc4MbakEVqZEzI0DmBbbOeWo3xlIoCG0uA57/KIKCoiIqGQDoY8oYPUHyhkSFgh+
         fyVvNpp1OMHzXqJTRMiG6VwrG6GgqPkecBhiRCn5NjjK9wZMy85p01xWAsl61YOHcSa6
         HNfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=diPK0sLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a098100b00757937fa64csi1496405qkx.484.2023.06.26.19.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jun 2023 19:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=diPK0sLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qDyXc-0007mg-LU; Mon, 26 Jun 2023 22:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1qDyXb-0007mW-Vx
 for qemu-arm@nongnu.org; Mon, 26 Jun 2023 22:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1qDyXY-0006Wn-3K
 for qemu-arm@nongnu.org; Mon, 26 Jun 2023 22:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687833286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wu4+qGRzze9rNAF/oBI8QT0UDNN6zhdjUkN+ApOnm6A=;
 b=diPK0sLaaHDRRYanSh97rOS5rI9AdlEnFRSqYMaxE670rAxh7DVe5QFFwqI2/O93tsIf73
 fkeYuJ51F3Ty2e9kX1TGqShbEvKJKP0E+890HWAUD4A5pI9KPQKHUuxiF/+/0o7h0E1tRO
 3Pa9AoUJaHZozVK/yLNXWdGe53Jegm0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-MKB-ZBS0Nh-E51JtkfCy8g-1; Mon, 26 Jun 2023 22:34:42 -0400
X-MC-Unique: MKB-ZBS0Nh-E51JtkfCy8g-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b80c4ca6c5so1278595ad.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jun 2023 19:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687833281; x=1690425281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wu4+qGRzze9rNAF/oBI8QT0UDNN6zhdjUkN+ApOnm6A=;
 b=k9yd395scsfsIvlbejqwzu1716R8sazOFBnmQKXeWyVwZMMgDwBrVLoAZgnpQ9RXbL
 Hawp8DbphNE921YBosrbpoRTGrR6051aK/GbugTAFfLGc6KBp2QG2SJSmc8dJAyNSsEl
 UvWhP2t+5Ni+pU6LMYjgcgRloEbDe/z3usFwXnUBjz+aIxpSVz/OGnBYuKEiqvMTjMda
 piLL9Uddgk0yp3LmQgvr3+o9uiIfGdSfuA5v4b7/JeXT17lls3KR7BRXKQnqVB6uacAU
 gi7EzUqy7cgYNmVYKzSrv0QO7MYMu7LRPRsmgtE6n9wpQBYg1y941RrczZejucSJ38ys
 Hd8Q==
X-Gm-Message-State: AC+VfDyggm1NBKfReRVUsJgjFVTG0gFRtQj7UkGO5/7m60/Rf+x+Rne7
 5ZsjwiYaz07lMHRwcwMUZJJQL5BLB1h5lIGjFhgLifrP9VLr3GvxDv5HuOUATzUrl7oKjGqAYoh
 T/gZ0rglFrlhK
X-Received: by 2002:a17:903:1ca:b0:1b5:32ec:df97 with SMTP id
 e10-20020a17090301ca00b001b532ecdf97mr36654229plh.5.1687833280751; 
 Mon, 26 Jun 2023 19:34:40 -0700 (PDT)
X-Received: by 2002:a17:903:1ca:b0:1b5:32ec:df97 with SMTP id
 e10-20020a17090301ca00b001b532ecdf97mr36654214plh.5.1687833280521; 
 Mon, 26 Jun 2023 19:34:40 -0700 (PDT)
Received: from [10.66.61.39] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 jn22-20020a170903051600b001b3eed9cf24sm4821765plb.54.2023.06.26.19.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 19:34:40 -0700 (PDT)
Message-ID: <fb5e8d4d-2388-3ab0-aaac-a1dd91e74b08@redhat.com>
Date: Tue, 27 Jun 2023 10:34:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/5] target/arm: Handle psci calls in userspace
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "gshan@redhat.com" <gshan@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@opnsrc.net>
References: <20230626064910.1787255-1-shahuang@redhat.com>
 <9df973ede74e4757b510f26cd5786036@huawei.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <9df973ede74e4757b510f26cd5786036@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: GVmu2K24/WLK

Hi Salil,

On 6/26/23 21:42, Salil Mehta wrote:
>> From: Shaoqin Huang <shahuang@redhat.com>
>> Sent: Monday, June 26, 2023 7:49 AM
>> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: oliver.upton@linux.dev; Salil Mehta <salil.mehta@huawei.com>;
>> james.morse@arm.com; gshan@redhat.com; Shaoqin Huang <shahuang@redhat.com>;
>> Cornelia Huck <cohuck@redhat.com>; kvm@vger.kernel.org; Michael S. Tsirkin
>> <mst@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>; Peter Maydell
>> <peter.maydell@linaro.org>
>> Subject: [PATCH v1 0/5] target/arm: Handle psci calls in userspace
>>
>> The userspace SMCCC call filtering[1] provides the ability to forward the SMCCC
>> calls to the userspace. The vCPU hotplug[2] would be the first legitimate use
>> case to handle the psci calls in userspace, thus the vCPU hotplug can deny the
>> PSCI_ON call if the vCPU is not present now.
>>
>> This series try to enable the userspace SMCCC call filtering, thus can handle
>> the SMCCC call in userspace. The first enabled SMCCC call is psci call, by using
>> the new added option 'user-smccc', we can enable handle psci calls in userspace.
>>
>> qemu-system-aarch64 -machine virt,user-smccc=on
>>
>> This series reuse the qemu implementation of the psci handling, thus the
>> handling process is very simple. But when handling psci in userspace when using
>> kvm, the reset vcpu process need to be taking care, the detail is included in
>> the patch05.
> 
> This change in intended for VCPU Hotplug and we are duplicating the code
> we are working on. Unless this change is also intended for any other
> feature I would request you to defer this.

Thanks for sharing me the information. I'm not intended for merging this 
series, but discuss something about the VCPU Hotplug, since I'm also 
following the work of vCPU Hotplug.

Just curious, what is your plan to update a new version of VCPU Hotplug 
which is based on the userspace SMCCC filtering?

Thanks,
Shaoqin

> 
> 
> Thanks
> Salil
> 

-- 
Shaoqin

