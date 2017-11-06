Received: by 10.223.150.237 with SMTP id u100csp2485473wrb;
        Mon, 6 Nov 2017 02:11:27 -0800 (PST)
X-Google-Smtp-Source: ABhQp+TK8HIhu1UJToC2jaiT1UCNkC3RfRQ1DLy3luvpXwnIrQ5CtrsuxC50ZzujqClK8f6BKxCg
X-Received: by 10.37.189.131 with SMTP id f3mr6868208ybh.262.1509963087229;
        Mon, 06 Nov 2017 02:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509963087; cv=none;
        d=google.com; s=arc-20160816;
        b=F6EOu6GWWBhP3+iyVagHX2snzPoDmr+3yHnps4ZZKbXFZe1mVw3K9Y9WrBZuHIA+LQ
         A1Ni8YRYXRul5y5RDQHtG9RQBJKaoDW3SPq9K1RjF9ADrv0lHr4OrUbb1oSOZeUEb0Mi
         t+HU4r3ZqOfATsi+xiaeALkBGKu39AfcBhxe1mOk2aJhXHQPCzwzW9fZpGCs+rqmPB8S
         eNxYXtwO46vR2pbIvCeRca4Z4PwCu9IEnulobrY6pJ387AIoi96y2Wn0HrxqzgemJGw7
         WoL/MkQF/BDInkLIs86o2ZHf1Xdx1ITtpMZ3HQXLyxmgX4oTTE2k2v3Gx5/oqGx0KGwM
         zxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=kFyVXKwN2eUdC+6r0c6al9mGDk/7TwovXjYzD5jCm98=;
        b=sUyZUJXR59FMeXXhtPHT+Xqa3vFPfcfmyBxjDcZg3IWgFkbOUL1xMk/ZSJwPGoktwk
         BArvqDv7RKyiG414Pr936IaTNtqumNs6fJVoQgV9kZm5Wn31rqMPmiPQQI8Cd2ZjKKR1
         NKbp9TaNcC28kxkf4tMSDKC7aU3WIcTeYghoRyqekmJeTSPqLjKwz7IGgqXJUIbvGB/y
         G2U6Zveu0qhxAWA8VP5/BAJMGcW1dGYJzWbw8Ma/HCqOzftbmV0pn2Bs268hbfQpZjNy
         j3GyOJDCp5EqBnniCaidyUorLKhFu0Uo4WKCYDov6+GzVUNw2rNd5k9l1xMN2PChlCGA
         1Gcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si2680211ywc.803.2017.11.06.02.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 02:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBeNK-00089v-Kb
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 05:11:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eBeLU-0006iy-Ue
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 05:09:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eBeLT-0007YV-TA
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 05:09:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eBeLT-0007YM-Mh; Mon, 06 Nov 2017 05:09:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F231C0587D7;
	Mon,  6 Nov 2017 10:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8F231C0587D7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-72.ams2.redhat.com
	[10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F5D60C8D;
	Mon,  6 Nov 2017 10:09:20 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
	<1508772937-21054-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA81ogq6py71ejK7JD52A8LrQz1v92M1HZPCfPVBZy1vww@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0686ba45-7a77-f5b0-537d-07e2c3438e5e@redhat.com>
Date: Mon, 6 Nov 2017 11:09:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA81ogq6py71ejK7JD52A8LrQz1v92M1HZPCfPVBZy1vww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 06 Nov 2017 10:09:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 1/4] hw/intc/arm_gicv3_its: Don't abort on
 table save failure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7pirAlBKJxPo

Hi Peter,

On 02/11/2017 13:53, Peter Maydell wrote:
> On 23 October 2017 at 16:35, Eric Auger <eric.auger@redhat.com> wrote:
>> The ITS is not fully properly reset at the moment. Caches are
>> not emptied.
>>
>> After a reset, in case we attempt to save the state before
>> the bound devices have registered their MSIs and after the
>> 1st level table has been allocated by the ITS driver
>> (device BASER is valid), the first level entries are still
>> invalid. If the device cache is not empty (devices registered
>> before the reset), vgic_its_save_device_tables fails with -EINVAL.
>> This causes a QEMU abort().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: wanghaibin <wanghaibin.wang@huawei.com>
>>
>> ---
>>
>> this patch would deserve being cc'ed stable (2.10)
>> This goes along with patches 1-5 of
>> [PATCH v5 00/10] vITS Migration fixes and reset, candidate
>> for being cc'ed stable
>> ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> We could/should put this patch into qemu now, right (it's
> the rest of the series that's RFC) ?

Yes that's correct.

Thanks

Eric
> 
> thanks
> -- PMM
> 
