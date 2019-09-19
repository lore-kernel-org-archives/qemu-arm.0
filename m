Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp742589wrp;
        Thu, 19 Sep 2019 02:20:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzj80K+1Ali9Eri9lf9ZKBbgfxgSx46gPz68felg70WLoJwHNZ5cX8Vr+d56svG5yTSZ+sh
X-Received: by 2002:a50:a0e2:: with SMTP id 89mr14704541edo.118.1568884814873;
        Thu, 19 Sep 2019 02:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568884814; cv=none;
        d=google.com; s=arc-20160816;
        b=sBQ7+WoUpW+oOMTtcrptfBa6V4LDsgK6mho+ik0pqqI7a9hzRZaC0wZ/e8aZ/SQUFz
         dxTmmiLBD0HuhzV6Qc3vV8rw3JI++/T62HlXspTC+pVKFpcbqy0tFqErLwQ4Cib+Yfg0
         xAPmC/5cJN3NzjnJG02SDDy5/3eHs1bnXWR7/js0WlKJzNXD3HMpEP7Bo3FZE3htF8GR
         2sAVwIL/7D09TMz7O7kieX7FR12E5F4sOTg/5MUHeq816+3vx8XnN5lNzksgEffvgI6u
         ZkqdlTd6D2udhJ2ovxfAdUED26GVBOklVl2cGn6AVAVwoOCjL3EgGVHiH/A/LSE5KruD
         3UVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=EcjyNxUPwHP40fFZVEPK5tYgKp+/FUC67L5bPGAUH0Q=;
        b=JiKSFnZqXVMaAc0bl/uKdUMC3WH7bYCegUV9PeCMy5GujYQrBquGopIMc1/gn/G/0n
         1Mr44Wo917LHIV0xWbE5ee/MoU0kExlHmyBWndTL0JF9R8gm3gs+Iy/NpmOqU6TVgKXR
         mtgKGoD2fz/PZo+DasJHAOXy89qf4RgXJQ+50WN7BZY+DIPASqUwUCdn/dqcRLBnUzLd
         RVAXDXes8ZgytQQT5CycHt8ABPYqDtXCmyAAJ8BUjAo/hjQXEqTZvv2X5lUmGzB4rS62
         tEYTHWhj4uAJCcg9Smi9Lb9Pxe9j/sIy7soWBBkF/m4BjpI9xAKUPFV4dWv3CnBbt73M
         zY7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si4822798edf.398.2019.09.19.02.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 02:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAsbl-0005zn-W6
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 05:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAsZN-0003Ts-C3
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 05:17:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAsZM-0007JH-BT
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 05:17:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAsZM-0007Ix-5u; Thu, 19 Sep 2019 05:17:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8392310C030B;
 Thu, 19 Sep 2019 09:17:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89A7F5C207;
 Thu, 19 Sep 2019 09:17:21 +0000 (UTC)
Date: Thu, 19 Sep 2019 11:17:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190919091720.GB10163@localhost.localdomain>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 19 Sep 2019 09:17:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] error: auto propagated local_err
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, mst@redhat.com,
 codyprime@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 armbru@redhat.com, kraxel@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, david@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, marcandre.lureau@redhat.com,
 rth@twiddle.net, farman@linux.ibm.com, groug@kaod.org, dgilbert@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, stefanha@redhat.com,
 jsnow@redhat.com, david@gibson.dropbear.id.au,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berrange@redhat.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org, sundeep.lkml@gmail.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uuIfjTMILH9T

Am 18.09.2019 um 19:10 hat Eric Blake geschrieben:
> On 9/18/19 8:02 AM, Vladimir Sementsov-Ogievskiy wrote:
> > + */
> > +#define MAKE_ERRP_SAFE(errp) \
> > +g_auto(ErrorPropagationStruct) (__auto_errp_prop) = {.errp = (errp)}; \
> > +if ((errp) == NULL || *(errp) == error_abort || *(errp) == error_fatal) { \
> > +    (errp) = &__auto_errp_prop.local_err; \
> > +}
> 
> Not written to take a trailing semicolon in the caller.
> 
> You could even set __auto_errp_prop unconditionally rather than trying
> to reuse incoming errp (the difference being that error_propagate() gets
> called more frequently).

I think this difference is actually a problem.

When debugging things, I hate error_propagate(). It means that the Error
(specifically its fields src/func/line) points to the outermost
error_propagate() rather than the place where the error really happened.
It also makes error_abort completely useless because at the point where
the process gets aborted, the interesting information is already lost.

So I'd really like to restrict the use of error_propagate() to places
where it's absolutely necessary. Unless, of course, you can fix these
practical problems that error_propagate() causes for debugging.

In fact, in the context of Greg's series, I think we really only need to
support hints for error_fatal, which are cases that users are supposed
to see. We should exclude error_abort in MAKE_ERRP_SAFE() because these
are things that are never supposed to happen. A good stack trace is more
important there than adding a hint to the message.

Kevin
