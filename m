Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1556691ejb;
        Tue, 14 Feb 2023 11:09:26 -0800 (PST)
X-Google-Smtp-Source: AK7set97/0olhEHN/VdgQNoJ/5RkhhI/o6eg4QNVcCo1CZaG4lR5aOubIAIum/Svh3xBB6HtRmf5
X-Received: by 2002:ad4:5def:0:b0:534:e0c4:226d with SMTP id jn15-20020ad45def000000b00534e0c4226dmr7683227qvb.16.1676401766435;
        Tue, 14 Feb 2023 11:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676401766; cv=none;
        d=google.com; s=arc-20160816;
        b=ErGMKG4tgx+HmjoAgyS/5ypFMFxpnGW/NQ30TiKc6jE5jG4fpfS9u4ebJsNqIXzf0L
         mKgGf1KzrEcg8sIWHN8z/caWBCiRoB0mSowLYHDHCTI5R5wRYAeIsaoRmxa0rwH0WKY6
         s6PhevOI8Gt75+L2UCvaxCMOoS0FvQHrCuRn36v1KDNrKqhmlzV+bwEVmdWzxaafw70H
         ESO9tP6JAFaa8sp4diUniOLPmMMF/+CoYj8yIbnDqvZpyoKI7Dd3FxrXye8Gsn/pq5Pb
         a2SI3N/8PMCqzvQc13KjXr1KUjtc46yQaQpymVDv4Bxkhy+YzWB4jR4Ml8GYl3a4SdTZ
         AaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=j1tf9YlItdMNvA7SRdZYLkGdvlLbUpNFYRCasPTqO70=;
        b=HwLYLB7xgYBulOBIxprm1Nxi2fbC6wr9K185M9sMsxFYzzH6qtj6pINUFsKZZ70rD7
         t6zANP/jVdqLZ1qYluZ7hJm8PZAob6DvMwTg750Hn6YdBYsr3tONbR2MEG07oy8+aZTr
         wUWIEDeFlDpRrMHc0pbpuBySqybIqPp4HvgptsUd4tnebFDK+6J4yD5qIRJdFOE5NhD6
         tKW+4d02mAfhFPb69kWWtoLkbW+owBCBKe577gY71IMr6oBnCFxB+MO76w95yXX01tJl
         biZXP5W8ruL44d/Nbva/Zz6Cs5aZj9kJX+JjIMa3clDLyPexZDVR3HO4rXCCSUzvgnq9
         Ms0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="QmXa7/c6";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519 header.b=1B3QqB9r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020a0cb296000000b0056bf9b4f42fsi12633273qve.390.2023.02.14.11.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 11:09:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="QmXa7/c6";
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519 header.b=1B3QqB9r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS0fr-0006ML-4a; Tue, 14 Feb 2023 14:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0fn-0006DB-Uw; Tue, 14 Feb 2023 14:09:03 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS0fm-00046I-EU; Tue, 14 Feb 2023 14:09:03 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 87F501F37E;
 Tue, 14 Feb 2023 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676401740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j1tf9YlItdMNvA7SRdZYLkGdvlLbUpNFYRCasPTqO70=;
 b=QmXa7/c6PTErWRHl8Ez4EtxCNKvrCP49p7x9KGg0k9QJw5sZas7Nuo+aUJNCCtxcwgSS0P
 JYd2Wad/LbRrsW8Ad8vv0NhgZOeQ8Z91m1nUhDArVMtjdQ/q0Fqvq9BzYbRsF3jla8ZR07
 fHpYJkjgxNiApTyznm82Muk66OVpSHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676401740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j1tf9YlItdMNvA7SRdZYLkGdvlLbUpNFYRCasPTqO70=;
 b=1B3QqB9rnQJQFvOcYJMvv09NUQKyDA8FKCQnVIt6mGDfefIIJwa7YGP2nR5ToXD69ulRwI
 J3pko1wtyhSeDGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03DB013A21;
 Tue, 14 Feb 2023 19:08:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nVIAMEvc62NsUQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 19:08:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 03/14] target/arm: Move arm_gen_dynamic_svereg_xml to
 gdbstub64.c
In-Reply-To: <20230214163048.903964-4-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-4-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 16:08:57 -0300
Message-ID: <87bklwkqt2.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
X-TUID: +0TwBtHxmwJ+

Richard Henderson <richard.henderson@linaro.org> writes:

> The function is only used for aarch64, so move it to the
> file that has the other aarch64 gdbstub stuff.  Move the
> declaration to internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
