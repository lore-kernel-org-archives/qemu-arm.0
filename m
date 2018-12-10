Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3379477wrt;
        Mon, 10 Dec 2018 01:22:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WztnAjT8bgRm7ckMcn8kewX4Es7rp27iZMt7Vw4qAjK5lQ+UDW7QEQ2l9w7ZpUHg3l+DWr
X-Received: by 2002:a0c:9047:: with SMTP id o65mr10820336qvo.37.1544433754021;
        Mon, 10 Dec 2018 01:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544433754; cv=none;
        d=google.com; s=arc-20160816;
        b=aqKHpyN6l/RO3rjNfXyfyr6oeK59RIEsNmEZ+L2xD/aBtKOYt6OpROXs6xLmHVp+EX
         0elyT/9EqMO4JGxjdl8uz/5e6j2BqmUD7dYKwBAuja0Moe+8OA4KRzxvjYcO5PsK2PhI
         bZ5K+MCsLVmuheLgwp1RlX1lXrntvIn5eS/kIPKej2Is5CBVrKKUPosiJyJlyAbKCx2b
         XMCaKGhHxyvvfY9LV4x+/zCWCpqfZK3uHBwwPbIvGr/t5j4BaswnABhRRHTNnzF5QyR2
         e8UE9lO4NGoH0VcjKFyUk7C9KmG9ErhZFfRihtOxpfD9CWQBo2vDk8pu4k8fv2gq7K9m
         Q2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=kExO9843S+rTrZm14Og2Sx1GhnbpK4Ot3GlEDphuOSw=;
        b=xkzm8obhldhnBdXz+02iwiRI438dBw/bxOjwT1W8zSSnuy3Y14BVu8vvp9VWQDf5E3
         lvb1DD7K5KWEe99lrecq4N5dV54qk0rVM8zKsfMAJIpj6XU3CJvFFSD/iRoXrhEKK6AT
         pv0glykhaa/yKkcf7JjGQw6Fq2K63XHNQBWWLIKznmJHmi/ywf4JQ8iVhNXtj2moyZL7
         jg/NmegLpAzDCbIaRYctLZWfD/U82D0OhmFDavafXDE8zFTwgi10rkcwEZ0UnGVDoFKM
         cvABlpxsYlGIZWRoJL7V/7HW0lrR7+Hx7F0u/2YjQH6tQpU3gq2eS6MKqdGZVioud4R+
         Kg/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12si3397152qtq.2.2018.12.10.01.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 01:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWHlp-0003Mb-Hp
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 04:22:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWHlb-0003Kz-4m
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 04:22:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWHlT-0005Gt-4w
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 04:22:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gWHlO-0005E1-T6
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 04:22:08 -0500
Received: by mail-wm1-f68.google.com with SMTP id c126so10353661wmh.0
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 01:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kExO9843S+rTrZm14Og2Sx1GhnbpK4Ot3GlEDphuOSw=;
	b=ZQMMNAZlkLny2CUoEbKXYkUoszf67bRkhxsLUtZLGxrL8JqxQzYQPcBVcACdzew1J+
	xryIl2hFqu/809u4Y6XO+wiTuEUtZiLf9esoz7nuJ3pwDyA16JAOimyChFNyTHvSZnIG
	7GxKKkpofs6kAEb6/j8VeQ2P5A5mfmq9149scZNl1U68FiOymS+LVr7qfbOziVUPaIfj
	Drpk7BcpH4qj2i4k95JoB7d6GYi1MvKPXec+IMgHiTkxqj50G5VZuBzjgwEyb4AOhQNI
	P4o9PARDhAHPaYQeyhoK52XIsakovFsrPgWLSZWESJMisBecg0xAfmer3IfZxjcoyX6J
	WFzw==
X-Gm-Message-State: AA+aEWaIKH/YgBejtCRJp3U0rF3EFu/dYo3THzWHqq4qVOX+0+/JIPNg
	DCXcx5JlHlBNMbeofq7MeUAryQ==
X-Received: by 2002:a1c:8fc2:: with SMTP id r185mr9731323wmd.54.1544433723783; 
	Mon, 10 Dec 2018 01:22:03 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172])
	by smtp.gmail.com with ESMTPSA id t4sm12241494wrm.6.2018.12.10.01.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 01:22:02 -0800 (PST)
To: qemu-devel@nongnu.org
References: <154422288914.14995.435815784241619944@bb8f5089e434>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <db13f89b-be16-e80d-bf29-6153922ce63b@redhat.com>
Date: Mon, 10 Dec 2018 10:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <154422288914.14995.435815784241619944@bb8f5089e434>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] fw_cfg: add HMP 'info
 fw_cfg' and add_file_from_host()
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
Cc: peter.maydell@linaro.org, famz@redhat.com, ehabkost@redhat.com,
	mst@redhat.com, dgilbert@redhat.com, qemu-arm@nongnu.org,
	imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w1/v0pWzwmwR

On 12/7/18 11:48 PM, no-reply@patchew.org wrote:
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> 
...
> The full log is available at
> http://patchew.org/logs/20181207170400.5129-1-philmd@redhat.com/testing.docker-quick@centos7/?type=message.

  qemu-system-x86_64: Back to tcg accelerator
  Broken pipe
  /tmp/qemu-test/src/tests/libqtest.c:125: kill_qemu() detected QEMU
death from signal 11 (Segmentation fault) (core dumped)
  GTester: last random seed: R02Sb6a4400485731f23217a8855e030b450
  Broken pipe

Probably the error Michael noticed:

>> +void hmp_info_fw_cfg(Monitor *mon, const QDict *qdict)
>> +{
>> +    FWCfgState *s = fw_cfg_find();
>> +    int arch, key;
>
>  Looks like this will crash on a machine without fw cfg.
