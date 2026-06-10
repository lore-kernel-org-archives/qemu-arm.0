Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D86CD98CC
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 18:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXO1Y-00025q-Ov; Wed, 10 Jun 2026 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXO1V-000253-GF
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:51:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXO1T-0002N8-Ci
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 14:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781117489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJizkvEeQr5W24xg9kyOBmTnK/HoAg1GDQLvaHCll9A=;
 b=WcDbsqFkQCBnDGPVixArdbWRzUbXcHskWeoQHbJBJ/3gCAmyIWJcCOnj5fnD88vznNXu84
 I5OienNnCmoVzk79ij8XXJis7q1gW5DwZuwTOFj5WKIGw15TkzdpTwxSA2Ju4MuO8H4ddY
 PfYCoofX3ETJ/cOu9JhDscFl+M9+vsI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-cDK4VXkRNAmpTvJTAZDE2w-1; Wed, 10 Jun 2026 14:51:28 -0400
X-MC-Unique: cDK4VXkRNAmpTvJTAZDE2w-1
X-Mimecast-MFC-AGG-ID: cDK4VXkRNAmpTvJTAZDE2w_1781117487
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ccf3d72081so105454746d6.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781117487; x=1781722287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJizkvEeQr5W24xg9kyOBmTnK/HoAg1GDQLvaHCll9A=;
 b=OlDRBdpcfAhEv30jG0TVzNaKya/zxY4UjLiUne5JCz/tikHS4jvFqq1hoEXmDeNN2S
 trLbA+HDdRUT8f4rLI0Ftn2af/7tlReIRXQ3Nhz/HT+NHTsgcjImU8PZZaP+SRMIcB98
 TFTcXbQolCcxkttkqm8n9BSrmkQqTazRBHnuaHEcCyCY3OL+WeKn7eLe0Q5QK3FqNQx5
 Z/E+yyeEcUvdI7OTM4yG4zUm2dCxs+Ce/Q7oERec5br5bJ3LD9N2a3hfJSzDakH3xXlK
 JS77Hy2PfkHdWfCXPYykJWw49Q+WXdSHn8zvMuW4pk2D+0eTDBKZo6+jfch93aw/XoqS
 kK9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TkNnqkTv3uOWWEN+NibHD5XiCMezsH2/8RykcM/q+fndh7nt1X8iJqwW2Fsc6ahWS8IFtNZWwGw==@nongnu.org
X-Gm-Message-State: AOJu0YwsUH3vKKYX3tQznReDUEJAqLhv0f9PSCY8jPJm6+W/bxpQ7z8o
 jzrQqctfykvoK6EwmVC3Uyoa9ropFdFUDm/IoThAYAG7dGXLVYsaOcU+g8HTHrXnCZwIIkXhoP2
 DFz3yqN8r1MUVRYsLbep1821D4OrKUBZbGTUj5J8QBKfmKbwAvbNG3w==
X-Gm-Gg: Acq92OEkoc3s4R3POsc86M89SbEgvfNFN2gLl345kzhuK/6+WJLrUM3pFEMWnfho+KZ
 0C0b/0GP/LUKsz1UaLVB11tdowVr58tERG25UPJNJ0fFbdYhDAVs3W8dILbAQrRtE3VrXC14XQp
 oaZ6GRc6my1Ko9ck9lcfD3+1q7RiuGOfBVCE/DNlse+2npQu+nokeISJjxV+IVN/YD2qCa0nJZB
 vgS8K+Uj1974B9xiwB+x3od9x348UTJ/OHuojquEqE/4Qkp3ThDR1Miz7nWrhjBpydfT5Ri42/Q
 HG+gVAnZRnhJkjrtpRcu9M9fwkdG3xgLVAF9lsUNYEL+KwrYFb0ZPmDTIqfp8VHZlMlk/J+mLcu
 z+sK09Rl8fITvYvwTtDvlQGl6gQ==
X-Received: by 2002:a05:6214:1d0d:b0:8ce:eaf7:dbe7 with SMTP id
 6a1803df08f44-8d18a00f4d9mr8732356d6.33.1781117486608; 
 Wed, 10 Jun 2026 11:51:26 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0d:b0:8ce:eaf7:dbe7 with SMTP id
 6a1803df08f44-8d18a00f4d9mr8731826d6.33.1781117486102; 
 Wed, 10 Jun 2026 11:51:26 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecc8222bcsm246008466d6.0.2026.06.10.11.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 11:51:25 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:51:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v2 10/10] migration: Switch to TYPE_OBJECT with object
 properties
Message-ID: <aimyK31EgOJICi_X@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-11-peterx@redhat.com>
 <aimRB5Uv2XtTE4Xy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aimRB5Uv2XtTE4Xy@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OMIdRUEHvyvmzwUySv_-Xa7YwvA2i5WQROBanAiixDE_1781117487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jun 10, 2026 at 05:29:59PM +0100, Daniel P. Berrangé wrote:
> -global is/was intended for devices, primarily those which
> are created by default as part of the machine. For dynamically
> created devices the docs recommend use of -device instead
> of -global.

I wished it was called -device-global then it'll be clearer, otherwise from
an API perspective it really shouldn't be limited to qdev..

It makes sense to not call it -device-global, IMHO essentially because we
don't necessarily need to restrict it to -device.

> 
> I get that -global was exposed for migration via the inappropriate
> use of TYPE_DEVICE as a parent for TYPE_MIGRATION, but I don't
> think we should be prolonging that misuse by exposing use of
> -global for things which are QOM rather than QDev.
> 
> If we want todo that for the sake of backcompat, IMHO it should
> be deprecated so it only lives for a short while after the
> conversion to QOM.
> 
> This makes me realize that this does not implement the UserCreatable
> interface on TYPE_MIGRATION, so I'm presuming the MigrationState is
> still created internally. Perhaps we should switch to making it a
> full UserCreatable, such that -object can be used to set all migration
> parameters on the command line and -global won't be required ? 

This is what Fabiano suggested in his reply here:

https://lore.kernel.org/qemu-devel/87jys75npb.fsf@suse.de/

I wonder what's your view on that when put together the singleton series I
used to post, where I also mentioned in the reply:

https://lore.kernel.org/qemu-devel/aimtYbka4GB9Qyk6@x1.local/

If you think that's the right approach, we can try to have it to replace
-global.  -global is debug API for migration, we don't need to obsolete it.
Compat property is, which is unaffected by this.  So we can remove -global
support for migration, but it'll always be good to have a replacement for
scripts.

Thanks,

-- 
Peter Xu


