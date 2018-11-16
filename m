Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp593826wrw;
        Fri, 16 Nov 2018 08:35:17 -0800 (PST)
X-Google-Smtp-Source: AJdET5edese48Xz+SWF4oN4BTdXF8E7WCwXJLil/xmNFVLLD6BhBPnNTBj56Q4mkSxeIWFJJiUmN
X-Received: by 2002:a37:2ec4:: with SMTP id u187mr10875577qkh.304.1542386117718;
        Fri, 16 Nov 2018 08:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542386117; cv=none;
        d=google.com; s=arc-20160816;
        b=SieOZSkLe2cJJTvWA/q3FenEcmHzry6ERd1TiDMR3OETfiZdwkCAR7BOxmNFV5z+rN
         b3yknd/Qa9Td5kZggd3HHQKTD+vUssYsIxaKNTpK6AfhX1y5ZkRJmXCyo4x9gYZ4lxTC
         +W1H1JZksUeolhnsVVCedDUKUzYaeOivwmX8GIm74sNXnd0fsyV9OZt2X5D9zqZbOMBO
         8pn1szgFd+D8dxk7JhhSsanmZ7eOcqzqJExJrWz+Qp/oGoGt9fxp1pabsqwioYylSQJ/
         w612xZs+J3YCSaApVhCg86CGSrT+WUv+CSStSoq2z4xbxge/4sB8KSHPJUte32X1kDAX
         +hWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=f3GYfknZX4bh5qul4GYE+kOQjV71IfVpVuFqzpdAeQI=;
        b=H9bZONkekHJUqnBi6TP/xsNdJWyZD0N+2PpE6Vc1aIgiQORTfdhBeT6bxwy5VmM2N1
         uL2ycmp3CTD19j63R51TVyWMDr/rot41gETbexNByEe69vLbW8+CRgLmc3RzUpgJSdPW
         WUkqIS4ySaWbniZZG31oTFBJF/a50RRLyW4pk5QcUKrHxqGfO3Dfg8yrk8BryZAJiO3h
         BRCr+Wx2psUkBA7eEn15gy82vO62azPsCiGkf4M2UHPbhLp33Z5UVAhIxYyAg93bdEBE
         ac2K8wYDG9GPJMDdq7JI0HAwIlA1Vax5cN1tWLS0CNy3yXNAtmubdKjGuxGjo9f8CJGk
         1U+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si86462qtl.386.2018.11.16.08.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNh5R-0004Be-3m
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:35:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gNh59-00049n-SH
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gNh59-0006g7-1t
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:34:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gNh58-0006f7-RT; Fri, 16 Nov 2018 11:34:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 526EA88E50;
	Fri, 16 Nov 2018 16:34:57 +0000 (UTC)
Received: from work-vm (ovpn-116-120.ams2.redhat.com [10.36.116.120])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331565D6B3;
	Fri, 16 Nov 2018 16:34:52 +0000 (UTC)
Date: Fri, 16 Nov 2018 16:34:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181116163449.GE2447@work-vm>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-2-aaron@os.amperecomputing.com>
	<CAFEAcA_M=KfiFdtVbyuiFPfAh1r+p=vQT+CHBpRNdiqPBxN_4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_M=KfiFdtVbyuiFPfAh1r+p=vQT+CHBpRNdiqPBxN_4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 16 Nov 2018 16:34:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 01/12] migration: Add post_save function
 to VMStateDescription
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4e0F8DR7ClUO

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
> > In some cases it may be helpful to modify state before saving it for
> > migration, and then modify the state back after it has been saved. The
> > existing pre_save function provides half of this functionality. This
> > patch adds a post_save function to provide the second half.
> >
> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> David: do you want to provide a reviewed-by/acked-by for
> the migration vmstate API change ?

Yep, it's much more symmetric now:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
