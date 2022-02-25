Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1590681lfq;
        Fri, 25 Feb 2022 01:05:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbQQIT7wSFddD6vAu6qC5sYf91V4INoDT+gYVJT1R/0r0cyufjLYKlYoR1d1YxNf/rit0S
X-Received: by 2002:a05:620a:13a9:b0:47c:cf9:b4c2 with SMTP id m9-20020a05620a13a900b0047c0cf9b4c2mr3872392qki.580.1645779923504;
        Fri, 25 Feb 2022 01:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645779923; cv=none;
        d=google.com; s=arc-20160816;
        b=eGWA2vZZ1GcY5bxIJXQbHLeXcbUn2qiBEICyslpDFb6B4kIPcpVuNFqrCEVf2CcSdd
         hA+XbSkXfEhoqmEfAHcSeFqjTW1NWW6xaxrLq/rIybiWnrCw5nvOCvvj2EOEb0uFqJ7F
         TSWrQD2BE9jmh+UawW9nzP7UYUktK51xA9/BZcfvYRJg37tOckK8JhaUVM+YC68VBgfz
         +GMkA6eJ2W3VTG/15zWFByOy1Yx8Go1Ilos4rGw2BJMhXRjSPA8Z7/B65/wqyazWOzg1
         ryet8YXBCmFhSmS/LnBz0HC2QaIQlPhWPji/vTrSd5aq5rFYnR9bvg+2NNEISkhKwoRP
         CGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=XyoBzNuBjbFrXyWiyXL/sZikTrTg/nXanqdjCdeMwCc=;
        b=S2/OzfDxTV+b811/cK5mr4XyTLqvh3uIZmlImgo+zKsT1IvjTP7XcmYf+/aR63LZfT
         +l5Hs77rMCI4gYPYC2QBZ2Te0GfZ6dXcodvtt5VCI7yWNHlidmf/UJ4TmfhdySJJj4UF
         BzlKCRvW8h18n2S1pvuIT5ZWB8cdipHRi1GRKw/Dnn7+gY8fZsVEurxzFy9cxedfVIZS
         Lj4jwhktQJZSbZiDqWeAC9/MCJ86kKrhnvo+SZC9fHrzRCaisKNJ56HJ+ZPAjKh2BCFb
         NHbyHRhpdLZanAwXnsn4S+rsLc01H8RGv46n+gLlTX1YtFbbVepLSW2opWqLW0hDVu4e
         aIgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RrDtEB3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4-20020ad44564000000b0042c9cbae6fesi1026481qvu.521.2022.02.25.01.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Feb 2022 01:05:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RrDtEB3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nNWXR-0000Pw-Oe
	for alex.bennee@linaro.org; Fri, 25 Feb 2022 04:05:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNW7f-0000TH-6H
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 03:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nNW7b-0003ls-Kq
 for qemu-arm@nongnu.org; Fri, 25 Feb 2022 03:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645778317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyoBzNuBjbFrXyWiyXL/sZikTrTg/nXanqdjCdeMwCc=;
 b=RrDtEB3NmtIiKBgTNFfSjpEz/PjglYm6hUV5cz1/IkPy7LMqqRE5pjU3kx/vxoW5A41ltd
 8xm6dA+u2zcXEDembaDVOlLLlnKU2loAhu4OB+TFkM9Z/we7jhGLjbXuT9AsTUnQ4PJ2P5
 MuglYrQD44758/2Wn5VTzWvl3kds2RM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-DSNWbNX8MW6ZvGhZH-4ffw-1; Fri, 25 Feb 2022 03:38:36 -0500
X-MC-Unique: DSNWbNX8MW6ZvGhZH-4ffw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C9A91091DA3;
 Fri, 25 Feb 2022 08:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6A9691B5;
 Fri, 25 Feb 2022 08:38:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EAF9B21E6A00; Fri, 25 Feb 2022 09:38:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
References: <20220221192123.749970-1-peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 09:38:21 +0100
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 21 Feb 2022 19:21:20 +0000")
Message-ID: <8735k7nxxe.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2tn+MJW8bOu8

Peter Maydell <peter.maydell@linaro.org> writes:

> This patchset moves RTC_CHANGE back to misc.json, effectively
> reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
> the target schema.  That change was an attempt to make the event
> target-specific to improve introspection, but the event isn't really
> target-specific: it's machine or device specific.  Putting RTC_CHANGE
> in the target schema with an ifdef list reduces maintainability (by
> adding an if: list with a long list of targets that needs to be
> manually updated as architectures are added or removed or as new
> devices gain the RTC_CHANGE functionality) and increases compile time
> (by preventing RTC devices which emit the event from being "compile
> once" rather than "compile once per target", because
> qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
> "compile once" files.)
>
> Patch 2 fixes some minor documentation issues for the RTC_CHANGE
> event, noticed during development of the patchset.
>
> Patch 3 makes the pl031 a build-once file again, which was the
> initial motivation for the series.

Queued including my PATCH 4.  Happy to unqueue it if there are
objections, or the entire thing if you'd rather take it through the ARM
tree.  Thanks!

