Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp86266ejb;
        Wed, 31 May 2023 09:37:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rgHPiofw8B7nDfYDl7cStZKnx6qIP+6kD4RbCjFUZxPhXZh2JbYsfWgRWGKjQUnt+ZiUD
X-Received: by 2002:a05:620a:8906:b0:75b:23a0:d9aa with SMTP id ql6-20020a05620a890600b0075b23a0d9aamr6586381qkn.0.1685551039099;
        Wed, 31 May 2023 09:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685551039; cv=none;
        d=google.com; s=arc-20160816;
        b=csc6xZQib43NGFaSSA8bRDr0F6FblfPhUORnIGoDZ3a5J0E+r9iKamYRbU1zasR4Qi
         d6pOZNyyyLjLlMzY6jaZClubGEEDDev3yW+gohkoZGANYy038WU4srIY0s7a7SrWsiId
         +WXlkHv4MaxotP4ey5K08h9XGCG/j3X5EskGl5ybYeHDxeQs8Wnk4QU2xGyqYIBhxzv9
         XfvU4wj85oLk7L9MjQtRO00YHDyQrxpwcBce7XFhHfGCr5xI7VEPcL7t72xVFUlsA6JM
         1mIcEjrNWToMNU27wq5OjwZj4mF80w9PpwbfnniNZbaoEiewlrdFHt1o9shgApvlnp3p
         /SLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=19EwZCRqjqWnnqqHwEDlsu+AEj34DaE4EnF6WSEdfPg=;
        b=Er6WgdxiUa+iS+ZunOjmxhg0nr9l+XDjguFLxgC4InLC1A6rMMiixd7r1VNJXGOZWN
         7xLAjAwEmL03ujz3zmgB5+9/UviEjqdH4fpnTKvYl8OKBRpWITAaxc2kKa0/gQ1DIGyj
         5OYGD8HZIFX6N534YK/rXCIr2SYzxvquydbV45E4Ie4oIBYToJm+vtCeqpCI9WfI8XUY
         /B3isHxozclfh8bk877ZAftFdvGi8UW3VqZa3ozvbEyo29rBmgZzZr44m9bIyqeZwDaP
         /+D86Z1GGKSvbzbP+B8kyzvhkAy6pOIeeTlVrZluLGLffgtaraqlqvQugKIm0OmctXTw
         u5Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=FU8ih7uD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05620a15d300b007594a88de3esi8142579qkm.27.2023.05.31.09.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 09:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=FU8ih7uD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Ooy-0006ZW-8f; Wed, 31 May 2023 12:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1q4Oow-0006ZF-Qk; Wed, 31 May 2023 12:37:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1q4Oos-0007Yd-9R; Wed, 31 May 2023 12:37:10 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VADKYV013999; Wed, 31 May 2023 16:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=19EwZCRqjqWnnqqHwEDlsu+AEj34DaE4EnF6WSEdfPg=;
 b=FU8ih7uDEuHziIVHXDRRrNoZuCmI8Sv3H8BvubSEGlNbQggmfwqYD6S0ucko+0PS3c3c
 BzaCCs7VPhHgV91tb36y4SBXZEyFOyTRS2TU3He0+JryYqyls6bVX3UfYZs/GYQ2Lt2L
 o3Lm2zoBvQ3m18jEsbGa280Uewf7BhNzKUDLyVpDI7wUCMkGZaj6HZ/BOuJsn/9MFt+o
 BALt5rGCaJwLLw5Z6pdDUY8GrBcOznA9NigiToBDFqUbOWU7GZvn8abT2fqzGmw+MGqe
 Sa0huzAOUj5FkYfzffy6Ukk7XdkmhI86pZMnhRcUmNQ6WHcmcoV1iJ6CPiT4hZeVoJSx tw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwnhf2r2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 16:37:01 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VGb0eO000366
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 16:37:00 GMT
Received: from [10.111.140.164] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 31 May
 2023 09:36:58 -0700
Message-ID: <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
Date: Wed, 31 May 2023 17:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Peter Maydell <peter.maydell@linaro.org>, Graeme Gregory
 <graeme@xora.org.uk>
CC: <wangyuquan1236@phytium.com.cn>, <chenbaozi@phytium.com.cn>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
From: Leif Lindholm <quic_llindhol@quicinc.com>
In-Reply-To: <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: T-Tqo_L0GCOO1YiiMObq_dlYz79yKUIf
X-Proofpoint-GUID: T-Tqo_L0GCOO1YiiMObq_dlYz79yKUIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_11,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=652 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305310141
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: JuY96GiIGc6w

On 2023-05-31 16:27, Peter Maydell wrote:
> On Wed, 31 May 2023 at 15:58, Graeme Gregory <graeme@xora.org.uk> wrote:
>>> The current sbsa-ref cannot use EHCI controller which is only
>>> able to do 32-bit DMA, since sbsa-ref doesn't have RAM above 4GB.
>>> Hence, this uses XHCI to provide a usb controller with 64-bit
>>> DMA capablity instead of EHCI.
>>
>> Should this be below 4G?
> 
> It would be pretty disruptive to try to rearrange the memory
> map to put RAM below 4GB at this point, though in theory it's
> possible I guess. (I have a vague recollection that there was
> some reason the RAM was all put above 4GB, but can't find
> anything about that in my email archives. Perhaps Leif remembers?)

I think Graeme was just pointing out a typo in Marcin's email.

Yeah, we're not changing the DRAM base at this stage.
I think the reason we put no RAM below 4GB was simply that we had 
several real-world platforms where that was true, and given the intended 
use-case for the platform, we explicitly wanted to trigger issues those 
platforms might encounter.

>> Also has EHCI never worked, or has it worked in some modes and so this
>> change should be versioned?
> 
> AIUI, EHCI has never worked and can never have worked, because
> this board's RAM is all above 4G and the QEMU EHCI controller
> implementation only allows DMA descriptors with 32-bit addresses.
> 
> Looking back at the archives, it seems we discussed XHCI vs
> EHCI when the sbsa-ref board went in, and the conclusion was
> that XHCI would be better. But there wasn't a sysbus XHCI device
> at that point, so we ended up committing the sbsa-ref board
> with EHCI and a plan to switch to XHCI when the sysbus-xhci
> device was done, which we then forgot about:
> https://mail.gnu.org/archive/html/qemu-arm/2018-11/msg00638.html

Ah, thanks! That explains why we did the thing that made no sense :)

To skip the migration hazard, my prefernece is we just leave the EHCI 
device in for now, and add a separate XHCI on PCIe. We can drop the
EHCI device at some point in the future.

/
     Leif


