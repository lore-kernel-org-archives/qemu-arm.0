Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4094919ejb;
        Wed, 22 Feb 2023 01:04:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+WxwhryhlIcdwfl2/BCTycUEjkz2oBp/3akuUCIJh1wIFZ9eXFccSPOC5yUbiofCSy8grV
X-Received: by 2002:ac8:7d49:0:b0:3b8:6d3a:5ed4 with SMTP id h9-20020ac87d49000000b003b86d3a5ed4mr12841378qtb.67.1677056665534;
        Wed, 22 Feb 2023 01:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677056665; cv=none;
        d=google.com; s=arc-20160816;
        b=yw2uB4cPR8tm5wLb7XzKtr1LzhbBHg9VuA4QoWCEUlRTS0DA1ZBlEy+uc/BhOGXtsn
         gLGH0K7DLixCam92xt9+L/ySbexrVCw1hp51qnQ5k1A+mq4tEWzJdNKlGFGICZYnRtXc
         mXe7jpFTyQFvTAXlQw5zcafVt8gGEOU3SL9uCcc8c+mXsN0i7HCEYBPSOgbJjsTyedzk
         TmCMZaMRBdJiaeNhAa03pfsR0Jt2Tp+jKbt6/qvTYc14J9Hd5X0gn+2EQ7pCP0RhlGIN
         pYbGUjTDpaJ93yqtkNjeqsUXPT4v68QuZP/y9KD70CKljJYq8VuJvL+bKUIvbprAhe/8
         /U1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OiXnw8QMfHTVHjMiA79ZF2teZc5/Za1bnnaV0A7jDCg=;
        b=RitjwLjdizUPwyagm3bQfh+IKUy+L883q/Hmty7V5WPZlNBXsOPBskssKxA3245tkS
         B1oZdhuzeDkS/JM1Lk4sbCGkKCbnxepxj4UfW+KnJD8LcbalEPf4jbxHVrrSFlo6hFEu
         VHhwePGftJvG9fQPTyBt+lW/nrVh/r1CAUy8DWIstpz3qevHaslR/ws/hCPX/cDq2js3
         Ufi5k1NGKpNlUDXcF6HsYdTS2Y4kSb4lJ2UM2AHr+Z2ZR2OosgknwFE6DO0sNNdKC0Ms
         7DWBXZH4MSwarSTPA2dezXUgJHHUy9kigvw9GRrNt1XR+DpueO6r7Qg+Vx/qeX+9UHsW
         WykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gdn2+mmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020ac85b8a000000b003b6a098691csi926707qta.147.2023.02.22.01.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 01:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gdn2+mmg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUl2g-0005IF-KD; Wed, 22 Feb 2023 04:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUl2f-0005I7-OI
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pUl2e-00081S-6k
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677056633;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiXnw8QMfHTVHjMiA79ZF2teZc5/Za1bnnaV0A7jDCg=;
 b=Gdn2+mmgmBAPLhXrR5zYCvfwyYL7RQtvIvhlNkSM4nrb69owviSbk80/2eQKPgu8kGKS30
 9L/x5YvM0GCv3jUV2kwGlpR7F1qXI83r5PeDEXUgms+uqgt0dv1KF5aBLaSu10o/GXaEAH
 TYOzusxDxbz/7RAIDm8ZQb5P+ortELA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-AxfJa8XnPBarEbulPZoyZA-1; Wed, 22 Feb 2023 04:03:50 -0500
X-MC-Unique: AxfJa8XnPBarEbulPZoyZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2CE087A9E1;
 Wed, 22 Feb 2023 09:03:49 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CDFC2026D4B;
 Wed, 22 Feb 2023 09:03:40 +0000 (UTC)
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
 <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
 <2a13c5ba-e20a-ae96-3efd-1f7e2d224eff@redhat.com> <875ybuaxu8.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ca3d474b-29bf-4707-8f80-9f26d898217c@redhat.com>
Date: Wed, 22 Feb 2023 20:03:35 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <875ybuaxu8.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vNp5WMG51gVX

On 2/22/23 7:49 PM, Cornelia Huck wrote:
> On Wed, Feb 22 2023, Gavin Shan <gshan@redhat.com> wrote:
> 
>> On 2/22/23 3:30 AM, Peter Maydell wrote:
>>> On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    linux-headers/asm-arm64/kvm.h | 1 +
>>>>    linux-headers/linux/kvm.h     | 2 ++
>>>>    2 files changed, 3 insertions(+)
>>>
>>> For this to be a non-RFC patch, this needs to be a proper
>>> sync of the headers against an upstream kernel tree.
>>> (By-hand tweaks are fine for purposes of working on
>>> and getting patchsets reviewed.)
>>>
>>
>> Yes, I vaguely remember there is script to synchronize linux header files,
>> which is './scripts/update-linux-headers.sh'. I think I need to run the
>> following command to update?
>>
>>     # ./scripts/update-linux-headers.sh <LINUX_PATH> <QEMU_PATH>
> 
> Yes, and please include a reference to the exact Linux version you used
> in the commit :)
> 

Nice, thanks, Connie :)

