Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1295385wme;
        Wed, 16 May 2018 09:08:46 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpCpjKtuwwkMHHXGLVSS1Du8YMZmX3XSNBSkvYF5AD8ap0DugkW0RojJrEgt2dlre9E6k1D
X-Received: by 2002:a37:1fa1:: with SMTP id n33-v6mr1469596qkh.393.1526486926189;
        Wed, 16 May 2018 09:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526486926; cv=none;
        d=google.com; s=arc-20160816;
        b=aH71Cb7S/KEfJAxjN2Rh2oy71mMSARSFgmIoHBWGkJql8CB/vCW8CUB6AbzSk0F0eq
         2xxS05sQt8N2uMlFXt8gtRPA9w+TBwSzjrwGxDBXUskPNGiT4tY+n2yaPBM+zbexTuPo
         mwR9ocIKOoAXG02PStWTyZojq810uRno/akCRx95Vwd1e6Nm/Z9v8bc9LymLsrkcWoaw
         ylaGTYyNanDdyOEHXAIHMYBLfo6vVQyqNXqAvEOL2fQLnVZ+3TmXFhrpHGzNwey9d5G5
         I6D+B8rY40tqePq3OUBLJmv38k1ltYS+6LmRuTZqOpR5ZPtDYYdBxjYm1H4K7phoH+Zd
         ZdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Fa0VkLYlMAQOPlS6prcxodNzmF7z/eK0XDs5Qj8IPPc=;
        b=SZlm7R7UYUUyjLmqBfe85hVnnS1NWu7T7if7FxWgUAbKaLHW8dJ6WDgMCXsF3ZaHfX
         SIJsGjvWR+sYtrgyw3T/lFP3RSMGqLDgiWGlk26up7si72m9AnznFylJ1k7AjbmJKyhl
         6STjyyY+luPoyLJdvweIAJZ8rCvn/VFE1MvnGcflPtfF/krAs7ZSWrybKOvLV5d93TeY
         y+ZrG2ODxtyCLe4X+F0/kX6UhxgA7OEfVpqtvFkMNqN2l8oZSJ/wGoM//WM6+g+78Xir
         T9hFg/mcnwkJXKScUD4mMkSqqLCX/CiFvUcEIXkYMIqj4TxF4I1B6yfMg9F3WtrlDeAp
         RLMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O0J7zU7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g28-v6si1117087qvb.234.2018.05.16.09.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 09:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O0J7zU7X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyyr-0008DT-JJ
	for alex.bennee@linaro.org; Wed, 16 May 2018 12:08:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIysg-0003FS-6Q
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIysd-00009Y-1M
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:02:22 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40136)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIysT-000068-To; Wed, 16 May 2018 12:02:10 -0400
Received: by mail-qt0-x241.google.com with SMTP id h2-v6so1716841qtp.7;
	Wed, 16 May 2018 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fa0VkLYlMAQOPlS6prcxodNzmF7z/eK0XDs5Qj8IPPc=;
	b=O0J7zU7XBNuEF9bm7bSYt6Z4xZRJdaICApzq84ohRu0cKTj+vhQ0BZ0MKxioQhoUPH
	9TO4qSIkU4XTWYu7W76nATCSxKwq6DDw5v5lcBnUsWK0Wj2hGUfJjwq0CKtTlyagxGgd
	e+YGrHX4N1tUAkenWZB0Cg23ZqKazX4HJ/hYt4QpY44CNJu3B7GUofHIr7fh9jotojO6
	uvaSJUUlt4aGJoMIZozBQ3BySoQ5OjHmClCVmIT1JOBoxtqAeUu/oWkpqJPtoJnPdDIs
	xv2HdxQevSAEBXcTDRuPToqLfFWCbmxdVt0bD6GN4ewT0hqlfUdHsi8r8muuhjIefRC0
	Sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Fa0VkLYlMAQOPlS6prcxodNzmF7z/eK0XDs5Qj8IPPc=;
	b=Ewa5QC/AV6Vdyi5eoZSWNG46+J7gtaK1nymaB72XvdFyySspvFZFKTJuhlzC1UjJbZ
	mTxLwZWyxG1FoIGJvOlHO+B9WxWDN9iFw8zTteewQYaxsMuk4do0xwsKWhUnLYt9QHYi
	VyUEUba2RvukhPStdDgyzebY64XzOI5bUzWhGjMknDI4z42yP2cG6mzYTLntGG/7fft9
	wjz8mKGEdI+LzOx+Fj87vHXZCc/+lG5u6iB8HwU+o8aLUovruEBmJDgbFDN3GHxq6m3N
	na6i5AmTw5kFkIxZersw94gME3UE28SWqHwOpolB4Fy88GjWeOviiAMiSdQoBI11SGyq
	U/Yw==
X-Gm-Message-State: ALKqPwey9jmbJr6+j2IJRbmysW+GiVPqM79cGstclLfheSx69WSzfZWJ
	KbZDZj3k7g6aV71w2P5RsgI=
X-Received: by 2002:ac8:6d2:: with SMTP id
	j18-v6mr1515165qth.306.1526486529013; 
	Wed, 16 May 2018 09:02:09 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g47-v6sm2210543qtk.87.2018.05.16.09.02.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 09:02:08 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1526493784-25328-1-git-send-email-eric.auger@redhat.com>
	<1526493784-25328-2-git-send-email-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <85f12e3c-f3a5-3627-6865-4508f3492a6f@amsat.org>
Date: Wed, 16 May 2018 13:02:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526493784-25328-2-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 1/2] hw/arm/smmuv3: Fix Coverity
 issue in smmuv3_record_event
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /TjNBgZGXPWb

On 05/16/2018 03:03 PM, Eric Auger wrote:
> Coverity complains about use of uninitialized Evt struct.
> The EVT_SET_TYPE and similar setters use deposit32() on fields
> in the struct, so they read the uninitialized existing values.
> In cases where we don't set all the fields in the event struct
> we'll end up leaking random uninitialized data from QEMU's
> stack into the guest.
> 
> Initializing the struct with "Evt evt = {};" ought to satisfy
> Coverity and fix the data leak.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b3026de..42dc521 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -143,7 +143,7 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
>  
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  {
> -    Evt evt;
> +    Evt evt = {};
>      MemTxResult r;
>  
>      if (!smmuv3_eventq_enabled(s)) {
> 
