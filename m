Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8362584wrx;
        Sat, 23 Feb 2019 13:53:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZI0DEaO8D++v1YX6VzBas6C2nxw8eccSzcIXiqvBGNp8efqazx+nstGZNbbOI+/rhgkV1L
X-Received: by 2002:a81:9193:: with SMTP id i141mr8502487ywg.94.1550958787681;
        Sat, 23 Feb 2019 13:53:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550958787; cv=none;
        d=google.com; s=arc-20160816;
        b=lLMoALx6l6xqKIrE05wDi23wyPzDp6pYhNkdtavayZZVpTA10mwKI7XCUsyLkVgbZk
         Q+JPlZfIJnbcpWcjMGi8BeWJXH9HZLzKAQK8Y22VD6RjHv6RYj2gWrgyDNAv4nN5Re11
         V97rMoH+GK4FBvp+5v4WhQGrqbstyLaMZ7J2kHO36TTnySdv0jP+1h2ESaflvTBuPQJf
         NiR1PzvwR39wwg9QIbEeq+UmrpjDx/H91tKJzg8Rqv2nY4KieiRnyRcIjwt8oHmUeDAC
         xU46knDMEvVlmPNbL7bJcXIfg50u/mxDEPcPcC6800Q7EItsTbzMXsp39g4dRR35jJUP
         g9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to;
        bh=sGO2P82ZZyIyL1Kfj7u67O7aHRGXvr4nOQfDPCWzD/0=;
        b=AlmDZ6u5QXHV8PoHPiFkoDZemxOEe8CTPeGixcrBeciiDtYJH0vdlN7mOGbR4zbjt5
         To84E1Nkk68UKsZvTVmvfPBH1KSPj1CkHm5rDzBDrGtNJOc8BPfWyMRUHgvI+0UtNJl7
         7YB/HLqDk1m/txpre+AjU+tEn5Gxyqj49zQzRbMfTXXA05tPBKYCSY/kxQ0yegTdzZX8
         8v9ItFNTWc2UErkAZ63PI1agUN6tQ66cpp5JAZZR76bZsKU+kFrXYC6X5YHOqBX6jsjb
         bBn2fEQcDAhWdha71eBkLk42yGIYr9LRyoqAdQ2wPYOCz8DgbJgLfIGINNxfiFaW1v4M
         Os3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si3156132ybj.495.2019.02.23.13.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 13:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxfEJ-0004Xs-7X
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 16:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gxfEB-0004Xl-Jl
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 16:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gxfE4-0007hM-3m
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 16:52:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gxfE0-0007W9-2Y; Sat, 23 Feb 2019 16:52:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 575903084298;
	Sat, 23 Feb 2019 21:52:41 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BBB601AD;
	Sat, 23 Feb 2019 21:52:40 +0000 (UTC)
To: michelheily@gmail.com, qemu-devel@nongnu.org
References: <1550878686-23934-1-git-send-email-michelheily@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ae330da4-ab5d-1376-f897-0d2e3d5870ce@redhat.com>
Date: Sat, 23 Feb 2019 15:52:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1550878686-23934-1-git-send-email-michelheily@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Sat, 23 Feb 2019 21:52:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/stellaris: Implement
 watchdog timer
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
	"open list:Stellaris" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0MS8d9ciLC6b

On 2/22/19 5:38 PM, michelheily@gmail.com wrote:
> From: Michel Heily <michelheily@gmail.com>
> 
> Signed-off-by: Michel Heily <michelheily@gmail.com>

This appears to be your first contribution to qemu. Welcome to the
community!

Your commit message doesn't give any details beyond the "what" in the
subject line. The body of the commit message should explain the "why"
(what bug are you fixing, how to reproduce it), so that a reviewer
stands a chance of determining if the code matches the description you
gave, and if the issue you describe really does warrant the inclusion of
your patch.  In particular, when implementing a particular piece of
hardware, giving a URL to the datasheet you used as your reference will
let reviewers check if your software appears to match what the actual
hardware would do.

For more patch submission hints, see:
https://wiki.qemu.org/Contribute/SubmitAPatch

I'm not an expert on this hardware, but will at least give a cursory
glance for style issues:

> +    case WDT_O_LOCK:
> +        return s->locked ? 1 : 0;
> +    case WDT_O_PeriphID4: /* fallthrough */
> +    case WDT_O_PeriphID5:

I don't think that particular /* fallthrough */ comment is needed. It
matters when you have a case with code, but not for consecutive case labels.


> +
> +static void wdtimer_write(void *opaque, hwaddr offset,
> +                       uint64_t value, unsigned size)

Alignment looks off.

> +{
> +    wdtimer_state *s = (wdtimer_state *)opaque;

This is C, where void* implicitly converts to other types; you don't
need the cast.


> @@ -1243,7 +1478,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>       * Stellaris LM3S6965 Microcontroller Data Sheet (rev I)
>       * http://www.ti.com/lit/ds/symlink/lm3s6965.pdf
>       *
> -     * 40000000 wdtimer (unimplemented)
> +     * 40000000 wdtimer

Okay, so there is a datasheet. But it may still help to mention it in
the commit message in addition to the comment already in the code.

>       * 40002000 i2c (unimplemented)
>       * 40004000 GPIO
>       * 40005000 GPIO
> @@ -1335,6 +1570,12 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>          }
>      }
>  
> +    if (board->dc1 & (1  << 3)) { /* watchdog present */

Spacing looks off.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
