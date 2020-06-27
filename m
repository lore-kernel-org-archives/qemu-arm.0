Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1152269lfm;
        Sat, 27 Jun 2020 00:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx4FXubMNZtNnE1s68nwqbqC8odLcYt7zblXDwHEhwTKQqOHTsb6qQOdInw2ZthANketA/
X-Received: by 2002:a25:c60d:: with SMTP id k13mr11119002ybf.506.1593241867905;
        Sat, 27 Jun 2020 00:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593241867; cv=none;
        d=google.com; s=arc-20160816;
        b=RmEy5jyj8/q7nMLOLuK5LIdtOioTfCn9rqnrWP1m8yDRWj90jreSEFUoVJQWqACt07
         E7fC7cywx/ekoWMTeLiv/wdPXhBva9KZ4bzAdyBGMP7wnLwFwl6UiH8NsURi17Ne+/HI
         jtYqrfOR1/qdw/9pUipTvC32+3dvO2MKRFa68WvQNFz9HwyYGvl8VGCPRozoBeU77oDc
         CUC0iMKureJg3KPeRSUiFfrTu7PjvUF0LtaDitG/3ZiRCq8xxXpgn9crp2E8wt3HH/Lk
         KLDAq2jbac43rqwX3qdr1ASQl62swqzmk+mTqAg8QDKpHNvglt2+nuUVoDjHpmu02h/6
         NQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nx7cFZYCd92MIfSCWpcIP57y8sms+H8++UT4zow79HA=;
        b=eekLPsjYwzz3jfpJLicgeIBEp1mh5WiFCLHff+YIcz3hIOFXQ3bH0yyRoYVYpZ42zm
         5geWYMT6B3rpHOlawSPQ02n5ErCulOKRLhukQ1wCoSTc4QDr2V9thhgBm5dSGXaEqA5L
         tP3GvUjY1oXmfQt7NolsJ2dCHshi/bYsDlkrKKjwOXkcfqTob1BKCPmivgX03kxG8PcV
         M7z5/xPwXSd4qO/Xa16RmVZPfJKqDq6xcpB0n+CHPhfUnS8yS2WXMatQNNRTFWUWcfDw
         4c19ygIL80oOpizOTQeXq1f2oH6/9S3Uh1AO4LxqkAx70EBcJSemIPYnqnyhkj6YqPvh
         ZQng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwFTRfIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si27693573ybm.102.2020.06.27.00.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jun 2020 00:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwFTRfIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jp4zT-0007gt-Af
	for alex.bennee@linaro.org; Sat, 27 Jun 2020 03:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4zL-0007gZ-Nh
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:10:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26508
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jp4zK-0005GQ-6u
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593241857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nx7cFZYCd92MIfSCWpcIP57y8sms+H8++UT4zow79HA=;
 b=PwFTRfIfj//9ay1KhXVQ+pHYNY4RIllh5DnEbGzCdcQNOp0/P6sjiKifjoPmWc21tpzmNY
 a5AAsoUA+LPQGW+vP4pQ/QEAnROCISN7gLhittC2liB4gP0CYcGr9Q9hkGnaQBoCIJhUjk
 hzOP9UwbCsuzO36VTGuRWjz93CAzk+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-Y9LVhkmfOT6lhPipEilgEA-1; Sat, 27 Jun 2020 03:10:55 -0400
X-MC-Unique: Y9LVhkmfOT6lhPipEilgEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C521005512;
 Sat, 27 Jun 2020 07:10:54 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D868460BF4;
 Sat, 27 Jun 2020 07:10:45 +0000 (UTC)
Subject: Re: [PATCH v6 2/5] virtio-iommu: Implement RESV_MEM probe request
To: Markus Armbruster <armbru@redhat.com>
References: <20200626103057.11263-1-eric.auger@redhat.com>
 <20200626103057.11263-3-eric.auger@redhat.com>
 <87o8p5rno0.fsf@dusky.pond.sub.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <35f340c9-2394-a04b-879b-7e5fd848155f@redhat.com>
Date: Sat, 27 Jun 2020 09:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <87o8p5rno0.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yyR2WEQJjwkG

Hi Markus,

On 6/27/20 9:08 AM, Markus Armbruster wrote:
> Eric Auger <eric.auger@redhat.com> writes:
> 
>> This patch implements the PROBE request. At the moment,
>> only THE RESV_MEM property is handled. The first goal is
>> to report iommu wide reserved regions such as the MSI regions
>> set by the machine code. On x86 this will be the IOAPIC MSI
>> region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
>> doorbell.
>>
>> In the future we may introduce per device reserved regions.
>> This will be useful when protecting host assigned devices
>> which may expose their own reserved regions
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v5 -> v6:
>> - removed validation of s->reserved_regions[i].type in the
>>   probe request as it should rather happen in the realize()
> 
> Consider keeping the assertion.  I'd makes it locally obvious that the
> assignment to subtype is not supposed to truncate.  The realize method
> is in another file.  This is not a demand.

OK I will add the assert again

Thanks

Eric
> 
> [...]
> 

