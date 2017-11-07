Received: by 10.223.150.237 with SMTP id u100csp3593841wrb;
        Tue, 7 Nov 2017 02:12:53 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RBSIAahs+KIRDTWpXcwYVrWlQfO6mYHHJdC7IPOqthGIL850+BHcJkJv1yb8+hUFGpoT3U
X-Received: by 10.129.209.6 with SMTP id w6mr11281151ywi.244.1510049573672;
        Tue, 07 Nov 2017 02:12:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510049573; cv=none;
        d=google.com; s=arc-20160816;
        b=dX3AL+qfpWzvFmnBKai+2DGj6/fqOYV+bNZEH3r2MTJciSCL9EKtXGZcdc/i6sQv86
         Zz/Is/WIQ+JdFLvJ5vQEfqSVkXXQsEELd2ViJUPeLZubLSuwo6YJGtFKTg5HJnF2/vNX
         q5kCb8gQ2O5k6mIkuUdLXTEHEMkmD/ule1xqyrjiqMuD52N/FkLZhg77LJR1FyMrkWbV
         EK7iFc9wcfOMUWTIjy0T7hGAOlUp+3z0EE/mbRQaHYdsnSGKl+pl6+JFFPviPPP3HW/c
         M+wW/xldbsmfe3whP/NGTqvW6T79QWYtrsnHHAQc6JSHpeKizNluBXB1OhKEaXrUFfTc
         Z2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dmarc-filter
         :arc-authentication-results;
        bh=e5CE3DL6dgtL1wF6mz6ygWixyyIvSuzt8rz/yNbtONY=;
        b=e+/0+QYzvL4mUb3y3/ehXfhzsmS0YxpS5RK6LBw6RAKPzIAZ/TLtG5wp1xRMIffdxJ
         FRGONfubpYh2eaylSnzxZrUnBNQsKML7tZOTHe8w4Jo9k4Z3GSqZEsUUHO2p7LFf3Dgk
         gjyqo0QvjnjY4gSWE4CayroukQXycwMZgMRjNpfp/Fp8zvoDlg5T8cZD5ISqIEt8ZJU7
         yc5gySEQl18wMHObvA5P5w9WnSQnaFyCe3IxQZtlxds4E/qb+KTUfZ4Z3F1XdaCeisKE
         2omrSZkp87PE2p0GE2P9mSOdrGdKu0dFFo/0c0Ljg1MZ7+6DRgJPSLwfLy4TJg4TqyYq
         on8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m1si201270ybm.368.2017.11.07.02.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 02:12:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC0sG-0006q2-WE
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 05:12:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eC0s0-0006pi-MU
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 05:12:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eC0rw-00061d-Vz
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 05:12:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:7917)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eC0rw-00060w-MY; Tue, 07 Nov 2017 05:12:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE76D6A7C2;
	Tue,  7 Nov 2017 10:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DE76D6A7C2
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=armbru@redhat.com
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A59F5D6A9;
	Tue,  7 Nov 2017 10:12:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6905E1138647; Tue,  7 Nov 2017 11:12:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop>
Date: Tue, 07 Nov 2017 11:12:14 +0100
In-Reply-To: <87efpmccvu.fsf@secure.laptop> (Juan Quintela's message of "Sun, 
	29 Oct 2017 14:16:53 +0100")
Message-ID: <87bmke4cu9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 Nov 2017 10:12:31 +0000 (UTC)
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
	qemu-block@nongnu.org, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, alistair23@gmail.com,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P7mmoqixi+9P

Juan Quintela <quintela@redhat.com> writes:

> Alistair Francis <alistair.francis@xilinx.com> wrote:
>> Replace all occurs of __FUNCTION__ except for the check in checkpatch
>> with the non GCC specific __func__.
>>
>> One line in hcd-musb.c was manually tweaked to pass checkpatch.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Andrzej Zaborowski <balrogg@gmail.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Anthony Perard <anthony.perard@citrix.com>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
>> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Fam Zheng <famz@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-block@nongnu.org
>> Cc: xen-devel@lists.xenproject.org
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>
>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>> index 5bcb1c60e1..543b1bd8d5 100644
>> --- a/audio/audio_int.h
>> +++ b/audio/audio_int.h
>> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
>>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>>  
>>  #if defined _MSC_VER || defined __GNUC__
>> -#define AUDIO_FUNC __FUNCTION__
>> +#define AUDIO_FUNC __func__
>>  #else
>>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>>  #endif
>
> Unrelated to this patch ....
> Do we really support other compilers than msc and gcc?

Let me rephrase the question: do we really support compilers that don't
understand __func__?  The presence of numerous unconditional uses of
__func__ in the tree means the answer is no.  Let's replace AUDIO_FUNC
by plain __func__.
