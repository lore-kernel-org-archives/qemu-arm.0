Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4053940lfg;
        Mon, 22 Mar 2021 17:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwinZ8cJUBbSIut9iDR5kocHalQ/m/771jrfKkr1cxdhcklgmp4Uc5Sh0EEl5QyV4SZpuRv
X-Received: by 2002:a05:6602:1592:: with SMTP id e18mr1920375iow.49.1616458447176;
        Mon, 22 Mar 2021 17:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616458447; cv=none;
        d=google.com; s=arc-20160816;
        b=nralQoQrldinNWSX7QXSO6Z9HmqcDAdewKHbrOafHz9VCikQRu+Uvb7RTIoDZTG8ld
         +3S7kt6eW5GdG5yacERtHU8Uj/dyc7QrFd/SJW4J+cfs1ppqWp0Jbu6Byxqay0CGzw9p
         9OPMuHiiS2QjAL4gegTINlSgHBl1ZMBOnzU0vuvkq9HRAKmdXHAjZWJ8dMd+bY1nCy1F
         t2olBC4612sQkdgKhMKu2l3v43hkWAMZ4WgI9tsHeV9fnkFuZghEiZsVjVshnc4kgdny
         xXeMtYKxwmIZ2MmhyU1/VyIQbaPhSRIgQa8bJr5MtJ0J4nEYjOy93j+9CnSDHQmiNzOl
         8Azw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=VO3gICh8YboXk4bqmRbCqBxNXbhLWt1fm3SuFtsn0Og=;
        b=jDjtSGIZhg0OkQnQYj6CFa3j/vHHoBeJhRyJTUsT9jqOcAO3gOiTnQRef4lyg6Uabh
         2E4rMiR3HmYIZ1llFXrbHbepOXhZgP+hnDMo8MMSuz/aleJKdzmnfwYXvWVefikc6Xaq
         Cr8Hq1vLzeAmpNcszcabOV2TBk2u+Y6LikKmxWxlJNXA2mwy0yWpNs6sbCvLIk1+YkAE
         8QpJQUnE9+eK02wI+ghEtQrkkg+vD/yzs34Ss8PbcovrToIXe8JzUgjMlwYpweJTIN/y
         9e8daLmc/erv3razlknhZ/aYc1fSjPqb+zj+yLBvIIxi/iVD9EcZVa5XWfEkmU3xFzU8
         N3Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FtzWjUlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si11435234jam.27.2021.03.22.17.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 17:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FtzWjUlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOUgQ-0006ZT-Gq
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 20:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lOUgB-0006Xq-Ti
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 20:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lOUg6-0008TG-Pv
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 20:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616458422;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VO3gICh8YboXk4bqmRbCqBxNXbhLWt1fm3SuFtsn0Og=;
 b=FtzWjUlQ7ZbwN5V8zXfCiF5f5dzHztARbHuIkrP8pKExlvb4JDkqjGbThH7UT0aTM8v4sD
 M+zRZ4wheOjRwRucZbstqz6xM7F6hsOZ/tXT/v3OzkdtMkVAK4qELwYB1M8TqEwaR4ww/Z
 aEXZl+peS4RhNHDUeAnDyRPvoOaIvBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-iGbFs7TYNvy8IwYVvjkP-Q-1; Mon, 22 Mar 2021 20:13:41 -0400
X-MC-Unique: iGbFs7TYNvy8IwYVvjkP-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D72107ACCD;
 Tue, 23 Mar 2021 00:13:39 +0000 (UTC)
Received: from [10.64.54.40] (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0595B6A8;
 Tue, 23 Mar 2021 00:13:36 +0000 (UTC)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
 <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
 <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
 <4231d15c-493f-cb3d-39ef-aff40e3618ee@redhat.com>
 <696de0d3-3b35-6c9a-1242-3761e6d6ec83@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6d1973a3-159a-6c1b-2767-29dcb91a6562@redhat.com>
Date: Tue, 23 Mar 2021 14:13:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <696de0d3-3b35-6c9a-1242-3761e6d6ec83@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILbXPgLKGjmZ

Hi Richard,

On 3/23/21 7:59 AM, Richard Henderson wrote:
> On 3/22/21 4:54 AM, Gavin Shan wrote:
>> It looks this issue can be avoided after "volatile" is applied to
>> @target_page. However, I'm not sure if it's the correct fix to have.
> 
> Certainly not.
> 
> That is the exact opposite of what we want.  We want to minimize the number of reads from the variable, not maximize them.
> 

Yes, It's something I was thinking of. "volatile" can make
@target_page visible to gcc, but maximizes the number of
reads. By the way, your patch to use "-fno-lto" worked for
me and it has been split into 3 patches by Phil. Richard,
thanks for the quick fixup :)

Thanks,
Gavin

