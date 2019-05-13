Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2757347wrg;
        Mon, 13 May 2019 05:43:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaQ3XMh27IyXKP6PTq27djfz1GlVRGDKYh1LxIK/Ts8La+N0oKit5JDWAx/S9CwlKUYwKg
X-Received: by 2002:a37:e506:: with SMTP id e6mr14501129qkg.229.1557751409050;
        Mon, 13 May 2019 05:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557751409; cv=none;
        d=google.com; s=arc-20160816;
        b=cRjO21+PqbEoX6RteXFbneKicphmnRteDMvuXf4C7vbm9nmoejL6v4pwjqFnEYLrr1
         0NciYh4YrSeGaoK+Jm67B20nAMzSVMyvDCrW4GYBwmMaT7Twyf7Wjw3fo4smjNDqdl4x
         rKYlxUruM61kxOg0Gla/PCsgrVmHXqKh+6MP+YTl8egxx/y11JDoUPC2vayLNi5z1MEe
         JO03KZlWnuEht77BXlFhBDStwMXw15L9Mtbx5fvh0pJaE6hDMND0J/pqpHBLNfpV7+kT
         dWfmOi2X003XaHXraqW9gGLNdDb5JLHzN+1agd35w0VPq6AiOf0emY3cmuuySmmu7xHe
         d+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=jAe3A7t6yS3LKCWpVYkXcbXB65t+ylQiVSOfLi9Gj2Q=;
        b=0sLw+JtbOno90HTPL00CjPqFojWYScA05gc/l+bYqXbY0ZMeRmjVD9om//WyqnicYJ
         Qk4qFpcbf3IEJ9WIIZDhTQeOOvARwuubaYhTDBh4FT602RqSbQFOCQDd7i8YkLf3TGDB
         JirLaYtToLzyNnz5kEpYfHQflEAWEANjMEpOtpfPwWmySyKRfr+5xDnx7gtUC8tuwac8
         b5bUJJ/Ov+v0HSN2vBtWqx3SA8N4DtQXtRnT4x5OvJVjytFdAxpABVbWAraMb8Dm5uxA
         ehwTXFOVOiR64gJdacD7PyZ9kScnFvGKHt+3Mhgx5apt4By8xnuYmgB4UMbOb5LJF/uv
         04Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t5si4376245qvm.17.2019.05.13.05.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:43:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E784C05B038;
	Mon, 13 May 2019 12:43:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B142B1001E7D;
	Mon, 13 May 2019 12:43:23 +0000 (UTC)
Date: Mon, 13 May 2019 14:43:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513124320.2l2k4pwyhcxvdsba@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <CAFEAcA8vY7WVws3rOqKxsaNTDSboecOeS4DM5rdsEZHt4Lkv-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8vY7WVws3rOqKxsaNTDSboecOeS4DM5rdsEZHt4Lkv-A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 13 May 2019 12:43:28 +0000 (UTC)
X-TUID: c+JzDKq+7iPg

On Mon, May 13, 2019 at 10:52:06AM +0100, Peter Maydell wrote:
> On Sun, 12 May 2019 at 09:36, Andrew Jones <drjones@redhat.com> wrote:
> >
> > With the recent KVM guest SVE support pull request [1] KVM will be
> > ready for guests with SVE. This series provides the QEMU bits for
> > that enablement. The series starts with the bits needed for the KVM
> > SVE ioctls. Then it enables the arm 'max'cpu type, which with TCG
> > already supports SVE, to also support SVE when using KVM. Next
> > a new QMP query is added that allows users to ask which vector
> > lengths are supported by the host, allowing them to select a valid
> > set of vectors for the guest. In order to select those vectors a
> > new property 'sve-vls-map' is added to the 'max' cpu type, and then
> > also to the 'host' cpu type. The table below shows the resulting user
> > interfaces.
> >
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
> >
> > Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> > all supported when $VLS_MAP is zero, or when the vqs are selected
> > in $VLS_MAP.
> >
> > (2) is the same as (1) except KVM has the final say on what
> > vqs are valid.
> >
> > (3) doesn't accept sve-max-vq because a guest that uses this
> > property without sve-vls-map cannot be safely migrated.
> 
> Is this "migrated between two hosts with the same host CPU
> type but with different kernel versions which expose different
> subsets of the host's permitted vector lengths" ?
>

That's one example. Also, I see attempting to make/use only migrate-safe
cpu properties for our primary KVM cpu type ('host') as a step in the
right direction to eventually making a more migratable KVM cpu type. But
I do see that (3) is a bit of an oxymoron considering the 'host' cpu
type isn't really migrate-safe unless the hosts are identical (which
should technically require the same host kernel too) anyway.

Thanks,
drew
