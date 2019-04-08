Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2973921wrx;
        Sun, 7 Apr 2019 18:45:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyaYNkOZ7WLbuuc+mpaSYJ/8NcJEE1+JdwYYvUExahYsRNgpWK1b8kydIWoSEEn9nZXKcE1
X-Received: by 2002:adf:ea81:: with SMTP id s1mr17040754wrm.277.1554687959087;
        Sun, 07 Apr 2019 18:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554687959; cv=none;
        d=google.com; s=arc-20160816;
        b=IYwswhVI+WJ/9VnHtlEZ4uEfLLYA737T0h81qxExi7EOVrbfyfLH4XvRDGbPVwCwnN
         Suxz70wX+XnK80D98L21i2l/+e5cNbz3PToqITkkLHCoQpWfuki0CokrDGx9cY5aw/4z
         mUO0E2+TUqWVUq9V8xKcYwyz2nQph01PmbvjiHMlF8eaDV+y9hOEfuJOxTF1Y0zMba7p
         6Bb/dPCqDLh8Sd0ew5I1DDZ8YIIflT4HcEVpuU7nsuS/lD0RXJ+mhrnXriMBwOUP5ylb
         OSPnsruNWex1e0bVaLVm+pxWo6IJTZ6nrhlK0MqDOK5mqmI8mBM3J40xf3qBZm/0LxV2
         MwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=I0bBNgdI0wVrDiW5FmWprUoqv1TU/wh9EP7qj3MwALk=;
        b=wfrYNJbiRH9xhiIMyLP+/GpI3rzm2ghZLmjuaZXDnSYAaQeUMLjDHvKEFd1eyQcsYb
         XDAudXoHBO5+O5yQM0zS978a1r7rA/qgcxSE91rX5A2p3cj5XKeEpAiBiyHHa8135nx/
         Jd5Q0hXyCdNqhYyh6fAj4gD7INh8EfS56PqpSM+of4UsG7CQqCydPMJFsa//PTMb10G4
         Z+MscHEwU+LCq8chHLTIwBrhMcL8NvSW3a6ggT8gnU2es3GmLT5ilgiIdy6AyBMqrYYu
         ykjGtdWzza2du4ShJ/OsglxbTCryUZSrM5/IWoDW/2YZFzUXNjCCHqVJQRNvmOm/b+F4
         2Cuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si5299388wmj.156.2019.04.07.18.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Apr 2019 18:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDJME-0002iH-7C
	for alex.bennee@linaro.org; Sun, 07 Apr 2019 21:45:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1hDJM7-0002iA-8t
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 21:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1hDJM6-0005Z7-6I
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 21:45:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:59174 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1hDJM5-0005VI-NU; Sun, 07 Apr 2019 21:45:50 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id EB38DE45BE85DA402998;
	Mon,  8 Apr 2019 09:45:43 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.55) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.408.0; Mon, 8 Apr 2019
	09:45:33 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1554624893-8363-1-git-send-email-guoheyi@huawei.com>
	<CAFEAcA-N=y3k41oexvYaQ+tKj1d2tCZh8MhPvdq8Uz7dh-eWWA@mail.gmail.com>
From: Heyi Guo <guoheyi@huawei.com>
Message-ID: <cb3534ef-2bd0-0518-c6ca-01c1f6511199@huawei.com>
Date: Mon, 8 Apr 2019 09:45:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-N=y3k41oexvYaQ+tKj1d2tCZh8MhPvdq8Uz7dh-eWWA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.31.55]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [RFC] arm/virt: add one more uart for UEFI runtime
 debug
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
Cc: wanghaibin.wang@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pvKdn6gpTEHY



On 2019/4/7 21:16, Peter Maydell wrote:
> On Sun, 7 Apr 2019 at 09:19, Heyi Guo <guoheyi@huawei.com> wrote:
>> This patch is based on the discussion in TianoCore edk2-devel mailing
>> list:
>> https://lists.01.org/pipermail/edk2-devel/2019-March/037986.html
>>
>> The conclusion is that we need an individual UART for UEFI runtime
>> services to print debug message at runtime, to avoid conflicting with
>> the system UART. We cannot use the secure UART either, for we may both
>> have Trusted Firmware and UEFI runtime services running on the VM, and
>> it is not easy to keep synchronization between the two components.
> I don't think it makes much sense to keep adding UARTs for every
> bit of the system software stack. We don't have an infinite
> supply of UARTs on real hardware either -- how is this handled
> there ?
As you were in the edk2 mail thread, I supposed you also agreed to add one more UART. What did you mean by "I do still have a todo list item to add a 2nd UART"? How shall we do that?

On our real hardware platforms, we don't have a separate serial port for UEFI runtime services; that's the reason for why I had wanted to have an adaptable approach for platform without one more serial port...

>
> Also adding new UARTs to this board is awkward because of
> the weird choices various bits of software have made in
> reading the dtb and picking a UART if there's more than one
> listed.
>
>> @@ -713,13 +715,23 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
>>       if (uart == VIRT_UART) {
>>           qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
>>       } else {
>> +        const char *status_string;
>> +
>> +        if (uart == VIRT_SECURE_UART) {
>> +            status_string = "secure-status";
>> +        } else {
>> +            status_string = "uefi-status";
> Where does this status string come from? The "secure-status" one
> is documented in the device tree spec and has a well defined
> meaning.
Sorry this came from my imagination, so I sent it as a "RFC" :)

Thanks,
Heyi

>
> thanks
> -- PMM
>
> .
>


