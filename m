Received: by 10.28.71.155 with SMTP id m27csp400360wmi;
        Fri, 23 Mar 2018 05:20:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtMOOS6qccTH78ONRtVBhb0eGpT7XiH77HooT11H2JLCPF5LQeGfVrJnJg/MGlLW8mrzaWX
X-Received: by 10.55.33.144 with SMTP id f16mr41063273qki.158.1521807617047;
        Fri, 23 Mar 2018 05:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521807617; cv=none;
        d=google.com; s=arc-20160816;
        b=i0mI1d8iu1EzQlAFq8tQWx9fDRefCXWsZxK4n9X4opmSKenhQcaQ7qlbCXYPIPJFhS
         6pFnErGucEMBz+gyJK7jlPQmrAWw382ivjU75iqdCp99y20N2B17KoWWCAxE4o5yt2Su
         3A7KwVBvCExVRryX3ImARdkh/4yuatalafctgq7zWanWwn4TQsbmNVui6umf0YZeBS0G
         m5ukvbcNX1Ojp/hAU8mJot5B17JbgbJttUlrMmReHat3GbR/vJ1ccw6k2V0AaJ/yDbvc
         NzjepUHXhCMDLsIyK9Nwy/srZP/QBzh3cGGCxmk8H7y0WnHe4DDEf+p9Noe+V2IKExBS
         +LMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=x5QNfweJ95u+a56sUaZpEcCOxVv5ujDbyBxZdoAZs7A=;
        b=w1G6NhjW7veMQKL7F0gAdyprOFjyZ1pDfiU7zm2dWrIzoF2h9mqjxCtDosxCTjOOar
         MfmOIz2T/R+lG+7hdKimMLkJAh9k5Tn4BKZXcExhp2r58N5b4t5pjfbjziHP8t3H6499
         eEx9mS0wWFFn91tSwNG20ZssZshs+SXTU2LkVaktvTL3/XwkmXo4xotz39egTwiZvMc+
         FZlIunohYtjvxCnOXlQuaXyU7Uh4Os38KGrnHMCAkYWbYQS7PNPsvlLVgLFalMqA4/Wf
         C3v6nm9oyZ8hSzS6NuLzwuXMZf17sZEbwruQalULWNnI+PNTLzi/UAES0fDDL8uy44pc
         O/KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si1099841qtc.285.2018.03.23.05.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:20:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLg8-0000zo-Ib
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:20:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1ezLg0-0000yp-Dv
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1ezLfu-0006G1-RG
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:20:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46110 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1ezLfu-0006FN-MZ; Fri, 23 Mar 2018 08:20:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A12DEAEB8;
	Fri, 23 Mar 2018 12:20:01 +0000 (UTC)
Received: from xz-mi (ovpn-12-78.pek2.redhat.com [10.72.12.78])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA33215CDA7;
	Fri, 23 Mar 2018 12:19:59 +0000 (UTC)
Date: Fri, 23 Mar 2018 20:19:57 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180323121957.GM32362@xz-mi>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:20:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:20:01 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] Regression on KVM qemu-system-aarch64 since
 "monitor: enable IO thread for (qmp & !mux) typed"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, qemu list <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FNaOnzXiG+NZ

On Fri, Mar 23, 2018 at 01:01:43PM +0100, Auger Eric wrote:
> Hi,
> 
> On 23/03/18 11:26, Peter Maydell wrote:
> > On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
> >> Hi,
> >>
> >> I observe a regression on KVM accelerated qemu-system-aarch64:
> >>
> >> Unexpected error in kvm_device_access() at
> >> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
> >> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
> >> failed: Group 6 attr 0x000000000000c664: Device or resource busy
> >> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
> > 
> > Can you get a backtrace for this? (I guess you'd need to fiddle
> > with the kvm_device_access() code to make it assert rather
> > than passing back the error).
> 
> OK. I will try to do so. As I could have expected, I cannot reproduce on
> a standalone qemu command line. The problem observed above is seen with
> libvirt launch which may be doing some other QMP stuff concurrently?

Maybe not concurrently inside libvirt, but after the patches AFAIK the
QMP part can be concurrent with something else or break some timing.

Anyway, sorry for that!  I'll see what I can do to help.

-- 
Peter Xu
