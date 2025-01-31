Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp257856njb;
        Thu, 30 Jan 2025 23:53:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYGyhoJ6AjbMVvC2sd+5uh+StS+Wi1ajZwKd1/Cw7mFPe/GJaHdAaeQWJTpbKGgl2JqIj6DanSVQpRCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEosUhnEWJ3FpqZkxAe8OLWwXLS7WTgNdWfFWPAQzVvFXb0XwFhmCr7R/xeJgP9Tkv1FSgI
X-Received: by 2002:ad4:5de2:0:b0:6d4:27fd:a99d with SMTP id 6a1803df08f44-6e243bf643amr175655846d6.19.1738310013930;
        Thu, 30 Jan 2025 23:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738310013; cv=none;
        d=google.com; s=arc-20240605;
        b=XSGhugPKDl3M4blHZYebUD5ovbVzP9s4MQMf1hw2cIVLSzo5U8FDGfCjquaKmN7haH
         7GLB3a287CJHfCTj8ahMTTHRiquUlc/9EmtWatDsqw6u4dMXaTi5pWsRyWupej6Lte5i
         Y0vKtZNobUylA5nKdITKlwYqYzWNiOCdhwS/qVrwN/oBo+uGjaX6n3DTXBlsAdndEjzc
         Bblh27d5qzRNFW0MEYXSw4r++Ff0XsJLP8zeEstHHrmtWyM6GGK7vozwgVS6w8au/5Aa
         gqUwPSaqUfKQixDSWZfl1n5LmnYrX2bFG8kqW1d7vU+y7YscHibj0YZEyqpznU9+XFZT
         hBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=krdwjaNue0HJycpy6WgVdfmNnHErZC38/M4PNTarUVA=;
        fh=MjgLkUpaUgk/7jm77rFcFJWPWAjY5UEOak1IpzHk5uI=;
        b=k/nleVA8Fm4fQpm/yh27D9fg8LSiWHOG/zyNx101KUCBa/p3admOomoko2JzatORj+
         meOmuKaUVNe/gfUIIiBLvm2Y642MwJcjTFaBEmocmXHDEt3K7eydkEtbbqGpQJlV1bSW
         NH23861+WEOpoCEW9BuYHvijC6oOe0fkYOw9l17nMX09/cud7pkAFiYgWAKnfxOt6Aru
         hIaBjp2sw2chFpObdvEZB8KTHAalu9ht8P/T1XJt2vfMyweHBEdUybhYXTBgvAvd8uvI
         0jl2pX5ZYq2JH4pDG/LSqpOBrzinfyeJLq6P+rfegDWsPCGq+PvWTBRcZUg6V/osrC8W
         WXpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gxIbbyOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549e2848si31487906d6.488.2025.01.30.23.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 23:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gxIbbyOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdlpc-0003De-T6; Fri, 31 Jan 2025 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tdlpa-0003Cv-Uv
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 02:52:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tdlpZ-00036r-HE
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 02:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738309968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=krdwjaNue0HJycpy6WgVdfmNnHErZC38/M4PNTarUVA=;
 b=gxIbbyOAd/YsoddS2aMPxvYS+/xJzxH4xsaADc7XvTK2Cbpukw6QxPjIoncj4xuaWF4ntF
 5lPPM5bFl4+Hs2JOVNLNTbLST2s/tj4f36sOYcttet3SOwdXtuwewHAgXYFGs2vKG0BXmo
 iGbhyUNAPPLqikBrYbd7Ieq7vG7bSUA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-J_Hce5COPL-rnYEP9WxWGw-1; Fri,
 31 Jan 2025 02:52:39 -0500
X-MC-Unique: J_Hce5COPL-rnYEP9WxWGw-1
X-Mimecast-MFC-AGG-ID: J_Hce5COPL-rnYEP9WxWGw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E776A180035E; Fri, 31 Jan 2025 07:52:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.71])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 557B51800975; Fri, 31 Jan 2025 07:52:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5781421E6A28; Fri, 31 Jan 2025 08:52:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Bin Meng
 <bmeng.cn@gmail.com>,  Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 10/11] hw/sd: Remove unused legacy functions, stop
 killing mammoths
In-Reply-To: <20250128104519.3981448-11-peter.maydell@linaro.org> (Peter
 Maydell's message of "Tue, 28 Jan 2025 10:45:18 +0000")
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-11-peter.maydell@linaro.org>
Date: Fri, 31 Jan 2025 08:52:34 +0100
Message-ID: <87o6zno1x9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /pYTup6FHkfK

Peter Maydell <peter.maydell@linaro.org> writes:

> The sdcard_legacy.h header defines function prototypes for the "legacy"
> SD card API, which was used by non-qdevified SD controller models.
> We've now converted the only remaining non-qdev SD controller, so
> we can drop the legacy API.
>
> Entirely unused functions:
>   sd_init(), sd_set_cb(), sd_enable()
>
> Functions which now become static inside sd.c (they are the
> underlying implementations of methods on SDCardClass):
>   sd_do_command(), sd_write_byte(), sd_read_byte()
>
> Removal of sd_init() means that we can also remove the
> me_no_qdev_me_kill_mammoth_with_rocks flag, the codepaths that were
> only reachable when it was set, and the inserted_cb and readonly_cb
> qemu_irq lines that went with that.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Very much appreciated!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

