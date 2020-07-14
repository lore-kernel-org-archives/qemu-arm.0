Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4049055lfm;
        Tue, 14 Jul 2020 02:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznYtsKRPobvdYltLTTb6L4+QyHM/z+KX7TIxHFyGHJNZsY7nJil2wKWtCtOM0mRacD6g+t
X-Received: by 2002:a25:e78f:: with SMTP id e137mr6238435ybh.153.1594717787603;
        Tue, 14 Jul 2020 02:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594717787; cv=none;
        d=google.com; s=arc-20160816;
        b=d/qQCjuE+XOleZbDgPvcK0HiDzpciOUHMb6kcaJYHsP53brqOVcGmB4GrPGxpiYcGh
         0ujU/J44kjPTBRm6iU9d2FB2HMbcCH637AHMpuMPQAp/w4MmVrtEAC4WtVExw9l6UtpK
         Vy+m/XZ+z2oPG55Xu8AoARDNK6TBM/TeOnKrXaYNqXTDoL5GFEqOJf671tP47sNOlTYg
         PTWrVQN55PpHscvif0z2NWhHjrO4o4v8mSUgDUFf4EY3UT5ICkzkRGfwGh2VmR3leQlB
         GMjthBPVk0UPee2MdfqPyqQl9GrOHzSYraaHBx2ddsqCWjIKxcFWk0RLSRnH6t1R+BRa
         I76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J3Xo8iLyPOa3pE2dpYfsq0llYfj11FzuDX/kBaw4zJw=;
        b=q7QHKs+XnNCpLfBvXl0gP5NZjDlhRzL2as2s7SufI64sXLccKaVXE5pCq0eftrTHf2
         MAc/oO9gMhaftD2d2SHMyzaIEBPF01lAqLD4sYft9V/ainhVLNfz5ubjrQUENl0p+jiQ
         dOXqsf9FbeSOU+AfcLWja/L5oTe6Whg0+BIWuE0A350YVsCIojd8RvS6sBmmqFtTfl9v
         Xq0VUnXfwhXGdwMXa/7dW3EMXMhju5pSrWQyz2MCHDvIzHl+0t2iOOFFyDIrTlJ+45+X
         w3/cOpDqdow98JgFo2pCkfOr0PbrjkAAh1/2hKgiZKdcqLca1ACB1alLIgPmVB+/DG5y
         Iaww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RMQ+OH0C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w138si16901467ybg.94.2020.07.14.02.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 02:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RMQ+OH0C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvGwd-00078i-0D
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 05:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jvGwW-00078V-CE
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:09:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59044
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jvGwU-0006Ru-Ks
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594717777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3Xo8iLyPOa3pE2dpYfsq0llYfj11FzuDX/kBaw4zJw=;
 b=RMQ+OH0ClkEKkeaP3WJmcQo/j2NdC8/C50/Yk7PwrbT34ZpXURYqXx+F4sDTVdMZeNs5b6
 krufBNHtmtvJVofqzsAAjyVnMbSZ8JNobTsEvNBQND4cKVTv0bpP1Pxp5dM+L1mBw71akO
 OHdu4nWjsh0tpSPiJsrZWoeTKCmk3z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-DqhdOAvCOMSfmAfs6xVv8w-1; Tue, 14 Jul 2020 05:09:32 -0400
X-MC-Unique: DqhdOAvCOMSfmAfs6xVv8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE87AE927;
 Tue, 14 Jul 2020 09:09:30 +0000 (UTC)
Received: from [10.72.12.168] (ovpn-12-168.pek2.redhat.com [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7B3772AE9;
 Tue, 14 Jul 2020 09:09:25 +0000 (UTC)
Subject: Re: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
To: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>
References: <20200710091940.641296-1-mcascell@redhat.com>
 <CAFEAcA9XQUcdiy2x18Zr+EYDaJ4hY-1Bd-DgL6-j6sJi5Ow+Gg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <df0eae88-2bc8-04fa-feb9-7633ba13d635@redhat.com>
Date: Tue, 14 Jul 2020 17:09:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XQUcdiy2x18Zr+EYDaJ4hY-1Bd-DgL6-j6sJi5Ow+Gg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlxGSD5uyo7u


On 2020/7/10 下午7:07, Peter Maydell wrote:
> On Fri, 10 Jul 2020 at 10:20, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>> A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
>> occurs while sending an Ethernet frame due to missing break statements
>> and improper checking of the buffer size.
>>
>> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> ---
>>   hw/net/xgmac.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
>> index 574dd47b41..b872afbb1a 100644
>> --- a/hw/net/xgmac.c
>> +++ b/hw/net/xgmac.c
>> @@ -224,17 +224,20 @@ static void xgmac_enet_send(XgmacState *s)
>>               DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>>                           "xgmac buffer 1 len on send > 2048 (0x%x)\n",
>>                            __func__, bd.buffer1_size & 0xfff);
>> +            break;
>>           }
>>           if ((bd.buffer2_size & 0xfff) != 0) {
>>               DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>>                           "xgmac buffer 2 len on send != 0 (0x%x)\n",
>>                           __func__, bd.buffer2_size & 0xfff);
>> +            break;
>>           }
>> -        if (len >= sizeof(frame)) {
>> +        if (frame_size + len >= sizeof(frame)) {
>>               DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
>> -                        "buffer\n" , __func__, len, sizeof(frame));
>> +                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
>>               DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
>>                           __func__, bd.buffer1_size, bd.buffer2_size);
>> +            break;
>>           }
>>
>>           cpu_physical_memory_read(bd.buffer1_addr, ptr, len);
> This is correct in the sense that it avoids the buffer overflow.
>
> I suspect that we should probably also be reporting the error
> back to the guest via some kind of error flag in the descriptor
> and/or in a status register. Unfortunately I don't have a copy
> of the datasheet and it doesn't seem to be available online :-(
> Does anybody have a copy to check ?
>
> thanks
> -- PMM


I tried to download the datasheet from [1] but it's not a programmer 
manual.

I think we can apply this patch first and do follow-up fixes on top?

Thanks

[1] https://www.synopsys.com/dw/ipdir.php?ds=dwc_ether_xgmac


>

