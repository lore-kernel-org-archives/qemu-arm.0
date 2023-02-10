Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1486020ejb;
        Thu, 9 Feb 2023 20:57:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9uSFx8I2pEp4g08sTqXOUFC4jjc6HTUPnU3Ww1fkGPfIT4BY9Tp2bQ0auDvrf8jVH7EdD3
X-Received: by 2002:ac8:5b90:0:b0:3b8:251f:4cda with SMTP id a16-20020ac85b90000000b003b8251f4cdamr22750817qta.58.1676005054530;
        Thu, 09 Feb 2023 20:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676005054; cv=none;
        d=google.com; s=arc-20160816;
        b=QlJZB8hEHL2T0ZICALCryZsBqGYZdpoYXSngR8fc6oKQFj/yrvDwIYlmD34/h2hk3U
         xailuK2jilcuFEvsTBUxXyIH5DbiXEW0KEPd8jQZ/tdCtu8CjTp3kQitOpgalRxlPTGc
         Gw29JnOFBrNPmoRl1q9+CRYAp9DB5pUBZYssEoj24PL5hZZnY4dXWUc9HmuYy9kXr1Vu
         aUkTDBkdbJn+1y0MwHbT70y1PZT71Kcn3RYZ+PcsesoPt75pB/P1gA+crMIQMcZ5mUIu
         93fco3ARiiiq4kHWUF5ByvwFpK7aB/5xUhpnC7yVtzf+sqKNbvSoFSCe4LUooencsPjl
         y3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mKpg5YokEETC/IqCV/+104zsL/s17GkmYS7pCFgr5HU=;
        b=FrqhH8Dzxxsr9QSskiD+4Pp1PrvjT0+ylONuAjE4QlZBJewC6y76ctHTAnx4+ftzzd
         pStia7sLAyP8onKYr9HE7U05yYtOeG8kkPC8nPHvyJzJa7rSmHjWDHQTJuN0FxZb0fg2
         h49DsMboQE9/SBdigVLO7R/zKlotfNvkB6BgY6l8QhdRIikeUeE2ycyAhf2wtoNp7KPr
         JIBVzlzGkzQkFcny0q1/m9n/xZi/Gwy3MkHnx8b9CI8oMow408IEqShOsMlY9bWuLMUW
         2Xrtyg8NCoJt5WU3+QM8ELV95VxO4CEyGqJtrWRhPZglbUWbj/mSg+ArnSR7lWRWnLof
         x5iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PgSFQgZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020ac85787000000b003b9a4c00d2dsi3294213qta.30.2023.02.09.20.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Feb 2023 20:57:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PgSFQgZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQLTM-0000r7-W9; Thu, 09 Feb 2023 23:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQLTM-0000qv-3d
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 23:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pQLTK-000371-Go
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 23:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676005037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mKpg5YokEETC/IqCV/+104zsL/s17GkmYS7pCFgr5HU=;
 b=PgSFQgZbx0kkUOhLDvd/H+fvZ2fPKX28b5qVqmnDxAV9n1k+C7fUL5PUWj23+SinVBPKkm
 +bEKYOvw6h6IlSb4+LtVIyeihEsPIfRpQiwcVNHApOVLpFyj2BPA1/kSw41WHrWxu/S8J/
 g9/gQZIr/u8I8tivk/345En4tyeO1LI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-XJlxqRV2NCK_vqVMPDpxeg-1; Thu, 09 Feb 2023 23:57:15 -0500
X-MC-Unique: XJlxqRV2NCK_vqVMPDpxeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C5B3804515;
 Fri, 10 Feb 2023 04:57:15 +0000 (UTC)
Received: from [10.64.54.63] (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D76AB140EBF4;
 Fri, 10 Feb 2023 04:57:10 +0000 (UTC)
Subject: Re: [PATCH RFCv1 2/8] memory: Add last stage indicator to global
 dirty log synchronization
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-3-gshan@redhat.com> <Y+VN/vWvdO2IxL3C@x1n>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <1181fe1c-1e13-e287-5b7a-b9e3fb9203d6@redhat.com>
Date: Fri, 10 Feb 2023 15:57:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Y+VN/vWvdO2IxL3C@x1n>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: fkbOIkLnSuhV

On 2/10/23 6:48 AM, Peter Xu wrote:
> On Mon, Feb 06, 2023 at 07:20:04PM +0800, Gavin Shan wrote:
>> The global dirty log synchronization is used when KVM and dirty ring
>> are enabled. There is a particularity for ARM64 where the backup
>> bitmap is used to track dirty pages in non-running-vcpu situations.
>> It means the dirty ring works with the combination of ring buffer
>> and backup bitmap. The dirty bits in the backup bitmap needs to
>> collected in the last stage of live migration.
>>
>> In order to identify the last stage of live migration and pass it
>> down, an extra parameter is added to the relevant functions and
>> callback. This last stage information isn't used yet.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c   |  2 +-
>>   include/exec/memory.h |  5 +++--
>>   migration/dirtyrate.c |  4 ++--
>>   migration/ram.c       |  6 +++---
> 
> Better move the migration/ changes into the next patch.
> 

Ok, I will combine PATCH[2/8] and PATCH[3/8] in next revision.

Thanks,
Gavin

