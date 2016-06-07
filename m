Received: by 10.25.27.66 with SMTP id b63csp2006383lfb;
        Tue, 7 Jun 2016 06:23:48 -0700 (PDT)
X-Received: by 10.141.46.3 with SMTP id x3mr21625049qhe.3.1465305828780;
        Tue, 07 Jun 2016 06:23:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c34si8818792qtc.9.2016.06.07.06.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 06:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAGyy-0005f1-95
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 09:23:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAGcC-0001JD-T4
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 09:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bAGc8-0003xn-RS
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 09:00:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bAGc8-0003xi-Lx; Tue, 07 Jun 2016 09:00:12 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27B453B720;
	Tue,  7 Jun 2016 13:00:12 +0000 (UTC)
Received: from [10.36.112.45] (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57D07xN022213
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2016 09:00:09 -0400
To: Igor Mammedov <imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-7-git-send-email-imammedo@redhat.com>
	<934c1059-07ac-aed0-4ee5-c4bca138db55@redhat.com>
	<20160607143244.2d4ddb81@nial.brq.redhat.com>
	<5d059ff5-dadb-8f90-deb0-b864bb50ee87@redhat.com>
	<20160607145400.3dcf78b8@nial.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <78c0ee46-b787-e84e-45f4-d98b7b25b9a8@redhat.com>
Date: Tue, 7 Jun 2016 15:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160607145400.3dcf78b8@nial.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 Jun 2016 13:00:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/10] target-i386: print obsolete warnings
 if +-features are used
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OST83+fJ6Zyf



On 07/06/2016 14:54, Igor Mammedov wrote:
> On Tue, 7 Jun 2016 14:36:51 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 07/06/2016 14:32, Igor Mammedov wrote:
>>>>> Could you detect using +foo together with foo=off, and -foo together
>>>>> with foo=on?  Those are the really problematic cases, without them +foo
>>>>> and -foo can become synonyms for =on and =off.  
>>> That's (legacy)current semantic of -cpu +-foo where it overrides any foo=x,
>>> potentially it's possible to track foo=x locally in parser
>>> and then compare with +-foo both ways.
>>> But all we can do currently is to print warning about such use case.
>>>
>>> I think Eduardo's suggestion to just warn that +-foo is obsolete for now
>>> and drop support for it in several releases is sufficient(good) enough.  
>>
>> kvm-unit-tests and libvirt both use it, especially because =on and =off
>> are relatively new I think?  It seems like it's really widespread.
> 
> Yep, that's why it's not removed now.
> Looks like libvirt would be able to switch to foo=x syntax,
> I can take a look at kvm-unit-tests and make it use foo=x too.

And all tutorials, and all scripts.  It's really too hard.

I'd really prefer to make an incompatible change straight in 2.7 for the
case of mixed foo=x and [+-]foo.

Paolo
