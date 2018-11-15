Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7098449wrw;
        Thu, 15 Nov 2018 06:53:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5d4tnyTY4xOCWuO0SM3sWgxDm1elxaxU66ga1FkJhmlF+AQePNYrVvx5VXi51zaRng1KAlB
X-Received: by 2002:ac8:7250:: with SMTP id l16mr6096452qtp.348.1542293600961;
        Thu, 15 Nov 2018 06:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542293600; cv=none;
        d=google.com; s=arc-20160816;
        b=RtuDAC1TpAlGUmB4ARU1MXrEfciVfrUdkNuPBTOmNtmBgLd6icELyBQ+fjr8KI6V38
         DWb75FWfRKPimvHFSmXXOFuET4ZBkoy7yizafwfIMcQ0MJpU6/n6CxKKizmruq/2Jx1o
         1CsYgr+YS5nsU3APQHEXXoAbxZrELzTTfeRGtnE9UC/RmoyBEriZ80mwTeiWSKi7hSHE
         iRaY75JsbP0Ys8nYm0mdiX+fZfIZviDh4D5d96tTkn+nUacgq4QJnORTffqQNd2RErPX
         dc7LCtPeNj3JIRKYqG3RWO3Jlzv7Vuszi4PyJAw3rKfHvY3MTWY1rq/M74u39CI42RBs
         w1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=bF6GGl47JbTr3RuD5vj1QkTXXZzSvsD7c1F/o6TgtOc=;
        b=cWkNYJC9y8gVx77mmbE+XR3PhSp7Z9tOZjfq/NfT62eYTGas4iNK4DzFPE8HyMBEYw
         XQnrWD97xT1qS9C58ivhmV6r4HXJeUm4GwVJKIQ2c0vsQJQv2fcHoMcZ1amk5jDOqL+7
         S5nhGfD8oH83CfGRztKGyK8NxJz64pZ0bbsMQ+I75l2J36x9WW1RbUfTgNjr6dh4x3nU
         XpBxSEN5HPy27E1dXQ1cd+ylpLbNgEX2ZUPM1lKsmfGkutBT6D96R6IUco1F1zR4HPyb
         A1AWI34m3yMoLsFeShh97r08/vkyOU/2H8N0Vnf+y+W+l5qbhjBXmQ+Ce0nulFj6TTlL
         pmqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si2175945qke.217.2018.11.15.06.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNJ1E-0003QI-FN
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:53:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNIxr-0001TF-50
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:49:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gNIxb-0006gM-Ir
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:49:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gNIxZ-0006f7-Af
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:49:35 -0500
Received: by mail-wr1-f65.google.com with SMTP id z13-v6so21517788wrs.3
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 06:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bF6GGl47JbTr3RuD5vj1QkTXXZzSvsD7c1F/o6TgtOc=;
	b=csbRFVg+qspb/ym61CNYgoJluWyGv3btwx87TnRvDZ/mgPuyZ7TwAxjn7/2msbu/QH
	TgN+t9oL4bx85nKx3mj/Gj1K8uy0bfVN4zVyAeA1Co/KGuBzZD1omGAODtm3Cveh4nab
	GNckLGflkJzM51tFi4F6km1azCQaucw01THsV4yYW8DG2nmpl8cSfpSVyrIy0ZtlF0l9
	ZZmJ7UTc0Hsf62L9EPtKf87R072FTOPxxO1hEvXIUhoALGpXNyWx4H6hTxiV4ziUfSTx
	aoACgTV4/nqL1XvXWhuENti4pMZNZrW1HmyDsruz8j75zGR6JYEDOCdxOI90jKDpud2k
	rZjw==
X-Gm-Message-State: AGRZ1gIuvZrx2VFSsydnzEO4ZyyyUfluRdrTNcBYIaGfAoz/XZyXx/3N
	Lw7XY99gxP8EonA77WO4dEoxdg==
X-Received: by 2002:adf:e4c1:: with SMTP id
	v1-v6mr6261246wrm.227.1542293372188; 
	Thu, 15 Nov 2018 06:49:32 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	e8-v6sm46931944wmf.22.2018.11.15.06.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 06:49:31 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181115143535.5885-1-peter.maydell@linaro.org>
	<20181115143535.5885-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <164351da-7ffa-3e44-8883-f4e272d181dd@redhat.com>
Date: Thu, 15 Nov 2018 15:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115143535.5885-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1 1/2] hw/block/onenand:
 Fix off-by-one error allowing out-of-bounds read
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
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agKPnG3ARlza

On 15/11/18 15:35, Peter Maydell wrote:
> An off-by-one error in a switch case in onenand_read() allowed
> a misbehaving guest to read off the end of a block of memory.
> 
> NB: the onenand device is used only by the "n800" and "n810"
> machines, which are usable only with TCG, not KVM, so this is
> not a security issue.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I tweaked RTH's suggested fix to use an 0xbffe offset so
> we don't overrun on an access to 0xbfff either.

Correct.

> 
>   hw/block/onenand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/onenand.c b/hw/block/onenand.c
> index 0cb8d7fa135..49ef68c9b14 100644
> --- a/hw/block/onenand.c
> +++ b/hw/block/onenand.c
> @@ -608,7 +608,7 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
>       int offset = addr >> s->shift;
>   
>       switch (offset) {
> -    case 0x0000 ... 0xc000:
> +    case 0x0000 ... 0xbffe:
>           return lduw_le_p(s->boot[0] + addr);
>   
>       case 0xf000:	/* Manufacturer ID */
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
