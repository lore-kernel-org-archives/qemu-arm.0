Received: by 10.25.208.211 with SMTP id h202csp232273lfg;
        Wed, 17 Feb 2016 11:59:45 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr4316097qka.96.1455739185019;
        Wed, 17 Feb 2016 11:59:45 -0800 (PST)
Return-Path: <alex.williamson@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v16si2860389qhb.56.2016.02.17.11.59.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2016 11:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain of alex.williamson@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alex.williamson@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=alex.williamson@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 73CE51831;
	Wed, 17 Feb 2016 19:59:43 +0000 (UTC)
Received: from t450s.home (ovpn-113-215.phx2.redhat.com [10.3.113.215])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u1HJxeLg015198;
	Wed, 17 Feb 2016 14:59:40 -0500
Date: Wed, 17 Feb 2016 12:59:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@linaro.org>, eric.auger@st.com,
        QEMU Developers
 <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        David Gibson
 <david@gibson.dropbear.id.au>,
        Christoffer Dall
 <christoffer.dall@linaro.org>,
        Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>,
        Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Peter Crosthwaite
 <crosthwaitepeter@gmail.com>,
        Patch Tracking <patches@linaro.org>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Baptiste Reynal
 <b.reynal@virtualopensystems.com>,
        thomas.lendacky@amd.com
Subject: Re: [PATCH v6 0/8] AMD XGBE KVM platform passthrough
Message-ID: <20160217125939.6df646dc@t450s.home>
In-Reply-To: <CAFEAcA9UM_XQsd9nnZMnP3nxPwjf6PvW5KB5GdeJK+a29T0f2A@mail.gmail.com>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
	<CAFEAcA9UM_XQsd9nnZMnP3nxPwjf6PvW5KB5GdeJK+a29T0f2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-TUID: 5fnrhFBizQ9X

On Tue, 16 Feb 2016 18:40:47 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> > This series allows to set up AMD XGBE passthrough. This was tested on AMD
> > Seattle.
> >
> > The first upstreamed device supporting KVM platform passthrough was the
> > Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
> > much more complex device tree node.
> >
> > - First There are 2 device tree node formats:
> > one where XGBE and PHY are described in separate nodes and another one
> > that combines both description in a single node (only supported by 4.2
> > onwards kernels). Only the combined description is supported for passthrough,
> > meaning the host must be >= 4.2 and must feature a device tree with a combined
> > description. The guest will also be exposed with a combined description,
> > meaning only >= 4.2 guest are supported. It is not planned to support
> > separate node representation since assignment of the PHY is less
> > straigtforward.
> >
> > - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
> > The code checks those clocks are fixed to make sure they cannot be
> > switched off at some point after the native driver gets unbound.
> >
> > - there are many property values to populate on guest side. Most of them
> > cannot be hardcoded. That series implements host device tree blob extraction
> > from the host /proc/device-tree (inspired from dtc implementation)
> > and retrieve host property values to populate guest dtb.
> >
> > - the case where the host uses ACPI is not yet covered since there is
> >   no usable ACPI description for this HW yet.
> >
> > The patches can be found at
> > https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v6
> >
> > Previous versions can be found at
> > https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v<n>  
> 
> I think you have review on everything in this series now, but I'm assuming
> this is going to go via the vfio tree (or at any rate not via target-arm).
> Let me know if that's wrong.

The little bit of vfio here looks ok to me too.  Eric, this doesn't
apply cleanly, could you please rebase and incorporate all the acks and
reviews and I'll send a pull request with it?  Thanks,

Alex
