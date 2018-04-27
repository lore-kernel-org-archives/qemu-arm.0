Received: by 10.28.4.212 with SMTP id 203csp972315wme;
        Fri, 27 Apr 2018 09:37:02 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoI+gSWGidJhPY/Pcjk7WLpVXpeF1Oi/gp+eK5jVDfy6KZbVaSHzt6efqdMDXbB7hfBezhl
X-Received: by 2002:ac8:4141:: with SMTP id e1-v6mr2353092qtm.324.1524847022269;
        Fri, 27 Apr 2018 09:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524847022; cv=none;
        d=google.com; s=arc-20160816;
        b=AIC7EZYD4PSY24EvanmZydfGtZCHHL9vcbqG08XO3dc/NBSfXriokGpKdpBBlGcYL5
         Btw75aga50ICdqcw9OZ2SWorKElltCSZ1kvjSYaJsN02Zo/91Nw9h72yTUQUsc4+0S1u
         h03U0mU5V3dkOUAB8XznNAPLoJr7rmsH1ycvDysumu5+VGdrtKqeWsmlz0ED9zgeBeQj
         73doPuMix47lcHRR2Cx1RmeH9SxT/8sWtLDI2Zgw0oW8JOqVTku7Wr7FzqKvZL9FC5Av
         4qPufZepOQDtMMoLXZa91f0w2p4ZJexzpiBXknvmGzYNoyw4mCwNfiCB8QeenL+8QwEb
         b/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=iJUW3OfL9JF3WxICHI71tKIRARIM4wIOrZi3FDuPQ4Y=;
        b=xO8+/wcb9O9X/u8cVHDKRoiv10nYHs+8gV/KGvfioctJSmXgpmdeUXdJelhhnet5yK
         mTFb4j0IHG0cUeuvO25k+WH/8nIHaRBGihLBnllxcU/IlCpp/6f9JdRix5/NodPFZnfo
         NigqUWD8fmgFAPORycARdZSF12wAelnMPVLiHIHzgUC6rQcZn5FM2BBIC7DixhE8g+5V
         sqhdccdOe67z/yMrFvGp9j1lIXk/1xdLiWsKZ/cTsQHwWkslgaIv5mwE1py7LUMCvfTr
         jYSU2XDwkBsOhyTOXf13nTeGREG8UBDYxiicO7RmgI2nUPvd5YF23NuO2HolZm7+2QKJ
         yp2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si666331qkm.163.2018.04.27.09.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 09:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC6Mn-000695-Rd
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 12:37:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fC6Mh-00068s-Ef
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 12:36:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fC6Mc-00011n-IZ
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 12:36:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55910 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fC6Mc-00011S-Do; Fri, 27 Apr 2018 12:36:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BD5B41662E0;
	Fri, 27 Apr 2018 16:36:46 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D0B200BCB7;
	Fri, 27 Apr 2018 16:36:40 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<099d2af4-8fe3-f80c-693f-495accb26a17@redhat.com>
	<CAFEAcA_VAckXDgARe5dJdxe9N19quUD5Dn+Dseuj=itLbFmG0g@mail.gmail.com>
	<40c06711-f9a0-3440-9a47-8230cbcb3d55@redhat.com>
	<87muxoehnp.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <155fc4fe-f8d6-a3d9-0f50-d5384a09835a@redhat.com>
Date: Fri, 27 Apr 2018 18:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87muxoehnp.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 27 Apr 2018 16:36:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 27 Apr 2018 16:36:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel]  qom-test
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nakxs9AbK7bZ

On 27.04.2018 18:30, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 27.04.2018 12:20, Peter Maydell wrote:
>>> On 27 April 2018 at 07:06, Thomas Huth <thuth@redhat.com> wrote:
[...]
>>>> Shall we change qom-test to also only test with the "none" machine in
>>>> the normal "make check" mode and only do the full test with all machines
>>>> in "make check SPEED=slow" ?
>>>
>>> We definitely want something that tries to instantiate every
>>> machine, because that does catch bugs.
>>
>> Yes, after having a closer look at this one, I also think that we should
>> *not* change it to run with "none" by default only. The 'qom-list'
>> command results in quite a different output depending on which machine
>> you run it on.
> 
> Only running "none" is too naive.

For the targets that have "versioned" machine types, I think we could
skip all the older machine versions, so that we only test with
pc-i440fx-2.12 but not with pc-i440fx-2.11 and older anymore. That would
need some more or less clever algorithm to detect the latest version,
though.

 Thomas


