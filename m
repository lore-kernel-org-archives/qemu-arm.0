Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3491886lfr;
        Sun, 11 Apr 2021 19:12:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxiXicxhj1YNa0xdDgd1iIjl4vL8jfk7yjb0Z/0vCbnPjZOFQ3UazveiuxPpjtHKLDFYig
X-Received: by 2002:a05:622a:c3:: with SMTP id p3mr23142005qtw.43.1618193546964;
        Sun, 11 Apr 2021 19:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618193546; cv=none;
        d=google.com; s=arc-20160816;
        b=TLd2bNm2z2pt7VBNvS3rjxPoiCH6QnOwK4wgSpH7uh3+4Zhv5vBgpmTjjMtWL5dKof
         4MvnIoL3tF/RynAdmsvtB91+JMoxKEJGhQ1MVR5gnIKA7q4DTvJEg+hJWwhLEpvtUtWd
         e1wWPZfu6G6NiXumcmqNGPjyGIdtXl1QFUKPkcjLBN3at/vsF/LnwEH+Fg0XRjwugwis
         5/eYXg/mhhgzUHwtM6SD2Ypb2MT0cg0OqQiGIpjZ0xBEvOr7P7i7UPUsZX9tjVzJcAnF
         r33ZRC+hq9kspiE1G866AFcvZAs6jc7pN624VaKdfsqdDBY3lRC++jTocg4AsSRNgIL/
         xg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=b3VdiBlwFBNTfs65yJhoM4BSBwKRbU/s/QhJhSQWuoA=;
        b=PZMeJXkAwHAqIoxd3XwPOdA1m2fTAZVRdCxCui22+ZEuJeUSoH/De0oycAuIxeNMSr
         lPYTY+LUi4FJFaolZjTFBZF9LRsKD4nLjwbsNmMR+iA3OaLFKEHT0agdmBK3fzzz/XR5
         opffpBmZxIVGpfKmBTgM0Vlgygmg+YXlVMQQgGC0aAnAlutDnQ5oGsMliJVWcHaYDSGT
         LksUAF6FlJn1zsmTl1ZqKwtL8oJYN4v0gwRfo+IfbguoOHA66DSsQe4fcqZDGul7vFuK
         EmADvKGyZ1UsuqrDOFCCixx4iKn+rmWcylTTS+1RH2VfTnm4WTByyb34fwpQyzFtwh52
         FqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=du5HZHzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si7566245qvf.4.2021.04.11.19.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 19:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=du5HZHzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVm3u-0007UK-9z
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 22:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lVm3k-0007SF-K9
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 22:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lVm3i-0003tg-2K
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 22:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618193533;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3VdiBlwFBNTfs65yJhoM4BSBwKRbU/s/QhJhSQWuoA=;
 b=du5HZHzC1I1rdKkdnnM8RLXu0pZ+RxroG6Gco6PsIIFggIZRqO90IoIKjqcsg4RDJkYf22
 GmXd+JNhqg47ODFdDBCE/ToHWzwTSXAOwipwn3BKCpQ2gxyuD6wQZ5GdaJnU02D6lIoy1A
 5wWTx06OIGILo+mBoNCH5OAbBSfeJuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-FMMoYOUfPZewXTM6NRvhLQ-1; Sun, 11 Apr 2021 22:12:09 -0400
X-MC-Unique: FMMoYOUfPZewXTM6NRvhLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 938255B364;
 Mon, 12 Apr 2021 02:12:08 +0000 (UTC)
Received: from [10.64.54.68] (vpn2-54-68.bne.redhat.com [10.64.54.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD5635C3E4;
 Mon, 12 Apr 2021 02:12:05 +0000 (UTC)
Subject: Re: [PATCH 2/2] target/arm: Initlaize PMU feature for scratch vcpu
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210407040100.9933-1-gshan@redhat.com>
 <20210407040100.9933-2-gshan@redhat.com>
 <CAFEAcA_-cmCFDgaqVsZEFT5w56g0LLr3aCzjCf1Od4iov6eWiA@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5bc4cb38-6af4-e6e6-c2bf-d89463b28540@redhat.com>
Date: Mon, 12 Apr 2021 14:11:53 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_-cmCFDgaqVsZEFT5w56g0LLr3aCzjCf1Od4iov6eWiA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sZ9OPDNmN9sZ

Hi Peter,

On 4/7/21 5:38 PM, Peter Maydell wrote:
> On Wed, 7 Apr 2021 at 03:01, Gavin Shan <gshan@redhat.com> wrote:
>>
>> If the scratch vCPU is initialized without PMU feature, we receive
>> error on reading PMCR_EL0 as it's invisible in this case. It leads
>> to host probing failure.
>>
>> This fixes the issue by initializing the scratch vcpu with the PMU
>> feature enabled and reading PMCR_EL0 from host. Otherwise, its value
>> is set according to the detected target.
>>
>> Fixes: f7fb73b8cdd3 ("target/arm: Make number of counters in PMCR follow the CPU")
> 
> This commit has been reverted...
> 
> I couldn't find a cover letter for these patches, so it's
> hard to tell what you're aiming to do with them. Could you
> make sure you always send a cover letter with a multiple-patch
> series, please ? This also helps with our automated tooling.
> 

Sorry for the delay. Yep, I will always include cover letter for
a series. For this particular series, it's invalid since f7fb73b8cdd3
has been reverted. So please ignore this series.

Thanks,
Gavin

