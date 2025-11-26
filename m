Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35525D11186
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Nov 2025 16:56:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOIo8-0004af-Ae; Wed, 26 Nov 2025 11:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOIo6-0004aC-Gb
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOIo4-00065m-29
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 11:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764176148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJLUpd+rJEXzrKsCKI2u5XMM3fXsKV4AkeEBKQyzh68=;
 b=LFVcaxAlPLRQf9dBF402xutp5sCZq5ye3aS2GH4UduXW5gmcI1+GvB4b3z6J2uO1EY/i2X
 MKd2XbS+kB1Q3GX/572+R8FVMJEiSEKVZYWEHRAJ0ZD4uBAG9lKkxe0dEDxbHi2UJaW38O
 J4InNH7AoItQ7pMl8n+cv+WlA97cehQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-FPMSwBjUPmGhZ_lKlPL0cA-1; Wed, 26 Nov 2025 11:55:47 -0500
X-MC-Unique: FPMSwBjUPmGhZ_lKlPL0cA-1
X-Mimecast-MFC-AGG-ID: FPMSwBjUPmGhZ_lKlPL0cA_1764176146
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4775e00b16fso43445435e9.2
 for <qemu-arm@nongnu.org>; Wed, 26 Nov 2025 08:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764176146; x=1764780946;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJLUpd+rJEXzrKsCKI2u5XMM3fXsKV4AkeEBKQyzh68=;
 b=R1CFtDxceJLrJmDnFjvqYIxkFlQFd85uHvCyq+RlwRgQfAIBXoecU8fitdSSD8UGA2
 05jPiv3VstCiLKXOsETlobiHOJ9vM2uJ8ka0im179luWwF6luDzmhbqdkYtU5kMWJcT0
 NCqDV08mRSBLG5whsf1gemh+9JSLprZcH041qvxagiNIT5piECWrE+98vcr06AKm/evz
 Nfn8takd0nGRehmR2PmvR/7DJP5WRGKHyvPOnvxoXBPurBxer0IPNAkoeCgEvfRVE9WP
 WJWBZbfjphLBX1YBarSqKhDIFjOdTEEKIv+vx4jCV/jAlJuXmvcPh0MSqTBgqLhty8hE
 8HBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCgmKZnhiK7W4emNPrqRvoZSvveDCWH9h9ETf/+NSOkdDtsne2F/R9DcEB2zQBR9EOShaoug053Q==@nongnu.org
X-Gm-Message-State: AOJu0YyI+aSZQRojl1nYgEJ0+cl0k7C+dV3jHQ2YvVXgFmZONcR/hamg
 gjPlMqwlRxPHcVyniKK7iaqVyf1GmbyMfvxbFlZPJb+IhCsM/4+X2lCit6l73UVzNZu8l1BpcnK
 bI5bkaDftTHQY894q1eMUMLqOYRC07fzLvy5J1zOthWX4OtduEffItw==
X-Gm-Gg: ASbGncv2YEfQdqWz9wwQ0A+UTgLk9UjrOGUSTc8vHrvL16iDmhZEWj/DNPlk5ytrRGM
 5Eq1Hw1R0/ONmBbvHwDMaT8Fu0LdCvynZzv/mqr5Ldc6/DIvANJk6RJVbdWF13SxmGEdDj9yDy6
 bJsch+1UguD5y3pW3h6HNDCplFfvAoDxW5T2zRP8oENf87PMFLg9NGkuqnknVmM/+qLs3tBs35v
 exOw1LLOV2EON2Dv4ntBLa96mVwFPtTjO4WPRw0RTQ5J2FcH0G0m9kFlqvbZ64tN3rQ09JyQ2Iy
 5RXDuhxJxjv4BzEcs1WThqMGsAnqhYyTZaQxBjO4251wuAFuIJWctJj0w7nzWdTxSL4x1BR7UAw
 +v5bhztP8ULZLlJwAtpvUxLrFBSOL22XTymixNPatjP6tSjZR6tpqGYmBow==
X-Received: by 2002:a05:600c:4f41:b0:477:942:7521 with SMTP id
 5b1f17b1804b1-47904ae2429mr84466385e9.14.1764176146138; 
 Wed, 26 Nov 2025 08:55:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF09IBIccivEpbmV01U+C4pbSSmmaQjR8iJhr0O/0dLP0/6/iTi6+8UUCpdI2Cv+sF9wRrZvQ==
X-Received: by 2002:a05:600c:4f41:b0:477:942:7521 with SMTP id
 5b1f17b1804b1-47904ae2429mr84466125e9.14.1764176145699; 
 Wed, 26 Nov 2025 08:55:45 -0800 (PST)
Received: from rh (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adfd181sm54145695e9.14.2025.11.26.08.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 08:55:45 -0800 (PST)
Date: Wed, 26 Nov 2025 17:55:44 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 07/11] target/arm/cpu: Implement hide_reg callback()
In-Reply-To: <20251125100859.506228-8-eric.auger@redhat.com>
Message-ID: <55899f12-4452-d788-c2e5-8716173dc515@redhat.com>
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-8-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VGXW6N1sqqVvLaJ-J4okbmJYH2QdaHU2267D9kGCw0c_1764176146
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 25 Nov 2025, Eric Auger wrote:
> Check if the register is hidden.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


