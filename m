Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4887771wrt;
        Tue, 5 Feb 2019 07:22:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZVo2cXydmRF/+U/hHjDIvnZmmfxCAvAz2/LLflqrdFQ+JZQYwdCeG50/x+UQ7rFVdQyf+S
X-Received: by 2002:a25:a2c1:: with SMTP id c1mr4510245ybn.246.1549380156279;
        Tue, 05 Feb 2019 07:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549380156; cv=none;
        d=google.com; s=arc-20160816;
        b=jABmueJwviUMDkrwsoUa9ypt0stmMxZV+uJn03KX4P2dimUAvszA9oSOQM5rW07NxF
         JU7qn/jB/Dwbu3BBL03qlnzaFXP9MY+7izPjJiTsONpwil9szQtHDGAvY2fjE3ZUbfRd
         d3iXIvj+ddGb0g2tzNLPBGzB4rn7aLJfyt8EVo4n64KwyaIPxV0hPar2DfRqfNVTSJ7q
         JMCdZvKbIK5Yjp0u7x2RBblEhMJeqf8jhu+6ETcBbizXk6BJx6cSLu9FMLKYwy0z3asH
         mF/mHJ/Ju43QalRdNnhei/Z0NtOAGulXtc0YFsVeSmicTEwHP12VH845EAONu5hhM9gG
         cESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=IgCgUqfcIL6tykBJzVoB4xJMcpc/GQJwdkWjadvk2UQ=;
        b=MWjOElovjasCMxj0hXrOBOBbWwFB5s+qhw1QYOfLBNef72lYdeWbs6PwUQUK/p6Bcn
         Q25pq3u7K7mNQpbdnMmsgEipVsNRZQTHWfdIo5yb+biRz8bUhdThyFvjZZ5jhmG/A3ma
         8C4pVK15TuA1mV52/U5tOvwPIkNNS+TK9+GxPWpTFgPK5D9yV8k9BTdMhodkWINREo1/
         /lic9clUWTsXGD1u/d0htGR09U6kvYbIUV8JteW/HbrmrA9VV/9SKgkv/FxQQ1jSS4Ol
         yjbYRqnAaXpKqizWSsgDl08sMb5GiulBIsZkbHZvCD1Axj8kZTRcFxn0Lh/a++EJYFmY
         qGFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si2006929ybg.221.2019.02.05.07.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 07:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr2YV-00061E-MY
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 10:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gr2Wl-0005IM-QQ
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 10:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gr2Wg-0000SB-47
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 10:20:44 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gr2We-0000IP-1v
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 10:20:40 -0500
Received: by mail-wm1-f65.google.com with SMTP id t200so4121606wmt.0
	for <qemu-devel@nongnu.org>; Tue, 05 Feb 2019 07:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IgCgUqfcIL6tykBJzVoB4xJMcpc/GQJwdkWjadvk2UQ=;
	b=oICfYWvN++uMgVG+eK3domyww2/wIG1zVJMyaic+D8wqdn+7h3/Ct5sFgdMuc7sbTR
	Y8j1PYInHY7ZddF07BXxqDRYK89q97I2pApt1eD7FtzwSMkQrrshrNGSB6Q96xpSqSla
	1MNfC665GzR0LpsH3lWlhHh7IcOuzPW8Q5nVPhbN9ppegO5/jgNm9AlnvCdkLqgeqCtU
	vPsUF0NMa1n4p9ejYUYk0FI56/2hzyjK+8bEmbewNmylP3Iwuuryy5tq8NWOdCAF82vo
	RRdt7UH3A06mYhuczmyMAdzHQxIXNWDT+95w8hb+Ewmyb01wzCfh7WnzQMr+srZe8ef6
	AtSw==
X-Gm-Message-State: AHQUAuZJjixYJVkE7wj1xDymu27/pKiadXhnB8bNygFvJ2Xdskc4KKbZ
	S6A0rlrVFuSXbAi8CTylwnOhZw==
X-Received: by 2002:a1c:1b4f:: with SMTP id b76mr4158250wmb.147.1549380027274; 
	Tue, 05 Feb 2019 07:20:27 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	t4sm18647902wrb.64.2019.02.05.07.20.26
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 07:20:26 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <91c92519-2eb4-a769-7bff-9cd7b8b5c919@redhat.com>
Date: Tue, 5 Feb 2019 16:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the cpu-cluster
 device with user_creatable = false
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 65xg4L0SBdUx

On 2/5/19 1:58 PM, Thomas Huth wrote:
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
> 
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
> 
> Since this is an internal device only, mark it with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>  
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo cpu_cluster_type_info = {
> 
