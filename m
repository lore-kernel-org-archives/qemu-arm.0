Received: by 10.182.105.169 with SMTP id gn9csp1609845obb;
        Tue, 27 Oct 2015 03:53:28 -0700 (PDT)
X-Received: by 10.55.197.216 with SMTP id k85mr48188398qkl.77.1445943207990;
        Tue, 27 Oct 2015 03:53:27 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o103si4101117qko.28.2015.10.27.03.53.27
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 03:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 1B16CC0AF7A3;
	Tue, 27 Oct 2015 10:53:27 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-27.brq.redhat.com [10.40.204.27])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id t9RArMwO020538
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 27 Oct 2015 06:53:25 -0400
Date: Tue, 27 Oct 2015 11:53:22 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Peter Crosthwaite <crosthwaitepeter@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
Message-ID: <20151027105322.GA16832@hawk.localdomain>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-TUID: +GxqUsPxJuIm

On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
> Hi; it's been suggested to me that it would be helpful to have a
> qemu-arm mailing list, along the lines of the existing qemu-ppc
> and qemu-block lists. The idea would be to get people to cc the
> list with their ARM related patches, so it would mostly act as
> a way for people to filter their mail to separate the ARM stuff
> out from the qemu-devel firehose. (Everything should still be
> cc'd to qemu-devel as well.)
> 
> Any objections/opinions?

FWIW, I like the idea. Although

notmuch tag +qemu-arm -- tag:new \
                         and to:qemu-devel@nongnu.org \
                         and \( subject:arm or subject:aarch64 \)

also seems to work pretty well for me.

Thanks,
drew
