Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp403213lfp;
        Thu, 13 Feb 2020 01:43:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzz8AtL231jsog6z6x3sc+l3GTHlkI0602ri2eq0FCl6AO16RweHx2Vuds2BrTX2NjNQ7lH
X-Received: by 2002:a05:620a:20db:: with SMTP id f27mr13249000qka.78.1581587001121;
        Thu, 13 Feb 2020 01:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581587001; cv=none;
        d=google.com; s=arc-20160816;
        b=gVZpGqA/CKtI+Y1lLpX71b+FyQyyW2lndBqJ107swhOvA5roocs+bmH+YnkOc309KZ
         DZy714ssY3NSSdUroyLjCzV1ABG2jkUF5Mfj4buqfMMb0NoaKjtREZHYIVInSHsgjZnl
         mLmjxgLUNPV16SpWfuEaDRC1A09xvNHpZrBJ1JxMK77/IHuhOHgou13Ja2l7o3KVd0h1
         /4r1k8WVwI0AcRuMl8DdfrFc3t/LGIK61CQ4ABo2zcTS0N4qyW9f/AmwA0WBkTva0ry7
         OE+0qCoJUBeFD3DTxU7JLNmi9OrdaeNPTuV+3zISAOfXfDe5wprUKajO9alj4oGe1nUk
         Vsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KyRax9WTiMAW7Zu3vAA5Nj0OKEpA3JbfVMnYVMZ/OpY=;
        b=Gtqr51u89cWr4KN61BhuJ1+zlt4Hg65ljvhQyY4P223h+VgtavYyPdxr8ZldRYFrvQ
         7nVZRjgTyJwNdenHyMmVgDECJYQK+wcoNo6WMz6EVhdYk9lw9+oWIC79dZSn8wXlGU02
         PCEg76bo8pY3ZL/QfVpkgV4hqYC8KMfzcTIOGPoEjShkvW0rRokXU9y9pHFSwNKwV/l3
         8LybpiQlcQG2XJQvNUmbLm3L5i/Sm5jE187apEcPeWCfwZBxoW3dbT1UZwPPD4v81MDG
         hCT8n8zcjm/Z9oLMxvcbpZ/b7Urg4TtU9R3sU6x/D1DVLjoDwkWl9mscDQpigLO0oM61
         2gmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HUZFuzVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si935917qks.131.2020.02.13.01.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 01:43:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HUZFuzVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2B1k-0007D1-Go
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 04:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j2B1W-00077u-4Y
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:43:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j2B1V-0001EP-3y
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:43:06 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54715
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j2B1U-0001C1-Vd
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581586980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyRax9WTiMAW7Zu3vAA5Nj0OKEpA3JbfVMnYVMZ/OpY=;
 b=HUZFuzVk8Mih0WRYwUZBPNlnSKgtEah/WOx0YiNV1aL2xkb2zYwcjwlF+IENhoDBHytaOk
 yUzTGP87iqeBy1aM6MGrQOLydeDQRH2PTBiYiY/2iRXGhCF+xIXPMtH5ecYnVgGK0EDV20
 p5cXiJx8VQY2kZQMX7ER+2c3gB/3Tek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-XrWPDVpWO8S1ZCF-CMpVTg-1; Thu, 13 Feb 2020 04:42:57 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D588018A5;
 Thu, 13 Feb 2020 09:42:55 +0000 (UTC)
Received: from [10.72.13.212] (ovpn-13-212.pek2.redhat.com [10.72.13.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8AB426E7B;
 Thu, 13 Feb 2020 09:42:49 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v3] hw: net: cadence_gem: Fix build errors in
 DB_PRINT()
To: Bin Meng <bmeng.cn@gmail.com>
References: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKOyTXgs5uZuukZjAEqQkTtf1U+vD=u9_470+OgsfaQdqQ@mail.gmail.com>
 <CAEUhbmW0sCEN7mzSfCvUBSqhAGD3v5JyeDj2iSqs0MQJv13bag@mail.gmail.com>
 <67e917c9-d080-5af1-22ea-ba6d9af4daee@redhat.com>
 <CAEUhbmUswmWjiaAy+26mYkEMpciTP6u6=WDmVX2U9MKo=uR_qA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <91d39b2d-3077-a638-d253-be9acdb24f8a@redhat.com>
Date: Thu, 13 Feb 2020 17:42:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUswmWjiaAy+26mYkEMpciTP6u6=WDmVX2U9MKo=uR_qA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: XrWPDVpWO8S1ZCF-CMpVTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5uboPPvUiDHA


On 2020/2/13 =E4=B8=8B=E5=8D=885:39, Bin Meng wrote:
> Hi Jason,
>
> On Mon, Aug 19, 2019 at 1:40 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2019/8/19 =E4=B8=8B=E5=8D=881:24, Bin Meng wrote:
>>> On Sat, Aug 10, 2019 at 9:58 AM Alistair Francis <alistair23@gmail.com>=
 wrote:
>>>> On Fri, Aug 9, 2019 at 12:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
>>>>> compilation errors in DB_PRINT(). Fix them.
>>>>>
>>>>> While we are here, update to use appropriate modifiers in
>>>>> the same DB_PRINT() call.
>>>>>
>>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>>
>>> Ping?
>>>
>>> What's the status of this patch?
>>>
>>> Regards,
>>> Bin
>>
>> Applied.
> I checked latest qemu/master and found this patch isn't applied. Could
> you please take a look?
>
> Regards,
> Bin


For some unknown reason it was lost, I've applied in my tree and it will=20
be in the next pull request.

Sorry.

