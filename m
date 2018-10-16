Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6006690wrt;
        Tue, 16 Oct 2018 07:41:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61IPxM/paYptGvLm7kGhhoSSG6YPAcwTUi/8RRLkr22oGMWQh7SHsFZcH1ey7usKTwlKcLD
X-Received: by 2002:aed:3bf9:: with SMTP id s54-v6mr20620167qte.207.1539700918875;
        Tue, 16 Oct 2018 07:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539700918; cv=none;
        d=google.com; s=arc-20160816;
        b=igR4wEPDBDnH9o5kI9eSKQ0w4aVOgXkWCKFvrhebC42wN4z8dQDok+JyEW+6A2dlfs
         3WKkNZLG+7mxkNjMtgEaE2TstPelsuPoO3/dvX0Ir2ILPA/DytBRsAi2NJj4VW44ncJU
         5pFmoUC6CkLYp3oKQu2svAKXPrkJYb1hls1CJ1B9fR0UHvD1CxPek80/sS0emihq4+WX
         VQvfCI/tFX4vOiKgMvwT11IY8JgOsZW8BzUAWNM9muZNL3HV2NAiJUmrlcUg/AAZ9dwC
         4b9rlMCU5HIgowntYAHVs9NDZgNtCnItp/+EZRtOXyNTAWZfgFGP2emk8iT3Pap0agWa
         M48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=1ZFAYVpcBXI9dprDMCYcQ6bLWMq9hASKU+Qzqurxhew=;
        b=fdyR67mBcwTFvBb3ZvE06OE1TFQQF/j+ux6emR4c3TYSVxnxH8qkgJS8pD1/A5EKFj
         lQnxjjo0tGUXGttdJodpGfwa7fnDLiYfLLZE2d9UjFl77WpCO2JOglqG5Ene2EwpxBbX
         b27V8R/lrIImZITqAPde5lyLgeFVo/3O4rS2i7WwoXaFfgFiwRaYdXkQPIj5aHz5LYEq
         m12IhJcCuB3RC6vv08xDs+GX1vwWPWUzBNVkpIexiVl6ma4iVNKgc49w71Myhq3A+UaQ
         8Q11WLTMg70gzjWOEjyMkMudY2Bb1NsAeJ0kRwmW98G/1SxO/GrHlDKOl/YtH5ghrq6x
         I0ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WrHCvk0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d188-v6si1465510qkc.57.2018.10.16.07.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 07:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WrHCvk0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCQXm-0006r5-3N
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 10:41:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCQXc-0006pm-4Z
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCQXb-0000kG-Bz
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:41:48 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:35753)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gCQXZ-0000eN-Nb; Tue, 16 Oct 2018 10:41:45 -0400
Received: by mail-qt1-x842.google.com with SMTP id d21-v6so13570713qtq.2;
	Tue, 16 Oct 2018 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1ZFAYVpcBXI9dprDMCYcQ6bLWMq9hASKU+Qzqurxhew=;
	b=WrHCvk0HEZd9o3Rr5h95uX8vqy2R9naeWqgogHux/qnoJozsPIHj9Z/HkQD6+bXamB
	+/ZeVoN5hizv+NFLbqG/cn7026HNJZLCR9IQnMDrXxZKnwqbC4InFdSHMw26sMTGWTUe
	sDWDNsqb/42dWfaUVnrnwgpyeTvr9KOaD2pIy+Er1dyXzHZwI9bXLWCpmK6kJ3/vnguL
	jmJsbKALAL+xaO4DxPdt2s59WwXbRKQG6meSVhOxkrS4EPEAsW7IAgZkXcBOVaf2NKua
	lRhtcO2jDUGCUWt1SX0jOcQ50bQjGDI+2mV3piI04x7ESzlPY62fRPWSeIeDWd2QRZG6
	LrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1ZFAYVpcBXI9dprDMCYcQ6bLWMq9hASKU+Qzqurxhew=;
	b=bo1ffqViTe+sEqwT2OV3fJg6fY3AQ8hYkNV4zPNi+IIpIzdaRLm86DxpjNafQjNDUR
	D+DW0f3RLJQPe1kZY6pi8J1/b5nBdYEqShd6yNz9GkJ8RQroXdh5TMZcRBVpJHoMbgwc
	k52n7x5iarp1wxWPbzvqwxFBRq9pavBW80opskSIuVCug2OqaCoi03oShlih5f+6y8qx
	xVKK1wVxq0k2QkS3E4oaFObsaNn/9AkMOvbQdF7Ot/GxxY/QRw43pQJiR6yYnQkyZ7c3
	psBgSOV5GmNkIt7Oflb9tt5TGfep41/ZT9O1Kbibd022taNuOlfThJP9Hk3jbhri4+g/
	qR9A==
X-Gm-Message-State: ABuFfoi5NQG4u4Ak7xfam/heM6azVnX0X7N97ujuDHycD4xsWzUu8NPQ
	EbuSvlkVJP7rf6oDUwKX3f0=
X-Received: by 2002:ac8:3a82:: with SMTP id
	x2-v6mr20943002qte.342.1539700905249; 
	Tue, 16 Oct 2018 07:41:45 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	y26-v6sm8566565qty.52.2018.10.16.07.41.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 07:41:44 -0700 (PDT)
Date: Tue, 16 Oct 2018 10:41:44 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20181016144143.GP3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-4-aclindsa@gmail.com>
	<3a964ae2-a5d0-5960-9e15-7ede929a8294@linaro.org>
	<20181016082117.GB2426@work-vm>
	<20181016135517.GO3671@okra.localdomain>
	<20181016140655.GI2426@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016140655.GI2426@work-vm>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 03/14] migration: Add
 post_save function to VMStateDescription
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, Juan Quintela <quintela@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee5mAf8aHp8Q

On Oct 16 15:06, Dr. David Alan Gilbert wrote:
> I did wonder about suggesting that you pass the return value from the
> save operation as a parameter to post_save.

I feel like having that information in post_save may be useful, though
I'm having trouble coming up with any concrete uses for it. But, let me
know if you decide that you prefer it and I can add that for the next
revision.

-Aaron
