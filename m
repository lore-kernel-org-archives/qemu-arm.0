Received: by 10.28.71.155 with SMTP id m27csp303986wmi;
        Fri, 23 Mar 2018 03:45:13 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtQM3Mf1sXqj0B+5dBdeLUyQBOS0eJ0vBEaQwwBG5GHrclj1dTWl30y8z46zhUdO+IGFj4S
X-Received: by 10.55.177.2 with SMTP id a2mr38374525qkf.352.1521801913082;
        Fri, 23 Mar 2018 03:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521801913; cv=none;
        d=google.com; s=arc-20160816;
        b=CzPhcgjriWjWthAe5ezu3rqWNms7+OMgbDHNJd+ECwnCtsVtp8/X2oCe0BE0PD1hIb
         CDsvlFBldh7b9henD+Oaj1ygAryoUj6VW3y4CsQQI9IQBsJUBVPNjkbi40hxp0hWbnR2
         0FJCLSCwI8hcEDzkZymaPhgFKNcSRLot28ihuc2ofAI2JyR+Et1VmzF1+pTqPC2KzhzN
         IL9bxMsoQzi9EWYF+yScn0orqpuscMpgLNp8T6gzBiS9kNeCTcLyGC/9NsSbPlGPHcb2
         p3/YuCYVqT9TTL1swwfLs9I24KmTq0G4HU7uR7cshoEyi1xD+6FDjoX2wXygiyvkq2lJ
         ioiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:user-agent:references:in-reply-to:to:from:dkim-signature
         :arc-authentication-results;
        bh=LpWFodY1TdUqeh2VefxDw9UoD9Azr1tnef9/sk+HkVQ=;
        b=wzEoHaY13V8XBwlkd3y2rYUrQz6hLfWf7sGtZ2i8YGChJchik8XWgQu0OdmTocep/W
         LFiNZHmU5V+RRdkTLYGJNvkqQ4ddzHyLELIcgnXexRilpj6CVZWB6yCz+Ze1kq2ZAHtJ
         h2JlPHQhJb7n99q8TV2jkzwrGSdcoNByHug2Cz+BsVJNOBq3QwqWhlfe7pIyQXJoF89H
         qFpauS3/OgE4umWCOjoK56qT0q+k3D2GVM+CY37rS9bJeN6ByrcjkA0Bv1u7zd15pifG
         OW/l+He/fTESMNuJYwMzD+cvczMg63BPIINfQbrnxJPWytZ2O8DKN/PRYdfBlF7/T8I0
         VKaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=dD7aftoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t60si5556611qtd.361.2018.03.23.03.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 03:45:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@igalia.com header.s=20170329 header.b=dD7aftoF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezKC8-00085o-KB
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 06:45:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1ezKBy-00083t-MB
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1ezKBx-0006Z9-Th
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 06:45:02 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:50761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1ezKBt-0006Wn-DU; Fri, 23 Mar 2018 06:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
	bh=LpWFodY1TdUqeh2VefxDw9UoD9Azr1tnef9/sk+HkVQ=; 
	b=dD7aftoFHjISkys6gH5yo+qXZqZ4BXakA4GdUh6++rGz9MRx2wuwx2fjw79chUJq6Bp9vICSnF1cE9nPSghUG8DdvDqLcY/FqKKTSRVHCrvXDXwNiEVDX7bb0PbH+DSdlJyMav8WAa1RgKPTt/R12qjSMRQ3wNoRpiwgGaSTPzSg07VGERPEIZl3aj1eE5SRy01CXImB1rtJp7O83Aa1pFj+90+TuJAQv2jz4N/6cMLc+vbZ24lCdzRanBPV8jaoMaW6Ft/raVBh9XEozzyAgCexh9wEmlE3Tlo7467UIAe6sWW6BB0Y4VWovyB9tr4bDoMie1CbvbIRQxHZC0aw5A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1ezKBm-0000Hr-6T; Fri, 23 Mar 2018 11:44:50 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1ezKBm-0003Ri-3n; Fri, 23 Mar 2018 11:44:50 +0100
From: Alberto Garcia <berto@igalia.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Fri, 23 Mar 2018 11:44:49 +0100
Message-ID: <w51lgejt6ji.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: Re: [Qemu-arm] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
	Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	=?utf-8?Q?Daniel_P=2E?= =?utf-8?Q?_Berrang=C3=A9?=
	<berrange@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sexulfb15SfF

On Thu 22 Mar 2018 05:12:26 PM CET, Laurent Vivier wrote:

> diff --git a/block/quorum.c b/block/quorum.c
> index 14333c18aa..304442ef65 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -608,7 +608,7 @@ static void read_quorum_children_entry(void *opaque)
>  static int read_quorum_children(QuorumAIOCB *acb)
>  {
>      BDRVQuorumState *s = acb->bs->opaque;
> -    int i, ret;
> +    int i;
>  
>      acb->children_read = s->num_children;
>      for (i = 0; i < s->num_children; i++) {
> @@ -643,9 +643,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
>          qemu_coroutine_yield();
>      }
>  
> -    ret = acb->vote_ret;
> -
> -    return ret;
> +    return acb->vote_ret;
>  }

The Quorum part,

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto
