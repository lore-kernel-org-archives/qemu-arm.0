Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2040386njc;
        Tue, 11 Mar 2025 11:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhhZD5JJau3BVW5FpEBu5dumB3aNK2aNfu/9K2aixeMDuNm6Ax8Z0wfn+Hftf9sQvUPVREE8VUfQfe/g==@linaro.org
X-Google-Smtp-Source: AGHT+IEd0vHn93yE1eNS0RUSWglKYYjhYsxJWtpVc2iwurI+Rud8bXDIRmAOtrzXMYpcBWIJg7yV
X-Received: by 2002:a05:6830:3e83:b0:72a:47ec:12da with SMTP id 46e09a7af769-72a47ec1f36mr4754360a34.10.1741716730420;
        Tue, 11 Mar 2025 11:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741716730; cv=none;
        d=google.com; s=arc-20240605;
        b=FHLacBjRBowVoZn3u/BVcHQpvlZRMp4jk7LTqkmElChhwlXrC/8IhDIw3gXfGWOdkk
         OD4J7QMrvRN774UXbDS1+s6iW50ZYOA0R3Md3Y8L9pmi5VpXbxB7gA3ENuPvmGn9iulU
         wDJUuNwwcXP5BIMSXvTZ/VD2QFH2HGNNv3FciQ/hsxXdPSB12Y5yCIUJTWAF+dGJanor
         yze03WZGKLDnVyPRrVrdXj148i9/Vx+hcYtNYPrebWwPVVcBHXEq5N40Bs8Y637MIg07
         w0YZcAeFWbSpnwPGKMOnhQl4OYS2wBY3hEojuNW/rfZQ+0eJRgaRAiWkTzgX+OLpRMnH
         mIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=l+OimIGgnOTV6AiSILzueg1tY/I7mTXjqbniuHOqnfE=;
        fh=nI5XaKu4j1U+DnumxYHjDBwvW5Ejy3ITmtpp0jHNA5g=;
        b=E/l//FQLIC+h2v2XwRJygJNQpyT4W4A0gAZZZ5eRijvbI4SNUjpyP/UeDtxs4S4n7P
         oiopnROANVtpf5XobjTWwV7aVilS3MrXUbE1JnnMzoKkXDK0SUIoZuag7nE/88gBX8/n
         NFFtusFmuC3bK5cr2wDrqmGYyVi6XVTAfDGNj2RXfNMr9Y1+Z9x2VDJG92NPcXDOOkQ9
         J9dajsSF8MNG4LxJKNc0AhlUeIVGIt5GISaSUT48MuG03l6+rHrW93kjfsdWmt7pO7h9
         7Q5FZmvCtsz+gmzYW8ROB56IgfxsY/edEwoe9TZCf9hqQp6r5xyP7heSum+QLLkzLEHP
         M3eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BE7Krrxi;
       spf=pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 46e09a7af769-72b80c19016si3349309a34.40.2025.03.11.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BE7Krrxi;
       spf=pass (google.com: domain of maz@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DADD5C4C8E;
	Tue, 11 Mar 2025 18:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE107C4CEE9;
	Tue, 11 Mar 2025 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716729;
	bh=2KUwTYwOhimsfuIGFbZxKncN8lCRZnq98ZApD7bvfzM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BE7KrrxiQMbIp4x4B1cQun00wuBEq7U9Oc0cQ1grW1eduaiXKmVJ+5yVB/7qKAcxk
	 bPdx9Hr2Qmh0mOF/VxR2WpbP27oWXtxIS881HIBI2D7DQJ04yeZ0xMM146jfsu749Z
	 MKEQEdhkY90qnIGrNFt6IhupRkpLLnsiLTgLFauCf4gyLESvk1Ya6PnihIkzjbuKKL
	 SPv4nfR6bomUtJlQaXAaw01/NSZtxdeibtRli5crey35sRJAShMrxzJytKD7OGdrSd
	 Lxb/4ix7+/29ZvUV7tDG+Yw1MQ85Ws+ki9M1m7pLEX8dEvsWHI2g3yWrLY+zpePuWv
	 TmqKXTIj0qBiA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ts45G-00CduK-Oe;
	Tue, 11 Mar 2025 18:12:06 +0000
Date: Tue, 11 Mar 2025 18:12:05 +0000
Message-ID: <86plino2ru.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [PATCH v3 00/14] arm: rework id register storage
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: cohuck@redhat.com, eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: MfkBgajKgfIo

On Tue, 11 Mar 2025 16:28:10 +0000,
Cornelia Huck <cohuck@redhat.com> wrote:
> 
>   - I'm open to changing the source of the definitions from the sysregs
>     file to the JSON definitions published by Arm; however, I first wanted
>     to get the code using it right -- we can switch out the code generating
>     the file to use a different source easily later on, and I'd also like
>     to steal parts of the script from Linux once integrated (which I think
>     hasn't happened yet?)

I don't think there is a real appetite to have that script merged in
the kernel. My current plan is to maintain it separately.

But by any mean, take it and do whatever you want with it.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
