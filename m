Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2241146wrs;
        Sun, 18 Aug 2019 22:41:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcXGT2DQSO7grFvv7lYCa8bskF8pYXNNp4TSr7ir+FAsM3eLu5JN019Ya6OZ/yXwZTBA3j
X-Received: by 2002:a17:906:ccc3:: with SMTP id ot3mr19715229ejb.113.1566193296506;
        Sun, 18 Aug 2019 22:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566193296; cv=none;
        d=google.com; s=arc-20160816;
        b=E5O0qyFserRrgr+Wj4PyoJ3/zZGIj+UoMvTfs7MUhS42N3z4uCrIHodO0IWFjy5q10
         dOV7MvWsJyZ6FIbIRs6eESRJTqDWpEIbIcz7g7LIphgdydRe0oAcpsnRJhWTxAYOHKAS
         wNQz24p79w1ZjRMlmVZ6hhQi4+Zh8p2eFb4AoEjUUZIQUxU8W/tfcBxq85eLBgEIhWa+
         tPUukue3VCNulOwPHIv6roRCA10W45Z28n2PG3qjEOAdZYw93no4+azNOlAQjFeXOXb0
         PHAKK6hj2j1D5GupU82baslw4qPjVYufhbzDpqUud8XtjHstdHybJNgLvR1qgvYvl7Em
         i/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Nvg+JwVGSpmmW+HFtSyaGAA+LnkXfutQoKk0mZsSQvA=;
        b=K5nYffCm1QiAx+4gLvB6yQ0/YyYH17raAjG4Nk//2DZw1mTHRqI1DsMSUuiz1Q/ILn
         vAhyxtcTcALHHIAXXPfvhCyYf35VQ3/33PkKYS88a8p4ClT7zIiZ+zh2xU3/LAoAVWFX
         FwDdDMZVAfGzKn04Ehv3QXO8xR2vp4PZubhvAa5ZOFYrHJ5B9yY+G7RSyC/cpSwUkuKq
         gfc3u/g15Ae9qChNS0rW060w/jqjW4xRhyw5FFANUdNAPVk4elpZcQBaPuRXQgCw81Th
         KYNmVBHAuvzo27R9bIxPK0TAwbeJ6pWkD+sd0tSIfe2oX35d6WiRWO9eE77hd+mve2YW
         0TEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si6573413ejb.384.2019.08.18.22.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 22:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzaQB-000397-I1
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 01:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1hzaPU-0002RT-5T
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 01:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hzaPS-0000o7-IO
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 01:40:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>)
 id 1hzaPR-0000na-TM; Mon, 19 Aug 2019 01:40:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A637D46660;
 Mon, 19 Aug 2019 05:40:48 +0000 (UTC)
Received: from [10.72.12.146] (ovpn-12-146.pek2.redhat.com [10.72.12.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A10F74C;
 Mon, 19 Aug 2019 05:40:43 +0000 (UTC)
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
References: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOyTXgs5uZuukZjAEqQkTtf1U+vD=u9_470+OgsfaQdqQ@mail.gmail.com>
 <CAEUhbmW0sCEN7mzSfCvUBSqhAGD3v5JyeDj2iSqs0MQJv13bag@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67e917c9-d080-5af1-22ea-ba6d9af4daee@redhat.com>
Date: Mon, 19 Aug 2019 13:40:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW0sCEN7mzSfCvUBSqhAGD3v5JyeDj2iSqs0MQJv13bag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 19 Aug 2019 05:40:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] hw: net: cadence_gem: Fix
 build errors in DB_PRINT()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x89b+idb7WkB


On 2019/8/19 =E4=B8=8B=E5=8D=881:24, Bin Meng wrote:
> On Sat, Aug 10, 2019 at 9:58 AM Alistair Francis <alistair23@gmail.com>=
 wrote:
>> On Fri, Aug 9, 2019 at 12:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
>>> compilation errors in DB_PRINT(). Fix them.
>>>
>>> While we are here, update to use appropriate modifiers in
>>> the same DB_PRINT() call.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
> Ping?
>
> What's the status of this patch?
>
> Regards,
> Bin


Applied.

Thanks

