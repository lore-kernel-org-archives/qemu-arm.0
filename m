Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp986252wrt;
        Sat, 20 Oct 2018 12:58:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60EOFejDb8SuuhfHEbkO3arv30lo/pL9gNrrIMmFwfzcd2YQlL9lCIB9jvuXmioUS6w6dP0
X-Received: by 2002:ac8:1770:: with SMTP id u45-v6mr37830288qtk.285.1540065501415;
        Sat, 20 Oct 2018 12:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540065501; cv=none;
        d=google.com; s=arc-20160816;
        b=CFKDQNZfVl38ofyoF+6zCyUMJMmfyZ9skq13Rf+9TfZzWbU/QHhRsdvWE375TTcS45
         MaGvOtxL22JrF8Ym+aE83pntRStTczt5LSvVC8yl/yroNDsZ/qUtvMdO2URqj9bzH0O8
         o53eoaPk+SvXj8SZP5HXMdAfRLc5bAnVmH3YwnsWOHCfaDVYGXgscCZSxdJEACrIKuft
         d2kr1kX/XsUPXl4zx+egLTEhw5+fILCxvySvNf0c4E5zfg/QYjp5Xrg/tHeM3Qvjato/
         gtCKQDhIWVfEnfR0uj/yuVCi5mnsQr7mMtXg48QgUZbeB/iLrChz8ARuYggG7HsS9/+9
         XWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6hHYF+ibVeEBWB7ajnzRYahThkxrLFyXkGx+MDGS5xM=;
        b=r8ARSOng0/gJDUbqidwa2IIY+u7z/Cb8x65kFGfqj33ecqnbd7k0xjyJjOArDWV/Up
         qwpQCB+hZRizoyQX8pzKg7fFzg63PqD3m3qt2KberTkgI6ICXPsYGSbaC7J6+VDohKXH
         2tlthhQlGZF5fL4S2rrbTLygeRzIJWYj0UJqrQUyLygsWz4jDu1ODXGLxR8ow1FHzhHk
         lMbWeVoFBEDAO5hjvRbRQVkAnHLD75+3wLuyNv7Wpw0knveXD9bGzZXFVqcpiEbArIqo
         ONTXRl8mutYHNbUaBYqj8VEvoqnXCOHqn+7gpCbfokYyPSuDK5ydnENnmFbV61h/OaJK
         /sjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16-v6si8642032qkg.11.2018.10.20.12.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 20 Oct 2018 12:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDxO8-0003RJ-Ub
	for alex.bennee@linaro.org; Sat, 20 Oct 2018 15:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDxNl-0003JP-8S
	for qemu-arm@nongnu.org; Sat, 20 Oct 2018 15:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDxNh-0002lX-Un
	for qemu-arm@nongnu.org; Sat, 20 Oct 2018 15:57:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gDxNh-0002l6-Mk
	for qemu-arm@nongnu.org; Sat, 20 Oct 2018 15:57:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id q1-v6so7874371wrs.4
	for <qemu-arm@nongnu.org>; Sat, 20 Oct 2018 12:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6hHYF+ibVeEBWB7ajnzRYahThkxrLFyXkGx+MDGS5xM=;
	b=XLkE80Coiz7+x/1V2doHw1EmAiIwLV4dPzfj3t66mz/e+5zu/aFXi5Lux+/OOx4dcG
	UdLosbh1NVuR6CAqMB7+eGFOg2XXdnOBuJWkfb7P2g2LgsaqrVOk/GTNDe896R2C5uFl
	XbVzI3QcrF1Zm6Twz8bkHiaibWtNG0BFs569ripwcdRNErwlbvIHEEpx1nWKfI6ePrFW
	QjDhZpG9MgpHIz3xIrqFBAgY7MS6SE0fGchm2FKE3Lx8WOEOT1XLEWNhPMo3zBL8oA42
	ru+V4adGwvFH1ytLq0V9uZl2Bz3IO3HVOtW6RoY3E3EwVqETE4NEMW9eMf+akyVdUCkw
	Mmyw==
X-Gm-Message-State: ABuFfojHP1ChEdMaUade13OUKpKVl1eG0tVQiRiXgDVe9VMrXDYEgswF
	Nuo56xa4W+MMqSCjYTvkMBGczg==
X-Received: by 2002:a5d:424c:: with SMTP id
	s12-v6mr17945950wrr.260.1540065471849; 
	Sat, 20 Oct 2018 12:57:51 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-231-174.clienti.tiscali.it.
	[78.12.231.174]) by smtp.gmail.com with ESMTPSA id
	5-v6sm13915695wra.48.2018.10.20.12.57.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Oct 2018 12:57:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
	<CAAdtpL4M9zD3LPOMgQNtN50pKzZAsoKn0c_uBe5vajPFwUMJvQ@mail.gmail.com>
	<b43a36a4-bb35-77e4-42e3-d15aebd618f9@redhat.com>
	<CAFEAcA9QtLnFhPfgRgeduB+avJcC9X8Tea1Hi-2q3p9GtU_j8g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <004ec9ef-8568-c645-627d-f7cc2b4df3f6@redhat.com>
Date: Sat, 20 Oct 2018 21:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9QtLnFhPfgRgeduB+avJcC9X8Tea1Hi-2q3p9GtU_j8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/5] configs: Add a CONFIG_UNIMP
 switch for the "unimplemented-device"
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqv9Xl+1ujrC

On 19/10/2018 18:54, Peter Maydell wrote:
> On 19 October 2018 at 17:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 19/10/2018 18:25, Philippe Mathieu-Daudé wrote:
>>>
>>> First because I'm using it heavily on MIPS and PPC boards, when no
>>> datashits are available.
>>> I'll submit that during the next merge window, although the MIPS tree
>>> seems now reluctant to that kind of hobbyist work.
>>>
>>> Second, because it is very clean when you implement a SoC to first
>>> start with an empty UNIMP region and a cpu core,
>>> then declare the mmio regions for each device (still UNIMP), then you
>>> can slowly add devices one at a time.
>>> This let you (me, so far) push at most a dozen of tiny patches in a
>>> working series, instead of a small series of a dozen of huge patches,
>>> or a series of 100 tiny patches.
>>
>> I don't see however why it's a problem to add/remove CONFIG_UNIMP to
>> default-configs though (in the Kconfig world the board would "select
>> UNIMP").
> 
> Well, it's extra friction for people writing new board models,
> and the benefit of having CONFIG_UNIMP is all to downstream
> redistributors, not to upstream...
> 
> I'm not vetoing this patchset, but I do think that if RedHat
> wants to distribute significantly-cut-down binaries then
> it would be worth working on a mechanism for making that
> more conveniently doable, rather than just hacking up
> the very creaky default-configs/ stuff.

Yes, we are going to meet the NEMU guys at KVM Forum and talk about the
"mini-Kconfig" stuff; in the meanwhile, default-configs/ is what we
have, it was enough while we were caring basically only about x86 and
thus we only needed to disable PCI devices, but now it's showing its age.

Paolo
