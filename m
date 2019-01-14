Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3007312wrt;
        Mon, 14 Jan 2019 05:00:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5N/FHYphiEct9jxc3K1195IIIs2TntBWjOIAzlzTDQ5fkzKI+7uUo5ZiNnR88PvMOESpHc
X-Received: by 2002:adf:8484:: with SMTP id 4mr23920508wrg.249.1547470820030;
        Mon, 14 Jan 2019 05:00:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547470820; cv=none;
        d=google.com; s=arc-20160816;
        b=QbK6HfJo5vlkFsaYYQOPrmGWlOq256S1sPqunYQVVN20l4qeTVjDMUuMXE0CYbhv4k
         cvQJUwqCKTJB2gMrheRREgAEQAY70IYkT4LR+TMONS9vv2APizdM7Fosdx/CeywK/cTz
         5ISpSSx9t7f4XmuG0fgyk0cq/M9AqSFKFO01PmQ01I2IzyMP+ILMhxMxXvML7wvdtM6h
         A65MBM62cTYdhZWIulLEgUNDESQvMMOTtukijYn3OJd+hw0MZOJz5/MJu2yMbnulYfTd
         t+LFd5WNPAUOespWLRKbn4alvdUVMw0/saYItZA7tO8mBn48LVJ64FvIWADAW+6RFALR
         ceOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=rEWSIc66td2Js7NNXI7uu+4kIP5BauQwo6av80cy6fQ=;
        b=lvDAfiUyfjASPJPjDGrAsP6QD+y1PdcHCPcu4cIhNj6YdidQr/gh5nxyxcI9s9adBt
         v/WUvk9L/IYIi7jcMjNakoUSLTV6mOq2Grq+cTw3dxnQwpF72psJBt5chPxg7lnZqvlP
         PCIcYPWKcw5FgaMeiBe9CfcTp8aAx0bnsf0aOdGIhCW7XB71knrqzNIHW9C2Qx/Bxkdm
         vmM1dVyPdCuSaY04Kry4EC9Q2uZZIjQoHfvda0iKmZ6Jf9uDxXepeecDl4/NfJmF69AH
         MWUZKvjoYNM6zMDIumBqcMhLFE0VCAzhkrgsU+UByKCvZoTLMET1MipmKoFgyAWyb0gy
         PZtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 80si11877717wme.143.2019.01.14.05.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 05:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj1ql-0002C5-38
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 08:00:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1qH-00029J-AI
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 07:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj1qG-0003k3-DE
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 07:59:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj1qG-0003iC-7W
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 07:59:48 -0500
Received: by mail-wm1-f65.google.com with SMTP id n190so8815483wmd.0
	for <qemu-devel@nongnu.org>; Mon, 14 Jan 2019 04:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rEWSIc66td2Js7NNXI7uu+4kIP5BauQwo6av80cy6fQ=;
	b=d6nW3+obHzXtJRSF5u5o3eo3DUKn4oGoe0ejGH1JNZrUEWL0hjnKJqN8BKF4R7LCjg
	8yKWeBOU5KKIjn+K60x86REFouhU8XEcMcwe0Qmi4eTSk0QOE1WJISJaDPw7YcfEoQw4
	fleaH7ImQjE9QHr3eD3GRULFMbRfsEYr2JH4aTENGSQDVipYhL5d0Fr/Clsfs++Ogdn2
	V1GPFB8IH25zz5mMbyHk5sT5y2qQ+ajI4NY2nzTVNBl1rIU9EIHIzQIpoTlKqMaoMH0B
	/xWoijToE6iiu/0k0dv2KWuNsXffesQtYHyIMAKOzjzywoPH1BWMwYYL6PWpYwQWjt5q
	QGQQ==
X-Gm-Message-State: AJcUukdfS2FvK59TvkkPLjQqW/VPdLJQ8rRgfEYqy4vLIyaPojkgKwyp
	rzSw4EN0qZnt1hxQJaJbZybWXw==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr11745091wmc.0.1547470786036; 
	Mon, 14 Jan 2019 04:59:46 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110])
	by smtp.gmail.com with ESMTPSA id q6sm11351303wmq.4.2019.01.14.04.59.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:59:45 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-13-philmd@redhat.com>
	<4f2bc8e2-de3b-aaac-bc4a-e3f3b013b44e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <68960d40-1ea9-47e5-0ab4-431a337d02de@redhat.com>
Date: Mon, 14 Jan 2019 13:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <4f2bc8e2-de3b-aaac-bc4a-e3f3b013b44e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH 12/15] ui/console: Remove
 MouseTransformInfo from qemu/typedefs.h
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z4v7xzdIpfQZ

On 1/14/19 9:59 AM, Thomas Huth wrote:
> On 2019-01-11 15:08, Philippe Mathieu-Daudé wrote:
>> MouseTransformInfo is only used in "ui/console.h", there is no
>> need to expose it via "qemu/typedefs.h".
> 
> You also touch devices.h here ... that should be mentioned, too?

It depends whichever of this series or 'remove "hw/devices.h"' enters
first :)

> 
>  Thomas
> 
> 
>> Move the declaration to "ui/console.h" (removing the forward
>> declaration).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/devices.h    | 1 +
>>  include/qemu/typedefs.h | 1 -
>>  include/ui/console.h    | 4 ++--
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/devices.h b/include/hw/devices.h
>> index 0e27feb0c2..b5f1662225 100644
>> --- a/include/hw/devices.h
>> +++ b/include/hw/devices.h
>> @@ -4,6 +4,7 @@
>>  /* Devices that have nowhere better to go.  */
>>  
>>  #include "hw/hw.h"
>> +#include "ui/console.h"
>>  
>>  /* smc91c111.c */
>>  void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index 9baebe9d33..e44f1473a5 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -49,7 +49,6 @@ typedef struct MigrationIncomingState MigrationIncomingState;
>>  typedef struct MigrationState MigrationState;
>>  typedef struct Monitor Monitor;
>>  typedef struct MonitorDef MonitorDef;
>> -typedef struct MouseTransformInfo MouseTransformInfo;
>>  typedef struct MSIMessage MSIMessage;
>>  typedef struct NetClientState NetClientState;
>>  typedef struct NetFilterState NetFilterState;
>> diff --git a/include/ui/console.h b/include/ui/console.h
>> index 853fcf4eb7..b74246f0f5 100644
>> --- a/include/ui/console.h
>> +++ b/include/ui/console.h
>> @@ -65,13 +65,13 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry);
>>  
>>  void kbd_put_ledstate(int ledstate);
>>  
>> -struct MouseTransformInfo {
>> +typedef struct MouseTransformInfo {
>>      /* Touchscreen resolution */
>>      int x;
>>      int y;
>>      /* Calibration values as used/generated by tslib */
>>      int a[7];
>> -};
>> +} MouseTransformInfo;
>>  
>>  void hmp_mouse_set(Monitor *mon, const QDict *qdict);
>>  
>>
> 
