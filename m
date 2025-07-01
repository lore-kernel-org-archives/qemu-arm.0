Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3350138dye;
        Tue, 1 Jul 2025 11:30:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6LH0/Qd+9kpvo+IrOtJroeaJIdmDx3IUJyI7jsxtEkGCqzGIw8/p4ma6fOrJ4o6b6SlD+syrmwt/RNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFSXFm4OXrwNaxl1mNZb/Vum9DBN71LuDFmJ3e+HrvzI3zIw1wb+KS52WgYX5i8XHiZ3SG
X-Received: by 2002:a05:620a:254e:b0:7d4:5fae:ca17 with SMTP id af79cd13be357-7d5c46a5f05mr1752785a.22.1751394628362;
        Tue, 01 Jul 2025 11:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751394628; cv=none;
        d=google.com; s=arc-20240605;
        b=cXuxGCBWqLwP2pYDQC4tDdCFlS0TqkL81XDV+L2/w94mioS5M+MzKSGVUV6sUkAUeY
         tgr8odBlJhlht1kgGxxnV1U0hfsD0mwTOZV+RlvRdGwsEvfKpAcARz/VDYxsmqLQ09i+
         1iVe4yDXSbO82wjhh4LGiHbU9OPnfyf979ThYA8LbxIIH8fO+oKexyVa9B2UdXktsGWO
         /MefQCfsmd7I42AcEGfZpHT0c9AkwCl3hVgIVmqWfp5zqH/ZOWKjfZDTJB6In5ep0Fec
         QBXbvQOTJv0C+s3qqtbXo4IY01BYydr7CDvcwrY8tSXq7podCH2cACIhs52Qwivk/N0h
         fVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=WDlpmY7n6zm2AKPN2BrjPAH1sXJk2cRs0KH6HDlj+/c=;
        fh=j6iHk4AM1YLyf3OKqmaqFME8jWgLEGKdCamY6HxTIrM=;
        b=X64fBopF9Hdakki78IH+xUBya/ykSMzkGk8M5mlEFrYWgL/ZDNQEhcrQom3Kylh31M
         fdwr7u/6tNIO2E/zsvZdoub0Me2qURkEAcoVKmlXaTwdwne7dnur6+hlsB8i6rwziOb/
         xIPlbjCxMENnLnR/15Ut9yhDtN414eurCsCwIjK8YM7kT3ZiN2MPZb1xMlMljAj4cW5T
         1ppFg6L55JcOulzDxJhpfkkpqiWAaP+JSZrAvaM4NmczWCmAB0LPcwRvG+pT0GKYxU8s
         6IJpsG6eIkOI/YvnuAqfl7jGyPRqykU0Zss7QJKTwoQUnRV4CojV5bC1BluekrSlHQ6f
         soLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JkHPQnLL;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JkHPQnLL;
       dkim=neutral (no key) header.i=@nongnu.org header.b=mAJxCQA3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702af493283si3789976d6.209.2025.07.01.11.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 11:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JkHPQnLL;
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=JkHPQnLL;
       dkim=neutral (no key) header.i=@nongnu.org header.b=mAJxCQA3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWfje-0003V0-Bb; Tue, 01 Jul 2025 14:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfjc-0003UR-Ae
 for qemu-devel@nongnu.org; Tue, 01 Jul 2025 14:29:36 -0400
Received: from smtp-out2.suse.de ([195.135.223.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1uWfjX-0007VH-Rg
 for qemu-devel@nongnu.org; Tue, 01 Jul 2025 14:29:34 -0400
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A53D31F445;
 Tue,  1 Jul 2025 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDlpmY7n6zm2AKPN2BrjPAH1sXJk2cRs0KH6HDlj+/c=;
 b=JkHPQnLLVB51w+Fy79+kjYcII7myWrtp6VQnKYV9ApxhQu7g2goT2dhRJfYHpR9sl07Lwd
 1TlS3rdo3u1Jup2aEfh/MrUYTDCsm0QAWd88mrtJ5XQvXAqyYsMuLB2RMeF9WPLzX0bqAG
 llxVT6lbgnTGbBgVZbxIbiIrhf5GBTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDlpmY7n6zm2AKPN2BrjPAH1sXJk2cRs0KH6HDlj+/c=;
 b=mAJxCQA3WCe+J6fSPN9Id0/FegsgasyuQ+pYoY42Yt7bRcLBJGQ7AAZoJ2YSX8Tf4JCEuh
 6jDVDbjK/oCzsNCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751394569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDlpmY7n6zm2AKPN2BrjPAH1sXJk2cRs0KH6HDlj+/c=;
 b=JkHPQnLLVB51w+Fy79+kjYcII7myWrtp6VQnKYV9ApxhQu7g2goT2dhRJfYHpR9sl07Lwd
 1TlS3rdo3u1Jup2aEfh/MrUYTDCsm0QAWd88mrtJ5XQvXAqyYsMuLB2RMeF9WPLzX0bqAG
 llxVT6lbgnTGbBgVZbxIbiIrhf5GBTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751394569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDlpmY7n6zm2AKPN2BrjPAH1sXJk2cRs0KH6HDlj+/c=;
 b=mAJxCQA3WCe+J6fSPN9Id0/FegsgasyuQ+pYoY42Yt7bRcLBJGQ7AAZoJ2YSX8Tf4JCEuh
 6jDVDbjK/oCzsNCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DEB91364B;
 Tue,  1 Jul 2025 18:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id o51cMwgpZGjgVgAAD6G6ig
 (envelope-from <farosas@suse.de>); Tue, 01 Jul 2025 18:29:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Alex Williamson
 <alex.williamson@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Avihai Horon
 <avihaih@nvidia.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] vfio/migration: Max in-flight VFIO device state
 buffer count limit
In-Reply-To: <0e88a253e06647f6c01bdeba45848501b3631bd3.1750787338.git.maciej.szmigiero@oracle.com>
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <0e88a253e06647f6c01bdeba45848501b3631bd3.1750787338.git.maciej.szmigiero@oracle.com>
Date: Tue, 01 Jul 2025 15:29:26 -0300
Message-ID: <874ivv69yx.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email, szmigiero.name:email,
 suse.de:email, suse.de:mid, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
Received-SPF: pass client-ip=195.135.223.131; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YzBooIqlUY8T

"Maciej S. Szmigiero" <mail@maciej.szmigiero.name> writes:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>
> Allow capping the maximum count of in-flight VFIO device state buffers
> queued at the destination, otherwise a malicious QEMU source could
> theoretically cause the target QEMU to allocate unlimited amounts of memory
> for buffers-in-flight.
>
> Since this is not expected to be a realistic threat in most of VFIO live
> migration use cases and the right value depends on the particular setup
> disable the limit by default by setting it to UINT64_MAX.
>
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
