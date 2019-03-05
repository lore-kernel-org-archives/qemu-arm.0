Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5167801wrx;
        Tue, 5 Mar 2019 13:02:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDfybUxhB8+LLCBjqLk2Euo1fgmFx8oOkTufCZUxNsma4W3mShrczBHjDhu2Sce02lXsVl
X-Received: by 2002:a25:1483:: with SMTP id 125mr3946799ybu.117.1551819731112;
        Tue, 05 Mar 2019 13:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551819731; cv=none;
        d=google.com; s=arc-20160816;
        b=s3uy45TDmhEW8wQpIlotyq2F0iDmtZ35C2nKJ6giNonLy8pDp6Z6HuMvaezrlunbp0
         sJB5IgBWYLNrqWoKaF4/q+iDeSD1SJJQFSmN6Fqp/ZUcHfkblA/HN0p67TIFDtoatfrj
         2SwVPPlEO5qDEtLl3y23lXNGIxNM7L07WhZv3HzpEkxe/HeTFeBe3PFBJr2Th/+Hb9ke
         Oaf5QAOc9PFVFQgtJnQFcUGHfHxFypCIq2QM9hmZbEtDPd3RDDYnQdbMqFfysvGpoWtm
         0cnG2nk3U48aVt/7H3FJA25IKpLJSfuWYS4uGudeOeYiI6zQ3mW3u0wB7OUG1Eyy1LI9
         waDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4BEJmcOiFZuMGTvesrMTWmKuy7/NytMTdp+prKPjKiQ=;
        b=YjOydoP+NiVIr3Y9m+FNudWx6VjEzkPjnYjAoone7e6tt2/+XuPxIIE7kWHxvukt7M
         phgwXNpIjkuhgMORv83VzD/Vu8jFSRXozTWfEo18ob3/RWNCLItbo30TJviW5/gidYbm
         0jvE3Xj2+ukZjBluWr4Gy9NY09eiCXBk+joGws8ca1ZnzhsFs7r1Q/O5Seapm6cTFZ/3
         I1AUwiYFkixREFV/zz9IY0ROIapUPJMMwQDpnkoE3j2ZG+0HGdrwqccLxsXH5EeJKtso
         IaiL5+Erxgh5UtGlSln2JuzRhZtEz+BdSMOACeUEiJvZzQuN63nFMO/BP2Wc2tBoL6L6
         afpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u79si5843408ywe.201.2019.03.05.13.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 13:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1HCU-0007gR-Kh
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 16:02:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h1HC4-0007ep-TV
	for qemu-devel@nongnu.org; Tue, 05 Mar 2019 16:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h1HC2-0008SZ-UT
	for qemu-devel@nongnu.org; Tue, 05 Mar 2019 16:01:44 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h1HC0-0008OL-6N
	for qemu-devel@nongnu.org; Tue, 05 Mar 2019 16:01:41 -0500
Received: by mail-wm1-f66.google.com with SMTP id c13so2980137wmb.0
	for <qemu-devel@nongnu.org>; Tue, 05 Mar 2019 13:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4BEJmcOiFZuMGTvesrMTWmKuy7/NytMTdp+prKPjKiQ=;
	b=X6p+fH2HnRWUXfvIwDAZ7xj0L+BE3yvn22Clw/ASu9f+NR7vo8sdH0vn0O7xMW0adv
	1qQzvH9TpXRwxVUreLRmJ9LEo+HuOSiizlqrOEpGSlkPMPCnY/KGXiTV2R0t+e3V3qBw
	aIG1TSYNZ7UW2nuyFovzBBk+ZGO7Tdr3SssDvhZAZweC0FvdfeHut3XNxfQesKliHm7G
	S6I7HugmtJzr5+WXzjY/MT/3ZvoLyF07ngiP5Z3iMKossDDd2bb4h8xdvZHWZu4A9BJR
	3bCoeXPtaDq1bvfJ2eBu3+jOwsk5Kc0D0v6Gnn9aDZlVaMnViqXpljowjcVl7oy6Y/6G
	5UIA==
X-Gm-Message-State: APjAAAVRdBJEabVnfmhkU/l/JLl0sTGEFCT7rzbL/FiJWTf3/wqisW+2
	mD6dX/F3TnoQImgrXzbkdRRw2A==
X-Received: by 2002:a7b:c017:: with SMTP id c23mr287022wmb.50.1551819697090;
	Tue, 05 Mar 2019 13:01:37 -0800 (PST)
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	x17sm29677518wrd.95.2019.03.05.13.01.35
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 13:01:36 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20181207170400.5129-1-philmd@redhat.com>
	<20181207170400.5129-2-philmd@redhat.com>
	<b7a09e97-093e-6e27-4c7f-cc5244d63726@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5c595af2-e9c6-61eb-ab83-bdbc59b37967@redhat.com>
Date: Tue, 5 Mar 2019 22:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <b7a09e97-093e-6e27-4c7f-cc5244d63726@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 1/6] hw/arm/virt: Remove null-check in
 virt_build_smbios()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Drew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8UP9v9jLxMR

Hi Laszlo,

On 12/10/18 5:02 PM, Laszlo Ersek wrote:
> On 12/07/18 18:03, Philippe Mathieu-Daudé wrote:
>> Since af1f60a4022, the fw_cfg field is always created in machvirt_init().
>> There is no need to null check it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/virt.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f69e7eb399..36303ed59c 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1279,10 +1279,6 @@ static void virt_build_smbios(VirtMachineState *vms)
>>      size_t smbios_tables_len, smbios_anchor_len;
>>      const char *product = "QEMU Virtual Machine";
>>  
>> -    if (!vms->fw_cfg) {
>> -        return;
>> -    }
>> -
>>      if (kvm_enabled()) {
>>          product = "KVM Virtual Machine";
>>      }
>>
> 
> This patch looks correct to me; however, the fact that fw_cfg is always
> present on the virt board does not seem related to commit af1f60a4022
> af1f60a40226 ("hw/arm/virt: remove VirtGuestInfo", 2017-01-09). Said
> commit only flattened the contents of VirtGuestInfo into
> VirtMachineState; the conditions under which fw_cfg would be created
> were not changed.

This is certainly not related to commit af1f60a4022... This is not the
commit I remember I wanted to refer to, I suppose I did a copy/paste
mistake, thanks for carefully reviewing me and catching this!

> As far as I can see (from a number of git-blame / git-show commands),
> fw_cfg was added unconditionally to the virt board in commit
> 578f3c7b0835 ("arm: add fw_cfg to "virt" board", 2014-12-22). And the
> check that you are now (correctly) removing has always been superfluous
> -- it was superfluous already when it was first added in commit
> c30e15658b1b ("smbios: implement smbios support for mach-virt", 2015-09-07).
> 
> As far as I can tell, anyway.
> 
> If you agree, I suggest mentioning commit c30e15658b1b in the commit
> message, rather than commit af1f60a4022.

Yes, this one makes more sense ;)

> 
> With such an update:
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!

Phil.

> 
> Thanks
> Laszlo
> 
