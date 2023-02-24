Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1625561ejc;
        Fri, 24 Feb 2023 02:20:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+3VLme3JLNtZQPKH86H1t2yFOqrTrFoks5JNtIe9xrynrj/ImKvWctKBqaeb9i6LbWs/Ei
X-Received: by 2002:a05:6214:19ca:b0:56e:fe99:b2a6 with SMTP id j10-20020a05621419ca00b0056efe99b2a6mr25903360qvc.10.1677234005654;
        Fri, 24 Feb 2023 02:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677234005; cv=none;
        d=google.com; s=arc-20160816;
        b=fJeXxI9JE1zlBp134q5pouZopHFfDLD1S0MUmdJDnpLwg/a4ZrXWsQx79V123lByq2
         xVttZKK1MWgBxeoI8qyE+h6z2fzIPtXFiifXM4y0DyqFF+yXdhfXrOj6j6RGKRLEi+tj
         QijJHqjJsoKcFBvjjrDzfVCIKBqwVBxXFPCSIBM1PR+fzolVHadnd9oPgRVRQaXBXgGR
         HN3FtuKNwE/Rpv5WJfDU94g4s1ppL5BPt0C8Yhimnf0qmWf8F9B3JsfpF+Qi3m97Zqaz
         5GOUpuHYTp9bdLBABMGob9+t7WyVIAwqGGQ0i3Dok9qQa+/sNhit1EhRgqIHcR6PUWz3
         miwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2ctk8RhdYTrY+5e2PdV4i5XYnCi6ug023nYLAWkr/KA=;
        b=xsA6fR76uBGGwSs8svmGqEZFZ2yYhJKKRLv7LCVvNShPfepFzku0GG2u9r5TltVfeS
         7CW89Ne8cRQ7sVk4ADbG7qg8frQ75CeoHsus7VSTXW5cZTb0xU/R9+vv+nfHJuS3mSd9
         bcee6aTXXFElZIj2hBKF3j9va5w6SKpYcDgCE/gKjbDZnwjd6BrstlU1QMvRN4WYbBWL
         vV98D62eFO/tOzHaw12jMVO2C/r4jy+jrRGYyRxppHrIzU/Iu65mEU5hTxGegRYnbEIn
         N0qcIGE0eVRATgzSwmpjpqwG37lZsd+67gGEKGQjsC23Zte2akuXW+XMI5Z4zDnRR47o
         pOjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E1O84Gec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a0cf4ce000000b0056ec8466c03si10195385qvm.394.2023.02.24.02.20.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 02:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E1O84Gec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVVBA-0006Wb-BM; Fri, 24 Feb 2023 05:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVVB7-0006Vo-Aa
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 05:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVVB5-00035e-JF
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 05:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677233986;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ctk8RhdYTrY+5e2PdV4i5XYnCi6ug023nYLAWkr/KA=;
 b=E1O84Gec2nMHbwkzDkJqawK+bgvrwAtLKmE3cI/xURXmmgxg9I754qF4iMw3xTFK/U93ZQ
 +H9gz6oO0DJYAz4gbNF9T+dSvMBB9Q0lh+fkk6Sy8qguhaP/B6DDfEBjBnwriRb8NdITKK
 zSZ6yNRGc2e3HjhLKPzE5pzdHVlj5H4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-oS8NMwmGP7mZdXN4gq42oA-1; Fri, 24 Feb 2023 05:19:42 -0500
X-MC-Unique: oS8NMwmGP7mZdXN4gq42oA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C2C385A588;
 Fri, 24 Feb 2023 10:19:42 +0000 (UTC)
Received: from [10.64.54.42] (vpn2-54-42.bne.redhat.com [10.64.54.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B93EB1121314;
 Fri, 24 Feb 2023 10:19:36 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] hw/arm/virt: Enable backup bitmap for dirty ring
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-6-gshan@redhat.com>
 <CAFEAcA_6pYvot1AGKfOQA89M9tdH-e6+9jkd3RtXJkGhSLdihA@mail.gmail.com>
 <0db2764b-7d27-ee6a-c7e4-7d7821986c16@redhat.com>
 <CAFEAcA_WjugivvOWxH-bVSNakPWyhX=j5pWydQQpweDVDYd2jw@mail.gmail.com>
 <e0044c64-02f2-32d2-b096-50f9c1f1fe19@redhat.com>
 <CAFEAcA9P0MiuRtTDTVCx_1cPxv4yNH=pJSPqO_n=OzDWjx_gOw@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <f97e4bab-e485-12bd-8e18-e949c18644a4@redhat.com>
Date: Fri, 24 Feb 2023 21:19:33 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9P0MiuRtTDTVCx_1cPxv4yNH=pJSPqO_n=OzDWjx_gOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: Osw1iPQ+J2Bp

On 2/23/23 10:51 PM, Peter Maydell wrote:
> On Thu, 23 Feb 2023 at 00:52, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 2/23/23 2:54 AM, Peter Maydell wrote:
>>> But we might have to for other boards we add later. We shouldn't
>>> put code in per-board if it's not really board specific.
>>>
>>> Moreover, I think "we need the backup bitmap if the kernel is
>>> using its GICv3 or ITS implementation" is a kernel implementation
>>> detail. It seems to me that it would be cleaner if QEMU didn't
>>> have to hardcode "we happen to know that these are the situations
>>> when we need to do that". A better API would be "ask the kernel
>>> 'do we need this?' and enable it if it says 'yes'". The kernel
>>> knows what its implementations of ITS and GICv3 (and perhaps
>>> future in-kernel memory-using devices) require, after all.
>>>
>>
>> Well, As we know so far, the backup bitmap extension is only required by 'kvm-arm-gicv3'
>> and 'arm-its-kvm' device. Those two devices are only used by virt machine at present.
>> So it's a board specific requirement. I'm not sure about the future. We may need to
>> enable the extension for other devices and other boards. That time, the requirement
>> isn't board specific any more. However, we're uncertain for the future.
> 
> Most boards using KVM are likely to want a GICv3, and
> probably an ITS too. A board with no interrupt controller
> is useless, and the GICv2 is obsolete.
> 

Yes, exactly.

>> In order to cover the future requirement, the extension is needed by other boards,
>> the best way I can figure out is to enable the extension in generic path in kvm_init()
>> if the extension is supported by the host kernel. In this way, the unnecessary overhead
>> is introduced for those boards where 'kvm-arm-vgic3' and 'arm-its-kvm' aren't used.
>> The overhead should be very small and acceptable. Note that the host kernel don't know
>> if 'kvm-arm-vgic3' or 'arm-its-kvm' device is needed by the board in kvm_init(), which
>> is the generic path.
> 
> We can have a generic hook that happens after board init is
> done, if we want to do non-board-specific stuff that happens
> later. However I suspect that anybody who cares about migration
> performance is likely using a GICv3 at least anyway,
> so "enable always" should be fine.
> 

Ok, Thanks, Peter. I will enable it always in next revision. The overhead
is very small and acceptable.

Thanks,
Gavin

