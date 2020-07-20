Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2069545lfm;
        Mon, 20 Jul 2020 02:28:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYaH2445qo+PcsAlJd/VLYCqCxuuHWGsXQoza2ChAGMVTl50gxWijOXqif8mZqo+sQ9yWJ
X-Received: by 2002:a25:8392:: with SMTP id t18mr34364582ybk.397.1595237292979;
        Mon, 20 Jul 2020 02:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595237292; cv=none;
        d=google.com; s=arc-20160816;
        b=N8+E5bqjoxKTwOBrQ9k8kPftRNb1hMzEKo7ly00mHXrILMKXy6nKAuIjcLvbtVl1lC
         6PxDPI8hjV7c4Kx+liUthn+qAlrML0VIr21tRM9KO1iNHLWRoV9nH2wFOaDLgmMzZTbZ
         PYPvb/oAGKDTD0VRpOgMdBJqXIVIEr4ykKiTviLA5r/vGfuQz1clRVpNya+U6wIif9QC
         ivvwl/HU1Z84GJriPStKYQzP/e6NJQaqp42Caf6igpTyVEVQHp7qbbrd2pzTe7JKSuCP
         4ENsHCDbMBk1Ez9sWptHar/Yr1MCwdWxkmy+VHm/g2S44niqhbvwbbklsMNpC2SwSUEa
         Cibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hyw1x2awEfAoxLL/ZtYXL9am0uEB+u+N63WU1r6fGZI=;
        b=kOweA3I65X20Mngxqng1IGcZmuJX6k6JcUoLLlN3sUDFHYME+1p1DiDWXBaNIGrmyX
         1WvhqcOf6ET6nDLi8TzGW2Mw4K2AHHaXCIjTcNlNFnRGjcTDGUROMcsbH93SyGGEDyWu
         3kCqTRjPVJVphQ49OTP9+pxRA3ZeMVty4WZu2ByCpNHpO5kWHnlibe0MCCvL3+fAUlcC
         lyjZ2UIc2B9cYTPsjWG0tMGMcC/6Bc2n1GwcJFacohQojF1eNWZcmtvuENXwgETfl05H
         Txf4Q+CJEQsFLwWYCSMOApP6Z27kTTghs5nTLBKtdnLIdlIornOH/p3G77m1elQH6AiX
         OTqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2KmuDIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si16220842ybo.175.2020.07.20.02.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 02:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2KmuDIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxS5k-0002BX-Cv
	for alex.bennee@linaro.org; Mon, 20 Jul 2020 05:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxS5d-0002B9-Hi
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:28:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jxS5b-0002gF-Nt
 for qemu-arm@nongnu.org; Mon, 20 Jul 2020 05:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595237283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyw1x2awEfAoxLL/ZtYXL9am0uEB+u+N63WU1r6fGZI=;
 b=h2KmuDIebdOqlkLJHj/pJHuYgnUcB92b0CeUx9ZfjbC8g2BVUYNnKdsrH5iimipl1wM6O8
 W2nxwmfv8BEkOPphbIbuIM+fCAZX1BJFDz5EePKCerkxBx+nOC48HZ6DFKSmHpfWHl1SH8
 9retCfkiPi6O9UK40mRzrMFI5PJ+7Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-mIIMRVWqPCOTtXRTcqvpfg-1; Mon, 20 Jul 2020 05:27:59 -0400
X-MC-Unique: mIIMRVWqPCOTtXRTcqvpfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022BF18A1DF3;
 Mon, 20 Jul 2020 09:27:58 +0000 (UTC)
Received: from [10.72.12.53] (ovpn-12-53.pek2.redhat.com [10.72.12.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC1DD78530;
 Mon, 20 Jul 2020 09:27:49 +0000 (UTC)
Subject: Re: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200710091940.641296-1-mcascell@redhat.com>
 <CAFEAcA9XQUcdiy2x18Zr+EYDaJ4hY-1Bd-DgL6-j6sJi5Ow+Gg@mail.gmail.com>
 <df0eae88-2bc8-04fa-feb9-7633ba13d635@redhat.com>
 <CAFEAcA_2zG1E1COPTi78DY2V2-e8sJwc-s0c7cCfm12U2DE00Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <727aefd4-8881-4ea5-811a-6d7cd20f4b2c@redhat.com>
Date: Mon, 20 Jul 2020 17:27:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2zG1E1COPTi78DY2V2-e8sJwc-s0c7cCfm12U2DE00Q@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 21:45:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Rob Herring <robh@kernel.org>, Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eDpBB3OqNkXS


On 2020/7/20 下午5:14, Peter Maydell wrote:
> On Tue, 14 Jul 2020 at 10:09, Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2020/7/10 下午7:07, Peter Maydell wrote:
>>> On Fri, 10 Jul 2020 at 10:20, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>>>> A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
>>>> occurs while sending an Ethernet frame due to missing break statements
>>>> and improper checking of the buffer size.
>>>>
>>>> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
>>>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>>>> ---
>>>>    hw/net/xgmac.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
>>>> index 574dd47b41..b872afbb1a 100644
>>>> --- a/hw/net/xgmac.c
>>>> +++ b/hw/net/xgmac.c
>>>> @@ -224,17 +224,20 @@ static void xgmac_enet_send(XgmacState *s)
>>>>                DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>>>>                            "xgmac buffer 1 len on send > 2048 (0x%x)\n",
>>>>                             __func__, bd.buffer1_size & 0xfff);
>>>> +            break;
>>>>            }
>>>>            if ((bd.buffer2_size & 0xfff) != 0) {
>>>>                DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>>>>                            "xgmac buffer 2 len on send != 0 (0x%x)\n",
>>>>                            __func__, bd.buffer2_size & 0xfff);
>>>> +            break;
>>>>            }
>>>> -        if (len >= sizeof(frame)) {
>>>> +        if (frame_size + len >= sizeof(frame)) {
>>>>                DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
>>>> -                        "buffer\n" , __func__, len, sizeof(frame));
>>>> +                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
>>>>                DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
>>>>                            __func__, bd.buffer1_size, bd.buffer2_size);
>>>> +            break;
>>>>            }
>>>>
>>>>            cpu_physical_memory_read(bd.buffer1_addr, ptr, len);
>>> This is correct in the sense that it avoids the buffer overflow.
>>>
>>> I suspect that we should probably also be reporting the error
>>> back to the guest via some kind of error flag in the descriptor
>>> and/or in a status register. Unfortunately I don't have a copy
>>> of the datasheet and it doesn't seem to be available online :-(
>>> Does anybody have a copy to check ?
>> I tried to download the datasheet from [1] but it's not a programmer
>> manual.
>>
>> I think we can apply this patch first and do follow-up fixes on top?
> Yes, agreed, since nobody seems to have docs for this device.
> This is an only-happens-with-malicious-or-buggy-guest case anyway,
> and the highbank/midway (only users of the device) aren't important
> or widely used machine types any more.
>
> I suppose we could add a comment
> /*
>   * FIXME: these cases of malformed tx descriptors (bad sizes)
>   * should probably be reported back to the guest somehow
>   * rather than simply silently stopping processing, but we
>   * don't know what the hardware does in this situation.
>   * This will only happen for buggy guests anyway.
>   */
>
> but anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Were you planning to take this patch, Jason, or should I?


I've queued for rc1 this with the above suggested comment.

Thanks


>
> thanks
> -- PMM
>

