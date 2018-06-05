Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp941186wrq;
        Tue, 5 Jun 2018 06:25:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJQIGbW8Kf6ONu2TAZHp7BDaIzxl7+iWh/pzLcoZNkw+U2E86g4DfcNzsvhx+CIz1AsktV9
X-Received: by 2002:a0c:f4c5:: with SMTP id o5-v6mr23979212qvm.123.1528205108641;
        Tue, 05 Jun 2018 06:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528205108; cv=none;
        d=google.com; s=arc-20160816;
        b=f4mApalpz3Mu3MT7WiYgaepyRjHa1Q6LGVWz97KDdQRrO+PYNa6keIy08Crk15Rqd+
         X9wEoi5djXoGZ2T72RDTNy6hRxukcp+UxD5eq9huMYnGE4qkcIMaQwV2pt8sO1KBdRWT
         GzZuKC9XUitGw//KicwKWwBPRaFCnx0cb50FG3AxGNl4hrixPJDD5YfejzrhUir1Cqfz
         Loh8fH/tLGbpwYvsVtpuh+HbhjdFTIi7w6qDSH/3vMPa+PgWIvO0oeAY6GDXjoenOnns
         g3B2qsoyF/c5QBg3k4k+2WHQCls74mjXoBz8P4kmM00KSjEBH/CkRnHWf3c8XFCEuprP
         7/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=z6Iw/UZa45bw0H4RVVOwSEYTt7iFRM/o2akkJ3HEiPw=;
        b=bd9JdN+yoJvF+tiIr65rMIVketIatFotuHJUKaCgPGmxeUYzCe3VXOx949sWf7Cd0d
         NI0A1UDpThMYvGWbL8kqJcfxwRF6unC4UFujlwNtCpCOYHf4WqJ3wwtlpoI489zdOC1p
         +t6GkFy3WSmxYYSB5i1N4Oket2HBbMwUS29Q2nNmz4DLKncR7MZZIrpmIKvkXS8eGSMx
         O6/Ava6YfORyoVTI9TZC/MAdGfT9bNQBOaDBzxCHYOWeGcYP9dVB8wmOM/V9N7dDi5W1
         7YQvrrrlzZkei0iGS11vUrD5TyBNdT2Y82XC1f0N2FfMN1fvRff/xUmvOJjg+sXTZxW1
         wotg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id u1-v6si26821114qvg.40.2018.06.05.06.25.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jun 2018 06:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AD9D40BC070;
	Tue,  5 Jun 2018 13:25:08 +0000 (UTC)
Received: from xz-mi (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9AE2026988;
	Tue,  5 Jun 2018 13:25:04 +0000 (UTC)
Date: Tue, 5 Jun 2018 21:25:01 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 00/13] iommu: support txattrs, support TCG execution,
 implement TZ MPC
Message-ID: <20180605132501.GH9216@xz-mi>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180605073937.GD9216@xz-mi>
 <CAFEAcA-=WtB8bCM2Q=CATM9YBM7whRf5uK1fLhaJH_mfkip1uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=WtB8bCM2Q=CATM9YBM7whRf5uK1fLhaJH_mfkip1uw@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 05 Jun 2018 13:25:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 05 Jun 2018 13:25:08 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-TUID: K2oQwaEvP9J/

On Tue, Jun 05, 2018 at 10:13:12AM +0100, Peter Maydell wrote:
> On 5 June 2018 at 08:39, Peter Xu <peterx@redhat.com> wrote:
> > On Mon, Jun 04, 2018 at 04:29:28PM +0100, Peter Maydell wrote:
> >> Hi; this is v2 of my iommu patchset, which does:
> >>  * support IOMMUs that are aware of memory transaction attributes and
> >>    may generate different translations for different attributes
> >>  * support TCG execution out of memory which is behind an IOMMU
> >>  * implement the Arm TrustZone Memory Protection Controller
> >>    (which needs both the above features in the IOMMU core code)
> >>  * use the MPC in the mps2-an505 board
> 
> > It seems that this series is still using the IOMMU index way.  In case
> > I missed anything... Could you elaborate a bit on why this IOMMU index
> > solution is preferred comparing to the way to pass in MemTxAttrs?  Or
> > was there any further discussion I missed on the topic?
> >
> > My last post to previous series is here:
> >
> > https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05702.html
> >
> > In that, I was still confused on why we couldn't use the existing
> > MemTxAttrs directly instead of the new IOMMU index (and I explained on
> > why that was prefered at least to me). I didn't see replies
> > afterwards.
> 
> Broadly speaking I didn't think I had any further better
> explanation than I'd already given in that thread, eg here:
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05250.html
> and here:
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05513.html
> 
> If you want to make a specific (detailed) counterproposal of a
> different API, I'm happy to look at whether that works for
> the use cases I care about and whether it's a nicer way to do it.

I posted a few pesudo code (ok, it can actually compile...) to show
what I meant.  Please have a look there:

  [RFC 0/3] memory: enhance IOMMU notifier to support USER bit

I very suspect I missed some important requirement there but I cannot
really figure it out myself.  Hope these patches can either provide an
alternative solution on the problem, or help me to figure out what I
missed.   Thanks,

-- 
Peter Xu
