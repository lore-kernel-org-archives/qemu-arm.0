Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2943010wrg;
        Mon, 13 May 2019 08:25:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyY+tyPYIakmBV75QE/bGbK9KIErAp4TNJXsoQhIkRWPe3lOcJOqFVUhOLJH8Q1VUuIS5RA
X-Received: by 2002:a05:6214:24a:: with SMTP id k10mr23254260qvt.121.1557761127000;
        Mon, 13 May 2019 08:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557761126; cv=none;
        d=google.com; s=arc-20160816;
        b=IBAguygAzY86FZfE227uw9DmKR1sPs1OyJ+/TGyfLd1hPye8S1Qp18sZ8Y3ijwGBvK
         im6Iy0ZFLXOQi2FyVt9NcC4I1VE7gQzfQXnBOB/7/fPA8+Lcg/qDokPiJT+FQt5vZfiw
         zhsHrPgrzoNyf21UzmNxi6I0AAdV5Z5l/tVhlRnSZNBM8K/MaJov+xUMaX+yPUsKX2hZ
         DYfhecaDWCZba021QhMMoWxJjLcWmRpXzAkoqZQ1FUMPHU5wUL4/b0y9nW7vcjdxGAS9
         oYsIos5qkaVS8BF52LszwZBlBYfDJ+qxrzWiCFrum9sbg6Zy/5Az+5Ogfipv6PXjoKV7
         RjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from;
        bh=H/fg2DP+HHdTjg4UBvFVqSdlDOXP7SHdLrn/6ON1WgY=;
        b=UcWNk0w3Hud0mNYf6MCkyYWXc++P8IeFXEAWQox/87TurwfEUbTMc/vcAfLShaXiaN
         C/OVZ6T8F/YVM/yaYZutc9T/Y659+le+KolaJp596Hd88FoqLr+8g+06Cl/wl957j1T7
         qs4xnWS5nTWzdYDTmaWOlacCDPJKJJ28FIwTjM+sMxuTxWgXSiGeewb3ugSbm5NFhHWy
         RCPK5/sK8jwsXXlmRjkYThjQl1N7DwA8MMJniPnk6gMkuJToMMv6tqCx4VxSs7SOrbzV
         J3Sw/8XvgwDS18lrXCB+W96PSHNHyryYlwHUcH2S42uAPj9iLt15FsqLwlTaxw41nDFn
         RpnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h90si931784qtd.353.2019.05.13.08.25.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 08:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of armbru@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2690F59451;
	Mon, 13 May 2019 15:25:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com [10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C59666A490;
	Mon, 13 May 2019 15:25:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 42ADE11385E4; Mon, 13 May 2019 17:25:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org,  richard.henderson@linaro.org,  abologna@redhat.com,  alex.bennee@linaro.org,  Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce sve-vls-map
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-12-drjones@redhat.com>
Date: Mon, 13 May 2019 17:25:23 +0200
In-Reply-To: <20190512083624.8916-12-drjones@redhat.com> (Andrew Jones's
	message of "Sun, 12 May 2019 10:36:22 +0200")
Message-ID: <875zqefkbg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 13 May 2019 15:25:26 +0000 (UTC)
X-TUID: tmtmTq4wJEx1

Andrew Jones <drjones@redhat.com> writes:

> Introduce another cpu property to control SVE vector lengths,
> sve-vls-map, which allows the user to explicitly select the
> set of vector lengths the guest can use. The map must conform
> to QEMU's limits and architectural constraints, checked when
> the property is set. Inconsistencies with sve-max-vq are also
> checked. The bit number of a set bit in the map represents the
> allowed vector length in number of quadwords.
>
> Note, as the map is implemented with a single 64-bit word we
> currently only support up to 8192-bit vectors. As QEMU and
> KVM only support up to 2048-bit vectors then this sufficient
> now, and probably for some time. Extending the bitmap beyond
> a single word will likely require changing the property to
> a string and adding yet another parser to QEMU.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Please add an example of how the new property should be used on the
command line to your commit message.  I'd ask for a documentation update
as well if we had any to update.
