Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp794504lfg;
        Fri, 30 Apr 2021 22:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx+onzG+5yQVAkWh5xi753znkbOHBdofNt1haOwzDu3kRKqh5Nz9qBFUfk1kvFbzZv9h7x
X-Received: by 2002:a5b:191:: with SMTP id r17mr12411806ybl.297.1619848568633;
        Fri, 30 Apr 2021 22:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619848568; cv=none;
        d=google.com; s=arc-20160816;
        b=0BftsQdH+mxbmqqoogTs9paJbqa0aeEblKEedMHg29ZpAOI+4MFGJ7/mrVjUS5ijto
         tpkj3W0uW95OEhrei0NYmuQBmwZjKf9VcYEIkpPwSCuhFOENRKHKf85tG4om9OOQIk5v
         2vHp9e65L0H/qjp8Q2ETT5sC2eINBR/ZROiDyIoo9+/p4fLvYYNT8ccRwxfQ6vfiI2O/
         ISJ/D5xnagS3k4UygSMaybbH+oB+1q5uULN4kR+FKW5Mu+d4CRTIERPMpFiR3yywWoL2
         yNAz6+Qse8zSoOwYMtyg6JQXrJCghYJ3Aw1AYxMJ2XVdtJBw0CEjZlwshRZnjqkGrlSx
         44kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=Lp3SzxNIIur6BIgqLkWqgccUuxu8B6TpWwGS5c9rLo0=;
        b=EdLjanPmNrFSEM7YgOy/JtacUzAhJcVJcBCvN6rEUkVgwtfbU+ELvFy9C8Cj0v0UrU
         WzHH9LGT50C3Vc25JuyJeT23PROcIdobqNMNP1+9pyMvpGTo7u5S7PUSGU/F4amj2odd
         1T6MpW3cFChVQZzpdDnTO+WREpjH627RAvuWUi+7mDUSXa5k+Sw8LuV3aYZhAZHiVVTs
         OTxiY1hAs+PuZsP80wd7Vj/mgGHuPw8Pqlmnvc/dxGAXA6dAj1LCXfh5jZKylpJ+Y8QX
         8AW5ZTnUzPjHJ53olHkvilFdPGwNMdfho+D2TIWsjVjlQgoSF/HathHwSE03ONVyhnkn
         IHzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlzrWSgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p125si1248163ybp.239.2021.04.30.22.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 22:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PlzrWSgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcibn-00037y-WA
	for alex.bennee@linaro.org; Sat, 01 May 2021 01:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcibV-00034B-59
 for qemu-arm@nongnu.org; Sat, 01 May 2021 01:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcibS-0004Bc-O6
 for qemu-arm@nongnu.org; Sat, 01 May 2021 01:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619848545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lp3SzxNIIur6BIgqLkWqgccUuxu8B6TpWwGS5c9rLo0=;
 b=PlzrWSgqb1QpPKx/NP02Bv1BOx9JTHswgCYRQ3x7G7D8XBwvNZ0LF7N03ilCrigk6qf0gE
 Eo1Qu++W+hTjr7sKXEeCcL3utWXfvkOiPiWsKxxThlfftm5kWLJWE/soEahLeA0EOVIchz
 ViPJ+A0VP4FVkCV7H4lZlAGMCSDWU0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-ZeNXWcMSO02muxjF-XVf8w-1; Sat, 01 May 2021 01:55:43 -0400
X-MC-Unique: ZeNXWcMSO02muxjF-XVf8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDBED801B13;
 Sat,  1 May 2021 05:55:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 794745D9CC;
 Sat,  1 May 2021 05:55:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E53B4113525D; Sat,  1 May 2021 07:55:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/sd/omap_mmc: Use device_cold_reset() instead of
 device_legacy_reset()
References: <20210430222348.8514-1-peter.maydell@linaro.org>
Date: Sat, 01 May 2021 07:55:39 +0200
In-Reply-To: <20210430222348.8514-1-peter.maydell@linaro.org> (Peter Maydell's
 message of "Fri, 30 Apr 2021 23:23:48 +0100")
Message-ID: <87o8dvknfo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HA7Kc51GlcT

Peter Maydell <peter.maydell@linaro.org> writes:

> The omap_mmc_reset() function resets its SD card via
> device_legacy_reset().  We know that the SD card does not have a qbus
> of its own, so the new device_cold_reset() function (which resets
> both the device and its child buses) is equivalent here to
> device_legacy_reset() and we can just switch to the new API.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> cc'ing Markus who was interested in conversions away from
> the legacy API. As warned, the conversion patch itself is
> not very interesting as the difficulty is all in confirming
> that the device being reset has no qbuses...

The commit messsage makes this helpful.  Thanks!

I wonder whether we should add a hint to device_legacy_reset()'s
comment.

