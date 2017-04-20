Received: by 10.25.0.144 with SMTP id 138csp7072lfa;
        Thu, 20 Apr 2017 15:56:11 -0700 (PDT)
X-Received: by 10.84.218.14 with SMTP id q14mr12355199pli.80.1492728970931;
        Thu, 20 Apr 2017 15:56:10 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r81si7877814pfk.4.2017.04.20.15.56.10;
        Thu, 20 Apr 2017 15:56:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1031208AbdDTW4J (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 18:56:09 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35576 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S970136AbdDTW4H (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 18:56:07 -0400
Received: by mail-oi0-f67.google.com with SMTP id m34so5282147oik.2
        for <kvm@vger.kernel.org>; Thu, 20 Apr 2017 15:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=n6FDnmICsDWgaWEoQJRXnA+vUQddmW47gbaVqMo1dlY=;
        b=Nwxaqx4o1g+iG6q70eORKF5GgyoU+GvxoBu7Q6NvFQFSODNxaiwsthjNK89nWYmcHd
         xTdCwfjfivwuKUZb8U/1BA8S9O+DR0HYGKfKAX/9nraU2jJnHHsROzYLwqJa1sFgwON2
         FEeGkWiY3lXvHSDiBLTk8p7+QhjJv9abPE/iFFhL1OOE9qnCrjqP8xPrdJtCdgVZ2k2h
         GMSazEOqP+oB1ntu0qwNiUA6XeluQ3/vVqYHz/bv5dm/IkP9riSkPOD+ZRyc3YyM9aqD
         NCEWBVvbwVDfgXsqoVrWa5F8VQXxa/rcjdaOQXAg1LxIQgxfaJ6qxocG5oP7O5rdHi/L
         1t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=n6FDnmICsDWgaWEoQJRXnA+vUQddmW47gbaVqMo1dlY=;
        b=LfMaxi7QsUve76o/6jJxb9iAuxHIu/MZYBCZclQJBwWap77GIEVrRQ/B4joBBvWO3W
         ZvZvqYqWXBR8Q+sHlFvenNfpGC2Yl/JRF9L13KaenAWIqRpCZEk2MA8VRnej+n6qG7+u
         9ahbIhxKOGbl5n2qoIQMurMbU5sIFO7Rh3xhaJ889cfK6sGMO9Jea5keowh70pjmPeNG
         fw4wF4G5lxech26np0g1FpnOo0H/XGPJK4qGs7GZu50XriOuc9BhUAL3mkII6psOsj7S
         qZ5eeq/XQ+xvc92NsaL7XhicPMPZvx1DsjvfEIuxG9xaBs1i2OjHL9JSo0Gc2Zl1Q8VC
         lJMA==
X-Gm-Message-State: AN3rC/54GktU/B6XtiBL5hdDW259MD0tOtAzV2zhVGPondyol9+ryssV
        qUnsBmY2NfFmLS4En1fSHBJYCxj6Aw==
X-Received: by 10.157.47.69 with SMTP id h63mr6442015otb.89.1492728966259;
 Thu, 20 Apr 2017 15:56:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.44.229 with HTTP; Thu, 20 Apr 2017 15:55:35 -0700 (PDT)
In-Reply-To: <53bc367e-df07-be34-25c5-dbf0b3ee174e@redhat.com>
References: <20170419222258.13415-1-eblake@redhat.com> <87k26fffxa.fsf@dusky.pond.sub.org>
 <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com> <87lgqv833h.fsf@dusky.pond.sub.org>
 <53bc367e-df07-be34-25c5-dbf0b3ee174e@redhat.com>
From:   Alistair Francis <alistair.francis@xilinx.com>
Date:   Thu, 20 Apr 2017 15:55:35 -0700
X-Google-Sender-Auth: tV58tQNCCIRRa4jK32DZbmbyNBY
Message-ID: <CAKmqyKNftan_4zYRsNyOPG-PkM+iYKDxUC5_950pZyfrYSK3Qg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     Eric Blake <eblake@redhat.com>
Cc:     Markus Armbruster <armbru@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
        Scott Wood <scottwood@freescale.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexander Graf <agraf@suse.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Richard Henderson <rth@twiddle.net>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair.francis@xilinx.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DVwjOAqy8QS3

On Thu, Apr 20, 2017 at 12:05 PM, Eric Blake <eblake@redhat.com> wrote:
> On 04/20/2017 11:18 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>
>>> On 04/20/2017 06:59 AM, Markus Armbruster wrote:
>>>
>>>>
>>>> No objection to Alistair's idea to turn this into an enumeration.
>>>
>>> Question - should the enum be more than just 'guest' and 'host'?  For
>>> example, my patch proves that we have a lot of places that handle
>>> complimentary machine commands to reset and shutdown, and that whether
>>> 'reset' triggers a reset (and the guest keeps running as if rebooted) or
>>> a shutdown is then based on the command-line arguments given to qemu.
>>> So having the enum differentiate between 'guest-reset' and
>>> 'guest-shutdown' would be a possibility, if we want the enum to have
>>> additional states.
>>
>> I don't know.  What I do know is that we better get the enum right:
>> while adding members is backwards-compatible, changing the member sent
>> for a specific trigger is not.  If we want to reserve the option to do
>> that anyway, we need suitable documentation.
>
> Or even this idea:
>
> { 'enum': 'ShutdownCause', 'data': [ 'shutdown', 'reset', 'panic' ] }
> { 'event': 'SHUTDOWN',
>   'data': { 'guest': 'bool', '*cause': 'ShutdownCause' } }
>
> where the enum can grow as we come up with ever more reasons worth
> exposing (maybe even 'qmp', 'gui' and 'interrupt' are reasonable causes
> for a host shutdown).  Our promise would be that 'guest' never changes
> for an existing shutdown reason, but that 'cause' may become more
> refined over time if someone expresses a need for having the distinction.
>
> Thoughts?

I'm not a fan of the 'guest' bool. I do see that it helps with
maintaining backwards compatibility but I think we would be better off
just getting the reasons right in the first place.

What about something that can grow in the future? We start with a
general guest shutdown that is always there and then as we add new
reasons things can be moved to use the new method or continue to use
the general one.

SHUTDOWN_HOST
SHUTDOWN_HOST_GUI
/* This is always a backwards compatible fall-back
 * Maybe this could be SHUTDOWN_GUEST_UNKNOWN instead?
 */
SHUTDOWN_GUEST_GENERAL
SHUTDOWN_GUEST_HALT
SHUTDOWN_GUEST_RESET
...

That way we can guarantee the base coverage but still expand more
specific reasons in the future.

I guess the only problem is that then the reasons aren't always
reliable then as we could introduce a new reason and something gets
stuck using the general fall back.

Thanks,

Alistair

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
