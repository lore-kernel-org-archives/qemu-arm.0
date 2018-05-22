Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1448146wme;
        Tue, 22 May 2018 05:45:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqvT4YIiXLC1QsCnevs2TnvL8AAbyfoGV3OABGcMh5ejEKKVG4RDn6ldvzrnDhHPDGiHzBt
X-Received: by 2002:ac8:1682:: with SMTP id r2-v6mr23295431qtj.40.1526993136719;
        Tue, 22 May 2018 05:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526993136; cv=none;
        d=google.com; s=arc-20160816;
        b=tIOpYmmTVwNnNJ4xaoxsFIpevXYv1k7jYFmmYK9w4isK/vGA2t0GLq/JQC+8E4A1qc
         rec5HFVbLdHPxxCWF0qP/K9ZCJxi+43uJEaTw4yDswJvdewGu1z47oYcElDeuQF3iIXZ
         ZNViQIv+JVhio7Z+a/WFHaC9MJ/NiDJblFNkxcRjhNt8WxwG/1AgXbXXxFkd3uuqgBOz
         +0RmBiXt6H/GOGm8ZZAUAi5C5fSNR6curXsOWsy3a8k0MdkSOfleg9IYSgyhe9oyowSh
         x1x6WZV1cJLMTEoHRu0iUIvqseGLRaT3xAxpUDilL/uhprceth29/w3VKPWSMFSNiosB
         Qjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UBS900joNn/aiQ/4OXRykqPXC4+24BRw1ZFXvcAr+FQ=;
        b=GEyYLQb7lwpvnCCOSSiShMGhGSnYeZZLQJysUyeE4UTh5d9QuoNSOIMP9YA4lBhZSS
         2SnQbtixvRd532cWzGegz7y+azcUneMKH0ZWe3ZerLQGWQVEUx5C2p65f0UCvakz7GQ+
         aJFHcRSee5Ucf7KDmJ9yOQVUJvpGTyCXIqaFu0lhQlDyq/RRqckJZGZzF3gElcd+BpQ7
         gdnSukcVi8fR24jwBKiyNi60CdfSgeIqRaCZftteGZDDg2jmnKZTPsA8K4AMGhRYEzW1
         rOGvlyE6LGPjokYBoEY4XNpginhHNbSVj4paG/s09nz5LhU007u/wExL7lWeA3Yxln1/
         7gWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=In2N/Eoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x92-v6si11911628qte.261.2018.05.22.05.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=In2N/Eoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6fX-0006lG-VM
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:45:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6eM-0005pe-Vw
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6eM-0005cF-A6
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:44:23 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:43093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6eM-0005bw-5f
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:44:22 -0400
Received: by mail-ot0-x243.google.com with SMTP id y10-v6so20753420otg.10
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UBS900joNn/aiQ/4OXRykqPXC4+24BRw1ZFXvcAr+FQ=;
	b=In2N/EojL6LGyE4XqETvqfm3aQmGzlN3GBnRRGiGNRzw9p3xAWQl76P7PWyZ90+NrK
	TLSpxOTmZbdYpXdl7kJU9pAY8/WTI6GrMMqznSssMUqe5cAZ/MUkX+R7YAisw/O3k3II
	IvUWXyFlxYZ51d6ZR6C7+R1SVg0iVt6pEgKks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UBS900joNn/aiQ/4OXRykqPXC4+24BRw1ZFXvcAr+FQ=;
	b=hD40KnMPkQGhoM0cxIMz2nvUYv3nkOBeDWQyQMiox4CrD05IbeUAa8f6sqPAZGjH2G
	/CpaXu6PUIe9GTpmAzc0hyehvxY2uSQhNqTeS8TRLxOfUEeSKugUZTJUzuNSRZGLsOoy
	oW1R62Zbak2uVOAwJzFTYTFx1IrdIlQ0USPHmsXlsxwLqOGLwVkURDX/hjxZJ1UsPQTi
	gmnBVR+BbdKDjobLx+1gDID1sbtJvilK8QzBp5eMNg4aBQ3OFeiGei/J0zNTvnDGnGfA
	OYm78Dway/qVltLggHl4lVZJ4dqQ9gsVpFH5H4ket2ItKnCNhJMHgMmcTjGVUUK2DCk0
	Zfcw==
X-Gm-Message-State: ALKqPwdI951HpRYiVDo5PnoOrfJ7pRzQKnUV1kWV2uHGU4varS3KlCtY
	WoOIx/rt5cKqrCfqC7mshzduvYuwSMQXAuUjr6YVNA==
X-Received: by 2002:a9d:2625:: with SMTP id
	a34-v6mr16621307otb.308.1526993061363; 
	Tue, 22 May 2018 05:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:44:01
	-0700 (PDT)
In-Reply-To: <CAFEAcA8T0sQ_dZ7079WSx0FHp21F3xiWfNY6OFgO4Z0uBAPpLA@mail.gmail.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T0sQ_dZ7079WSx0FHp21F3xiWfNY6OFgO4Z0uBAPpLA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:44:01 +0100
Message-ID: <CAFEAcA_KHPBO53Qnh5ZgJZwb7r+StnxenbRr0P+8jGou2CqzRw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [RFC v2 2/7] target/arm: Allow KVM device address
 overwriting
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8cIyRIMGIdHk

On 22 May 2018 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
>> for KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION attribute, the attribute
>> data pointed to by kvm_device_attr.addr is a OR of the
>> redistributor region address and other fields such as the index
>> of the redistributor region and the number of redistributors the
>> region can contain.
>>
>> The existing machine init done notifier framework sets the address
>> field to the actual address of the device and does not allow to OR
>> this value with other fields.
>>
>> This patch extends the KVMDevice struct with a new kda_addr_fixup
>> member. Its value is passed at registration time and OR'ed with the
>> resolved address on kvm_arm_set_device_addr().
>
>
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 1e23640..4050017 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -34,6 +34,7 @@ int kvm_arm_vcpu_init(CPUState *cs);
>>   * @group: device control API group for setting addresses
>>   * @attr: device control API address type
>>   * @dev_fd: device control device file descriptor (or -1 if not supported)
>> + * @addr_fixup: value to be OR'ed with resolved address
>
> I think addr_fixup is a bit vague; how about
>  addr_fixed_bits ?
> (here and in the function argument name). Or something else if
> somebody has a better idea.

Thomas Huth suggested addr_ormask.

thanks
-- PMM
