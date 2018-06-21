Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1865132wrq;
        Thu, 21 Jun 2018 04:23:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJpgzRP8aCfbTVxqnfh3qW24kLsGMrlAeQQoaG9jA3HPQHUJ9EJjQmYbDI2p3j2nydxMPqL
X-Received: by 2002:a0c:9621:: with SMTP id 30-v6mr21712716qvx.127.1529580230897;
        Thu, 21 Jun 2018 04:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529580230; cv=none;
        d=google.com; s=arc-20160816;
        b=hkoihRFYW6vdZjzb1dfDIEYnxe82zWQ82ZBPVCr6AvH33S6WGDwtWQydA0ji6yVJQr
         ei+GeSNu6dhIQIhJAI2yVr38JBfbDJBStx6H+xyLmdSM55+PssFhOCFog7c5MvPLGxg1
         IQobHPUlpH5BqO98XiAQQm2Qivry446cMl8c+zDFbhAHrAfIXtsBwqmLr4saxGjS+PYV
         Q+qwfNv5tphisGyi7yOtV3CagvNUZjuCchCGTAAkdB61D82YjKGv2pajesx5JEqdPX8F
         AYiZ8S1WVPqUPSYdRv6kVpsOpEWz480rBjxC+JukUBgmgJ50PMKe6N2WfG9Za94tFtq5
         BRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=1Q1BCyqofEkWEIqzd3HOVlgeDTGciTHoOhGKUfwJdMM=;
        b=gRyIACz3qzEuTpNm+EraJe7+8LZSmOzkLhyILG3ijVe8+CxcOMe0cTfy3varfCYz55
         lNSoaQ6+dbbE0k22Z4u34L8jSX2dBPP20mO5ZL4w0B+QB4JKNnqGGEYrEA3r3SCxpraS
         IRM4B6TOg9c77z1DQUMosHG1s6qsNqkLF8M8HD76flokidaPYsmUyrHP6YOlqpzN3ZSY
         8X4j1BzRbT/tNTPraRLyrgXt9sJxbW8hV+it4mS91skSzBkW/vhmNM5R3c9dN83Q9mm4
         P0ymscH0sSayHf+7XkjCP73NPh1WWZ3lOLkBZRdmNC3IHfqw0fHFsBCSQyjHzEGn0utU
         hMDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8-v6si3025540qvi.226.2018.06.21.04.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 04:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVxgs-0007wZ-DM
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 07:23:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVxgf-0007um-PW
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVxge-00060m-Na
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:23:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56288 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVxge-00060X-IR; Thu, 21 Jun 2018 07:23:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EDE07B2B1;
	Thu, 21 Jun 2018 11:23:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B872156880;
	Thu, 21 Jun 2018 11:23:33 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-4-git-send-email-eric.auger@redhat.com>
	<20180621003758.GB32328@umbus.fritz.box>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <12605529-29b8-eb41-820c-f5604d1ac771@redhat.com>
Date: Thu, 21 Jun 2018 13:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180621003758.GB32328@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 11:23:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 21 Jun 2018 11:23:36 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC 3/6] kvm: add kvm_get_max_vm_phys_shift
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, suzuki.poulose@arm.com,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdymGh1aisBY

Hi David,

On 06/21/2018 02:37 AM, David Gibson wrote:
> On Wed, Jun 20, 2018 at 03:07:30PM +0200, Eric Auger wrote:
>> Add the kvm_get_max_vm_phys_shift() helper that returns the
>> log of the maximum IPA size supported by KVM. This capability
>> needs to be known to create the VM with a correct IPA max size
>> (kvm_type passed along KVM_CREATE_VM ioctl.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  accel/kvm/kvm-all.c    | 7 +++++++
>>  accel/stubs/kvm-stub.c | 5 +++++
>>  include/sysemu/kvm.h   | 1 +
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 0590986..137c38e 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -280,6 +280,13 @@ static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot)
>>      return ret;
>>  }
>>  
>> +int kvm_get_max_vm_phys_shift(MachineState *ms)
>> +{
>> +    KVMState *s = KVM_STATE(ms->accelerator);
>> +
>> +    return kvm_ioctl(s, KVM_ARM_GET_MAX_VM_PHYS_SHIFT, 0);
> 
> From the ioctl() name, I'm assuming this is an ARM specific call.
> 
> In which case, shouldn't it be in target/arm.kvm.c, not kvm-all.c ?
Yes definitively.

Thanks

Eric
> 
>> +}
>> +
>>  int kvm_destroy_vcpu(CPUState *cpu)
>>  {
>>      KVMState *s = kvm_state;
>> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
>> index 02d5170..7575ba7 100644
>> --- a/accel/stubs/kvm-stub.c
>> +++ b/accel/stubs/kvm-stub.c
>> @@ -161,6 +161,11 @@ bool kvm_has_free_slot(MachineState *ms)
>>      return false;
>>  }
>>  
>> +int kvm_get_max_vm_phys_shift(MachineState *ms)
>> +{
>> +    return 0;
>> +}
>> +
>>  void kvm_init_cpu_signals(CPUState *cpu)
>>  {
>>      abort();
>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>> index 0b64b8e..240e3d9 100644
>> --- a/include/sysemu/kvm.h
>> +++ b/include/sysemu/kvm.h
>> @@ -206,6 +206,7 @@ extern KVMState *kvm_state;
>>  /* external API */
>>  
>>  bool kvm_has_free_slot(MachineState *ms);
>> +int kvm_get_max_vm_phys_shift(MachineState *ms);
>>  bool kvm_has_sync_mmu(void);
>>  int kvm_has_vcpu_events(void);
>>  int kvm_has_robust_singlestep(void);
> 
