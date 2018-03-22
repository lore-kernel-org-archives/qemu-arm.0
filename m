Received: by 10.28.71.155 with SMTP id m27csp611412wmi;
        Thu, 22 Mar 2018 10:20:53 -0700 (PDT)
X-Google-Smtp-Source: AG47ELut2ymEBsIHUTburNdaXpsiC69sUD/IEalelZQXdecjXDM3sv7IkS2SyKrfEOpVaZL3nN79
X-Received: by 10.55.109.196 with SMTP id i187mr34806170qkc.29.1521739252958;
        Thu, 22 Mar 2018 10:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521739252; cv=none;
        d=google.com; s=arc-20160816;
        b=R01ilQEC+kROnkpZnrt0MIbAJUHD/YpFti96Xcds/t1IQ7HcxT86ih2/pWYRPubi7l
         3yKbv6z7fv0BF6f0iEzcVslKnG3HC0PNoF8EfbHewh/gIyTeUF8Fq8OwOi4+kWgPJIfB
         6ykcYpgcRzxusl0M3nWv1RofwzUCUcaU3VnFsvT5R6CvsGlvvYmV0BJjZnSEmdI+exR/
         6CrpawdnSKE1ds+vJeXwa9N81yoQngcaHNzsvzDD2/EMFXWaMGvkBypAn+rxBemJdYlf
         PiFCYvwtTAML0XYvqVeyRPu0DIxVt2xiDsM2mmc+fVvaR545uBlHZ38T08OiMAOPsxKp
         hJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tYFNc2IdbpPczobcXpxuEROiVrlVgFUt/OuHCwUxt7Y=;
        b=Hko7YbbPSyvqkJgFDmY1VTN/wm+YYuo+ae2XhyCs4+O3xlPP5ml3JY3ZDAxoP1t7sG
         OQifM9szM72uhPYlXhEWw65LvDAvvL2TW9gBqKkjEru2asVK6BijKVu84NlmDJ4eiPcw
         lyBokrmi+dXxZF1vlYoluSP86O4CZStupKJzJQ0a1oBqt6tb2wLtcs1N5ySuWApW+uiJ
         bX16zCTxhgW5rTxR2N9emBF31TEHYDyjRG7BF3e7nLtO+XuT5eJ1P3sheZjupj529Pxw
         wAUcNoEBriMwqKob+LL/7LwifPYl748cMhUPNknZFBZmG9JBhPZNaiAC7e/kppp143+7
         FHQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V7e7civx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si3857954qty.135.2018.03.22.10.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V7e7civx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez3tU-0007GO-Fj
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:20:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3sC-0006ZU-50
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3sB-00014l-8F
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:19:32 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:43016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3sB-00014a-1r; Thu, 22 Mar 2018 13:19:31 -0400
Received: by mail-yb0-x244.google.com with SMTP id z5-v6so3188793ybo.10;
	Thu, 22 Mar 2018 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tYFNc2IdbpPczobcXpxuEROiVrlVgFUt/OuHCwUxt7Y=;
	b=V7e7civxvLzW0ns9+15DyaOotH/WHqWFI9YTVvIrvFDrNn5UvINT3+Wn2cF+g/UPEh
	xYGjnZzQUzmJVrxpmBMIrbDjY2sODVNI0Xl8bCH5Tnd+3ZugH0Of7xXhpe1Gr6eyV4jD
	CDa3RzMWG8TcjFr9866YSkY1m/s3hXZnQunPzvGhoyxDJjX2xip3GXCOt1iQjrx5V49a
	cw3vkeSgAn+gczWIAkcACrb8/QdpMomrXRR2glkSQDTSeQR+7tBLf8HUZQHJlNXrJLoq
	jzntIRDw9pnChjk6ntNE65H7d0fAav3zFNXk4d0skv7/VA9FvuG29NYqPN0dSV2JNoHt
	zkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tYFNc2IdbpPczobcXpxuEROiVrlVgFUt/OuHCwUxt7Y=;
	b=egBMuIT22gAGV49E+AX9WKGhAco3W8OGaT+a5VUR2k9ktGL27Ti5x2IZwEQNnunuZw
	bvVG6AL0p+Wr4VWS695mJB+yC48QdbfwlMDSoxP2jtcLtyQQAfNgV5Hlyf+hRHFo9/4P
	z2p4/CWrL1a1jb1fGxnBXaiOZ7rBRRAe8eQWCL6J82Ue/D2AKby5Y5+uaU9EgWqHwxE1
	pkXC69zyjT3o/FdGaGBQiNjAErngqdgYSDM/pDGI7eKbdZ8aPR+h6Oqzyb41fpsS5LOR
	Ud/m9kQM0Vjb4B3OxuVlgm1uedH3cxpYfIh7oAh0P5Ps5ToIuKOfWxYpxp8SmvDmne9X
	qKiQ==
X-Gm-Message-State: AElRT7FtRRTebq4nPFkXdH6mLeBFUpwXOeKsm5S7uvr7nZ0o8yEUgdJo
	VlUl5V3TbWPU8jx+LZlNnU/0b+YToyreJ7FdGy8=
X-Received: by 2002:a25:9988:: with SMTP id
	p8-v6mr15106630ybo.239.1521739170316; 
	Thu, 22 Mar 2018 10:19:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:b047:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:19:29
	-0700 (PDT)
In-Reply-To: <6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 10:19:29 -0700
Message-ID: <CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-devel] [PATCH 4/4] Remove unnecessary variables for
 function return value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24UzWFaF1kn6

On Thu, Mar 22, 2018 at 9:58 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> On 22/03/2018 17:51, Max Filippov wrote:
>> On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
>>> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>>>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>>>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>>>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>>>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
>>
>> These files were autogenerated, fixing them doesn't make much sense.
>
> Good to know. They have been already updated by a couple of patches:
>
> 8f0a3716e4 Clean up includes
> d8e39b7062 Use #include "..." for our own headers, <...> for others
>
> Perhaps import_core.sh can be updated?

Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
"xtensa-isa.h".
Adding #include "qemu/osdep.h" there seems pointless to me.

-- 
Thanks.
-- Max
