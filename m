Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2507771ejb;
        Wed, 24 May 2023 05:22:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HIVcyIL9UMIZGz65iksJEWFG+Fyu/MtHZFRYpu69wdlPp3neMCdw9+YzUaBp8TVFWeOSX
X-Received: by 2002:a05:6214:c28:b0:623:a5d0:1daf with SMTP id a8-20020a0562140c2800b00623a5d01dafmr21169570qvd.48.1684930972849;
        Wed, 24 May 2023 05:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684930972; cv=none;
        d=google.com; s=arc-20160816;
        b=pDifYqwJVGIpuFbijoNwK7C6eTM8qKOeSNOcsJmqpkZd3onEeiHpb/VkvlbA0YjRan
         1cKwAmLDkcn7KXXmglHZwEecYu8FX0/PNyheIxgkNGJIW1Bj6oGZW1Qt8NVg1y9eTGm8
         VxyYvA6fMNHVq6fTb4jbqtplUDD4h8zyRMGh4STbv9yaOQGQEe5xOPrcAki6pSIKDo/p
         z1fs/G6deI05+09YdhQLTIwXlW5aGczcBqAI26o0IAMO9QROKawGq1q+a9zPOB7ng91i
         UxmxK1ABKiUBxP3nZdiO8Nuq+9VJt28AKMN3JLvWgJnk7jGjqoqmPlguVRXtrELoSZoo
         2wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=xiOBl7sAdnObz5btWWRLS418yqpGGsFltSZ1gez2DdE=;
        b=hMR5hlPw7orfXkACYIg6up9jNTCc3UHlex2c+Sqv+SU3z7/ikmEsoy2mn67lF7cKu+
         Qo7EtR0rDvbdeE+nyuN0pa41us0Y7+B26sYWO1MNJJeGf4PtPPaBFW574iAcDNk1xl0M
         omeCYSmG1eNhBsqANOVn8jLS4mhf/DKiNO5tgprAnZC61KtJiEt2HbXxkIL1fuDaz4Pg
         kvi4ZbaYUHDwa7gq2HrfBQh1Ne73SchKSz2Iv0nQv1XaDpnWaj2uzsgaWLo7gINRMpfI
         /GLBSgXinHChDhY1yhGVGXJCzlQtzkF3OJdXoLvItCBVf0SmzJy6+2DY4WDCgcA8ZEuT
         9kJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OA6s6gpS;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv9-20020a056214240900b006237f66138dsi6500029qvb.497.2023.05.24.05.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 05:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OA6s6gpS;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1nVr-0003Rk-Jw; Wed, 24 May 2023 08:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1nVq-0003RY-Ls; Wed, 24 May 2023 08:22:42 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1q1nVp-00008j-5t; Wed, 24 May 2023 08:22:42 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3C561220B7;
 Wed, 24 May 2023 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684930959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xiOBl7sAdnObz5btWWRLS418yqpGGsFltSZ1gez2DdE=;
 b=OA6s6gpSfL/3wAkuvpDn53ZUF3zTPdbjLIx19rWA4e8Y2pdIwBbBavDufrdmhGyjyvUWO5
 VQYlIwB7DhJFijRWIjnJUgACr8o7Q5jjCmKlQKWhU4a2W02bTh2KmJOUmK/S4BC8rqebHy
 kX7/N1wIPrGh5QsZ1cJ+JrQgNxb+l6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684930959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xiOBl7sAdnObz5btWWRLS418yqpGGsFltSZ1gez2DdE=;
 b=ahCLzJp9qR3zi7TsyB2mHAV6UVOPKiFuc1jsxMmAol0jhvqsYVu2Obad+EgHIG0N/Gz7+P
 6uTmMoev9op0GICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B746D13425;
 Wed, 24 May 2023 12:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZaMfH44BbmTyYwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 24 May 2023 12:22:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/qtest: Run arm-specific tests only if the
 required machine is available
In-Reply-To: <20230524080600.1618137-1-thuth@redhat.com>
References: <20230524080600.1618137-1-thuth@redhat.com>
Date: Wed, 24 May 2023 09:22:36 -0300
Message-ID: <87ilchor5f.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a9e+U2hO+pWr

Thomas Huth <thuth@redhat.com> writes:

> pflash-cfi02-test.c always uses the "musicpal" machine for testing,
> test-arm-mptimer.c always uses the "vexpress-a9" machine, and
> microbit-test.c requires the "microbit" machine, so we should only
> run these tests if the machines have been enabled in the configuration.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
