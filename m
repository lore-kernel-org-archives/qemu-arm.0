Received: by 10.223.161.27 with SMTP id o27csp1507639wro;
        Sun, 29 Oct 2017 06:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QyQBqluruPIXlkxOxUZqVX5kUhgJfsUDtFXdRsxUXMBU4qKcdjK7mm23GK7NYrG7jrAg3C
X-Received: by 10.37.160.35 with SMTP id x32mr3858765ybh.387.1509283034957;
        Sun, 29 Oct 2017 06:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509283034; cv=none;
        d=google.com; s=arc-20160816;
        b=c/E/FxylfAkDPEnpHBOmP0hdmoQd0RVxzSDeltRQCLNFm2icf33dWpjAhheJJpRKT/
         vtgmg0Y1rtjvE8piZabtb3HL660mmcKNFZ4CKjFXpwRTTfA6a+imLeVWuNfwciyeRQxM
         yD1dfaOxoUDHteCWAE7DsADyyyCE7frFfOgExGLekhPaCnnShysRe7IVV+3WeQfPiVsv
         X370MhqRUtNgcmqVAFKDBjh8Z5H3sV0mr2ZLTyC9PlWi/IHN/STceIkZ+Irqqs3MNTYD
         xokPY07W62qyVux441LLVYZBMZsCBQdYaE4IcYTCs1BTf5NwnEP22aCg7nJ5xY0L7Pyd
         WwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from:dmarc-filter:arc-authentication-results;
        bh=x5k7jNcDKfD77NDpSaa1In6AW+hTr+uaUKWoLWD0/lc=;
        b=kiSOkaewgXuyH8LPnFQhSt1rcW7XqS/juvCMIRsmZWaGHv8SLNWsvAjV0//78HZW4h
         idhtzwu//BGUKQPayF/NThauMNnqB7RlQ6oKKYvgtPUIMWh8iBxR0zNSnc5fTWKuMV9q
         CzVS50KFdJbowgQEJg9W8aurNxyr1IZbdbLRyL2JE0urpu2XJ9EWTzQR0tXu+/1UcAUW
         At1+SzsZfDBnpXOvJpzQPDRvM6zXXriexJf2wascyAB34DduwkbtOPVe/lgFfbD00dxY
         0G+enORFxMOKNAdYXyrEQJok2skUGzjEMLSiTMWHem+x5hNBPRcBOtOdzbGQJvWIYzzN
         lWMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si2044177ywa.673.2017.10.29.06.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Oct 2017 06:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e8nSk-0000LH-C6
	for alex.bennee@linaro.org; Sun, 29 Oct 2017 09:17:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e8nSa-0000KH-04
	for qemu-arm@nongnu.org; Sun, 29 Oct 2017 09:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1e8nSW-0006oR-Qi
	for qemu-arm@nongnu.org; Sun, 29 Oct 2017 09:17:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1e8nSW-0006o7-KG; Sun, 29 Oct 2017 09:17:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ADACC058EAF;
	Sun, 29 Oct 2017 13:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4ADACC058EAF
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=quintela@redhat.com
Received: from localhost (ovpn-116-114.ams2.redhat.com [10.36.116.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 119C55D6A3;
	Sun, 29 Oct 2017 13:16:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
In-Reply-To: <ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	(Alistair Francis's message of "Thu, 19 Oct 2017 09:15:41 -0700")
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Sun, 29 Oct 2017 14:16:53 +0100
Message-ID: <87efpmccvu.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sun, 29 Oct 2017 13:16:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 01/46] Replace all occurances of
 __FUNCTION__ with __func__
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
Reply-To: quintela@redhat.com
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <famz@redhat.com>, qemu-block@nongnu.org,
	John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
	armbru@redhat.com, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>, alistair23@gmail.com,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XLtjeTU7JWU5

Alistair Francis <alistair.francis@xilinx.com> wrote:
> Replace all occurs of __FUNCTION__ except for the check in checkpatch
> with the non GCC specific __func__.
>
> One line in hcd-musb.c was manually tweaked to pass checkpatch.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Yongbok Kim <yongbok.kim@imgtec.com>
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <famz@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 5bcb1c60e1..543b1bd8d5 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>  
>  #if defined _MSC_VER || defined __GNUC__
> -#define AUDIO_FUNC __FUNCTION__
> +#define AUDIO_FUNC __func__
>  #else
>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>  #endif

Unrelated to this patch ....
Do we really support other compilers than msc and gcc?

Later, Juan.
