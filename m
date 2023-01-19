Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp407384ejc;
        Thu, 19 Jan 2023 07:19:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsC73UtRSajA4t/edHxWVvjHsOIVuOskWu58hyXS4xKbQ2dcyhWXccomCiHTjT7nnyahWZB
X-Received: by 2002:ac8:6049:0:b0:3b6:3040:a2fc with SMTP id k9-20020ac86049000000b003b63040a2fcmr21489374qtm.9.1674141541328;
        Thu, 19 Jan 2023 07:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674141541; cv=none;
        d=google.com; s=arc-20160816;
        b=IQXKy9TBUmsPR2gGjkQOhq0DdYwP0Bf73nylWlBNdWv+89IaGZHjSK000daWChBBfm
         r+tJ+vmA3ZIuFxcVuHlktRgjo1RwO5MP9kE4UgtdCXpf9yBm9RSlGIkYCuCkuPMrLW8T
         KDXpJ/dCqibjC0rEYIO2ovBdB7jRXE5mAEXAV0qDMXORd1zMFhMjtbtnTX5zPo25POPa
         TiMdattUiIuSqluNo9zL5wWpsp+Cr8AHiRL9o3gisMU0EjjPoUy5Iy+Jf6R7EC/kxtOU
         fK8bmDkEiG5UfD/3BVhvBFsy4YbEpmqFE8OLTWIyMAS7czmxUfI9dI6sKUHezEVZpSFP
         t64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=nyXHlJgZ1oXcHAzyxxEEvzBiVtvC/1wEsOSj5zqEiDs=;
        b=l7dX6nWpkRjinCv4IzltYI7Nno442GHcP717bjntkvjesSciXKGtWbfOE6oGtp50Dv
         X4yy3xuogjZ7aP9Q2SN22ZwWuQW01MMcw8UfXBNgksbBCbriOZN0r9DWGUyNTp9CgKkj
         jpIcfDAwalQ7XxPv2MejJ/29Zzc0EgKm1gma5rZfq1WleUSLvDA302zkHdGeCwNE2v8W
         U6stEMxuaUEbyfc4Io+/OrPVzI2yLNM/H89zLinpyD51aEbehc+QskO4RbfWtbCXDslA
         SGlbv40icBXNDPhBSLw2xmPN7q8pAWU08eRA/6xf4ea8EEAL5eEGCue1FRP12D6JYPX8
         VgOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FCo8fv7P;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020ac806ce000000b003a8266fd5c2si22084758qth.514.2023.01.19.07.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 07:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=FCo8fv7P;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWgO-0000GX-1c; Thu, 19 Jan 2023 10:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIWgM-0000GK-FG; Thu, 19 Jan 2023 10:18:26 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIWgK-00084l-OO; Thu, 19 Jan 2023 10:18:25 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A51CF3432D;
 Thu, 19 Jan 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674141501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyXHlJgZ1oXcHAzyxxEEvzBiVtvC/1wEsOSj5zqEiDs=;
 b=FCo8fv7Pu8YbKKh4uYZ8kbmVWfaaFdBbjtdEwLzmJWU5PzRyRuw3dgWHanxZw2ah3/hK6W
 9gkgYcbcKrVkjwMB26c8llhbyCLjocNYYe/KSgkQeX0OiS7nVJhlOPOxRjaI5Ggx+RamO1
 WU7mzwa2lItt7w6/BzipbQRshB7ED2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674141501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyXHlJgZ1oXcHAzyxxEEvzBiVtvC/1wEsOSj5zqEiDs=;
 b=UXL4FUDpQA4aa25DC8N02vzKcsYYnwl7noU9y54nl9OOXNRrbHJqw8q1UCq9cc8kbRT5bu
 FJUriix3tUbjQgAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C819134F5;
 Thu, 19 Jan 2023 15:18:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0kGcFTxfyWOlQgAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 15:18:20 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 04/11] tests/qtest/boot-serial-test: Only use
 available accelerators
In-Reply-To: <20230119145838.41835-5-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-5-philmd@linaro.org>
Date: Thu, 19 Jan 2023 12:18:18 -0300
Message-ID: <871qnq1rk5.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MauTqPonVPw8

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> For example, avoid when TCG is disabled:
>
>   $ make check-qtest-aarch64
>   ...
>   18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
>   qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
