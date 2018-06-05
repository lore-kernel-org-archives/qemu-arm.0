Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp613619wrq;
        Tue, 5 Jun 2018 00:39:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKILF/dIQ88Y9b+7gL+A8fH2sVI5VHztucjCPUYzbuRxhCJNgZgYgREdfgamXxTz1wH4Ze0q
X-Received: by 2002:ac8:2b4e:: with SMTP id 14-v6mr18034515qtv.412.1528184384864;
        Tue, 05 Jun 2018 00:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528184384; cv=none;
        d=google.com; s=arc-20160816;
        b=kxMPuaLIJrnZpwJ1wH3ujKABhwEYiGjjeIqiHAO8n680ynb1lJbTzW/9XkSQTVBQFo
         274ucxjCL7Z2Djtmmr+C0W78+JdCYQmLz73cyppFwhNAWSEPmPSm+vFNRhkAjaYUF9a8
         SpDxaf1vsCEeJQF5aTktXYZ6thz0HNj2khDul6PHi3wck3Evjg1/VR+YsjBFEsxm56Jt
         sKUgGr6/weDibLy0tyjEPfTuqK4vyG+A0Gyx3p0xt3PqMUoHJqUPbHGDzWMIAUm9J26O
         s5LSJhe+xmSsq3QsyiJD31dQOOUlBGVQl8PhuojesHIQHQM21ykUV4c2h99ZGlVvAejZ
         8HBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=+h+l7TV7koXAz8PwSc0p/KheTlSQHFJrZteT9gFFuDk=;
        b=jfQMXiZwwO3JTY4+Zlt8gfVch9xmJ3O53KXPBH/N1emHPz9Qym5GIk/joZYtvCy2CS
         K8RmRc9kvjmpadmdzf67t48sW1wI9YkNNP7NRA4wTERcrtS0XMg/pTgLyWrVpDQdVGCp
         JpWws0qqpmY/+efx+IgxwepDoALrMMDL9b9CB5lKzFCHVXEUzC25+K+BH1gwvmduCUgJ
         EUiR58Pgx2Q5cVmU3o+TD7EbRXbiFZhE6wd8ooaZUeCEkmzWSMzCL1rY8tVrwUuuLjIN
         d8Vl5SF1IuMyq+tPiyT1aFSW4DGdhPgFIJRjcUMxz4U4vY1kQ45Gks16gSc5o8Xl1E4m
         zQLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <peterx@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id e81-v6si1137758qkh.154.2018.06.05.00.39.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jun 2018 00:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peterx@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=peterx@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E19F401EF07;
	Tue,  5 Jun 2018 07:39:44 +0000 (UTC)
Received: from xz-mi (dhcp-14-151.nay.redhat.com [10.66.14.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B4E20357CA;
	Tue,  5 Jun 2018 07:39:40 +0000 (UTC)
Date: Tue, 5 Jun 2018 15:39:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 00/13] iommu: support txattrs, support TCG execution,
 implement TZ MPC
Message-ID: <20180605073937.GD9216@xz-mi>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 05 Jun 2018 07:39:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 05 Jun 2018 07:39:44 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-TUID: 0lEgcfcRz0r2

On Mon, Jun 04, 2018 at 04:29:28PM +0100, Peter Maydell wrote:
> Hi; this is v2 of my iommu patchset, which does:
>  * support IOMMUs that are aware of memory transaction attributes and
>    may generate different translations for different attributes
>  * support TCG execution out of memory which is behind an IOMMU
>  * implement the Arm TrustZone Memory Protection Controller
>    (which needs both the above features in the IOMMU core code)
>  * use the MPC in the mps2-an505 board
> 
> Patches 1-3 add the support for memory-transaction-aware
> IOMMUs. The general approach is that we have the concept of an
> IOMMU index (similar to the TCG MMU index), which selects which of
> multiple possible translation tables in the IOMMU we're trying to use.
> Most IOMMUs will support just a single index. When you register an
> IOMMU notifier and when you call the translate method you have to
> specify which IOMMU index you want. There's a method for getting the
> index that applies for a particular set of transaction attributes.
> All the current IOMMU implementations have just one iommu index, and
> all the current users of the notify API assume that.

Hi, Peter,

It seems that this series is still using the IOMMU index way.  In case
I missed anything... Could you elaborate a bit on why this IOMMU index
solution is preferred comparing to the way to pass in MemTxAttrs?  Or
was there any further discussion I missed on the topic?

My last post to previous series is here:

https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05702.html

In that, I was still confused on why we couldn't use the existing
MemTxAttrs directly instead of the new IOMMU index (and I explained on
why that was prefered at least to me). I didn't see replies
afterwards.

Frankly speaking I fully trust the expertise of you and all the
reviewers.  I am just afraid I missed any context along the way.

Thanks,

-- 
Peter Xu
