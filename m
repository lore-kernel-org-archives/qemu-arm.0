Received: by 10.223.159.82 with SMTP id f18csp2112056wrg;
        Fri, 24 Nov 2017 05:40:08 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaGnDHwgGe+9f5roOCoMPOlsgk5oGazWX3sHR80okgv7Mhx9DxC9DnEw8sy0AxKVjSh9C/h
X-Received: by 10.37.204.130 with SMTP id l124mr17161626ybf.320.1511530808016;
        Fri, 24 Nov 2017 05:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530808; cv=none;
        d=google.com; s=arc-20160816;
        b=kuW+9p9sOowQuFJdjw9rf8Pe3gm8ZaTECY1WsocP7AK2b0rRrSgCtWiw1CO/Ye1Zh4
         b/WKGOQOsGs1bV+UzBqw8MrSXAc/8A8AKnvcBaEvMLQp0LGLYG4+32+EMRzcW+VPJDjH
         +RNQkTP8SreOZGNlvDaOWsEnHlqG3+p0Ghd6JURsiNbXJ0sm+s66dcVtcnfGDF137ivd
         8sVopYrLN2EZ6nJkGim5IbyQBMp22tIuvrYNB/H13jwvqqwLHcLtEj/AhFB7izgx3jbs
         UzB0sizE39w7WkJDF7+Y24t4ZocP8idYPczVpbnBWgtY+WweSBtKGG4XFW190RJf4RXp
         mwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=trXscMkn68f6I7KItJwGDgdsu/+oWwDSYC2WfnW3NYA=;
        b=PmvrZdCs3PQzWhioFUeiGhFHeNVzzNrlo9LxvmiX7sYC4ZWaVw69Laim1/Cp+v9zUp
         x1x4qNT2FLOxhHM4emDzr1Va+rgUDWwBnst+BijLkPCij7npaPfSIWz+MW+19fakN5xW
         lOysouE34+IaHVApRdgjpGyW9INDI5k7RGgygbPsTTHT0eYyMRdefXQ0bEobwe/egXsW
         XQQ5Ni7mdhURrxYTsgNHXNxg/Oym0Hjwwa9qa5QGnco+AkSFQFPek8DSDVdcGlF1LdbP
         VKn2/yDg109GZ73zKE/FMuX05Xnjngo6xVoEsNui/OZmfmeuLJSPQX5BXJpOL8V+9+O+
         t9iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si4931218ywk.92.2017.11.24.05.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:40:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIED9-0008Hc-Fm
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:40:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIECy-0008GV-Bb
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIECv-0000Iy-3o
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:39:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIECu-0000II-RM; Fri, 24 Nov 2017 08:39:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA0AE7EBDC;
	Fri, 24 Nov 2017 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 175A760BF3;
	Fri, 24 Nov 2017 13:39:45 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-7s8D1mts4LG81DoRM6x-wwT3mOPTcZJJ+EKi72tCjJw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0a83e699-1985-3720-b5db-14c29c629a67@redhat.com>
Date: Fri, 24 Nov 2017 14:39:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-7s8D1mts4LG81DoRM6x-wwT3mOPTcZJJ+EKi72tCjJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 24 Nov 2017 13:39:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 2/4] hw/intc/arm_gicv3_its: Implement a
 minimalist reset
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
X-TUID: h5Kwyfrkr+WD

Hi Peter,
On 24/11/17 14:34, Peter Maydell wrote:
> On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
>> At the moment the ITS is not properly reset and this causes
>> various bugs on save/restore. We implement a minimalist reset
>> through individual register writes but for kernel versions
>> before v4.15 this fails voiding the vITS cache. We cannot
>> claim we have a comprehensive reset (hence the error message)
>> but that's better than nothing.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - individual register writes performed in kvm_arm_its_reset
>> - check KVM_DEV_ARM_VGIC_GRP_ITS_REGS support
>> ---
>>  hw/intc/arm_gicv3_its_kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
>> index b1b322b..83e5268 100644
>> --- a/hw/intc/arm_gicv3_its_kvm.c
>> +++ b/hw/intc/arm_gicv3_its_kvm.c
>> @@ -28,6 +28,16 @@
>>
>>  #define TYPE_KVM_ARM_ITS "arm-its-kvm"
>>  #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
>> +#define KVM_ARM_ITS_CLASS(klass) \
>> +     OBJECT_CLASS_CHECK(KVMARMITSClass, (klass), TYPE_KVM_ARM_ITS)
>> +#define KVM_ARM_ITS_GET_CLASS(obj) \
>> +     OBJECT_GET_CLASS(KVMARMITSClass, (obj), TYPE_KVM_ARM_ITS)
>> +
>> +typedef struct KVMARMITSClass {
>> +    GICv3ITSCommonClass parent_class;
>> +    void (*parent_reset)(DeviceState *dev);
>> +} KVMARMITSClass;
>> +
>>
>>  static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>>  {
>> @@ -186,6 +196,34 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>>                        GITS_CTLR, &s->ctlr, true, &error_abort);
>>  }
>>
>> +static void kvm_arm_its_reset(DeviceState *dev)
>> +{
>> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
>> +    KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
>> +    int i;
>> +
>> +    c->parent_reset(dev);
>> +
>> +    error_report("ITS KVM: full reset is not supported by the host kernel");
> 
> This message claims that we have a problem because of the host
> kernel version, but I can't see where we do the check on the
> host kernel that lets us avoid the error message when it's
> new enough ?

Actually the check is added in 4/4. So in that patch the message may be
"full ITS reset is not supported" without mentioning the host kernel.

Thanks

Eric
> 
> thanks
> -- PMM
> 
