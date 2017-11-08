Received: by 10.223.150.237 with SMTP id u100csp977596wrb;
        Tue, 7 Nov 2017 23:53:18 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Qo4wNjFbACutQm5Zus7qRo5VPY8jMwPDmZMRO/Aw9qJisjdeRhJuI72lMlXfwyRqZfIwWC
X-Received: by 10.37.98.18 with SMTP id w18mr803718ybb.290.1510127598512;
        Tue, 07 Nov 2017 23:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510127598; cv=none;
        d=google.com; s=arc-20160816;
        b=pyUjvCF6WCWMwXRRuwZLN5ptWlMRbBTrIGsPpbFzQbRFvsfDLUX9aCERgciTBBIt/2
         iWuKCZUDWc8oMJaQMAGBVzU4yy9pDD+ta9MR5gkRHiEGeYG1Cx1XhQcPdqtmVW5f74VS
         HdXeyT41mjwtQCGGj+DgfUVB/WxPzeRoJKHBdC3NoUpBxtxTTs+jLvvrodDy2+fHwzEz
         9oXKcmkPhQOCX6gmgMfxs74waJ5nZCIR+uFL7OpbZu0yToq5InhNEdeMcVWeofcQI7Eu
         jNQ/j2SYMtyPHew4fDwxC6Xr6bpVIwY1szggo5X12ut3M3PfRXll/l6rOXDv5oUW66SH
         V8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dmarc-filter
         :arc-authentication-results;
        bh=pdvyj54f7PjL97NXV7d6CAXHb26Jyru5ktNebrcghLA=;
        b=MlW5JlIfg7NBz7iqHka4IWFipcm4FkHgcrM7qlVeOndX8+zYizhDQP+XtEwPcAIb/f
         bilD4skBZLYTpl7JuzrlftUGbTnhrvLtyGi351xfFOP/isgUHD8TiDvv5cbueEG/NBpR
         LampEbEKnaEEsSdd351cD+VIDG29bZ9WGU0ikm+hHu/yAPEHIQOk3ZiSP2pzon4QIpXv
         8eaCKr8jqsbghLFtB/tz1gEIPwV0vbV21Eg9g4Gj3J1rlVCHidYMn8uyHkCHojvtG5Mu
         vSdDFscytzVneFOlVA1wFuxFLmqRCMKOAN4QsurZGdt/NW+MvbB6TG6so6pDvgsAxvmE
         Czqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a2si769883ybb.127.2017.11.07.23.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 23:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCLAk-0002DA-0g
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 02:53:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eCLAa-0002Bx-PN
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 02:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eCLAX-0000EX-JT
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 02:53:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eCLAX-0000DD-1d; Wed, 08 Nov 2017 02:53:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77C6372FEB;
	Wed,  8 Nov 2017 07:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 77C6372FEB
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BC15C737;
	Wed,  8 Nov 2017 07:52:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 14FB81138647; Wed,  8 Nov 2017 08:52:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
	<51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
Date: Wed, 08 Nov 2017 08:52:51 +0100
In-Reply-To: <51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com> (Eric Blake's
	message of "Tue, 7 Nov 2017 13:41:49 -0600")
Message-ID: <87shdptdf0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 08 Nov 2017 07:53:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/46] Replace all occurances
 of __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, alistair23@gmail.com,
	Yongbok Kim <yongbok.kim@imgtec.com>, xen-devel@lists.xenproject.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBCv0YvTUtL3

Eric Blake <eblake@redhat.com> writes:

> On 11/07/2017 04:12 AM, Markus Armbruster wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>> 
>>> Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>> Replace all occurs of __FUNCTION__ except for the check in checkpatch
>>>> with the non GCC specific __func__.
>>>>
>
>>>> +++ b/audio/audio_int.h
>>>> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
>>>>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>>>>  
>>>>  #if defined _MSC_VER || defined __GNUC__
>>>> -#define AUDIO_FUNC __FUNCTION__
>>>> +#define AUDIO_FUNC __func__
>>>>  #else
>>>>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>>>>  #endif
>>>
>>> Unrelated to this patch ....
>>> Do we really support other compilers than msc and gcc?
>> 
>> Let me rephrase the question: do we really support compilers that don't
>> understand __func__?  The presence of numerous unconditional uses of
>> __func__ in the tree means the answer is no.  Let's replace AUDIO_FUNC
>> by plain __func__.
>
> Answered elsewhere in patch 3/46 (where we DO replace AUDIO_FUNC by
> __func__).

I see.

Put 03/46 first, so we don't have to mess with AUDIO_FUNC twice?
