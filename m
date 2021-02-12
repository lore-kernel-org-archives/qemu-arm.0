Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3232486lfc;
        Fri, 12 Feb 2021 06:10:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzec+3Uuow6S1mO3LJUL4yFopCYDxmGCZh9rJLQ2YIpyADmR9RSxEoabi4oR0R1I/ggv2dT
X-Received: by 2002:a05:6512:344a:: with SMTP id j10mr1697185lfr.317.1613139008407;
        Fri, 12 Feb 2021 06:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613139008; cv=none;
        d=google.com; s=arc-20160816;
        b=qil3PMwDAa6u3iNQSzGeqnnx12lkdpV3A1qPS/tSbPIcYZqYlXXXowJM3ktVfSu5cR
         kzSjApl8s93LT75IJvXs10pIsVbwcwYpW8zek6ZRREAaoi4de7gYB2gCoq7CMsCrLJzw
         AuR31LfCY9zRaEUvRPC3jZUelz9eKl+oOQkeYs7t+POb6YufOXm5rimmZ8l/YDYNCbHM
         0YfJBlYVP4qgFeRPsZ/8R6rZ74+rBsfuQjLkeCOfHyb0nTHbB6h2tiuDUZmRQHedn3eb
         zsomazIrYi8z7n744hferv09XZ4p3wT53EIZjakBCVKfrVgvL/FUrOyn878m51cCDoM0
         qEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FeYD/uMkY8Vy50VNvhIs85koJS7aCNVPV48SG1SCId4=;
        b=pND15Np1fTGAtfSwfFpeRmmXSll/ool/SIInScR9IrXPZFni52+DbN209Mzey0NWvb
         wKnUC1HbWbR8jZ+HT5OWm0hReGscOQZzFKQWXXkjwx+IMJ5lKPDho4eV/vk1pmc7mu1i
         M5Dn/mvFp/CcAxCqbWnPKzhYh/irC7cbf50yyx9RuHHlj0dBsOZF74baeM8rVLtwEL2v
         sd7RXCN2aPEphqq3Nj0HXtDF/4SlJ8MhYEgESChXO4rPjexMyk0ESaFEssC6T9g4BqjT
         4nXdH8ETUQJJokZqU9AoTFKukZuGTm4Bkl6GkGPLpIJupdPeAT+t2sARPwi7+R30LK8a
         Pm0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MoWWmvGo;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id w21si6133189edx.264.2021.02.12.06.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2021 06:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MoWWmvGo;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613139007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeYD/uMkY8Vy50VNvhIs85koJS7aCNVPV48SG1SCId4=;
	b=MoWWmvGoOg53ByiNF+oy5PQtl/bJw1JVO03xrUPbz2msjihoK3pmt8CGAJORcIX7qG4fwJ
	2qbvw3bUS10h5xGfYT9h0X4CYgey30exkVhGPBJ/2XbTxLqNxiM6xRyLsTV8MPUescOn3a
	Af7Hjf1GzNQdjsACVVZqnfz3OfDlhHc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-5GKE0sLROiGC1xFcbKyfCA-1; Fri, 12 Feb 2021 09:10:04 -0500
X-MC-Unique: 5GKE0sLROiGC1xFcbKyfCA-1
Received: by mail-wm1-f71.google.com with SMTP id o18so516308wmq.2
        for <alex.bennee@linaro.org>; Fri, 12 Feb 2021 06:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FeYD/uMkY8Vy50VNvhIs85koJS7aCNVPV48SG1SCId4=;
        b=aUPpvL3NJ9dCeJgiWoexQbUMnP5HA/GCS3sEAkpslN3wButLpjQ6C88T5UTKpEe/pT
         w5o5LSrBok46THJNnt2Xb0pOe9auLy1d7Fk7kpNsTmeTaHKiIWhuUL3+kor99CJH/xM7
         uhpU5MRezw6fJqacx6HShUwhvqKliLRWbmNHTPmDmwiNplu+B4P0cq+T4cr+QVCVtDCD
         VEvnx660GYj+M2jDw/FmYyTds12BJVLxzEbxv+GMG8F8No6Wmoyc25MWy5XqNDLNjZ4m
         Vf1/2IPgXXQk+Lsvg9AVdRFteapuaYoALXlU/T+/CHiroZZLq71ML8Dgs1W2XPvAZ+Y8
         ePSw==
X-Gm-Message-State: AOAM531LSbWgUI9Zc/IwNSXjGadG+qzmj05c4TUj6XU439UYsIlkXozs
	mwrEhtbsz1KrkptK0eRl+SH/ihsCLJglTCMj5f9KjZ93LA69D/dhuTmMGwpkGRPCBMzVAqYpCDZ
	naHXYvzZiwBIZW01/
X-Received: by 2002:a1c:7910:: with SMTP id l16mr2898373wme.34.1613139003718;
        Fri, 12 Feb 2021 06:10:03 -0800 (PST)
X-Received: by 2002:a1c:7910:: with SMTP id l16mr2898260wme.34.1613139002702;
        Fri, 12 Feb 2021 06:10:02 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id t30sm6755745wra.56.2021.02.12.06.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 06:10:02 -0800 (PST)
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, crosa@redhat.com, Pavel.Dovgaluk@ispras.ru,
 b.galvani@gmail.com, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
Date: Fri, 12 Feb 2021 15:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211220055.19047-1-nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ejWnBth1ardK

Hi Niek and QEMU community,

On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> The following are maintenance patches for the Allwinner H3. The first patch
> is a proposal to relocate the binary artifacts of the acceptance tests away
> from the apt.armbian.com domain. In the past we had problems with artifacts being
> removed, and now the recently added Armbian 20.08.1 image has been removed as well:
> 
> $ wget https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443... connected.
> ...
> HTTP request sent, awaiting response... 404 Not Found
> 2021-02-11 22:34:45 ERROR 404: Not Found.
> 
> I've now added the artifacts to a server maintained by me. The machine has a stable
> uptime of several years, ~100Mbit bandwidth and plenty of available storage.
> Also for other artifacts if needed. I'm open to discuss if there is a proposal
> for a better location for these artifacts or a more generic qemu location.

Thanks for trying to fix this long standing problem.

While this works in your case, this doesn't scale to the community,
as not all contributors have access to such hardware and bandwidth /
storage.

While your first patch is useful in showing where the artifacts are
stored doesn't matter - as long as we use cryptographic hashes - I
think it is a step in the wrong direction, so I am not keen on
accepting it.

My personal view is that any contributor should have the same
possibilities to add tests to the project. Now I am also open to
discuss with the others :) I might be proven wrong, and it could
be better to rely on good willing contributors rather than having
nothing useful at all.

Regards,

Phil.
