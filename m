Received: by 10.25.208.211 with SMTP id h202csp850558lfg;
        Thu, 10 Mar 2016 22:57:45 -0800 (PST)
X-Received: by 10.66.192.195 with SMTP id hi3mr11675795pac.149.1457679465334;
        Thu, 10 Mar 2016 22:57:45 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w9si11748300pfi.224.2016.03.10.22.57.45;
        Thu, 10 Mar 2016 22:57:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S932086AbcCKG5n (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 01:57:43 -0500
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33134 "EHLO
	mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932279AbcCKG5m (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 01:57:42 -0500
Received: by mail-qk0-f194.google.com with SMTP id q184so3396079qkb.0
        for <kvm@vger.kernel.org>; Thu, 10 Mar 2016 22:57:41 -0800 (PST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=mW3QsWcb5yC+GBrDDrd2/kgF+/QGAXzCsElxQjzzR74=;
        b=A5U60cBlCtf0/2oBVZRX+bflAz/8D9Uz9+M5hPBNbxBhJ+Q7v669hLVenWbzQ56+q0
         9oyohbkdS6EEz6WdOS4UnJ9Pikk0N5SNg+lQqV1+PpqAu1RmuCwMNzsnlEZ4Qry8P+s4
         LjUh697Bjl26i1fQA4MXFro+oRyaUlQCBx3uK3GzUlT/wSygstCYw1p0R+AbBcHqSYJf
         tf4dMy2ICl+AItsve+y5mFlWcSjWOjzyIWwUfchqkJJWwqE2FfFzftT4HzvCqqFBLIB1
         mB3P9DyUa9u1zuYFzlohIVU4a00dZFISt5S4GCmXwqVb5T9lYAJL9IWBUM2BC6Eqh+0i
         ZRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc;
        bh=mW3QsWcb5yC+GBrDDrd2/kgF+/QGAXzCsElxQjzzR74=;
        b=MVgQmAEDdvWcBaTfvv4Mkw9uuS/KTb7r2aHJmGuCr+diKyj+EIm4dc4iYpgTu2LMGq
         b20iY86Q098lglqx+XVi8yzw53Jt/Q5ADxhce0tWcBgFWD+EeGNBSJW2kfhj9p5WXXvs
         A/IDkWulKxNmMOUBIwyHkfQ35qCl3cBEa9HBu9Wn20gwIB28CbOynHtTkPMcfe0CoYPM
         1/v6CmGjBSNdyQyLh/yQ5vMM8BE8w8aL9EQ48ouL1xs7ZJKEed4UlvWhwSZPn4IfU5un
         EsDdabcxRCEXuT1jXYhHbQqyA4dAgVRNz+pggAqRXAbVAevYIcEWMUr7gaTuVLF3Fe2l
         PXyA==
X-Gm-Message-State: AD7BkJIXeO0d2omxJvlJu5Tn9HDW2J5bdxK9In9UGeuzI5WCP+buuIB/JcYQFgCmPDcSxIBRJ5mbRH9OxCVfGg==
MIME-Version: 1.0
X-Received: by 10.55.71.146 with SMTP id u140mr9383523qka.14.1457679461081;
 Thu, 10 Mar 2016 22:57:41 -0800 (PST)
Received: by 10.140.17.170 with HTTP; Thu, 10 Mar 2016 22:57:41 -0800 (PST)
In-Reply-To: <56E1E2DB.1020603@redhat.com>
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
	<56E1E2DB.1020603@redhat.com>
Date:	Fri, 11 Mar 2016 12:27:41 +0530
Message-ID: <CAFE_T+SHzULT1N14dp_hO=YAe0vhMd2eUK1gMwF1ecWtRGQTjQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] Replacing (and removing) get_ticks_per_sec()
 function with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
From:	rutuja shah <rutu.shah.26@gmail.com>
To:	Eric Blake <eblake@redhat.com>
Cc:	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	lcapitulino@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>, borntraeger@de.ibm.com,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com,
	cornelia.huck@de.ibm.com, jsnow@redhat.com, rth@twiddle.net,
	kwolf@redhat.com, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	armbru@redhat.com, blauwirbel@gmail.co, qemu-ppc@nongnu.org,
	imammedo@redhat.com
Content-Type: text/plain; charset=UTF-8
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: UcWEbIC3xYZ+

Thanks Eric. I will keep these points in mind while sending patches.
Regards
Rutuja Shah


On Fri, Mar 11, 2016 at 2:40 AM, Eric Blake <eblake@redhat.com> wrote:
> On 03/10/2016 12:30 PM, rutu.shah.26@gmail.com wrote:
>> From: Rutuja Shah <rutu.shah.26@gmail.com>
>>
>
> Your commit message body was botched, cramming everything into the
> subject line.  Be sure you have a one-line summary (preferably shorter
> than 60 characters), then a blank line, before the rest of your
> description and S-o-b.  Also, it's good to say "why" in the commit body,
> not just "what".  Something like:
>
> maint: Drop unused get_ticks_per_sec()
>
> Replace the use of get_ticks_per_sec() with NANOSECONDS_PER_SECOND,
> because...
>
> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>
