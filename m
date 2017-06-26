Received: by 10.25.15.197 with SMTP id 66csp1554210lfp;
        Mon, 26 Jun 2017 10:50:01 -0700 (PDT)
X-Received: by 10.200.55.44 with SMTP id o41mr1891288qtb.120.1498499401620;
        Mon, 26 Jun 2017 10:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498499401; cv=none;
        d=google.com; s=arc-20160816;
        b=B8dVKwXrvjz3/9vUpB/45p0iMlAUIMQZ4QRyuUL9EbJBWKxkPts0EGirnHYj3PBQHf
         TfojEOBhJi8xKqfcH9pR8GM+iekNJGZKkFg5L/qTiWpWkcMMvxYtmJ6w7Vcv0uqLnlm1
         K6WIjh3pMZkGPO8GCm9dnxQRRpQ+wnNfluE+msAAp9a2Zu8f6GxlOQLzTGgYjTOtVgui
         bWgyBxLeQu+8VVBWysZkscev98BOmHOerUwsHZryUOzOf16sGWNyiPmElOk4SWTEPsYP
         vY15B3suzXvbl29Rp4iEUZg/6bFHHx4GspZ0ZCCDnDNFSRYxM77H/IxAy9bVhxt6+us3
         rCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=B4y2K7MxBVLM9J/dfcVN05xrQ/KD+o6uHYL3bEPKnbw=;
        b=i96AuMpfx/pXjtX9DrzL8/0Ight14gRHKvln4B/KdHTx+qqhgmEkkEfFocuAqtE9wx
         hTaGZ5i3QMSGnPyAEk9PW/0hoZdZN3YvpyZovbe/CgO0eKBvFc6rlc5yTEo99nXJjgbn
         HtRQFx6cehWUwkpYjmnh3LjPZ6lAda4Pys6z5HhGBa2Hg3BgwWR4LKwzEdfE7BnoyIa4
         +WXUSb9o7MLSmfaS3Mjgs00ml02XxxjoRQKY7Gr9PEwrnrKs7VOhtFjctxpC+TB2WbKY
         vm8VHf2oyn92QYVfUOnYT70doN5lEwbQgOW3VMBstQfxb07agdFeC8O+t1XvWftGAXSp
         crfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=wLoSiy3G;
       dkim=pass header.i=@messagingengine.com header.b=ZIYbWAn0;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id h68si588797qkd.34.2017.06.26.10.50.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jun 2017 10:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=wLoSiy3G;
       dkim=pass header.i=@messagingengine.com header.b=ZIYbWAn0;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2FA6620C5F;
	Mon, 26 Jun 2017 13:50:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 26 Jun 2017 13:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=B4y2K7MxBVLM9J/
	dfcVN05xrQ/KD+o6uHYL3bEPKnbw=; b=wLoSiy3Ggs52DG/JN5lwVpYmdI5saUz
	qj9HpdhXGUYxX5Hbs0TfJJLQMrSaD44N1M8tW5yG3wIviMdpQnSIsJl+DuD0PYBo
	ULjXduBarDjQJwKKbmHoXWN4AzV8cle0FawjmnfN2Qu/yhRvJyXPXo4dWzA+h95q
	E/geES8fxTac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=B4y2K7MxBVLM9J/dfcVN05xrQ/KD+o6uHYL3bEPKnbw=; b=ZIYbWAn0
	sQj4k/miL/4OgPMMkOiZVeSL8b6bJefjksWen3b5oW26pjukxoB+hzFUw2mq7ilZ
	nQnNU3U4/qfeBoIYx/BtRCzuqMmUlNeJiD7nlI47wqSFIbX7jry66b4W4QkzpvSC
	NlwMwV09I3vw1uv1kVaMScjVBCexQ9p77K+DhwN8tuER9gZd6Y6YZ5LJQEOjbShH
	+f2WGzb3Y7wL0puWqbVzEtcn/YebHWdzT4nDeRkJCmkBrF1qL9vh65RhtJtAfEWN
	R8QHYnu9XrmWJQMxBqWY6mA1lAYuJLgRMWFV8TJ4uQrjDhKocfNMFJjz5+XmLGYu
	B1jWpCC8IdpQ+A==
X-ME-Sender: <xms:SUlRWXunUO7a2E3Hrl9SAkrDxs6_JkYpp3dBzFyxnFC9mhLNk32zqQ>
X-Sasl-enc: EUU41SbuyUYi5cJypoKPZGsgIdfnGcY7GrvptbaFn9lj 1498499400
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id C48CC7E7A5;
	Mon, 26 Jun 2017 13:50:00 -0400 (EDT)
Date: Mon, 26 Jun 2017 13:50:00 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Stafford Horne <shorne@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [PATCH v9 01/26] Pass generic CPUState to
 gen_intermediate_code()
Message-ID: <20170626175000.GB17935@flamenco>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
 <149838046604.6497.6648018844505723967.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149838046604.6497.6648018844505723967.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: HnUVw6ElJsBt

On Sun, Jun 25, 2017 at 11:47:46 +0300, Lluís Vilanova wrote:
> Needed to implement a target-agnostic gen_intermediate_code() in the
> future.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>  include/exec/exec-all.h       |    2 +-
>  target/alpha/translate.c      |   11 +++++------
>  target/arm/translate.c        |   20 ++++++++++----------

Let's also convert gen_intermediate_code_a64 in target/arm/translate-a64.c.

		E.
