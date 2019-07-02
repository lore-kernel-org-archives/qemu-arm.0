Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3719199wru;
        Tue, 2 Jul 2019 04:53:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlpdbhRM3CtpKqlrOBAnXTrL0/XSocePGRgPNs0HRjjfWxJv+Kbok+jOHyAqHp9KPYmliV
X-Received: by 2002:ac8:2e14:: with SMTP id r20mr25237213qta.241.1562068388274;
        Tue, 02 Jul 2019 04:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562068388; cv=none;
        d=google.com; s=arc-20160816;
        b=ubxEWAmb7ugqy2Xk5jBrk8RaOQfM/t44ebWfs06KX6jyHHBqHFTpfkwhaFlTwg3bAh
         fiP/NMUSL5pA2FY6Gw31NLm5sA9usCXr8DC4WlyVA3ffITAfEwrIU1Ev12IdW7qx11De
         AKa7XkGBhN+MMQDTt8Xa+9OZjJU2bpPE8KhRrmYooXND08/p3t3g7+LnDil9DtweSvKd
         PhQKsee6Pmv6M32cTDepwV10AUvd/T778BAzywO1vNSSaeO8rSv0kKDHmYvs6QUKm/+p
         0PU7+8WkPuY+U2M30J9k4N/Rfi7UCFmKLPlqADeWXrFoGZraptbLVOBOpUjrmnI6FIHp
         WivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Tn7XgWg4vKVry5VB6Bx6WKaRDGDkrqo87/YalAh3YZo=;
        b=F4lIsHOQrsPsT1IHFplGHJeUDzdaolXJWOsmETquVmND4dpywkSC+vmPT/V04vAvpP
         V2oiDwLDT9N4v3eEVsm2Ok0/Z6sC90gj+B+kxSg48UgXPM4Nd+hWYM7YMS+Id0YyIV6/
         13c7r6qxn+pwqtvUjFQHAGNWlVohU/83Q2VT0UVJPdwhHKYijjinP+RqkEvBUGUeDUm5
         UA6i5gnY6+gZdlTre7IAoDT2PtVpCvOYD/oVuwHkIKDkye8b/G1KTvCY1ZcqfgK6yfZ5
         MoS96p8cxdACL74xIlKYVGAPwAqs2+znE+nVLSwxSe86YZRGKk9ykC09FpI2hubRfnm0
         vyhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f11si9387290qkb.182.2019.07.02.04.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9B9D307D854;
	Tue,  2 Jul 2019 11:52:39 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-172.ams2.redhat.com [10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC7E60C67;
	Tue,  2 Jul 2019 11:52:15 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 0/9] hw/block/pflash_cfi01: Add
 DeviceReset() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190702001301.4768-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0f46b807-1fcc-d5d6-9d62-601cc8dfa692@redhat.com>
Date: Tue, 2 Jul 2019 13:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 11:53:00 +0000 (UTC)
X-TUID: OGaV892S2ar/

Hi Phil,

On 07/02/19 02:12, Philippe Mathieu-Daudé wrote:
> The pflash device lacks a reset() function.
> When a machine is resetted, the flash might be in an
> inconsistent state, leading to unexpected behavior:
> https://bugzilla.redhat.com/show_bug.cgi?id=1678713
> Resolve this issue by adding a DeviceReset() handler.
> 
> Fix also two minor issues, and clean a bit the codebase.
> 
> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00962.html
> - addressed Laszlo review comments
> 
> Maintainers spam list from:
> ./scripts/get_maintainer.pl -f $(git grep -El '(pflash_cfi01_register|TYPE_PFLASH_CFI01)')
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>   hw/block/pflash_cfi01: Removed an unused timer
>   hw/block/pflash_cfi01: Use the correct READ_ARRAY value
>   hw/block/pflash_cfi01: Extract pflash_mode_read_array()
>   hw/block/pflash_cfi01: Start state machine as READY to accept commands
>   hw/block/pflash_cfi01: Add the DeviceReset() handler
>   hw/block/pflash_cfi01: Simplify CFI_QUERY processing
>   hw/block/pflash_cfi01: Improve command comments
>   hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
>   hw/block/pflash_cfi01: Hold the PRI table offset in a variable
> 
>  hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
>  hw/block/trace-events   |   1 +
>  2 files changed, 74 insertions(+), 67 deletions(-)
> 

I'll do some regression-tests with this, using OVMF and ArmVirtQemu.

I don't think I can usefully review the patches without getting lost in
the related spec(s), and I don't have capacity for that.

Until I have regression test results, one question: are the changes to
the device model transparent with regard to migration? (You are not
introducing any compat properties.)

Thanks!
Laszlo
