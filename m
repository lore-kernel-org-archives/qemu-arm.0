Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4018504wrt;
        Fri, 19 Oct 2018 09:00:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60V3ihoeKBqzP6XpSUUDOrArAKgUKXa5PMLLNm2+xIh9e59iOgRW357HuK31R6MWU2hnC91
X-Received: by 2002:a0c:9578:: with SMTP id m53mr34870417qvm.138.1539964818898;
        Fri, 19 Oct 2018 09:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539964818; cv=none;
        d=google.com; s=arc-20160816;
        b=WUYHKnX+QNBLyFmo2H3exs68Nyn6wa3JjgkaSo4xKebK/E8pn2G67SoWonCodd8G3Z
         CZG0RqDsFyoljtlEMjgqAbiGodv9sb+W3cTgLcu53Nk7ueOeniJB/TFtDz+wDutJ58sz
         h5qKYpx+VgkKl7lEGqkdGE08GPgmhAKTSXZopfCWvF+/qEot6N20MBMD6P4t5aRDXEBQ
         H/WtsQjAV+q6HRqByo00euDC8EwGSdyycAT+kGOuWO+LjoASRBLIIa78IpmZQHSav+l7
         ShO/3MTEIGapIcDK0U/04ypKLtFcI1mP3WNcJFma0MMtBm7TOZIxSrB4t+l99pYyCTqm
         bsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=JBmNB5njybpN11tsLOAC1CCO8nL2ih9Flj4FZNGWr+c=;
        b=tKQH+73B7dXzhyvQDbNMmOX1Jp+pjb3ypZXdgys90us7dJj4RbZ0IsK8D5JV6vwstB
         WWBW6jnyinZ34LUdB8lzGp5NZAOnL0fKMe9XBpgy+fJBE+hYOoM2d0YQGvSVopeaW3iU
         nkxTn38f+NyX+DzjiYJy+5N+H4qM8c+I0bpo4jIlWvG+kDkTTuoRnr84hTZl5uJCwWF/
         OwqtrMcveXvQypxZ+CjpFlT0SuFNoplBqUaxBDxOa3xkcOGObAHsWwBzQm/9oi8qPB+V
         UHFDZ+TqLT6ku5kVi6dJ4E8tFuHhFZcudLo8D0t74ywfTNa4u/VTb2RXxPD6RONbb3Bx
         Ui0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h17-v6si2573518qtr.381.2018.10.19.09.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 09:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDXCE-0004oM-7M
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 12:00:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDXBo-0004i9-Mx
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 11:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gDXBe-0002We-0J
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 11:59:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gDXBd-0002Tc-Ha; Fri, 19 Oct 2018 11:59:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C73888E53;
	Fri, 19 Oct 2018 15:59:40 +0000 (UTC)
Received: from [10.36.112.30] (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F5B694B4;
	Fri, 19 Oct 2018 15:59:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <1539954845-26716-1-git-send-email-thuth@redhat.com>
	<1539954845-26716-5-git-send-email-thuth@redhat.com>
	<CAFEAcA-ahq3Y4sgs=Vijq_fsDPgX4JuG0gGdMwE5oOLOrsvxjQ@mail.gmail.com>
	<a6b421a6-439e-ac87-0f96-b28ca349bc70@redhat.com>
	<CAFEAcA9Pb5Dw9zu5_esYwor+MEmUJ=f4ZZqifui9qyJdKWbTiQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <98df614b-e432-5a18-34f3-b2275ba9af93@redhat.com>
Date: Fri, 19 Oct 2018 17:59:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Pb5Dw9zu5_esYwor+MEmUJ=f4ZZqifui9qyJdKWbTiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Oct 2018 15:59:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 4/5] configs: Add a CONFIG_UNIMP switch for
 the "unimplemented-device"
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
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MWxc69xuB+Vo

On 19/10/2018 16:43, Peter Maydell wrote:
> I think if we want to support this for downstreams we need
> to look at something better than the default-configs/
> mechanism for it. (Perhaps the kconfig-alike Paolo mentioned
> in a previous thread?)

True, but having more CONFIG_* symbols does not complicate the switch to
a system like that one.

> My dividing line for "should something go in a specific
> architecture's default-configs/ list" is "is this an SoC
> or real piece of hardware that is naturally limited to
> one or a few SoCs".

I tend to agree, but I'd rather have a separate CONFIG_* symbol as soon
as two different *targets* (aka default-configs/*.mak files) use a
device.  So the SPARC change that you mention would actually be a good
reason to introduce CONFIG_UNIMP, for example.

Paolo
